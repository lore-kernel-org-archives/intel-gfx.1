Return-Path: <SRS0=zhYU=GO=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34524C433E6
	for <intel-gfx@archiver.kernel.org>; Mon, 11 Jan 2021 08:26:32 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E33C0216C4
	for <intel-gfx@archiver.kernel.org>; Mon, 11 Jan 2021 08:26:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E33C0216C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6802689F07;
	Mon, 11 Jan 2021 08:26:31 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C00389F07;
 Mon, 11 Jan 2021 08:26:30 +0000 (UTC)
IronPort-SDR: l09O4YD3OEAGaZ/H3pRW/rbE1iJqxk2+9HhsNDdfFhHnKwWo7e4W0HeSpSQiyEP3yeeOYQjQXd
 DugwoAyx9NeQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9860"; a="177046118"
X-IronPort-AV: E=Sophos;i="5.79,338,1602572400"; d="scan'208";a="177046118"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2021 00:26:30 -0800
IronPort-SDR: PcXDDtYj4qcYgf4kWAf7z5fEHy2albck0ljh9B3B6Q1AfNgxZcJNNee9kIy3WiDJFSbyDTUOGF
 MCWsBkJnpSeg==
X-IronPort-AV: E=Sophos;i="5.79,338,1602572400"; d="scan'208";a="464093998"
Received: from unknown (HELO genxfsim-desktop.iind.intel.com) ([10.223.74.179])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2021 00:26:26 -0800
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Date: Mon, 11 Jan 2021 13:41:06 +0530
Message-Id: <20210111081120.28417-6-anshuman.gupta@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210111081120.28417-1-anshuman.gupta@intel.com>
References: <20210111081120.28417-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v9 05/19] drm/i915/hdcp: DP MST transcoder for
 link and stream
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
Cc: jani.nikula@intel.com, seanpaul@chromium.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Gen12 has H/W delta with respect to HDCP{1.x,2.x} display engine
instances lies in Transcoder instead of DDI as in Gen11.

This requires hdcp driver to use mst_master_transcoder for link
authentication and stream transcoder for stream encryption
separately.

This will be used for both HDCP 1.4 and HDCP 2.2 over DP MST
on Gen12.

Cc: Ramalingam C <ramalingam.c@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
Reviewed-by: Ramalingam C <ramalingam.c@intel.com>
Tested-by: Karthik B S <karthik.b.s@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c          |  2 +-
 .../gpu/drm/i915/display/intel_display_types.h    |  2 ++
 drivers/gpu/drm/i915/display/intel_dp_mst.c       |  2 +-
 drivers/gpu/drm/i915/display/intel_hdcp.c         | 15 +++++++++++----
 drivers/gpu/drm/i915/display/intel_hdcp.h         |  2 +-
 5 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 6863236df1d0..14c2c0a15464 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -4252,7 +4252,7 @@ static void intel_enable_ddi(struct intel_atomic_state *state,
 	if (conn_state->content_protection ==
 	    DRM_MODE_CONTENT_PROTECTION_DESIRED)
 		intel_hdcp_enable(to_intel_connector(conn_state->connector),
-				  crtc_state->cpu_transcoder,
+				  crtc_state,
 				  (u8)conn_state->hdcp_content_type);
 }
 
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 5bc5bfbc4551..729a9792051f 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -436,6 +436,8 @@ struct intel_hdcp {
 	 * Hence caching the transcoder here.
 	 */
 	enum transcoder cpu_transcoder;
+	/* Only used for DP MST stream encryption */
+	enum transcoder stream_transcoder;
 };
 
 struct intel_connector {
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 27f04aed8764..47beb442094f 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -569,7 +569,7 @@ static void intel_mst_enable_dp(struct intel_atomic_state *state,
 	if (conn_state->content_protection ==
 	    DRM_MODE_CONTENT_PROTECTION_DESIRED)
 		intel_hdcp_enable(to_intel_connector(conn_state->connector),
-				  pipe_config->cpu_transcoder,
+				  pipe_config,
 				  (u8)conn_state->hdcp_content_type);
 }
 
diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
index 7d63e9495956..293f72d1d215 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
@@ -2095,7 +2095,7 @@ int intel_hdcp_init(struct intel_connector *connector,
 }
 
 int intel_hdcp_enable(struct intel_connector *connector,
-		      enum transcoder cpu_transcoder, u8 content_type)
+		      const struct intel_crtc_state *pipe_config, u8 content_type)
 {
 	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
 	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
@@ -2117,10 +2117,17 @@ int intel_hdcp_enable(struct intel_connector *connector,
 	drm_WARN_ON(&dev_priv->drm,
 		    hdcp->value == DRM_MODE_CONTENT_PROTECTION_ENABLED);
 	hdcp->content_type = content_type;
-	hdcp->cpu_transcoder = cpu_transcoder;
+
+	if (intel_crtc_has_type(pipe_config, INTEL_OUTPUT_DP_MST)) {
+		hdcp->cpu_transcoder = pipe_config->mst_master_transcoder;
+		hdcp->stream_transcoder = pipe_config->cpu_transcoder;
+	} else {
+		hdcp->cpu_transcoder = pipe_config->cpu_transcoder;
+		hdcp->stream_transcoder = INVALID_TRANSCODER;
+	}
 
 	if (INTEL_GEN(dev_priv) >= 12)
-		hdcp->port_data.fw_tc = intel_get_mei_fw_tc(cpu_transcoder);
+		hdcp->port_data.fw_tc = intel_get_mei_fw_tc(hdcp->cpu_transcoder);
 
 	/*
 	 * Considering that HDCP2.2 is more secure than HDCP1.4, If the setup
@@ -2240,7 +2247,7 @@ void intel_hdcp_update_pipe(struct intel_atomic_state *state,
 
 	if (desired_and_not_enabled || content_protection_type_changed)
 		intel_hdcp_enable(connector,
-				  crtc_state->cpu_transcoder,
+				  crtc_state,
 				  (u8)conn_state->hdcp_content_type);
 }
 
diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.h b/drivers/gpu/drm/i915/display/intel_hdcp.h
index 1bbf5b67ed0a..bc51c1e9b481 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.h
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.h
@@ -25,7 +25,7 @@ void intel_hdcp_atomic_check(struct drm_connector *connector,
 int intel_hdcp_init(struct intel_connector *connector, enum port port,
 		    const struct intel_hdcp_shim *hdcp_shim);
 int intel_hdcp_enable(struct intel_connector *connector,
-		      enum transcoder cpu_transcoder, u8 content_type);
+		      const struct intel_crtc_state *pipe_config, u8 content_type);
 int intel_hdcp_disable(struct intel_connector *connector);
 void intel_hdcp_update_pipe(struct intel_atomic_state *state,
 			    struct intel_encoder *encoder,
-- 
2.26.2

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
