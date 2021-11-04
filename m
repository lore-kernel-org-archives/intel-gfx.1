Return-Path: <SRS0=bagb=PX=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBEB3C433F5
	for <intel-gfx@archiver.kernel.org>; Thu,  4 Nov 2021 01:02:33 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A1FB60273
	for <intel-gfx@archiver.kernel.org>; Thu,  4 Nov 2021 01:02:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7A1FB60273
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB8477AF15;
	Thu,  4 Nov 2021 01:02:32 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF6D77AF14
 for <intel-gfx@lists.freedesktop.org>; Thu,  4 Nov 2021 01:02:30 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10157"; a="212375403"
X-IronPort-AV: E=Sophos;i="5.87,207,1631602800"; d="scan'208";a="212375403"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2021 18:02:30 -0700
X-IronPort-AV: E=Sophos;i="5.87,207,1631602800"; d="scan'208";a="450279889"
Received: from josouza-mobl2.jf.intel.com (HELO josouza-mobl2.intel.com)
 ([10.24.14.60])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2021 18:02:30 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Wed,  3 Nov 2021 18:08:58 -0700
Message-Id: <20211104010858.43559-1-jose.souza@intel.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH] drm/i915/display/adlp: Disable underrun recovery
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

It was also defeatured for ADL-P and other platforms.

BSpec: 55424
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 39 ++++----------------
 1 file changed, 7 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 29392dfc46c8d..64406408ba590 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -956,26 +956,6 @@ void intel_display_finish_reset(struct drm_i915_private *dev_priv)
 	clear_bit_unlock(I915_RESET_MODESET, &dev_priv->gt.reset.flags);
 }
 
-static bool underrun_recovery_supported(const struct intel_crtc_state *crtc_state)
-{
-	if (crtc_state->pch_pfit.enabled &&
-	    (crtc_state->pipe_src_w > drm_rect_width(&crtc_state->pch_pfit.dst) ||
-	     crtc_state->pipe_src_h > drm_rect_height(&crtc_state->pch_pfit.dst) ||
-	     crtc_state->output_format == INTEL_OUTPUT_FORMAT_YCBCR420))
-		return false;
-
-	if (crtc_state->dsc.compression_enable)
-		return false;
-
-	if (crtc_state->has_psr2)
-		return false;
-
-	if (crtc_state->splitter.enable)
-		return false;
-
-	return true;
-}
-
 static void icl_set_pipe_chicken(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
@@ -999,19 +979,14 @@ static void icl_set_pipe_chicken(const struct intel_crtc_state *crtc_state)
 	 */
 	tmp |= PIXEL_ROUNDING_TRUNC_FB_PASSTHRU;
 
-	if (IS_DG2(dev_priv)) {
-		/*
-		 * Underrun recovery must always be disabled on DG2.  However
-		 * the chicken bit meaning is inverted compared to other
-		 * platforms.
-		 */
+	/*
+	 * Underrun recovery must always be disabled on display 13+.
+	 * DG2 chicken bit meaning is inverted compared to other platforms.
+	 */
+	if (IS_DG2(dev_priv))
 		tmp &= ~UNDERRUN_RECOVERY_ENABLE_DG2;
-	} else if (DISPLAY_VER(dev_priv) >= 13) {
-		if (underrun_recovery_supported(crtc_state))
-			tmp &= ~UNDERRUN_RECOVERY_DISABLE_ADLP;
-		else
-			tmp |= UNDERRUN_RECOVERY_DISABLE_ADLP;
-	}
+	else if (DISPLAY_VER(dev_priv) >= 13)
+		tmp |= UNDERRUN_RECOVERY_DISABLE_ADLP;
 
 	intel_de_write(dev_priv, PIPE_CHICKEN(pipe), tmp);
 }
-- 
2.33.1

