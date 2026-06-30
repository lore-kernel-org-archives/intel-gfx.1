Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73415C43458
	for <intel-gfx@archiver.kernel.org>; Tue, 30 Jun 2026 09:08:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA25810EBE5;
	Tue, 30 Jun 2026 09:08:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AkG/MZER";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11EED10EAC5
 for <intel-gfx@lists.freedesktop.org>; Tue, 30 Jun 2026 09:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782810524; x=1814346524;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Bl1ulxMDL7dnA9NL2BbMFiT3ZEXvKyZsQVI5zhhEgs0=;
 b=AkG/MZEReacce0gdAnMX10cXmJDv1XUxmqDH6VOStw+JU2S0YzMiyQep
 1Mw8BxlZzFZKOwZVPqb1nlb6smQ8fONZEQGwSQ/AVGziinbJty09cKKQc
 6I76LUvg7T+lUPzw3MWzykngI+5nHtYpJcbyXxMdHD0lnlG/qqhf2Iz0v
 6YfBd93nmN1vfZt5KTqeNphpVTVsy9ZYB2b3D2HP6ZjpOqntdEdyFFWvq
 2pxH1bcZgdzNIduZzjsaAf4eWxHBm1opDSMow15D9TmH8fXF4NzJ4ySbw
 150+oipf2ozqAnHBkg+xJj+/4j2dKVYEmsctSX9W43LExxCpxDbYH94iX w==;
X-CSE-ConnectionGUID: VoCuFF1nSIGiaXzL+tUSjQ==
X-CSE-MsgGUID: d0shaQuhQ0uUIhmRtLTjkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="94900341"
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; d="scan'208";a="94900341"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2026 02:08:44 -0700
X-CSE-ConnectionGUID: Xl9qMK/4RtSTDlYEbPIOVA==
X-CSE-MsgGUID: dN5u9JEARh6xzphtNQbFww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; d="scan'208";a="256605024"
Received: from amilburn-desk.amilburn-desk (HELO hazy.intel.com)
 ([10.245.245.155])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2026 02:08:42 -0700
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/2] drm/i915/display: combine clock_gating init functions
 called late into one
Date: Tue, 30 Jun 2026 12:03:27 +0300
Message-ID: <20260630090829.2778879-3-luciano.coelho@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260630090829.2778879-1-luciano.coelho@intel.com>
References: <20260630090829.2778879-1-luciano.coelho@intel.com>
MIME-Version: 1.0
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

There are several separate display functions, one for each different
platform, that are called by the i915 driver, creating an
unnecessarily large interface complexity between them.

Following up on the previous commit, now combine all the functions
that are called late in the initialization into a single one, to
reduce the interface surface between the core and the display code
even more.

Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
---
 .../i915/display/intel_display_clock_gating.c | 47 +++++++++++++++----
 .../i915/display/intel_display_clock_gating.h | 11 +----
 drivers/gpu/drm/i915/intel_clock_gating.c     | 20 +++-----
 3 files changed, 45 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_clock_gating.c b/drivers/gpu/drm/i915/display/intel_display_clock_gating.c
index 62f086341a1b..d6f06a3d38e2 100644
--- a/drivers/gpu/drm/i915/display/intel_display_clock_gating.c
+++ b/drivers/gpu/drm/i915/display/intel_display_clock_gating.c
@@ -134,13 +134,13 @@ static void intel_display_glk_init_clock_gating(struct intel_display *display)
 		       PWM1_GATING_DIS | PWM2_GATING_DIS);
 }
 
-void intel_display_bdw_clock_gating_disable_fbcq(struct intel_display *display)
+static void intel_display_bdw_clock_gating_disable_fbcq(struct intel_display *display)
 {
 	/* WaFbcAsynchFlipDisableFbcQueue:hsw,bdw */
 	intel_de_rmw(display, CHICKEN_PIPESL_1(PIPE_A), 0, HSW_FBCQ_DIS);
 }
 
