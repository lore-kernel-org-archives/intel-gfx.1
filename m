Return-Path: <SRS0=kgP7=MU=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13971C432BE
	for <intel-gfx@archiver.kernel.org>; Wed, 28 Jul 2021 22:00:27 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC0EB60F5E
	for <intel-gfx@archiver.kernel.org>; Wed, 28 Jul 2021 22:00:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DC0EB60F5E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42DE36EB0C;
	Wed, 28 Jul 2021 22:00:14 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 007A46E8CB
 for <intel-gfx@lists.freedesktop.org>; Wed, 28 Jul 2021 22:00:06 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10059"; a="212786384"
X-IronPort-AV: E=Sophos;i="5.84,276,1620716400"; d="scan'208";a="212786384"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2021 15:00:04 -0700
X-IronPort-AV: E=Sophos;i="5.84,276,1620716400"; d="scan'208";a="663663201"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2021 15:00:03 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Wed, 28 Jul 2021 14:59:21 -0700
Message-Id: <20210728215946.1573015-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 00/25] Remove CNL - for drm-intel-next
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

Same as latest version (https://patchwork.freedesktop.org/series/93056/)
but reordered/re-squashed and without the patches that should go through
drm-intel-gt-next.

I maintained the R-b since there are no meaninful changes.

Lucas De Marchi (25):
  drm/i915/display: remove PORT_F workaround for CNL
  drm/i915/display: remove explicit CNL handling from intel_cdclk.c
  drm/i915/display: remove explicit CNL handling from intel_color.c
  drm/i915/display: remove explicit CNL handling from intel_combo_phy.c
  drm/i915/display: remove explicit CNL handling from intel_crtc.c
  drm/i915/display: remove explicit CNL handling from intel_ddi.c
  drm/i915/display: remove explicit CNL handling from
    intel_display_debugfs.c
  drm/i915/display: remove explicit CNL handling from intel_dmc.c
  drm/i915/display: remove explicit CNL handling from intel_dp.c
  drm/i915/display: remove explicit CNL handling from intel_dpll_mgr.c
  drm/i915/display: remove explicit CNL handling from intel_vdsc.c
  drm/i915/display: remove explicit CNL handling from
    skl_universal_plane.c
  drm/i915/display: remove explicit CNL handling from
    intel_display_power.c
  drm/i915/display: remove CNL ddi buf translation tables
  drm/i915/display: rename CNL references in skl_scaler.c
  drm/i915: remove explicit CNL handling from i915_irq.c
  drm/i915: remove explicit CNL handling from intel_pm.c
  drm/i915: remove explicit CNL handling from intel_pch.c
  drm/i915: remove explicit CNL handling from intel_wopcm.c
  drm/i915: rename CNL references in intel_dram.c
  drm/i915: replace random CNL comments
  drm/i915: switch num_scalers/num_sprites to consider DISPLAY_VER
  drm/i915: remove GRAPHICS_VER == 10
  drm/i915: rename/remove CNL registers
  drm/i915: finish removal of CNL

 drivers/gpu/drm/i915/display/intel_bios.c     |   8 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c    |  72 +-
 drivers/gpu/drm/i915/display/intel_color.c    |   5 +-
 .../gpu/drm/i915/display/intel_combo_phy.c    | 106 +--
 drivers/gpu/drm/i915/display/intel_crtc.c     |   2 +-
 drivers/gpu/drm/i915/display/intel_ddi.c      | 266 +-------
 .../drm/i915/display/intel_ddi_buf_trans.c    | 616 +++++-------------
 .../drm/i915/display/intel_ddi_buf_trans.h    |   4 +-
 drivers/gpu/drm/i915/display/intel_display.c  |   9 +-
 .../drm/i915/display/intel_display_debugfs.c  |   2 +-
 .../drm/i915/display/intel_display_power.c    | 289 --------
 .../drm/i915/display/intel_display_power.h    |   2 -
 drivers/gpu/drm/i915/display/intel_dmc.c      |   9 -
 drivers/gpu/drm/i915/display/intel_dp.c       |  35 +-
 drivers/gpu/drm/i915/display/intel_dp_aux.c   |   1 -
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c | 586 +++--------------
 drivers/gpu/drm/i915/display/intel_dpll_mgr.h |   1 -
 drivers/gpu/drm/i915/display/intel_vbt_defs.h |   2 +-
 drivers/gpu/drm/i915/display/intel_vdsc.c     |   5 +-
 drivers/gpu/drm/i915/display/skl_scaler.c     |  10 +-
 .../drm/i915/display/skl_universal_plane.c    |  14 +-
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c    |   1 -
 drivers/gpu/drm/i915/gvt/gtt.c                |   2 +-
 drivers/gpu/drm/i915/i915_debugfs.c           |   6 +-
 drivers/gpu/drm/i915/i915_drv.h               |  10 +-
 drivers/gpu/drm/i915/i915_irq.c               |   7 +-
 drivers/gpu/drm/i915/i915_pci.c               |  23 +-
 drivers/gpu/drm/i915/i915_perf.c              |  22 +-
 drivers/gpu/drm/i915/i915_reg.h               | 245 ++-----
 drivers/gpu/drm/i915/intel_device_info.c      |  14 +-
 drivers/gpu/drm/i915/intel_device_info.h      |   4 +-
 drivers/gpu/drm/i915/intel_dram.c             |  32 +-
 drivers/gpu/drm/i915/intel_pch.c              |   5 +-
 drivers/gpu/drm/i915/intel_pm.c               |  41 +-
 drivers/gpu/drm/i915/intel_wopcm.c            |  10 +-
 35 files changed, 485 insertions(+), 1981 deletions(-)

-- 
2.31.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
