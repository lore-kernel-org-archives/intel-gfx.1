Return-Path: <SRS0=0xFZ=N4=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC481C433F5
	for <intel-gfx@archiver.kernel.org>; Mon,  6 Sep 2021 18:27:25 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77B2F6103C
	for <intel-gfx@archiver.kernel.org>; Mon,  6 Sep 2021 18:27:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 77B2F6103C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACD0D89BFB;
	Mon,  6 Sep 2021 18:27:23 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 422A2899F2
 for <intel-gfx@lists.freedesktop.org>; Mon,  6 Sep 2021 18:27:21 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10099"; a="219713098"
X-IronPort-AV: E=Sophos;i="5.85,273,1624345200"; d="scan'208";a="219713098"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2021 11:27:21 -0700
X-IronPort-AV: E=Sophos;i="5.85,273,1624345200"; d="scan'208";a="464124853"
Received: from ideak-desk.fi.intel.com ([10.237.68.141])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2021 11:27:20 -0700
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date: Mon,  6 Sep 2021 21:27:11 +0300
Message-Id: <20210906182715.3915100-3-imre.deak@intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210906182715.3915100-1-imre.deak@intel.com>
References: <20210906182715.3915100-1-imre.deak@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH v2 2/6] drm/i915/adlp: Require always a
 power-of-two sized CCS surface stride
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

At the moment CCS FB strides must be power-of-two sized, but a follow-up
change will add support remapping these FBs, allowing the FB passed in
by userspace to have a non-POT sized stride. For these remapped FBs we
can only remap the main surface, not the CCS surface. This means that
userspace has to always generate the CCS surface aligning to the POT
stride padded main surface (by setting up the CCS AUX pagetables
accordingly). Adjust the CCS surface stride check to enforce this.

No functional change.

v2:
- Fix the gen12_ccs_aux_stride() is not static sparse warning.

Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_fb.c | 34 ++++++++++++++++++++++---
 1 file changed, 30 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index 0cf568a9cb1c6..a0db67e85c717 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -63,10 +63,36 @@ int skl_ccs_to_main_plane(const struct drm_framebuffer *fb, int ccs_plane)
 	return ccs_plane - fb->format->num_planes / 2;
 }
 
-static int gen12_ccs_aux_stride(struct drm_framebuffer *fb, int ccs_plane)
+static unsigned int gen12_aligned_scanout_stride(const struct intel_framebuffer *fb,
+						 int color_plane)
 {
-	return DIV_ROUND_UP(fb->pitches[skl_ccs_to_main_plane(fb, ccs_plane)],
-			    512) * 64;
+	struct drm_i915_private *i915 = to_i915(fb->base.dev);
+	unsigned int stride = fb->base.pitches[color_plane];
+
+	if (IS_ALDERLAKE_P(i915))
+		return roundup_pow_of_two(max(stride,
+					      8u * intel_tile_width_bytes(&fb->base, color_plane)));
+
+	return stride;
+}
+
+static unsigned int gen12_ccs_aux_stride(struct intel_framebuffer *fb, int ccs_plane)
+{
+	struct drm_i915_private *i915 = to_i915(fb->base.dev);
+	int main_plane = skl_ccs_to_main_plane(&fb->base, ccs_plane);
+	unsigned int main_stride = fb->base.pitches[main_plane];
+	unsigned int main_tile_width = intel_tile_width_bytes(&fb->base, main_plane);
+
+	/*
+	 * On ADL-P the AUX stride must align with a power-of-two aligned main
+	 * surface stride. The stride of the allocated main surface object can
+	 * be less than this POT stride, which is then autopadded to the POT
+	 * size.
+	 */
+	if (IS_ALDERLAKE_P(i915))
+		main_stride = gen12_aligned_scanout_stride(fb, main_plane);
+
+	return DIV_ROUND_UP(main_stride, 4 * main_tile_width) * 64;
 }
 
 int skl_main_to_aux_plane(const struct drm_framebuffer *fb, int main_plane)
@@ -1379,7 +1405,7 @@ int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
 		}
 
 		if (is_gen12_ccs_plane(fb, i) && !is_gen12_ccs_cc_plane(fb, i)) {
-			int ccs_aux_stride = gen12_ccs_aux_stride(fb, i);
+			int ccs_aux_stride = gen12_ccs_aux_stride(intel_fb, i);
 
 			if (fb->pitches[i] != ccs_aux_stride) {
 				drm_dbg_kms(&dev_priv->drm,
-- 
2.27.0

