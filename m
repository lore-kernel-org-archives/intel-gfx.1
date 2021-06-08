Return-Path: <SRS0=iOfG=LD=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DATE_IN_PAST_06_12,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBF07C48BCF
	for <intel-gfx@archiver.kernel.org>; Wed,  9 Jun 2021 06:36:47 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B78EE610F8
	for <intel-gfx@archiver.kernel.org>; Wed,  9 Jun 2021 06:36:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B78EE610F8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56D5B6E0E8;
	Wed,  9 Jun 2021 06:36:47 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87B046E0E8
 for <intel-gfx@lists.freedesktop.org>; Wed,  9 Jun 2021 06:36:45 +0000 (UTC)
IronPort-SDR: JHLGz3ofy4FdBhrRXxNMjxVBLqGkWfetEA1/w5M7tUD0AdNOsSPBYjnQnYAz/ViswegjT7uMoQ
 Gb9wnlAfTJ4w==
X-IronPort-AV: E=McAfee;i="6200,9189,10009"; a="290643574"
X-IronPort-AV: E=Sophos;i="5.83,260,1616482800"; d="scan'208";a="290643574"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 23:36:45 -0700
IronPort-SDR: KS3HGAblZrC5E22+Fnih5zOtV4OaEQ72nGcH94tG/LmbdJHk/NpRonGc/xvQGJvFgRxQGluiAL
 U6P6MHtDfhRg==
X-IronPort-AV: E=Sophos;i="5.83,260,1616482800"; d="scan'208";a="449837691"
Received: from nischal-desktop.iind.intel.com ([10.223.74.174])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 23:36:43 -0700
From: Nischal Varide <nischal.varide@intel.com>
To: intel-gfx@lists.freedesktop.org, nischal.varide@intel.com,
 uma.shankar@intel.com, anshuman.gupta@intel.com, jani.nikula@intel.com
Date: Wed,  9 Jun 2021 05:14:29 +0530
Message-Id: <20210608234429.20953-2-nischal.varide@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210608234429.20953-1-nischal.varide@intel.com>
References: <20210526181728.14817-1-bhanuprakash.modem@intel.com>
 <20210608234429.20953-1-nischal.varide@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v3 1/1] drm/i915/xelpd: Enabling dithering after
 the CC1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

If the panel is 12bpc then Dithering is not enabled in the Legacy
dithering block , instead its Enabled after the C1 CC1 pipe post
color space conversion.For a 6bpc pannel Dithering is enabled in
Legacy block.

Signed-off-by: Nischal Varide <nischal.varide@intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c   |  7 +++++++
 drivers/gpu/drm/i915/display/intel_display.c | 11 ++++++++++-
 drivers/gpu/drm/i915/i915_reg.h              |  1 +
 3 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index dab892d2251b..e11b3dbf0b95 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -1574,6 +1574,7 @@ static int glk_color_check(struct intel_crtc_state *crtc_state)
 static u32 icl_gamma_mode(const struct intel_crtc_state *crtc_state)
 {
 	u32 gamma_mode = 0;
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
 
 	if (crtc_state->hw.degamma_lut)
 		gamma_mode |= PRE_CSC_GAMMA_ENABLE;
@@ -1588,6 +1589,12 @@ static u32 icl_gamma_mode(const struct intel_crtc_state *crtc_state)
 	else
 		gamma_mode |= GAMMA_MODE_MODE_12BIT_MULTI_SEGMENTED;
 
+	if (DISPLAY_VER(i915) >= 13) {
+		if (!crtc_state->dither_force_disable &&
+				(crtc_state->pipe_bpp == 36))
+			gamma_mode |= POST_CC1_GAMMA_ENABLE;
+	}
+
 	return gamma_mode;
 }
 
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index caf0414e0b50..5345779cfce2 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -5762,7 +5762,16 @@ static void bdw_set_pipemisc(const struct intel_crtc_state *crtc_state)
 		break;
 	}
 
-	if (crtc_state->dither)
+	/*
+	 * If 12bpc panel then, Enables dithering after the CC1 pipe
+	 * post color space conversion and not here for display_ver
+	 * greater than or equal to thirteen.
+	 */
+
+	if (crtc_state->dither && (crtc_state->pipe_bpp != 36))
+		val |= PIPEMISC_DITHER_ENABLE | PIPEMISC_DITHER_TYPE_SP;
+
+	if (crtc_state->dither && (crtc_state->pipe_bpp == 36) && (DISPLAY_VER(dev_priv) < 13))
 		val |= PIPEMISC_DITHER_ENABLE | PIPEMISC_DITHER_TYPE_SP;
 
 	if (crtc_state->output_format == INTEL_OUTPUT_FORMAT_YCBCR420 ||
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 24307c49085f..fa800a77ea49 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -7743,6 +7743,7 @@ enum {
 #define GAMMA_MODE(pipe) _MMIO_PIPE(pipe, _GAMMA_MODE_A, _GAMMA_MODE_B)
 #define  PRE_CSC_GAMMA_ENABLE	(1 << 31)
 #define  POST_CSC_GAMMA_ENABLE	(1 << 30)
+#define  POST_CC1_GAMMA_ENABLE  (1 << 26)
 #define  GAMMA_MODE_MODE_MASK	(3 << 0)
 #define  GAMMA_MODE_MODE_8BIT	(0 << 0)
 #define  GAMMA_MODE_MODE_10BIT	(1 << 0)
-- 
2.29.2

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
