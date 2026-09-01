Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52123C624D4
	for <intel-gfx@archiver.kernel.org>; Tue,  1 Sep 2026 13:06:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD21310E32D;
	Tue,  1 Sep 2026 13:06:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cu7EbACZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A844610E32D
 for <intel-gfx@lists.freedesktop.org>; Tue,  1 Sep 2026 13:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788268005; x=1819804005;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TvK3mZiG39nFXXcgocZJ3zXajzHf4c/A4VcOfU5dy+E=;
 b=cu7EbACZLOwL+BHti9QJaBjLYMs4D1gQbeXkwCeHt7vhNlI3GAHoPr5O
 fUiHME1QiOAc+PK8rBcyDIwmFpACdO8HnzkU/4foNkWBSVTDvZgjof2iK
 hQTP99YIMbMftpUopMxuFV3nAp/5VQti75Y6Qa2W+3fi0Htr7iBKvKUHN
 l5M83EamVSrniwc/+BAq53hpqsOvI9LvdEd95JeL3YX8Z9bAR9BeJl6xm
 JOIhhYVfZmbJGnIWIr8W9LSM54RRZIXwBq+ByUcEQj4REjZxoaXCPJcRj
 S2A/JWWr98b+jsH3LvsWD4Q36bvqzRKR+kFt1eqngefzba0M+xulkyUFn A==;
X-CSE-ConnectionGUID: CLdsY2jSR9W8gsWO+vmUxQ==
X-CSE-MsgGUID: hk6aPiP5QkSgBTaFJdAtqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="88743519"
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; d="scan'208";a="88743519"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 06:06:44 -0700
X-CSE-ConnectionGUID: nwY/SYx9T82ep/o4r/YdKg==
X-CSE-MsgGUID: p8h4Hl8jSWqOawlVE+/5cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; d="scan'208";a="265856686"
Received: from xiaolu.sh.intel.com ([10.239.146.103])
 by fmviesa007.fm.intel.com with ESMTP; 01 Sep 2026 06:06:42 -0700
From: Xiao Lu <xiaolu.xie@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: jani.nikula@linux.intel.com, ville.syrjala@linux.intel.com,
 imre.deak@intel.com, xiaolu <xiaolu@intel.com>
Subject: [PATCH] drm/i915/display: send null DRM infoframe when ending HDR
 transmission
Date: Tue,  1 Sep 2026 21:04:15 +0800
Message-ID: <20260901130415.236800-1-xiaolu.xie@intel.com>
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

From: xiaolu <xiaolu@intel.com>

CTA-861-H requires that when a source ends Dynamic Range and Mastering
InfoFrame transmission, it shall send a DRM infoframe with EOTF=0 and
all metadata fields set to 0 for at least 2 seconds before stopping.

Currently, when transitioning from HDR to SDR, the driver abruptly
stops sending the DRM metadata SDP/infoframe. This causes DP-to-HDMI
converters to latch the previous HDR metadata and continue forwarding
it to the HDMI sink, resulting in color errors (e.g. oversaturated or
washed-out colors) on SDR content. Windows correctly implements the
null infoframe transition.

Fix both the DP and native HDMI paths to send a zeroed DRM infoframe
(EOTF=Traditional_SDR=0, all luminance and primaries fields zero) when
transitioning from HDR to SDR. The null packet is only sent when the
previous connector state had HDR metadata active, avoiding unnecessary
DRM infoframe transmission during normal SDR operation.

Signed-off-by: xiaolu <xiaolu@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c   | 23 ++++++++++++++++++++---
 drivers/gpu/drm/i915/display/intel_hdmi.c | 19 ++++++++++++++++++-
 2 files changed, 38 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 61ae83857cd6..8ff4aa2e6c0b 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -3219,14 +3219,29 @@ intel_dp_in_hdr_mode(const struct drm_connector_state *conn_state)
 static void
 intel_dp_compute_hdr_metadata_infoframe_sdp(struct intel_dp *intel_dp,
 					    struct intel_crtc_state *crtc_state,
-					    const struct drm_connector_state *conn_state)
+					    const struct drm_connector_state *conn_state,
+					    const struct drm_connector_state *old_conn_state)
 {
 	struct intel_display *display = to_intel_display(intel_dp);
 	int ret;
 	struct hdmi_drm_infoframe *drm_infoframe = &crtc_state->infoframes.drm.drm;
 
-	if (!conn_state->hdr_output_metadata)
+	if (!conn_state->hdr_output_metadata) {
+		/*
+		 * CTA-861-H requires ending HDR metadata transmission by
+		 * sending a DRM infoframe with EOTF=0 and all fields zero
+		 * for at least 2 seconds, rather than abruptly stopping.
+		 * Abruptly stopping causes DP-to-HDMI converters to latch
+		 * the previous HDR metadata and forward it to the HDMI sink,
+		 * resulting in color errors on SDR content.
+		 */
+		if (old_conn_state && old_conn_state->hdr_output_metadata) {
+			hdmi_drm_infoframe_init(drm_infoframe);
+			crtc_state->infoframes.enable |=
+				intel_hdmi_infoframe_enable(HDMI_PACKET_TYPE_GAMUT_METADATA);
+		}
 		return;
+	}
 
 	ret = drm_hdmi_infoframe_set_hdr_metadata(drm_infoframe, conn_state);
 
@@ -3632,7 +3647,9 @@ intel_dp_compute_config(struct intel_atomic_state *state,
 	intel_alpm_lobf_compute_config(intel_dp, pipe_config, conn_state);
 	intel_dp_drrs_compute_config(connector, pipe_config, link_bpp_x16);
 	intel_dp_compute_vsc_sdp(intel_dp, pipe_config, conn_state);
-	intel_dp_compute_hdr_metadata_infoframe_sdp(intel_dp, pipe_config, conn_state);
+	intel_dp_compute_hdr_metadata_infoframe_sdp(intel_dp, pipe_config, conn_state,
+						    drm_atomic_get_old_connector_state(&state->base,
+										      conn_state->connector));
 
 	return intel_dp_tunnel_atomic_compute_stream_bw(state, intel_dp, connector,
 							pipe_config);
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index 8a019d3574df..9fb9be302d35 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -856,8 +856,25 @@ intel_hdmi_compute_drm_infoframe(struct intel_encoder *encoder,
 	if (!crtc_state->has_infoframe)
 		return true;
 
-	if (!conn_state->hdr_output_metadata)
+	if (!conn_state->hdr_output_metadata) {
+		const struct drm_connector_state *old_conn_state =
+			drm_atomic_get_old_connector_state(conn_state->state,
+							   conn_state->connector);
+		/*
+		 * CTA-861-H requires ending HDR metadata transmission by
+		 * sending a DRM infoframe with EOTF=0 and all fields zero
+		 * for at least 2 seconds, rather than abruptly stopping.
+		 * Abruptly stopping causes DP-to-HDMI converters to latch
+		 * the previous HDR metadata and forward it to the HDMI sink,
+		 * resulting in color errors on SDR content.
+		 */
+		if (old_conn_state && old_conn_state->hdr_output_metadata) {
+			hdmi_drm_infoframe_init(frame);
+			crtc_state->infoframes.enable |=
+				intel_hdmi_infoframe_enable(HDMI_INFOFRAME_TYPE_DRM);
+		}
 		return true;
+	}
 
 	crtc_state->infoframes.enable |=
 		intel_hdmi_infoframe_enable(HDMI_INFOFRAME_TYPE_DRM);
-- 
2.43.0

