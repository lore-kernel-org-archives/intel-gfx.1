Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40653C79F99
	for <intel-gfx@archiver.kernel.org>; Sun,  6 Sep 2026 08:11:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A190110E012;
	Sun,  6 Sep 2026 08:11:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VSk9hhUR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A7F710E012
 for <intel-gfx@lists.freedesktop.org>; Sun,  6 Sep 2026 08:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788682275; x=1820218275;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Scj3OcvWU6LCSIEm2JhjCNhtiPnUNrJodMD8xuLPWpg=;
 b=VSk9hhURZbKgNv4ty3WC1fk+WEY/qrydKqv5crNOOiq1RYTm0l9csugb
 xijfBOiKsqHFGLFrk899T4m4CyuEa64kUY4RmZYiX2e8VUuVPci58VUTq
 3TpPfTjLUlA72L///U2f2cmSUHLdfHvlvWhQ4jFja+otuKcOsOtZ25Yyh
 ipVfiemeqQ0lYkEPs40hY+MG9TBFxuNULcww4fj4BgfmkFwXmFgn2jqqc
 7ZrC/CnFgjhjQ7L+vExR3Dm1xbYPtHhGdAQe7yTsVYYr6ygKrzlaU7QxR
 hUaRDD+ZMmBN+MT3gN+Fqvz9z0iXw67w4MgKIvvgCGJJlacVExGl16Mqf Q==;
X-CSE-ConnectionGUID: WfmnjMvFSyWi7FbV1WTPKA==
X-CSE-MsgGUID: aOdxMKu1RrmaHlX29Fzx5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11897"; a="89152996"
X-IronPort-AV: E=Sophos;i="6.25,265,1779174000"; d="scan'208";a="89152996"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2026 01:11:15 -0700
X-CSE-ConnectionGUID: l959U07MS+qSmZqZpsNn9A==
X-CSE-MsgGUID: R0bgWHMvRlmfZeoJRM/Yqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,265,1779174000"; d="scan'208";a="295310583"
Received: from xiaolu.sh.intel.com ([10.239.146.103])
 by fmviesa001.fm.intel.com with ESMTP; 06 Sep 2026 01:11:12 -0700
From: Xiao Lu <xiaolu.xie@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: jani.nikula@linux.intel.com, ville.syrjala@linux.intel.com,
 imre.deak@intel.com, ankit.k.nautiyal@intel.com,
 Xiao Lu <xiaolu.xie@intel.com>
Subject: [PATCH v3] drm/i915/dp: enable DSC passthrough for HDMI 2.1 PCON
 devices
Date: Sun,  6 Sep 2026 16:08:45 +0800
Message-ID: <20260906080845.1047081-1-xiaolu.xie@intel.com>
X-Mailer: git-send-email 2.43.0
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
  (DP_DSC_PASSTHROUGH_IS_SUPPORTED) combined with the downstream HDMI
  2.1 sink's DSC 1.2 support from EDID HF-VSDB. Cache the result in
  connector->dp.pcon_dsc_passthrough (same lifecycle as fec_capability
  and dsc_dpcd) to avoid repeated lookups on every modeset.

- Treat the PCON as DSC-capable in intel_dp_has_dsc() when passthrough
  is supported, allowing the normal DSC compute_config path to proceed.

- Derive DSC parameters (slice count, bpc limits) from the downstream
  HDMI sink's EDID DSC capabilities (dsc_cap.max_slices,
  dsc_cap.clk_per_slice, dsc_cap.bpc_supported) rather than from the
  PCON's DSC encoder DPCD (which is all-zero for passthrough-only PCONs).
  This ensures the source VDSC engine produces a stream the HDMI sink
  can actually decompress.

- Write DP_DSC_PASSTHROUGH_EN (0x160 bit1) to the PCON via
  intel_dp_sink_set_dsc_passthrough() on enable, and clear it on
  disable. The existing MST hub passthrough path in that function is
  preserved; the PCON case is handled by redirecting aux to
  intel_dp->aux when pcon_dsc_passthrough is set.

- Short-circuit intel_dp_sink_set_dsc_decompression() for PCON
  passthrough since the PCON itself does not decompress (the HDMI sink
  does); writing DP_DECOMPRESSION_EN to the PCON would be incorrect.

Tested with Parade PS196G (HW 0.2, SW 241.62) connected to a Lenovo
ThinkVision Pro 27UD-10 (HDMI 2.1, DSC 1.2, max 16 slices, 400 MHz/
slice). At 4K@240Hz DSC compression is required (10.5625 bpp, 8 slices);
driver now writes 0x160=0x02 explicitly and slice count is correctly
derived from the HDMI sink EDID rather than from PCON DPCD.

Signed-off-by: Xiao Lu <xiaolu.xie@intel.com>
---
v3: Restrict PCON DSC passthrough to SST direct connections only.
    In MST topologies the PCON is connected through an intermediate hub;
    passthrough is already handled separately via the MST hub path in
    intel_dp_sink_set_dsc_passthrough(), so skip it here by returning
    early when connector->mst.port is set.
    Fix intel_hdmi_dsc_get_num_slices() call to pass drm_display_mode *
    instead of intel_crtc_state * to match the updated function signature.

