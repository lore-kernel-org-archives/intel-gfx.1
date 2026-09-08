Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80B0FC79F82
	for <intel-gfx@archiver.kernel.org>; Tue,  8 Sep 2026 16:13:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19F5510ECF4;
	Tue,  8 Sep 2026 16:13:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LKjNfTsl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08E2A10ECF4
 for <intel-gfx@lists.freedesktop.org>; Tue,  8 Sep 2026 16:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788884038; x=1820420038;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=X7/ZBE5QY5RlvJ8vO2usq5ixuJz1xQkrE5VG+RADm28=;
 b=LKjNfTslqGLEhL6jrHtv6IR2bKrGaf37SqkNzNpqKiLFEeZ3F5csf13I
 Avxkw598PwzcyPVRgjV8igCArG4EbQyDAMzqszt2C0svajexNosB71xw8
 gn5WRtlt6jkHGKdrDRCE+giLgeEaOevool+i1YBdDdltu58KSZjuXV0Ea
 2WFBzbbXLXdmSrt3Coah58UKiMWHi/CpQItmwtJpyaimaGR57Lt7mMA0G
 1FDTTBBruX0lPf47PrrbXtzc+os6H+SYMuIz5gZvvwwj5krmz3WzFS8ct
 tTtLnS7cRIy6eTgQuXerkObIpB1bRbPFrMxvIS9dxlDNIxNcqHlkR3N9G w==;
X-CSE-ConnectionGUID: A50zwBTZS/S3ekibJQIWdQ==
X-CSE-MsgGUID: 7XkmFD3nRECU1OULSz9G2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="106662496"
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; d="scan'208";a="106662496"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 09:13:57 -0700
X-CSE-ConnectionGUID: k/Rdf9UdQvaMqQxRAikHYw==
X-CSE-MsgGUID: llJbnq+fQxiXt+rV7FCQzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; d="scan'208";a="274845183"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa004.jf.intel.com with ESMTP; 08 Sep 2026 09:13:55 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: suraj.kandpal@intel.com, jani.nikula@intel.com,
 Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCHv5] drm/i915/dp: On DPCD init wake the DPRx for eDP
Date: Tue,  8 Sep 2026 21:42:48 +0530
Message-Id: <20260908161248.1901822-1-arun.r.murthy@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260219094326.34922-1-arun.r.murthy@intel.com>
References: <20260219094326.34922-1-arun.r.murthy@intel.com>
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

Its observed that on AUX_CH failure, even if the retry is increased to
1000, it does not succeed. Either the command might be wrong or sink in
an unknown/sleep state can cause this. So try waking the sink device.
Before reading the DPCD caps wake the sink for eDP.

v2: Use poll_timeout_us (Jani N)
    Add the reason, why this change is required (Ville)
v3: Wake sink only for eDP
    Remove the dpcd probe set to true/false in wake_sink (Imre)
v4: make edp_wake_sinc() static and dpcd_readb -> dpcd_reab_byte (Suraj)
v5: Drop poll_timeout_us. drm_dp_dpcd_read_byte() already retries the AUX
    transaction internally (up to ~16ms), so the outer 6ms poll could
    never iterate and only added a pre-read delay on the hot path; read
    DP_SET_POWER once instead. Wake the sink before reading the DPCD
    caps, otherwise a sleeping sink fails the caps read and returns
    early before the wake ever runs. (Suraj, Jani, Sashiko)

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4391
Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16654
Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 33 +++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 0cd5e6b5034c..07cc39a6f2e3 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -4779,6 +4779,33 @@ intel_edp_set_sink_rates(struct intel_dp *intel_dp)
 	intel_edp_set_data_override_rates(intel_dp);
 }
 
+static void intel_edp_wake_sink(struct intel_dp *intel_dp)
+{
+	u8 value = 0;
+	int ret;
+
+	/*
+	 * Read the current sink power state. drm_dp_dpcd_read_byte() already
+	 * retries the AUX transaction internally, so a single read suffices.
+	 * First commercial eDP panels are Ver1.0 or 1.1, on which DPCD
+	 * DP_SET_POWER is supported.
+	 */
+	ret = drm_dp_dpcd_read_byte(&intel_dp->aux, DP_SET_POWER, &value);
+
+	/*
+	 * If the AUX read failed the sink may be asleep and not responding,
+	 * or it read back D3; in either case wake it up to D3_AUX_ON.
+	 */
+	if (ret < 0 || value == DP_SET_POWER_D3) {
+		/* After setting to D0 need a min of 1ms to wake (Spec DP2.1 sec 2.3.1.2) */
+		drm_dp_dpcd_write_byte(&intel_dp->aux, DP_SET_POWER,
+				       DP_SET_POWER_D0);
+		fsleep(1000);
+		drm_dp_dpcd_write_byte(&intel_dp->aux, DP_SET_POWER,
+				       DP_SET_POWER_D0);
+	}
+}
+
 static bool
 intel_edp_init_dpcd(struct intel_dp *intel_dp, struct intel_connector *connector)
 {
@@ -4789,6 +4816,12 @@ intel_edp_init_dpcd(struct intel_dp *intel_dp, struct intel_connector *connector
 	/* this function is meant to be called only once */
 	drm_WARN_ON(display->drm, intel_dp->dpcd[DP_DPCD_REV] != 0);
 
+	/*
+	 * Spec DP2.1 Section 3.5.2.16 page 966.
+	 * Also if sink is asleep, this will wake the sink.
+	 */
+	intel_edp_wake_sink(intel_dp);
+
 	if (drm_dp_read_dpcd_caps(&intel_dp->aux, intel_dp->dpcd) != 0)
 		return false;
 
-- 
2.25.1

