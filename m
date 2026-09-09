Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67E5BC79FAD
	for <intel-gfx@archiver.kernel.org>; Wed,  9 Sep 2026 05:44:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC8FC10EEC8;
	Wed,  9 Sep 2026 05:44:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GUy6/Kxj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C156C10EEC8
 for <intel-gfx@lists.freedesktop.org>; Wed,  9 Sep 2026 05:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788932695; x=1820468695;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=k/m6bBuzaiT6o+cCz07Qsky+aoYUt7MJY6nElzecJjc=;
 b=GUy6/KxjsAqayOLdf2V1aQAcbupun461Vz0mmaGi95bp34GSEg0M3Aq0
 gw/3uEvw9rWd9McUVvDf3rcYN22E3dLielouS0uCIBbjYm6TzpD6YCZi7
 PI8EKR+qF1wtTEDXZrvt+nDmO19TpLh1G+sdwh6H5cxkZR7XXKZeUGB5R
 xuvudUIPXlUrm4rNwGKhO3SaM6wLNKUlpiPjUL5fG48QWzQLounwBXRqg
 Is3OpiDYg1GbDrYOWzEyIouvvJD9ZEhdPuByQW4CT+n+68Qh+fKQxJlMf
 38TD06DuxWxHqhmcinLDWYLAD8wOH7rwKiq6JMwXGg/MJYY/y4usC0awM A==;
X-CSE-ConnectionGUID: uo7Vo316QQSRTaChOTV/tQ==
X-CSE-MsgGUID: PolbJ4MYSI+en1pdU2WGSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="88282954"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="88282954"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 22:44:53 -0700
X-CSE-ConnectionGUID: hWLcvZe9SsCgkiq0Frjjuw==
X-CSE-MsgGUID: GNzxi5OVTj6nh7nxFxnPqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="267960697"
Received: from xiaolu.sh.intel.com ([10.239.146.103])
 by fmviesa007.fm.intel.com with ESMTP; 08 Sep 2026 22:44:51 -0700
From: Xiao Lu <xiaolu.xie@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: jani.nikula@linux.intel.com, ville.syrjala@linux.intel.com,
 imre.deak@intel.com, ankit.k.nautiyal@intel.com,
 Xiao Lu <xiaolu.xie@intel.com>
Subject: [PATCH v9] drm/i915/dp: enable DSC passthrough for HDMI 2.1 PCON
 devices
Date: Wed,  9 Sep 2026 13:42:25 +0800
Message-ID: <20260909054225.456573-1-xiaolu.xie@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909041041.244531-2-xiaolu.xie@intel.com>
References: <20260909041041.244531-2-xiaolu.xie@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

HDMI 2.1 PCON devices (e.g. Parade PS196) that do not have an internal
DSC encoder can still forward a DSC-compressed stream from the DP source
to the downstream HDMI 2.1 sink unchanged (passthrough mode). The HDMI
sink (e.g. Lenovo ThinkVision Pro 27UD-10) then decompresses the stream
itself. This mode is signalled by DP_DSC_PASSTHROUGH_IS_SUPPORTED (DPCD
0x060 bit1) on the PCON.

Previously the driver had no awareness of this path: the PCON would fall
back to its autonomous passthrough mode and write 0x160=0x02 by itself,
leaving the source with no control over DSC parameters or DPCD 0x160.

This patch adds explicit driver control of PCON DSC passthrough:

- Detect passthrough capability at connect time from DPCD 0x060 bit1
  combined with the downstream HDMI 2.1 sink's DSC 1.2 support from
  EDID HF-VSDB. Cache the result in connector->dp.pcon_dsc_passthrough
  (same lifecycle as fec_capability and dsc_dpcd).

- Treat the PCON as DSC-capable in intel_dp_has_dsc() when passthrough
  is supported, allowing the normal DSC compute_config path to proceed.

- Derive DSC parameters (slice count, bpc limits) from the downstream
  HDMI sink's EDID DSC capabilities rather than from the PCON encoder
  DPCD (all-zero for passthrough-only PCONs).

- Add PCON passthrough branch in intel_dp_dsc_compute_params() to use
  DSC 1.2 defaults (version 1.2, convert_rgb per output format,
  line_buf_depth=13, block_pred=true) instead of the PCON dsc_dpcd
  fields which reflect passthrough device constraints, not the actual
  HDMI sink decompressor.

