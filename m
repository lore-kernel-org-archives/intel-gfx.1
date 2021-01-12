Return-Path: <SRS0=+Lzr=GP=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82C02C433E6
	for <intel-gfx@archiver.kernel.org>; Tue, 12 Jan 2021 10:08:07 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFD1522B30
	for <intel-gfx@archiver.kernel.org>; Tue, 12 Jan 2021 10:08:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AFD1522B30
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F26D6E1A2;
	Tue, 12 Jan 2021 10:08:06 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86FAB6E19C
 for <intel-gfx@lists.freedesktop.org>; Tue, 12 Jan 2021 10:08:03 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from build.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 23567452-1500050 
 for <intel-gfx@lists.freedesktop.org>; Tue, 12 Jan 2021 10:08:01 +0000
From: Chris Wilson <chris@chris-wilson.co.uk>
To: intel-gfx@lists.freedesktop.org
Date: Tue, 12 Jan 2021 10:07:59 +0000
Message-Id: <20210112100759.32698-2-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210112100759.32698-1-chris@chris-wilson.co.uk>
References: <20210112100759.32698-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [Intel-gfx] [CI 2/2] drm/i915/gt: Perform an arbitration check
 before busywaiting
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

During igt_reset_nop_engine, it was observed that an unexpected failed
engine reset lead to us busywaiting on the stop-ring semaphore (set
during the reset preparations) on the first request afterwards. There was
no explicit MI_ARB_CHECK in this sequence as the presumption was that
the failed MI_SEMAPHORE_WAIT would itself act as an arbitration point.
It did not in this circumstance, so force it.

This patch is based on the assumption that the MI_SEMAPHORE_WAIT failure
to arbitrate is a rare Tigerlake bug, similar to the lite-restore vs
semaphore issues previously seen in the CS. The explicit MI_ARB_CHECK
should always ensure that there is at least one arbitration point in the
request before the MI_SEMAPHORE_WAIT to trigger the IDLE->ACTIVE event.
Upon processing that event, we will clear the stop-ring flag and release
the semaphore from its busywait.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
index 1ed9f572c8a4..8066b93e6dc4 100644
--- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
@@ -578,6 +578,7 @@ u32 *gen11_emit_fini_breadcrumb_rcs(struct i915_request *rq, u32 *cs)
 
 static u32 *gen12_emit_preempt_busywait(struct i915_request *rq, u32 *cs)
 {
+	*cs++ = MI_ARB_CHECK; /* trigger IDLE->ACTIVE first */
 	*cs++ = MI_SEMAPHORE_WAIT_TOKEN |
 		MI_SEMAPHORE_GLOBAL_GTT |
 		MI_SEMAPHORE_POLL |
@@ -586,7 +587,6 @@ static u32 *gen12_emit_preempt_busywait(struct i915_request *rq, u32 *cs)
 	*cs++ = preempt_address(rq->engine);
 	*cs++ = 0;
 	*cs++ = 0;
-	*cs++ = MI_NOOP;
 
 	return cs;
 }
-- 
2.20.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
