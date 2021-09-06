Return-Path: <SRS0=0xFZ=N4=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8909EC4332F
	for <intel-gfx@archiver.kernel.org>; Mon,  6 Sep 2021 18:27:28 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BA096103B
	for <intel-gfx@archiver.kernel.org>; Mon,  6 Sep 2021 18:27:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5BA096103B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57A4289BF8;
	Mon,  6 Sep 2021 18:27:24 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3C9E89BF8
 for <intel-gfx@lists.freedesktop.org>; Mon,  6 Sep 2021 18:27:23 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10099"; a="219713101"
X-IronPort-AV: E=Sophos;i="5.85,273,1624345200"; d="scan'208";a="219713101"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2021 11:27:23 -0700
X-IronPort-AV: E=Sophos;i="5.85,273,1624345200"; d="scan'208";a="464124864"
Received: from ideak-desk.fi.intel.com ([10.237.68.141])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2021 11:27:22 -0700
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date: Mon,  6 Sep 2021 21:27:13 +0300
Message-Id: <20210906182715.3915100-5-imre.deak@intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210906182715.3915100-1-imre.deak@intel.com>
References: <20210906182715.3915100-1-imre.deak@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH v2 4/6] drm/i915: Follow a new->old platform
 check order in intel_fb_stride_alignment
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

Follow the usual new->old order in intel_fb_stride_alignment() platform
check ladder.

Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_fb.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index a0db67e85c717..479c76c7958ce 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -1158,6 +1158,12 @@ intel_fb_stride_alignment(const struct drm_framebuffer *fb, int color_plane)
 
 	tile_width = intel_tile_width_bytes(fb, color_plane);
 	if (is_ccs_modifier(fb->modifier)) {
+		/*
+		 * On TGL the surface stride must be 4 tile aligned, mapped by
+		 * one 64 byte cacheline on the CCS AUX surface.
+		 */
+		if (DISPLAY_VER(dev_priv) >= 12)
+			tile_width *= 4;
 		/*
 		 * Display WA #0531: skl,bxt,kbl,glk
 		 *
@@ -1167,14 +1173,8 @@ intel_fb_stride_alignment(const struct drm_framebuffer *fb, int color_plane)
 		 * require the entire fb to accommodate that to avoid
 		 * potential runtime errors at plane configuration time.
 		 */
-		if ((DISPLAY_VER(dev_priv) == 9 || IS_GEMINILAKE(dev_priv)) &&
-		    color_plane == 0 && fb->width > 3840)
-			tile_width *= 4;
-		/*
-		 * The main surface pitch must be padded to a multiple of four
-		 * tile widths.
-		 */
-		else if (DISPLAY_VER(dev_priv) >= 12)
+		else if ((DISPLAY_VER(dev_priv) == 9 || IS_GEMINILAKE(dev_priv)) &&
+			 color_plane == 0 && fb->width > 3840)
 			tile_width *= 4;
 	}
 	return tile_width;
-- 
2.27.0

