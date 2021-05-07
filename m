Return-Path: <SRS0=w1eM=KC=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FC26C433B4
	for <intel-gfx@archiver.kernel.org>; Fri,  7 May 2021 08:49:24 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25E3B613D8
	for <intel-gfx@archiver.kernel.org>; Fri,  7 May 2021 08:49:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 25E3B613D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tuxedocomputers.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F6C06EDE1;
	Fri,  7 May 2021 08:49:17 +0000 (UTC)
Received: from srv6.fidu.org (srv6.fidu.org [IPv6:2a01:4f8:231:de0::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E48D6EDD1;
 Fri,  7 May 2021 08:49:14 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by srv6.fidu.org (Postfix) with ESMTP id EC067C800B1;
 Fri,  7 May 2021 10:49:12 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at srv6.fidu.org
Received: from srv6.fidu.org ([127.0.0.1])
 by localhost (srv6.fidu.org [127.0.0.1]) (amavisd-new, port 10026)
 with LMTP id n7AsK4_NmcGt; Fri,  7 May 2021 10:49:12 +0200 (CEST)
Received: from wsembach-tuxedo.fritz.box
 (p200300E37f12F200FD3bB57523c33F70.dip0.t-ipconnect.de
 [IPv6:2003:e3:7f12:f200:fd3b:b575:23c3:3f70])
 (Authenticated sender: wse@tuxedocomputers.com)
 by srv6.fidu.org (Postfix) with ESMTPA id A512AC800AA;
 Fri,  7 May 2021 10:49:12 +0200 (CEST)
From: Werner Sembach <wse@tuxedocomputers.com>
To: ville.syrjala@linux.intel.com, airlied@linux.ie, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Date: Fri,  7 May 2021 10:49:02 +0200
Message-Id: <20210507084903.28877-3-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210507084903.28877-1-wse@tuxedocomputers.com>
References: <20210506172325.1995964-1-wse@tuxedocomputers.com>
 <20210507084903.28877-1-wse@tuxedocomputers.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v6 2/3] drm/i915/display: Restructure output
 format computation for better expandability
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
Cc: Werner Sembach <wse@tuxedocomputers.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Couples the decission between RGB and YCbCr420 mode and the check if the
port clock can archive the required frequency. Other checks and
configuration steps that where previously done in between can also be done
before or after.

This allows for are cleaner implementation of retrying different color
encodings.

A slight change in behaviour occurs with this patch: If YCbCr420 is not
allowed but display is YCbCr420 only it no longer fails, but just prints
an error and tries to fallback on RGB.

Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
---
 drivers/gpu/drm/i915/display/intel_hdmi.c | 65 ++++++++++++-----------
 1 file changed, 34 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index 576d3d910d06..9f3da72dabee 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -1999,29 +1999,6 @@ static bool hdmi_deep_color_possible(const struct intel_crtc_state *crtc_state,
 					      INTEL_OUTPUT_FORMAT_YCBCR420);
 }
 
-static int
-intel_hdmi_ycbcr420_config(struct intel_crtc_state *crtc_state,
-			   const struct drm_connector_state *conn_state)
-{
-	struct drm_connector *connector = conn_state->connector;
-	struct drm_i915_private *i915 = to_i915(connector->dev);
-	const struct drm_display_mode *adjusted_mode =
-		&crtc_state->hw.adjusted_mode;
-
-	if (!drm_mode_is_420_only(&connector->display_info, adjusted_mode))
-		return 0;
-
-	if (!connector->ycbcr_420_allowed) {
-		drm_err(&i915->drm,
-			"Platform doesn't support YCBCR420 output\n");
-		return -EINVAL;
-	}
-
-	crtc_state->output_format = INTEL_OUTPUT_FORMAT_YCBCR420;
-
-	return intel_pch_panel_fitting(crtc_state, conn_state);
-}
-
 static int intel_hdmi_compute_bpc(struct intel_encoder *encoder,
 				  struct intel_crtc_state *crtc_state,
 				  int clock)
@@ -2128,6 +2105,30 @@ static bool intel_hdmi_has_audio(struct intel_encoder *encoder,
 		return intel_conn_state->force_audio == HDMI_AUDIO_ON;
 }
 
+static int intel_hdmi_compute_output_format(struct intel_encoder *encoder,
+					    struct intel_crtc_state *crtc_state,
+					    const struct drm_connector_state *conn_state)
+{
+	struct drm_connector *connector = conn_state->connector;
+	struct drm_i915_private *i915 = to_i915(connector->dev);
+	const struct drm_display_mode *adjusted_mode = &crtc_state->hw.adjusted_mode;
+	int ret;
+	bool ycbcr_420_only;
+
+	ycbcr_420_only = drm_mode_is_420_only(&connector->display_info, adjusted_mode);
+	if (connector->ycbcr_420_allowed && ycbcr_420_only) {
+		crtc_state->output_format = INTEL_OUTPUT_FORMAT_YCBCR420;
+	} else {
+		if (!connector->ycbcr_420_allowed && ycbcr_420_only)
+			drm_err(&i915->drm, "Display only supports YCbCr420 output, but connector does not allow it. Fallback to RGB, but this will likely fail.\n");
+		crtc_state->output_format = INTEL_OUTPUT_FORMAT_RGB;
+	}
+
+	ret = intel_hdmi_compute_clock(encoder, crtc_state);
+
+	return ret;
+}
+
 int intel_hdmi_compute_config(struct intel_encoder *encoder,
 			      struct intel_crtc_state *pipe_config,
 			      struct drm_connector_state *conn_state)
@@ -2152,23 +2153,25 @@ int intel_hdmi_compute_config(struct intel_encoder *encoder,
 	if (adjusted_mode->flags & DRM_MODE_FLAG_DBLCLK)
 		pipe_config->pixel_multiplier = 2;
 
-	ret = intel_hdmi_ycbcr420_config(pipe_config, conn_state);
-	if (ret)
-		return ret;
-
-	pipe_config->limited_color_range =
-		intel_hdmi_limited_color_range(pipe_config, conn_state);
-
 	if (HAS_PCH_SPLIT(dev_priv) && !HAS_DDI(dev_priv))
 		pipe_config->has_pch_encoder = true;
 
 	pipe_config->has_audio =
 		intel_hdmi_has_audio(encoder, pipe_config, conn_state);
 
-	ret = intel_hdmi_compute_clock(encoder, pipe_config);
+	ret = intel_hdmi_compute_output_format(encoder, pipe_config, conn_state);
 	if (ret)
 		return ret;
 
+	if (pipe_config->output_format == INTEL_OUTPUT_FORMAT_YCBCR420) {
+		ret = intel_pch_panel_fitting(pipe_config, conn_state);
+		if (ret)
+			return ret;
+	}
+
+	pipe_config->limited_color_range =
+		intel_hdmi_limited_color_range(pipe_config, conn_state);
+
 	if (conn_state->picture_aspect_ratio)
 		adjusted_mode->picture_aspect_ratio =
 			conn_state->picture_aspect_ratio;
-- 
2.25.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
