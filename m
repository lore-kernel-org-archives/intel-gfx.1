Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B228EB64D7
	for <intel-gfx@archiver.kernel.org>; Fri, 16 Jun 2023 14:08:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CC8910E637;
	Fri, 16 Jun 2023 14:08:24 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4F9210E637
 for <intel-gfx@lists.freedesktop.org>; Fri, 16 Jun 2023 14:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686924503; x=1718460503;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LQnPDVxM9v1lnT80bkfOuyiD54DdARHqyCWfsqd6Hms=;
 b=cXvW0zO9AY7a7IFQUKTm3u4vFOilLiPPmkCNjC5I77iWV7DLYlctcipL
 Lkwowk0P4Tv8Pt6YDIwTZqaVowDPCrrmwjL1zDRstdpwh5YSPwIloB1iG
 MWKt+fiMmXxu+PQtBaR7JcCoxSExchqxCLa1S6HKSs9UB9RgLt5NFdwwR
 4U3tNe3ha0SDBIkhTH3VNDVCHwLzWkmBVBCGzAn94ls5602M5B69KN5r7
 eaHFvXpLXnntc3VAwKuU/R6Of42jVkeLDPVyRn0RCBMdRUsnryn2VSbt+
 6rUuWqxI8nxL6UVQUsPhtbgstho2Jgg1bF3aOP7HDZhVq+MmmtVXlBdWH w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="343957774"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; d="scan'208";a="343957774"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2023 07:08:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="712882917"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; d="scan'208";a="712882917"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
 by orsmga002.jf.intel.com with SMTP; 16 Jun 2023 07:08:20 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 16 Jun 2023 17:08:20 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Fri, 16 Jun 2023 17:08:13 +0300
Message-Id: <20230616140820.11726-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.39.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH v3 0/7] drm/i915: Init DDI ports based on
 port_mask
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

Introduce port_mask into the device info and utilize it
it initalize DDI ports instead of hand rolling each
intel_ddi_init() call per platform+port.

This is an intermediate step towards initializing
DDI/DP/HDMI/DSI ports purely based on VBT information.

v2: rebased due to intel_display_device.c
v3: Drop DDI-C on TGL for now, fix TGL TC5/6 mixup, rebase due to DSI stuff

Ville Syrjälä (7):
  drm/i915: Remove bogus DDI-F from hsw/bdw output init
  drm/i915: Introduce device info port_mask
  drm/i915: Assert that device info bitmasks have enough bits
  drm/i915: Assert that the port being initialized is valid
  drm/i915: Beef up SDVO/HDMI port checks
  drm/i915: Init DDI outputs based on port_mask on skl+
  drm/i915: Convert HSW/BDW to use port_mask for DDI probe

 drivers/gpu/drm/i915/display/g4x_dp.c         |   3 +
 drivers/gpu/drm/i915/display/g4x_hdmi.c       |  20 +++
 drivers/gpu/drm/i915/display/intel_crt.c      |   2 +
 drivers/gpu/drm/i915/display/intel_ddi.c      |  32 ++++
 drivers/gpu/drm/i915/display/intel_display.c  |  99 ++---------
 drivers/gpu/drm/i915/display/intel_display.h  |   2 +
 .../drm/i915/display/intel_display_device.c   | 162 ++++++++++++------
 .../drm/i915/display/intel_display_device.h   |   1 +
 drivers/gpu/drm/i915/display/intel_dvo.c      |   2 +
 drivers/gpu/drm/i915/display/intel_sdvo.c     |  20 ++-
 drivers/gpu/drm/i915/intel_device_info.c      |   4 +
 11 files changed, 210 insertions(+), 137 deletions(-)

-- 
2.39.3

