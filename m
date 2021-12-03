Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B0B9C433F5
	for <intel-gfx@archiver.kernel.org>; Fri,  3 Dec 2021 11:20:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C33F473B37;
	Fri,  3 Dec 2021 11:20:40 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2169473B37
 for <intel-gfx@lists.freedesktop.org>; Fri,  3 Dec 2021 11:20:39 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10186"; a="224200385"
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; d="scan'208";a="224200385"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2021 03:20:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; d="scan'208";a="460847959"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga006.jf.intel.com with SMTP; 03 Dec 2021 03:20:36 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 03 Dec 2021 13:20:35 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Fri,  3 Dec 2021 13:20:29 +0200
Message-Id: <20211203112029.1057-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211203112029.1057-1-ville.syrjala@linux.intel.com>
References: <20211203112029.1057-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 3/3] drm/i915:
 s/intel_get_first_crtc/intel_first_crtc/
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

Since we got rid of the "_get_" from intel_get_crtc_for_pipe()
let's do the same for intel_get_first_crtc() for consistency.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_audio.c   | 2 +-
 drivers/gpu/drm/i915/display/intel_crtc.c    | 2 +-
 drivers/gpu/drm/i915/display/intel_crtc.h    | 2 +-
 drivers/gpu/drm/i915/display/intel_display.c | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_audio.c b/drivers/gpu/drm/i915/display/intel_audio.c
index 03c3111ebdf0..3fdbae60a050 100644
--- a/drivers/gpu/drm/i915/display/intel_audio.c
+++ b/drivers/gpu/drm/i915/display/intel_audio.c
@@ -1019,7 +1019,7 @@ static void glk_force_audio_cdclk(struct drm_i915_private *dev_priv,
 	struct intel_crtc *crtc;
 	int ret;
 
-	crtc = intel_get_first_crtc(dev_priv);
+	crtc = intel_first_crtc(dev_priv);
 	if (!crtc)
 		return;
 
diff --git a/drivers/gpu/drm/i915/display/intel_crtc.c b/drivers/gpu/drm/i915/display/intel_crtc.c
index 6a9640767a05..d2c765455ac8 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc.c
@@ -36,7 +36,7 @@ static void assert_vblank_disabled(struct drm_crtc *crtc)
 		drm_crtc_vblank_put(crtc);
 }
 
-struct intel_crtc *intel_get_first_crtc(struct drm_i915_private *i915)
+struct intel_crtc *intel_first_crtc(struct drm_i915_private *i915)
 {
 	return to_intel_crtc(drm_crtc_from_index(&i915->drm, 0));
 }
diff --git a/drivers/gpu/drm/i915/display/intel_crtc.h b/drivers/gpu/drm/i915/display/intel_crtc.h
index f397f4b8ec47..73077137fb99 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc.h
+++ b/drivers/gpu/drm/i915/display/intel_crtc.h
@@ -29,7 +29,7 @@ void intel_crtc_vblank_off(const struct intel_crtc_state *crtc_state);
 void intel_pipe_update_start(struct intel_crtc_state *new_crtc_state);
 void intel_pipe_update_end(struct intel_crtc_state *new_crtc_state);
 void intel_wait_for_vblank_workers(struct intel_atomic_state *state);
-struct intel_crtc *intel_get_first_crtc(struct drm_i915_private *i915);
+struct intel_crtc *intel_first_crtc(struct drm_i915_private *i915);
 struct intel_crtc *intel_crtc_for_pipe(struct drm_i915_private *i915,
 				       enum pipe pipe);
 void intel_wait_for_vblank_if_active(struct drm_i915_private *i915,
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index aebb41195c41..038643080bf6 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -697,7 +697,7 @@ u32 intel_plane_fb_max_stride(struct drm_i915_private *dev_priv,
 	 * the highest stride limits of them all,
 	 * if in case pipe A is disabled, use the first pipe from pipe_mask.
 	 */
-	crtc = intel_get_first_crtc(dev_priv);
+	crtc = intel_first_crtc(dev_priv);
 	if (!crtc)
 		return 0;
 
-- 
2.32.0

