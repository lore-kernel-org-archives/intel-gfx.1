Return-Path: <SRS0=3Vrl=O4=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0D07C433F5
	for <intel-gfx@archiver.kernel.org>; Fri,  8 Oct 2021 00:19:46 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C00661073
	for <intel-gfx@archiver.kernel.org>; Fri,  8 Oct 2021 00:19:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9C00661073
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E57066E06E;
	Fri,  8 Oct 2021 00:19:42 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34BE26E060
 for <intel-gfx@lists.freedesktop.org>; Fri,  8 Oct 2021 00:19:40 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10130"; a="226301643"
X-IronPort-AV: E=Sophos;i="5.85,356,1624345200"; d="scan'208";a="226301643"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2021 17:19:22 -0700
X-IronPort-AV: E=Sophos;i="5.85,356,1624345200"; d="scan'208";a="489235300"
Received: from ideak-desk.fi.intel.com ([10.237.68.141])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2021 17:19:22 -0700
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Fri,  8 Oct 2021 03:19:11 +0300
Message-Id: <20211008001915.3508011-4-imre.deak@intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211007203517.3364336-6-imre.deak@intel.com>
References: <20211007203517.3364336-6-imre.deak@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH v2 05/11] drm/i915: Unexport
 is_semiplanar_uv_plane()
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

This function is only used by intel_fb.c, so unexport it.

Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fb.c | 2 +-
 drivers/gpu/drm/i915/display/intel_fb.h | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index c15d17d2983d4..2523d5baf59ae 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -345,7 +345,7 @@ bool is_gen12_ccs_cc_plane(const struct drm_framebuffer *fb, int plane)
 	       plane == 2;
 }
 
-bool is_semiplanar_uv_plane(const struct drm_framebuffer *fb, int color_plane)
+static bool is_semiplanar_uv_plane(const struct drm_framebuffer *fb, int color_plane)
 {
 	return intel_format_info_is_yuv_semiplanar(fb->format, fb->modifier) &&
 		color_plane == 1;
diff --git a/drivers/gpu/drm/i915/display/intel_fb.h b/drivers/gpu/drm/i915/display/intel_fb.h
index a87c58a3219cd..65b5dd9468ff2 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.h
+++ b/drivers/gpu/drm/i915/display/intel_fb.h
@@ -33,7 +33,6 @@ enum intel_plane_caps {
 bool is_ccs_plane(const struct drm_framebuffer *fb, int plane);
 bool is_gen12_ccs_plane(const struct drm_framebuffer *fb, int plane);
 bool is_gen12_ccs_cc_plane(const struct drm_framebuffer *fb, int plane);
-bool is_semiplanar_uv_plane(const struct drm_framebuffer *fb, int color_plane);
 
 u64 *intel_fb_plane_get_modifiers(struct drm_i915_private *i915,
 				  enum intel_plane_caps plane_caps);
-- 
2.27.0

