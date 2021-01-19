Return-Path: <SRS0=gs28=GW=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E201C433E6
	for <intel-gfx@archiver.kernel.org>; Tue, 19 Jan 2021 07:43:32 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCCC62312D
	for <intel-gfx@archiver.kernel.org>; Tue, 19 Jan 2021 07:43:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DCCC62312D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37A026E82C;
	Tue, 19 Jan 2021 07:43:27 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 682BA6E827
 for <Intel-gfx@lists.freedesktop.org>; Tue, 19 Jan 2021 07:43:24 +0000 (UTC)
IronPort-SDR: HdRY1+lyXeBOfHjZrEEOScnvHdfLPI4pMuvw8KZc+KYHhWfwKhUGLYbdrSlZq+ej420XSSUICN
 +K9Zljc5koTw==
X-IronPort-AV: E=McAfee;i="6000,8403,9868"; a="197592805"
X-IronPort-AV: E=Sophos;i="5.79,358,1602572400"; d="scan'208";a="197592805"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2021 23:43:23 -0800
IronPort-SDR: Zt9iM20s9P+Xdm8w3R470NghVAAXpzx7XRUxbKTWpIe9lmI64MwWIm0jSUE+kyr13TB1dJNutv
 vTZRiXD3ru+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,358,1602572400"; d="scan'208";a="466592725"
Received: from sean-virtualbox.fm.intel.com ([10.105.158.96])
 by fmsmga001.fm.intel.com with ESMTP; 18 Jan 2021 23:43:23 -0800
From: "Huang, Sean Z" <sean.z.huang@intel.com>
To: Intel-gfx@lists.freedesktop.org
Date: Mon, 18 Jan 2021 23:43:09 -0800
Message-Id: <20210119074320.28768-3-sean.z.huang@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210119074320.28768-1-sean.z.huang@intel.com>
References: <20210119074320.28768-1-sean.z.huang@intel.com>
Subject: [Intel-gfx] [RFC-v23 02/13] drm/i915/pxp: set KCR reg init during
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
Cc: kumar.gaurav@intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Set the KCR init during the boot time, which is
required by hardware, to allow us doing further
protection operation such as sending commands to
GPU or TEE.

rev21:
    - Remove "#define KCR_INIT_MASK_SHIFT (16)", but still keep the
      macro in this .c file
    - Write KCR_INIT reg inly for gen12 during boot, not required
      for gen13+

Signed-off-by: Huang, Sean Z <sean.z.huang@intel.com>
---
 drivers/gpu/drm/i915/pxp/intel_pxp.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.c b/drivers/gpu/drm/i915/pxp/intel_pxp.c
index 9bc3c7e30654..4e9cee7df4f2 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp.c
@@ -6,6 +6,12 @@
 #include "intel_pxp.h"
 #include "intel_pxp_context.h"
 
+/* KCR register definitions */
+#define KCR_INIT            _MMIO(0x320f0)
+
+/* Setting KCR Init bit is required after system boot */
+#define KCR_INIT_ALLOW_DISPLAY_ME_WRITES (BIT(14) | (BIT(14) << 16))
+
 void intel_pxp_init(struct intel_pxp *pxp)
 {
 	struct intel_gt *gt = container_of(pxp, struct intel_gt, pxp);
@@ -15,6 +21,9 @@ void intel_pxp_init(struct intel_pxp *pxp)
 
 	intel_pxp_ctx_init(&pxp->ctx);
 
+	if (INTEL_GEN(gt->i915) == 12)
+		intel_uncore_write(gt->uncore, KCR_INIT, KCR_INIT_ALLOW_DISPLAY_ME_WRITES);
+
 	drm_info(&gt->i915->drm, "Protected Xe Path (PXP) protected content support initialized\n");
 }
 
-- 
2.17.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
