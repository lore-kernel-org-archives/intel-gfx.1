Return-Path: <SRS0=u2GV=OE=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 885CBC433F5
	for <intel-gfx@archiver.kernel.org>; Tue, 14 Sep 2021 18:26:49 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D91660187
	for <intel-gfx@archiver.kernel.org>; Tue, 14 Sep 2021 18:26:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4D91660187
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C60B289E3B;
	Tue, 14 Sep 2021 18:26:48 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 044D089E3B
 for <intel-gfx@lists.freedesktop.org>; Tue, 14 Sep 2021 18:26:47 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10107"; a="209327327"
X-IronPort-AV: E=Sophos;i="5.85,292,1624345200"; d="scan'208";a="209327327"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2021 11:26:47 -0700
X-IronPort-AV: E=Sophos;i="5.85,292,1624345200"; d="scan'208";a="650877975"
Received: from lveltman-mobl.ger.corp.intel.com (HELO localhost)
 ([10.251.216.6])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2021 11:26:45 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: jani.nikula@intel.com, Dave Airlie <airlied@gmail.com>,
 Dave Airlie <airlied@redhat.com>
Date: Tue, 14 Sep 2021 21:25:11 +0300
Message-Id: <63727c083cd1afe3cf2ad088e125f67084e3e1c7.1631643729.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1631643729.git.jani.nikula@intel.com>
References: <cover.1631643729.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 13/24] drm/i915: split fdi link training from
 display vtable.
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

It may make sense to merge this with display again later,
however the fdi use of the vtable is limited to only a
few generations.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Dave Airlie <airlied@redhat.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fdi.c |  8 ++++----
 drivers/gpu/drm/i915/i915_drv.h          | 11 ++++++++---
 2 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fdi.c b/drivers/gpu/drm/i915/display/intel_fdi.c
index 339243399a65..94bb7e039fe7 100644
--- a/drivers/gpu/drm/i915/display/intel_fdi.c
+++ b/drivers/gpu/drm/i915/display/intel_fdi.c
@@ -15,7 +15,7 @@ void intel_fdi_link_train(struct intel_crtc *crtc,
 {
 	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
 
-	dev_priv->display.fdi_link_train(crtc, crtc_state);
+	dev_priv->fdi_funcs.fdi_link_train(crtc, crtc_state);
 }
 
 /* units of 100MHz */
@@ -1017,11 +1017,11 @@ void
 intel_fdi_init_hook(struct drm_i915_private *dev_priv)
 {
 	if (IS_IRONLAKE(dev_priv)) {
-		dev_priv->display.fdi_link_train = ilk_fdi_link_train;
+		dev_priv->fdi_funcs.fdi_link_train = ilk_fdi_link_train;
 	} else if (IS_SANDYBRIDGE(dev_priv)) {
-		dev_priv->display.fdi_link_train = gen6_fdi_link_train;
+		dev_priv->fdi_funcs.fdi_link_train = gen6_fdi_link_train;
 	} else if (IS_IVYBRIDGE(dev_priv)) {
 		/* FIXME: detect B0+ stepping and use auto training */
-		dev_priv->display.fdi_link_train = ivb_manual_fdi_link_train;
+		dev_priv->fdi_funcs.fdi_link_train = ivb_manual_fdi_link_train;
 	}
 }
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 0f549187b2f3..8f2d8a3888c2 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -388,6 +388,11 @@ struct intel_hotplug_funcs {
 	void (*hpd_irq_setup)(struct drm_i915_private *dev_priv);
 };
 
+struct intel_fdi_funcs {
+	void (*fdi_link_train)(struct intel_crtc *crtc,
+			       const struct intel_crtc_state *crtc_state);
+};
+
 struct drm_i915_display_funcs {
 	/* Returns the active state of the crtc, and if the crtc is active,
 	 * fills out the pipe-config with the hw state. */
@@ -403,9 +408,6 @@ struct drm_i915_display_funcs {
 	void (*commit_modeset_enables)(struct intel_atomic_state *state);
 	void (*commit_modeset_disables)(struct intel_atomic_state *state);
 
-	void (*fdi_link_train)(struct intel_crtc *crtc,
-			       const struct intel_crtc_state *crtc_state);
-
 	/* clock updates for mode set */
 	/* cursor updates */
 	/* render clock increase/decrease */
@@ -985,6 +987,9 @@ struct drm_i915_private {
 	/* irq display functions */
 	struct intel_hotplug_funcs hotplug_funcs;
 
+	/* fdi display functions */
+	struct intel_fdi_funcs fdi_funcs;
+
 	/* Display functions */
 	struct drm_i915_display_funcs display;
 
-- 
2.30.2

