Return-Path: <SRS0=xLvN=CV=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E0B0C433E2
	for <intel-gfx@archiver.kernel.org>; Sat, 12 Sep 2020 03:28:19 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B97CB221E7
	for <intel-gfx@archiver.kernel.org>; Sat, 12 Sep 2020 03:28:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B97CB221E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AB616E0F7;
	Sat, 12 Sep 2020 03:28:16 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E06A6E0F7
 for <Intel-gfx@lists.freedesktop.org>; Sat, 12 Sep 2020 03:28:13 +0000 (UTC)
IronPort-SDR: T6+nzexjtGuDmqOZsf2eKlpDoGG8IKJj5wyppDMUAmP3Yi9GMxgHQsnqOuIGRkHl//7f80tcOC
 foEcOL9ll1PA==
X-IronPort-AV: E=McAfee;i="6000,8403,9741"; a="220441594"
X-IronPort-AV: E=Sophos;i="5.76,418,1592895600"; d="scan'208";a="220441594"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2020 20:28:13 -0700
IronPort-SDR: lef0v+QCekDhqfdMiRck6tJidoLuDv+5TRh/0TSl6O5c3kHYFVjclcSqorlys+Cb/AcY2EI3sQ
 t4ULR7HabTfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,418,1592895600"; d="scan'208";a="408321414"
Received: from allen-box.sh.intel.com ([10.239.159.139])
 by fmsmga001.fm.intel.com with ESMTP; 11 Sep 2020 20:28:10 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>, Tom Murphy <murphyt7@tcd.ie>,
 David Woodhouse <dwmw2@infradead.org>,
 Christoph Hellwig <hch@infradead.org>
Date: Sat, 12 Sep 2020 11:21:58 +0800
Message-Id: <20200912032200.11489-5-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200912032200.11489-1-baolu.lu@linux.intel.com>
References: <20200912032200.11489-1-baolu.lu@linux.intel.com>
Subject: [Intel-gfx] [PATCH v3 4/6] iommu: Add quirk for Intel graphic
 devices in map_sg
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
Cc: Ashok Raj <ashok.raj@intel.com>, Intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Lu Baolu <baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Combining the sg segments exposes a bug in the Intel i915 driver which
causes visual artifacts and the screen to freeze. This is most likely
because of how the i915 handles the returned list. It probably doesn't
respect the returned value specifying the number of elements in the list
and instead depends on the previous behaviour of the Intel iommu driver
which would return the same number of elements in the output list as in
the input list.

Signed-off-by: Tom Murphy <murphyt7@tcd.ie>
Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 drivers/iommu/dma-iommu.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 1a1da22e5a5e..fc19f1fb9413 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -880,6 +880,33 @@ static int __finalise_sg(struct device *dev, struct scatterlist *sg, int nents,
 	unsigned int cur_len = 0, max_len = dma_get_max_seg_size(dev);
 	int i, count = 0;
 
+	/*
+	 * The Intel graphic driver is used to assume that the returned
+	 * sg list is not combound. This blocks the efforts of converting
+	 * Intel IOMMU driver to dma-iommu api's. Add this quirk to make the
+	 * device driver work and should be removed once it's fixed in i915
+	 * driver.
+	 */
+	if (IS_ENABLED(CONFIG_DRM_I915) && dev_is_pci(dev) &&
+	    to_pci_dev(dev)->vendor == PCI_VENDOR_ID_INTEL &&
+	    (to_pci_dev(dev)->class >> 16) == PCI_BASE_CLASS_DISPLAY) {
+		for_each_sg(sg, s, nents, i) {
+			unsigned int s_iova_off = sg_dma_address(s);
+			unsigned int s_length = sg_dma_len(s);
+			unsigned int s_iova_len = s->length;
+
+			s->offset += s_iova_off;
+			s->length = s_length;
+			sg_dma_address(s) = dma_addr + s_iova_off;
+			sg_dma_len(s) = s_length;
+			dma_addr += s_iova_len;
+
+			pr_info_once("sg combining disabled due to i915 driver\n");
+		}
+
+		return nents;
+	}
+
 	for_each_sg(sg, s, nents, i) {
 		/* Restore this segment's original unaligned fields first */
 		unsigned int s_iova_off = sg_dma_address(s);
-- 
2.17.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
