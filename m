Return-Path: <SRS0=9DaN=HE=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEB3EC433E9
	for <intel-gfx@archiver.kernel.org>; Tue,  2 Feb 2021 15:15:05 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46B5564F5D
	for <intel-gfx@archiver.kernel.org>; Tue,  2 Feb 2021 15:15:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46B5564F5D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E9386E93F;
	Tue,  2 Feb 2021 15:14:54 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B43356E92B
 for <intel-gfx@lists.freedesktop.org>; Tue,  2 Feb 2021 15:14:52 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from build.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 23773717-1500050 
 for <intel-gfx@lists.freedesktop.org>; Tue, 02 Feb 2021 15:14:45 +0000
From: Chris Wilson <chris@chris-wilson.co.uk>
To: intel-gfx@lists.freedesktop.org
Date: Tue,  2 Feb 2021 15:14:39 +0000
Message-Id: <20210202151445.20002-8-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210202151445.20002-1-chris@chris-wilson.co.uk>
References: <20210202151445.20002-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [Intel-gfx] [CI 08/14] drm/i915/selftests: Force a rewind if at
 first we don't succeed
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

live_timeslice_rewind assumes a particular traversal and reordering
after the first timeslice yield. However, the outcome can be either
(A1, A2, B1) or (A1, B2, A2) depending on the path taken through the
dependency graph. So if we do not get the outcome we need at first, give
it a priority kick to force a rewind.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 drivers/gpu/drm/i915/gt/selftest_execlists.c | 21 +++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/selftest_execlists.c b/drivers/gpu/drm/i915/gt/selftest_execlists.c
index 951e2bf867e1..68e1398704a4 100644
--- a/drivers/gpu/drm/i915/gt/selftest_execlists.c
+++ b/drivers/gpu/drm/i915/gt/selftest_execlists.c
@@ -1107,6 +1107,7 @@ static int live_timeslice_rewind(void *arg)
 		struct i915_request *rq[3] = {};
 		struct intel_context *ce;
 		unsigned long timeslice;
+		unsigned long timeout;
 		int i, err = 0;
 		u32 *slot;
 
@@ -1173,11 +1174,29 @@ static int live_timeslice_rewind(void *arg)
 
 		/* ELSP[] = { { A:rq1, A:rq2 }, { B:rq1 } } */
 		ENGINE_TRACE(engine, "forcing tasklet for rewind\n");
-		while (i915_request_is_active(rq[A2])) { /* semaphore yield! */
+		i = 0;
+		timeout = jiffies + HZ;
+		while (i915_request_is_active(rq[A2]) &&
+		       time_before(jiffies, timeout)) { /* semaphore yield! */
 			/* Wait for the timeslice to kick in */
 			del_timer(&engine->execlists.timer);
 			tasklet_hi_schedule(&engine->execlists.tasklet);
 			intel_engine_flush_submission(engine);
+
+			/*
+			 * Unfortunately this assumes that during the
+			 * search of the wait tree it sees the requests
+			 * in a particular order. That order is not
+			 * strictly determined and it may pick either
+			 * A2 or B1 to immediately follow A1.
+			 *
+			 * Break the tie with a set-priority. This defeats
+			 * the goal of trying to cause a rewind with a
+			 * timeslice, but alas, a rewind is better than
+			 * none.
+			 */
+			if (i++)
+				i915_request_set_priority(rq[B1], 1);
 		}
 		/* -> ELSP[] = { { A:rq1 }, { B:rq1 } } */
 		GEM_BUG_ON(!i915_request_is_active(rq[A1]));
-- 
2.20.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
