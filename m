Return-Path: <SRS0=QT0F=GV=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D042BC433E0
	for <intel-gfx@archiver.kernel.org>; Mon, 18 Jan 2021 14:17:56 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80C0122B39
	for <intel-gfx@archiver.kernel.org>; Mon, 18 Jan 2021 14:17:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 80C0122B39
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A68C46E2D8;
	Mon, 18 Jan 2021 14:17:51 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 222726E28B
 for <intel-gfx@lists.freedesktop.org>; Mon, 18 Jan 2021 14:17:50 +0000 (UTC)
IronPort-SDR: 7sHITc93MENwrogkhzLhcJTFbJm1R2gUknkzDHEN/708l9k7rudaENgw2tjvzIfMF/IV98D3Wv
 v712/JNypaEA==
X-IronPort-AV: E=McAfee;i="6000,8403,9867"; a="197504696"
X-IronPort-AV: E=Sophos;i="5.79,356,1602572400"; d="scan'208";a="197504696"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2021 06:17:48 -0800
IronPort-SDR: vat4LQLNzCiPWFmNS0SdEVAQ+l+KUFxOokvV2V+BRlaIMxOzw2cRg2iw5+vlscBw3REMNLGs0B
 Jn5FlD3Fcefg==
X-IronPort-AV: E=Sophos;i="5.79,356,1602572400"; d="scan'208";a="466380937"
Received: from juimonen-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.252.9.5])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2021 06:17:47 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Mon, 18 Jan 2021 14:17:32 +0000
Message-Id: <20210118141732.90173-3-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210118141732.90173-1-matthew.auld@intel.com>
References: <20210118141732.90173-1-matthew.auld@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 3/3] drm/i915/error: Fix object page offset
 within a region
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

From: CQ Tang <cq.tang@intel.com>

io_mapping_map_wc() expects the offset to be relative to the iomapping
base address. Currently we just pass in the physical address for the
page which only works if the region.start starts at zero.

Signed-off-by: CQ Tang <cq.tang@intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/i915/i915_gpu_error.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
index 8b163ee1b86d..f962693404b7 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.c
+++ b/drivers/gpu/drm/i915/i915_gpu_error.c
@@ -1051,7 +1051,9 @@ i915_vma_coredump_create(const struct intel_gt *gt,
 		for_each_sgt_daddr(dma, iter, vma->pages) {
 			void __iomem *s;
 
-			s = io_mapping_map_wc(&mem->iomap, dma, PAGE_SIZE);
+			s = io_mapping_map_wc(&mem->iomap,
+					      dma - mem->region.start,
+					      PAGE_SIZE);
 			ret = compress_page(compress,
 					    (void __force *)s, dst,
 					    true);
-- 
2.26.2

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
