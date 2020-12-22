Return-Path: <SRS0=+4rd=F2=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBC75C433DB
	for <intel-gfx@archiver.kernel.org>; Tue, 22 Dec 2020 14:51:04 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 871F5221FC
	for <intel-gfx@archiver.kernel.org>; Tue, 22 Dec 2020 14:51:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 871F5221FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 157CD6E889;
	Tue, 22 Dec 2020 14:51:04 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A7176E889
 for <intel-gfx@lists.freedesktop.org>; Tue, 22 Dec 2020 14:51:02 +0000 (UTC)
IronPort-SDR: QlxCO6F0L7+9ku9sM65pXoHBxaYfqK9HKIj1t08ItkIk1siNnE1FY08pvf8zb4lTWsn7c8PYE5
 vzXTWFMnEg3g==
X-IronPort-AV: E=McAfee;i="6000,8403,9842"; a="162931216"
X-IronPort-AV: E=Sophos;i="5.78,439,1599548400"; d="scan'208";a="162931216"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2020 06:50:43 -0800
IronPort-SDR: jOnOGnDobLVR5IRq60+BAHvuUaa1quzpEDa/OWMn85J5fWebG2mONyEV3x9/gj1NRKEVN9YORQ
 pwiDoKEJpmHw==
X-IronPort-AV: E=Sophos;i="5.78,438,1599548400"; d="scan'208";a="356455475"
Received: from sauterhx-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.59.229])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2020 06:50:42 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue, 22 Dec 2020 16:49:48 +0200
Message-Id: <aa645d7124f995fda140ec594de7203647a784fa.1608648128.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1608648128.git.jani.nikula@intel.com>
References: <cover.1608648128.git.jani.nikula@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 08/13] drm/i915/pps: abstract intel_pps_reinit()
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
Cc: jani.nikula@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Add a "reinit" call to hide some more pps functions, and clean up the
callers. A minor functional change is not holding the pps lock across
the whole operation in intel_dp_encoder_reset, but instead doing it in
two steps.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c  | 20 +++++---------------
 drivers/gpu/drm/i915/display/intel_pps.c | 21 +++++++++++++++++++--
 drivers/gpu/drm/i915/display/intel_pps.h |  3 +--
 3 files changed, 25 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index de2642d5be3b..334ba1775cd3 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -5859,30 +5859,20 @@ void intel_dp_encoder_reset(struct drm_encoder *encoder)
 {
 	struct drm_i915_private *dev_priv = to_i915(encoder->dev);
 	struct intel_dp *intel_dp = enc_to_intel_dp(to_intel_encoder(encoder));
-	intel_wakeref_t wakeref;
 
 	if (!HAS_DDI(dev_priv))
 		intel_dp->DP = intel_de_read(dev_priv, intel_dp->output_reg);
 
 	intel_dp->reset_link_params = true;
 
-	if (!IS_VALLEYVIEW(dev_priv) && !IS_CHERRYVIEW(dev_priv) &&
-	    !intel_dp_is_edp(intel_dp))
-		return;
+	if (IS_VALLEYVIEW(dev_priv) || IS_CHERRYVIEW(dev_priv)) {
+		intel_wakeref_t wakeref;
 
-	with_intel_pps_lock(intel_dp, wakeref) {
-		if (IS_VALLEYVIEW(dev_priv) || IS_CHERRYVIEW(dev_priv))
+		with_intel_pps_lock(intel_dp, wakeref)
 			intel_dp->active_pipe = vlv_active_pipe(intel_dp);
-
-		if (intel_dp_is_edp(intel_dp)) {
-			/*
-			 * Reinit the power sequencer, in case BIOS did
-			 * something nasty with it.
-			 */
-			intel_dp_pps_init(intel_dp);
-			intel_pps_vdd_sanitize(intel_dp);
-		}
 	}
+
+	intel_pps_reinit(intel_dp);
 }
 
 static int intel_modeset_tile_group(struct intel_atomic_state *state,
diff --git a/drivers/gpu/drm/i915/display/intel_pps.c b/drivers/gpu/drm/i915/display/intel_pps.c
index 651c79ce4bdd..3e62d1450682 100644
--- a/drivers/gpu/drm/i915/display/intel_pps.c
+++ b/drivers/gpu/drm/i915/display/intel_pps.c
@@ -1043,7 +1043,7 @@ void vlv_init_panel_power_sequencer(struct intel_encoder *encoder,
 	intel_dp_init_panel_power_sequencer_registers(intel_dp, true);
 }
 
-void intel_pps_vdd_sanitize(struct intel_dp *intel_dp)
+static void intel_pps_vdd_sanitize(struct intel_dp *intel_dp)
 {
 	struct drm_i915_private *dev_priv = dp_to_i915(intel_dp);
 	struct intel_digital_port *dig_port = dp_to_dig_port(intel_dp);
@@ -1340,7 +1340,7 @@ intel_dp_init_panel_power_sequencer_registers(struct intel_dp *intel_dp,
 		    (intel_de_read(dev_priv, regs.pp_ctrl) & BXT_POWER_CYCLE_DELAY_MASK));
 }
 
-void intel_dp_pps_init(struct intel_dp *intel_dp)
+static void intel_dp_pps_init(struct intel_dp *intel_dp)
 {
 	struct drm_i915_private *dev_priv = dp_to_i915(intel_dp);
 
@@ -1352,6 +1352,23 @@ void intel_dp_pps_init(struct intel_dp *intel_dp)
 	}
 }
 
+void intel_pps_reinit(struct intel_dp *intel_dp)
+{
+	intel_wakeref_t wakeref;
+
+	if (!intel_dp_is_edp(intel_dp))
+		return;
+
+	with_intel_pps_lock(intel_dp, wakeref) {
+		/*
+		 * Reinit the power sequencer, in case BIOS did something nasty
+		 * with it.
+		 */
+		intel_dp_pps_init(intel_dp);
+		intel_pps_vdd_sanitize(intel_dp);
+	}
+}
+
 void intel_pps_init(struct intel_dp *intel_dp)
 {
 	intel_wakeref_t wakeref;
diff --git a/drivers/gpu/drm/i915/display/intel_pps.h b/drivers/gpu/drm/i915/display/intel_pps.h
index 53c0fafd1440..4780b59a59df 100644
--- a/drivers/gpu/drm/i915/display/intel_pps.h
+++ b/drivers/gpu/drm/i915/display/intel_pps.h
@@ -32,7 +32,6 @@ void intel_pps_vdd_off_unlocked(struct intel_dp *intel_dp, bool sync);
 void intel_pps_on_unlocked(struct intel_dp *intel_dp);
 void intel_pps_off_unlocked(struct intel_dp *intel_dp);
 
-void intel_pps_vdd_sanitize(struct intel_dp *intel_dp);
 void intel_pps_vdd_on(struct intel_dp *intel_dp);
 void intel_pps_on(struct intel_dp *intel_dp);
 void intel_pps_off(struct intel_dp *intel_dp);
@@ -42,7 +41,7 @@ bool intel_pps_have_power(struct intel_dp *intel_dp);
 void wait_panel_power_cycle(struct intel_dp *intel_dp);
 
 void intel_pps_init(struct intel_dp *intel_dp);
-void intel_dp_pps_init(struct intel_dp *intel_dp);
+void intel_pps_reinit(struct intel_dp *intel_dp);
 void intel_power_sequencer_reset(struct drm_i915_private *i915);
 
 void vlv_init_panel_power_sequencer(struct intel_encoder *encoder,
-- 
2.20.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
