Return-Path: <SRS0=ZLzJ=PD=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C75F9C433EF
	for <intel-gfx@archiver.kernel.org>; Fri, 15 Oct 2021 13:39:51 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8AEFC6115C
	for <intel-gfx@archiver.kernel.org>; Fri, 15 Oct 2021 13:39:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8AEFC6115C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01EA66EDA9;
	Fri, 15 Oct 2021 13:39:51 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E9C06EDA9
 for <intel-gfx@lists.freedesktop.org>; Fri, 15 Oct 2021 13:39:48 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10137"; a="228194568"
X-IronPort-AV: E=Sophos;i="5.85,375,1624345200"; d="scan'208";a="228194568"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2021 06:39:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,375,1624345200"; d="scan'208";a="564290410"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by FMSMGA003.fm.intel.com with SMTP; 15 Oct 2021 06:39:46 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 15 Oct 2021 16:39:45 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Fri, 15 Oct 2021 16:39:09 +0300
Message-Id: <20211015133921.4609-9-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211015133921.4609-1-ville.syrjala@linux.intel.com>
References: <20211015133921.4609-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 08/20] drm/i915/dp: Reuse intel_hdmi_tmds_clock()
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

Reuse intel_hdmi_tmds_clock() for DP->HDMI TMDS clock calculations.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c   | 20 +++++---------------
 drivers/gpu/drm/i915/display/intel_hdmi.c |  2 +-
 drivers/gpu/drm/i915/display/intel_hdmi.h |  1 +
 3 files changed, 7 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 5cc99ffc1841..45e4bf54e1de 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -814,9 +814,8 @@ intel_dp_mode_valid_downstream(struct intel_connector *connector,
 		return MODE_CLOCK_HIGH;
 
 	/* Assume 8bpc for the DP++/HDMI/DVI TMDS clock check */
-	tmds_clock = target_clock;
-	if (drm_mode_is_420_only(info, mode))
-		tmds_clock /= 2;
+	tmds_clock = intel_hdmi_tmds_clock(target_clock, 8,
+					   drm_mode_is_420_only(info, mode));
 
 	if (intel_dp->dfp.min_tmds_clock &&
 	    tmds_clock < intel_dp->dfp.min_tmds_clock)
@@ -1070,21 +1069,12 @@ static bool intel_dp_hdmi_ycbcr420(struct intel_dp *intel_dp,
 		 intel_dp->dfp.ycbcr_444_to_420);
 }
 
-static int intel_dp_hdmi_tmds_clock(struct intel_dp *intel_dp,
-				    const struct intel_crtc_state *crtc_state, int bpc)
-{
-	int clock = crtc_state->hw.adjusted_mode.crtc_clock * bpc / 8;
-
-	if (intel_dp_hdmi_ycbcr420(intel_dp, crtc_state))
-		clock /= 2;
-
-	return clock;
-}
-
 static bool intel_dp_hdmi_tmds_clock_valid(struct intel_dp *intel_dp,
 					   const struct intel_crtc_state *crtc_state, int bpc)
 {
-	int tmds_clock = intel_dp_hdmi_tmds_clock(intel_dp, crtc_state, bpc);
+	int clock = crtc_state->hw.adjusted_mode.crtc_clock;
+	int tmds_clock = intel_hdmi_tmds_clock(clock, bpc,
+					       intel_dp_hdmi_ycbcr420(intel_dp, crtc_state));
 
 	if (intel_dp->dfp.min_tmds_clock &&
 	    tmds_clock < intel_dp->dfp.min_tmds_clock)
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index c6586d10a9d0..f1d42279a2df 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -1868,7 +1868,7 @@ hdmi_port_clock_valid(struct intel_hdmi *hdmi,
 	return MODE_OK;
 }
 
-static int intel_hdmi_tmds_clock(int clock, int bpc, bool ycbcr420_output)
+int intel_hdmi_tmds_clock(int clock, int bpc, bool ycbcr420_output)
 {
 	/* YCBCR420 TMDS rate requirement is half the pixel clock */
 	if (ycbcr420_output)
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.h b/drivers/gpu/drm/i915/display/intel_hdmi.h
index ee144db67e66..d892cbff0da0 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.h
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.h
@@ -47,6 +47,7 @@ bool intel_hdmi_limited_color_range(const struct intel_crtc_state *crtc_state,
 				    const struct drm_connector_state *conn_state);
 bool intel_hdmi_bpc_possible(const struct intel_crtc_state *crtc_state,
 			     int bpc, bool has_hdmi_sink, bool ycbcr420_output);
+int intel_hdmi_tmds_clock(int clock, int bpc, bool ycbcr420_output);
 int intel_hdmi_dsc_get_bpp(int src_fractional_bpp, int slice_width,
 			   int num_slices, int output_format, bool hdmi_all_bpp,
 			   int hdmi_max_chunk_bytes);
-- 
2.32.0

