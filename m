Return-Path: <SRS0=u2GV=OE=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B69F0C433EF
	for <intel-gfx@archiver.kernel.org>; Tue, 14 Sep 2021 18:26:56 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BE5A604E9
	for <intel-gfx@archiver.kernel.org>; Tue, 14 Sep 2021 18:26:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7BE5A604E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2282389E47;
	Tue, 14 Sep 2021 18:26:56 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 024E389E47
 for <intel-gfx@lists.freedesktop.org>; Tue, 14 Sep 2021 18:26:54 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10107"; a="218914512"
X-IronPort-AV: E=Sophos;i="5.85,292,1624345200"; d="scan'208";a="218914512"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2021 11:26:54 -0700
X-IronPort-AV: E=Sophos;i="5.85,292,1624345200"; d="scan'208";a="433108373"
Received: from lveltman-mobl.ger.corp.intel.com (HELO localhost)
 ([10.251.216.6])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2021 11:26:51 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: jani.nikula@intel.com, Dave Airlie <airlied@gmail.com>,
 Dave Airlie <airlied@redhat.com>
Date: Tue, 14 Sep 2021 21:25:12 +0300
Message-Id: <e04e051f5f1f4a5094ce2cf4450ec43c0618599d.1631643729.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1631643729.git.jani.nikula@intel.com>
References: <cover.1631643729.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 14/24] drm/i915: split the dpll clock compute
 out from display vtable.
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

From: Dave Airlie <airlied@redhat.com>

this single function might be possible to merge later, but
for now it's simple to just split it out.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Dave Airlie <airlied@redhat.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c |  6 +++---
 drivers/gpu/drm/i915/display/intel_dpll.c    | 16 ++++++++--------
 drivers/gpu/drm/i915/i915_drv.h              |  8 +++++++-
 3 files changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 6ed32100924c..49d7f0468002 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -6821,10 +6821,10 @@ static int intel_crtc_atomic_check(struct intel_atomic_state *state,
 		crtc_state->update_wm_post = true;
 
 	if (mode_changed && crtc_state->hw.enable &&
-	    dev_priv->display.crtc_compute_clock &&
+	    dev_priv->dpll_funcs.crtc_compute_clock &&
 	    !crtc_state->bigjoiner_slave &&
 	    !drm_WARN_ON(&dev_priv->drm, crtc_state->shared_dpll)) {
-		ret = dev_priv->display.crtc_compute_clock(crtc_state);
+		ret = dev_priv->dpll_funcs.crtc_compute_clock(crtc_state);
 		if (ret)
 			return ret;
 	}
@@ -8851,7 +8851,7 @@ static void intel_modeset_clear_plls(struct intel_atomic_state *state)
 	struct intel_crtc *crtc;
 	int i;
 
-	if (!dev_priv->display.crtc_compute_clock)
+	if (!dev_priv->dpll_funcs.crtc_compute_clock)
 		return;
 
 	for_each_new_intel_crtc_in_state(state, crtc, new_crtc_state, i) {
diff --git a/drivers/gpu/drm/i915/display/intel_dpll.c b/drivers/gpu/drm/i915/display/intel_dpll.c
index 210f91f4a576..9326c7cbb05c 100644
--- a/drivers/gpu/drm/i915/display/intel_dpll.c
+++ b/drivers/gpu/drm/i915/display/intel_dpll.c
@@ -1367,21 +1367,21 @@ void
 intel_dpll_init_clock_hook(struct drm_i915_private *dev_priv)
 {
 	if (DISPLAY_VER(dev_priv) >= 9 || HAS_DDI(dev_priv))
-		dev_priv->display.crtc_compute_clock = hsw_crtc_compute_clock;
+		dev_priv->dpll_funcs.crtc_compute_clock = hsw_crtc_compute_clock;
 	else if (HAS_PCH_SPLIT(dev_priv))
-		dev_priv->display.crtc_compute_clock = ilk_crtc_compute_clock;
+		dev_priv->dpll_funcs.crtc_compute_clock = ilk_crtc_compute_clock;
 	else if (IS_CHERRYVIEW(dev_priv))
-		dev_priv->display.crtc_compute_clock = chv_crtc_compute_clock;
+		dev_priv->dpll_funcs.crtc_compute_clock = chv_crtc_compute_clock;
 	else if (IS_VALLEYVIEW(dev_priv))
-		dev_priv->display.crtc_compute_clock = vlv_crtc_compute_clock;
+		dev_priv->dpll_funcs.crtc_compute_clock = vlv_crtc_compute_clock;
 	else if (IS_G4X(dev_priv))
-		dev_priv->display.crtc_compute_clock = g4x_crtc_compute_clock;
+		dev_priv->dpll_funcs.crtc_compute_clock = g4x_crtc_compute_clock;
 	else if (IS_PINEVIEW(dev_priv))
-		dev_priv->display.crtc_compute_clock = pnv_crtc_compute_clock;
+		dev_priv->dpll_funcs.crtc_compute_clock = pnv_crtc_compute_clock;
 	else if (DISPLAY_VER(dev_priv) != 2)
-		dev_priv->display.crtc_compute_clock = i9xx_crtc_compute_clock;
+		dev_priv->dpll_funcs.crtc_compute_clock = i9xx_crtc_compute_clock;
 	else
-		dev_priv->display.crtc_compute_clock = i8xx_crtc_compute_clock;
+		dev_priv->dpll_funcs.crtc_compute_clock = i8xx_crtc_compute_clock;
 }
 
 static bool i9xx_has_pps(struct drm_i915_private *dev_priv)
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 8f2d8a3888c2..51bbff28bb12 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -393,6 +393,10 @@ struct intel_fdi_funcs {
 			       const struct intel_crtc_state *crtc_state);
 };
 
+struct intel_dpll_funcs {
+	int (*crtc_compute_clock)(struct intel_crtc_state *crtc_state);
+};
+
 struct drm_i915_display_funcs {
 	/* Returns the active state of the crtc, and if the crtc is active,
 	 * fills out the pipe-config with the hw state. */
@@ -400,7 +404,6 @@ struct drm_i915_display_funcs {
 				struct intel_crtc_state *);
 	void (*get_initial_plane_config)(struct intel_crtc *,
 					 struct intel_initial_plane_config *);
-	int (*crtc_compute_clock)(struct intel_crtc_state *crtc_state);
 	void (*crtc_enable)(struct intel_atomic_state *state,
 			    struct intel_crtc *crtc);
 	void (*crtc_disable)(struct intel_atomic_state *state,
@@ -990,6 +993,9 @@ struct drm_i915_private {
 	/* fdi display functions */
 	struct intel_fdi_funcs fdi_funcs;
 
+	/* display pll funcs */
+	struct intel_dpll_funcs dpll_funcs;
+
 	/* Display functions */
 	struct drm_i915_display_funcs display;
 
-- 
2.30.2

