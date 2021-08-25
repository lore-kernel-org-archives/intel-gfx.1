Return-Path: <SRS0=ZGLP=NQ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB3E5C4338F
	for <intel-gfx@archiver.kernel.org>; Wed, 25 Aug 2021 15:48:05 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9A376108F
	for <intel-gfx@archiver.kernel.org>; Wed, 25 Aug 2021 15:48:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A9A376108F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23E5E6E3A0;
	Wed, 25 Aug 2021 15:48:05 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 299E66E3C1
 for <intel-gfx@lists.freedesktop.org>; Wed, 25 Aug 2021 15:48:04 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10087"; a="281264224"
X-IronPort-AV: E=Sophos;i="5.84,351,1620716400"; d="scan'208";a="281264224"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2021 08:48:03 -0700
X-IronPort-AV: E=Sophos;i="5.84,351,1620716400"; d="scan'208";a="527374724"
Received: from mburkard-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.251.213.64])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2021 08:48:02 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: jani.nikula@intel.com
Date: Wed, 25 Aug 2021 18:47:48 +0300
Message-Id: <da1609dfce4623f8ec86254aea6c2c8679b6a37f.1629906431.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1629906431.git.jani.nikula@intel.com>
References: <cover.1629906431.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 1/5] drm/i915/fdi: move
 intel_update_fdi_pll_freq to intel_fdi.c
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

Move FDI related functions to intel_fdi.c. Rename to have intel_fdi
prefix while at it.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 18 +-----------------
 drivers/gpu/drm/i915/display/intel_fdi.c     | 16 ++++++++++++++++
 drivers/gpu/drm/i915/display/intel_fdi.h     |  1 +
 3 files changed, 18 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 794690c0dba5..3a9afe04ce0a 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -11564,22 +11564,6 @@ static void sanitize_watermarks(struct drm_i915_private *dev_priv)
 	drm_modeset_acquire_fini(&ctx);
 }
 
-static void intel_update_fdi_pll_freq(struct drm_i915_private *dev_priv)
-{
-	if (IS_IRONLAKE(dev_priv)) {
-		u32 fdi_pll_clk =
-			intel_de_read(dev_priv, FDI_PLL_BIOS_0) & FDI_PLL_FB_CLOCK_MASK;
-
-		dev_priv->fdi_pll_freq = (fdi_pll_clk + 2) * 10000;
-	} else if (IS_SANDYBRIDGE(dev_priv) || IS_IVYBRIDGE(dev_priv)) {
-		dev_priv->fdi_pll_freq = 270000;
-	} else {
-		return;
-	}
-
-	drm_dbg(&dev_priv->drm, "FDI PLL freq=%d\n", dev_priv->fdi_pll_freq);
-}
-
 static int intel_initial_commit(struct drm_device *dev)
 {
 	struct drm_atomic_state *state = NULL;
@@ -11833,7 +11817,7 @@ int intel_modeset_init_nogem(struct drm_i915_private *i915)
 
 	intel_plane_possible_crtcs_init(i915);
 	intel_shared_dpll_init(dev);
-	intel_update_fdi_pll_freq(i915);
+	intel_fdi_pll_freq_update(i915);
 
 	intel_update_czclk(i915);
 	intel_modeset_init_hw(i915);
diff --git a/drivers/gpu/drm/i915/display/intel_fdi.c b/drivers/gpu/drm/i915/display/intel_fdi.c
index 13f8ba4c9188..88a78dafd54d 100644
--- a/drivers/gpu/drm/i915/display/intel_fdi.c
+++ b/drivers/gpu/drm/i915/display/intel_fdi.c
@@ -95,6 +95,22 @@ static int ilk_check_fdi_lanes(struct drm_device *dev, enum pipe pipe,
 	}
 }
 
+void intel_fdi_pll_freq_update(struct drm_i915_private *i915)
+{
+	if (IS_IRONLAKE(i915)) {
+		u32 fdi_pll_clk =
+			intel_de_read(i915, FDI_PLL_BIOS_0) & FDI_PLL_FB_CLOCK_MASK;
+
+		i915->fdi_pll_freq = (fdi_pll_clk + 2) * 10000;
+	} else if (IS_SANDYBRIDGE(i915) || IS_IVYBRIDGE(i915)) {
+		i915->fdi_pll_freq = 270000;
+	} else {
+		return;
+	}
+
+	drm_dbg(&i915->drm, "FDI PLL freq=%d\n", i915->fdi_pll_freq);
+}
+
 int intel_fdi_link_freq(struct drm_i915_private *i915,
 			const struct intel_crtc_state *pipe_config)
 {
diff --git a/drivers/gpu/drm/i915/display/intel_fdi.h b/drivers/gpu/drm/i915/display/intel_fdi.h
index 2c8ffd9ceaed..cda9a32c25ba 100644
--- a/drivers/gpu/drm/i915/display/intel_fdi.h
+++ b/drivers/gpu/drm/i915/display/intel_fdi.h
@@ -23,5 +23,6 @@ void ilk_fdi_pll_enable(const struct intel_crtc_state *crtc_state);
 void intel_fdi_init_hook(struct drm_i915_private *dev_priv);
 void hsw_fdi_link_train(struct intel_encoder *encoder,
 			const struct intel_crtc_state *crtc_state);
+void intel_fdi_pll_freq_update(struct drm_i915_private *i915);
 
 #endif
-- 
2.20.1

