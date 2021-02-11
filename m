Return-Path: <SRS0=TgQB=HN=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C50CC433DB
	for <intel-gfx@archiver.kernel.org>; Thu, 11 Feb 2021 11:24:22 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD14D64DCD
	for <intel-gfx@archiver.kernel.org>; Thu, 11 Feb 2021 11:24:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD14D64DCD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F0A56EE03;
	Thu, 11 Feb 2021 11:24:21 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E7C46EE03
 for <intel-gfx@lists.freedesktop.org>; Thu, 11 Feb 2021 11:24:19 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.69.177; 
Received: from build.alporthouse.com (unverified [78.156.69.177]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 23837184-1500050 
 for multiple; Thu, 11 Feb 2021 11:24:05 +0000
From: Chris Wilson <chris@chris-wilson.co.uk>
To: intel-gfx@lists.freedesktop.org
Date: Thu, 11 Feb 2021 11:24:03 +0000
Message-Id: <20210211112403.7891-1-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH] drm/i915: Defer object allocation from GGTT
 probe to GGTT init
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

Rather than try and allocate objects as we perform our early HW probes,
defer the allocation for GGTT objects (such as the scratch page) to later
in the initialisation.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_ggtt.c | 38 +++++++++++-----------------
 1 file changed, 15 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
index b0b8ded834f0..23c7eb462b2f 100644
--- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
@@ -78,19 +78,29 @@ static int ggtt_init_hw(struct i915_ggtt *ggtt)
  */
 int i915_ggtt_init_hw(struct drm_i915_private *i915)
 {
+	struct i915_ggtt *ggtt = &i915->ggtt;
+	u32 pte_flags;
 	int ret;
 
+	ret = setup_scratch_page(&ggtt->vm);
+	if (ret)
+		return ret;
+
+	pte_flags = 0;
+	if (i915_gem_object_is_lmem(ggtt->vm.scratch[0]))
+		pte_flags |= PTE_LM;
+
+	ggtt->vm.scratch[0]->encode =
+		ggtt->vm.pte_encode(px_dma(ggtt->vm.scratch[0]),
+				    I915_CACHE_NONE, 0);
+
 	/*
 	 * Note that we use page colouring to enforce a guard page at the
 	 * end of the address space. This is required as the CS may prefetch
 	 * beyond the end of the batch buffer, across the page boundary,
 	 * and beyond the end of the GTT if we do not provide a guard.
 	 */
-	ret = ggtt_init_hw(&i915->ggtt);
-	if (ret)
-		return ret;
-
-	return 0;
+	return ggtt_init_hw(ggtt);
 }
 
 /*
@@ -803,8 +813,6 @@ static int ggtt_probe_common(struct i915_ggtt *ggtt, u64 size)
 	struct drm_i915_private *i915 = ggtt->vm.i915;
 	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
 	phys_addr_t phys_addr;
-	u32 pte_flags;
-	int ret;
 
 	/* For Modern GENs the PTEs and register space are split in the BAR */
 	phys_addr = pci_resource_start(pdev, 0) + pci_resource_len(pdev, 0) / 2;
@@ -825,22 +833,6 @@ static int ggtt_probe_common(struct i915_ggtt *ggtt, u64 size)
 		return -ENOMEM;
 	}
 
-	ret = setup_scratch_page(&ggtt->vm);
-	if (ret) {
-		drm_err(&i915->drm, "Scratch setup failed\n");
-		/* iounmap will also get called at remove, but meh */
-		iounmap(ggtt->gsm);
-		return ret;
-	}
-
-	pte_flags = 0;
-	if (i915_gem_object_is_lmem(ggtt->vm.scratch[0]))
-		pte_flags |= PTE_LM;
-
-	ggtt->vm.scratch[0]->encode =
-		ggtt->vm.pte_encode(px_dma(ggtt->vm.scratch[0]),
-				    I915_CACHE_NONE, pte_flags);
-
 	return 0;
 }
 
-- 
2.20.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
