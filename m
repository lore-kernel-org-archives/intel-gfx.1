Return-Path: <SRS0=bec7=DE=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EEB2C4727F
	for <intel-gfx@archiver.kernel.org>; Sun, 27 Sep 2020 06:41:01 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FD4C221E5
	for <intel-gfx@archiver.kernel.org>; Sun, 27 Sep 2020 06:41:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0FD4C221E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AB266E0ED;
	Sun, 27 Sep 2020 06:41:00 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66EF16E0EF
 for <Intel-gfx@lists.freedesktop.org>; Sun, 27 Sep 2020 06:40:59 +0000 (UTC)
IronPort-SDR: ws6JIZ5DTwGCUI8L87pvk13wVIZOxe+8Db2Ny6zvWVbMCTyAopg1FOhRv1iB54cgNwdzFB4KIE
 ZmrYVKzipqyg==
X-IronPort-AV: E=McAfee;i="6000,8403,9756"; a="141863659"
X-IronPort-AV: E=Sophos;i="5.77,309,1596524400"; d="scan'208";a="141863659"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2020 23:40:59 -0700
IronPort-SDR: yyetCEI92Vkdd2fRiKN80N6g9H2K2NQHrZbVcqIWn0izUB6WNFRqFcmOKCQXnZIiqRk8dK+FQy
 I+xxWqijzaiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,309,1596524400"; d="scan'208";a="349457836"
Received: from allen-box.sh.intel.com ([10.239.159.139])
 by FMSMGA003.fm.intel.com with ESMTP; 26 Sep 2020 23:40:57 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>, Tom Murphy <murphyt7@tcd.ie>,
 David Woodhouse <dwmw2@infradead.org>,
 Christoph Hellwig <hch@infradead.org>
Date: Sun, 27 Sep 2020 14:34:34 +0800
Message-Id: <20200927063437.13988-5-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200927063437.13988-1-baolu.lu@linux.intel.com>
References: <20200927063437.13988-1-baolu.lu@linux.intel.com>
Subject: [Intel-gfx] [PATCH v4 4/7] iommu: Add quirk for Intel graphic
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
index 3526db774611..e7e4d758f51a 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -879,6 +879,33 @@ static int __finalise_sg(struct device *dev, struct scatterlist *sg, int nents,
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
