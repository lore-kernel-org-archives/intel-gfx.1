Return-Path: <SRS0=aXtb=EJ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90EF8C00A89
	for <intel-gfx@archiver.kernel.org>; Tue,  3 Nov 2020 00:17:48 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46CD92225E
	for <intel-gfx@archiver.kernel.org>; Tue,  3 Nov 2020 00:17:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46CD92225E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83C876E5AE;
	Tue,  3 Nov 2020 00:17:38 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D12D96E563
 for <intel-gfx@lists.freedesktop.org>; Tue,  3 Nov 2020 00:17:33 +0000 (UTC)
IronPort-SDR: r8MoIGG+/QO8nz6a1Xya0FcUtGHjuFRzV5F4F/eDpwkLpDxMTEcPUxF1grInuhEeNIkFjOZZsN
 sghDFtHJP+og==
X-IronPort-AV: E=McAfee;i="6000,8403,9793"; a="186814890"
X-IronPort-AV: E=Sophos;i="5.77,446,1596524400"; d="scan'208";a="186814890"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2020 16:17:33 -0800
IronPort-SDR: 1vaxyAFvnMuKAJ78UwrmGO7JBs8Ogutgjb3+8ziO7Fk6rb9hyZLAOsuthqZjag6mxjS+yFkrAb
 GuWKI1chbefQ==
X-IronPort-AV: E=Sophos;i="5.77,446,1596524400"; d="scan'208";a="470573449"
Received: from labuser-z97x-ud5h.jf.intel.com ([10.165.21.211])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 02 Nov 2020 16:17:32 -0800
From: Manasi Navare <manasi.d.navare@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Mon,  2 Nov 2020 16:19:19 -0800
Message-Id: <20201103001932.11286-1-manasi.d.navare@intel.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v14 00/13] End to end Big Joiner enabling
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>


Maarten Lankhorst (6):
  drm/i915: Add hw.pipe_mode to allow bigjoiner pipe/transcoder split
  drm/i915/dp: Allow big joiner modes in intel_dp_mode_valid(), v3.
  drm/i915: Try to make bigjoiner work in atomic check
  drm/i915: Link planes in a bigjoiner configuration, v3.
  drm/i915: Add bigjoiner aware plane clipping checks
  drm/i915: Add debugfs dumping for bigjoiner, v3.

Manasi Navare (7):
  drm/i915/dp: Some reshuffling in mode_valid as prep for bigjoiner
    modes
  drm/i915: Move encoder->get_config to a new function
  drm/i915: Pass intel_atomic_state instead of drm_atomic_state
  drm/i915/dp: Prep for bigjoiner atomic check
  drm/i915/dp: Modify VDSC helpers to configure DSC for Bigjoiner slave
  drm/i915/dp: Master/Slave enable/disable sequence for bigjoiner
  drm/i915: HW state readout for Bigjoiner case

 drivers/gpu/drm/i915/display/icl_dsi.c        |   2 -
 drivers/gpu/drm/i915/display/intel_atomic.c   |   9 +-
 drivers/gpu/drm/i915/display/intel_atomic.h   |   3 +-
 .../gpu/drm/i915/display/intel_atomic_plane.c | 113 ++-
 .../gpu/drm/i915/display/intel_atomic_plane.h |   7 +-
 drivers/gpu/drm/i915/display/intel_ddi.c      |  68 +-
 drivers/gpu/drm/i915/display/intel_display.c  | 896 ++++++++++++++----
 drivers/gpu/drm/i915/display/intel_display.h  |  23 +-
 .../drm/i915/display/intel_display_debugfs.c  |  29 +-
 .../drm/i915/display/intel_display_types.h    |  32 +-
 drivers/gpu/drm/i915/display/intel_dp.c       | 108 ++-
 drivers/gpu/drm/i915/display/intel_dp.h       |   1 +
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |   2 +-
 drivers/gpu/drm/i915/display/intel_dsi.c      |   2 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c     |   2 +-
 drivers/gpu/drm/i915/display/intel_sprite.c   |  21 +-
 drivers/gpu/drm/i915/display/intel_vdsc.c     | 201 ++--
 drivers/gpu/drm/i915/display/intel_vdsc.h     |   6 +-
 drivers/gpu/drm/i915/intel_pm.c               |  96 +-
 19 files changed, 1201 insertions(+), 420 deletions(-)

-- 
2.19.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
