Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 502BBC47258
	for <intel-gfx@archiver.kernel.org>; Tue, 23 Jan 2024 09:03:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D848310E158;
	Tue, 23 Jan 2024 09:03:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A3C110E158
 for <intel-gfx@lists.freedesktop.org>; Tue, 23 Jan 2024 09:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706000585; x=1737536585;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=D+4p8ZD6sJSHHuide7ReniRyHxbRUUUzC/IJ13JRf2s=;
 b=IDsxT3Bq4BYAh5BcZXVSWCVZtGtGNxqLBWiTss1kbzBcneggIhuoMkhy
 q/ZLEbVhMsiR8MvpCegh6VZqXZhzc0FTtoVd/3K2WYJlZsy2hjKqBdHD/
 b89jfsis870Ujxx1i0V3QIx/kZcQevXx+NbR48b1yViYE9QcZ/nbMfdJa
 WRNUb3phQgZ6JiWa+qu4EFWoZFNT5PXy0RS9o/gSq1gyPvffGczoZyWP7
 z0Udl/sqtLkf6VorA4Ln8JHQjjhAUHO4dq0m2gwsHjROD5CttfXSIM4Wd
 i5gQTVvCHDlYu/mao3QHwAvaOkGG57IK7dejrHeAKRvwcLNwFjUmaBKEY g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="391883105"
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; d="scan'208";a="391883105"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 01:03:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="820020819"
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; d="scan'208";a="820020819"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 23 Jan 2024 01:02:45 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 23 Jan 2024 11:02:44 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/fbc: Allow FBC with CCS modifiers on SKL+
Date: Tue, 23 Jan 2024 11:02:44 +0200
Message-ID: <20240123090244.30025-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Only display workarounds 0391 and 0475 call for disabling
FBC with render compression, and those are listed only for
pre-prod SKL steppings. So it should be safe to enable
FB+CCS on production hardware.

AFAIK CCS is limited to 50% bandwidth reduction (perhaps
clear color can do better?). FBC can exceed that number
by quite a bit, given the right kind of framebuffer
contents. So piling on both kinds of compressions could
still make sense.

Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/10125
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbc.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index f17a1afb4929..b453fcbd67da 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -1087,18 +1087,7 @@ static bool i8xx_fbc_tiling_valid(const struct intel_plane_state *plane_state)
 
 static bool skl_fbc_tiling_valid(const struct intel_plane_state *plane_state)
 {
-	const struct drm_framebuffer *fb = plane_state->hw.fb;
-
-	switch (fb->modifier) {
-	case DRM_FORMAT_MOD_LINEAR:
-	case I915_FORMAT_MOD_Y_TILED:
-	case I915_FORMAT_MOD_Yf_TILED:
-	case I915_FORMAT_MOD_4_TILED:
-	case I915_FORMAT_MOD_X_TILED:
-		return true;
-	default:
-		return false;
-	}
+	return true;
 }
 
 static bool tiling_is_valid(const struct intel_plane_state *plane_state)
-- 
2.43.0

