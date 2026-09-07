Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC239C79F89
	for <intel-gfx@archiver.kernel.org>; Mon,  7 Sep 2026 09:28:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57D1910E71E;
	Mon,  7 Sep 2026 09:28:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xw9t+3O6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54D3510E71E
 for <intel-gfx@lists.freedesktop.org>; Mon,  7 Sep 2026 09:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788773295; x=1820309295;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hIaA4+hnc0DBWO7bTzrGrxN+S99uqdCg6+l3PFaOlcA=;
 b=Xw9t+3O6pWMDG4R/lb1RFUn2KbfbJ9JeIsCv6Z6566huqqETyousmrr9
 Eh2pkwWNBd8NvHADEeukDs/EdHS/QCRzqV4DojAoB+K2X1XdVmkYbbpJG
 X13HWxqsm2b9F37sdja0zz1Kn3bZjq6BZT8ejK34Q+ikYpmKk3gRiX3av
 HmAW6oots5U4HQggKePqlcmTRU8qeyb3NBI95o8JpeP3oK4WkWevd0S+i
 cOKZQuaHdYun2YfLZ0kYTF5RUVVF+zKyVQsQ8vOsk1J+Or3hqkW6ULCJg
 3fOB3NnemrB0Fjvndyrs+CuxscguX0fH/L7wvyB6zkshd0q0fgQiEZD/K A==;
X-CSE-ConnectionGUID: mvOO9OKfS+Ksub+aSHJRKg==
X-CSE-MsgGUID: cG/CCDXOTs+fLxtpx+WMww==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="92990167"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="92990167"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 02:28:15 -0700
X-CSE-ConnectionGUID: M1UWpuF+Sv2+HjnjUXOtnA==
X-CSE-MsgGUID: fNSGTZ90TMSV5bNsHSDexQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="270129619"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa008.jf.intel.com with ESMTP; 07 Sep 2026 02:28:13 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: suraj.kandpal@intel.com,
	Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCHv4] drm/i915/dp: On DPCD init wake the DPRx for eDP
Date: Mon,  7 Sep 2026 14:57:07 +0530
Message-Id: <20260907092707.1823088-1-arun.r.murthy@intel.com>
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

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4391
Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16654
Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 34 +++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 0cd5e6b5034c..d4cc5f7e82a4 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -4779,6 +4779,38 @@ intel_edp_set_sink_rates(struct intel_dp *intel_dp)
 	intel_edp_set_data_override_rates(intel_dp);
 }
 
+/* Spec says to try for 3 times, its doubled to add the software overhead */
+#define AUX_CH_WAKE_RETRY	6
+
+static void intel_edp_wake_sink(struct intel_dp *intel_dp)
+{
+	u8 value = 0;
+	int ret = 0;
+
+	/*
+	 * Wake the sink device
+	 * Spec DP2.1 section 2.3.1.2 if AUX CH is powered down by writing 0x02
+	 * to DP_SET_POWER dpcd reg, 1ms time would be required to wake it up
+	 */
+	ret = poll_timeout_us(ret = drm_dp_dpcd_read_byte(&intel_dp->aux,
+							  DP_SET_POWER, &value),
+			      ret == 0, 1000, AUX_CH_WAKE_RETRY * 1000, true);
+
+	/*
+	 * If sink is in D3 then it may not respond to the AUX tx so
+	 * wake it up to D3_AUX_ON state
+	 * If the above poll_timeout_us fails, try waking the sink.
+	 */
+	if (value == DP_SET_POWER_D3 || ret < 0) {
+		/* After setting to D0 need a min of 1ms to wake (Spec DP2.1 sec 2.3.1.2) */
+		drm_dp_dpcd_write_byte(&intel_dp->aux, DP_SET_POWER,
+				       DP_SET_POWER_D0);
+		fsleep(1000);
+		drm_dp_dpcd_write_byte(&intel_dp->aux, DP_SET_POWER,
+				       DP_SET_POWER_D3_AUX_ON);
+	}
+}
+
 static bool
 intel_edp_init_dpcd(struct intel_dp *intel_dp, struct intel_connector *connector)
 {
@@ -4792,6 +4824,8 @@ intel_edp_init_dpcd(struct intel_dp *intel_dp, struct intel_connector *connector
 	if (drm_dp_read_dpcd_caps(&intel_dp->aux, intel_dp->dpcd) != 0)
 		return false;
 
+	intel_edp_wake_sink(intel_dp);
+
 	drm_dp_read_desc(&intel_dp->aux, &intel_dp->desc,
 			 drm_dp_is_branch(intel_dp->dpcd));
 	intel_init_dpcd_quirks(intel_dp, &intel_dp->desc.ident);
-- 
2.25.1