v2: Fix build failure on drm-tip - replace non-existent dsc.slice_count
    field with dsc.slice_config. Introduce
    intel_dp_pcon_passthrough_dsc_slice_config() which calls
    intel_hdmi_dsc_get_num_slices() for the target slice count then
    finds a matching intel_dsc_slice_config via intel_dsc_get_slice_config()
    to satisfy Intel VDSC HW constraints.
    Fix pcon_dsc_passthrough caching order: move
    intel_dp_pcon_set_dsc_passthrough_cap() from intel_dp_get_dsc_sink_cap()
    to intel_dp_set_edid() so it runs after EDID is parsed and
    display_info.hdmi.dsc_cap is populated. Also clear pcon_dsc_passthrough
    in intel_dp_unset_edid() to keep lifecycle consistent.
---
 .../drm/i915/display/intel_display_types.h    |   1 +
 drivers/gpu/drm/i915/display/intel_dp.c       | 182 +++++++++++++++++-
 2 files changed, 175 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index b7cc361fd955..3e7a362fd4dd 100644
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
index 113d767e62e9..92752a4da5a8 100644
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
@@ -2365,6 +2371,10 @@ void intel_dp_dsc_reset_config(struct intel_crtc_state *crtc_state)
 	memset(&crtc_state->dsc.config, 0, sizeof(crtc_state->dsc.config));
 }
 
+static bool intel_dp_pcon_passthrough_dsc_slice_config(struct intel_dp *intel_dp,
+						       const struct intel_crtc_state *crtc_state,
+						       struct intel_dsc_slice_config *config_ret);
+
 int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
 				struct intel_crtc_state *pipe_config,
 				struct drm_connector_state *conn_state,
@@ -2403,7 +2413,19 @@ int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
 		}
 	}
 
