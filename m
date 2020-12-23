Return-Path: <SRS0=gLHY=F3=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54B77C433E6
	for <intel-gfx@archiver.kernel.org>; Wed, 23 Dec 2020 11:12:34 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 175B0222F9
	for <intel-gfx@archiver.kernel.org>; Wed, 23 Dec 2020 11:12:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 175B0222F9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E20D96E929;
	Wed, 23 Dec 2020 11:12:14 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C693A6E8FF
 for <intel-gfx@lists.freedesktop.org>; Wed, 23 Dec 2020 11:12:11 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from build.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 23412189-1500050 
 for multiple; Wed, 23 Dec 2020 11:11:29 +0000
From: Chris Wilson <chris@chris-wilson.co.uk>
To: intel-gfx@lists.freedesktop.org
Date: Wed, 23 Dec 2020 11:10:37 +0000
Message-Id: <20201223111126.3338-13-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201223111126.3338-1-chris@chris-wilson.co.uk>
References: <20201223111126.3338-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 13/62] drm/i915: Drop i915_request.lock
 requirement for intel_rps_boost()
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

Since we use a flag within i915_request.flags to indicate when we have
boosted the request (so that we only apply the boost) once, this can be
used as the serialisation with i915_request_retire() to avoid having to
explicitly take the i915_request.lock which is more heavily contended.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 drivers/gpu/drm/i915/gt/intel_rps.c | 15 ++++++---------
 drivers/gpu/drm/i915/i915_request.c |  4 +---
 2 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
index f74d5e09e176..e1397b8d3586 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.c
+++ b/drivers/gpu/drm/i915/gt/intel_rps.c
@@ -917,17 +917,15 @@ void intel_rps_park(struct intel_rps *rps)
 
 void intel_rps_boost(struct i915_request *rq)
 {
-	struct intel_rps *rps = &READ_ONCE(rq->engine)->gt->rps;
-	unsigned long flags;
-
-	if (i915_request_signaled(rq) || !intel_rps_is_active(rps))
+	if (i915_request_signaled(rq) || i915_request_has_waitboost(rq))
 		return;
 
 	/* Serializes with i915_request_retire() */
-	spin_lock_irqsave(&rq->lock, flags);
-	if (!i915_request_has_waitboost(rq) &&
-	    !dma_fence_is_signaled_locked(&rq->fence)) {
-		set_bit(I915_FENCE_FLAG_BOOST, &rq->fence.flags);
+	if (!test_and_set_bit(I915_FENCE_FLAG_BOOST, &rq->fence.flags)) {
+		struct intel_rps *rps = &READ_ONCE(rq->engine)->gt->rps;
+
+		if (!intel_rps_is_active(rps))
+			return;
 
 		GT_TRACE(rps_to_gt(rps), "boost fence:%llx:%llx\n",
 			 rq->fence.context, rq->fence.seqno);
@@ -938,7 +936,6 @@ void intel_rps_boost(struct i915_request *rq)
 
 		atomic_inc(&rps->boosts);
 	}
-	spin_unlock_irqrestore(&rq->lock, flags);
 }
 
 int intel_rps_set(struct intel_rps *rps, u8 val)
diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
index 33c4f6f7024a..b5de7cf8585b 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -307,10 +307,8 @@ bool i915_request_retire(struct i915_request *rq)
 		spin_unlock_irq(&rq->lock);
 	}
 
-	if (i915_request_has_waitboost(rq)) {
-		GEM_BUG_ON(!atomic_read(&rq->engine->gt->rps.num_waiters));
+	if (test_and_set_bit(I915_FENCE_FLAG_BOOST, &rq->fence.flags))
 		atomic_dec(&rq->engine->gt->rps.num_waiters);
-	}
 
 	/*
 	 * We only loosely track inflight requests across preemption,
-- 
2.20.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
