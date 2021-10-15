Return-Path: <SRS0=ZLzJ=PD=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7F7FC433FE
	for <intel-gfx@archiver.kernel.org>; Fri, 15 Oct 2021 13:40:11 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 766C66115C
	for <intel-gfx@archiver.kernel.org>; Fri, 15 Oct 2021 13:40:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 766C66115C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBBE36EDB9;
	Fri, 15 Oct 2021 13:40:10 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 268B66EDAE
 for <intel-gfx@lists.freedesktop.org>; Fri, 15 Oct 2021 13:40:03 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10137"; a="314110980"
X-IronPort-AV: E=Sophos;i="5.85,375,1624345200"; d="scan'208";a="314110980"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2021 06:40:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,375,1624345200"; d="scan'208";a="492561109"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga008.jf.intel.com with SMTP; 15 Oct 2021 06:40:00 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 15 Oct 2021 16:39:59 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Fri, 15 Oct 2021 16:39:14 +0300
Message-Id: <20211015133921.4609-14-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211015133921.4609-1-ville.syrjala@linux.intel.com>
References: <20211015133921.4609-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 13/20] drm/i915/dp: Reorder
 intel_dp_compute_config() a bit
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

Consolidate the double pfit call, and reorder things so that
intel_dp_output_format() and intel_dp_compute_link_config() are
back-to-back. They are intimately related, and will need to be
called twice to properly handle the "4:2:0 also" modes.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 2440a6a2e4fc..de2b3d33a726 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1764,25 +1764,12 @@ intel_dp_compute_config(struct intel_encoder *encoder,
 	if (HAS_PCH_SPLIT(dev_priv) && !HAS_DDI(dev_priv) && encoder->port != PORT_A)
 		pipe_config->has_pch_encoder = true;
 
-	pipe_config->output_format = intel_dp_output_format(&intel_connector->base,
-							    adjusted_mode);
-
-	if (pipe_config->output_format == INTEL_OUTPUT_FORMAT_YCBCR420) {
-		ret = intel_panel_fitting(pipe_config, conn_state);
-		if (ret)
-			return ret;
-	}
-
 	pipe_config->has_audio = intel_dp_has_audio(encoder, pipe_config, conn_state);
 
 	if (intel_dp_is_edp(intel_dp) && intel_connector->panel.fixed_mode) {
 		ret = intel_panel_compute_config(intel_connector, adjusted_mode);
 		if (ret)
 			return ret;
-
-		ret = intel_panel_fitting(pipe_config, conn_state);
-		if (ret)
-			return ret;
 	}
 
 	if (adjusted_mode->flags & DRM_MODE_FLAG_DBLSCAN)
@@ -1798,10 +1785,20 @@ intel_dp_compute_config(struct intel_encoder *encoder,
 	if (intel_dp_hdisplay_bad(dev_priv, adjusted_mode->crtc_hdisplay))
 		return -EINVAL;
 
+	pipe_config->output_format = intel_dp_output_format(&intel_connector->base,
+							    adjusted_mode);
+
 	ret = intel_dp_compute_link_config(encoder, pipe_config, conn_state);
 	if (ret < 0)
 		return ret;
 
+	if ((intel_dp_is_edp(intel_dp) && intel_connector->panel.fixed_mode) ||
+	    pipe_config->output_format == INTEL_OUTPUT_FORMAT_YCBCR420) {
+		ret = intel_panel_fitting(pipe_config, conn_state);
+		if (ret)
+			return ret;
+	}
+
 	pipe_config->limited_color_range =
 		intel_dp_limited_color_range(pipe_config, conn_state);
 
-- 
2.32.0

