Return-Path: <SRS0=U9P+=OZ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA155C433F5
	for <intel-gfx@archiver.kernel.org>; Tue,  5 Oct 2021 08:11:06 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9936361165
	for <intel-gfx@archiver.kernel.org>; Tue,  5 Oct 2021 08:11:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9936361165
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE2EC6EB3A;
	Tue,  5 Oct 2021 08:11:05 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEE976EB3A;
 Tue,  5 Oct 2021 08:11:04 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10127"; a="223099169"
X-IronPort-AV: E=Sophos;i="5.85,348,1624345200"; d="scan'208";a="223099169"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2021 01:11:04 -0700
X-IronPort-AV: E=Sophos;i="5.85,348,1624345200"; d="scan'208";a="438606892"
Received: from gionascu-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.249.40.237])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2021 01:11:02 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Date: Tue,  5 Oct 2021 11:10:53 +0300
Message-Id: <20211005081053.13729-2-jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211005081053.13729-1-jani.nikula@intel.com>
References: <20211005081053.13729-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 2/2] drm/i915/dp: use drm_dp_phy_name() for
 logging
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

Drop the local intel_dp_phy_name() function, and replace with
drm_dp_phy_name(). This lets us drop a number of local buffers.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 .../drm/i915/display/intel_dp_link_training.c | 24 ++++---------------
 1 file changed, 4 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
index c052ce14894d..219568304c08 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
@@ -46,17 +46,6 @@ static void intel_dp_reset_lttpr_count(struct intel_dp *intel_dp)
 				    DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV] = 0;
 }
 
-static const char *intel_dp_phy_name(enum drm_dp_phy dp_phy,
-				     char *buf, size_t buf_size)
-{
-	if (dp_phy == DP_PHY_DPRX)
-		snprintf(buf, buf_size, "DPRX");
-	else
-		snprintf(buf, buf_size, "LTTPR %d", dp_phy - DP_PHY_LTTPR1 + 1);
-
-	return buf;
-}
-
 static u8 *intel_dp_lttpr_phy_caps(struct intel_dp *intel_dp,
 				   enum drm_dp_phy dp_phy)
 {
@@ -67,20 +56,17 @@ static void intel_dp_read_lttpr_phy_caps(struct intel_dp *intel_dp,
 					 enum drm_dp_phy dp_phy)
 {
 	u8 *phy_caps = intel_dp_lttpr_phy_caps(intel_dp, dp_phy);
-	char phy_name[10];
-
-	intel_dp_phy_name(dp_phy, phy_name, sizeof(phy_name));
 
 	if (drm_dp_read_lttpr_phy_caps(&intel_dp->aux, dp_phy, phy_caps) < 0) {
 		drm_dbg_kms(&dp_to_i915(intel_dp)->drm,
 			    "failed to read the PHY caps for %s\n",
-			    phy_name);
+			    drm_dp_phy_name(dp_phy));
 		return;
 	}
 
 	drm_dbg_kms(&dp_to_i915(intel_dp)->drm,
 		    "%s PHY capabilities: %*ph\n",
-		    phy_name,
+		    drm_dp_phy_name(dp_phy),
 		    (int)sizeof(intel_dp->lttpr_phy_caps[0]),
 		    phy_caps);
 }
@@ -443,7 +429,6 @@ void intel_dp_set_signal_levels(struct intel_dp *intel_dp,
 {
 	struct intel_encoder *encoder = &dp_to_dig_port(intel_dp)->base;
 	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
-	char phy_name[10];
 
 	drm_dbg_kms(&dev_priv->drm, "[ENCODER:%d:%s] lanes: %d, "
 		    "vswing levels: " TRAIN_SET_FMT ", "
@@ -452,7 +437,7 @@ void intel_dp_set_signal_levels(struct intel_dp *intel_dp,
 		    crtc_state->lane_count,
 		    TRAIN_SET_VSWING_ARGS(intel_dp->train_set),
 		    TRAIN_SET_PREEMPH_ARGS(intel_dp->train_set),
-		    intel_dp_phy_name(dp_phy, phy_name, sizeof(phy_name)));
+		    drm_dp_phy_name(dp_phy));
 
 	if (intel_dp_phy_is_downstream_of_source(intel_dp, dp_phy))
 		encoder->set_signal_levels(encoder, crtc_state);
@@ -849,7 +834,6 @@ intel_dp_link_train_phy(struct intel_dp *intel_dp,
 			enum drm_dp_phy dp_phy)
 {
 	struct intel_connector *intel_connector = intel_dp->attached_connector;
-	char phy_name[10];
 	bool ret = false;
 
 	if (!intel_dp_link_training_clock_recovery(intel_dp, crtc_state, dp_phy))
@@ -867,7 +851,7 @@ intel_dp_link_train_phy(struct intel_dp *intel_dp,
 		    intel_connector->base.name,
 		    ret ? "passed" : "failed",
 		    crtc_state->port_clock, crtc_state->lane_count,
-		    intel_dp_phy_name(dp_phy, phy_name, sizeof(phy_name)));
+		    drm_dp_phy_name(dp_phy));
 
 	return ret;
 }
-- 
2.30.2

