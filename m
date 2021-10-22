Return-Path: <SRS0=Sdza=PK=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62680C433F5
	for <intel-gfx@archiver.kernel.org>; Fri, 22 Oct 2021 10:33:44 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31CD961059
	for <intel-gfx@archiver.kernel.org>; Fri, 22 Oct 2021 10:33:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 31CD961059
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C1D06ED0D;
	Fri, 22 Oct 2021 10:33:43 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D7A86ED0B
 for <intel-gfx@lists.freedesktop.org>; Fri, 22 Oct 2021 10:33:39 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10144"; a="252777839"
X-IronPort-AV: E=Sophos;i="5.87,172,1631602800"; d="scan'208";a="252777839"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 03:33:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,172,1631602800"; d="scan'208";a="633211599"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga001.fm.intel.com with SMTP; 22 Oct 2021 03:33:36 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 22 Oct 2021 13:33:36 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: Manasi Navare <manasi.d.navare@intel.com>
Date: Fri, 22 Oct 2021 13:33:04 +0300
Message-Id: <20211022103304.24164-10-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211022103304.24164-1-ville.syrjala@linux.intel.com>
References: <20211022103304.24164-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH v2 9/9] drm/i915: Nuke
 PIPE_CONFIG_QUIRK_BIGJOINER_SLAVE
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
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Now that the bigjoiner state readout/computation has been
made to do the right thing nuke the related state checker
quirk.

