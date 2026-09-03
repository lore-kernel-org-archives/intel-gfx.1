Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40183C624D7
	for <intel-gfx@archiver.kernel.org>; Thu,  3 Sep 2026 10:46:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE0D110F507;
	Thu,  3 Sep 2026 10:46:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NYeV9WxG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DB0710F507
 for <intel-gfx@lists.freedesktop.org>; Thu,  3 Sep 2026 10:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788432389; x=1819968389;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kxwCDqIxlI4rK9dGcl7UKslycNjHi62LcB9wHhHJVgQ=;
 b=NYeV9WxGZBWpsBJFVWRXIXoB9zrqaOzYoXvh1s0jq0t0tyFmaLpqgtLc
 XaAtg39TmeAwmp19FBa1R1EfEEKMlkJMKq3hHgwq3RgIgY/lRt0Q3Qppi
 Zw0fdsbfSrUSdZdQ1hlAeOWy8/3hZ5Jo9DAnf+buuZvlSphr9yT3mj0vM
 pOeIlYbhs5Ch9JsHy35w7nGF9+1GT6v6r1/LeU/fW3eOF1zEwmP1ZUBvL
 xo3Vzx2NfiRDAGB3jVncQ5pfVnN+HrQQ9oKnPMn8K+ZLPrIAfw/TaxuCs
 2f80/BGZ9KLBRYlfPaSluut9J59RWv8XVT/ZZKa5Z/ObnLGSvdAvbzfCS Q==;
X-CSE-ConnectionGUID: GyNau1B3TQ6LaUtgGejfrw==
X-CSE-MsgGUID: IzV8HXcpTNOlTS8VMaBJ/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="106431362"
X-IronPort-AV: E=Sophos;i="6.25,259,1779174000"; d="scan'208";a="106431362"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 03:46:29 -0700
X-CSE-ConnectionGUID: vgW4/fNITLSBq1/trMLHqA==
X-CSE-MsgGUID: JiR6cPwTS5KqhQf4+W9Lzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,259,1779174000"; d="scan'208";a="269154953"
Received: from xiaolu.sh.intel.com ([10.239.146.103])
 by orviesa008.jf.intel.com with ESMTP; 03 Sep 2026 03:46:27 -0700
From: Xiao Lu <xiaolu.xie@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: jani.nikula@linux.intel.com, ville.syrjala@linux.intel.com,
 imre.deak@intel.com, ankit.k.nautiyal@intel.com,
 Xiao Lu <xiaolu.xie@intel.com>
Subject: [PATCH] drm/i915/dp: reset HDMI 2.1 PCON FRL state on disconnect
Date: Thu,  3 Sep 2026 18:44:00 +0800
Message-ID: <20260903104400.498178-1-xiaolu.xie@intel.com>
X-Mailer: git-send-email 2.43.0
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

When a DP-to-HDMI 2.1 PCON is disconnected, frl.is_trained remains
set from the previous connection. On reconnect, intel_dp_check_frl_training()
checks this flag first and returns early if set, bypassing the entire FRL
training sequence entirely - including drm_dp_pcon_frl_prepare() which
sets SOURCE_CONTROLLED_MODE. As a result the source never drives FRL
negotiation on reconnect, and the HDMI FRL link may not be re-established
correctly.

The root cause is that frl.is_trained reflects the driver's last known
state and is not invalidated when the physical link goes away. From the
source's perspective, once the PCON is disconnected the downstream HDMI
FRL link state is unknown and must be treated as gone.

Add intel_dp_pcon_disconnect(), mirroring intel_dp_mst_disconnect() and
intel_dp_tunnel_disconnect(), which clears frl.is_trained and
frl.trained_rate_gbps on disconnect. This ensures intel_dp_check_frl_training()
always performs a fresh FRL negotiation on the next connect.

Signed-off-by: Xiao Lu <xiaolu.xie@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 113d767e62e9..3643b6c4c1bc 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -4996,6 +4996,27 @@ intel_dp_mst_disconnect(struct intel_dp *intel_dp)
 	drm_dp_mst_topology_mgr_set_mst(&intel_dp->mst.mgr, intel_dp->is_mst);
 }
 
+/*
+ * On disconnect, the downstream PCON and its HDMI FRL link state are gone
+ * from the source's perspective. Clear the cached FRL training state so that
+ * intel_dp_check_frl_training() performs a fresh FRL negotiation on the next
+ * connect, rather than skipping training based on stale state.
+ */
+static void
+intel_dp_pcon_disconnect(struct intel_dp *intel_dp)
+{
+	struct intel_display *display = to_intel_display(intel_dp);
+
+	if (!intel_dp_is_hdmi_2_1_sink(intel_dp))
+		return;
+
+	drm_dbg_kms(display->drm,
+		    "PCON HDMI2.1 sink disconnected, resetting FRL state (was trained at %d Gbps)\n",
+		    intel_dp->frl.trained_rate_gbps);
+	intel_dp->frl.is_trained = false;
+	intel_dp->frl.trained_rate_gbps = 0;
+}
+
 #define INTEL_DP_DEVICE_SERVICE_IRQ_MASK_SST	(DP_AUTOMATED_TEST_REQUEST | \
 						 DP_CP_IRQ | \
 						 DP_SINK_SPECIFIC_IRQ)
@@ -6337,6 +6358,8 @@ intel_dp_detect(struct drm_connector *_connector,
 
 		intel_dp_tunnel_disconnect(intel_dp);
 
+		intel_dp_pcon_disconnect(intel_dp);
+
 		intel_dp_tunnel_uhbr_lanes_wa_reset(intel_dp);
 
 		goto out_unset_edid;
-- 
2.43.0

