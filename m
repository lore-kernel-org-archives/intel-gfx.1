Return-Path: <SRS0=0xFZ=N4=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC0D0C433FE
	for <intel-gfx@archiver.kernel.org>; Mon,  6 Sep 2021 21:02:14 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8EB6560F43
	for <intel-gfx@archiver.kernel.org>; Mon,  6 Sep 2021 21:02:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8EB6560F43
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 349D589DED;
	Mon,  6 Sep 2021 21:01:59 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 955D489DA9;
 Mon,  6 Sep 2021 21:01:55 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10099"; a="219732485"
X-IronPort-AV: E=Sophos;i="5.85,273,1624345200"; d="scan'208";a="219732485"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2021 14:01:55 -0700
X-IronPort-AV: E=Sophos;i="5.85,273,1624345200"; d="scan'208";a="537362391"
Received: from linux-desktop.iind.intel.com ([10.223.34.178])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2021 14:01:52 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: harry.wentland@amd.com, ville.syrjala@linux.intel.com, ppaalanen@gmail.com,
 brian.starkey@arm.com, sebastian@sebastianwick.net,
 Shashank.Sharma@amd.com, Uma Shankar <uma.shankar@intel.com>
Date: Tue,  7 Sep 2021 03:09:03 +0530
Message-Id: <20210906213904.27918-22-uma.shankar@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210906213904.27918-1-uma.shankar@intel.com>
References: <20210906213904.27918-1-uma.shankar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [RFC v2 21/22] drm/i915/xelpd: Program Plane Gamma
 Registers
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

Extract the LUT and program plane gamma registers.
Enabled multi segmented lut as well.

Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c | 89 ++++++++++++++++++++++
 drivers/gpu/drm/i915/i915_reg.h            |  9 ++-
 2 files changed, 94 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index b4cad5c92c85..e5f168a32932 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -27,6 +27,9 @@
 #include "intel_de.h"
 #include "intel_display_types.h"
 #include "intel_sprite.h"
+
+#include "skl_universal_plane.h"
+
 #include <drm/drm_plane.h>
 
 #define CTM_COEFF_SIGN	(1ULL << 63)
@@ -2433,16 +2436,102 @@ static void d13_program_plane_degamma_lut(const struct drm_plane_state *state,
 	}
 }
 
