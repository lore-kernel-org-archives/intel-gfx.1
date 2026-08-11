Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0BF9C5AC67
	for <intel-gfx@archiver.kernel.org>; Tue, 11 Aug 2026 09:54:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27F1210E2D5;
	Tue, 11 Aug 2026 09:54:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RHNI7ZD9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CD5510E2D5
 for <intel-gfx@lists.freedesktop.org>; Tue, 11 Aug 2026 09:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786442083; x=1817978083;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GmACu9zthA/TyNyzkRMQNOz4fQXJTBLIbFSmSuJhEIU=;
 b=RHNI7ZD9EvYb33IFAj9jH9p2xdFi692/xk+INqE4VQ0wI5pXYmbTHpQ+
 AwdSwSsjeL1+ZQQwzfJKHdzcW15ZgAK+9n2TVFmoCLSrBhubBG84Kg91m
 I2LO1co1nkI9Cz+WsJ7fl65X02ST9KSucEbXr14mwYswKQNuP15wnitgH
 1ukQzLhzUT6+3JXtwrOHG+89xAZ721kHwPp9VvED+ntCfQRWvW+ltHakC
 fDQ12EaRsO82Bo/UxBDZbuzGF1Ck9PG9qzSwRtl/TPFGrY+ZtDuEhx0Zw
 t0LwlnL4srresaOtRvH6+CC1l+UqBqh8X1THUCERz8HT05VwFLxWmzOyY w==;
X-CSE-ConnectionGUID: yeWP7oLfRqOGko5OaBVh1A==
X-CSE-MsgGUID: qebfQEItQMurR/b6rS9ntg==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="104359911"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="104359911"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 02:54:42 -0700
X-CSE-ConnectionGUID: HxxZQbR1TjuSMdJvxXaSoQ==
X-CSE-MsgGUID: F9GW5PUgS0SAaHADTPJoXw==
X-ExtLoop1: 1
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO hazy.intel.com)
 ([10.245.245.2])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 02:54:40 -0700
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH v2 0/5] drm/i915/display: reduce clock_gating interface
 between core and display
Date: Tue, 11 Aug 2026 12:49:08 +0300
Message-ID: <20260811095427.1147852-1-luciano.coelho@intel.com>
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

Hi,

As a follow up to my previous clock-gating patches, this series
reduces the interface between core and display by combining all the
platform-specific exported functions and letting the display code
decide what to do for each platform.

In v2:

  * Reworked the previous version so we have only one entry point,
    instead of an _early() and a _late() function.  It turns out that
    this is not necessary because some platforms were using only
    _early() and the others were using _late() (not both);
    
  * Removed back-dependency from the display code into the core code
    by avoiding calls to intel_clock_gating_init() (Jani);

Please review.

Cheers,
Luca.


Luca Coelho (5):
  drm/i915/display: consolidate Gen9 clock gating initialization
  drm/i915/display: consolidate remaining clock gating initialization
  drm/i915/display: remove unnecessary clock_gating include from
    intel_display.c
  drm/i915/display: add a way to restore only display/pch registers in
    clock_gating
  drm/i915/display: split part of intel_display_reset_finish() to a new
    function

 drivers/gpu/drm/i915/display/intel_display.c  |  1 -
 .../i915/display/intel_display_clock_gating.c | 74 +++++++++++++++----
 .../i915/display/intel_display_clock_gating.h | 17 +----
 .../drm/i915/display/intel_display_power.c    |  4 +-
 .../drm/i915/display/intel_display_reset.c    | 19 +++--
 .../drm/i915/display/intel_display_reset.h    |  1 +
 drivers/gpu/drm/i915/gt/intel_reset.c         |  5 ++
 drivers/gpu/drm/i915/intel_clock_gating.c     | 30 +++-----
 8 files changed, 94 insertions(+), 57 deletions(-)

-- 
2.53.0

