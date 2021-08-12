Return-Path: <SRS0=LDoR=ND=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A7EAC4338F
	for <intel-gfx@archiver.kernel.org>; Thu, 12 Aug 2021 06:10:18 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C04060240
	for <intel-gfx@archiver.kernel.org>; Thu, 12 Aug 2021 06:10:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0C04060240
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F4216E1C0;
	Thu, 12 Aug 2021 06:10:17 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A5756E1C0
 for <intel-gfx@lists.freedesktop.org>; Thu, 12 Aug 2021 06:10:15 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10073"; a="215017888"
X-IronPort-AV: E=Sophos;i="5.84,315,1620716400"; d="scan'208";a="215017888"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2021 23:10:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,315,1620716400"; d="scan'208";a="676648412"
Received: from amanna.iind.intel.com ([10.223.74.76])
 by fmsmga005.fm.intel.com with ESMTP; 11 Aug 2021 23:10:12 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: Matt Atwood <matthew.s.atwood@intel.com>,
 Uma Shankar <uma.shankar@intel.com>, Imre Deak <imre.deak@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Animesh Manna <animesh.manna@intel.com>
Date: Thu, 12 Aug 2021 11:18:02 +0530
Message-Id: <20210812054806.22745-2-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20210812054806.22745-1-animesh.manna@intel.com>
References: <20210812054806.22745-1-animesh.manna@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 1/5] drm/i915/dp: Fix eDP max rate for display
 11+
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

From: Matt Atwood <matthew.s.atwood@intel.com>

intel_dp_set_source_rates() calls intel_dp_is_edp(), which is unsafe to
use before intel_encoder->type is set. This causes incorrect max source
rate to be used for display 11+. On EHL and JSL, HBR3 is used instead of
HBR2, and on the other affected platforms, HBR2 is used instead of HBR3.

Move intel_dp_set_source_rates() to after intel_encoder->type is
set. Add comment to intel_dp_is_edp() describing unsafe usages. Cleanup
intel_dp_init_connector() while at it.

Note: The same change was originally added as commit 680c45c767f6
("drm/i915/dp: Correctly advertise HBR3 for GEN11+"), but later reverted
due to issues in CI in commit d3913019602e ("Revert "drm/i915/dp:
Correctly advertise HBR3 for GEN11+"").

Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Imre Deak <imre.deak@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 28 ++++++++++---------------
 1 file changed, 11 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 75d4ebc66941..4df56af36b3f 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -100,6 +100,8 @@ static const u8 valid_dsc_slicecount[] = {1, 2, 4};
  *
  * If a CPU or PCH DP output is attached to an eDP panel, this function
  * will return true, and false otherwise.
+ *
+ * This function is not safe to use prior to encoder type being set.
  */
 bool intel_dp_is_edp(struct intel_dp *intel_dp)
 {
@@ -5294,8 +5296,6 @@ intel_dp_init_connector(struct intel_digital_port *dig_port,
 		     intel_encoder->base.name))
 		return false;
 
-	intel_dp_set_source_rates(intel_dp);
-
 	intel_dp->reset_link_params = true;
 	intel_dp->pps.pps_pipe = INVALID_PIPE;
 	intel_dp->pps.active_pipe = INVALID_PIPE;
@@ -5311,28 +5311,22 @@ intel_dp_init_connector(struct intel_digital_port *dig_port,
 		 */
 		drm_WARN_ON(dev, intel_phy_is_tc(dev_priv, phy));
 		type = DRM_MODE_CONNECTOR_eDP;
+		intel_encoder->type = INTEL_OUTPUT_EDP;
+
+		/* eDP only on port B and/or C on vlv/chv */
+		if (drm_WARN_ON(dev, (IS_VALLEYVIEW(dev_priv) ||
+				      IS_CHERRYVIEW(dev_priv)) &&
+				port != PORT_B && port != PORT_C))
+			return false;
 	} else {
 		type = DRM_MODE_CONNECTOR_DisplayPort;
 	}
 
+	intel_dp_set_source_rates(intel_dp);
+
 	if (IS_VALLEYVIEW(dev_priv) || IS_CHERRYVIEW(dev_priv))
 		intel_dp->pps.active_pipe = vlv_active_pipe(intel_dp);
 
-	/*
-	 * For eDP we always set the encoder type to INTEL_OUTPUT_EDP, but
-	 * for DP the encoder type can be set by the caller to
-	 * INTEL_OUTPUT_UNKNOWN for DDI, so don't rewrite it.
-	 */
-	if (type == DRM_MODE_CONNECTOR_eDP)
-		intel_encoder->type = INTEL_OUTPUT_EDP;
-
-	/* eDP only on port B and/or C on vlv/chv */
-	if (drm_WARN_ON(dev, (IS_VALLEYVIEW(dev_priv) ||
-			      IS_CHERRYVIEW(dev_priv)) &&
-			intel_dp_is_edp(intel_dp) &&
-			port != PORT_B && port != PORT_C))
-		return false;
-
 	drm_dbg_kms(&dev_priv->drm,
 		    "Adding %s connector on [ENCODER:%d:%s]\n",
 		    type == DRM_MODE_CONNECTOR_eDP ? "eDP" : "DP",
-- 
2.29.0

