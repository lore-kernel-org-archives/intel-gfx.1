Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE5D2C369DC
	for <intel-gfx@archiver.kernel.org>; Wed, 30 Apr 2025 00:14:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44B2710E59A;
	Wed, 30 Apr 2025 00:14:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UxEtqcc/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8589410E59A
 for <intel-gfx@lists.freedesktop.org>; Wed, 30 Apr 2025 00:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745972084; x=1777508084;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=G5mTh3sK3NkNEwSW1x1eATltddNlBzW3Z52vJ1vX7WA=;
 b=UxEtqcc/U88qtkC231ea3ex8i0yq3Vx4FPiU9q7H/Tk+QOBZYvV/qPaW
 wmRZkwnbhoOSlng5LgYt6ls9yuvRgVyN9UhB5R38QEg/5/bAeUF4KEzV+
 Un35IslK5xbHL6SEkvF1gCjOD5ZQjScA2LaESbQCVPhLZM+69sEsubFfn
 TTppELrjSuurSXofWztHuJTxTUDQTpap7KBncHF1ahahHZGhARJyeWBv3
 b4kTFIwhB18wQIrFbzGJMgdzyK2zL6kmEeZNDqMXzPeeOUcM/2it/k0S6
 +IoEsiH8wu7CcjIIpj6AI0ChVMaR2yeHbcmIuZRbaIqUuY43hboUs3cCf Q==;
X-CSE-ConnectionGUID: oMSd10JcQse/4LlNSJ3zkg==
X-CSE-MsgGUID: dm0cXNnvROqwuWh/GSTzSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="58980334"
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; d="scan'208";a="58980334"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 17:14:43 -0700
X-CSE-ConnectionGUID: h+d4T/QKTPm6J59618CkTw==
X-CSE-MsgGUID: +h6rjANhQJGfnm8s9VSVDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; d="scan'208";a="133907804"
Received: from kialmah1-desk5.jf.intel.com ([10.23.33.174])
 by fmviesa007.fm.intel.com with ESMTP; 29 Apr 2025 17:14:41 -0700
From: Khaled Almahallawy <khaled.almahallawy@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: Khaled Almahallawy <khaled.almahallawy@intel.com>,
 Imre Deak <imre.deak@intel.com>, Jani Nikula <jani.nikula@intel.com>,
 Charlton Lin <charlton.lin@intel.com>
Subject: [PATCH] drm/i915/dp: Clear TRAINING_PATTERN_SET (DPCD 00102h) before
 starting Link Training
Date: Tue, 29 Apr 2025 17:14:41 -0700
Message-ID: <20250430001441.2621576-1-khaled.almahallawy@intel.com>
X-Mailer: git-send-email 2.43.0
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

The Link Layer Source CTS test 4.3.1.14 [1] fails at the beginning
(before 1st Link Training) due to the following issue:

"Source DUT does not terminate Link Training by writing 00h to the
TRAINING_PATTERN_SET"

According to the DP 2.1 specs [2], [3], [4], the TRAINING_PATTERN_SET
register must be set to 00h before initiating the Link Training sequence.
This is also confrimed by the Link Layer CTS tests [1] and [5] in step 3 of
its procedure that clearing TRAINING_PATTERN_SET is a pass/fail criterion.

This patch fixes the issue by explicitly clearing the DPCD training pattern
(TRAINING_PATTERN_SET = 00h) before starting Link Training.

[1] DP2.1 Link Layer CTS - 4.3.1.14 Successful Link Training at All
Supported Lane Counts and UHBR Link Speeds
[2] DP2.1 Specs - Figure 3-12: Link Training LANEx_CR_DONE Sequence
[3] DP2.1 Specs - Figure 3-14: Link Training LANEx_CR_DONE Sequence
for Maximum Link Data Bandwidth Policy
[4] DP2.1 Specs - Figure 3-52: 128b/132b DP DPTX LANEx_CHANNEL_EQ_DONE
Sequence
[5] DP2.1 Link Layer CTS - 4.9.1.1 With 1 emulated LTTPR, Successful
Link Training at all Supported Lane Counts and Link Speeds

Cc: Imre Deak <imre.deak@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Charlton Lin <charlton.lin@intel.com>
Signed-off-by: Khaled Almahallawy <khaled.almahallawy@intel.com>
---
 .../drm/i915/display/intel_dp_link_training.c | 20 ++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
index a479b63112ea..9e402ad6467c 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
@@ -766,6 +766,16 @@ static void intel_dp_update_link_bw_set(struct intel_dp *intel_dp,
 				      crtc_state->enhanced_framing);
 }
 
+static bool intel_dp_disable_dpcd_training_pattern(struct intel_dp *intel_dp,
+						   enum drm_dp_phy dp_phy)
+{
+	int reg = intel_dp_training_pattern_set_reg(intel_dp, dp_phy);
+	u8 val = DP_TRAINING_PATTERN_DISABLE;
+
+	return drm_dp_dpcd_write(&intel_dp->aux, reg, &val, 1) == 1;
+}
+
+
 /*
  * Prepare link training by configuring the link parameters. On DDI platforms
  * also enable the port here.
@@ -813,6 +823,7 @@ intel_dp_prepare_link_train(struct intel_dp *intel_dp,
 	 * Spec DP2.1 Section 3.5.2.16
 	 * Prior to LT DPTX should set 128b/132b DP Channel coding and then set link rate
 	 */
+	intel_dp_disable_dpcd_training_pattern(intel_dp, DP_PHY_DPRX);
 	intel_dp_update_downspread_ctrl(intel_dp, crtc_state);
 	intel_dp_update_link_bw_set(intel_dp, crtc_state, link_bw,
 				    rate_select);
@@ -1081,15 +1092,6 @@ intel_dp_link_training_channel_equalization(struct intel_dp *intel_dp,
 	return channel_eq;
 }
 
-static bool intel_dp_disable_dpcd_training_pattern(struct intel_dp *intel_dp,
-						   enum drm_dp_phy dp_phy)
-{
-	int reg = intel_dp_training_pattern_set_reg(intel_dp, dp_phy);
-	u8 val = DP_TRAINING_PATTERN_DISABLE;
-
-	return drm_dp_dpcd_write(&intel_dp->aux, reg, &val, 1) == 1;
-}
-
 static int
 intel_dp_128b132b_intra_hop(struct intel_dp *intel_dp,
 			    const struct intel_crtc_state *crtc_state)
-- 
2.43.0

