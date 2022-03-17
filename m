Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91D5EC433F5
	for <intel-gfx@archiver.kernel.org>; Thu, 17 Mar 2022 17:20:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F39E210E60E;
	Thu, 17 Mar 2022 17:20:08 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B25A10E60E
 for <intel-gfx@lists.freedesktop.org>; Thu, 17 Mar 2022 17:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647537607; x=1679073607;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=LuRYDvCBWqi4f7uLGLFR5rD91Qexx1AyU+2LrfKd5Bg=;
 b=As/tKBoP9PhO0bJSsugUA2rOW5cHB167ni+Ad/KcWXpO940cwmTp3yy3
 MKLo1Jtbkat+hkmVKG2jCxsaG9eQqSSrTPx1MnfxjOeBL3H9rwYQ+U8p/
 aOruzNIpxgOnrhrUFJJqOCwF44LeLVmiBlzlK2T0q2183K/DhsrbxZSCJ
 WElVGArrqgOvAxpO3og2Pic5mqLi99C5jkB717MZOq8dgrNVJUGSRheV4
 GVIjdc/RFRwP7u34HEStwnFOA1dnGJmueeofvGSNd2+hEmVCJKeTjn4fW
 ssv6OyarXHggngYRQaHK2IktU68Md8HdXax51zgb2N5Hhu6oH1NUzO/cf g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10289"; a="255752156"
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="255752156"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2022 10:20:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="599172898"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.151])
 by fmsmga008.fm.intel.com with SMTP; 17 Mar 2022 10:20:04 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 17 Mar 2022 19:20:03 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Thu, 17 Mar 2022 19:19:42 +0200
Message-Id: <20220317171948.10400-6-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220317171948.10400-1-ville.syrjala@linux.intel.com>
References: <20220317171948.10400-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 05/11] drm/i915/bios: Trust the LFP data pointers
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

Now that we've sufficiently validated the LFP data pointers we
can trust them.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_bios.c | 50 ++++++-----------------
 1 file changed, 12 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
index 29953996a474..a2a3fb459a9d 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.c
+++ b/drivers/gpu/drm/i915/display/intel_bios.c
@@ -355,44 +355,19 @@ fill_detail_timing_data(struct drm_display_mode *panel_fixed_mode,
 }
 
 static const struct lvds_dvo_timing *
-get_lvds_dvo_timing(const struct bdb_lvds_lfp_data *lvds_lfp_data,
-		    const struct bdb_lvds_lfp_data_ptrs *lvds_lfp_data_ptrs,
+get_lvds_dvo_timing(const struct bdb_lvds_lfp_data *data,
+		    const struct bdb_lvds_lfp_data_ptrs *ptrs,
 		    int index)
 {
-	/*
-	 * the size of fp_timing varies on the different platform.
-	 * So calculate the DVO timing relative offset in LVDS data
-	 * entry to get the DVO timing entry
-	 */
-
-	int lfp_data_size =
-		lvds_lfp_data_ptrs->ptr[1].dvo_timing.offset -
-		lvds_lfp_data_ptrs->ptr[0].dvo_timing.offset;
-	int dvo_timing_offset =
-		lvds_lfp_data_ptrs->ptr[0].dvo_timing.offset -
-		lvds_lfp_data_ptrs->ptr[0].fp_timing.offset;
-	char *entry = (char *)lvds_lfp_data->data + lfp_data_size * index;
-
-	return (struct lvds_dvo_timing *)(entry + dvo_timing_offset);
+	return (const void *)data + ptrs->ptr[index].dvo_timing.offset;
 }
 
-/* get lvds_fp_timing entry
- * this function may return NULL if the corresponding entry is invalid
- */
 static const struct lvds_fp_timing *
 get_lvds_fp_timing(const struct bdb_lvds_lfp_data *data,
 		   const struct bdb_lvds_lfp_data_ptrs *ptrs,
 		   int index)
 {
-	u16 data_size = ((const u16 *)data)[-1]; /* stored in header */
-	size_t ofs;
-
-	if (index >= ARRAY_SIZE(ptrs->ptr))
-		return NULL;
-	ofs = ptrs->ptr[index].fp_timing.offset;
-	if (ofs + sizeof(struct lvds_fp_timing) > data_size)
-		return NULL;
-	return (const struct lvds_fp_timing *)((const u8 *)data + ofs);
+	return (const void *)data + ptrs->ptr[index].fp_timing.offset;
 }
 
 /* Parse general panel options */
@@ -498,15 +473,14 @@ parse_lfp_panel_dtd(struct drm_i915_private *i915,
 	fp_timing = get_lvds_fp_timing(lvds_lfp_data,
 				       lvds_lfp_data_ptrs,
 				       panel_type);
-	if (fp_timing) {
-		/* check the resolution, just to be sure */
-		if (fp_timing->x_res == panel_fixed_mode->hdisplay &&
-		    fp_timing->y_res == panel_fixed_mode->vdisplay) {
-			i915->vbt.bios_lvds_val = fp_timing->lvds_reg_val;
-			drm_dbg_kms(&i915->drm,
-				    "VBT initial LVDS value %x\n",
-				    i915->vbt.bios_lvds_val);
-		}
+
+	/* check the resolution, just to be sure */
+	if (fp_timing->x_res == panel_fixed_mode->hdisplay &&
+	    fp_timing->y_res == panel_fixed_mode->vdisplay) {
+		i915->vbt.bios_lvds_val = fp_timing->lvds_reg_val;
+		drm_dbg_kms(&i915->drm,
+			    "VBT initial LVDS value %x\n",
+			    i915->vbt.bios_lvds_val);
 	}
 }
 
-- 
2.34.1