- Skip align_max_sink_dsc_input_bpp() for PCON passthrough to prevent
  the PCON dsc_dpcd color_depth_cap from zeroing pipe.max_bpp.

- Write DP_DSC_PASSTHROUGH_EN (0x160 bit1) to the PCON via
  intel_dp_sink_set_dsc_passthrough() on enable, and clear it on
  disable. The existing MST hub passthrough path is preserved; the PCON
  case is handled by redirecting aux to intel_dp->aux (SST) or
  connector->mst.port->aux (MST via REMOTE_DPCD_WRITE) when
  pcon_dsc_passthrough is set.

- Short-circuit intel_dp_sink_set_dsc_decompression() for PCON
  passthrough since the PCON itself does not decompress.

- Add passthrough branch in intel_dp_mode_valid_with_dsc() to use
  EDID max_slices capped by PCON dsc_dpcd slice capability.

Tested with Parade PS196G (HW 0.2, SW 241.62) connected directly (SST)
and via PS8650 MST hub to a Lenovo ThinkVision Pro 27UD-10 (HDMI 2.1,
DSC 1.2, max 16 slices, 400 MHz/slice). At 4K@240Hz DSC compression is
required; driver now writes 0x160=0x02 explicitly and DSC parameters are
correctly derived from the HDMI sink EDID. Depends on the preceding
drm/dp/mst patch for MST topology support.

Signed-off-by: Xiao Lu <xiaolu.xie@intel.com>
---
v9: Based on Sashiko AI review feedback:
    Fix intel_dp_pcon_passthrough_dsc_slice_config() to accept an
    explicit connector parameter instead of intel_dp->attached_connector,
    fixing incorrect HDMI sink EDID lookup in MST paths (connector was
    always the SST root connector regardless of which MST stream was
    being configured).
    Fix src_max_slices to use drm_dp_dsc_sink_max_slice_count() from
    the PCON dsc_dpcd instead of hdmi_max_slices, so the PCON hardware
    slice limit is respected as an upper bound alongside the HDMI sink
    EDID limit.

v8: Sincere apologies - v7 was sent with a typo that left the old
    single-parameter signature for intel_dp_pcon_set_dsc_passthrough_cap()
    in place, causing the build failure. This version correctly updates
    the function to accept an explicit struct intel_connector * parameter.

v7: Fix intel_dp_pcon_set_dsc_passthrough_cap() to accept an explicit
    connector parameter instead of deriving it from
    intel_dp->attached_connector, fixing incorrect root SST connector
    access in MST paths. Make the function non-static and add a header
    declaration so intel_dp_mst.c can call it. Update both SST
    (intel_dp_set_edid) and MST (mst_connector_get_ddc_modes) call
    sites to pass the correct per-connector context.
    Remove the !connector->mst.port early-return so MST connectors
    can also have pcon_dsc_passthrough set.
    Remove the !connector->mst.dp guard in
    intel_dp_sink_set_dsc_decompression() so MST PCON passthrough
    connectors are also short-circuited correctly.
    Fix intel_dp_mode_valid_with_dsc() to handle all-zero PCON dsc_dpcd
    by falling back to EDID max_slices when pcon_max is zero.

v6: Add intel_dp_pcon_set_dsc_passthrough_cap() call in
    mst_connector_get_ddc_modes() after EDID parsing so that MST
    connectors also have pcon_dsc_passthrough evaluated correctly.
    Fix checkpatch warnings.

v5: Split into two patches. Inline PCON passthrough DSC parameter
    overrides into intel_dp_dsc_compute_params(). Fix convert_rgb to
    depend on output_format. Remove intel_dp_pcon_set_dsc_passthrough_cap()
    from intel_dp_get_dsc_sink_cap(). Pass INT_MAX as src_max_slice_width.
    Add hdisplay divisibility check. Add PCON passthrough branch in
    intel_dp_mode_valid_with_dsc().

v4: Rebase onto drm-intel-next-2026-09-03 to fix compilation failures.

v3: Restrict PCON DSC passthrough to SST direct connections only.

