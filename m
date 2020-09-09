Return-Path: <SRS0=DO2q=CS=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66F53C433E2
	for <intel-gfx@archiver.kernel.org>; Wed,  9 Sep 2020 12:45:13 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1946121941
	for <intel-gfx@archiver.kernel.org>; Wed,  9 Sep 2020 12:45:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1946121941
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 960FF6E045;
	Wed,  9 Sep 2020 12:45:12 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 287F46E045
 for <Intel-gfx@lists.freedesktop.org>; Wed,  9 Sep 2020 12:45:11 +0000 (UTC)
IronPort-SDR: zHLaI+ydQp2p8wSmCKh1c4gGMFKxz/3EuEMO7vCDQAuV+tcnS1pkYBdmy6OPW1rYl4XH/Vten8
 Djn84u87GszA==
X-IronPort-AV: E=McAfee;i="6000,8403,9738"; a="219877595"
X-IronPort-AV: E=Sophos;i="5.76,409,1592895600"; d="scan'208";a="219877595"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2020 05:45:10 -0700
IronPort-SDR: W1kAJEosxG9d/sP6HfRFjrAb0Aa5p5vLbmQqTNZhCYnFrXHecl4sn7Nm4WGwT6Uv+QG/s5bJAr
 W/T6QUbwpZUg==
X-IronPort-AV: E=Sophos;i="5.76,409,1592895600"; d="scan'208";a="480448988"
Received: from vdc-station-04.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.251.165.91])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2020 05:45:06 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Date: Wed,  9 Sep 2020 13:44:57 +0100
Message-Id: <20200909124457.296845-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH] drm/i915: Fix DMA mapped scatterlist walks
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
Cc: Tom Murphy <murphyt7@tcd.ie>, Chris Wilson <chris@chris-wilson.co.uk>,
 Matthew Auld <matthew.auld@intel.com>, Logan Gunthorpe <logang@deltatee.com>,
 Lu Baolu <baolu.lu@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

When walking DMA mapped scatterlists sg_dma_len has to be used since it
can be different (coalesced) from the backing store entry.

This also means we have to end the walk when encountering a zero length
DMA entry and cannot rely on the normal sg list end marker.

Both issues were there in theory for some time but were hidden by the fact
Intel IOMMU driver was never coalescing entries. As there are ongoing
efforts to change this we need to start handling it.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
References: 85d1225ec066 ("drm/i915: Introduce & use new lightweight SGL iterators")
References: b31144c0daa8 ("drm/i915: Micro-optimise gen6_ppgtt_insert_entries()")
Reported-by: Tom Murphy <murphyt7@tcd.ie>
Suggested-by: Tom Murphy <murphyt7@tcd.ie> # __sgt_iter
Suggested-by: Logan Gunthorpe <logang@deltatee.com> # __sgt_iter
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Lu Baolu <baolu.lu@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/gen6_ppgtt.c    |  6 +++---
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c    | 17 ++++++++++-------
 drivers/gpu/drm/i915/gt/intel_gtt.h     |  2 +-
 drivers/gpu/drm/i915/i915_scatterlist.h | 12 ++++++++----
 4 files changed, 22 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/gen6_ppgtt.c b/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