-void intel_display_bdw_clock_gating_vblank_in_srd(struct intel_display *display)
+static void intel_display_bdw_clock_gating_vblank_in_srd(struct intel_display *display)
 {
 	enum pipe pipe;
 
@@ -154,14 +154,21 @@ void intel_display_bdw_clock_gating_vblank_in_srd(struct intel_display *display)
 	}
 }
 
-void intel_display_bdw_clock_gating_kvm_notif(struct intel_display *display)
+static void intel_display_bdw_clock_gating_kvm_notif(struct intel_display *display)
 {
 	/* WaKVMNotificationOnConfigChange:bdw */
 	intel_de_rmw(display, CHICKEN_PAR2_1, 0,
 		     KVM_CONFIG_CHANGE_NOTIFICATION_SELECT);
 }
 
-void intel_display_hsw_init_clock_gating(struct intel_display *display)
+static void intel_display_bdw_init_clock_gating(struct intel_display *display)
+{
+	intel_display_bdw_clock_gating_disable_fbcq(display);
+	intel_display_bdw_clock_gating_vblank_in_srd(display);
+	intel_display_bdw_clock_gating_kvm_notif(display);
+}
+
+static void intel_display_hsw_init_clock_gating(struct intel_display *display)
 {
 	enum pipe pipe;
 
@@ -178,7 +185,7 @@ void intel_display_hsw_init_clock_gating(struct intel_display *display)
 	}
 }
 
-void intel_display_disable_trickle_feed(struct intel_display *display)
+static void intel_display_disable_trickle_feed(struct intel_display *display)
 {
 	enum pipe pipe;
 
@@ -191,7 +198,7 @@ void intel_display_disable_trickle_feed(struct intel_display *display)
 	}
 }
 
-void intel_display_ilk_init_clock_gating(struct intel_display *display)
+static void intel_display_ilk_init_clock_gating(struct intel_display *display)
 {
 	u32 dspclk_gate = ILK_VRHUNIT_CLOCK_GATE_DISABLE;
 
@@ -223,7 +230,7 @@ void intel_display_ilk_init_clock_gating(struct intel_display *display)
 	intel_display_disable_trickle_feed(display);
 }
 
-void intel_display_gen6_init_clock_gating(struct intel_display *display)
+static void intel_display_gen6_init_clock_gating(struct intel_display *display)
 {
 	u32 dspclk_gate = ILK_VRHUNIT_CLOCK_GATE_DISABLE;
 
@@ -244,13 +251,15 @@ void intel_display_gen6_init_clock_gating(struct intel_display *display)
 	intel_display_disable_trickle_feed(display);
 }
 
-void intel_display_ivb_init_clock_gating(struct intel_display *display)
+static void intel_display_ivb_init_clock_gating(struct intel_display *display)
 {
 	intel_de_write(display, ILK_DSPCLK_GATE_D, ILK_VRHUNIT_CLOCK_GATE_DISABLE);
 	intel_de_rmw(display, ILK_DISPLAY_CHICKEN1, 0, ILK_FBCQ_DIS);
+
+	intel_display_disable_trickle_feed(display);
 }
 
-void intel_display_g4x_init_clock_gating(struct intel_display *display)
+static void intel_display_g4x_init_clock_gating(struct intel_display *display)
 {
 	u32 dspclk_gate = VRHUNIT_CLOCK_GATE_DISABLE |
 			  OVRUNIT_CLOCK_GATE_DISABLE |
@@ -264,7 +273,7 @@ void intel_display_g4x_init_clock_gating(struct intel_display *display)
 	intel_display_disable_trickle_feed(display);
 }
 
-void intel_display_i965gm_init_clock_gating(struct intel_display *display)
+static void intel_display_i965gm_init_clock_gating(struct intel_display *display)
 {
 	intel_de_write(display, DSPCLK_GATE_D, 0);
 }
