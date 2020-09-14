Return-Path: <SRS0=dUrX=CX=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EE11C31E40
	for <intel-gfx@archiver.kernel.org>; Mon, 14 Sep 2020 20:25:05 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA52420E65
	for <intel-gfx@archiver.kernel.org>; Mon, 14 Sep 2020 20:25:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA52420E65
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D50B06E57E;
	Mon, 14 Sep 2020 20:25:03 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62C2B6E581
 for <intel-gfx@lists.freedesktop.org>; Mon, 14 Sep 2020 20:25:02 +0000 (UTC)
IronPort-SDR: IONJBYIMJjvkfE07PvOD2DNAV4Hu8hQv6A77UdzQADGEjcrFRQAK243/ZdKp6wlX+YW5Hzg1rd
 ValTdLCTJ+hQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9744"; a="223340785"
X-IronPort-AV: E=Sophos;i="5.76,427,1592895600"; d="scan'208";a="223340785"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2020 13:25:02 -0700
IronPort-SDR: IkqkhNnPrQCnGWzgVyQnWPAFcIkqjfptcNWKeZcPbb//88/1NjEITeK7mMNHsfJwdFuXh39X7z
 fZgehbe4Flfw==
X-IronPort-AV: E=Sophos;i="5.76,427,1592895600"; d="scan'208";a="306307105"
Received: from unknown (HELO linux-desktop.iind.intel.com) ([10.223.34.173])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2020 13:25:00 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue, 15 Sep 2020 02:30:38 +0530
Message-Id: <20200914210047.11972-3-uma.shankar@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200914210047.11972-1-uma.shankar@intel.com>
References: <20200914210047.11972-1-uma.shankar@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [v6 02/11] drm/i915/display: Enable HDR on gen9 devices
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

Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_hdmi.c   | 10 ++++++
 drivers/gpu/drm/i915/display/intel_lspcon.c | 37 +++++++++++++++------
 drivers/gpu/drm/i915/display/intel_lspcon.h |  5 ++-
 3 files changed, 40 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index 0978b0d8f4c6..1e40ed473fb9 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -590,6 +590,16 @@ static u32 hsw_infoframes_enabled(struct intel_encoder *encoder,
 	return val & mask;
 }
 
+void lspcon_drm_write_infoframe(struct intel_encoder *encoder,
+				const struct intel_crtc_state *crtc_state,
+				unsigned int type,
+				const void *frame, ssize_t len)
+{
+	drm_dbg_kms(encoder->base.dev, "Update HDR metadata for lspcon\n");
+	/* It uses the legacy hsw implementation for the same */
+	hsw_write_infoframe(encoder, crtc_state, type, frame, len);
+}
+
 static const u8 infoframe_type_to_idx[] = {
 	HDMI_PACKET_TYPE_GENERAL_CONTROL,
 	HDMI_PACKET_TYPE_GAMUT_METADATA,
diff --git a/drivers/gpu/drm/i915/display/intel_lspcon.c b/drivers/gpu/drm/i915/display/intel_lspcon.c
index 8e8c7a02ab51..5e2d7ca1d20f 100644
--- a/drivers/gpu/drm/i915/display/intel_lspcon.c
+++ b/drivers/gpu/drm/i915/display/intel_lspcon.c
@@ -461,27 +461,42 @@ void lspcon_write_infoframe(struct intel_encoder *encoder,
 			    unsigned int type,
 			    const void *frame, ssize_t len)
 {
-	bool ret;
+	bool ret = true;
 	struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
 	struct intel_lspcon *lspcon = enc_to_intel_lspcon(encoder);
 
-	/* LSPCON only needs AVI IF */
-	if (type != HDMI_INFOFRAME_TYPE_AVI)
+	/*
+	 * Supporting HDR on MCA LSPCON
+	 * Todo: Add support for Parade later
+	 */
+	if (type == HDMI_PACKET_TYPE_GAMUT_METADATA &&
+	    lspcon->vendor != LSPCON_VENDOR_MCA)
 		return;
 
-	if (lspcon->vendor == LSPCON_VENDOR_MCA)
-		ret = _lspcon_write_avi_infoframe_mca(&intel_dp->aux,
-						      frame, len);
-	else
-		ret = _lspcon_write_avi_infoframe_parade(&intel_dp->aux,
-							 frame, len);
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
+		lspcon_drm_write_infoframe(encoder, crtc_state,
+					   HDMI_PACKET_TYPE_GAMUT_METADATA,
+					   frame, VIDEO_DIP_DATA_SIZE);
+		break;
+	default:
+		return;
+	}
 
 	if (!ret) {
-		DRM_ERROR("Failed to write AVI infoframes\n");
+		DRM_ERROR("Failed to write infoframes\n");
 		return;
 	}
 
-	DRM_DEBUG_DRIVER("AVI infoframes updated successfully\n");
+	DRM_DEBUG_DRIVER("Infoframes updated successfully\n");
 }
 
 void lspcon_read_infoframe(struct intel_encoder *encoder,
diff --git a/drivers/gpu/drm/i915/display/intel_lspcon.h b/drivers/gpu/drm/i915/display/intel_lspcon.h
index 1cffe8a42a08..3fac05535731 100644
--- a/drivers/gpu/drm/i915/display/intel_lspcon.h
+++ b/drivers/gpu/drm/i915/display/intel_lspcon.h
@@ -34,5 +34,8 @@ u32 lspcon_infoframes_enabled(struct intel_encoder *encoder,
 			      const struct intel_crtc_state *pipe_config);
 void lspcon_ycbcr420_config(struct drm_connector *connector,
 			    struct intel_crtc_state *crtc_state);
-
+void lspcon_drm_write_infoframe(struct intel_encoder *encoder,
+				const struct intel_crtc_state *crtc_state,
+				unsigned int type,
+				const void *frame, ssize_t len);
 #endif /* __INTEL_LSPCON_H__ */
-- 
2.26.2

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
