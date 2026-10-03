Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFA13CA5FF5
	for <intel-gfx@archiver.kernel.org>; Mon,  5 Oct 2026 23:53:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CBDD10EF15;
	Mon,  5 Oct 2026 23:53:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BxR2ynsE";
	dkim-atps=neutral
Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com
 [74.125.228.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C96410E150
 for <intel-gfx@lists.freedesktop.org>; Sat,  3 Oct 2026 20:42:03 +0000 (UTC)
Received: by mail-ed2-f35.google.com with SMTP id
 4fb4d7f45d1cf-6aaf10bf094so732329a12.2
 for <intel-gfx@lists.freedesktop.org>; Sat, 03 Oct 2026 13:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791060122; x=1791664922; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Su+b7BZH2VjStdvFmyiMKsCZAv+/WdgVoiYZhD5f7fk=;
 b=BxR2ynsE5yKjGA8DI4bPi5EvhNnJF3NaXcNAHyw8BZQHyIgWaMj1ay/zsFUPC5wG5Q
 ylMBvlbzcsf2dTYCX8YNA0gYg5dyrNd6PAYZ/q3KTMmTpd4aE/gKJX9/M5rk4gZ1oXR/
 7z2jkkaZCEJgeq2P6bQ1bjzbh9wRvCTwxbcY8FxgDZy364ZGvbbIXjmqmsZ3bO19+GrZ
 X+G4ieSIIctM630kLaQ+te9E7LVhTwzwBlQEvo/QjlsJiunFtp/jN0kv4ngCR7R21q65
 RSPTL6ZHP4SJkie1NHyXlCz1/p7gzXfvvh6IH8ZotGN/pHeH3vK8qoYRM9U5XZw0/Bf6
 rOFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791060122; x=1791664922;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Su+b7BZH2VjStdvFmyiMKsCZAv+/WdgVoiYZhD5f7fk=;
 b=XruVubAh6EtDRQcbxE4QEJDYNot6OEFkYBk2RRsB4amLgrvNguTlFwj/HVVc8daFWX
 yX/w1PbaQEDlnN3e4L0B0RgilcwziTZ5egpDiyB7olmG8yxD06rezW3oug+5MQeuA3yu
 NBi6w20ZJcmzKw0v73qo6HtOEH7WueyWvIzTPQ2PjjD2Rh6fYOdzilActOsdM7KyQdql
 /VGAO17QFNeV/PAiOHHGHMfHZZlw7ax1ahu6aQ47nRiN3UsV9gbN4DBy8b+GiKUqM8of
 KYuKIB0MmTMitlf01zVh63bNdq3Smvz93ddisXLOPCnGujy/zdxtyM/tz+EKf4DNxMOl
 M8kw==
X-Gm-Message-State: AFq9FYJeJVvKy+ewxy9YkTaGolD1SkJPMyqaMq2TvbYiRiiovF2oODlS
 o1bqcVfmRG1ngwVgNYIKBINxBqGzRo7atFlcQttYylq55T44GdrmBDuEAXPT8XO0BNA=
X-Gm-Gg: AYBFou2lnCDbjWwd35V9RQcJTiYQ64RwVYffrQrS/IGUhUnmYhKP8BfboGWqXqetdtA
 1D94gjshfdtbPSEqAkiX2IzMUg9AEvDRxP2LnC/GHnt0lpPvA8tgisiW1NNrPCuXiBC/qIHp/oz
 bznmLJbgTIUhkKE+WG7A5b4rRJ6iIPv2kCpOmmUYx3rl6qlhGN4KvmNg/NfrizWqsTqzbRnTO1M
 XD2KS2d+JiugasiovZj1qwkSXWsHVepxnS052w0c8h6dVYtFOGoeAhU8L9c4f4sOtfrICpKytGB
 7KQg5yRJESpltN3ZGZs7czdRx52W2Pr+5ZctIAzpC7St5oPXKQj/DaHNoMbo3InrnyKUgEuONuY
 woKs+Qok4u47sc4fR1IO3+A8d7BmN2oVdPL7QNccgqaCI8K8NoQytbMaug0OLatBnt2xzl+5TBp
 Vzbqe5ycj1/rgCvu1pfnnswu6do3CAQOpVTaBKCVfHZm+qqDMEwjF9aS5KYGW02OJQFfbBY01M0
 SZBnresBRoNUDhqgwmo
X-Received: by 2002:a05:6402:46c1:b0:6aa:9382:171a with SMTP id
 4fb4d7f45d1cf-6af9df920femr4887630a12.0.1791060121648; 
 Sat, 03 Oct 2026 13:42:01 -0700 (PDT)
Received: from archlinux.www.tendawifi.com ([213.174.10.21])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6afb020c886sm1215929a12.25.2026.10.03.13.42.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2026 13:42:01 -0700 (PDT)
From: Danylo Dobushovkyi <dobushovsky@gmail.com>
To: intel-gfx@lists.freedesktop.org
Cc: arun.r.murthy@intel.com, jani.nikula@linux.intel.com,
 Danylo Dobushovkyi <dobushovsky@gmail.com>
Subject: [PATCH v3] drm/i915/pps: reconcile a BIOS-enabled VDD without leaking
 its wakeref
Date: Sat,  3 Oct 2026 23:41:57 +0300
Message-ID: <20261003204157.6107-1-dobushovsky@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20260831093854.1427305-1-arun.r.murthy@intel.com>
References: <20260831093854.1427305-1-arun.r.murthy@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 05 Oct 2026 23:53:28 +0000
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

When the BIOS leaves the eDP VDD force bit (EDP_FORCE_VDD) enabled at boot,
the driver adopts that state by taking an AUX power-domain reference into
intel_dp->pps.vdd_wakeref.

In v2 of this patch, an attempt was made to track this handover via a
vdd_wakeref_boot flag. However, it missed the delayed VDD off-path. If the
hardware VDD bit is cleared asynchronously (by BIOS, DMC, or DC states),
intel_pps_vdd_off_sync_unlocked() returns early because edp_have_panel_vdd()
is false, stranding the wakeref. Later, when the panel is turned on again,
the on-path overwrites the dangling pointer, permanently leaking the wakeref
(i915 raw-wakerefs=1 wakelocks=1 on cleanup).

This v3 patch fixes the leak completely by:
1. Preventing the early return in the off-path if we still hold a software
   wakeref, ensuring it is properly released regardless of HW state.
2. Using the boot flag to reuse the reference on the first boot handover.
3. Adding a strict check in the on-path to NEVER overwrite an existing
   wakeref if a logical imbalance occurs, while preserving the WARN_ON
   to catch state mismatches.

Tested on an HP Victus (s2idle).

Based on the original v2 idea by Arun R Murthy <arun.r.murthy@intel.com>.

Signed-off-by: Danylo Dobushovkyi <dobushovsky@gmail.com>
---
 .../gpu/drm/i915/display/intel_display_types.h  |  4 ++++
 drivers/gpu/drm/i915/display/intel_pps.c        | 17 +++++++++++++----
 2 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 9642264..ea46c13 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1709,6 +1709,10 @@ struct intel_pps {
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
index d4c98b1..38e7a34 100644
--- a/drivers/gpu/drm/i915/display/intel_pps.c
+++ b/drivers/gpu/drm/i915/display/intel_pps.c
@@ -758,9 +758,15 @@ bool intel_pps_vdd_on_unlocked(struct intel_dp *intel_dp)
 	if (edp_have_panel_vdd(intel_dp))
 		return need_to_disable;
 
-	drm_WARN_ON(display->drm, intel_dp->pps.vdd_wakeref);
-	intel_dp->pps.vdd_wakeref = intel_display_power_get(display,
-							    intel_aux_power_domain(dig_port));
+	if (intel_dp->pps.vdd_wakeref_boot) {
+		intel_dp->pps.vdd_wakeref_boot = false;
+	} else {
+		drm_WARN_ON(display->drm, intel_dp->pps.vdd_wakeref);
+		if (!intel_dp->pps.vdd_wakeref)
+			intel_dp->pps.vdd_wakeref =
+				intel_display_power_get(display,
+							intel_aux_power_domain(dig_port));
+	}
 
 	pp_stat_reg = _pp_stat_reg(intel_dp);
 	pp_ctrl_reg = _pp_ctrl_reg(intel_dp);
@@ -832,7 +838,7 @@ static void intel_pps_vdd_off_sync_unlocked(struct intel_dp *intel_dp)
 
 	drm_WARN_ON(display->drm, intel_dp->pps.want_panel_vdd);
 
-	if (!edp_have_panel_vdd(intel_dp))
+	if (!edp_have_panel_vdd(intel_dp) && !intel_dp->pps.vdd_wakeref)
 		return;
 
 	drm_dbg_kms(display->drm, "[ENCODER:%d:%s] %s turning VDD off\n",
@@ -861,6 +867,7 @@ static void intel_pps_vdd_off_sync_unlocked(struct intel_dp *intel_dp)
 		intel_dp_invalidate_source_oui(intel_dp);
 	}
 
+	intel_dp->pps.vdd_wakeref_boot = false;
 	intel_display_power_put(display,
 				intel_aux_power_domain(dig_port),
 				fetch_and_zero(&intel_dp->pps.vdd_wakeref));
@@ -1063,6 +1070,7 @@ void intel_pps_off_unlocked(struct intel_dp *intel_dp)
 	intel_dp_invalidate_source_oui(intel_dp);
 
 	/* We got a reference when we enabled the VDD. */
+	intel_dp->pps.vdd_wakeref_boot = false;
 	intel_display_power_put(display,
 				intel_aux_power_domain(dig_port),
 				fetch_and_zero(&intel_dp->pps.vdd_wakeref));
@@ -1337,6 +1345,7 @@ static void pps_vdd_init(struct intel_dp *intel_dp)
 	drm_WARN_ON(display->drm, intel_dp->pps.vdd_wakeref);
 	intel_dp->pps.vdd_wakeref = intel_display_power_get(display,
 							    intel_aux_power_domain(dig_port));
+	intel_dp->pps.vdd_wakeref_boot = true;
 }
 
 bool intel_pps_have_panel_power_or_vdd(struct intel_dp *intel_dp)
-- 
2.56.0

