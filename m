Return-Path: <SRS0=LtMi=FS=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDB94C1B0D8
	for <intel-gfx@archiver.kernel.org>; Mon, 14 Dec 2020 10:10:17 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81775229F0
	for <intel-gfx@archiver.kernel.org>; Mon, 14 Dec 2020 10:10:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 81775229F0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2FE96E213;
	Mon, 14 Dec 2020 10:10:06 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 515B26E161
 for <intel-gfx@lists.freedesktop.org>; Mon, 14 Dec 2020 10:10:01 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from build.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 23317843-1500050 
 for multiple; Mon, 14 Dec 2020 10:09:58 +0000
From: Chris Wilson <chris@chris-wilson.co.uk>
To: intel-gfx@lists.freedesktop.org
Date: Mon, 14 Dec 2020 10:09:34 +0000
Message-Id: <20201214100949.11387-54-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201214100949.11387-1-chris@chris-wilson.co.uk>
References: <20201214100949.11387-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 54/69] drm/i915: Extend the priority boosting
 for the display with a deadline
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

For a modeset/pageflip, there is a very precise deadline by which the
frame must be completed in order to hit the vblank and be shown. While
we don't pass along that exact information, we can at least inform the
scheduler that this request-chain needs to be completed asap.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 drivers/gpu/drm/i915/display/intel_display.c |  4 +++-
 drivers/gpu/drm/i915/gem/i915_gem_object.h   |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_wait.c     | 21 +++++++++++---------
 3 files changed, 16 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 04d73ad3e916..20419294f4e2 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -16735,7 +16735,9 @@ intel_prepare_plane_fb(struct drm_plane *_plane,
 	if (ret)
 		return ret;
 
-	i915_gem_object_wait_priority(obj, 0, I915_PRIORITY_DISPLAY);
+	i915_gem_object_wait_priority(obj, 0,
+				      I915_PRIORITY_DISPLAY,
+				      ktime_get() /* next vblank? */);
 	i915_gem_object_flush_frontbuffer(obj, ORIGIN_DIRTYFB);
 
 	if (!new_plane_state->uapi.fence) { /* implicit fencing */
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
index b106bc81c303..88b849c6f49d 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -517,7 +517,7 @@ int i915_gem_object_wait(struct drm_i915_gem_object *obj,
 			 long timeout);
 int i915_gem_object_wait_priority(struct drm_i915_gem_object *obj,
 				  unsigned int flags,
-				  int prio);
+				  int prio, ktime_t deadline);
 
 void __i915_gem_object_flush_frontbuffer(struct drm_i915_gem_object *obj,
 					 enum fb_op_origin origin);
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_wait.c b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
index a5d7efe67021..b8b91a7564cf 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_wait.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
@@ -44,8 +44,7 @@ i915_gem_object_wait_reservation(struct dma_resv *resv,
 		unsigned int count, i;
 		int ret;
 
-		ret = dma_resv_get_fences_rcu(resv,
-							&excl, &count, &shared);
+		ret = dma_resv_get_fences_rcu(resv, &excl, &count, &shared);
 		if (ret)
 			return ret;
 
@@ -91,17 +90,20 @@ i915_gem_object_wait_reservation(struct dma_resv *resv,
 	return timeout;
 }
 
-static void __fence_set_priority(struct dma_fence *fence, int prio)
+static void
+__fence_set_prio(struct dma_fence *fence, int prio, ktime_t deadline)
 {
 	if (dma_fence_is_signaled(fence) || !dma_fence_is_i915(fence))
 		return;
 
 	local_bh_disable();
+	i915_request_set_deadline(to_request(fence),
+				  i915_sched_to_ticks(deadline));
 	i915_request_set_priority(to_request(fence), prio);
 	local_bh_enable(); /* kick the tasklets if queues were reprioritised */
 }
 
-static void fence_set_priority(struct dma_fence *fence, int prio)
+static void fence_set_prio(struct dma_fence *fence, int prio, ktime_t deadline)
 {
 	/* Recurse once into a fence-array */
 	if (dma_fence_is_array(fence)) {
@@ -109,16 +111,17 @@ static void fence_set_priority(struct dma_fence *fence, int prio)
 		int i;
 
 		for (i = 0; i < array->num_fences; i++)
-			__fence_set_priority(array->fences[i], prio);
+			__fence_set_prio(array->fences[i], prio, deadline);
 	} else {
-		__fence_set_priority(fence, prio);
+		__fence_set_prio(fence, prio, deadline);
 	}
 }
 
 int
 i915_gem_object_wait_priority(struct drm_i915_gem_object *obj,
 			      unsigned int flags,
-			      int prio)
+			      int prio,
+			      ktime_t deadline)
 {
 	struct dma_fence *excl;
 
@@ -133,7 +136,7 @@ i915_gem_object_wait_priority(struct drm_i915_gem_object *obj,
 			return ret;
 
 		for (i = 0; i < count; i++) {
-			fence_set_priority(shared[i], prio);
+			fence_set_prio(shared[i], prio, deadline);
 			dma_fence_put(shared[i]);
 		}
 
@@ -143,7 +146,7 @@ i915_gem_object_wait_priority(struct drm_i915_gem_object *obj,
 	}
 
 	if (excl) {
-		fence_set_priority(excl, prio);
+		fence_set_prio(excl, prio, deadline);
 		dma_fence_put(excl);
 	}
 	return 0;
-- 
2.20.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
