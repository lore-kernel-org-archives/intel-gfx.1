Return-Path: <SRS0=ZLzJ=PD=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29B29C433FE
	for <intel-gfx@archiver.kernel.org>; Fri, 15 Oct 2021 13:40:19 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E84E86115C
	for <intel-gfx@archiver.kernel.org>; Fri, 15 Oct 2021 13:40:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E84E86115C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFDA16E2EF;
	Fri, 15 Oct 2021 13:40:17 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C68816EDB4
 for <intel-gfx@lists.freedesktop.org>; Fri, 15 Oct 2021 13:40:09 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10137"; a="314110994"
X-IronPort-AV: E=Sophos;i="5.85,375,1624345200"; d="scan'208";a="314110994"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2021 06:40:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,375,1624345200"; d="scan'208";a="442524994"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga006.jf.intel.com with SMTP; 15 Oct 2021 06:40:06 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 15 Oct 2021 16:40:05 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Fri, 15 Oct 2021 16:39:16 +0300
Message-Id: <20211015133921.4609-16-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211015133921.4609-1-ville.syrjala@linux.intel.com>
References: <20211015133921.4609-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 15/20] drm/i915/dp: Make
 intel_dp_output_format() usable for "4:2:0 also" modes
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

Hoist the drm_mode_is_420_only() from intel_dp_output_format()
into the caller. This will allow intel_dp_output_format() to be
reused for "4:2:0 also" modes.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index d378aeee3287..ff2dc22966fa 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -712,13 +712,11 @@ static u8 intel_dp_dsc_get_slice_count(struct intel_dp *intel_dp,
 
 static enum intel_output_format
 intel_dp_output_format(struct intel_connector *connector,
-		       const struct drm_display_mode *mode)
+		       bool ycbcr_420_output)
 {
 	struct intel_dp *intel_dp = intel_attached_dp(connector);
-	const struct drm_display_info *info = &connector->base.display_info;
 
-	if (!connector->base.ycbcr_420_allowed ||
-	    !drm_mode_is_420_only(info, mode))
+	if (!connector->base.ycbcr_420_allowed || !ycbcr_420_output)
 		return INTEL_OUTPUT_FORMAT_RGB;
 
 	if (intel_dp->dfp.rgb_to_ycbcr &&
@@ -756,8 +754,9 @@ static int
 intel_dp_mode_min_output_bpp(struct intel_connector *connector,
 			     const struct drm_display_mode *mode)
 {
+	const struct drm_display_info *info = &connector->base.display_info;
 	enum intel_output_format output_format =
-		intel_dp_output_format(connector, mode);
+		intel_dp_output_format(connector, drm_mode_is_420_only(info, mode));
 
 	return intel_dp_output_bpp(output_format, intel_dp_min_bpp(output_format));
 }
@@ -1757,6 +1756,7 @@ intel_dp_compute_config(struct intel_encoder *encoder,
 	struct drm_display_mode *adjusted_mode = &pipe_config->hw.adjusted_mode;
 	struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
 	struct intel_connector *connector = intel_dp->attached_connector;
+	const struct drm_display_info *info = &connector->base.display_info;
 	bool constant_n = drm_dp_has_quirk(&intel_dp->desc, DP_DPCD_QUIRK_CONSTANT_N);
 	int ret = 0, output_bpp;
 
@@ -1784,7 +1784,8 @@ intel_dp_compute_config(struct intel_encoder *encoder,
 	if (intel_dp_hdisplay_bad(dev_priv, adjusted_mode->crtc_hdisplay))
 		return -EINVAL;
 
-	pipe_config->output_format = intel_dp_output_format(connector, adjusted_mode);
+	pipe_config->output_format =
+		intel_dp_output_format(connector, drm_mode_is_420_only(info, adjusted_mode));
 
 	ret = intel_dp_compute_link_config(encoder, pipe_config, conn_state);
 	if (ret < 0)
-- 
2.32.0

