Return-Path: <SRS0=m2z4=PI=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2B52C433F5
	for <intel-gfx@archiver.kernel.org>; Wed, 20 Oct 2021 19:51:51 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84F7E6128E
	for <intel-gfx@archiver.kernel.org>; Wed, 20 Oct 2021 19:51:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 84F7E6128E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B50346E3AC;
	Wed, 20 Oct 2021 19:51:50 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DEB66E3AC
 for <intel-gfx@lists.freedesktop.org>; Wed, 20 Oct 2021 19:51:49 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10143"; a="209663422"
X-IronPort-AV: E=Sophos;i="5.87,167,1631602800"; d="scan'208";a="209663422"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2021 12:51:48 -0700
X-IronPort-AV: E=Sophos;i="5.87,167,1631602800"; d="scan'208";a="444495858"
Received: from ideak-desk.fi.intel.com ([10.237.68.141])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2021 12:51:47 -0700
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date: Wed, 20 Oct 2021 22:51:31 +0300
Message-Id: <20211020195138.1841242-5-imre.deak@intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211020195138.1841242-1-imre.deak@intel.com>
References: <20211020195138.1841242-1-imre.deak@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH v4 04/11] drm/i915: Simplify the modifier check
 for interlaced scanout support
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

Checking the modifiers that support interlacing makes the condition
simpler and avoids us having to add new modifiers to the list (presuming
all/most of the new modifiers won't support interlacing).

Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 drivers/gpu/drm/i915/display/skl_universal_plane.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index 7ee2114e420b7..2c3d11193caa7 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -1235,13 +1235,8 @@ static int skl_plane_check_fb(const struct intel_crtc_state *crtc_state,
 	/* Y-tiling is not supported in IF-ID Interlace mode */
 	if (crtc_state->hw.enable &&
 	    crtc_state->hw.adjusted_mode.flags & DRM_MODE_FLAG_INTERLACE &&
-	    (fb->modifier == I915_FORMAT_MOD_Y_TILED ||
-	     fb->modifier == I915_FORMAT_MOD_Yf_TILED ||
-	     fb->modifier == I915_FORMAT_MOD_Y_TILED_CCS ||
-	     fb->modifier == I915_FORMAT_MOD_Yf_TILED_CCS ||
-	     fb->modifier == I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS ||
-	     fb->modifier == I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS ||
-	     fb->modifier == I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC)) {
+	    fb->modifier != DRM_FORMAT_MOD_LINEAR &&
+	    fb->modifier != I915_FORMAT_MOD_X_TILED) {
 		drm_dbg_kms(&dev_priv->drm,
 			    "Y/Yf tiling not supported in IF-ID mode\n");
 		return -EINVAL;
-- 
2.27.0

