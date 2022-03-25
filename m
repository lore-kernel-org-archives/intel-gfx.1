Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFF04C433EF
	for <intel-gfx@archiver.kernel.org>; Fri, 25 Mar 2022 12:32:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C75C10E238;
	Fri, 25 Mar 2022 12:32:09 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A331A10E238
 for <intel-gfx@lists.freedesktop.org>; Fri, 25 Mar 2022 12:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648211528; x=1679747528;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YHDv5uSgwtTYvMePWhSrhHRTfW4jYQBBFuPMth7+74Y=;
 b=Zs5TA05I0HWtmVAvDql4T4NOKpm2zmptea/WZtTGf+x3WR9QGXTey1Ww
 e/dYe+xvXWWMUMJNKQRF+yS+zqoJ+PEYYp9pIY5gMyjYDujgx2i8Lg1x/
 D/hDR8v7lM+x022nrD8QxbHboqVNuKDRxPcDndsfbAhif/S8XCYBNu2jr
 oMGPJPJMz2nzMQeKuPMb/KZ57PUnd1EXQhLgHpMO2o6VDCFfTS4M8fLv5
 x6NARbbKPl97589M1XW1xD9qU2YTwq7LumZQsOLHz6wA23lzi+nL2ka4d
 /0UKchY3oIyLVQenHO+Jch+UgoKpCfeOKNgnAesw8/j+giirCpyTiwdUF g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10296"; a="257451324"
X-IronPort-AV: E=Sophos;i="5.90,209,1643702400"; d="scan'208";a="257451324"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2022 05:32:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,209,1643702400"; d="scan'208";a="545065097"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.61])
 by orsmga007.jf.intel.com with SMTP; 25 Mar 2022 05:32:06 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 25 Mar 2022 14:32:05 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Fri, 25 Mar 2022 14:31:52 +0200
Message-Id: <20220325123205.22140-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 00/13] drm/i915: Start reordering modeset clock
 calculations
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

Start reordering when we do the clock/dpll calculations
during the atomic check. The eventual goals are:
- back feed the actually calculated clock into the crtc state
  so that stuff that depends on it (eg. watermarks) will be
  calculated based on the actual hardware state we're going to use
  rather than the semi-fictional state we started with
- fix the fastset/fastboot stuff to actually require exact
  clock matches. Avoids the current mess where the user asks
  to slightly change the refresh rate (eg. to match video frame
  rate) but the kernel decides to ignore it and do a fastset instead.

Ville Syrjälä (13):
  drm/i915: Make .get_dplls() return int
  drm/i915: Pass dev_priv to intel_shared_dpll_init()
  drm/i915: Remove pointless dpll_funcs checks
  drm/i915: Adjust .crtc_compute_clock() calling convention
  drm/i915: Move stuff into intel_dpll_crtc_compute_clock()
  drm/i915: Move the dpll_hw_state clearing to
    intel_dpll_crtc_compute_clock()
  drm/i915: Clear the dpll_hw_state when disabling a pipe
  drm/i915: Split out dg2_crtc_compute_clock()
  drm/i915: Add crtc .crtc_get_shared_dpll()
  drm/i915: Split shared dpll .get_dplls() into compute and get phases
  drm/i915: Do .crtc_compute_clock() earlier
  drm/i915: Clean up DPLL related debugs
  drm/i915: Reassign DPLLs only for crtcs going throug .compute_config()

 drivers/gpu/drm/i915/display/intel_display.c  |  33 +-
 drivers/gpu/drm/i915/display/intel_dpll.c     | 249 ++++----
 drivers/gpu/drm/i915/display/intel_dpll.h     |   6 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c | 531 +++++++++++-------
 drivers/gpu/drm/i915/display/intel_dpll_mgr.h |  12 +-
 5 files changed, 491 insertions(+), 340 deletions(-)

-- 
2.34.1

