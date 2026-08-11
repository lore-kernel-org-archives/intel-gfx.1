Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9409BC5AC67
	for <intel-gfx@archiver.kernel.org>; Tue, 11 Aug 2026 09:54:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A78A10E2E6;
	Tue, 11 Aug 2026 09:54:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZFGvdlrV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 522F510E2E0
 for <intel-gfx@lists.freedesktop.org>; Tue, 11 Aug 2026 09:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786442085; x=1817978085;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FRCLNkrV6OkIfvlNcob1Z8BUSe66P0TuZzOyHjP8TjA=;
 b=ZFGvdlrVpAM6ReZwgrq0k3NAx5iqMWF80V4126BwVV+06o+6PWz3ySrF
 2d3oMEOba6gl6glbo0PQ0AX4LyUFAD9wYgRtrq8oYCYNocT+Co2UN+IO0
 fcDpOpOT+7wcDxk2+1dYnwsP7nS+uCliLs8xWwy/vzp2GGw+nlFQQRTd4
 jF7cRVl2fM/hpv7q78ymMLtd1LjGRSbvSE/r4Ujig8if0vzI8JXsEmWxJ
 GnDDf/rdK1R4lTWwllwaP3/+GeefaIaAOoQdQiKaTvaU6TRlu2GHBZkVK
 DMKrYSbiZoa/O3xsGVydZv4fyPPSY732y931CFSGIh7bEYOfhBWPnPbHj w==;
X-CSE-ConnectionGUID: oCveK8/9RByCwq2jdwiXWg==
X-CSE-MsgGUID: jQm8vPc6QRGAqcyqDTAWaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="104359913"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="104359913"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 02:54:45 -0700
X-CSE-ConnectionGUID: 1j+C7x51Qy+1jC77uRmMkg==
X-CSE-MsgGUID: 6uF0u9R6SeGjFi645YDBig==
X-ExtLoop1: 1
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO hazy.intel.com)
 ([10.245.245.2])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 02:54:42 -0700
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH v2 2/5] drm/i915/display: consolidate remaining clock gating
 initialization
Date: Tue, 11 Aug 2026 12:49:10 +0300
Message-ID: <20260811095427.1147852-3-luciano.coelho@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260811095427.1147852-1-luciano.coelho@intel.com>
References: <20260811095427.1147852-1-luciano.coelho@intel.com>
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

The remaining platform-specific display clock gating functions are
still called directly by i915.

Extend intel_display_init_clock_gating() so that it calls the correct
functions for the remaining platforms.

This groups Broadwell's three display operations into a single
function.  This changes the call order slighlty in relation to
non-display workarounds, but it shouldn't be a problem.  For IVB, we
move the trickle-feed programming to the display helper and runs with
the other display register setup.

Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
---
 .../i915/display/intel_display_clock_gating.c | 43 ++++++++++++++-----
 .../i915/display/intel_display_clock_gating.h | 10 -----
 drivers/gpu/drm/i915/intel_clock_gating.c     | 20 +++------
 3 files changed, 40 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_clock_gating.c b/drivers/gpu/drm/i915/display/intel_display_clock_gating.c
index d5ecdaeab421..ef1ee72494df 100644
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
@@ -281,4 +290,18 @@ void intel_display_init_clock_gating(struct intel_display *display)
 		intel_display_bxt_init_clock_gating(display);
 	else if (display->platform.geminilake)
 		intel_display_glk_init_clock_gating(display);
+	else if (display->platform.broadwell)
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
 }
diff --git a/drivers/gpu/drm/i915/display/intel_display_clock_gating.h b/drivers/gpu/drm/i915/display/intel_display_clock_gating.h
index 4e50e388656a..dbfa5892cffe 100644
--- a/drivers/gpu/drm/i915/display/intel_display_clock_gating.h
+++ b/drivers/gpu/drm/i915/display/intel_display_clock_gating.h
@@ -9,15 +9,5 @@
 struct intel_display;
 
 void intel_display_init_clock_gating(struct intel_display *display);
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
 
 #endif /* __INTEL_DISPLAY_CLOCK_GATING_H__ */
diff --git a/drivers/gpu/drm/i915/intel_clock_gating.c b/drivers/gpu/drm/i915/intel_clock_gating.c
index 84f838c660fd..c5c4441f3a61 100644
--- a/drivers/gpu/drm/i915/intel_clock_gating.c
+++ b/drivers/gpu/drm/i915/intel_clock_gating.c
@@ -73,7 +73,7 @@ static void ilk_init_clock_gating(struct drm_i915_private *i915)
 	intel_uncore_write(&i915->uncore, PCH_3DCGDIS1,
 			   VFMUNIT_CLOCK_GATE_DISABLE);
 
-	intel_display_ilk_init_clock_gating(i915->display);
+	intel_display_init_clock_gating(i915->display);
 	intel_pch_init_clock_gating(i915->display);
 }
 
@@ -90,7 +90,7 @@ static void gen6_check_mch_setup(struct drm_i915_private *i915)
 
 static void gen6_init_clock_gating(struct drm_i915_private *i915)
 {
-	intel_display_gen6_init_clock_gating(i915->display);
+	intel_display_init_clock_gating(i915->display);
 
 	intel_uncore_write(&i915->uncore, GEN6_UCGCTL1,
 			   intel_uncore_read(&i915->uncore, GEN6_UCGCTL1) |
@@ -205,13 +205,11 @@ static void skl_init_clock_gating(struct drm_i915_private *i915)
 
 static void bdw_init_clock_gating(struct drm_i915_private *i915)
 {
-	intel_display_bdw_clock_gating_disable_fbcq(i915->display);
+	intel_display_init_clock_gating(i915->display);
 
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
+	intel_display_init_clock_gating(i915->display);
 
 	/* This is required by WaCatErrorRejectionIssue:hsw */
 	intel_uncore_rmw(&i915->uncore, GEN7_SQ_CHICKEN_MBCUNIT_CONFIG,
@@ -256,7 +252,7 @@ static void ivb_init_clock_gating(struct drm_i915_private *i915)
 {
 	struct intel_display *display = i915->display;
 
-	intel_display_ivb_init_clock_gating(display);
+	intel_display_init_clock_gating(display);
 
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
+	intel_display_init_clock_gating(i915->display);
 }
 
 static void i965gm_init_clock_gating(struct drm_i915_private *i915)
@@ -371,7 +365,7 @@ static void i965gm_init_clock_gating(struct drm_i915_private *i915)
 
 	intel_uncore_write(uncore, RENCLK_GATE_D1, I965_RCC_CLOCK_GATE_DISABLE);
 	intel_uncore_write(uncore, RENCLK_GATE_D2, 0);
-	intel_display_i965gm_init_clock_gating(i915->display);
+	intel_display_init_clock_gating(i915->display);
 	intel_uncore_write(uncore, RAMCLK_GATE_D, 0);
 	intel_uncore_write16(uncore, DEUC, 0);
 	intel_uncore_write(uncore,
-- 
2.53.0

