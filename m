Return-Path: <SRS0=yDSU=MA=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C847DC07E9C
	for <intel-gfx@archiver.kernel.org>; Thu,  8 Jul 2021 10:26:09 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F85C61447
	for <intel-gfx@archiver.kernel.org>; Thu,  8 Jul 2021 10:26:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F85C61447
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75C406E1FB;
	Thu,  8 Jul 2021 10:26:08 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 029896E1F1
 for <intel-gfx@lists.freedesktop.org>; Thu,  8 Jul 2021 10:26:05 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10038"; a="209444193"
X-IronPort-AV: E=Sophos;i="5.84,222,1620716400"; d="scan'208";a="209444193"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2021 03:26:01 -0700
X-IronPort-AV: E=Sophos;i="5.84,222,1620716400"; d="scan'208";a="428303521"
Received: from unknown (HELO vandita-Z390-AORUS-ULTRA.iind.intel.com)
 ([10.190.238.8])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2021 03:26:00 -0700
From: Vandita Kulkarni <vandita.kulkarni@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Thu,  8 Jul 2021 15:55:49 +0530
Message-Id: <20210708102549.27821-4-vandita.kulkarni@intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210708102549.27821-1-vandita.kulkarni@intel.com>
References: <20210708102549.27821-1-vandita.kulkarni@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [v7 3/3] drm/i915/display/dsc: Force dsc BPP
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

Set DSC BPP to the value forced through
debugfs. It can go from bpc to bpp-1.

Signed-off-by: Vandita Kulkarni <vandita.kulkarni@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 5b52beaddada..3e50cdd7e448 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1240,6 +1240,23 @@ static int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
 	pipe_config->port_clock = intel_dp->common_rates[limits->max_clock];
 	pipe_config->lane_count = limits->max_lane_count;
 
+	if (intel_dp->force_dsc_en) {
+		/* As of today we support DSC for only RGB */
+		if (intel_dp->force_dsc_bpp >= 8 &&
+		    intel_dp->force_dsc_bpp < pipe_bpp) {
+			drm_dbg_kms(&dev_priv->drm,
+				    "DSC BPP forced to %d",
+				    intel_dp->force_dsc_bpp);
+			pipe_config->dsc.compressed_bpp =
+						intel_dp->force_dsc_bpp;
+		} else {
+			drm_dbg_kms(&dev_priv->drm,
+				    "Invalid DSC BPP %d",
+				    intel_dp->force_dsc_bpp);
+			return -EINVAL;
+		}
+	}
+
 	if (intel_dp_is_edp(intel_dp)) {
 		pipe_config->dsc.compressed_bpp =
 			min_t(u16, drm_edp_dsc_sink_output_bpp(intel_dp->dsc_dpcd) >> 4,
-- 
2.32.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
