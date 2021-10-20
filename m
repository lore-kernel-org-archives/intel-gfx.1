Return-Path: <SRS0=m2z4=PI=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1542FC4332F
	for <intel-gfx@archiver.kernel.org>; Wed, 20 Oct 2021 19:52:03 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB758611C7
	for <intel-gfx@archiver.kernel.org>; Wed, 20 Oct 2021 19:52:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DB758611C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1F736EA10;
	Wed, 20 Oct 2021 19:51:59 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07B436E3C6
 for <intel-gfx@lists.freedesktop.org>; Wed, 20 Oct 2021 19:51:53 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10143"; a="209663445"
X-IronPort-AV: E=Sophos;i="5.87,167,1631602800"; d="scan'208";a="209663445"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2021 12:51:53 -0700
X-IronPort-AV: E=Sophos;i="5.87,167,1631602800"; d="scan'208";a="444495880"
Received: from ideak-desk.fi.intel.com ([10.237.68.141])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2021 12:51:52 -0700
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date: Wed, 20 Oct 2021 22:51:35 +0300
Message-Id: <20211020195138.1841242-9-imre.deak@intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211020195138.1841242-1-imre.deak@intel.com>
References: <20211020195138.1841242-1-imre.deak@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH v4 08/11] drm/i915: Handle CCS CC planes
 separately from CCS AUX planes
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

CCS CC planes are quite different from CCS AUX planes, even though we
regard the CC planes as a linear buffer having a 64 byte stride.  Thus
it's clearer to check for either CCS plane types explicitly when we need
to handle them; add the required CCS CC planes check here, while the
next patch will change all is_ccs_plane()/is_gen12_ccs_plane() checks to
consider only the CCS AUX planes.

Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_fb.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index a575d8dce3b11..0aa521f923611 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -415,7 +415,8 @@ static bool is_semiplanar_uv_plane(const struct drm_framebuffer *fb, int color_p
 bool is_surface_linear(const struct drm_framebuffer *fb, int color_plane)
 {
 	return fb->modifier == DRM_FORMAT_MOD_LINEAR ||
-	       is_gen12_ccs_plane(fb, color_plane);
+	       is_gen12_ccs_plane(fb, color_plane) ||
+	       is_gen12_ccs_cc_plane(fb, color_plane);
 }
 
 int main_to_ccs_plane(const struct drm_framebuffer *fb, int main_plane)
@@ -508,7 +509,8 @@ intel_tile_width_bytes(const struct drm_framebuffer *fb, int color_plane)
 	case I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS:
 	case I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC:
 	case I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS:
-		if (is_ccs_plane(fb, color_plane))
+		if (is_ccs_plane(fb, color_plane) ||
+		    is_gen12_ccs_cc_plane(fb, color_plane))
 			return 64;
 		fallthrough;
 	case I915_FORMAT_MOD_Y_TILED:
-- 
2.27.0

