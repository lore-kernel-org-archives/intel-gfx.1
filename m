Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7156BC61DD3
	for <intel-gfx@archiver.kernel.org>; Mon, 31 Aug 2026 04:41:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08C5710E245;
	Mon, 31 Aug 2026 04:41:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U2YmiTZE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9BDC10E245
 for <intel-gfx@lists.freedesktop.org>; Mon, 31 Aug 2026 04:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788151305; x=1819687305;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=89llfQR08n5aKyihT4kCC/BTYjrvYWtEI5EcaBpmuKM=;
 b=U2YmiTZE9gvf3hDtAWtYpHjXBj56E68D0qg0wKv3mLzxx2ahl/ZLVHH9
 y5RlOGCe22xAbyIndmUmkizwJ/nfVwVpAl9UsG1tto7bDVP9qAx9Dvam4
 7vvij1wgQ1+SPJc6okCYE3C6yYWewxi+7WbgfQps/9HnYnNY5c7KkVteu
 VeiPsmcdgFrgHsLZzcl62c2744ZwbSUs+ntiLgfKBc1/yWvdwQ45Lb7Dd
 u2E+Jbr3y01SJPgXYvvDmDIJnsnvA0daO3IYGxj0HryMWAjwL74F3u32h
 3DDUijewFR5uWSCfCPa6WufKOqCKdxV96YNdKUsetJK2ICufwqa4YqiSF w==;
X-CSE-ConnectionGUID: WmOQZajoSTaUAYcBjQfDvQ==
X-CSE-MsgGUID: typmpgn0R8+sKXZOY8cPmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="88563147"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="88563147"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2026 21:41:44 -0700
X-CSE-ConnectionGUID: BmYJuVccT/yHo/MYgjSjkA==
X-CSE-MsgGUID: ZEwtRCPFSKSJAdPHeen/qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="292187655"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa002.fm.intel.com with ESMTP; 30 Aug 2026 21:41:43 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: Arun R Murthy <arun.r.murthy@intel.com>,
 Adharsh K <adharshkandath@gmail.com>
Subject: [PATCH] drm/i915/pps: don't orphan the VDD wakeref when the HW force
 bit is reset
Date: Mon, 31 Aug 2026 10:10:36 +0530
Message-Id: <20260831044036.1236136-1-arun.r.murthy@intel.com>
X-Mailer: git-send-email 2.25.1
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

pps_vdd_init() takes an AUX power-domain reference into
intel_dp->pps.vdd_wakeref when it finds EDP_FORCE_VDD already enabled by
the BIOS, and defers dropping it to a later scheduled VDD off.

intel_pps_vdd_on_unlocked() decides whether it already owns that reference
by reading the live EDP_FORCE_VDD bit via edp_have_panel_vdd(). That bit
can be reset under the driver (DC states, DMC, BIOS) while we still hold
vdd_wakeref. When that happens the function believes it holds nothing,
overwrites vdd_wakeref with a freshly acquired reference and orphans the
original one. The leak surfaces at suspend-late as:

  i915 raw-wakerefs=1 wakelocks=1 on cleanup

with the leaked wakeref's backtrace pointing at pps_vdd_init() ->
intel_pps_init() from driver probe.

Make vdd_wakeref the authoritative record of the reference: only acquire
a new one when we don't already hold it, and re-assert the HW bit either
way. This keeps the reference balanced regardless of the volatile HW
state and drops the now-incorrect WARN_ON().

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/8477
Assisted-by: Claude:claude-3-opus
Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
Tested-by: Adharsh K <adharshkandath@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_pps.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_pps.c b/drivers/gpu/drm/i915/display/intel_pps.c
index d4c98b150fa2..43e89aaf419f 100644
--- a/drivers/gpu/drm/i915/display/intel_pps.c
+++ b/drivers/gpu/drm/i915/display/intel_pps.c
@@ -758,9 +758,10 @@ bool intel_pps_vdd_on_unlocked(struct intel_dp *intel_dp)
 	if (edp_have_panel_vdd(intel_dp))
 		return need_to_disable;
 
-	drm_WARN_ON(display->drm, intel_dp->pps.vdd_wakeref);
-	intel_dp->pps.vdd_wakeref = intel_display_power_get(display,
-							    intel_aux_power_domain(dig_port));
+	if (!intel_dp->pps.vdd_wakeref)
+		intel_dp->pps.vdd_wakeref =
+			intel_display_power_get(display,
+						intel_aux_power_domain(dig_port));
 
 	pp_stat_reg = _pp_stat_reg(intel_dp);
 	pp_ctrl_reg = _pp_ctrl_reg(intel_dp);
-- 
2.25.1

