Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D766C88E53
	for <intel-gfx@archiver.kernel.org>; Tue, 15 Sep 2026 04:24:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E76AE10ECE5;
	Tue, 15 Sep 2026 04:24:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HAlwDyuD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E183010ECE5
 for <intel-gfx@lists.freedesktop.org>; Tue, 15 Sep 2026 04:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789446249; x=1820982249;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AvobLU7wqTw2uYmTQCQRxmHnnsWWXPCgju/o/GyFNNU=;
 b=HAlwDyuD4qOvVVq3Z7AXOegx7aBGrzeS5KsOO9mX5cukIXGP7Paj07EI
 F/LlAgqwD1AWgwMXHBVv+2VpcZSeX+cRuaLrygibYZKC1Nuwd4ITHW/kJ
 DMG32n9NDcmAFA6ZzYRfIMM/XqO89uXxS0O6vh86WARCvNPBEyNSUVsbl
 lWD9gMhH/1KvVThFToKLevLAipx+p+vuQjatpvy8sAYOMpvih+7v/CVMa
 DLdvcwf9KTtJ0rz/7pSru6sdJSM/kIeI72pJeFsT2zIrwp1mmU7IsV2KY
 DctlyCt8/fSoNnbsIOvrJbUXHvMnZOG2fW4DGlIpzJqtytYUpx37aDbGQ A==;
X-CSE-ConnectionGUID: X8mO+s0ISsqE8xHt2tMEgg==
X-CSE-MsgGUID: nnGKK+EvSimSSI9EAG0CnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="93500884"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="93500884"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 21:24:09 -0700
X-CSE-ConnectionGUID: 59zV9IjTS6CwPux53uKSJA==
X-CSE-MsgGUID: X6nVnu71Qj6v95ShHuR7wA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="274782478"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa004.fm.intel.com with ESMTP; 14 Sep 2026 21:24:07 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: suraj.kandpal@intel.com, jani.nikula@intel.com,
 Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCHv6] drm/i915/dp: On DPCD init wake the DPRx for eDP
Date: Tue, 15 Sep 2026 09:53:00 +0530
Message-Id: <20260915042300.2201757-1-arun.r.murthy@intel.com>
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
v6: Mask and write DP_SET_POWER (Sashiko)

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4391
Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16654
Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 38 +++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 0cd5e6b5034c..c44d584cc07a 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -4779,6 +4779,38 @@ intel_edp_set_sink_rates(struct intel_dp *intel_dp)
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
+	 * or it read back D3; in either case wake it up to D0.
+	 * In case of AUX read failure which is usually a POR case, the
+	 * remaining bits of register 0x600 is set to '0' on POR. So a bare
+	 * write should be fine.
+	 */
+	if (ret < 0 || value == DP_SET_POWER_D3) {
+		value &= ~DP_SET_POWER_MASK;
+		value |= DP_SET_POWER_D0;
+		drm_dp_dpcd_write_byte(&intel_dp->aux, DP_SET_POWER,
+				       value);
+		/* After setting to D0 need a min of 1ms to wake (Spec DP2.1 sec 2.3.1.2) */
+		fsleep(1000);
+		drm_dp_dpcd_write_byte(&intel_dp->aux, DP_SET_POWER,
+				       value);
+	}
+}
+
 static bool
 intel_edp_init_dpcd(struct intel_dp *intel_dp, struct intel_connector *connector)
 {
@@ -4789,6 +4821,12 @@ intel_edp_init_dpcd(struct intel_dp *intel_dp, struct intel_connector *connector
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