v2: Fix build failure on drm-tip.
---
 .../drm/i915/display/intel_display_types.h    |   1 +
 drivers/gpu/drm/i915/display/intel_dp.c       | 287 +++++++++++++++---
 drivers/gpu/drm/i915/display/intel_dp.h       |   2 +
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |   7 +
 4 files changed, 263 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 5f0fe18c0..90d77aa4d 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -564,6 +564,7 @@ struct intel_connector {
 		u8 dsc_hblank_expansion_quirk:1;
 		u8 dsc_throughput_quirk:1;
 		u8 dsc_decompression_enabled:1;
+		u8 pcon_dsc_passthrough:1; /* PCON DSC PT supported and HDMI sink DSC 1.2 */
 
 		struct {
 			struct {
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index c46397edf..1768ca6df 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1259,8 +1259,14 @@ bool intel_dp_has_dsc(const struct intel_connector *connector)
 	    connector->panel.vbt.edp.dsc_disable)
 		return false;
 
-	if (!drm_dp_sink_supports_dsc(connector->dp.dsc_dpcd))
-		return false;
+	if (!drm_dp_sink_supports_dsc(connector->dp.dsc_dpcd)) {
+		/*
+		 * PCON passthrough: PCON has no DSC decoder so dsc_dpcd is
+		 * zero, but if pcon_dsc_passthrough is set (cached at connect
+		 * time) the downstream HDMI 2.1 sink will decompress instead.
+		 */
+		return connector->dp.pcon_dsc_passthrough;
+	}
 
 	return true;
 }
@@ -1866,28 +1872,49 @@ static int intel_dp_dsc_compute_params(const struct intel_connector *connector,
 	if (ret)
 		return ret;
 
-	vdsc_cfg->dsc_version_major =
-		(connector->dp.dsc_dpcd[DP_DSC_REV - DP_DSC_SUPPORT] &
-		 DP_DSC_MAJOR_MASK) >> DP_DSC_MAJOR_SHIFT;
-	vdsc_cfg->dsc_version_minor =
-		min(intel_dp_source_dsc_version_minor(display),
-		    intel_dp_sink_dsc_version_minor(connector->dp.dsc_dpcd));
-	if (vdsc_cfg->convert_rgb)
-		vdsc_cfg->convert_rgb =
-			connector->dp.dsc_dpcd[DP_DSC_DEC_COLOR_FORMAT_CAP - DP_DSC_SUPPORT] &
-			DP_DSC_RGB;
-
-	vdsc_cfg->line_buf_depth = min(INTEL_DP_DSC_MAX_LINE_BUF_DEPTH,
-				       drm_dp_dsc_sink_line_buf_depth(connector->dp.dsc_dpcd));
-	if (!vdsc_cfg->line_buf_depth) {
-		drm_dbg_kms(display->drm,
-			    "DSC Sink Line Buffer Depth invalid\n");
-		return -EINVAL;
-	}
+	if (connector->dp.pcon_dsc_passthrough) {
+		/*
+		 * For PCON passthrough the HDMI 2.1 sink decompresses, not the
+		 * PCON. The PCON dsc_dpcd fields reflect passthrough device
+		 * constraints and are not valid for configuring the source VDSC
+		 * engine. Use DSC 1.2 sink defaults instead.
+		 */
+		vdsc_cfg->dsc_version_major = 1;
+		vdsc_cfg->dsc_version_minor = min(intel_dp_source_dsc_version_minor(display), 2);
+		/* Only set convert_rgb for RGB output; leave unchanged for YCbCr */
+		if (vdsc_cfg->convert_rgb)
+			vdsc_cfg->convert_rgb =
+				(crtc_state->output_format == INTEL_OUTPUT_FORMAT_RGB);
+		vdsc_cfg->line_buf_depth = min(INTEL_DP_DSC_MAX_LINE_BUF_DEPTH, 13);
+		vdsc_cfg->block_pred_enable = true;
+	} else {
+		vdsc_cfg->dsc_version_major =
+			(connector->dp.dsc_dpcd[DP_DSC_REV - DP_DSC_SUPPORT] &
+			 DP_DSC_MAJOR_MASK) >> DP_DSC_MAJOR_SHIFT;
+		vdsc_cfg->dsc_version_minor =
+			min(intel_dp_source_dsc_version_minor(display),
+			    intel_dp_sink_dsc_version_minor(connector->dp.dsc_dpcd));
+		if (vdsc_cfg->convert_rgb) {
+			u8 color_fmt_cap =
+				connector->dp.dsc_dpcd[DP_DSC_DEC_COLOR_FORMAT_CAP -
+						       DP_DSC_SUPPORT];
+
+			vdsc_cfg->convert_rgb = color_fmt_cap & DP_DSC_RGB;
+		}
+
+		vdsc_cfg->line_buf_depth =
+			min(INTEL_DP_DSC_MAX_LINE_BUF_DEPTH,
+			    drm_dp_dsc_sink_line_buf_depth(connector->dp.dsc_dpcd));
+		if (!vdsc_cfg->line_buf_depth) {
+			drm_dbg_kms(display->drm,
+				    "DSC Sink Line Buffer Depth invalid\n");
+			return -EINVAL;
+		}
 
-	vdsc_cfg->block_pred_enable =
-		connector->dp.dsc_dpcd[DP_DSC_BLK_PREDICTION_SUPPORT - DP_DSC_SUPPORT] &
-		DP_DSC_BLK_PREDICTION_IS_SUPPORTED;
+		vdsc_cfg->block_pred_enable =
+			connector->dp.dsc_dpcd[DP_DSC_BLK_PREDICTION_SUPPORT - DP_DSC_SUPPORT] &
+			DP_DSC_BLK_PREDICTION_IS_SUPPORTED;
+	}
 
 	return drm_dsc_compute_rc_parameters(vdsc_cfg);
 }
@@ -2316,6 +2343,11 @@ void intel_dp_dsc_reset_config(struct intel_crtc_state *crtc_state)
 	memset(&crtc_state->dsc.config, 0, sizeof(crtc_state->dsc.config));
 }
 