+static void d13_program_plane_gamma_lut(const struct drm_plane_state *state,
+					struct drm_color_lut_ext *gamma_lut,
+					u32 offset)
+{
+	struct drm_i915_private *dev_priv = to_i915(state->plane->dev);
+	enum pipe pipe = to_intel_plane(state->plane)->pipe;
+	enum plane_id plane = to_intel_plane(state->plane)->id;
+	u32 i, lut_size;
+
+	if (icl_is_hdr_plane(dev_priv, plane)) {
+		intel_de_write(dev_priv, PLANE_POST_CSC_GAMC_INDEX_ENH(pipe, plane, 0),
+			       offset | PLANE_PAL_PREC_AUTO_INCREMENT);
+		if (gamma_lut) {
+			lut_size = 32;
+			for (i = 0; i < lut_size; i++) {
+				u64 word = drm_color_lut_extract_ext(gamma_lut[i].green, 24);
+				u32 lut_val = (word & 0xffffff);
+
+				intel_de_write(dev_priv, PLANE_POST_CSC_GAMC_DATA_ENH(pipe, plane, 0),
+					       lut_val);
+			}
+
+			do {
+				/* Program the max register to clamp values > 1.0. */
+				intel_de_write(dev_priv, PLANE_POST_CSC_GAMC_DATA_ENH(pipe, plane, 0),
+					       gamma_lut[i].green);
+			} while (i++ < 34);
+		} else {
+			lut_size = 32;
+			for (i = 0; i < lut_size; i++) {
+				u32 v = (i * ((1 << 24) - 1)) / (lut_size - 1);
+
+				intel_de_write(dev_priv, PLANE_POST_CSC_GAMC_DATA_ENH(pipe, plane, 0), v);
+			}
+
+			do {
+				intel_de_write(dev_priv, PLANE_POST_CSC_GAMC_DATA_ENH(pipe, plane, 0),
+					       1 << 24);
+			} while (i++ < 34);
+		}
+
+		intel_de_write(dev_priv, PLANE_POST_CSC_GAMC_INDEX_ENH(pipe, plane, 0), 0);
+	} else {
+		lut_size = 32;
+		/*
+		 * First 3 planes are HDR, so reduce by 3 to get to the right
+		 * SDR plane offset
+		 */
+		plane = plane - 3;
+
+		intel_de_write(dev_priv, PLANE_POST_CSC_GAMC_INDEX(pipe, plane, 0),
+			       offset | PLANE_PAL_PREC_AUTO_INCREMENT);
+
+		if (gamma_lut) {
+			for (i = 0; i < lut_size; i++)
+				intel_de_write(dev_priv, PLANE_POST_CSC_GAMC_DATA(pipe, plane, 0),
+					       gamma_lut[i].green & 0xffff);
+			/* Program the max register to clamp values > 1.0. */
+			while (i < 35)
+				intel_de_write(dev_priv, PLANE_POST_CSC_GAMC_DATA(pipe, plane, 0),
+					       gamma_lut[i++].green & 0x3ffff);
+		} else {
+			for (i = 0; i < lut_size; i++) {
+				u32 v = (i * ((1 << 16) - 1)) / (lut_size - 1);
+
+				intel_de_write(dev_priv, PLANE_POST_CSC_GAMC_DATA(pipe, plane, 0), v);
+			}
+
+			do {
+				intel_de_write(dev_priv, PLANE_POST_CSC_GAMC_DATA(pipe, plane, 0),
+					       (1 << 16));
+			} while (i++ < 34);
+		}
+
+		intel_de_write(dev_priv, PLANE_POST_CSC_GAMC_INDEX(pipe, plane, 0), 0);
+	}
+}
+
 static void d13_plane_load_luts(const struct drm_plane_state *plane_state)
 {
 	const struct drm_property_blob *degamma_lut_blob =
 					plane_state->degamma_lut;
+	const struct drm_property_blob *gamma_lut_blob =
+					plane_state->gamma_lut;
 	struct drm_color_lut_ext *degamma_lut = NULL;
+	struct drm_color_lut_ext *gamma_lut = NULL;
 
 	if (degamma_lut_blob) {
 		degamma_lut = degamma_lut_blob->data;
 		d13_program_plane_degamma_lut(plane_state, degamma_lut, 0);
 	}
+
+	if (gamma_lut_blob) {
+		gamma_lut = gamma_lut_blob->data;
+		d13_program_plane_gamma_lut(plane_state, gamma_lut, 0);
+	}
 }
 
 void intel_color_load_plane_luts(const struct drm_plane_state *plane_state)
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index fc4f8b430518..037b95153b86 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -7230,10 +7230,11 @@ enum {
 #define _PLANE_COLOR_CTL_3_A			0x703CC /* GLK+ */
 #define   PLANE_COLOR_PIPE_GAMMA_ENABLE		(1 << 30) /* Pre-ICL */
 #define   PLANE_COLOR_YUV_RANGE_CORRECTION_DISABLE	(1 << 28)
-#define   PLANE_COLOR_PLANE_CSC_ENABLE		(1 << 21) /* ICL+ */
-#define   PLANE_COLOR_INPUT_CSC_ENABLE		(1 << 20) /* ICL+ */
-#define   PLANE_COLOR_PIPE_CSC_ENABLE		(1 << 23) /* Pre-ICL */
-#define   PLANE_PRE_CSC_GAMMA_ENABLE		(1 << 14)
+#define   PLANE_COLOR_PLANE_CSC_ENABLE			(1 << 21) /* ICL+ */
+#define   PLANE_COLOR_INPUT_CSC_ENABLE			(1 << 20) /* ICL+ */
+#define   PLANE_COLOR_PIPE_CSC_ENABLE			(1 << 23) /* Pre-ICL */
+#define   PLANE_POST_CSC_GAMMA_MULTI_SEGMENT_ENABLE	(1 << 15)
+#define   PLANE_PRE_CSC_GAMMA_ENABLE			(1 << 14)
 #define   PLANE_COLOR_CSC_MODE_BYPASS			(0 << 17)
 #define   PLANE_COLOR_CSC_MODE_YUV601_TO_RGB601		(1 << 17)
 #define   PLANE_COLOR_CSC_MODE_YUV709_TO_RGB709		(2 << 17)
-- 
2.26.2

