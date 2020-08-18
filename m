Return-Path: <SRS0=x/xo=B4=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4427CC433E1
	for <intel-gfx@archiver.kernel.org>; Tue, 18 Aug 2020 18:43:25 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C19B2075E
	for <intel-gfx@archiver.kernel.org>; Tue, 18 Aug 2020 18:43:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C19B2075E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92ABF89A86;
	Tue, 18 Aug 2020 18:43:23 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A192B89A86
 for <intel-gfx@lists.freedesktop.org>; Tue, 18 Aug 2020 18:43:20 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from build.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 22166563-1500050 
 for multiple; Tue, 18 Aug 2020 19:43:10 +0100
From: Chris Wilson <chris@chris-wilson.co.uk>
To: intel-gfx@lists.freedesktop.org
Date: Tue, 18 Aug 2020 19:43:12 +0100
Message-Id: <20200818184312.24299-1-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH] drm/i915/selftests: Push the fake iommu device
 from the stack to data
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

Since we store a pointer to the fake iommu device that is allocated on
the stack, as soon as we leave the function it goes out of scope and any
future dereference is undefined behaviour. Just in case we may need to
look at the fake iommu device after initialiation, move the allocation
from the stack into the data.

Fixes: 01b9d4e21148 ("iommu/vt-d: Use dev_iommu_priv_get/set()")
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 drivers/gpu/drm/i915/selftests/mock_gem_device.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/selftests/mock_gem_device.c b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
index f127e633f7ca..397c313a8b69 100644
--- a/drivers/gpu/drm/i915/selftests/mock_gem_device.c
+++ b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
@@ -118,11 +118,11 @@ static struct dev_pm_domain pm_domain = {
 
 struct drm_i915_private *mock_gem_device(void)
 {
-	struct drm_i915_private *i915;
-	struct pci_dev *pdev;
 #if IS_ENABLED(CONFIG_IOMMU_API) && defined(CONFIG_INTEL_IOMMU)
-	struct dev_iommu iommu;
+	static struct dev_iommu fake_iommu = { .priv = (void *)-1 };
 #endif
+	struct drm_i915_private *i915;
+	struct pci_dev *pdev;
 	int err;
 
 	pdev = kzalloc(sizeof(*pdev), GFP_KERNEL);
@@ -141,10 +141,8 @@ struct drm_i915_private *mock_gem_device(void)
 	dma_coerce_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
 
 #if IS_ENABLED(CONFIG_IOMMU_API) && defined(CONFIG_INTEL_IOMMU)
-	/* HACK HACK HACK to disable iommu for the fake device; force identity mapping */
-	memset(&iommu, 0, sizeof(iommu));
-	iommu.priv = (void *)-1;
-	pdev->dev.iommu = &iommu;
+	/* HACK to disable iommu for the fake device; force identity mapping */
+	pdev->dev.iommu = &fake_iommu;
 #endif
 
 	pci_set_drvdata(pdev, i915);
-- 
2.20.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
