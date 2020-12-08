Return-Path: <SRS0=GdbL=FM=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC4E8C4361B
	for <intel-gfx@archiver.kernel.org>; Tue,  8 Dec 2020 07:58:29 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A4BE23A5B
	for <intel-gfx@archiver.kernel.org>; Tue,  8 Dec 2020 07:58:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A4BE23A5B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1EF06E963;
	Tue,  8 Dec 2020 07:58:25 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 818356E963;
 Tue,  8 Dec 2020 07:58:24 +0000 (UTC)
IronPort-SDR: WTrCKKzM7ESvPzJGR+4GIw4xRz4bSJELSC3RYFt6ajxAltYcRIfTGwq4Fq1vXqSM94FB7bhqTA
 HC91kbeuzLpg==
X-IronPort-AV: E=McAfee;i="6000,8403,9828"; a="235448678"
X-IronPort-AV: E=Sophos;i="5.78,401,1599548400"; d="scan'208";a="235448678"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2020 23:58:24 -0800
IronPort-SDR: 2IOWNxrxzR145ym0dXdqfZXL8IsXN6G3NfGnxpj4yW+WVl43QXZrX0XIbjYfLXGikg0+da2Dc7
 NkUJmWMILZ+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,401,1599548400"; d="scan'208";a="317686531"
Received: from linux-akn.iind.intel.com ([10.223.34.148])
 by fmsmga008.fm.intel.com with ESMTP; 07 Dec 2020 23:58:21 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue,  8 Dec 2020 13:21:37 +0530
Message-Id: <20201208075145.17389-9-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201208075145.17389-1-ankit.k.nautiyal@intel.com>
References: <20201208075145.17389-1-ankit.k.nautiyal@intel.com>
Subject: [Intel-gfx] [PATCH v4 08/16] drm/i915: Capture max frl rate for
 PCON in dfp cap structure
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

HDMI2.1 PCON advertises Max FRL bandwidth supported by the PCON and
by the sink.

This patch captures these in dfp cap structure in intel_dp and uses
these to prune connector modes that cannot be supported by the PCON
and sink FRL bandwidth.

v2: Addressed review comments from Uma Shankar:
-tweaked the comparison of target bw and pcon frl bw to avoid roundup errors.
-minor modification of field names and comments.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
---
 .../drm/i915/display/intel_display_types.h    |  1 +
 drivers/gpu/drm/i915/display/intel_dp.c       | 38 ++++++++++++++++++-
 2 files changed, 37 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 5bc5bfbc4551..f77a15303223 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1451,6 +1451,7 @@ struct intel_dp {
 	struct {
 		int min_tmds_clock, max_tmds_clock;
 		int max_dotclock;
+		int pcon_max_frl_bw, sink_max_frl_bw;
 		u8 max_bpc;
 		bool ycbcr_444_to_420;
 	} dfp;
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index cb5e42c3ecd5..2c3572891596 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -716,6 +716,29 @@ intel_dp_mode_valid_downstream(struct intel_connector *connector,
 	const struct drm_display_info *info = &connector->base.display_info;
 	int tmds_clock;
 
+	/*
+	 * If PCON and HDMI2.1 sink both support FRL MODE, check FRL
+	 * bandwidth constraints.
+	 */
+	if (intel_dp->dfp.pcon_max_frl_bw) {
+		int target_bw;
+		int max_frl_bw;
+		int bpp = intel_dp_mode_min_output_bpp(&connector->base, mode);
+
+		target_bw = bpp * target_clock;
+
+		max_frl_bw = min(intel_dp->dfp.pcon_max_frl_bw,
+				 intel_dp->dfp.sink_max_frl_bw);
+
+		/* converting bw from Gbps to Kbps*/
+		max_frl_bw = max_frl_bw * 1000000;
+
+		if (target_bw > max_frl_bw)
+			return MODE_CLOCK_HIGH;
+
+		return MODE_OK;
+	}
+
 	if (intel_dp->dfp.max_dotclock &&
 	    target_clock > intel_dp->dfp.max_dotclock)
 		return MODE_CLOCK_HIGH;
@@ -6484,13 +6507,21 @@ intel_dp_update_dfp(struct intel_dp *intel_dp,
 						 intel_dp->downstream_ports,
 						 edid);
 
+	intel_dp->dfp.pcon_max_frl_bw =
+		drm_dp_get_pcon_max_frl_bw(intel_dp->dpcd,
+					   intel_dp->downstream_ports);
+
+	intel_dp->dfp.sink_max_frl_bw = drm_dp_get_hdmi_sink_max_frl_bw(&intel_dp->aux);
+
 	drm_dbg_kms(&i915->drm,
-		    "[CONNECTOR:%d:%s] DFP max bpc %d, max dotclock %d, TMDS clock %d-%d\n",
+		    "[CONNECTOR:%d:%s] DFP max bpc %d, max dotclock %d, TMDS clock %d-%d, PCON Max FRL BW %dGbps, Sink Max FRL BW %dGbps\n",
 		    connector->base.base.id, connector->base.name,
 		    intel_dp->dfp.max_bpc,
 		    intel_dp->dfp.max_dotclock,
 		    intel_dp->dfp.min_tmds_clock,
-		    intel_dp->dfp.max_tmds_clock);
+		    intel_dp->dfp.max_tmds_clock,
+		    intel_dp->dfp.pcon_max_frl_bw,
+		    intel_dp->dfp.sink_max_frl_bw);
 }
 
 static void
@@ -6582,6 +6613,9 @@ intel_dp_unset_edid(struct intel_dp *intel_dp)
 	intel_dp->dfp.min_tmds_clock = 0;
 	intel_dp->dfp.max_tmds_clock = 0;
 
+	intel_dp->dfp.pcon_max_frl_bw = 0;
+	intel_dp->dfp.sink_max_frl_bw = 0;
+
 	intel_dp->dfp.ycbcr_444_to_420 = false;
 	connector->base.ycbcr_420_allowed = false;
 }
-- 
2.17.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
