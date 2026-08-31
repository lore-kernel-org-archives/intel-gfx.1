Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AAE7C61DE2
	for <intel-gfx@archiver.kernel.org>; Mon, 31 Aug 2026 09:40:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEC2510E7C2;
	Mon, 31 Aug 2026 09:40:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VF/NZytE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0A9F10E7D7
 for <intel-gfx@lists.freedesktop.org>; Mon, 31 Aug 2026 09:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788169203; x=1819705203;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ez31wf//kwB4XxHQE4A9CDe7q5hib5LLDEP7GFNLpdY=;
 b=VF/NZytEiYbdJg90+NIIi1uUX3dyn3p/OhCVxdXBV+TmK3GH4cZXoSMx
 tVITFUra2QTv1UaXtVOEpKaN/fAg3dKVhspT7TdhzmY3EtiKXtf7Bru58
 Hx2tS8H5iYNr2TjqNafP5cQDWejWzKtICUSmTvqt7ddqy0abEmqJ7LygJ
 geWV3ALilEMvbj22XORMCozYKntcPANrlRxGWKk9XPyIkViXEQEiINfg4
 J6SZM2vQ54zccF7CKxXa2Ih425qasOv3fNOFrOOoKhVnpYXwP2Yl04BGW
 mwWpdpsvaFF8ut87M4ySf+3yCQfG+kZFEM/KVlXYDxbXehW9nHWAwdJ74 Q==;
X-CSE-ConnectionGUID: 7frp2QciQS+mUmHKC3Jlcw==
X-CSE-MsgGUID: tBiC8SxGSxqQtFyVjWuWDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="92437081"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="92437081"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 02:40:03 -0700
X-CSE-ConnectionGUID: 8u7KhPC1RMy/gD3lhRbF8w==
X-CSE-MsgGUID: MiIlMoHFSMCRzF4o3Apbbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="272259062"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa003.jf.intel.com with ESMTP; 31 Aug 2026 02:40:02 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCHv2] drm/i915/pps: reconcile a BIOS-enabled VDD without leaking
 its wakeref
Date: Mon, 31 Aug 2026 15:08:54 +0530
Message-Id: <20260831093854.1427305-1-arun.r.murthy@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260831044036.1236136-1-arun.r.murthy@intel.com>
References: <20260831044036.1236136-1-arun.r.murthy@intel.com>
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

When the BIOS leaves the eDP VDD force bit (EDP_FORCE_VDD) enabled at boot
(or resume), pps_vdd_init() adopts that state by taking an AUX power-domain
reference into intel_dp->pps.vdd_wakeref.

intel_pps_vdd_on_unlocked() decides whether it already owns a reference by
reading the live EDP_FORCE_VDD bit via edp_have_panel_vdd(). That bit can be
reset under the driver after the handover (DC states, DMC, BIOS). When it is,
the VDD-on path believes it holds nothing, overwrites vdd_wakeref with a
freshly acquired reference and orphans the adopted one. The leak surfaces at
suspend-late as:

  i915 raw-wakerefs=1 wakelocks=1 on cleanup

with the leaked wakeref's backtrace pointing at pps_vdd_init() ->
intel_pps_init() from driver probe.

Blindly reusing a held vdd_wakeref in the VDD-on path would fix the leak but
also silently paper over genuine runtime enable/disable imbalances, which is
exactly what the WARN_ON() there is meant to catch.

Instead track the handover explicitly: pps_vdd_init() sets a vdd_wakeref_boot
flag when it adopts a BIOS-enabled VDD, and intel_pps_vdd_on_unlocked() only
reuses the held reference (clearing the flag) while that flag is set. In all
other cases it keeps depending on the HW read and the WARN_ON(), so real
runtime imbalances are still flagged. The flag is cleared whenever the
reference is released so it can never outlive the reference it describes.

