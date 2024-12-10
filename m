Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45D23E7717F
	for <intel-gfx@archiver.kernel.org>; Tue, 10 Dec 2024 21:10:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5AC910E3CF;
	Tue, 10 Dec 2024 21:10:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dCAUb+xt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6316010E3CF
 for <intel-gfx@lists.freedesktop.org>; Tue, 10 Dec 2024 21:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733865010; x=1765401010;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3H2tlJhvS+kPIbIMcC7s2F4sF3GSxM5taIUoI8v7zyM=;
 b=dCAUb+xtf9YTUZn/vhfzKMkaTUNvD3qNJ/JyeyEdivSlsDQxvBoD71Vi
 Uff5osZmg4jkMB/vQjQtNDz8sMeejShfRxPS7SANdXz1/6Rh4V1mf7E8F
 02aIUzlD4Puh6hXiGDSiyUI8hMEollPoBP5ExtPARQQ96leBwEtlC8LJP
 24SgR1JJ8zmL5Dmz72twOxBmCgsrhoztVOH+wOPyKraic2rJ+P029uWJh
 y7VgYSd38AEfEa9UbBDOtN5ktVHVulV8EE48WegAqOI3GGH3ol8wnm62a
 aXy/PL0hEDmGAG1gy4AoZQLij98hx/qPylv/yXUtgjQdALvL167OHt0ej w==;
X-CSE-ConnectionGUID: +oxBsTLcSlqXpozZI/n89A==
X-CSE-MsgGUID: 8Jjg50Y2T8erPkq0/jO8Gw==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="59620159"
X-IronPort-AV: E=Sophos;i="6.12,223,1728975600"; d="scan'208";a="59620159"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 13:10:10 -0800
X-CSE-ConnectionGUID: GNrisIkuQfiZ0UG6KucNug==
X-CSE-MsgGUID: Eg+OthG2Sm+B8lFB5HsPbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,223,1728975600"; d="scan'208";a="95735015"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 10 Dec 2024 13:10:08 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 10 Dec 2024 23:10:07 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 00/18] drm/i915: DSB+VRR
Date: Tue, 10 Dec 2024 23:09:49 +0200
Message-ID: <20241210211007.5976-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

bunch of DSB and VRR Stuff:
- enable DSB based commits when VRR is active
- fix TGL delayed vblank handling with VRR
- some tweaks to VRR programming for ADL+
- bunch of state dump improvements/etc.

Ville Syrjälä (18):
  drm/i915: Extract intel_crtc_vblank_delay()
  drm/i915: Check vblank delay validity
  drm/i915: Fix include order
  drm/i915: Introduce intel_vrr_{vmin,vmax}_vtotal()
  drm/i915: Move framestart/etc. state dump to a better spot
  drm/i915: Include the vblank delay in the state dump
  drm/i915/vrr: Improve VRR state dump
  drm/i915: Include the scanline offset in the state dump
  drm/i915: Extract intel_mode_vblank_delay()
  drm/i915: Consolidate intel_pre_commit_crtc_state()
  drm/i915: Extract intel_crtc_active_timings()
  drm/i915/vrr: Introduce intel_vrr_vblank_delay()
  drm/i915/vrr: Drop the extra vmin adjustment for ADL+
  drm/i915/vrr: Fix vmin/vmax/flipline on TGL when using vblank delay
  drm/i915/vrr: Add extra vblank delay to estimates
  drm/i915/vrr: Plumb the DSB into intel_vrr_send_push()
  drm/i915/dsb: Add support for triggering VRR push with DSB
  drm/i915/dsb: Allow DSB to perform commits when VRR is enabled

 drivers/gpu/drm/i915/display/intel_crtc.c     |   2 +-
 .../drm/i915/display/intel_crtc_state_dump.c  |  25 ++--
 drivers/gpu/drm/i915/display/intel_display.c  |  68 +++++++++--
 drivers/gpu/drm/i915/display/intel_dsb.c      |  54 ++++-----
 drivers/gpu/drm/i915/display/intel_vblank.c   |  84 +++++++++----
 drivers/gpu/drm/i915/display/intel_vblank.h   |   6 +
 drivers/gpu/drm/i915/display/intel_vrr.c      | 113 +++++++++++++++---
 drivers/gpu/drm/i915/display/intel_vrr.h      |   7 +-
 8 files changed, 268 insertions(+), 91 deletions(-)

-- 
2.45.2

