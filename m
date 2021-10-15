Return-Path: <SRS0=ZLzJ=PD=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CB73C433F5
	for <intel-gfx@archiver.kernel.org>; Fri, 15 Oct 2021 13:40:26 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3911B61151
	for <intel-gfx@archiver.kernel.org>; Fri, 15 Oct 2021 13:40:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3911B61151
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB72C6EDB4;
	Fri, 15 Oct 2021 13:40:25 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81D486EDB4
 for <intel-gfx@lists.freedesktop.org>; Fri, 15 Oct 2021 13:40:24 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10137"; a="225376628"
X-IronPort-AV: E=Sophos;i="5.85,375,1624345200"; d="scan'208";a="225376628"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2021 06:40:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,375,1624345200"; d="scan'208";a="571765548"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga002.fm.intel.com with SMTP; 15 Oct 2021 06:40:21 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 15 Oct 2021 16:40:21 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Uma Shankar <uma.shankar@intel.com>
Date: Fri, 15 Oct 2021 16:39:21 +0300
Message-Id: <20211015133921.4609-21-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211015133921.4609-1-ville.syrjala@linux.intel.com>
References: <20211015133921.4609-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 20/20] drm/i915/dp: Disable DFP RGB->YCbCr
 conversion for now
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

We lack sufficient state tracking to figure out whether
we want the DFP to perform the RGB->YCbCr conversion for us
or not. So currently we are blindly just enabling that all the
time when supported by the DFP. That is nonsense. So until
we imporve our state tracking for this just disable the feature.

Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 29b12456c461..3e2a29b589a9 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1107,6 +1107,7 @@ static bool intel_dp_supports_dsc(struct intel_dp *intel_dp,
 static bool intel_dp_is_ycbcr420(struct intel_dp *intel_dp,
 				 const struct intel_crtc_state *crtc_state)
 {
+	/* FIXME see intel_dp_update_420() regarding rgb_to_ycbcr */
 	return crtc_state->output_format == INTEL_OUTPUT_FORMAT_YCBCR420 ||
 		(crtc_state->output_format == INTEL_OUTPUT_FORMAT_YCBCR444 &&
 		 intel_dp->dfp.ycbcr_444_to_420);
@@ -2456,6 +2457,7 @@ void intel_dp_configure_protocol_converter(struct intel_dp *intel_dp,
 			    "Failed to %s protocol converter YCbCr 4:2:0 conversion mode\n",
 			    enabledisable(intel_dp->dfp.ycbcr_444_to_420));
 
+	/* FIXME see intel_dp_update_420() regarding rgb_to_ycbcr */
 	tmp = intel_dp->dfp.rgb_to_ycbcr ?
 		DP_CONVERSION_BT709_RGB_YCBCR_ENABLE : 0;
 
@@ -4261,6 +4263,14 @@ intel_dp_update_420(struct intel_dp *intel_dp)
 	rgb_to_ycbcr = drm_dp_downstream_rgb_to_ycbcr_conversion(intel_dp->dpcd,
 								 intel_dp->downstream_ports,
 								 DP_DS_HDMI_BT709_RGB_YCBCR_CONV);
+	/*
+	 * FIXME need to actually track whether we're really
+	 * going to be doing the RGB->YCbCr connversion or not.
+	 * We can't tell by simply looking at intel_dp->dfp.rgb_to_ycbcr.
+	 * Readout is going to annoying due to having to read that
+	 * state from external hardware that may vanish at any time :(
+	 */
+	rgb_to_ycbcr = false;
 
 	if (DISPLAY_VER(i915) >= 11) {
 		/* Let PCON convert from RGB->YCbCr if possible */
-- 
2.32.0

