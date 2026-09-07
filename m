Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 342D9C79F9E
	for <intel-gfx@archiver.kernel.org>; Mon,  7 Sep 2026 04:46:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B764310E629;
	Mon,  7 Sep 2026 04:46:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OayOWAkm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B334810E629
 for <intel-gfx@lists.freedesktop.org>; Mon,  7 Sep 2026 04:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788756399; x=1820292399;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Xjeooc4xslSCg1w6azJElxKpdiDoz6Y7egQZjn0C+ck=;
 b=OayOWAkmnRTvC71Iiq0nCWjNX621VrbkIrSy4zcEM1BcufuaM1pYTnYC
 OfL7c8j3H0GkdEQV6oR8YbsjBSL7bbYZ2ujRbAmD/lp4lFRDJe0nJVOec
 fDcrKibLwOPz6uxGdYjtMDy/sN+jisDf5zdPUrRF0Sd/0z6YBFUdfnnFI
 y8OluiftrMW3UioCj1ExROhERLTx83Ry5zwJMSOkncTWU+56ACbYg7lyS
 +MX6JJ8pH8lhmjel5hykavoQRkI+1a5iNRcbnSOFzn2epUFDDOfCpdX/l
 bpfluX3y8emOv/rt9GXdsWm6v41StBRXJZ0edd/hlxC/KZMd5cUUhoAhw Q==;
X-CSE-ConnectionGUID: OwIMFql6TyqsMdBBmfD/Gw==
X-CSE-MsgGUID: 2demaHu5Rv2eMsREq49l0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="93022685"
X-IronPort-AV: E=Sophos;i="6.25,266,1779174000"; d="scan'208";a="93022685"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2026 21:46:38 -0700
X-CSE-ConnectionGUID: kR7CahETQtyT6L1Rh0cMug==
X-CSE-MsgGUID: TSibZovMRKuYKOBMwHjdFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,266,1779174000"; d="scan'208";a="267352147"
Received: from xiaolu.sh.intel.com ([10.239.146.103])
 by fmviesa007.fm.intel.com with ESMTP; 06 Sep 2026 21:46:37 -0700
From: Xiao Lu <xiaolu.xie@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: jani.nikula@linux.intel.com, ville.syrjala@linux.intel.com,
 imre.deak@intel.com, ankit.k.nautiyal@intel.com,
 Xiao Lu <xiaolu.xie@intel.com>
Subject: [PATCH v5 0/2] drm/i915/dp: enable DSC passthrough for HDMI 2.1 PCON
 devices
Date: Mon,  7 Sep 2026 12:44:08 +0800
Message-ID: <20260907044410.1368008-1-xiaolu.xie@intel.com>
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

This series enables explicit driver control of DSC passthrough for
HDMI 2.1 PCON devices (e.g. Parade PS196) connected both directly (SST)
and via MST hub (e.g. PS8650).

Patch 1/2 fixes drm_dp_mst_is_virtual_dpcd() to also recognize
DP_PEER_DEVICE_DP_LEGACY_CONV as a valid downstream peer type in the
DP-to-DP branch, which is required for passthrough_aux to be correctly
set when a PCON sits behind an MST hub.

Patch 2/2 adds the intel_dp driver changes to detect, configure and
control DSC passthrough mode.

Tested with Parade PS196G + Lenovo ThinkVision Pro 27UD-10 (HDMI 2.1,
DSC 1.2). At 4K@240Hz DSC is required; driver writes 0x160=0x02 and
DSC parameters are derived from the HDMI sink EDID.

Xiao Lu (2):
  drm/dp/mst: recognize DP-to-HDMI PCON as virtual DPCD in DP-to-DP topology
  drm/i915/dp: enable DSC passthrough for HDMI 2.1 PCON devices

 drivers/gpu/drm/display/drm_dp_mst_topology.c      |   3 +-
 drivers/gpu/drm/i915/display/intel_display_types.h |   1 +
 drivers/gpu/drm/i915/display/intel_dp.c            | 275 ++++++++++++++++++---
 3 files changed, 244 insertions(+), 35 deletions(-)

-- 
2.43.0

