Return-Path: <SRS0=f8CR=DN=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81E20C4363D
	for <intel-gfx@archiver.kernel.org>; Tue,  6 Oct 2020 12:33:23 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47724206F7
	for <intel-gfx@archiver.kernel.org>; Tue,  6 Oct 2020 12:33:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 47724206F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B50866E489;
	Tue,  6 Oct 2020 12:33:22 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD2CC6E48E
 for <intel-gfx@lists.freedesktop.org>; Tue,  6 Oct 2020 12:33:20 +0000 (UTC)
IronPort-SDR: nsruq8pNYKcpMP4oS2JYpfmswxhhRiz0Sjk7DpzSYMK3nKiLdmDC+iUI/cfF0hoicqnaKy4Um0
 TD/dMOmIIzBA==
X-IronPort-AV: E=McAfee;i="6000,8403,9765"; a="161851720"
X-IronPort-AV: E=Sophos;i="5.77,343,1596524400"; d="scan'208";a="161851720"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2020 05:33:20 -0700
IronPort-SDR: CIsyByJoH5Uk3gjzkMgSNsh9Ww7e5W5IdWu0zYagzu99gLhYo6s401uU80iIu/WWnV4E5Z+mli
 d1C153DNLCPg==
X-IronPort-AV: E=Sophos;i="5.77,343,1596524400"; d="scan'208";a="527333675"
Received: from unknown (HELO linux-desktop.iind.intel.com) ([10.223.34.173])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2020 05:33:19 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue,  6 Oct 2020 18:36:50 +0530
Message-Id: <20201006130654.331-7-uma.shankar@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201006130654.331-1-uma.shankar@intel.com>
References: <20201006130654.331-1-uma.shankar@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [v7 06/10] drm/i915/display: Implement infoframes
 readback for LSPCON
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

Implemented Infoframes enabled readback for LSPCON devices.
This will help align the implementation with state readback
infrastructure.

v2: Added proper bitmask of enabled infoframes as per Ville's
recommendation.

v3: Added pcon specific infoframe types instead of using the HSW
one's, as recommended by Ville.

Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_lspcon.c | 57 ++++++++++++++++++++-
 drivers/gpu/drm/i915/i915_reg.h             |  2 +
 2 files changed, 57 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_lspcon.c b/drivers/gpu/drm/i915/display/intel_lspcon.c
index 7ae01f2a8596..70f4ae6bbda9 100644
--- a/drivers/gpu/drm/i915/display/intel_lspcon.c
+++ b/drivers/gpu/drm/i915/display/intel_lspcon.c
@@ -572,11 +572,64 @@ void lspcon_set_infoframes(struct intel_encoder *encoder,
 				  buf, ret);
 }
 
+static bool _lspcon_read_avi_infoframe_enabled_mca(struct drm_dp_aux *aux)
+{
+	int ret;
+	u32 val = 0;
+	u16 reg = LSPCON_MCA_AVI_IF_CTRL;
+
+	ret = drm_dp_dpcd_read(aux, reg, &val, 1);
+	if (ret < 0) {
+		DRM_ERROR("DPCD read failed, address 0x%x\n", reg);
+		return false;
+	}
+
+	return val & LSPCON_MCA_AVI_IF_KICKOFF;
+}
+
+static bool _lspcon_read_avi_infoframe_enabled_parade(struct drm_dp_aux *aux)
+{
+	int ret;
+	u32 val = 0;
+	u16 reg = LSPCON_PARADE_AVI_IF_CTRL;
+
+	ret = drm_dp_dpcd_read(aux, reg, &val, 1);
+	if (ret < 0) {
+		DRM_ERROR("DPCD read failed, address 0x%x\n", reg);
+		return false;
+	}
+
+	return val & LSPCON_PARADE_AVI_IF_KICKOFF;
+}
+
 u32 lspcon_infoframes_enabled(struct intel_encoder *encoder,
 			      const struct intel_crtc_state *pipe_config)
 {
-	/* FIXME actually read this from the hw */
-	return 0;
+	struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
+	struct intel_lspcon *lspcon = enc_to_intel_lspcon(encoder);
+	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	bool infoframes_enabled;
+	u32 val = 0;
+	u32 mask, tmp;
+
+	if (lspcon->vendor == LSPCON_VENDOR_MCA)
+		infoframes_enabled = _lspcon_read_avi_infoframe_enabled_mca(&intel_dp->aux);
+	else
+		infoframes_enabled = _lspcon_read_avi_infoframe_enabled_parade(&intel_dp->aux);
+
+	if (infoframes_enabled)
+		val |= VIDEO_DIP_ENABLE_AVI_PCON;
+
+	if (lspcon->hdr_supported) {
+		tmp = intel_de_read(dev_priv,
+				    HSW_TVIDEO_DIP_CTL(pipe_config->cpu_transcoder));
+		mask = VIDEO_DIP_ENABLE_GMP_PCON;
+
+		if (tmp & mask)
+			val |= mask;
+	}
+
+	return val;
 }
 
 void lspcon_wait_pcon_mode(struct intel_lspcon *lspcon)
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 88c215cf97d4..8e2e2f7007d0 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -4977,6 +4977,8 @@ enum {
 #define   VIDEO_DIP_ENABLE_VS_HSW	(1 << 8)
 #define   VIDEO_DIP_ENABLE_GMP_HSW	(1 << 4)
 #define   VIDEO_DIP_ENABLE_SPD_HSW	(1 << 0)
+#define   VIDEO_DIP_ENABLE_AVI_PCON	(1 << 12)
+#define   VIDEO_DIP_ENABLE_GMP_PCON	(1 << 4)
 
 /* Panel power sequencing */
 #define PPS_BASE			0x61200
-- 
2.26.2

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
