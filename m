Return-Path: <SRS0=s8fd=OD=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE250C433F5
	for <intel-gfx@archiver.kernel.org>; Mon, 13 Sep 2021 14:39:13 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C30860F4C
	for <intel-gfx@archiver.kernel.org>; Mon, 13 Sep 2021 14:39:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8C30860F4C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26AE06E0E3;
	Mon, 13 Sep 2021 14:39:13 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 772516E0E3
 for <intel-gfx@lists.freedesktop.org>; Mon, 13 Sep 2021 14:39:12 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10105"; a="201202885"
X-IronPort-AV: E=Sophos;i="5.85,290,1624345200"; d="scan'208";a="201202885"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2021 07:39:11 -0700
X-IronPort-AV: E=Sophos;i="5.85,290,1624345200"; d="scan'208";a="433267438"
Received: from unknown (HELO vandita-Z390-AORUS-ULTRA.iind.intel.com)
 ([10.190.238.8])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2021 07:39:09 -0700
From: Vandita Kulkarni <vandita.kulkarni@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: jani.nikula@intel.com, manasi.d.navare@intel.com,
 Vandita Kulkarni <vandita.kulkarni@intel.com>
Date: Mon, 13 Sep 2021 20:09:23 +0530
Message-Id: <20210913143923.21119-1-vandita.kulkarni@intel.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH] drm/i915/display: Enable second VDSC engine for
 higher moderates
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

Each VDSC operates with 1ppc throughput, hence enable the second
VDSC engine when moderate is higher that the current cdclk.

Signed-off-by: Vandita Kulkarni <vandita.kulkarni@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 161c33b2c869..55878f65f724 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -70,6 +70,7 @@
 #include "intel_tc.h"
 #include "intel_vdsc.h"
 #include "intel_vrr.h"
+#include "intel_cdclk.h"
 
 #define DP_DPRX_ESI_LEN 14
 
@@ -1291,10 +1292,13 @@ static int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
 				       struct drm_connector_state *conn_state,
 				       struct link_config_limits *limits)
 {
+	struct intel_cdclk_state *cdclk_state;
 	struct intel_digital_port *dig_port = dp_to_dig_port(intel_dp);
 	struct drm_i915_private *dev_priv = to_i915(dig_port->base.base.dev);
 	const struct drm_display_mode *adjusted_mode =
 		&pipe_config->hw.adjusted_mode;
+	struct intel_atomic_state *state =
+				to_intel_atomic_state(pipe_config->uapi.state);
 	int pipe_bpp;
 	int ret;
 
@@ -1373,12 +1377,16 @@ static int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
 		}
 	}
 
+	cdclk_state = intel_atomic_get_cdclk_state(state);
+	if (IS_ERR(cdclk_state))
+		return PTR_ERR(cdclk_state);
+
 	/*
 	 * VDSC engine operates at 1 Pixel per clock, so if peak pixel rate
-	 * is greater than the maximum Cdclock and if slice count is even
+	 * is greater than the current Cdclock and if slice count is even
 	 * then we need to use 2 VDSC instances.
 	 */
-	if (adjusted_mode->crtc_clock > dev_priv->max_cdclk_freq ||
+	if (adjusted_mode->crtc_clock > cdclk_state->actual.cdclk ||
 	    pipe_config->bigjoiner) {
 		if (pipe_config->dsc.slice_count < 2) {
 			drm_dbg_kms(&dev_priv->drm,
-- 
2.32.0