Reviewed-by: Manasi Navare <manasi.d.navare@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c  | 105 ++++++++----------
 .../drm/i915/display/intel_display_types.h    |   1 -
 2 files changed, 47 insertions(+), 59 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index f21030ffa83d..79cd158503b3 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -6498,51 +6498,48 @@ intel_pipe_config_compare(const struct intel_crtc_state *current_config,
 
 	PIPE_CONF_CHECK_X(output_types);
 
-	/* FIXME do the readout properly and get rid of this quirk */
-	if (!PIPE_CONF_QUIRK(PIPE_CONFIG_QUIRK_BIGJOINER_SLAVE)) {
-		PIPE_CONF_CHECK_I(hw.pipe_mode.crtc_hdisplay);
-		PIPE_CONF_CHECK_I(hw.pipe_mode.crtc_htotal);
-		PIPE_CONF_CHECK_I(hw.pipe_mode.crtc_hblank_start);
-		PIPE_CONF_CHECK_I(hw.pipe_mode.crtc_hblank_end);
-		PIPE_CONF_CHECK_I(hw.pipe_mode.crtc_hsync_start);
-		PIPE_CONF_CHECK_I(hw.pipe_mode.crtc_hsync_end);
+	PIPE_CONF_CHECK_I(hw.pipe_mode.crtc_hdisplay);
+	PIPE_CONF_CHECK_I(hw.pipe_mode.crtc_htotal);
+	PIPE_CONF_CHECK_I(hw.pipe_mode.crtc_hblank_start);
+	PIPE_CONF_CHECK_I(hw.pipe_mode.crtc_hblank_end);
+	PIPE_CONF_CHECK_I(hw.pipe_mode.crtc_hsync_start);
+	PIPE_CONF_CHECK_I(hw.pipe_mode.crtc_hsync_end);
 
-		PIPE_CONF_CHECK_I(hw.pipe_mode.crtc_vdisplay);
-		PIPE_CONF_CHECK_I(hw.pipe_mode.crtc_vtotal);
-		PIPE_CONF_CHECK_I(hw.pipe_mode.crtc_vblank_start);
-		PIPE_CONF_CHECK_I(hw.pipe_mode.crtc_vblank_end);
-		PIPE_CONF_CHECK_I(hw.pipe_mode.crtc_vsync_start);
-		PIPE_CONF_CHECK_I(hw.pipe_mode.crtc_vsync_end);
+	PIPE_CONF_CHECK_I(hw.pipe_mode.crtc_vdisplay);
+	PIPE_CONF_CHECK_I(hw.pipe_mode.crtc_vtotal);
+	PIPE_CONF_CHECK_I(hw.pipe_mode.crtc_vblank_start);
+	PIPE_CONF_CHECK_I(hw.pipe_mode.crtc_vblank_end);
+	PIPE_CONF_CHECK_I(hw.pipe_mode.crtc_vsync_start);
+	PIPE_CONF_CHECK_I(hw.pipe_mode.crtc_vsync_end);
 
-		PIPE_CONF_CHECK_I(hw.adjusted_mode.crtc_hdisplay);
-		PIPE_CONF_CHECK_I(hw.adjusted_mode.crtc_htotal);
-		PIPE_CONF_CHECK_I(hw.adjusted_mode.crtc_hblank_start);
-		PIPE_CONF_CHECK_I(hw.adjusted_mode.crtc_hblank_end);
-		PIPE_CONF_CHECK_I(hw.adjusted_mode.crtc_hsync_start);
-		PIPE_CONF_CHECK_I(hw.adjusted_mode.crtc_hsync_end);
+	PIPE_CONF_CHECK_I(hw.adjusted_mode.crtc_hdisplay);
+	PIPE_CONF_CHECK_I(hw.adjusted_mode.crtc_htotal);
+	PIPE_CONF_CHECK_I(hw.adjusted_mode.crtc_hblank_start);
+	PIPE_CONF_CHECK_I(hw.adjusted_mode.crtc_hblank_end);
+	PIPE_CONF_CHECK_I(hw.adjusted_mode.crtc_hsync_start);
+	PIPE_CONF_CHECK_I(hw.adjusted_mode.crtc_hsync_end);
 
-		PIPE_CONF_CHECK_I(hw.adjusted_mode.crtc_vdisplay);
-		PIPE_CONF_CHECK_I(hw.adjusted_mode.crtc_vtotal);
-		PIPE_CONF_CHECK_I(hw.adjusted_mode.crtc_vblank_start);
-		PIPE_CONF_CHECK_I(hw.adjusted_mode.crtc_vblank_end);
-		PIPE_CONF_CHECK_I(hw.adjusted_mode.crtc_vsync_start);
-		PIPE_CONF_CHECK_I(hw.adjusted_mode.crtc_vsync_end);
+	PIPE_CONF_CHECK_I(hw.adjusted_mode.crtc_vdisplay);
+	PIPE_CONF_CHECK_I(hw.adjusted_mode.crtc_vtotal);
+	PIPE_CONF_CHECK_I(hw.adjusted_mode.crtc_vblank_start);
+	PIPE_CONF_CHECK_I(hw.adjusted_mode.crtc_vblank_end);
+	PIPE_CONF_CHECK_I(hw.adjusted_mode.crtc_vsync_start);
+	PIPE_CONF_CHECK_I(hw.adjusted_mode.crtc_vsync_end);
 
-		PIPE_CONF_CHECK_I(pixel_multiplier);
+	PIPE_CONF_CHECK_I(pixel_multiplier);
 
-		PIPE_CONF_CHECK_FLAGS(hw.adjusted_mode.flags,
-				      DRM_MODE_FLAG_INTERLACE);
+	PIPE_CONF_CHECK_FLAGS(hw.adjusted_mode.flags,
+			      DRM_MODE_FLAG_INTERLACE);
 
-		if (!PIPE_CONF_QUIRK(PIPE_CONFIG_QUIRK_MODE_SYNC_FLAGS)) {
-			PIPE_CONF_CHECK_FLAGS(hw.adjusted_mode.flags,
-					      DRM_MODE_FLAG_PHSYNC);
-			PIPE_CONF_CHECK_FLAGS(hw.adjusted_mode.flags,
-					      DRM_MODE_FLAG_NHSYNC);
-			PIPE_CONF_CHECK_FLAGS(hw.adjusted_mode.flags,
-					      DRM_MODE_FLAG_PVSYNC);
-			PIPE_CONF_CHECK_FLAGS(hw.adjusted_mode.flags,
-					      DRM_MODE_FLAG_NVSYNC);
-		}
+	if (!PIPE_CONF_QUIRK(PIPE_CONFIG_QUIRK_MODE_SYNC_FLAGS)) {
+		PIPE_CONF_CHECK_FLAGS(hw.adjusted_mode.flags,
+				      DRM_MODE_FLAG_PHSYNC);
+		PIPE_CONF_CHECK_FLAGS(hw.adjusted_mode.flags,
+				      DRM_MODE_FLAG_NHSYNC);
+		PIPE_CONF_CHECK_FLAGS(hw.adjusted_mode.flags,
+				      DRM_MODE_FLAG_PVSYNC);
+		PIPE_CONF_CHECK_FLAGS(hw.adjusted_mode.flags,
+				      DRM_MODE_FLAG_NVSYNC);
 	}
 
 	PIPE_CONF_CHECK_I(output_format);
@@ -6554,9 +6551,7 @@ intel_pipe_config_compare(const struct intel_crtc_state *current_config,
 	PIPE_CONF_CHECK_BOOL(hdmi_scrambling);
 	PIPE_CONF_CHECK_BOOL(hdmi_high_tmds_clock_ratio);
 	PIPE_CONF_CHECK_BOOL(has_infoframe);
-	/* FIXME do the readout properly and get rid of this quirk */
-	if (!PIPE_CONF_QUIRK(PIPE_CONFIG_QUIRK_BIGJOINER_SLAVE))
-		PIPE_CONF_CHECK_BOOL(fec_enable);
+	PIPE_CONF_CHECK_BOOL(fec_enable);
 
 	PIPE_CONF_CHECK_BOOL_INCOMPLETE(has_audio);
 
@@ -6585,9 +6580,7 @@ intel_pipe_config_compare(const struct intel_crtc_state *current_config,
 		}
 
 		PIPE_CONF_CHECK_I(scaler_state.scaler_id);
-		/* FIXME do the readout properly and get rid of this quirk */
-		if (!PIPE_CONF_QUIRK(PIPE_CONFIG_QUIRK_BIGJOINER_SLAVE))
-			PIPE_CONF_CHECK_CLOCK_FUZZY(pixel_rate);
+		PIPE_CONF_CHECK_CLOCK_FUZZY(pixel_rate);
 
 		PIPE_CONF_CHECK_X(gamma_mode);
 		if (IS_CHERRYVIEW(dev_priv))
@@ -6614,11 +6607,9 @@ intel_pipe_config_compare(const struct intel_crtc_state *current_config,
 
 	PIPE_CONF_CHECK_BOOL(double_wide);
 
-	if (dev_priv->dpll.mgr)
+	if (dev_priv->dpll.mgr) {
 		PIPE_CONF_CHECK_P(shared_dpll);
 
-	/* FIXME do the readout properly and get rid of this quirk */
-	if (dev_priv->dpll.mgr && !PIPE_CONF_QUIRK(PIPE_CONFIG_QUIRK_BIGJOINER_SLAVE)) {
 		PIPE_CONF_CHECK_X(dpll_hw_state.dpll);
 		PIPE_CONF_CHECK_X(dpll_hw_state.dpll_md);
 		PIPE_CONF_CHECK_X(dpll_hw_state.fp0);
@@ -6652,19 +6643,17 @@ intel_pipe_config_compare(const struct intel_crtc_state *current_config,
 		PIPE_CONF_CHECK_X(dpll_hw_state.mg_pll_tdc_coldst_bias);
 	}
 
-	if (!PIPE_CONF_QUIRK(PIPE_CONFIG_QUIRK_BIGJOINER_SLAVE)) {
-		PIPE_CONF_CHECK_X(dsi_pll.ctrl);
-		PIPE_CONF_CHECK_X(dsi_pll.div);
+	PIPE_CONF_CHECK_X(dsi_pll.ctrl);
+	PIPE_CONF_CHECK_X(dsi_pll.div);
 
-		if (IS_G4X(dev_priv) || DISPLAY_VER(dev_priv) >= 5)
-			PIPE_CONF_CHECK_I(pipe_bpp);
+	if (IS_G4X(dev_priv) || DISPLAY_VER(dev_priv) >= 5)
+		PIPE_CONF_CHECK_I(pipe_bpp);
 
-		PIPE_CONF_CHECK_CLOCK_FUZZY(hw.pipe_mode.crtc_clock);
-		PIPE_CONF_CHECK_CLOCK_FUZZY(hw.adjusted_mode.crtc_clock);
-		PIPE_CONF_CHECK_CLOCK_FUZZY(port_clock);
+	PIPE_CONF_CHECK_CLOCK_FUZZY(hw.pipe_mode.crtc_clock);
+	PIPE_CONF_CHECK_CLOCK_FUZZY(hw.adjusted_mode.crtc_clock);
+	PIPE_CONF_CHECK_CLOCK_FUZZY(port_clock);
 
-		PIPE_CONF_CHECK_I(min_voltage_level);
-	}
+	PIPE_CONF_CHECK_I(min_voltage_level);
 
 	if (current_config->has_psr || pipe_config->has_psr)
 		PIPE_CONF_CHECK_X_WITH_MASK(infoframes.enable,
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 3568d33be096..991972da0703 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -945,7 +945,6 @@ struct intel_crtc_state {
 	 * accordingly.
 	 */
 #define PIPE_CONFIG_QUIRK_MODE_SYNC_FLAGS	(1<<0) /* unreliable sync mode.flags */
-#define PIPE_CONFIG_QUIRK_BIGJOINER_SLAVE      (1<<1) /* bigjoiner slave, partial readout */
 	unsigned long quirks;
 
 	unsigned fb_bits; /* framebuffers to flip */
-- 
2.32.0

