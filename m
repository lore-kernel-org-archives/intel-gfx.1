Return-Path: <SRS0=IdPq=K5=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45951C47082
	for <intel-gfx@archiver.kernel.org>; Thu,  3 Jun 2021 12:29:00 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A188610CB
	for <intel-gfx@archiver.kernel.org>; Thu,  3 Jun 2021 12:29:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A188610CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A13CC6E1B2;
	Thu,  3 Jun 2021 12:28:59 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 264496E171
 for <intel-gfx@lists.freedesktop.org>; Thu,  3 Jun 2021 12:28:58 +0000 (UTC)
IronPort-SDR: OPBVcjLoP/0lNVzlTt9mWxitxTC0+Zoh1Me9UzfZC3s9+fb6ehGaPMO5ZcWNLRPWoD+eYOTvv1
 0ekLSHEUhpLQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10003"; a="203844008"
X-IronPort-AV: E=Sophos;i="5.83,244,1616482800"; d="scan'208";a="203844008"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2021 05:28:51 -0700
IronPort-SDR: SljwEcGJahs1AeXMdX3CubA6BpQ8PCvb+V4mjCH5q41iQoQ6q1NqeNvVzGjn1nF+m4EgVMsrh9
 YsSmJUIIv5gA==
X-IronPort-AV: E=Sophos;i="5.83,244,1616482800"; d="scan'208";a="480204200"
Received: from sleader-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.54.200])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2021 05:28:47 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Thu,  3 Jun 2021 15:28:41 +0300
Message-Id: <20210603122842.22496-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Subject: [Intel-gfx] [PATCH 1/2] drm/i915/dsc: abstract helpers to get
 bigjoiner primary/secondary crtc
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

Add a single point of truth for figuring out the primary/secondary crtc
for bigjoiner instead of duplicating the magic pipe +/- 1 in multiple
places.

Also fix the pipe validity checks to properly take non-contiguous pipes
into account. The current checks may theoretically overflow
i915->pipe_to_crtc_mapping[pipe], albeit with a warning, due to fused
off pipes, as INTEL_NUM_PIPES() returns the actual number of pipes on
the platform, and the check is for INTEL_NUM_PIPES() == pipe + 1.

Prefer primary/secondary terminology going forward.

