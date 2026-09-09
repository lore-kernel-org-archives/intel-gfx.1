Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FA77C79F8C
	for <intel-gfx@archiver.kernel.org>; Wed,  9 Sep 2026 04:13:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECE1910E1CD;
	Wed,  9 Sep 2026 04:13:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BZ1bSLqm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63BDF10E1CD
 for <intel-gfx@lists.freedesktop.org>; Wed,  9 Sep 2026 04:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788927190; x=1820463190;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pioSbD2s/+M7BbkAj2hC03O9yt2dCo68AHfkzH+u+vk=;
 b=BZ1bSLqmG/HmYnOzs+lKtzl2u5b25emwKnukW81+KSMEMoTrwIZC4BWx
 H5dlcwbbItpZjuHgNVSUYf+iORLJgTqXMQ6E1ZPM8CMNlJ7S4MO8Ohead
 sppUbTIdqfYqQvNZo+TxxzyTdUcEIy90O6opn2FuaLqc65xGEe6oGhhm0
 nIr9cuqlglM1IQIk1xI/GN6fnWJ3HzPt7MjP/5lqN3uaWk7bM9hCU89d4
 AqNmoR5Tu9jJTv5s7KX2NRPKVdHyb1Va8OXFix6lVBaWXHsjKJAl4VSWT
 IHOcZh2KwnwHRay87wS4LDyLcujn2H0VhPPR2iCmWoQesCFX+gAM2By/O g==;
X-CSE-ConnectionGUID: XLn1f7hcQYm7z916iTbUTQ==
X-CSE-MsgGUID: UQfyUPBGT8uEY/gyAEbHQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="106857664"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="106857664"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 21:13:09 -0700
X-CSE-ConnectionGUID: NElZ406gTEq5jmLDQTyiKA==
X-CSE-MsgGUID: VutiolhfSKWd8ofAG64H+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="269450264"
Received: from xiaolu.sh.intel.com ([10.239.146.103])
 by orviesa006.jf.intel.com with ESMTP; 08 Sep 2026 21:13:07 -0700
From: Xiao Lu <xiaolu.xie@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: jani.nikula@linux.intel.com, ville.syrjala@linux.intel.com,
 imre.deak@intel.com, ankit.k.nautiyal@intel.com,
 Xiao Lu <xiaolu.xie@intel.com>
Subject: [PATCH v7 1/2] drm/dp/mst: recognize DP-to-HDMI PCON as virtual DPCD
 in DP-to-DP topology
Date: Wed,  9 Sep 2026 12:10:40 +0800
Message-ID: <20260909041041.244531-1-xiaolu.xie@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909033518.158995-1-xiaolu.xie@intel.com>
References: <20260909033518.158995-1-xiaolu.xie@intel.com>
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