-	if (!intel_dp_dsc_get_slice_config(connector, adjusted_mode->crtc_clock,
+	if (intel_dp->attached_connector->dp.pcon_dsc_passthrough) {
+		/*
+		 * PCON passthrough: no PCON encoder DPCD, derive slice config
+		 * from the downstream HDMI 2.1 sink DSC capabilities in EDID.
+		 */
+		if (!intel_dp_pcon_passthrough_dsc_slice_config(intel_dp,
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
@@ -2732,8 +2754,33 @@ intel_dp_compute_config_limits(struct intel_dp *intel_dp,
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
@@ -3745,6 +3792,10 @@ intel_dp_sink_set_dsc_decompression(struct intel_connector *connector,
 {
 	struct intel_display *display = to_intel_display(connector);
 
+	/* PCON passthrough: PCON forwards the stream, sink decompresses. */
+	if (!connector->mst.dp && connector->dp.pcon_dsc_passthrough)
+		return;
+
 	if (write_dsc_decompression_flag(connector->dp.dsc_decompression_aux,
 					 DP_DECOMPRESSION_EN, enable) < 0)
 		drm_dbg_kms(display->drm,
@@ -3757,8 +3808,19 @@ intel_dp_sink_set_dsc_passthrough(const struct intel_connector *connector,
 				  bool enable)
 {
 	struct intel_display *display = to_intel_display(connector);
-	struct drm_dp_aux *aux = connector->mst.port ?
-				 connector->mst.port->passthrough_aux : NULL;
+	struct drm_dp_aux *aux = NULL;
+
+	if (!connector->mst.port) {
+		/*
+		 * HDMI 2.1 PCON passthrough: write DP_DSC_PASSTHROUGH_EN on
+		 * the PCON's own aux channel so it forwards the compressed
+		 * stream to the HDMI sink instead of decoding it.
+		 */
+		if (connector->dp.pcon_dsc_passthrough)
+			aux = &intel_attached_dp((struct intel_connector *)connector)->aux;
+	} else {
+		aux = connector->mst.port->passthrough_aux;
+	}
 
 	if (!aux)
 		return;
@@ -3766,7 +3828,7 @@ intel_dp_sink_set_dsc_passthrough(const struct intel_connector *connector,
 	if (write_dsc_decompression_flag(aux,
 					 DP_DSC_PASSTHROUGH_EN, enable) < 0)
 		drm_dbg_kms(display->drm,
-			    "Failed to %s sink compression passthrough state\n",
+			    "Failed to %s DSC passthrough\n",
 			    str_enable_disable(enable));
 }
 
@@ -4297,6 +4359,100 @@ void intel_dp_check_frl_training(struct intel_dp *intel_dp)
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
+static void
+intel_dp_pcon_set_dsc_passthrough_cap(struct intel_dp *intel_dp)
+{
+	struct intel_connector *connector = intel_dp->attached_connector;
+	const struct drm_display_info *info;
+
+	if (!connector)
+		return;
+
+	connector->dp.pcon_dsc_passthrough = false;
+
+	/*
+	 * PCON DSC passthrough is only supported for SST direct connections.
+	 * In MST topologies the intermediate hub may report incorrect virtual
+	 * DPCD for the downstream PCON port, leading to mismatched DSC
+	 * parameters.  Skip passthrough for MST until hub firmware correctly
+	 * reflects the PCON's capabilities.
+	 */
+	if (connector->mst.port)
+		return;
+
+	if (!intel_dp_is_hdmi_2_1_sink(intel_dp))
+		return;
+
+	if (!(connector->dp.dsc_dpcd[0] & DP_DSC_PASSTHROUGH_IS_SUPPORTED))
+		return;
+
+	info = &connector->base.display_info;
+	connector->dp.pcon_dsc_passthrough = info->hdmi.dsc_cap.v_1p2;
+}
+
+static bool
+intel_dp_pcon_passthrough_dsc_slice_config(struct intel_dp *intel_dp,
+					   const struct intel_crtc_state *crtc_state,
+					   struct intel_dsc_slice_config *config_ret)
+{
+	struct intel_display *display = to_intel_display(intel_dp);
+	struct intel_connector *connector = intel_dp->attached_connector;
+	const struct drm_display_info *info = &connector->base.display_info;
+	int num_joined_pipes = intel_crtc_num_joined_pipes(crtc_state);
+	int hdmi_throughput = info->hdmi.dsc_cap.clk_per_slice;
+	int hdmi_max_slices = info->hdmi.dsc_cap.max_slices;
+	int target_slices;
+	int slices_per_pipe;
+
+	/*
+	 * Derive the required slice count from the downstream HDMI 2.1 sink
+	 * DSC capabilities in EDID (not from the PCON encoder DPCD which is
+	 * all-zero for passthrough-only devices).
+	 */
+	target_slices = intel_hdmi_dsc_get_num_slices(&crtc_state->hw.adjusted_mode,
+						      hdmi_max_slices,
+						      crtc_state->hw.adjusted_mode.hdisplay,
+						      hdmi_max_slices,
+						      hdmi_throughput);
+	if (!target_slices)
+		return false;
+
+	drm_dbg_kms(display->drm,
+		     "PCON DSC passthrough: target %d slices from HDMI sink EDID cap"
+		     " (max_slices=%d clk_per_slice=%d MHz)\n",
+		     target_slices, hdmi_max_slices, hdmi_throughput);
+
+	for (slices_per_pipe = 1; slices_per_pipe <= 4; slices_per_pipe++) {
+		struct intel_dsc_slice_config config;
+
+		if (!intel_dsc_get_slice_config(display,
+						num_joined_pipes, slices_per_pipe,
+						&config))
+			continue;
+
+		if (intel_dsc_line_slice_count(&config) == target_slices) {
+			*config_ret = config;
+			return true;
+		}
+	}
+
+	return false;
+}
+
 static int
 intel_dp_pcon_dsc_enc_slice_height(const struct intel_crtc_state *crtc_state)
 {
@@ -4536,6 +4692,7 @@ void intel_dp_get_dsc_sink_cap(u8 dpcd_rev,
 
 	memset(&connector->dp.dsc_branch_caps, 0, sizeof(connector->dp.dsc_branch_caps));
 	connector->dp.dsc_throughput_quirk = false;
+	connector->dp.pcon_dsc_passthrough = false;
 
 	if (dpcd_rev < DP_DPCD_REV_14)
 		return;
@@ -4565,6 +4722,8 @@ void intel_dp_get_dsc_sink_cap(u8 dpcd_rev,
 	if (drm_dp_has_quirk(desc, DP_DPCD_QUIRK_DSC_THROUGHPUT_BPP_LIMIT) &&
 	    desc->ident.hw_rev == 0x10)
 		connector->dp.dsc_throughput_quirk = true;
+
+	intel_dp_pcon_set_dsc_passthrough_cap(intel_attached_dp(connector));
 }
 
 static void intel_edp_get_dsc_sink_cap(u8 edp_dpcd_rev, struct intel_connector *connector)
@@ -6161,6 +6320,12 @@ intel_dp_set_edid(struct intel_dp *intel_dp)
 	intel_dp_update_dfp(intel_dp, drm_edid);
 	intel_dp_update_420(intel_dp);
 
+	/*
+	 * Re-evaluate PCON DSC passthrough capability now that the EDID has
+	 * been parsed and display_info.hdmi.dsc_cap is up to date.
+	 */
+	intel_dp_pcon_set_dsc_passthrough_cap(intel_dp);
+
 	drm_dp_cec_attach(&intel_dp->aux,
 			  connector->base.display_info.source_physical_address);
 }
@@ -6183,6 +6348,7 @@ intel_dp_unset_edid(struct intel_dp *intel_dp)
 
 	intel_dp->dfp.ycbcr_444_to_420 = false;
 	connector->base.ycbcr_420_allowed = false;
+	connector->dp.pcon_dsc_passthrough = false;
 
 	drm_connector_set_vrr_capable_property(&connector->base,
 					       false);
-- 
2.43.0

