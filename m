Return-Path: <SRS0=vphl=FW=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2C01C2BBD5
	for <intel-gfx@archiver.kernel.org>; Fri, 18 Dec 2020 18:45:31 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96CD123B01
	for <intel-gfx@archiver.kernel.org>; Fri, 18 Dec 2020 18:45:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96CD123B01
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4872289B9F;
	Fri, 18 Dec 2020 18:45:29 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A96C898C0
 for <Intel-gfx@lists.freedesktop.org>; Fri, 18 Dec 2020 18:45:28 +0000 (UTC)
IronPort-SDR: DqBh9hgDV9v4geIW2gcS5GhuFdqrZ6IGSn6wEpRitnj2NUmr1bKGJpphi1vEwCB5H/t7vFUWqH
 aD3eA4z4qv/A==
X-IronPort-AV: E=McAfee;i="6000,8403,9839"; a="193894747"
X-IronPort-AV: E=Sophos;i="5.78,431,1599548400"; d="scan'208";a="193894747"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2020 10:45:20 -0800
IronPort-SDR: B4gKC372kSUsfTF2CKd6NGdNyRlWj2BhBJNhMwF2NPD1VsY2FEeLxD+ljevMSEiMZH2ByMaBHs
 C/gMvtvJmHGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,431,1599548400"; d="scan'208";a="340645781"
Received: from sean-virtualbox.fm.intel.com ([10.105.158.96])
 by fmsmga008.fm.intel.com with ESMTP; 18 Dec 2020 10:45:20 -0800
From: "Huang, Sean Z" <sean.z.huang@intel.com>
To: Intel-gfx@lists.freedesktop.org
Date: Fri, 18 Dec 2020 10:45:09 -0800
Message-Id: <20201218184520.8697-3-sean.z.huang@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201218184520.8697-1-sean.z.huang@intel.com>
References: <20201218184520.8697-1-sean.z.huang@intel.com>
Subject: [Intel-gfx] [RFC-v13 02/13] drm/i915/pxp: set KCR reg init during
 the boot time
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Set the KCR init during the boot time, which is
required by hardware, to allow us doing further
protection operation such as sending commands to
GPU or TEE.

Signed-off-by: Huang, Sean Z <sean.z.huang@intel.com>
---
 drivers/gpu/drm/i915/pxp/intel_pxp.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.c b/drivers/gpu/drm/i915/pxp/intel_pxp.c
index 1e757efb7f5f..cf22006222ce 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp.c
@@ -6,6 +6,12 @@
 #include "intel_pxp.h"
 #include "intel_pxp_context.h"
 
+/* KCR register definitions */
+#define KCR_INIT            _MMIO(0x320f0)
+#define KCR_INIT_MASK_SHIFT (16)
+/* Setting KCR Init bit is required after system boot */
+#define KCR_INIT_ALLOW_DISPLAY_ME_WRITES (BIT(14) | (BIT(14) << KCR_INIT_MASK_SHIFT))
+
 void intel_pxp_init(struct intel_pxp *pxp)
 {
 	struct intel_gt *gt = container_of(pxp, struct intel_gt, pxp);
@@ -15,6 +21,8 @@ void intel_pxp_init(struct intel_pxp *pxp)
 
 	intel_pxp_ctx_init(&pxp->ctx);
 
+	intel_uncore_write(gt->uncore, KCR_INIT, KCR_INIT_ALLOW_DISPLAY_ME_WRITES);
+
 	drm_info(&gt->i915->drm, "Protected Xe Path (PXP) protected content support initialized\n");
 }
 
-- 
2.17.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
