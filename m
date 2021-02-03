Return-Path: <SRS0=vatO=HF=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 165D4C43381
	for <intel-gfx@archiver.kernel.org>; Wed,  3 Feb 2021 14:13:30 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC26A64DF6
	for <intel-gfx@archiver.kernel.org>; Wed,  3 Feb 2021 14:13:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC26A64DF6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03FFE6EAD4;
	Wed,  3 Feb 2021 14:13:29 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB22C6EAD4
 for <intel-gfx@lists.freedesktop.org>; Wed,  3 Feb 2021 14:13:27 +0000 (UTC)
IronPort-SDR: dK/NmurqRGFmC8BV7sPpg5EULu21VD6iEeR22W49ngJ/Hk+tGY/WYjonXghZXBdSOV7urbjd6t
 ZWmsT4zN3aaw==
X-IronPort-AV: E=McAfee;i="6000,8403,9883"; a="242557023"
X-IronPort-AV: E=Sophos;i="5.79,398,1602572400"; d="scan'208";a="242557023"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2021 06:13:27 -0800
IronPort-SDR: e9GEKVAXRbYoVdC3Lj+usrjFHLt2SDfocoGH3hxCjTGPRoaB5qD+dohpOU6yl2Sxn1DrbcJi6d
 0vVY35z7NHVg==
X-IronPort-AV: E=Sophos;i="5.79,398,1602572400"; d="scan'208";a="371494234"
Received: from mcampone-mobl1.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.252.21.36])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2021 06:13:26 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Wed,  3 Feb 2021 14:13:13 +0000
Message-Id: <20210203141313.498462-3-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210203141313.498462-1-matthew.auld@intel.com>
References: <20210203141313.498462-1-matthew.auld@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v2 3/3] drm/i915/gtt/dg1: add PTE_LM plumbing
 for GGTT
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

For the PTEs we get an LM bit, to signal whether the page resides in
SMEM or LMEM.

Based on a patch from Michel Thierry.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_ggtt.c | 23 ++++++++++++++++++-----
 drivers/gpu/drm/i915/gt/intel_gtt.h  |  3 ++-
 2 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
index fc399ac16eda..3d2f417ed5a1 100644
--- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
@@ -10,6 +10,7 @@
 
 #include <drm/i915_drm.h>
 
+#include "gem/i915_gem_lmem.h"
 #include "intel_gt.h"
 #include "i915_drv.h"
 #include "i915_scatterlist.h"
@@ -189,7 +190,12 @@ static u64 gen8_ggtt_pte_encode(dma_addr_t addr,
 				enum i915_cache_level level,
 				u32 flags)
 {
-	return addr | _PAGE_PRESENT;
+	gen8_pte_t pte = addr | _PAGE_PRESENT;
+
+	if (flags & PTE_LM)
+		pte |= GEN12_GGTT_PTE_LM;
+
+	return pte;
 }
 
 static void gen8_set_pte(void __iomem *addr, gen8_pte_t pte)
@@ -201,13 +207,13 @@ static void gen8_ggtt_insert_page(struct i915_address_space *vm,
 				  dma_addr_t addr,
 				  u64 offset,
 				  enum i915_cache_level level,
-				  u32 unused)
+				  u32 flags)
 {
 	struct i915_ggtt *ggtt = i915_vm_to_ggtt(vm);
 	gen8_pte_t __iomem *pte =
 		(gen8_pte_t __iomem *)ggtt->gsm + offset / I915_GTT_PAGE_SIZE;
 
-	gen8_set_pte(pte, gen8_ggtt_pte_encode(addr, level, 0));
+	gen8_set_pte(pte, gen8_ggtt_pte_encode(addr, level, flags));
 
 	ggtt->invalidate(ggtt);
 }
@@ -217,7 +223,7 @@ static void gen8_ggtt_insert_entries(struct i915_address_space *vm,
 				     enum i915_cache_level level,
 				     u32 flags)
 {
-	const gen8_pte_t pte_encode = gen8_ggtt_pte_encode(0, level, 0);
+	const gen8_pte_t pte_encode = gen8_ggtt_pte_encode(0, level, flags);
 	struct i915_ggtt *ggtt = i915_vm_to_ggtt(vm);
 	gen8_pte_t __iomem *gte;
 	gen8_pte_t __iomem *end;
@@ -459,6 +465,8 @@ static void ggtt_bind_vma(struct i915_address_space *vm,
 	pte_flags = 0;
 	if (i915_gem_object_is_readonly(obj))
 		pte_flags |= PTE_READ_ONLY;
+	if (i915_gem_object_is_lmem(obj))
+		pte_flags |= PTE_LM;
 
 	vm->insert_entries(vm, vma, cache_level, pte_flags);
 	vma->page_sizes.gtt = I915_GTT_PAGE_SIZE;
@@ -794,6 +802,7 @@ static int ggtt_probe_common(struct i915_ggtt *ggtt, u64 size)
 	struct drm_i915_private *i915 = ggtt->vm.i915;
 	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
 	phys_addr_t phys_addr;
+	u32 pte_flags;
 	int ret;
 
 	/* For Modern GENs the PTEs and register space are split in the BAR */
@@ -823,9 +832,13 @@ static int ggtt_probe_common(struct i915_ggtt *ggtt, u64 size)
 		return ret;
 	}
 
+	pte_flags = 0;
+	if (i915_gem_object_is_lmem(ggtt->vm.scratch[0]))
+		pte_flags |= PTE_LM;
+
 	ggtt->vm.scratch[0]->encode =
 		ggtt->vm.pte_encode(px_dma(ggtt->vm.scratch[0]),
-				    I915_CACHE_NONE, 0);
+				    I915_CACHE_NONE, pte_flags);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel_gtt.h
index 4a1d9b5cc75b..55873663d37f 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.h
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
@@ -85,7 +85,8 @@ typedef u64 gen8_pte_t;
 #define BYT_PTE_SNOOPED_BY_CPU_CACHES	REG_BIT(2)
 #define BYT_PTE_WRITEABLE		REG_BIT(1)
 
-#define GEN12_PPGTT_PTE_LM (1 << 11)
+#define GEN12_GGTT_PTE_LM	(1 << 1)
+#define GEN12_PPGTT_PTE_LM	(1 << 11)
 
 /*
  * Cacheability Control is a 4-bit value. The low three bits are stored in bits
-- 
2.26.2

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
