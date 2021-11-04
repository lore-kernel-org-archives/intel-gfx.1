Return-Path: <SRS0=bagb=PX=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A897FC433F5
	for <intel-gfx@archiver.kernel.org>; Thu,  4 Nov 2021 14:45:50 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B17C611EE
	for <intel-gfx@archiver.kernel.org>; Thu,  4 Nov 2021 14:45:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7B17C611EE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22B146E4D4;
	Thu,  4 Nov 2021 14:45:50 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E48B6E4D4
 for <intel-gfx@lists.freedesktop.org>; Thu,  4 Nov 2021 14:45:48 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10157"; a="231663954"
X-IronPort-AV: E=Sophos;i="5.87,209,1631602800"; d="scan'208";a="231663954"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2021 07:45:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,209,1631602800"; d="scan'208";a="578609607"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by FMSMGA003.fm.intel.com with SMTP; 04 Nov 2021 07:45:45 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 04 Nov 2021 16:45:45 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Thu,  4 Nov 2021 16:45:11 +0200
Message-Id: <20211104144520.22605-9-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211104144520.22605-1-ville.syrjala@linux.intel.com>
References: <20211104144520.22605-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 08/17] drm/i915/fbc: s/gen7/ivb/
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

"gen7" in display code is not really sensible. We shall call
these things "ivb".

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbc.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index be89404840d2..1df5a08d3457 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -462,7 +462,7 @@ static void skl_fbc_program_cfb_stride(struct drm_i915_private *i915)
 		     CHICKEN_FBC_STRIDE_MASK, val);
 }
 
-static u32 gen7_dpfc_ctl(struct drm_i915_private *i915)
+static u32 ivb_dpfc_ctl(struct drm_i915_private *i915)
 {
 	const struct intel_fbc_reg_params *params = &i915->fbc.params;
 	u32 dpfc_ctl;
@@ -481,7 +481,7 @@ static u32 gen7_dpfc_ctl(struct drm_i915_private *i915)
 	return dpfc_ctl;
 }
 
-static void gen7_fbc_activate(struct drm_i915_private *dev_priv)
+static void ivb_fbc_activate(struct drm_i915_private *dev_priv)
 {
 	if (DISPLAY_VER(dev_priv) >= 10)
 		glk_fbc_program_cfb_stride(dev_priv);
@@ -492,10 +492,10 @@ static void gen7_fbc_activate(struct drm_i915_private *dev_priv)
 		snb_fbc_program_fence(dev_priv);
 
 	intel_de_write(dev_priv, ILK_DPFC_CONTROL,
-		       DPFC_CTL_EN | gen7_dpfc_ctl(dev_priv));
+		       DPFC_CTL_EN | ivb_dpfc_ctl(dev_priv));
 }
 
-static bool gen7_fbc_is_compressing(struct drm_i915_private *i915)
+static bool ivb_fbc_is_compressing(struct drm_i915_private *i915)
 {
 	if (DISPLAY_VER(i915) >= 8)
 		return intel_de_read(i915, IVB_FBC_STATUS2) & BDW_FBC_COMP_SEG_MASK;
@@ -503,11 +503,11 @@ static bool gen7_fbc_is_compressing(struct drm_i915_private *i915)
 		return intel_de_read(i915, IVB_FBC_STATUS2) & IVB_FBC_COMP_SEG_MASK;
 }
 
-static const struct intel_fbc_funcs gen7_fbc_funcs = {
-	.activate = gen7_fbc_activate,
+static const struct intel_fbc_funcs ivb_fbc_funcs = {
+	.activate = ivb_fbc_activate,
 	.deactivate = ilk_fbc_deactivate,
 	.is_active = ilk_fbc_is_active,
-	.is_compressing = gen7_fbc_is_compressing,
+	.is_compressing = ivb_fbc_is_compressing,
 	.nuke = snb_fbc_nuke,
 };
 
@@ -1685,7 +1685,7 @@ void intel_fbc_init(struct drm_i915_private *dev_priv)
 	}
 
 	if (DISPLAY_VER(dev_priv) >= 7)
-		fbc->funcs = &gen7_fbc_funcs;
+		fbc->funcs = &ivb_fbc_funcs;
 	else if (DISPLAY_VER(dev_priv) == 6)
 		fbc->funcs = &snb_fbc_funcs;
 	else if (DISPLAY_VER(dev_priv) == 5)
-- 
2.32.0