v2: Reworked to allow reconcile only at bootime(Jani)

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/8477
Assisted-by: Claude:claude-3-opus
Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 .../drm/i915/display/intel_display_types.h    |  4 ++++
 drivers/gpu/drm/i915/display/intel_pps.c      | 22 ++++++++++++++++---
 2 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 20a07ea06b5e..f9f1958e8c6a 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1727,6 +1727,10 @@ struct intel_pps {
 	unsigned long last_backlight_off;
 	ktime_t panel_power_off_time;
 	struct ref_tracker *vdd_wakeref;
+	/* vdd_wakeref was adopted from an already-on VDD at the BIOS/firmware
+	 * handover (boot/resume) and not yet reconciled into normal ownership.
+	 */
+	bool vdd_wakeref_boot;
 
 	union {
 		/*
diff --git a/drivers/gpu/drm/i915/display/intel_pps.c b/drivers/gpu/drm/i915/display/intel_pps.c
index d4c98b150fa2..415288077439 100644
--- a/drivers/gpu/drm/i915/display/intel_pps.c
+++ b/drivers/gpu/drm/i915/display/intel_pps.c
@@ -758,9 +758,22 @@ bool intel_pps_vdd_on_unlocked(struct intel_dp *intel_dp)
 	if (edp_have_panel_vdd(intel_dp))
 		return need_to_disable;
 
-	drm_WARN_ON(display->drm, intel_dp->pps.vdd_wakeref);
-	intel_dp->pps.vdd_wakeref = intel_display_power_get(display,
-							    intel_aux_power_domain(dig_port));
+	/*
+	 * pps_vdd_init() may have taken a reference at the BIOS->driver handover
+	 * for an already-on VDD whose HW force bit was since reset under us (DC
+	 * states, DMC, BIOS). Only in that boot/resume handover case reuse the
+	 * held reference instead of overwriting and leaking it. At runtime a
+	 * held wakeref here is a real imbalance, so keep asserting it and depend
+	 * on the HW read.
+	 */
+	if (intel_dp->pps.vdd_wakeref_boot) {
+		intel_dp->pps.vdd_wakeref_boot = false;
+	} else {
+		drm_WARN_ON(display->drm, intel_dp->pps.vdd_wakeref);
+		intel_dp->pps.vdd_wakeref =
+			intel_display_power_get(display,
+						intel_aux_power_domain(dig_port));
+	}
 
 	pp_stat_reg = _pp_stat_reg(intel_dp);
 	pp_ctrl_reg = _pp_ctrl_reg(intel_dp);
@@ -861,6 +874,7 @@ static void intel_pps_vdd_off_sync_unlocked(struct intel_dp *intel_dp)
 		intel_dp_invalidate_source_oui(intel_dp);
 	}
 
+	intel_dp->pps.vdd_wakeref_boot = false;
 	intel_display_power_put(display,
 				intel_aux_power_domain(dig_port),
 				fetch_and_zero(&intel_dp->pps.vdd_wakeref));
@@ -1063,6 +1077,7 @@ void intel_pps_off_unlocked(struct intel_dp *intel_dp)
 	intel_dp_invalidate_source_oui(intel_dp);
 
 	/* We got a reference when we enabled the VDD. */
+	intel_dp->pps.vdd_wakeref_boot = false;
 	intel_display_power_put(display,
 				intel_aux_power_domain(dig_port),
 				fetch_and_zero(&intel_dp->pps.vdd_wakeref));
@@ -1337,6 +1352,7 @@ static void pps_vdd_init(struct intel_dp *intel_dp)
 	drm_WARN_ON(display->drm, intel_dp->pps.vdd_wakeref);
 	intel_dp->pps.vdd_wakeref = intel_display_power_get(display,
 							    intel_aux_power_domain(dig_port));
+	intel_dp->pps.vdd_wakeref_boot = true;
 }
 
 bool intel_pps_have_panel_power_or_vdd(struct intel_dp *intel_dp)
-- 
2.25.1

