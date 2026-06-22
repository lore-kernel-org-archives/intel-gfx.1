Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9773FCD98F2
	for <intel-gfx@archiver.kernel.org>; Mon, 22 Jun 2026 14:05:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2230210E283;
	Mon, 22 Jun 2026 14:05:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LPyAMtdh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CD5010E283
 for <intel-gfx@lists.freedesktop.org>; Mon, 22 Jun 2026 14:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782137158; x=1813673158;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DXMGjDInTOPYL78SIdMOdQC5cSLFkAyJqKHsNFj0bpw=;
 b=LPyAMtdh03Botto+/sRTnhZljN9xtJPLzdiVcayd0cDnu2sXiv9hx2Ld
 AtB44hu+eCs8+mJhGqPrh1PXpj3McDmzxD2mtzifaxYQ1Aj0oEs8PN1ay
 U+Zn0yd3XiNbircMcGwtMcSoBBs9glnUXVHkRaiyYStR+t1mUYVdnLWXE
 6jVeGKMRr/POZG41aJxDG1YKscKeMGIlzUzWy+hYvgMZ5kXwdAP7rQqMg
 3LFZhq+OZh7q1HFClYHa6GmEw9wChbmGz47mslEzxCh4sAXRCIRfitI8A
 IDMFbgax6Kc2XDaJqjAeAG5ligNgnd2DxiSECKWwN946jc4JwuJ7STr5J Q==;
X-CSE-ConnectionGUID: VzU/gEWmQhOlGngSDKWdUA==
X-CSE-MsgGUID: MAROP7R9QWOu4THLlRD/IQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="81846713"
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; d="scan'208";a="81846713"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2026 07:05:57 -0700
X-CSE-ConnectionGUID: 5DT1NIH0TOe3j/ADdLosrA==
X-CSE-MsgGUID: vFMLbaYWSROynghdZaLBFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; d="scan'208";a="242882224"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO hazy.intel.com)
 ([10.245.245.163])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2026 07:05:56 -0700
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2] drm/dp_mst: Handle torn-down topology gracefully in
 drm_dp_mst_topology_queue_probe()
Date: Mon, 22 Jun 2026 17:03:58 +0300
Message-ID: <20260622140532.526722-1-luciano.coelho@intel.com>
X-Mailer: git-send-email 2.53.0
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

A hotplug or link-loss event can tear down the MST topology
(setting mgr->mst_state = false and mgr->mst_primary = NULL) concurrently
with a caller invoking drm_dp_mst_topology_queue_probe(). Since the check
is already performed under mgr->lock, the condition is not a programming
error but a valid race -- the topology was valid when the caller decided
to call this function, but was torn down before the lock was acquired.

Replace the drm_WARN_ON() with a graceful early return. This eliminates
spurious kernel warnings and the resulting compositor crashes observed
when connecting/disconnecting DP MST monitors, while keeping the correct
behavior of doing nothing when MST is not active. A drm_dbg_mst() trace
is added so the skipped probe remains observable under MST debug logging.

The existing WARN_ON(mgr->mst_primary) in drm_dp_mst_topology_mgr_set_mst()
already catches the case where the topology is initialized twice, so no
diagnostic coverage is lost.

Fixes: dbaeef363ea5 ("drm/dp_mst: Add a helper to queue a topology probe")
Cc: Imre Deak <imre.deak@intel.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: stable@vger.kernel.org
Cc: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Jonas Emilsson <jonas.emilsson@gmail.com>
Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
---

Imre asked me to resend this with the small compilation fix as
requested by Lyude.

 drivers/gpu/drm/display/drm_dp_mst_topology.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index 4de36fda0544..7ce9e212770a 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -3740,8 +3740,10 @@ void drm_dp_mst_topology_queue_probe(struct drm_dp_mst_topology_mgr *mgr)
 {
 	mutex_lock(&mgr->lock);
 
-	if (drm_WARN_ON(mgr->dev, !mgr->mst_state || !mgr->mst_primary))
+	if (!mgr->mst_state || !mgr->mst_primary) {
+		drm_dbg_kms(mgr->dev, "queue_probe skipped: topology torn down\n");
 		goto out_unlock;
+	}
 
 	drm_dp_mst_topology_mgr_invalidate_mstb(mgr->mst_primary);
 	drm_dp_mst_queue_probe_work(mgr);
-- 
2.53.0

