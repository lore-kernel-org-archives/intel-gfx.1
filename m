Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AEF2C433F5
	for <intel-gfx@archiver.kernel.org>; Wed, 23 Feb 2022 13:13:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77DA610F3AA;
	Wed, 23 Feb 2022 13:13:49 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E17B610F3AA
 for <intel-gfx@lists.freedesktop.org>; Wed, 23 Feb 2022 13:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645622027; x=1677158027;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uV2qryuw4V0YnQTtR5DNcQHZ/eXvZEnrXI/BseXrCSM=;
 b=OShE1bdAfQsW3Zme+waqja3ZBAstWVPor1ywVJWK+vAgXtMvVJ9lzK64
 sKQTuOI3nr5IVpcUTtagagZsuIHUpWHD1LiDFTSC4iNqvDTxNEIhyS45V
 /nk3OpoidLC4Uzeb1UTVXdyBiDek5u53KdzVX/TIFTfbnM+LyWdZAIgV4
 Av4psXhItLpC9a85uxB4IBXBiQ8uy1V0yH+ZM7dU1vXLqkzYziOobB69R
 YAQRFYyPj0HG82ajDs/kC6miaMUoULDKXJrAyQ/SpSUlS1qiDHETJe3oP
 nLKr9GQ7DgmqJhRtAbRNI6LQX+PyAXkMkO/ywlFHyUTZWVuWqQaPHYN8J Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="338395551"
X-IronPort-AV: E=Sophos;i="5.88,391,1635231600"; d="scan'208";a="338395551"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2022 05:13:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,391,1635231600"; d="scan'208";a="591697898"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.151])
 by fmsmga008.fm.intel.com with SMTP; 23 Feb 2022 05:13:43 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 23 Feb 2022 15:13:39 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Wed, 23 Feb 2022 15:13:09 +0200
Message-Id: <20220223131315.18016-8-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220223131315.18016-1-ville.syrjala@linux.intel.com>
References: <20220223131315.18016-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH v2 07/13] drm/i915: Extract
 intel_crtc_compute_pipe_src()
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

intel_crtc_compute_config() doesn't really tell a unified story.
Let's chunk it up into pieces. We'll start with
intel_crtc_compute_pipe_src().

Reviewed-by: Manasi Navare <manasi.d.navare@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 62 ++++++++++++--------
 1 file changed, 39 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 650577b5e1fc..111c2458dac2 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -2802,18 +2802,55 @@ static void intel_encoder_get_config(struct intel_encoder *encoder,
 	intel_crtc_readout_derived_state(crtc_state);
 }
 
+static int intel_crtc_compute_pipe_src(struct intel_crtc_state *crtc_state)
+{
+	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
+	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+
+	if (crtc_state->bigjoiner)
+		crtc_state->pipe_src_w /= 2;
+
+	/*
+	 * Pipe horizontal size must be even in:
+	 * - DVO ganged mode
+	 * - LVDS dual channel mode
+	 * - Double wide pipe
+	 */
+	if (crtc_state->pipe_src_w & 1) {
+		if (crtc_state->double_wide) {
+			drm_dbg_kms(&i915->drm,
+				    "[CRTC:%d:%s] Odd pipe source width not supported with double wide pipe\n",
+				    crtc->base.base.id, crtc->base.name);
+			return -EINVAL;
+		}
+
+		if (intel_crtc_has_type(crtc_state, INTEL_OUTPUT_LVDS) &&
+		    intel_is_dual_link_lvds(i915)) {
+			drm_dbg_kms(&i915->drm,
+				    "[CRTC:%d:%s] Odd pipe source width not supported with dual link LVDS\n",
+				    crtc->base.base.id, crtc->base.name);
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
 static int intel_crtc_compute_config(struct intel_crtc *crtc,
 				     struct intel_crtc_state *crtc_state)
 {
 	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
 	struct drm_display_mode *pipe_mode = &crtc_state->hw.pipe_mode;
 	int clock_limit = i915->max_dotclk_freq;
+	int ret;
+
+	ret = intel_crtc_compute_pipe_src(crtc_state);
+	if (ret)
+		return ret;
 
 	drm_mode_copy(pipe_mode, &crtc_state->hw.adjusted_mode);
 
 	intel_bigjoiner_adjust_timings(crtc_state, pipe_mode);
-	if (crtc_state->bigjoiner)
-		crtc_state->pipe_src_w /= 2;
 
 	intel_splitter_adjust_timings(crtc_state, pipe_mode);
 
@@ -2841,27 +2878,6 @@ static int intel_crtc_compute_config(struct intel_crtc *crtc,
 		return -EINVAL;
 	}
 
-	/*
-	 * Pipe horizontal size must be even in:
-	 * - DVO ganged mode
-	 * - LVDS dual channel mode
-	 * - Double wide pipe
-	 */
-	if (crtc_state->pipe_src_w & 1) {
-		if (crtc_state->double_wide) {
-			drm_dbg_kms(&i915->drm,
-				    "Odd pipe source width not supported with double wide pipe\n");
-			return -EINVAL;
-		}
-
-		if (intel_crtc_has_type(crtc_state, INTEL_OUTPUT_LVDS) &&
-		    intel_is_dual_link_lvds(i915)) {
-			drm_dbg_kms(&i915->drm,
-				    "Odd pipe source width not supported with dual link LVDS\n");
-			return -EINVAL;
-		}
-	}
-
 	intel_crtc_compute_pixel_rate(crtc_state);
 
 	if (crtc_state->has_pch_encoder)
-- 
2.34.1

