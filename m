Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9618CC61DD3
	for <intel-gfx@archiver.kernel.org>; Tue,  1 Sep 2026 13:28:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13D5510ECF7;
	Tue,  1 Sep 2026 13:28:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WaNdsjEe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C24DB10ECF7
 for <intel-gfx@lists.freedesktop.org>; Tue,  1 Sep 2026 13:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788269311; x=1819805311;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=D6U341jmwbw35ovSFDoCXlFt4c0ILdjUyh2PmDgSrtY=;
 b=WaNdsjEe4k4mpPZH3oZiysaWRTYiUqiCARWPmQu/BEBpsLSRRMZpOytE
 6pmO96AT2EAvpmfjuEZpIofs4G7q45XRBTCyQk7/PC7/AnAIqGbvNiYrQ
 h153pW/6A8W0hL6F3v98lmvflmOVFGTBBkH9i8yAFQOk1oMVX/YBGeREq
 t+g+TusoVOgSFlLEScwKkfRdasb/7yKDYdU5SjyMPN5O1xOAnBRxnrK9R
 ltznUa+LyIgejjwdKeU9f7pkO1IhxajwNABQEJAtE3DCfkGS90/6JLmoI
 bpvFP1LO4f21RIJdIDqaq6kNV4eb6K/0iuWhQ1YuUunqh10YEscn6zQSg Q==;
X-CSE-ConnectionGUID: /5jn3STXTsKT/dv5ocfKeA==
X-CSE-MsgGUID: VJnFeHRYRGuvPmFp4du2fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="99032648"
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; d="scan'208";a="99032648"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 06:28:30 -0700
X-CSE-ConnectionGUID: XxmorwMQTKunOWuZTnrgLQ==
X-CSE-MsgGUID: aQl7S1lPT2+bZHgihdntqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; d="scan'208";a="273272194"
Received: from xiaolu.sh.intel.com ([10.239.146.103])
 by orviesa005.jf.intel.com with ESMTP; 01 Sep 2026 06:28:29 -0700
From: Xiao Lu <xiaolu.xie@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: jani.nikula@linux.intel.com, ville.syrjala@linux.intel.com,
 imre.deak@intel.com, Xiao Lu <xiaolu.xie@intel.com>
Subject: [PATCH] drm/i915/display: Enable VRR/HDR over MST
Date: Tue,  1 Sep 2026 21:26:01 +0800
Message-ID: <20260901132601.239131-1-xiaolu.xie@intel.com>
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

VRR over MST:
- Remove the hard MST block in intel_vrr_is_capable(); check the
  downstream port's MSA timing par ignore capability via REMOTE_DPCD_READ
  and cache it in connector->dp.mst_msa_timing_par_ignore to avoid hot
  path sideband round-trips.
- Attach vrr_capable property to MST connectors and update it after EDID
  read; enable AS-SDP computation and transmission for MST streams.

HDR metadata over MST:
- Add VSC SDP, HDR metadata infoframe SDP and AS-SDP computation to
  mst_stream_compute_config() and enable their transmission in
  mst_stream_enable() and intel_ddi_update_pipe().
- Lift the hard 8bpc pipe_bpp cap and use the bpp capability from sink EDID
  for MST streams to allow 10bpc, relying on
  intel_dp_mst_atomic_check_link()'s BW retry loop to fall back if the
  link cannot fit it.
Signed-off-by: Xiao Lu <xiaolu.xie@intel.com>
---
 drivers/gpu/drm/display/drm_dp_mst_topology.c |  2 +
 drivers/gpu/drm/i915/display/intel_ddi.c      |  3 +
 .../drm/i915/display/intel_display_types.h    |  1 +
 drivers/gpu/drm/i915/display/intel_dp.c       | 23 ++++---
 drivers/gpu/drm/i915/display/intel_dp.h       |  8 +++
 drivers/gpu/drm/i915/display/intel_dp_mst.c   | 65 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_vrr.c      | 23 ++++++-
 7 files changed, 113 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index 7ce9e212770a..174fa62cb0dc 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -2164,6 +2164,7 @@ ssize_t drm_dp_mst_dpcd_read(struct drm_dp_aux *aux,
 	return drm_dp_send_dpcd_read(port->mgr, port,
 				     offset, size, buffer);
 }
