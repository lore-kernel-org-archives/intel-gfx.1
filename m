Return-Path: <SRS0=Ssd4=GU=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB7BCC433E0
	for <intel-gfx@archiver.kernel.org>; Sun, 17 Jan 2021 11:04:34 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F03BE227BF
	for <intel-gfx@archiver.kernel.org>; Sun, 17 Jan 2021 11:04:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F03BE227BF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C46B89F49;
	Sun, 17 Jan 2021 11:04:33 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F6B389F49
 for <intel-gfx@lists.freedesktop.org>; Sun, 17 Jan 2021 11:04:31 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from build.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 23620485-1500050 
 for multiple; Sun, 17 Jan 2021 11:04:19 +0000
From: Chris Wilson <chris@chris-wilson.co.uk>
To: intel-gfx@lists.freedesktop.org
Date: Sun, 17 Jan 2021 11:04:18 +0000
Message-Id: <20210117110418.3361-1-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH] drm/i915/gt: Add arbitration check before
 semaphore wait
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
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Similar to commit 49b20dbf7497 ("drm/i915/gt: Perform an arbitration
check before busywaiting"), also add a check prior to the busywait
on gen8+, as we have now seen (because we added a selftest to add fault
injection into the engine resets) the same engine reset failure leading
to an indefinite wait on the ring-stop semaphore. So not a Tigerlake
specific bug after all, though it still seems odd behaviour for the
busywait as we do get the arbitration point elsewhere on a miss.

Testcase: igt_reset_fail_engine
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
index 5b932d2dbfd3..07ba524da90b 100644
--- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
@@ -488,6 +488,7 @@ static u32 *gen8_emit_wa_tail(struct i915_request *rq, u32 *cs)
 
 static u32 *emit_preempt_busywait(struct i915_request *rq, u32 *cs)
 {
+	*cs++ = MI_ARB_CHECK; /* trigger IDLE->ACTIVE first */
 	*cs++ = MI_SEMAPHORE_WAIT |
 		MI_SEMAPHORE_GLOBAL_GTT |
 		MI_SEMAPHORE_POLL |
@@ -495,6 +496,7 @@ static u32 *emit_preempt_busywait(struct i915_request *rq, u32 *cs)
 	*cs++ = 0;
 	*cs++ = preempt_address(rq->engine);
 	*cs++ = 0;
+	*cs++ = MI_NOOP;
 
 	return cs;
 }
-- 
2.20.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
