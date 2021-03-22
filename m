Return-Path: <SRS0=R2gn=IU=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,
	DATE_IN_FUTURE_06_12,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 852F1C433C1
	for <intel-gfx@archiver.kernel.org>; Mon, 22 Mar 2021 06:38:25 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F3E66195D
	for <intel-gfx@archiver.kernel.org>; Mon, 22 Mar 2021 06:38:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F3E66195D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC6966E0BA;
	Mon, 22 Mar 2021 06:38:24 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73BA96E0BA
 for <intel-gfx@lists.freedesktop.org>; Mon, 22 Mar 2021 06:38:21 +0000 (UTC)
IronPort-SDR: ABKlwgWNySx1iYbHDkgp6CxTWo8KqSpjEnloMiPDJIKDxwC46PcZ9HMjTy7GMkmB2OPViTs/AT
 sIFOmzc21C+A==
X-IronPort-AV: E=McAfee;i="6000,8403,9930"; a="190238717"
X-IronPort-AV: E=Sophos;i="5.81,268,1610438400"; d="scan'208";a="190238717"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2021 23:38:21 -0700
IronPort-SDR: Elr1kHI93C0pG5QrnPK1KEVIYfmJvUhXv3TntwFGsXhvWB3EeavijjW2rMFN+0xN6zijQ1Gijq
 QBBlcs3fnrTQ==
X-IronPort-AV: E=Sophos;i="5.81,268,1610438400"; d="scan'208";a="451627106"
Received: from bhanu-nuclab.iind.intel.com ([10.145.162.173])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2021 23:38:19 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Mon, 22 Mar 2021 20:00:03 +0530
Message-Id: <20210322143008.29250-3-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210322143008.29250-1-bhanuprakash.modem@intel.com>
References: <20210322143008.29250-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 2/7] drm/i915/display: Add func to compare hw/sw
 CSC matrix
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

Add func intel_csc_equal() to compare hw/sw CSC coeff values.

Cc: Swati Sharma <swati2.sharma@intel.com>
Cc: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c | 51 +++++++++++++++++++---
 drivers/gpu/drm/i915/display/intel_color.h |  3 ++
 2 files changed, 47 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index 17bb08e9cf64..54dfd3523272 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -348,16 +348,11 @@ static void icl_load_csc_matrix(const struct intel_crtc_state *crtc_state)
 		       crtc_state->csc_mode);
 }
 
-static void chv_load_cgm_csc(struct intel_crtc *crtc,
-			     const struct drm_property_blob *blob)
+static void chv_csc_convert_ctm(const struct drm_color_ctm *ctm, u16 coeffs[9])
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
-	const struct drm_color_ctm *ctm = blob->data;
-	enum pipe pipe = crtc->pipe;
-	u16 coeffs[9];
 	int i;
 
-	for (i = 0; i < ARRAY_SIZE(coeffs); i++) {
+	for (i = 0; i < 9; i++) {
 		u64 abs_coeff = ((1ULL << 63) - 1) & ctm->matrix[i];
 
 		/* Round coefficient. */
@@ -374,6 +369,17 @@ static void chv_load_cgm_csc(struct intel_crtc *crtc,
 		coeffs[i] |= ((abs_coeff >> 32) & 7) << 12;
 		coeffs[i] |= (abs_coeff >> 20) & 0xfff;
 	}
+}
+
+static void chv_load_cgm_csc(struct intel_crtc *crtc,
+			     const struct drm_property_blob *blob)
+{
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	const struct drm_color_ctm *ctm = blob->data;
+	enum pipe pipe = crtc->pipe;
+	u16 coeffs[9];
+
+	chv_csc_convert_ctm(ctm, coeffs);
 
 	intel_de_write(dev_priv, CGM_PIPE_CSC_COEFF01(pipe),
 		       coeffs[1] << 16 | coeffs[0]);
@@ -1792,6 +1798,37 @@ bool intel_color_lut_equal(struct drm_property_blob *blob1,
 	return true;
 }
 
+bool intel_csc_equal(const struct intel_crtc_state *current_config,
+		     struct drm_property_blob *blob1,
+		     struct drm_property_blob *blob2)
+{
+	struct drm_i915_private *dev_priv = to_i915(current_config->uapi.crtc->dev);
+	struct drm_color_ctm *ctm1, *ctm2;
+	u16 coeffs[9];
+	int i;
+
+	if (!blob1 != !blob2)
+		return false;
+
+	if (!blob1)
+		return true;
+
+	ctm1 = blob1->data;
+	ctm2 = blob2->data;
+
+	if (IS_CHERRYVIEW(dev_priv))
+		chv_csc_convert_ctm(ctm1, coeffs);
+	else
+		ilk_csc_convert_ctm(current_config, coeffs);
+
+	for (i = 0; i < 9; i++) {
+		if (abs(coeffs[i] - ctm2->matrix[i]))
+			return false;
+	}
+
+	return true;
+}
+
 static struct drm_property_blob *i9xx_read_lut_8(struct intel_crtc *crtc)
 {
 	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
diff --git a/drivers/gpu/drm/i915/display/intel_color.h b/drivers/gpu/drm/i915/display/intel_color.h
index 173727aaa24d..e6bd9aa0c04a 100644
--- a/drivers/gpu/drm/i915/display/intel_color.h
+++ b/drivers/gpu/drm/i915/display/intel_color.h
@@ -21,5 +21,8 @@ int intel_color_get_gamma_bit_precision(const struct intel_crtc_state *crtc_stat
 bool intel_color_lut_equal(struct drm_property_blob *blob1,
 			   struct drm_property_blob *blob2,
 			   u32 gamma_mode, u32 bit_precision);
+bool intel_csc_equal(const struct intel_crtc_state *crtc_state,
+			   struct drm_property_blob *blob1,
+			   struct drm_property_blob *blob2);
 
 #endif /* __INTEL_COLOR_H__ */
-- 
2.20.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
