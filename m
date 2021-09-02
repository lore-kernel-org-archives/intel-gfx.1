Return-Path: <SRS0=rOxW=NY=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D0B5C4320E
	for <intel-gfx@archiver.kernel.org>; Thu,  2 Sep 2021 10:05:47 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61F2961090
	for <intel-gfx@archiver.kernel.org>; Thu,  2 Sep 2021 10:05:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 61F2961090
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A118D6E4C9;
	Thu,  2 Sep 2021 10:05:46 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A0CF6E4C1
 for <intel-gfx@lists.freedesktop.org>; Thu,  2 Sep 2021 10:05:44 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10094"; a="198611187"
X-IronPort-AV: E=Sophos;i="5.84,372,1620716400"; d="scan'208";a="198611187"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2021 03:05:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,372,1620716400"; d="scan'208";a="510920575"
Received: from shawnle1-build-machine.itwn.intel.com ([10.5.253.12])
 by orsmga001.jf.intel.com with ESMTP; 02 Sep 2021 03:05:38 -0700
From: Lee Shawn C <shawn.c.lee@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 vandita.kulkarni@intel.com, cooper.chiou@intel.com,
 william.tseng@intel.com, Lee Shawn C <shawn.c.lee@intel.com>
Date: Thu,  2 Sep 2021 18:08:46 +0800
Message-Id: <20210902100851.21719-1-shawn.c.lee@intel.com>
X-Mailer: git-send-email 2.17.1
Subject: [Intel-gfx] [v2 0/5] DSI driver improvement
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

v2: Get data length of brightness value more easily while driver try to
    read/write MIPI_DCS_DISPLAY_BRIGHTNESS command.

Signed-off-by: Lee Shawn C <shawn.c.lee@intel.com>

Lee Shawn C (5):
  drm/i915/dsi: wait for header and payload credit available
  drm/i915/dsi: refine send MIPI DCS command sequence
  drm/i915: Get proper min cdclk if vDSC enabled
  drm/i915/dsi: Retrieve max brightness level from VBT
  drm/i915/dsi: Read/write proper brightness value via MIPI DCS command

 drivers/gpu/drm/i915/display/icl_dsi.c        | 50 +++++++++----------
 drivers/gpu/drm/i915/display/intel_bios.c     |  3 ++
 drivers/gpu/drm/i915/display/intel_cdclk.c    | 10 ++++
 .../i915/display/intel_dsi_dcs_backlight.c    | 31 ++++++++----
 drivers/gpu/drm/i915/i915_drv.h               |  1 +
 5 files changed, 60 insertions(+), 35 deletions(-)

-- 
2.17.1

