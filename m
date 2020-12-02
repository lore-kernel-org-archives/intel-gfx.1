Return-Path: <SRS0=vghI=FG=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40F89C64E7C
	for <intel-gfx@archiver.kernel.org>; Wed,  2 Dec 2020 14:31:47 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB23B221EB
	for <intel-gfx@archiver.kernel.org>; Wed,  2 Dec 2020 14:31:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB23B221EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 808D56EA48;
	Wed,  2 Dec 2020 14:31:39 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FA016EA60;
 Wed,  2 Dec 2020 14:31:36 +0000 (UTC)
IronPort-SDR: qhp5kfUf/l3HFzR32FbdkwEGJQ+a4b6DpeY5hUbL57yNuTsuzhrEky5bPNQaNG9tcCckiTbf6M
 Ql4XHE9DyW4A==
X-IronPort-AV: E=McAfee;i="6000,8403,9822"; a="257733903"
X-IronPort-AV: E=Sophos;i="5.78,386,1599548400"; d="scan'208";a="257733903"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2020 06:31:05 -0800
IronPort-SDR: 9NJZAljEC45FXiOCj5dEWW7fqIevo7LinyQ4+ozHVxZL46kt9rFG+Qc8bkNw5yJ56PRlADGuS8
 Yq+tpW/XSzVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,386,1599548400"; d="scan'208";a="373191633"
Received: from linux-akn.iind.intel.com ([10.223.34.148])
 by orsmga007.jf.intel.com with ESMTP; 02 Dec 2020 06:31:02 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Wed,  2 Dec 2020 19:54:03 +0530
Message-Id: <20201202142405.14951-12-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201202142405.14951-1-ankit.k.nautiyal@intel.com>
References: <20201202142405.14951-1-ankit.k.nautiyal@intel.com>
Subject: [Intel-gfx] [PATCH v3 11/13] drm/i915: Read DSC capabilities of the
 HDMI2.1 PCON encoder
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

This patch adds support to read and store the DSC capabilities of the
HDMI2.1 PCon encoder. It also adds a new field to store these caps,
The caps are read during dfp update and can later be used to get the
PPS parameters for PCON-HDMI2.1 sink pair. Which inturn will be used
to take a call to override the existing PPS-metadata, by either
writing the entire new PPS metadata, or by writing only the
PPS override parameters.

v2: Restructured the code to read all capability DPCDs at once and store
in an array in intel_dp structure.

v3: rebase

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
---
 .../drm/i915/display/intel_display_types.h    |  1 +
 drivers/gpu/drm/i915/display/intel_dp.c       | 20 +++++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 997247db499c..604ba249fa51 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1346,6 +1346,7 @@ struct intel_dp {
 	u8 lttpr_common_caps[DP_LTTPR_COMMON_CAP_SIZE];
 	u8 lttpr_phy_caps[DP_MAX_LTTPR_COUNT][DP_LTTPR_PHY_CAP_SIZE];
 	u8 fec_capable;
+	u8 pcon_dsc_dpcd[DP_PCON_DSC_ENCODER_CAP_SIZE];
 	/* source rates */
 	int num_source_rates;
 	const int *source_rates;
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 7d7010b148ec..e3da73499e5a 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -3980,6 +3980,24 @@ cpt_set_link_train(struct intel_dp *intel_dp,
 	intel_de_posting_read(dev_priv, intel_dp->output_reg);
 }
 
+static void intel_dp_get_pcon_dsc_cap(struct intel_dp *intel_dp)
+{
+	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
+
+	/* Clear the cached register set to avoid using stale values */
+
+	memset(intel_dp->pcon_dsc_dpcd, 0, sizeof(intel_dp->pcon_dsc_dpcd));
+
+	if (drm_dp_dpcd_read(&intel_dp->aux, DP_PCON_DSC_ENCODER,
+				     intel_dp->pcon_dsc_dpcd,
+				     sizeof(intel_dp->pcon_dsc_dpcd)) < 0)
+		drm_err(&i915->drm, "Failed to read DPCD register 0x%x\n",
+			DP_PCON_DSC_ENCODER);
+
+	drm_dbg_kms(&i915->drm, "PCON ENCODER DSC DPCD: %*ph\n",
+		   (int)sizeof(intel_dp->pcon_dsc_dpcd), intel_dp->pcon_dsc_dpcd);
+}
+
 static int intel_dp_pcon_get_frl_mask(u8 frl_bw_mask)
 {
 	int bw_gbps[] = {9, 18, 24, 32, 40, 48};
@@ -6753,6 +6771,8 @@ intel_dp_update_dfp(struct intel_dp *intel_dp,
 		    intel_dp->dfp.max_tmds_clock,
 		    intel_dp->dfp.pcon_max_frl_bw,
 		    intel_dp->dfp.sink_max_frl_bw);
+
+	intel_dp_get_pcon_dsc_cap(intel_dp);
 }
 
 static void
-- 
2.17.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
