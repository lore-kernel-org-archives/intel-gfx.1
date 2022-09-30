Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E7B4C433FE
	for <intel-gfx@archiver.kernel.org>; Fri, 30 Sep 2022 10:44:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43AC810EC68;
	Fri, 30 Sep 2022 10:44:04 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A65110EC6E
 for <intel-gfx@lists.freedesktop.org>; Fri, 30 Sep 2022 10:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664534600; x=1696070600;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=FTgLVdEZxwlKk9T6VFywVOv2qe6gJNVi8Gb4bL7eYEE=;
 b=HID/xFa9qYwuBDCQ1GpvkspzXsc1Z2QHj3XkH41Aw7RocIEuguCtVnJO
 Bw0G5OVqW56faMpRDUXj+GjWBUAHdN9Y5W0u3J/WBKse295Ncfs+PqmCC
 FdxjYCTBLdhpmj99z0rj4FJkHJcsFq24n4PyE672iZ0Ci89OTg3VUpfTK
 tRnbt2N2uJbePANJD63+GtTmJT6DLSIKAysP8Zrqr4ZlR53Q3b0DsxLXO
 ksTsMqHaQLixSOJ54D+yUeu4NHCUGShcqilOLySly7klwLfJ5UWLKDBa8
 wCO0INyEAxSX22mcvrIcWvRQBwUqILNnTqmsKX36JetvPUCvgJgveDM11 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10485"; a="303073621"
X-IronPort-AV: E=Sophos;i="5.93,358,1654585200"; d="scan'208";a="303073621"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2022 03:43:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10485"; a="765092098"
X-IronPort-AV: E=Sophos;i="5.93,358,1654585200"; d="scan'208";a="765092098"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by fmsmga001.fm.intel.com with SMTP; 30 Sep 2022 03:43:18 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 30 Sep 2022 13:43:17 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Fri, 30 Sep 2022 13:43:02 +0300
Message-Id: <20220930104302.25836-6-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220930104302.25836-1-ville.syrjala@linux.intel.com>
References: <20220930104302.25836-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 5/5] drm/i915: Simplify modifier lookup in
 watermark code
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

Replace the huge modifier lists in the watermark code with
a few calls to intel_fb.c.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_fb.c      | 13 ++++++++++++
 drivers/gpu/drm/i915/display/intel_fb.h      |  1 +
 drivers/gpu/drm/i915/display/skl_watermark.c | 22 +++-----------------
 3 files changed, 17 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index eefa33c555ac..63137ae5ab21 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -300,6 +300,19 @@ static bool plane_caps_contain_all(u8 caps, u8 mask)
 	return (caps & mask) == mask;
 }
 
+/**
+ * intel_fb_is_tiled_modifier: Check if a modifier is a tiled modifier type
+ * @modifier: Modifier to check
+ *
+ * Returns:
+ * Returns %true if @modifier is a tiled modifier.
+ */
+bool intel_fb_is_tiled_modifier(u64 modifier)
+{
+	return plane_caps_contain_any(lookup_modifier(modifier)->plane_caps,
+				      INTEL_PLANE_CAP_TILING_MASK);
+}
+
 /**
  * intel_fb_is_ccs_modifier: Check if a modifier is a CCS modifier type
  * @modifier: Modifier to check
diff --git a/drivers/gpu/drm/i915/display/intel_fb.h b/drivers/gpu/drm/i915/display/intel_fb.h
index 12386f13a4e0..4662b812b934 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.h
+++ b/drivers/gpu/drm/i915/display/intel_fb.h
@@ -29,6 +29,7 @@ struct intel_plane_state;
 #define INTEL_PLANE_CAP_TILING_Yf	BIT(5)
 #define INTEL_PLANE_CAP_TILING_4	BIT(6)
 
+bool intel_fb_is_tiled_modifier(u64 modifier);
 bool intel_fb_is_ccs_modifier(u64 modifier);
 bool intel_fb_is_rc_ccs_cc_modifier(u64 modifier);
 bool intel_fb_is_mc_ccs_modifier(u64 modifier);
diff --git a/drivers/gpu/drm/i915/display/skl_watermark.c b/drivers/gpu/drm/i915/display/skl_watermark.c
index 18178b01375e..0715bb308989 100644
--- a/drivers/gpu/drm/i915/display/skl_watermark.c
+++ b/drivers/gpu/drm/i915/display/skl_watermark.c
@@ -1706,26 +1706,10 @@ skl_compute_wm_params(const struct intel_crtc_state *crtc_state,
 		return -EINVAL;
 	}
 
-	wp->y_tiled = modifier == I915_FORMAT_MOD_Y_TILED ||
-		      modifier == I915_FORMAT_MOD_4_TILED ||
-		      modifier == I915_FORMAT_MOD_Yf_TILED ||
-		      modifier == I915_FORMAT_MOD_Y_TILED_CCS ||
-		      modifier == I915_FORMAT_MOD_Yf_TILED_CCS ||
-		      modifier == I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS ||
-		      modifier == I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS ||
-		      modifier == I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC ||
-		      modifier == I915_FORMAT_MOD_4_TILED_DG2_RC_CCS ||
-		      modifier == I915_FORMAT_MOD_4_TILED_DG2_MC_CCS ||
-		      modifier == I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC;
 	wp->x_tiled = modifier == I915_FORMAT_MOD_X_TILED;
-	wp->rc_surface = modifier == I915_FORMAT_MOD_Y_TILED_CCS ||
-			 modifier == I915_FORMAT_MOD_Yf_TILED_CCS ||
-			 modifier == I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS ||
-			 modifier == I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS ||
-			 modifier == I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC ||
-			 modifier == I915_FORMAT_MOD_4_TILED_DG2_RC_CCS ||
-			 modifier == I915_FORMAT_MOD_4_TILED_DG2_MC_CCS ||
-			 modifier == I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC;
+	wp->y_tiled = modifier != I915_FORMAT_MOD_X_TILED &&
+		intel_fb_is_tiled_modifier(modifier);
+	wp->rc_surface = intel_fb_is_ccs_modifier(modifier);
 	wp->is_planar = intel_format_info_is_yuv_semiplanar(format, modifier);
 
 	wp->width = width;
-- 
2.35.1

