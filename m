Return-Path: <SRS0=1MTx=DP=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EF02C43467
	for <intel-gfx@archiver.kernel.org>; Thu,  8 Oct 2020 10:51:09 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBD6121927
	for <intel-gfx@archiver.kernel.org>; Thu,  8 Oct 2020 10:51:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BBD6121927
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F01106E110;
	Thu,  8 Oct 2020 10:51:07 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 886A66E110
 for <intel-gfx@lists.freedesktop.org>; Thu,  8 Oct 2020 10:51:05 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from build.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 22655800-1500050 
 for multiple; Thu, 08 Oct 2020 11:50:59 +0100
From: Chris Wilson <chris@chris-wilson.co.uk>
To: intel-gfx@lists.freedesktop.org
Date: Thu,  8 Oct 2020 11:50:59 +0100
Message-Id: <20201008105059.3656-1-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH] drm/i915/gem: Poison stolen pages before use
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

When allocating objects from stolen, memset() the backing store to
POISON_INUSE (0x5a) to help identify any uninitialised use of a stolen
object.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
index 0be5e8683337..4c2869c0a802 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
@@ -572,6 +572,38 @@ static const struct drm_i915_gem_object_ops i915_gem_object_stolen_ops = {
 	.release = i915_gem_object_release_stolen,
 };
 
+static void dbg_poison(struct drm_i915_gem_object *obj)
+{
+#if IS_ENABLED(CONFIG_DRM_I915_DEBUG_GEM)
+	struct drm_i915_private *i915 = to_i915(obj->base.dev);
+	struct i915_ggtt *ggtt = &i915->ggtt;
+	struct sgt_iter iter;
+	dma_addr_t addr;
+
+	if (!drm_mm_node_allocated(&ggtt->error_capture))
+		return;
+
+	mutex_lock(&ggtt->error_mutex);
+	for_each_sgt_daddr(addr, iter, obj->mm.pages) {
+		void __iomem *s;
+
+		ggtt->vm.insert_page(&ggtt->vm, addr,
+				     ggtt->error_capture.start,
+				     I915_CACHE_NONE, 0);
+		mb();
+
+		s = io_mapping_map_wc(&ggtt->iomap,
+				      ggtt->error_capture.start,
+				      PAGE_SIZE);
+		memset(s, POISON_INUSE, PAGE_SIZE);
+		io_mapping_unmap(s);
+	}
+	mb();
+	ggtt->vm.clear_range(&ggtt->vm, ggtt->error_capture.start, PAGE_SIZE);
+	mutex_unlock(&ggtt->error_mutex);
+#endif
+}
+
 static struct drm_i915_gem_object *
 __i915_gem_object_create_stolen(struct intel_memory_region *mem,
 				struct drm_mm_node *stolen)
@@ -598,6 +630,7 @@ __i915_gem_object_create_stolen(struct intel_memory_region *mem,
 		goto cleanup;
 
 	i915_gem_object_init_memory_region(obj, mem, 0);
+	dbg_poison(obj);
 
 	return obj;
 
-- 
2.20.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