@@ -282,3 +291,21 @@ void intel_display_init_clock_gating_early(struct intel_display *display)
 	else if (display->platform.geminilake)
 		intel_display_glk_init_clock_gating(display);
 }
+
+void intel_display_init_clock_gating_late(struct intel_display *display)
+{
+	if (display->platform.broadwell)
+		intel_display_bdw_init_clock_gating(display);
+	else if (display->platform.haswell)
+		intel_display_hsw_init_clock_gating(display);
+	else if (display->platform.ivybridge)
+		intel_display_ivb_init_clock_gating(display);
+	else if (display->platform.sandybridge)
+		intel_display_gen6_init_clock_gating(display);
+	else if (display->platform.ironlake)
+		intel_display_ilk_init_clock_gating(display);
+	else if (display->platform.g4x)
+		intel_display_g4x_init_clock_gating(display);
+	else if (display->platform.i965gm)
+		intel_display_i965gm_init_clock_gating(display);
+}
diff --git a/drivers/gpu/drm/i915/display/intel_display_clock_gating.h b/drivers/gpu/drm/i915/display/intel_display_clock_gating.h
index 09124d6d438c..7eb0928fe8d0 100644
--- a/drivers/gpu/drm/i915/display/intel_display_clock_gating.h
+++ b/drivers/gpu/drm/i915/display/intel_display_clock_gating.h
@@ -9,15 +9,6 @@
 struct intel_display;
 
 void intel_display_init_clock_gating_early(struct intel_display *display);
-void intel_display_bdw_clock_gating_disable_fbcq(struct intel_display *display);
-void intel_display_bdw_clock_gating_vblank_in_srd(struct intel_display *display);
-void intel_display_bdw_clock_gating_kvm_notif(struct intel_display *display);
-void intel_display_hsw_init_clock_gating(struct intel_display *display);
-void intel_display_disable_trickle_feed(struct intel_display *display);
-void intel_display_ilk_init_clock_gating(struct intel_display *display);
-void intel_display_gen6_init_clock_gating(struct intel_display *display);
-void intel_display_ivb_init_clock_gating(struct intel_display *display);
-void intel_display_g4x_init_clock_gating(struct intel_display *display);
-void intel_display_i965gm_init_clock_gating(struct intel_display *display);
+void intel_display_init_clock_gating_late(struct intel_display *display);
 
 #endif /* __INTEL_DISPLAY_CLOCK_GATING_H__ */
diff --git a/drivers/gpu/drm/i915/intel_clock_gating.c b/drivers/gpu/drm/i915/intel_clock_gating.c
index 6d58ce8605a8..4c8c975ae354 100644
--- a/drivers/gpu/drm/i915/intel_clock_gating.c
+++ b/drivers/gpu/drm/i915/intel_clock_gating.c
@@ -73,7 +73,7 @@ static void ilk_init_clock_gating(struct drm_i915_private *i915)
 	intel_uncore_write(&i915->uncore, PCH_3DCGDIS1,
 			   VFMUNIT_CLOCK_GATE_DISABLE);
 
-	intel_display_ilk_init_clock_gating(i915->display);
+	intel_display_init_clock_gating_late(i915->display);
 	intel_pch_init_clock_gating(i915->display);
 }
 
