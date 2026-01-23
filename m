Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEA22D7788F
	for <intel-gfx@archiver.kernel.org>; Fri, 23 Jan 2026 17:09:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6060310E2D2;
	Fri, 23 Jan 2026 17:09:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FAL/jOno";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 411E710E2D2
 for <intel-gfx@lists.freedesktop.org>; Fri, 23 Jan 2026 17:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769188156; x=1800724156;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=B213BclaC7Ms6XP2ZRHzDIo5VuVfIfuJIcv/pp10LMA=;
 b=FAL/jOnoVM8cYb61vM1B6JZcuapxdmWLea/DTmfW/OWtVYr8ApM4K/4J
 aMsG6mBUVAD2uVoUNYu/2Ksrn1qY+1AwMe5qL6HRK+7vi+KhkOYJQC/pp
 VgOZly2/l94SmyzYStZFYR8Go0P7+4nOacajVlTk0SrUs2r3JeKwelEDp
 iuszcBqJoqPj2QuURUtxBuDhNL1yGOvU8MzarycWsTYfnJHSeny5g6r4L
 /v899A+Lc2086Fhk3UHRfNPaHEbMsCJpFXssDoht6pCFMu02e9HYGdpXq
 vv38nkLBcQDRidnJzimooPoIIRCV6slgDBVVqb03O3nn4PPEBu2xhnGGg Q==;
X-CSE-ConnectionGUID: mC6ySYJ0RVms7ssdsknZVQ==
X-CSE-MsgGUID: VUBs1yQRRSKTNi1yAVvBYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="81556024"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="81556024"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 09:09:15 -0800
X-CSE-ConnectionGUID: RwncnTBITSGj310SPJtsyg==
X-CSE-MsgGUID: aRybojyFQr+Qr1ahR7bStQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="237725475"
Received: from dut4086lnl.fm.intel.com ([10.105.10.116])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 09:09:16 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 matthew.d.roper@intel.com
Subject: [PATCH] drm/i915/display: vcpi is always greater than zero
Date: Fri, 23 Jan 2026 17:09:15 +0000
Message-ID: <20260123170914.64548-2-jonathan.cavitt@intel.com>
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

Static analysis issue:

intel_conn_to_vcpi currently checks and asserts vcpi >= 0, as grabbed
from payload->vcpi.  But payload->vcpi is a u8, so this is always true.
Remove this unnecessary check.

While we're here, the jump statements in this function are largely
defunct now, so remove those as well.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/display/intel_hdcp.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
index 7114fc405c29..3673a70d7ef8 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
@@ -76,7 +76,6 @@ static int intel_conn_to_vcpi(struct intel_atomic_state *state,
 	struct drm_dp_mst_topology_mgr *mgr;
 	struct drm_dp_mst_atomic_payload *payload;
 	struct drm_dp_mst_topology_state *mst_state;
-	int vcpi = 0;
 
 	/* For HDMI this is forced to be 0x0. For DP SST also this is 0x0. */
 	if (!connector->mst.port)
@@ -87,15 +86,9 @@ static int intel_conn_to_vcpi(struct intel_atomic_state *state,
 	mst_state = to_drm_dp_mst_topology_state(mgr->base.state);
 	payload = drm_atomic_get_mst_payload_state(mst_state, connector->mst.port);
 	if (drm_WARN_ON(mgr->dev, !payload))
-		goto out;
+		return 0;
 
-	vcpi = payload->vcpi;
-	if (drm_WARN_ON(mgr->dev, vcpi < 0)) {
-		vcpi = 0;
-		goto out;
-	}
-out:
-	return vcpi;
+	return payload->vcpi;
 }
 
 /*
-- 
2.43.0

