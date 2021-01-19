Return-Path: <SRS0=gs28=GW=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CDD9C433E0
	for <intel-gfx@archiver.kernel.org>; Tue, 19 Jan 2021 13:31:19 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FF3820754
	for <intel-gfx@archiver.kernel.org>; Tue, 19 Jan 2021 13:31:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1FF3820754
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 949E26E243;
	Tue, 19 Jan 2021 13:31:18 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 120076E243
 for <intel-gfx@lists.freedesktop.org>; Tue, 19 Jan 2021 13:31:18 +0000 (UTC)
IronPort-SDR: Ju9jOuUUvZqyrL0IRvSiVxCHWKLvuSnC3pKKuIwQJC/HU7gGuvQBgZ1FLX0WxYDvPCXxWUWtpM
 ieCnQ5OjE81Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9868"; a="166589692"
X-IronPort-AV: E=Sophos;i="5.79,358,1602572400"; d="scan'208";a="166589692"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2021 05:31:17 -0800
IronPort-SDR: hTMHRac+gdO/MBdC6S7UI1shrzhNtDZyht3KpwH3QFtzB8UWnsCTNRZSL1sfAOU+6dkpTjMLXt
 c8qm5VcTgaXw==
X-IronPort-AV: E=Sophos;i="5.79,358,1602572400"; d="scan'208";a="383934366"
Received: from aboji-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.252.18.244])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2021 05:31:16 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue, 19 Jan 2021 13:31:04 +0000
Message-Id: <20210119133106.66294-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210119133106.66294-1-matthew.auld@intel.com>
References: <20210119133106.66294-1-matthew.auld@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 2/4] drm/i915/error: Fix object page offset
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
Cc: Chris Wilson <chris@chris-wilson.co.uk>
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
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
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