@@ -90,7 +90,7 @@ static void gen6_check_mch_setup(struct drm_i915_private *i915)
 
 static void gen6_init_clock_gating(struct drm_i915_private *i915)
 {
-	intel_display_gen6_init_clock_gating(i915->display);
+	intel_display_init_clock_gating_late(i915->display);
 
 	intel_uncore_write(&i915->uncore, GEN6_UCGCTL1,
 			   intel_uncore_read(&i915->uncore, GEN6_UCGCTL1) |
@@ -205,13 +205,11 @@ static void skl_init_clock_gating(struct drm_i915_private *i915)
 
 static void bdw_init_clock_gating(struct drm_i915_private *i915)
 {
-	intel_display_bdw_clock_gating_disable_fbcq(i915->display);
+	intel_display_init_clock_gating_late(i915->display);
 
 	/* WaSwitchSolVfFArbitrationPriority:bdw */
 	intel_uncore_rmw(&i915->uncore, GAM_ECOCHK, 0, HSW_ECOCHK_ARB_PRIO_SOL);
 
-	intel_display_bdw_clock_gating_vblank_in_srd(i915->display);
-
 	/* WaVSRefCountFullforceMissDisable:bdw */
 	/* WaDSRefCountFullforceMissDisable:bdw */
 	intel_uncore_rmw(&i915->uncore, GEN7_FF_THREAD_MODE,
@@ -226,8 +224,6 @@ static void bdw_init_clock_gating(struct drm_i915_private *i915)
 	/* WaProgramL3SqcReg1Default:bdw */
 	gen8_set_l3sqc_credits(i915, 30, 2);
 
-	intel_display_bdw_clock_gating_kvm_notif(i915->display);
-
 	intel_pch_init_clock_gating(i915->display);
 
 	/* WaDisableDopClockGating:bdw
@@ -240,7 +236,7 @@ static void bdw_init_clock_gating(struct drm_i915_private *i915)
 
 static void hsw_init_clock_gating(struct drm_i915_private *i915)
 {
-	intel_display_hsw_init_clock_gating(i915->display);
+	intel_display_init_clock_gating_late(i915->display);
 
 	/* This is required by WaCatErrorRejectionIssue:hsw */
 	intel_uncore_rmw(&i915->uncore, GEN7_SQ_CHICKEN_MBCUNIT_CONFIG,
@@ -256,7 +252,7 @@ static void ivb_init_clock_gating(struct drm_i915_private *i915)
 {
 	struct intel_display *display = i915->display;
 
-	intel_display_ivb_init_clock_gating(display);
+	intel_display_init_clock_gating_late(display);
 
 	/* WaDisableBackToBackFlipFix:ivb */
 	intel_uncore_write(&i915->uncore, IVB_CHICKEN3,
@@ -285,8 +281,6 @@ static void ivb_init_clock_gating(struct drm_i915_private *i915)
 	intel_uncore_rmw(&i915->uncore, GEN7_SQ_CHICKEN_MBCUNIT_CONFIG,
 			 0, GEN7_SQ_CHICKEN_MBCUNIT_SQINTMOB);
 
-	intel_display_disable_trickle_feed(display);
-
 	intel_uncore_rmw(&i915->uncore, GEN6_MBCUNIT_SNPCR, GEN6_MBC_SNPCR_MASK,
 			 GEN6_MBC_SNPCR_MED);
 
@@ -362,7 +356,7 @@ static void g4x_init_clock_gating(struct drm_i915_private *i915)
 			   GS_UNIT_CLOCK_GATE_DISABLE |
 			   CL_UNIT_CLOCK_GATE_DISABLE);
 	intel_uncore_write(&i915->uncore, RAMCLK_GATE_D, 0);
-	intel_display_g4x_init_clock_gating(i915->display);
+	intel_display_init_clock_gating_late(i915->display);
 }
 
 static void i965gm_init_clock_gating(struct drm_i915_private *i915)
@@ -371,7 +365,7 @@ static void i965gm_init_clock_gating(struct drm_i915_private *i915)
 
 	intel_uncore_write(uncore, RENCLK_GATE_D1, I965_RCC_CLOCK_GATE_DISABLE);
 	intel_uncore_write(uncore, RENCLK_GATE_D2, 0);
-	intel_display_i965gm_init_clock_gating(i915->display);
+	intel_display_init_clock_gating_late(i915->display);
 	intel_uncore_write(uncore, RAMCLK_GATE_D, 0);
 	intel_uncore_write16(uncore, DEUC, 0);
 	intel_uncore_write(uncore,
-- 
2.53.0