+static bool intel_dp_pcon_passthrough_dsc_slice_config(struct intel_dp *intel_dp,
+						       const struct intel_connector *connector,
+						       const struct intel_crtc_state *crtc_state,
+						       struct intel_dsc_slice_config *config_ret);
+
 int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
 				struct intel_crtc_state *pipe_config,
 				struct drm_connector_state *conn_state,
@@ -2354,7 +2386,20 @@ int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
 		}
 	}
 
-	if (!intel_dp_dsc_get_slice_config(connector, adjusted_mode->crtc_clock,
+	if (connector->dp.pcon_dsc_passthrough) {
+		/*
+		 * PCON passthrough: no PCON encoder DPCD, derive slice config
+		 * from the downstream HDMI 2.1 sink DSC capabilities in EDID.
+		 */
+		if (!intel_dp_pcon_passthrough_dsc_slice_config(intel_dp,
+								connector,
+								pipe_config,
+								&pipe_config->dsc.slice_config)) {
+			drm_dbg_kms(display->drm,
+				    "PCON DSC passthrough: no valid slice config\n");
+			return -EINVAL;
+		}
+	} else if (!intel_dp_dsc_get_slice_config(connector, adjusted_mode->crtc_clock,
 					   adjusted_mode->crtc_hdisplay, num_joined_pipes,
 					   &pipe_config->dsc.slice_config))
 		return -EINVAL;
@@ -2485,10 +2530,27 @@ bool intel_dp_mode_valid_with_dsc(struct intel_connector *connector,
 							 num_joined_pipes,
 							 output_format,
 							 pipe_bpp, INT_MAX);
-	int dsc_slice_count = intel_dp_dsc_get_slice_count(connector,
-							   mode_clock,
-							   mode_hdisplay,
-							   num_joined_pipes);
+	int dsc_slice_count;
+
+	if (connector->dp.pcon_dsc_passthrough) {
+		/*
+		 * For PCON passthrough, use the HDMI sink EDID max_slices
+		 * capped by the PCON's own slice capability from dsc_dpcd.
+		 * If the PCON dsc_dpcd is all-zero, fall back to EDID only.
+		 */
+		const struct drm_display_info *info = &connector->base.display_info;
+		int pcon_max = drm_dp_dsc_sink_max_slice_count(connector->dp.dsc_dpcd,
+							       false);
+
+		dsc_slice_count = pcon_max ?
+			min_t(int, info->hdmi.dsc_cap.max_slices, pcon_max) :
+			info->hdmi.dsc_cap.max_slices;
+	} else {
+		dsc_slice_count = intel_dp_dsc_get_slice_count(connector,
+							       mode_clock,
+							       mode_hdisplay,
+							       num_joined_pipes);
+	}
 
 	if (min_bpp_x16 <= 0 || min_bpp_x16 > max_bpp_x16)
 		return false;
@@ -2683,8 +2745,33 @@ intel_dp_compute_config_limits(struct intel_dp *intel_dp,
 		return false;
 	}
 
-	if (dsc && !intel_dp_dsc_compute_pipe_bpp_limits(connector, limits))
-		return false;
+	if (dsc) {
+		if (connector->dp.pcon_dsc_passthrough) {
+			/*
+			 * PCON passthrough: PCON has no DSC encoder DPCD so
+			 * intel_dp_dsc_compute_pipe_bpp_limits() would see
+			 * all-zero dsc_dpcd and fail.  Use the downstream HDMI
+			 * sink DSC bpc cap to constrain the pipe bpp instead.
+			 */
+			const struct drm_display_info *info =
+				&connector->base.display_info;
+			u8 hdmi_max_bpc = info->hdmi.dsc_cap.bpc_supported ?: 8;
+			int dsc_min_bpc = intel_dp_dsc_min_src_input_bpc();
+			int dsc_max_bpc = min_t(int,
+						intel_dp_dsc_max_src_input_bpc(display),
+						hdmi_max_bpc);
+
+			limits->pipe.min_bpp = max(limits->pipe.min_bpp,
+						   dsc_min_bpc * 3);
+			limits->pipe.max_bpp = min(limits->pipe.max_bpp,
+						   dsc_max_bpc * 3);
+
+			if (limits->pipe.min_bpp > limits->pipe.max_bpp)
+				return false;
+		} else if (!intel_dp_dsc_compute_pipe_bpp_limits(connector, limits)) {
+			return false;
+		}
+	}
 
 	/*
 	 * crtc_state->pipe_bpp is the non-DP specific baseline (platform /
@@ -2697,7 +2784,7 @@ intel_dp_compute_config_limits(struct intel_dp *intel_dp,
 	 */
 	limits->pipe.max_bpp = clamp(crtc_state->pipe_bpp, limits->pipe.min_bpp,
 				     limits->pipe.max_bpp);
-	if (dsc)
+	if (dsc && !connector->dp.pcon_dsc_passthrough)
 		limits->pipe.max_bpp = align_max_sink_dsc_input_bpp(connector,
 								    limits->pipe.max_bpp);
 
@@ -3716,6 +3803,10 @@ intel_dp_sink_set_dsc_decompression(struct intel_connector *connector,
 {
 	struct intel_display *display = to_intel_display(connector);
 
+	/* PCON passthrough: PCON forwards the stream, sink decompresses. */
+	if (connector->dp.pcon_dsc_passthrough)
+		return;
+
 	if (write_dsc_decompression_flag(connector->dp.dsc_decompression_aux,
 					 DP_DECOMPRESSION_EN, enable) < 0)
 		drm_dbg_kms(display->drm,
@@ -3728,8 +3819,22 @@ intel_dp_sink_set_dsc_passthrough(const struct intel_connector *connector,
 				  bool enable)
 {
 	struct intel_display *display = to_intel_display(connector);
-	struct drm_dp_aux *aux = connector->mst.port ?
-				 connector->mst.port->passthrough_aux : NULL;
+	struct drm_dp_aux *aux = NULL;
+
+	if (connector->dp.pcon_dsc_passthrough) {
+		/*
+		 * HDMI 2.1 PCON passthrough: write DP_DSC_PASSTHROUGH_EN
+		 * directly to the PCON so it forwards the compressed stream
+		 * to the HDMI sink. For SST use the root port aux; for MST
+		 * use the MST port aux which routes via REMOTE_DPCD_WRITE.
+		 */
+		if (connector->mst.port)
+			aux = &connector->mst.port->aux;
+		else
+			aux = &intel_attached_dp((struct intel_connector *)connector)->aux;
+	} else if (connector->mst.port) {
+		aux = connector->mst.port->passthrough_aux;
+	}
 
 	if (!aux)
 		return;
@@ -3737,7 +3842,7 @@ intel_dp_sink_set_dsc_passthrough(const struct intel_connector *connector,
 	if (write_dsc_decompression_flag(aux,
 					 DP_DSC_PASSTHROUGH_EN, enable) < 0)
 		drm_dbg_kms(display->drm,
-			    "Failed to %s sink compression passthrough state\n",
+			    "Failed to %s DSC passthrough\n",
 			    str_enable_disable(enable));
 }
 
@@ -4259,6 +4364,112 @@ void intel_dp_check_frl_training(struct intel_dp *intel_dp)
 	}
 }
 
+/*
+ * intel_dp_pcon_set_dsc_passthrough_cap - cache PCON DSC passthrough capability
+ *
+ * Called once at connect time (from intel_dp_get_dsc_sink_cap()) after
+ * dsc_dpcd and the HDMI sink EDID have been read. Caches the result in
+ * connector->dp.pcon_dsc_passthrough so modeset paths can read it cheaply
+ * without repeating the DPCD and EDID lookups.
+ *
+ * A PCON supports DSC passthrough when it explicitly advertises
+ * DP_DSC_PASSTHROUGH_IS_SUPPORTED (DPCD 0x060 bit1) and the downstream
+ * HDMI 2.1 sink supports DSC 1.2. The compressed stream produced by the
+ * source VDSC engine is forwarded unchanged through the PCON to the HDMI
+ * sink for decompression (DP_DSC_ENABLE bit1 on the PCON).
+ */
+void
+intel_dp_pcon_set_dsc_passthrough_cap(struct intel_dp *intel_dp,
+				      struct intel_connector *connector)
+{
+	const struct drm_display_info *info = &connector->base.display_info;
+
+	connector->dp.pcon_dsc_passthrough = false;
+
+	/*
+	 * Check PCON HDMI 2.1 capability directly from this connector's
+	 * display_info so that MST connectors use their own EDID data
+	 * rather than intel_dp->attached_connector (the SST root connector).
+	 */
+	if (!drm_dp_is_branch(intel_dp->dpcd))
+		return;
+
+	if (!info->is_hdmi)
+		return;
+
+	if (!info->hdmi.max_frl_rate_per_lane)
+		return;
+
+	if (!(connector->dp.dsc_dpcd[0] & DP_DSC_PASSTHROUGH_IS_SUPPORTED))
+		return;
+
+	connector->dp.pcon_dsc_passthrough = info->hdmi.dsc_cap.v_1p2;
+}
+
+static bool
+intel_dp_pcon_passthrough_dsc_slice_config(struct intel_dp *intel_dp,
+					   const struct intel_connector *connector,
+					   const struct intel_crtc_state *crtc_state,
+					   struct intel_dsc_slice_config *config_ret)
+{
+	struct intel_display *display = to_intel_display(intel_dp);
+	const struct drm_display_info *info = &connector->base.display_info;
+	int num_joined_pipes = intel_crtc_num_joined_pipes(crtc_state);
+	int hdmi_throughput = info->hdmi.dsc_cap.clk_per_slice;
+	int hdmi_max_slices = info->hdmi.dsc_cap.max_slices;
+	/*
+	 * Use the PCON's own DSC passthrough capability (from its virtual
+	 * DPCD) as the source constraint, mirroring what
+	 * intel_dp_pcon_dsc_enc_slices() does for encoder mode. This handles
+	 * multi-hop topologies (e.g. MST hub -> PCON) where the intermediate
+	 * hub virtual DPCD may be more restrictive than the HDMI sink EDID.
+	 */
+	int pcon_max_slices = drm_dp_dsc_sink_max_slice_count(connector->dp.dsc_dpcd, false);
+	int target_slices;
+	int slices_per_pipe;
+
+	/*
+	 * src_max_slice_width: pass INT_MAX so the HDMI spec limit of 2720px
+	 * applies; the source VDSC HW limit (5120px) is not the binding constraint.
+	 * src_max_slices: use PCON dsc_dpcd slice capability as upper bound.
+	 */
+	target_slices = intel_hdmi_dsc_get_num_slices(&crtc_state->hw.adjusted_mode,
+						      crtc_state->output_format,
+						      pcon_max_slices, INT_MAX,
+						      hdmi_max_slices,
+						      hdmi_throughput);
+	if (!target_slices)
+		return false;
+
+	drm_dbg_kms(display->drm,
+		    "PCON DSC passthrough: target %d slices from HDMI sink EDID cap"
+		    " (max_slices=%d clk_per_slice=%d MHz)\n",
+		    target_slices, hdmi_max_slices, hdmi_throughput);
+
+	for (slices_per_pipe = 1; slices_per_pipe <= 4; slices_per_pipe++) {
+		struct intel_dsc_slice_config config;
+		int line_slices;
+
+		if (!intel_dsc_get_slice_config(display,
+						num_joined_pipes, slices_per_pipe,
+						&config))
+			continue;
+
+		line_slices = intel_dsc_line_slice_count(&config);
+		if (line_slices != target_slices)
+			continue;
+
+		/* Slice count must evenly divide the horizontal display width */
+		if (crtc_state->hw.adjusted_mode.hdisplay % line_slices)
+			continue;
+
+		*config_ret = config;
+		return true;
+	}
+
+	return false;
+}
+
 static int
 intel_dp_pcon_dsc_enc_slice_height(const struct intel_crtc_state *crtc_state)
 {
@@ -4510,6 +4721,7 @@ void intel_dp_get_dsc_sink_cap(u8 dpcd_rev,
 
 	memset(&connector->dp.dsc_branch_caps, 0, sizeof(connector->dp.dsc_branch_caps));
 	connector->dp.dsc_throughput_quirk = false;
+	connector->dp.pcon_dsc_passthrough = false;
 
 	if (dpcd_rev < DP_DPCD_REV_14)
 		return;
@@ -6148,6 +6360,12 @@ intel_dp_set_edid(struct intel_dp *intel_dp)
 	intel_dp_update_dfp(intel_dp, drm_edid);
 	intel_dp_update_420(intel_dp);
 
+	/*
+	 * Re-evaluate PCON DSC passthrough capability now that the EDID has
+	 * been parsed and display_info.hdmi.dsc_cap is up to date.
+	 */
+	intel_dp_pcon_set_dsc_passthrough_cap(intel_dp, connector);
+
 	drm_dp_cec_attach(&intel_dp->aux,
 			  connector->base.display_info.source_physical_address);
 }
@@ -6170,6 +6388,7 @@ intel_dp_unset_edid(struct intel_dp *intel_dp)
 
 	intel_dp->dfp.ycbcr_444_to_420 = false;
 	connector->base.ycbcr_420_allowed = false;
+	connector->dp.pcon_dsc_passthrough = false;
 
 	drm_connector_set_vrr_capable_property(&connector->base,
 					       false);
diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm/i915/display/intel_dp.h
index 04fae203b..42c2fb5c2 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.h
+++ b/drivers/gpu/drm/i915/display/intel_dp.h
@@ -187,6 +187,8 @@ void intel_dp_sync_state(struct intel_encoder *encoder,
 			 const struct intel_crtc_state *crtc_state);
 
 void intel_dp_check_frl_training(struct intel_dp *intel_dp);
+void intel_dp_pcon_set_dsc_passthrough_cap(struct intel_dp *intel_dp,
+					   struct intel_connector *connector);
 void intel_dp_pcon_dsc_configure(struct intel_dp *intel_dp,
 				 const struct intel_crtc_state *crtc_state);
 
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 6a869d0f6..d48fe87ce 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -1451,6 +1451,13 @@ static int mst_connector_get_ddc_modes(struct drm_connector *_connector)
 
 	ret = intel_connector_update_modes(&connector->base, drm_edid);
 
+	/*
+	 * Re-evaluate PCON DSC passthrough capability now that the MST
+	 * connector's EDID has been parsed and display_info.hdmi.dsc_cap
+	 * is populated.
+	 */
+	intel_dp_pcon_set_dsc_passthrough_cap(intel_dp, connector);
+
 	drm_edid_free(drm_edid);
 
 	if (intel_dp_tunnel_uhbr_lanes_wa_setup(intel_dp)) {
-- 
2.43.0

