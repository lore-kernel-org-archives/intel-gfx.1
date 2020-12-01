Return-Path: <SRS0=1U3p=FF=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A292C64E7A
	for <intel-gfx@archiver.kernel.org>; Tue,  1 Dec 2020 23:58:59 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8D44206DF
	for <intel-gfx@archiver.kernel.org>; Tue,  1 Dec 2020 23:58:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A8D44206DF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 105E16E97B;
	Tue,  1 Dec 2020 23:58:58 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AA526E981
 for <intel-gfx@lists.freedesktop.org>; Tue,  1 Dec 2020 23:58:56 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from build.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 23183534-1500050 
 for multiple; Tue, 01 Dec 2020 23:58:48 +0000
From: Chris Wilson <chris@chris-wilson.co.uk>
To: intel-gfx@lists.freedesktop.org
Date: Tue,  1 Dec 2020 23:58:46 +0000
Message-Id: <20201201235847.1860-1-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 1/2] drm/i915/gem: Limit lmem scatterlist
 elements to UINT_MAX
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
Cc: Matthew Auld <matthew.auld@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Adhere to the i915_sg_max_segment() limit on the lengths of individual
scatterlist elements, and in doing so split up very large chunks of lmem
into managable pieces for the dma-mapping backend.

Reported-by: Venkata Sandeep Dhanalakota <venkata.s.dhanalakota@intel.com>
Suggested-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Venkata Sandeep Dhanalakota <venkata.s.dhanalakota@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_region.c | 42 ++++++++++++----------
 1 file changed, 24 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_region.c b/drivers/gpu/drm/i915/gem/i915_gem_region.c
index e72d78074c9e..edb84072f979 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_region.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_region.c
@@ -22,6 +22,7 @@ i915_gem_object_put_pages_buddy(struct drm_i915_gem_object *obj,
 int
 i915_gem_object_get_pages_buddy(struct drm_i915_gem_object *obj)
 {
+	const u64 max_segment = i915_sg_segment_size();
 	struct intel_memory_region *mem = obj->mm.region;
 	struct list_head *blocks = &obj->mm.blocks;
 	resource_size_t size = obj->base.size;
@@ -37,7 +38,7 @@ i915_gem_object_get_pages_buddy(struct drm_i915_gem_object *obj)
 	if (!st)
 		return -ENOMEM;
 
-	if (sg_alloc_table(st, size >> ilog2(mem->mm.chunk_size), GFP_KERNEL)) {
+	if (sg_alloc_table(st, size >> PAGE_SHIFT, GFP_KERNEL)) {
 		kfree(st);
 		return -ENOMEM;
 	}
@@ -58,33 +59,38 @@ i915_gem_object_get_pages_buddy(struct drm_i915_gem_object *obj)
 	prev_end = (resource_size_t)-1;
 
 	list_for_each_entry(block, blocks, link) {
-		u64 block_size, offset;
+		u64 block_size, offset, len;
 
 		block_size = min_t(u64, size,
 				   i915_buddy_block_size(&mem->mm, block));
 		offset = i915_buddy_block_offset(block);
 
-		GEM_BUG_ON(overflows_type(block_size, sg->length));
+		while (block_size) {
+			if (offset != prev_end || sg->length >= max_segment) {
+				if (st->nents) {
+					sg_page_sizes |= sg->length;
+					sg = __sg_next(sg);
+				}
 
-		if (offset != prev_end ||
-		    add_overflows_t(typeof(sg->length), sg->length, block_size)) {
-			if (st->nents) {
-				sg_page_sizes |= sg->length;
-				sg = __sg_next(sg);
-			}
+				len = min(block_size, max_segment);
 
-			sg_dma_address(sg) = mem->region.start + offset;
-			sg_dma_len(sg) = block_size;
+				sg_dma_address(sg) = mem->region.start + offset;
+				sg_dma_len(sg) = len;
 
-			sg->length = block_size;
+				sg->length = len;
 
-			st->nents++;
-		} else {
-			sg->length += block_size;
-			sg_dma_len(sg) += block_size;
-		}
+				st->nents++;
+			} else {
+				len = min(block_size, max_segment - sg->length);
+				sg->length += len;
+				sg_dma_len(sg) += len;
+			}
 
-		prev_end = offset + block_size;
+			offset += len;
+			block_size -= len;
+
+			prev_end = offset;
+		}
 	}
 
 	sg_page_sizes |= sg->length;
-- 
2.20.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
