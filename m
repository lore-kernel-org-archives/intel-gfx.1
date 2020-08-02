Return-Path: <SRS0=dOvl=BM=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23BDFC433DF
	for <intel-gfx@archiver.kernel.org>; Sun,  2 Aug 2020 11:57:02 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D333A2076B
	for <intel-gfx@archiver.kernel.org>; Sun,  2 Aug 2020 11:57:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D333A2076B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7314489FAC;
	Sun,  2 Aug 2020 11:57:01 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 200C189FAC
 for <intel-gfx@lists.freedesktop.org>; Sun,  2 Aug 2020 11:56:58 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from build.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 22008901-1500050 
 for <intel-gfx@lists.freedesktop.org>; Sun, 02 Aug 2020 12:56:55 +0100
From: Chris Wilson <chris@chris-wilson.co.uk>
To: intel-gfx@lists.freedesktop.org
Date: Sun,  2 Aug 2020 12:56:55 +0100
Message-Id: <20200802115655.25568-1-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Intel-gfx] [CI] drm/i915: Fix wrong return value
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

From: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>

In function i915_active_acquire_preallocate_barrier(), not all
paths have the return value set correctly, and in case of memory
allocation failure, a negative error code should be returned.

Cc: Chris Wilson <chris@chris-wilson.co.uk>
Signed-off-by: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 drivers/gpu/drm/i915/i915_active.c            | 7 ++-----
 drivers/gpu/drm/i915/selftests/i915_request.c | 2 +-
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_active.c b/drivers/gpu/drm/i915/i915_active.c
index 3ee5e02c3e17..b0a6522be3d1 100644
--- a/drivers/gpu/drm/i915/i915_active.c
+++ b/drivers/gpu/drm/i915/i915_active.c
@@ -889,7 +889,6 @@ int i915_active_acquire_preallocate_barrier(struct i915_active *ref,
 	intel_engine_mask_t tmp, mask = engine->mask;
 	struct llist_node *first = NULL, *last = NULL;
 	struct intel_gt *gt = engine->gt;
-	int err;
 
 	GEM_BUG_ON(i915_active_is_idle(ref));
 
@@ -914,10 +913,8 @@ int i915_active_acquire_preallocate_barrier(struct i915_active *ref,
 		rcu_read_unlock();
 		if (!node) {
 			node = kmem_cache_alloc(global.slab_cache, GFP_KERNEL);
-			if (!node) {
-				err = ENOMEM;
+			if (!node)
 				goto unwind;
-			}
 
 			RCU_INIT_POINTER(node->base.fence, NULL);
 			node->base.cb.func = node_retire;
@@ -965,7 +962,7 @@ int i915_active_acquire_preallocate_barrier(struct i915_active *ref,
 
 		kmem_cache_free(global.slab_cache, node);
 	}
-	return err;
+	return -ENOMEM;
 }
 
 void i915_active_acquire_barrier(struct i915_active *ref)
diff --git a/drivers/gpu/drm/i915/selftests/i915_request.c b/drivers/gpu/drm/i915/selftests/i915_request.c
index 57dd6f5122ee..c1dcd4b91bda 100644
--- a/drivers/gpu/drm/i915/selftests/i915_request.c
+++ b/drivers/gpu/drm/i915/selftests/i915_request.c
@@ -331,7 +331,7 @@ static int __igt_breadcrumbs_smoketest(void *arg)
 		if (!wait) {
 			i915_sw_fence_commit(submit);
 			heap_fence_put(submit);
-			err = ENOMEM;
+			err = -ENOMEM;
 			break;
 		}
 
-- 
2.20.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