+EXPORT_SYMBOL(drm_dp_mst_dpcd_read);
 
 /**
  * drm_dp_mst_dpcd_write() - write a series of bytes to the DPCD via sideband
@@ -2187,6 +2188,7 @@ ssize_t drm_dp_mst_dpcd_write(struct drm_dp_aux *aux,
 	return drm_dp_send_dpcd_write(port->mgr, port,
 				      offset, size, buffer);
 }
+EXPORT_SYMBOL(drm_dp_mst_dpcd_write);
 
 static int drm_dp_check_mstb_guid(struct drm_dp_mst_branch *mstb, guid_t *guid)
 {
diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 2b7eb010511b..09e8a7335a05 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -3649,6 +3649,9 @@ void intel_ddi_update_pipe(struct intel_atomic_state *state,
 		intel_ddi_update_pipe_dp(state, encoder, crtc_state,
 					 conn_state);
 
+	if (intel_encoder_is_mst(encoder))
+		intel_dp_set_infoframes(encoder, true, crtc_state, conn_state);
+
 	if (intel_crtc_has_type(crtc_state, INTEL_OUTPUT_HDMI))
 		intel_ddi_update_pipe_hdmi(encoder, crtc_state,
 					   conn_state);
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index adde53dc9dce..246a2c05efc2 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -564,6 +564,7 @@ struct intel_connector {
 		u8 dsc_hblank_expansion_quirk:1;
 		u8 dsc_throughput_quirk:1;
 		u8 dsc_decompression_enabled:1;
+		u8 mst_msa_timing_par_ignore:1; /* cached from MST virtual DPCD 0x007 */
 
 		struct {
 			struct {
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 61ae83857cd6..52d5c09a608c 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -2682,15 +2682,18 @@ intel_dp_compute_config_limits(struct intel_dp *intel_dp,
 
 	limits->pipe.min_bpp = intel_dp_min_bpp(crtc_state->output_format);
 	if (is_mst) {
+		struct intel_connector *mst_connector =
+			to_intel_connector(conn_state->connector);
+		int sink_bpc = mst_connector->base.display_info.bpc ?: 8;
+
 		/*
-		 * FIXME: If all the streams can't fit into the link with their
-		 * current pipe_bpp we should reduce pipe_bpp across the board
-		 * until things start to fit. Until then we limit to <= 8bpc
-		 * since that's what was hardcoded for all MST streams
-		 * previously. This hack should be removed once we have the
-		 * proper retry logic in place.
+		 * For MST streams, use the sink's EDID-reported color depth
+		 * as the max bpp, rather than the pipe_bpp from a previous
+		 * modeset (which may be stale) or a hardcoded 8bpc cap.
+		 * The BW retry loop in intel_dp_mst_atomic_check_link() will
+		 * reduce bpp if the aggregate link bandwidth is insufficient.
 		 */
-		limits->pipe.max_bpp = min(crtc_state->max_pipe_bpp, 24);
+		limits->pipe.max_bpp = sink_bpc * 3;
 	} else {
 		limits->pipe.max_bpp = intel_dp_max_bpp(intel_dp, crtc_state,
 							respect_downstream_limits);
@@ -3105,7 +3108,7 @@ static bool intel_dp_needs_as_sdp(struct intel_dp *intel_dp,
 	return intel_vrr_possible(crtc_state);
 }
 
-static void intel_dp_compute_as_sdp(struct intel_dp *intel_dp,
+void intel_dp_compute_as_sdp(struct intel_dp *intel_dp,
 				    struct intel_crtc_state *crtc_state)
 {
 	struct drm_dp_as_sdp *as_sdp = &crtc_state->infoframes.as_sdp;
@@ -3155,7 +3158,7 @@ static void intel_dp_compute_as_sdp(struct intel_dp *intel_dp,
 		as_sdp->coasting_vtotal = crtc_state->vrr.vmax;
 }
 
-static void intel_dp_compute_vsc_sdp(struct intel_dp *intel_dp,
+void intel_dp_compute_vsc_sdp(struct intel_dp *intel_dp,
 				     struct intel_crtc_state *crtc_state,
 				     const struct drm_connector_state *conn_state)
 {
@@ -3216,7 +3219,7 @@ intel_dp_in_hdr_mode(const struct drm_connector_state *conn_state)
 	return hdr_metadata->hdmi_metadata_type1.eotf == HDMI_EOTF_SMPTE_ST2084;
 }
 
-static void
+void
 intel_dp_compute_hdr_metadata_infoframe_sdp(struct intel_dp *intel_dp,
 					    struct intel_crtc_state *crtc_state,
 					    const struct drm_connector_state *conn_state)
diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm/i915/display/intel_dp.h
index 0ec519fa1236..0b01634d907c 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.h
+++ b/drivers/gpu/drm/i915/display/intel_dp.h
@@ -77,6 +77,8 @@ int intel_dp_compute_config(struct intel_atomic_state *state,
 			    struct intel_encoder *encoder,
 			    struct intel_crtc_state *pipe_config,
 			    struct drm_connector_state *conn_state);
+void intel_dp_compute_as_sdp(struct intel_dp *intel_dp,
+				    struct intel_crtc_state *crtc_state);
 bool intel_dp_needs_8b10b_fec(const struct intel_crtc_state *crtc_state,
 			      bool dsc_enabled_on_crtc);
 void intel_dp_dsc_reset_config(struct intel_crtc_state *crtc_state);
@@ -130,6 +132,12 @@ bool intel_dp_joiner_needs_dsc(struct intel_display *display,
 bool intel_dp_has_joiner(struct intel_dp *intel_dp);
 bool intel_dp_needs_vsc_sdp(const struct intel_crtc_state *crtc_state,
 			    const struct drm_connector_state *conn_state);
+void intel_dp_compute_vsc_sdp(struct intel_dp *intel_dp,
+			      struct intel_crtc_state *crtc_state,
+			      const struct drm_connector_state *conn_state);
+void intel_dp_compute_hdr_metadata_infoframe_sdp(struct intel_dp *intel_dp,
+					    struct intel_crtc_state *crtc_state,
+					    const struct drm_connector_state *conn_state);
 void intel_dp_set_infoframes(struct intel_encoder *encoder, bool enable,
 			     const struct intel_crtc_state *crtc_state,
 			     const struct drm_connector_state *conn_state);
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 7cbef16ab38b..173e91482f0a 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -793,6 +793,9 @@ static int mst_stream_compute_config(struct intel_atomic_state *state,
 			bxt_dpio_phy_calc_lane_lat_optim_mask(pipe_config->lane_count);
 
 	intel_vrr_compute_config(pipe_config, conn_state);
+	intel_dp_compute_as_sdp(intel_dp, pipe_config);
+	intel_dp_compute_vsc_sdp(intel_dp, pipe_config, conn_state);
+	intel_dp_compute_hdr_metadata_infoframe_sdp(intel_dp, pipe_config, conn_state);
 
 	intel_dp_audio_compute_config(encoder, pipe_config, conn_state);
 
@@ -1157,6 +1160,24 @@ static void mst_stream_post_disable(struct intel_atomic_state *state,
 	 * Power down mst path before disabling the port, otherwise we end
 	 * up getting interrupts from the sink upon detecting link loss.
 	 */
+	if (intel_vrr_is_capable(connector)) {
+		u8 val;
+		ssize_t ret;
+
+		ret = drm_dp_mst_dpcd_read(&connector->mst.port->aux,
+					   DP_DOWNSPREAD_CTRL, &val, 1);
+		if (ret < 0) {
+			drm_dbg_kms(display->drm,
+				    "[CONNECTOR:%d:%s] Failed to read DP_DOWNSPREAD_CTRL: %zd\n",
+				    connector->base.base.id,
+				    connector->base.name, ret);
+		} else {
+			val &= ~DP_MSA_TIMING_PAR_IGNORE_EN;
+			drm_dp_mst_dpcd_write(&connector->mst.port->aux,
+					      DP_DOWNSPREAD_CTRL, &val, 1);
+		}
+	}
+
 	drm_dp_send_power_updown_phy(&intel_dp->mst.mgr, connector->mst.port,
 				     false);
 
@@ -1274,6 +1295,24 @@ static void mst_stream_pre_enable(struct intel_atomic_state *state,
 
 	drm_dp_send_power_updown_phy(&intel_dp->mst.mgr, connector->mst.port, true);
 
+	if (intel_vrr_is_capable(connector)) {
+		u8 val;
+		ssize_t ret;
+
+		ret = drm_dp_mst_dpcd_read(&connector->mst.port->aux,
+					   DP_DOWNSPREAD_CTRL, &val, 1);
+		if (ret < 0) {
+			drm_dbg_kms(display->drm,
+				    "[CONNECTOR:%d:%s] Failed to read DP_DOWNSPREAD_CTRL: %zd\n",
+				    connector->base.base.id,
+				    connector->base.name, ret);
+		} else {
+			val |= DP_MSA_TIMING_PAR_IGNORE_EN;
+			drm_dp_mst_dpcd_write(&connector->mst.port->aux,
+					      DP_DOWNSPREAD_CTRL, &val, 1);
+		}
+	}
+
 	intel_dp_sink_enable_decompression(state, connector, pipe_config);
 
 	if (first_mst_stream) {
@@ -1397,6 +1436,8 @@ static void mst_stream_enable(struct intel_atomic_state *state,
 
 	intel_enable_transcoder(pipe_config);
 
+	intel_dp_set_infoframes(encoder, true, pipe_config, conn_state);
+
 	for_each_pipe_crtc_modeset_enable(display, pipe_crtc, pipe_config) {
 		const struct intel_crtc_state *pipe_crtc_state =
 			intel_atomic_get_new_crtc_state(state, pipe_crtc);
@@ -1451,6 +1492,15 @@ static int mst_connector_get_ddc_modes(struct drm_connector *_connector)
 
 	ret = intel_connector_update_modes(&connector->base, drm_edid);
 
+	if (HAS_VRR(display)) {
+		bool vrr_capable = intel_vrr_is_capable(connector);
+
+		drm_dbg_kms(display->drm, "[CONNECTOR:%d:%s] VRR capable: %s\n",
+			    connector->base.base.id, connector->base.name,
+			    str_yes_no(vrr_capable));
+		drm_connector_set_vrr_capable_property(&connector->base, vrr_capable);
+	}
+
 	drm_edid_free(drm_edid);
 
 	if (intel_dp_tunnel_uhbr_lanes_wa_setup(intel_dp)) {
@@ -1735,6 +1785,10 @@ static int mst_topology_add_connector_properties(struct intel_dp *intel_dp,
 
 	intel_attach_force_audio_property(&connector->base);
 	intel_attach_broadcast_rgb_property(&connector->base);
+	intel_attach_dp_colorspace_property(&connector->base);
+
+	if (intel_dp_has_gamut_metadata_dip(&dp_to_dig_port(intel_dp)->base))
+		drm_connector_attach_hdr_output_metadata_property(&connector->base);
 
 	/*
 	 * Reuse the prop from the SST connector because we're
@@ -1745,6 +1799,14 @@ static int mst_topology_add_connector_properties(struct intel_dp *intel_dp,
 	if (connector->base.max_bpc_property)
 		drm_connector_attach_max_bpc_property(&connector->base, 6, 12);
 
+	/*
+	 * Reuse the vrr_capable prop from the eDP connector (which is always
+	 * initialized during driver load before device registration), because
+	 * we're not allowed to create new props after device registration.
+	 */
+	if (HAS_VRR(display))
+		drm_connector_attach_vrr_capable_property(&connector->base);
+
 	return drm_connector_set_path_property(&connector->base, pathprop);
 }
 
@@ -1761,6 +1823,9 @@ intel_dp_mst_read_decompression_port_dsc_caps(struct intel_dp *intel_dp,
 	if (drm_dp_read_dpcd_caps(connector->dp.dsc_decompression_aux, dpcd_caps) < 0)
 		return;
 
+	connector->dp.mst_msa_timing_par_ignore =
+		drm_dp_sink_can_do_video_without_timing_msa(dpcd_caps);
+
 	if (drm_dp_read_desc(connector->dp.dsc_decompression_aux, &desc,
 			     drm_dp_is_branch(dpcd_caps)) < 0)
 		return;
diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index bffbdee76ee1..d7d4a23cdf74 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -54,8 +54,27 @@ bool intel_vrr_is_capable(struct intel_connector *connector)
 			return false;
 		fallthrough;
 	case DRM_MODE_CONNECTOR_DisplayPort:
-		if (connector->mst.dp)
-			return false;
+		if (connector->mst.dp) {
+			u8 dpcd[DP_RECEIVER_CAP_SIZE];
+
+			/*
+			 * Use cached MSA timing ignore capability from the DFP
+			 * sink's virtual DPCD, set during connector init.
+			 */
+			if (!connector->dp.mst_msa_timing_par_ignore)
+				return false;
+
+			/*
+			 * Also verify live via LCT=2 REMOTE_DPCD_READ to the
+			 * DFP sink's actual DPCD 0x007.
+			 */
+			if (drm_dp_read_dpcd_caps(&connector->mst.port->aux, dpcd) < 0)
+				return false;
+			if (!drm_dp_sink_can_do_video_without_timing_msa(dpcd))
+				return false;
+
+			break;
+		}
 		intel_dp = intel_attached_dp(connector);
 		/*
 		 * Among non-MST DP branch devices, only an HDMI 2.1 sink connected
-- 
2.43.0

