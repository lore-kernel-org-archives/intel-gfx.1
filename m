Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99844C10F1A
	for <intel-gfx@archiver.kernel.org>; Tue,  7 May 2024 04:06:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23F5910E84D;
	Tue,  7 May 2024 04:06:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nY7AVVvn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7565A10E84D
 for <intel-gfx@lists.freedesktop.org>; Tue,  7 May 2024 04:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715054795; x=1746590795;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HldnDDBMs2YGsZipEYpr57U6QenYV2KQr56Qq03Nw2k=;
 b=nY7AVVvnCxfH85bAAqvUkeMqFTyziBBTnZsUnodmq1hWX5c2ZcP8QwUW
 I3sYUaxtNIXX5TzYQPBtQsPsU13CbX0Jh3BvinWg7o7osfrFoBojOiNlN
 Xs06T1SvmFJke8GbM7qFEJpB2Hc/WCSYfbwBTOzRcK4JOs+Q8gt9Q/tg1
 jjRfwURk3pMQV1zFlE7WC+gTSqJ8Q4GViQOkyTyMUSxtK7phbvS3lIG6X
 ZuT+sofkkdGxpJgkktCn4Pe3x+FGvFYTfSz+WetZCFlUvJ1ttpw/HxwuG
 pKKANIoKFtFlYLeDnOi/TA81OMS43RiFLcs+fCibU9ZvRCw0qVDF+0HZs Q==;
X-CSE-ConnectionGUID: ln212tVxRLalgMO43jGsqg==
X-CSE-MsgGUID: P6Nw2VQRSGCm/S+6VCs68A==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="14645335"
X-IronPort-AV: E=Sophos;i="6.07,260,1708416000"; d="scan'208";a="14645335"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 21:06:35 -0700
X-CSE-ConnectionGUID: TCv6cLE1RbK6WBRP2qbxWw==
X-CSE-MsgGUID: v0jKEdmOQUSzgUpJLQA/tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,260,1708416000"; d="scan'208";a="28468271"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.32])
 by orviesa009.jf.intel.com with ESMTP; 06 May 2024 21:06:32 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com, uma.shankar@intel.com,
 ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 0/7] Enable Aux Based EDP HDR
Date: Tue,  7 May 2024 09:34:00 +0530
Message-ID: <20240507040407.1056061-1-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.43.2
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

This series enables Aux based EDP HDR and backlight controls.
The DPCD written to are intel proprietary and are filled
based on the specs that were provided to TCON vendors.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>

Suraj Kandpal (7):
  drm/i915/dp: Make has_gamut_metadata_dip() non static
  drm/i915/dp: Rename intel struct inside intel_panel
  drm/i915/dp: Add TCON HDR capability checks
  drm/i915/dp: Fix Register bit naming
  drm/i915/dp: Drop comments on EDP HDR DPCD registers
  drm/i915/dp: Enable AUX based backlight for HDR
  drm/i915/dp: Write panel override luminance values

 .../drm/i915/display/intel_display_types.h    |   7 +-
 drivers/gpu/drm/i915/display/intel_dp.c       |   6 +-
 drivers/gpu/drm/i915/display/intel_dp.h       |   1 +
 .../drm/i915/display/intel_dp_aux_backlight.c | 149 +++++++++++++++---
 4 files changed, 140 insertions(+), 23 deletions(-)

-- 
2.43.2

