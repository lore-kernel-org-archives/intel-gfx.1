Return-Path: <SRS0=f8CR=DN=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9150EC4363D
	for <intel-gfx@archiver.kernel.org>; Tue,  6 Oct 2020 12:33:17 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B819206F7
	for <intel-gfx@archiver.kernel.org>; Tue,  6 Oct 2020 12:33:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B819206F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E40116E48C;
	Tue,  6 Oct 2020 12:33:15 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 164C46E483
 for <intel-gfx@lists.freedesktop.org>; Tue,  6 Oct 2020 12:33:14 +0000 (UTC)
IronPort-SDR: PUy+g4kHrh3GKNHa+lMhOwd2iWBCB7vX9K2X3bATQTOuNeRoBgq2wo04tLFYSADZgpZQac5J1H
 wdob6xeFi/RQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9765"; a="161851693"
X-IronPort-AV: E=Sophos;i="5.77,343,1596524400"; d="scan'208";a="161851693"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2020 05:33:13 -0700
IronPort-SDR: SJzi99VcHZ9n5ilwyRjjTDZkpPqvJ90hypl23kqKSCSs7QIHdXoWC94q+VSDQkl/2mpXDGLven
 YLvdiFF8fHxg==
X-IronPort-AV: E=Sophos;i="5.77,343,1596524400"; d="scan'208";a="527333646"
Received: from unknown (HELO linux-desktop.iind.intel.com) ([10.223.34.173])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2020 05:33:12 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue,  6 Oct 2020 18:36:46 +0530
Message-Id: <20201006130654.331-3-uma.shankar@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201006130654.331-1-uma.shankar@intel.com>
References: <20201006130654.331-1-uma.shankar@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [v7 02/10] drm/i915/display: Enable HDR on gen9 devices
 with MCA Lspcon
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

Gen9 hardware supports HDMI2.0 through LSPCON chips.
Extending HDR support for MCA LSPCON based GEN9 devices.

SOC will drive LSPCON as DP and send HDR metadata as standard
DP SDP packets. LSPCON will be set to operate in PCON mode,
will receive the metadata and create Dynamic Range and
Mastering Infoframe (DRM packets) and send it to HDR capable
HDMI sink devices.

v2: Re-used hsw infoframe write implementation for HDR metadata
for LSPCON as per Ville's suggestion.

v3: Addressed Jani Nikula's review comments.

v4: Addressed Ville's review comments, removed redundant wrapper
and checks, passed arguments instead of hardcodings.

Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_hdmi.c   |  8 +++---
 drivers/gpu/drm/i915/display/intel_lspcon.c | 31 ++++++++++++---------
 drivers/gpu/drm/i915/display/intel_lspcon.h |  4 +++
 3 files changed, 26 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index 8051df3d54a8..cc0eb585c654 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -518,10 +518,10 @@ static u32 vlv_infoframes_enabled(struct intel_encoder *encoder,
 		      VIDEO_DIP_ENABLE_SPD | VIDEO_DIP_ENABLE_GCP);
 }
 
-static void hsw_write_infoframe(struct intel_encoder *encoder,
-				const struct intel_crtc_state *crtc_state,
-				unsigned int type,
-				const void *frame, ssize_t len)
+void hsw_write_infoframe(struct intel_encoder *encoder,
+			 const struct intel_crtc_state *crtc_state,
+			 unsigned int type,
+			 const void *frame, ssize_t len)
 {
 	const u32 *data = frame;
 	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
diff --git a/drivers/gpu/drm/i915/display/intel_lspcon.c b/drivers/gpu/drm/i915/display/intel_lspcon.c
index f92962195698..04951cec9625 100644
--- a/drivers/gpu/drm/i915/display/intel_lspcon.c
+++ b/drivers/gpu/drm/i915/display/intel_lspcon.c
@@ -461,27 +461,32 @@ void lspcon_write_infoframe(struct intel_encoder *encoder,
 			    unsigned int type,
 			    const void *frame, ssize_t len)
 {
-	bool ret;
+	bool ret = true;
 	struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
 	struct intel_lspcon *lspcon = enc_to_intel_lspcon(encoder);
 
-	/* LSPCON only needs AVI IF */
-	if (type != HDMI_INFOFRAME_TYPE_AVI)
+	switch (type) {
+	case HDMI_INFOFRAME_TYPE_AVI:
+		if (lspcon->vendor == LSPCON_VENDOR_MCA)
+			ret = _lspcon_write_avi_infoframe_mca(&intel_dp->aux,
+							      frame, len);
+		else
+			ret = _lspcon_write_avi_infoframe_parade(&intel_dp->aux,
+								 frame, len);
+		break;
+	case HDMI_PACKET_TYPE_GAMUT_METADATA:
+		drm_dbg_kms(encoder->base.dev, "Update HDR metadata for lspcon\n");
+		/* It uses the legacy hsw implementation for the same */
+		hsw_write_infoframe(encoder, crtc_state, type, frame, len);
+		break;
+	default:
 		return;
-
-	if (lspcon->vendor == LSPCON_VENDOR_MCA)
-		ret = _lspcon_write_avi_infoframe_mca(&intel_dp->aux,
-						      frame, len);
-	else
-		ret = _lspcon_write_avi_infoframe_parade(&intel_dp->aux,
-							 frame, len);
+	}
 
 	if (!ret) {
-		DRM_ERROR("Failed to write AVI infoframes\n");
+		DRM_ERROR("Failed to write infoframes\n");
 		return;
 	}
-
-	DRM_DEBUG_DRIVER("AVI infoframes updated successfully\n");
 }
 
 void lspcon_read_infoframe(struct intel_encoder *encoder,
diff --git a/drivers/gpu/drm/i915/display/intel_lspcon.h b/drivers/gpu/drm/i915/display/intel_lspcon.h
index 0851ea30831a..00722f8aec1a 100644
--- a/drivers/gpu/drm/i915/display/intel_lspcon.h
+++ b/drivers/gpu/drm/i915/display/intel_lspcon.h
@@ -33,5 +33,9 @@ u32 lspcon_infoframes_enabled(struct intel_encoder *encoder,
 			      const struct intel_crtc_state *pipe_config);
 void lspcon_ycbcr420_config(struct drm_connector *connector,
 			    struct intel_crtc_state *crtc_state);
+void hsw_write_infoframe(struct intel_encoder *encoder,
+			 const struct intel_crtc_state *crtc_state,
+			 unsigned int type,
+			const void *frame, ssize_t len);
 
 #endif /* __INTEL_LSPCON_H__ */
-- 
2.26.2

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
