Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F27AEC54EAA
	for <intel-gfx@archiver.kernel.org>; Fri, 27 Jan 2023 17:30:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1591A10E11A;
	Fri, 27 Jan 2023 17:30:49 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F257110E11A
 for <intel-gfx@lists.freedesktop.org>; Fri, 27 Jan 2023 17:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674840647; x=1706376647;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lLSZl3gd2eZ78Vx9zbN8C2Ulr4MjxmqUBVp9f4kvyZY=;
 b=b8W6pJYg2rjd3i0JP654jiEYCLjv7fOZZK2ObYQjaD+gZXUvzfaN//tc
 4+iq04I7V0jFnoz4bWpVylLzDDD5vHx8aqehFeFyB5qkAjFJsjQInx6L7
 xNMnfnplv3gyGP5h3H5zOaPGuidhO8dhJ90X/f4Wj3IWQSP8TCkbisyLW
 S9mvbBs67jXC90UC/dKp15GSXTMkQITBW4Y16C37/BoPX8p2zMOoZoPOD
 bjO1cFRWRf/FTVWJ9u+8gi6DHXtVsTZHm/24KfSeg7Btk1oibcmop7+0k
 a3wszK6AHKD3cwTGavBUON7fiErVuBYrTevmPSdk/U1+3MMRh3q0p9WnX w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="327160457"
X-IronPort-AV: E=Sophos;i="5.97,251,1669104000"; d="scan'208";a="327160457"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2023 09:30:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="752061784"
X-IronPort-AV: E=Sophos;i="5.97,251,1669104000"; d="scan'208";a="752061784"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.55])
 by FMSMGA003.fm.intel.com with SMTP; 27 Jan 2023 09:30:45 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 27 Jan 2023 19:30:44 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Fri, 27 Jan 2023 19:30:40 +0200
Message-Id: <20230127173044.24108-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH v2 0/4] drm/i915: vblank stuff
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

A bunch of stuff related to vblank length/start.

v2: Fix inactive pipe handling
    Fix SAGV handling
    Fix some typos

Ville Syrjälä (4):
  drm/i915/vrr: Fix "window2" handling
  drm/i915/psr: Fix the delayed vblank w/a
  drm/i915: Extract skl_wm_latency()
  drm/i915: Reject wm levels that exceed vblank time

 drivers/gpu/drm/i915/display/intel_psr.c     |   9 +-
 drivers/gpu/drm/i915/display/intel_vrr.c     |  10 +-
 drivers/gpu/drm/i915/display/skl_watermark.c | 155 +++++++++++++++++--
 3 files changed, 144 insertions(+), 30 deletions(-)

-- 
2.39.1

