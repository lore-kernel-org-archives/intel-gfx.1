Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12EBBC79F89
	for <intel-gfx@archiver.kernel.org>; Mon,  7 Sep 2026 04:44:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 953AA10E620;
	Mon,  7 Sep 2026 04:44:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gd5k94rU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E44DD10E620
 for <intel-gfx@lists.freedesktop.org>; Mon,  7 Sep 2026 04:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788756249; x=1820292249;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pioSbD2s/+M7BbkAj2hC03O9yt2dCo68AHfkzH+u+vk=;
 b=Gd5k94rUa8E2UCcJkWTUk3aSUwSetjXRTuUn6WzmV9BWfa8GUyX4L/5j
 JH92MYfgqqWlYqKhgWw1AyFrf+hVxYKJqTJJu4gA53WG5+7+yvNPS2Y8z
 4/uHuli22Oz0zLDs2YllQCwkXgoadrw1Cqdoe6O5Qi5sxNvN+JKowMFkd
 g9DRtYPAuWL9Oirjhzv11uuRdh6x35VQSlB4Aft5raBm23Ap7hMLQD/HG
 ETYye2C3PbbH11w01CUBFqX0AdSU1B9JQzeCiFZL8kKCnj+U/Nb1bfTXW
 jKzsKNReHte2wxdtZq8e/34oRA8cxHqtzTDI/zCfXxP6t2Hq51DJKfus2 A==;
X-CSE-ConnectionGUID: y7Cqk4jKR8uELI83g9vbNw==
X-CSE-MsgGUID: 7ICDxQc1S1yWwXG/wa3fBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="100511226"
X-IronPort-AV: E=Sophos;i="6.25,266,1779174000"; d="scan'208";a="100511226"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2026 21:44:09 -0700
X-CSE-ConnectionGUID: BvXIFGQpRmSy9uk13mVUUA==
X-CSE-MsgGUID: K6rPoLbVTxuegWlaFeiYcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,266,1779174000"; d="scan'208";a="295472270"
Received: from xiaolu.sh.intel.com ([10.239.146.103])
 by fmviesa001.fm.intel.com with ESMTP; 06 Sep 2026 21:44:07 -0700
From: Xiao Lu <xiaolu.xie@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: jani.nikula@linux.intel.com, ville.syrjala@linux.intel.com,
 imre.deak@intel.com, ankit.k.nautiyal@intel.com,
 Xiao Lu <xiaolu.xie@intel.com>
Subject: [PATCH v5 1/2] drm/dp/mst: recognize DP-to-HDMI PCON as virtual DPCD
 in DP-to-DP topology
Date: Mon,  7 Sep 2026 12:41:39 +0800
Message-ID: <20260907044140.1367870-1-xiaolu.xie@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260906094156.1057767-1-xiaolu.xie@intel.com>
References: <20260906094156.1057767-1-xiaolu.xie@intel.com>
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

drm_dp_mst_is_virtual_dpcd() checks if a branch port qualifies as a
virtual DPCD device by looking for a downstream port with
Peer_Device_Type=3 (DP_PEER_DEVICE_SST_SINK).

Some PCON devices advertise their downstream HDMI sink port using
Peer_Device_Type=4 (DP_PEER_DEVICE_DP_LEGACY_CONV) with a non-zero
DPCD_Revision in the link address reply, indicating a virtual DPCD is
present (VESA SCR Option 2). The current check misses this case, so
passthrough_aux is never set and DSC passthrough modes are rejected.

Accept DP_PEER_DEVICE_DP_LEGACY_CONV as a valid downstream peer type
in the DP-to-DP branch so these PCON topologies are correctly
identified.

Signed-off-by: Xiao Lu <xiaolu.xie@intel.com>
---
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index 4de36fda0..7d1128bcd 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -6045,7 +6045,8 @@ static bool drm_dp_mst_is_virtual_dpcd(struct drm_dp_mst_port *port)
 	    port->mstb &&
 	    port->mstb->num_ports == 2) {
 		list_for_each_entry(downstream_port, &port->mstb->ports, next) {
-			if (downstream_port->pdt == DP_PEER_DEVICE_SST_SINK &&
+			if ((downstream_port->pdt == DP_PEER_DEVICE_SST_SINK ||
+			     downstream_port->pdt == DP_PEER_DEVICE_DP_LEGACY_CONV) &&
 			    !downstream_port->input) {
 				mutex_unlock(&port->mgr->lock);
 				return true;
-- 
2.43.0

