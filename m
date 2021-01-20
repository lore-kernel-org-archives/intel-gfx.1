Return-Path: <SRS0=b/6W=GX=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B70E8C433E0
	for <intel-gfx@archiver.kernel.org>; Wed, 20 Jan 2021 10:18:44 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC16723330
	for <intel-gfx@archiver.kernel.org>; Wed, 20 Jan 2021 10:18:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC16723330
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D3A46E141;
	Wed, 20 Jan 2021 10:18:43 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26A956E141
 for <intel-gfx@lists.freedesktop.org>; Wed, 20 Jan 2021 10:18:42 +0000 (UTC)
IronPort-SDR: EvySpkV86VPH2pw4725x9ETwQQgOVRUawsGgjZj7BsLvxbP9l4DDDJezzTZtStfjKSHI/3ti/B
 sBQ48vKMcsLQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9869"; a="263889211"
X-IronPort-AV: E=Sophos;i="5.79,360,1602572400"; d="scan'208";a="263889211"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2021 02:18:40 -0800
IronPort-SDR: adaSyJbfbURJmoVZq1HiIGxp67T0abty7h/NTSZbnbIA8Htuylc/re0rT5QTmt/IPH8SAwOK2L
 pcvpp1/JB+BA==
X-IronPort-AV: E=Sophos;i="5.79,360,1602572400"; d="scan'208";a="384786147"
Received: from oreunova-mobl1.ccr.corp.intel.com (HELO localhost)
 ([10.252.45.61])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2021 02:18:38 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Wed, 20 Jan 2021 12:18:31 +0200
Message-Id: <20210120101834.19813-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 1/4] drm/i915/pps: refactor init abstractions
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

Once you realize there is no need to hold the pps mutex when calling
pps_init_timestamps() in intel_pps_init(), we can reuse
intel_pps_encoder_reset() which has the same code.

Since intel_dp_pps_init() is only called from one place now, move it
inline to remove one "init" function altogether.

Finally, remove some initialization from
vlv_initial_power_sequencer_setup() and do it in the caller to highlight
the similarity, not the difference, in the platforms.

v2: Fix comment (Anshuman)

Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_pps.c | 37 ++++++++----------------
 1 file changed, 12 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_pps.c b/drivers/gpu/drm/i915/display/intel_pps.c
index 58eff6289d12..da6ee0b52741 100644
--- a/drivers/gpu/drm/i915/display/intel_pps.c
+++ b/drivers/gpu/drm/i915/display/intel_pps.c
@@ -305,9 +305,6 @@ vlv_initial_power_sequencer_setup(struct intel_dp *intel_dp)
 		    dig_port->base.base.base.id,
 		    dig_port->base.base.name,
 		    pipe_name(intel_dp->pps_pipe));
-
-	pps_init_delays(intel_dp);
-	pps_init_registers(intel_dp, false);
 }
 
 void intel_pps_reset_all(struct drm_i915_private *dev_priv)
@@ -1342,20 +1339,9 @@ static void pps_init_registers(struct intel_dp *intel_dp, bool force_disable_vdd
 		    (intel_de_read(dev_priv, regs.pp_ctrl) & BXT_POWER_CYCLE_DELAY_MASK));
 }
 
-static void intel_dp_pps_init(struct intel_dp *intel_dp)
-{
-	struct drm_i915_private *dev_priv = dp_to_i915(intel_dp);
-
-	if (IS_VALLEYVIEW(dev_priv) || IS_CHERRYVIEW(dev_priv)) {
-		vlv_initial_power_sequencer_setup(intel_dp);
-	} else {
-		pps_init_delays(intel_dp);
-		pps_init_registers(intel_dp, false);
-	}
-}
-
 void intel_pps_encoder_reset(struct intel_dp *intel_dp)
 {
+	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
 	intel_wakeref_t wakeref;
 
 	if (!intel_dp_is_edp(intel_dp))
@@ -1363,23 +1349,24 @@ void intel_pps_encoder_reset(struct intel_dp *intel_dp)
 
 	with_intel_pps_lock(intel_dp, wakeref) {
 		/*
-		 * Reinit the power sequencer, in case BIOS did something nasty
-		 * with it.
+		 * Reinit the power sequencer also on the resume path, in case
+		 * BIOS did something nasty with it.
 		 */
-		intel_dp_pps_init(intel_dp);
+		if (IS_VALLEYVIEW(i915) || IS_CHERRYVIEW(i915))
+			vlv_initial_power_sequencer_setup(intel_dp);
+
+		pps_init_delays(intel_dp);
+		pps_init_registers(intel_dp, false);
+
 		intel_pps_vdd_sanitize(intel_dp);
 	}
 }
 
 void intel_pps_init(struct intel_dp *intel_dp)
 {
-	intel_wakeref_t wakeref;
-
 	INIT_DELAYED_WORK(&intel_dp->panel_vdd_work, edp_panel_vdd_work);
 
-	with_intel_pps_lock(intel_dp, wakeref) {
-		pps_init_timestamps(intel_dp);
-		intel_dp_pps_init(intel_dp);
-		intel_pps_vdd_sanitize(intel_dp);
-	}
+	pps_init_timestamps(intel_dp);
+
+	intel_pps_encoder_reset(intel_dp);
 }
-- 
2.20.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