index fd0d24d28763..c0d17f87b00f 100644
--- a/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
+++ b/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
@@ -131,17 +131,17 @@ static void gen6_ppgtt_insert_entries(struct i915_address_space *vm,
 
 	vaddr = kmap_atomic_px(i915_pt_entry(pd, act_pt));
 	do {
-		GEM_BUG_ON(iter.sg->length < I915_GTT_PAGE_SIZE);
+		GEM_BUG_ON(sg_dma_len(iter.sg) < I915_GTT_PAGE_SIZE);
 		vaddr[act_pte] = pte_encode | GEN6_PTE_ADDR_ENCODE(iter.dma);
 
 		iter.dma += I915_GTT_PAGE_SIZE;
 		if (iter.dma == iter.max) {
 			iter.sg = __sg_next(iter.sg);
-			if (!iter.sg)
+			if (!iter.sg || sg_dma_len(iter.sg) == 0)
 				break;
 
 			iter.dma = sg_dma_address(iter.sg);
-			iter.max = iter.dma + iter.sg->length;
+			iter.max = iter.dma + sg_dma_len(iter.sg);
 		}
 
 		if (++act_pte == GEN6_PTES) {
diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
index eb64f474a78c..0361b3dfdc72 100644
--- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
+++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
@@ -372,19 +372,19 @@ gen8_ppgtt_insert_pte(struct i915_ppgtt *ppgtt,
 	pd = i915_pd_entry(pdp, gen8_pd_index(idx, 2));
 	vaddr = kmap_atomic_px(i915_pt_entry(pd, gen8_pd_index(idx, 1)));
 	do {
-		GEM_BUG_ON(iter->sg->length < I915_GTT_PAGE_SIZE);
+		GEM_BUG_ON(sg_dma_len(iter->sg) < I915_GTT_PAGE_SIZE);
 		vaddr[gen8_pd_index(idx, 0)] = pte_encode | iter->dma;
 
 		iter->dma += I915_GTT_PAGE_SIZE;
 		if (iter->dma >= iter->max) {
 			iter->sg = __sg_next(iter->sg);
-			if (!iter->sg) {
+			if (!iter->sg || sg_dma_len(iter->sg) == 0) {
 				idx = 0;
 				break;
 			}
 
 			iter->dma = sg_dma_address(iter->sg);
-			iter->max = iter->dma + iter->sg->length;
+			iter->max = iter->dma + sg_dma_len(iter->sg);
 		}
 
 		if (gen8_pd_index(++idx, 0) == 0) {
@@ -414,7 +414,7 @@ static void gen8_ppgtt_insert_huge(struct i915_vma *vma,
 {
 	const gen8_pte_t pte_encode = gen8_pte_encode(0, cache_level, flags);
 	u64 start = vma->node.start;
-	dma_addr_t rem = iter->sg->length;
+	dma_addr_t rem = sg_dma_len(iter->sg);
 
 	GEM_BUG_ON(!i915_vm_is_4lvl(vma->vm));
 
@@ -456,7 +456,7 @@ static void gen8_ppgtt_insert_huge(struct i915_vma *vma,
 		}
 
 		do {
-			GEM_BUG_ON(iter->sg->length < page_size);
+			GEM_BUG_ON(sg_dma_len(iter->sg) < page_size);
 			vaddr[index++] = encode | iter->dma;
 
 			start += page_size;
@@ -467,7 +467,10 @@ static void gen8_ppgtt_insert_huge(struct i915_vma *vma,
 				if (!iter->sg)
 					break;
 
-				rem = iter->sg->length;
+				rem = sg_dma_len(iter->sg);
+				if (!rem)
+					break;
+
 				iter->dma = sg_dma_address(iter->sg);
 				iter->max = iter->dma + rem;
 
@@ -525,7 +528,7 @@ static void gen8_ppgtt_insert_huge(struct i915_vma *vma,
 		}
 
 		vma->page_sizes.gtt |= page_size;
-	} while (iter->sg);
+	} while (iter->sg && sg_dma_len(iter->sg));
 }
 
 static void gen8_ppgtt_insert(struct i915_address_space *vm,
diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel_gtt.h
index c13c650ced22..8a33940a71f3 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.h
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
@@ -580,7 +580,7 @@ static inline struct sgt_dma {
 	struct scatterlist *sg = vma->pages->sgl;
 	dma_addr_t addr = sg_dma_address(sg);
 
-	return (struct sgt_dma){ sg, addr, addr + sg->length };
+	return (struct sgt_dma){ sg, addr, addr + sg_dma_len(sg) };
 }
 
 #endif
diff --git a/drivers/gpu/drm/i915/i915_scatterlist.h b/drivers/gpu/drm/i915/i915_scatterlist.h
index b7b59328cb76..510856887628 100644
--- a/drivers/gpu/drm/i915/i915_scatterlist.h
+++ b/drivers/gpu/drm/i915/i915_scatterlist.h
@@ -27,13 +27,17 @@ static __always_inline struct sgt_iter {
 } __sgt_iter(struct scatterlist *sgl, bool dma) {
 	struct sgt_iter s = { .sgp = sgl };
 
-	if (s.sgp) {
+	if (dma && s.sgp && sg_dma_len(s.sgp) == 0) {
+		s.sgp = NULL;
+	} else if (s.sgp) {
 		s.max = s.curr = s.sgp->offset;
-		s.max += s.sgp->length;
-		if (dma)
+		if (dma) {
 			s.dma = sg_dma_address(s.sgp);
-		else
+			s.max += sg_dma_len(s.sgp);
+		} else {
 			s.pfn = page_to_pfn(sg_page(s.sgp));
+			s.max += s.sgp->length;
+		}
 	}
 
 	return s;
-- 
2.25.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