Fixes: 8a029c113b17 ("drm/i915/dp: Modify VDSC helpers to configure DSC for Bigjoiner slave")
Fixes: d961eb20adb6 ("drm/i915/bigjoiner: atomic commit changes for uncompressed joiner")
Cc: Animesh Manna <animesh.manna@intel.com>
Cc: Manasi Navare <manasi.d.navare@intel.com>
Cc: Vandita Kulkarni <vandita.kulkarni@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c |  7 ++--
 drivers/gpu/drm/i915/display/intel_vdsc.c    | 42 ++++++++++++++------
 drivers/gpu/drm/i915/display/intel_vdsc.h    |  2 +
 3 files changed, 35 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index caf0414e0b50..1b213ed42396 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -9603,7 +9603,6 @@ static int intel_atomic_check_bigjoiner(struct intel_atomic_state *state,
 					struct intel_crtc_state *old_crtc_state,
 					struct intel_crtc_state *new_crtc_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(state->base.dev);
 	struct intel_crtc_state *slave_crtc_state, *master_crtc_state;
 	struct intel_crtc *slave, *master;
 
@@ -9619,15 +9618,15 @@ static int intel_atomic_check_bigjoiner(struct intel_atomic_state *state,
 	if (!new_crtc_state->bigjoiner)
 		return 0;
 
-	if (1 + crtc->pipe >= INTEL_NUM_PIPES(dev_priv)) {
+	slave = intel_dsc_get_bigjoiner_secondary(crtc);
+	if (!slave) {
 		DRM_DEBUG_KMS("[CRTC:%d:%s] Big joiner configuration requires "
 			      "CRTC + 1 to be used, doesn't exist\n",
 			      crtc->base.base.id, crtc->base.name);
 		return -EINVAL;
 	}
 
-	slave = new_crtc_state->bigjoiner_linked_crtc =
-		intel_get_crtc_for_pipe(dev_priv, crtc->pipe + 1);
+	new_crtc_state->bigjoiner_linked_crtc = slave;
 	slave_crtc_state = intel_atomic_get_crtc_state(&state->base, slave);
 	master = crtc;
 	if (IS_ERR(slave_crtc_state))
diff --git a/drivers/gpu/drm/i915/display/intel_vdsc.c b/drivers/gpu/drm/i915/display/intel_vdsc.c
index 19cd9531c115..1fd81bd3ea09 100644
--- a/drivers/gpu/drm/i915/display/intel_vdsc.c
+++ b/drivers/gpu/drm/i915/display/intel_vdsc.c
@@ -1106,6 +1106,32 @@ static i915_reg_t dss_ctl2_reg(const struct intel_crtc_state *crtc_state)
 	return is_pipe_dsc(crtc_state) ? ICL_PIPE_DSS_CTL2(pipe) : DSS_CTL2;
 }
 
+struct intel_crtc *
+intel_dsc_get_bigjoiner_secondary(const struct intel_crtc *primary_crtc)
+{
+	struct drm_i915_private *i915 = to_i915(primary_crtc->base.dev);
+	enum pipe pipe = primary_crtc->pipe + 1;
+
+	if (drm_WARN_ON(&i915->drm, pipe >= I915_MAX_PIPES ||
+			!(INTEL_INFO(i915)->pipe_mask & BIT(pipe))))
+		return NULL;
+
+	return intel_get_crtc_for_pipe(i915, pipe);
+}
+
+struct intel_crtc *
+intel_dsc_get_bigjoiner_primary(const struct intel_crtc *secondary_crtc)
+{
+	struct drm_i915_private *i915 = to_i915(secondary_crtc->base.dev);
+	enum pipe pipe = secondary_crtc->pipe - 1;
+
+	if (drm_WARN_ON(&i915->drm, pipe <= INVALID_PIPE ||
+			!(INTEL_INFO(i915)->pipe_mask & BIT(pipe))))
+		return NULL;
+
+	return intel_get_crtc_for_pipe(i915, pipe);
+}
+
 void intel_uncompressed_joiner_enable(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
@@ -1178,15 +1204,11 @@ void intel_uncompressed_joiner_get_config(struct intel_crtc_state *crtc_state)
 	dss_ctl1 = intel_de_read(dev_priv, dss_ctl1_reg(crtc_state));
 	if (dss_ctl1 & UNCOMPRESSED_JOINER_MASTER) {
 		crtc_state->bigjoiner = true;
-		if (!WARN_ON(INTEL_NUM_PIPES(dev_priv) == crtc->pipe + 1))
-			crtc_state->bigjoiner_linked_crtc =
-				intel_get_crtc_for_pipe(dev_priv, crtc->pipe + 1);
+		crtc_state->bigjoiner_linked_crtc = intel_dsc_get_bigjoiner_secondary(crtc);
 	} else if (dss_ctl1 & UNCOMPRESSED_JOINER_SLAVE) {
 		crtc_state->bigjoiner = true;
 		crtc_state->bigjoiner_slave = true;
-		if (!WARN_ON(crtc->pipe == PIPE_A))
-			crtc_state->bigjoiner_linked_crtc =
-				intel_get_crtc_for_pipe(dev_priv, crtc->pipe - 1);
+		crtc_state->bigjoiner_linked_crtc = intel_dsc_get_bigjoiner_primary(crtc);
 	}
 }
 
@@ -1224,13 +1246,9 @@ void intel_dsc_get_config(struct intel_crtc_state *crtc_state)
 
 		if (!(dss_ctl1 & MASTER_BIG_JOINER_ENABLE)) {
 			crtc_state->bigjoiner_slave = true;
-			if (!WARN_ON(crtc->pipe == PIPE_A))
-				crtc_state->bigjoiner_linked_crtc =
-					intel_get_crtc_for_pipe(dev_priv, crtc->pipe - 1);
+			crtc_state->bigjoiner_linked_crtc = intel_dsc_get_bigjoiner_primary(crtc);
 		} else {
-			if (!WARN_ON(INTEL_NUM_PIPES(dev_priv) == crtc->pipe + 1))
-				crtc_state->bigjoiner_linked_crtc =
-					intel_get_crtc_for_pipe(dev_priv, crtc->pipe + 1);
+			crtc_state->bigjoiner_linked_crtc = intel_dsc_get_bigjoiner_secondary(crtc);
 		}
 	}
 
diff --git a/drivers/gpu/drm/i915/display/intel_vdsc.h b/drivers/gpu/drm/i915/display/intel_vdsc.h
index fe4d45561253..da95944f4de2 100644
--- a/drivers/gpu/drm/i915/display/intel_vdsc.h
+++ b/drivers/gpu/drm/i915/display/intel_vdsc.h
@@ -22,5 +22,7 @@ void intel_uncompressed_joiner_get_config(struct intel_crtc_state *crtc_state);
 void intel_dsc_get_config(struct intel_crtc_state *crtc_state);
 enum intel_display_power_domain
 intel_dsc_power_domain(const struct intel_crtc_state *crtc_state);
+struct intel_crtc *intel_dsc_get_bigjoiner_primary(const struct intel_crtc *secondary_crtc);
+struct intel_crtc *intel_dsc_get_bigjoiner_secondary(const struct intel_crtc *primary_crtc);
 
 #endif /* __INTEL_VDSC_H__ */
-- 
2.20.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
