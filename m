Return-Path: <SRS0=pd08=MO=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74041C4338F
	for <intel-gfx@archiver.kernel.org>; Thu, 22 Jul 2021 23:29:30 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 293D160EB2
	for <intel-gfx@archiver.kernel.org>; Thu, 22 Jul 2021 23:29:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 293D160EB2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC7FB6EADF;
	Thu, 22 Jul 2021 23:29:29 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0DBD6EADF
 for <intel-gfx@lists.freedesktop.org>; Thu, 22 Jul 2021 23:29:27 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10053"; a="191358462"
X-IronPort-AV: E=Sophos;i="5.84,262,1620716400"; d="scan'208";a="191358462"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2021 16:29:27 -0700
X-IronPort-AV: E=Sophos;i="5.84,262,1620716400"; d="scan'208";a="433332592"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2021 16:29:27 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Thu, 22 Jul 2021 16:29:22 -0700
Message-Id: <20210722232922.3796835-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v2] drm/i915/display: split DISPLAY_VER 9 and 10
 in intel_setup_outputs()
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
Cc: Jani Nikula <jani.nikula@intel.com>, Christoph Hellwig <hch@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Commit 5a9d38b20a5a ("drm/i915/display: hide workaround for broken vbt
in intel_bios.c") moved the workaround for broken or missing VBT to
intel_bios.c. However is_port_valid() only protects the handling of
different skus of the same display version. Since in
intel_setup_outputs() we share the code path with version 9, this would
also create port F for SKL/KBL, which does not exist.

Missing VBT can be reproduced when starting a headless QEMU with no
opregion available.

Avoid the issue by splitting versions 9 and 10 in intel_setup_outputs(),
which also makes it more clear what code path it's taking for each
version.

v2: move generic display version after Geminilake since that one has
a different set of outputs

Fixes: 5a9d38b20a5a ("drm/i915/display: hide workaround for broken vbt in intel_bios.c")
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reported-by: Christoph Hellwig <hch@infradead.org>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index c274bfb8e549..3f5383f3c744 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -11376,13 +11376,19 @@ static void intel_setup_outputs(struct drm_i915_private *dev_priv)
 		intel_ddi_init(dev_priv, PORT_B);
 		intel_ddi_init(dev_priv, PORT_C);
 		vlv_dsi_init(dev_priv);
-	} else if (DISPLAY_VER(dev_priv) >= 9) {
+	} else if (DISPLAY_VER(dev_priv) == 10) {
 		intel_ddi_init(dev_priv, PORT_A);
 		intel_ddi_init(dev_priv, PORT_B);
 		intel_ddi_init(dev_priv, PORT_C);
 		intel_ddi_init(dev_priv, PORT_D);
 		intel_ddi_init(dev_priv, PORT_E);
 		intel_ddi_init(dev_priv, PORT_F);
+	} else if (DISPLAY_VER(dev_priv) >= 9) {
+		intel_ddi_init(dev_priv, PORT_A);
+		intel_ddi_init(dev_priv, PORT_B);
+		intel_ddi_init(dev_priv, PORT_C);
+		intel_ddi_init(dev_priv, PORT_D);
+		intel_ddi_init(dev_priv, PORT_E);
 	} else if (HAS_DDI(dev_priv)) {
 		u32 found;
 
-- 
2.31.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
