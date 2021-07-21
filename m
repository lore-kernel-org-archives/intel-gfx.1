Return-Path: <SRS0=klwv=MN=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56ABEC6377A
	for <intel-gfx@archiver.kernel.org>; Wed, 21 Jul 2021 22:30:51 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA69B6023D
	for <intel-gfx@archiver.kernel.org>; Wed, 21 Jul 2021 22:30:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA69B6023D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 860A06EB16;
	Wed, 21 Jul 2021 22:30:50 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 368896EB29
 for <intel-gfx@lists.freedesktop.org>; Wed, 21 Jul 2021 22:30:49 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10052"; a="211527994"
X-IronPort-AV: E=Sophos;i="5.84,258,1620716400"; d="scan'208";a="211527994"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2021 15:30:47 -0700
X-IronPort-AV: E=Sophos;i="5.84,258,1620716400"; d="scan'208";a="658464166"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2021 15:30:47 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Wed, 21 Jul 2021 15:30:25 -0700
Message-Id: <20210721223043.834562-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Subject: [Intel-gfx] [CI 00/18] CI pass for reviewed Xe_HP SDV and DG2
 patches
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

We have enough reviews that we can start applying some of these patches;
let's kick off another CI run for the reviewed patches that don't have
dependencies on other unreviewed patches.

The plan is to apply the first couple patches (which have the
definitions like IS_XEHPSDV and IS_DG2) to a topic branch that gets
merged to both intel-next and gt-next.  Then the rest of the patches
should be able to be applied to whichever branch is appropriate after
that.

John Harrison (1):
  drm/i915/selftests: Allow for larger engine counts

Lucas De Marchi (2):
  drm/i915: Add XE_HP initial definitions
  drm/i915/xehpsdv: add initial XeHP SDV definitions

Matt Roper (10):
  drm/i915/dg2: add DG2 platform info
  drm/i915/dg2: Add fake PCH
  drm/i915/dg2: Add cdclk table and reference clock
  drm/i915/dg2: Skip shared DPLL handling
  drm/i915/dg2: Don't wait for AUX power well enable ACKs
  drm/i915/dg2: Setup display outputs
  drm/i915/dg2: Add dbuf programming
  drm/i915/dg2: Don't program BW_BUDDY registers
  drm/i915/dg2: Don't read DRAM info
  drm/i915/dg2: DG2 has fixed memory bandwidth

Paulo Zanoni (1):
  drm/i915: Fork DG1 interrupt handler

Prathap Kumar Valsan (1):
  drm/i915/xehp: New engine context offsets

Stuart Summers (1):
  drm/i915/xehp: Handle new device context ID format

Tvrtko Ursulin (1):
  drm/i915/xehp: VDBOX/VEBOX fusing registers are enable-based

Venkata Sandeep Dhanalakota (1):
  drm/i915/gen12: Use fuse info to enable SFC

 drivers/gpu/drm/i915/display/intel_bw.c       |  24 ++-
 drivers/gpu/drm/i915/display/intel_cdclk.c    |  22 ++-
 drivers/gpu/drm/i915/display/intel_display.c  |  17 ++-
 .../drm/i915/display/intel_display_power.c    |  20 +++
 .../drm/i915/display/intel_display_power.h    |  10 ++
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c |   5 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  39 ++++-
 .../drm/i915/gt/intel_execlists_submission.c  |  74 +++++++--
 drivers/gpu/drm/i915/gt/intel_lrc.c           |  73 ++++++++-
 drivers/gpu/drm/i915/gt/intel_lrc_reg.h       |   2 +
 drivers/gpu/drm/i915/gt/selftest_execlists.c  |  10 +-
 .../gpu/drm/i915/gt/selftest_workarounds.c    |  32 ++--
 drivers/gpu/drm/i915/i915_drv.h               |  33 +++-
 drivers/gpu/drm/i915/i915_irq.c               | 141 ++++++++++++------
 drivers/gpu/drm/i915/i915_pci.c               |  61 +++++++-
 drivers/gpu/drm/i915/i915_perf.c              |  29 ++--
 drivers/gpu/drm/i915/i915_reg.h               |   9 +-
 drivers/gpu/drm/i915/intel_device_info.c      |   2 +
 drivers/gpu/drm/i915/intel_device_info.h      |   7 +-
 drivers/gpu/drm/i915/intel_dram.c             |   6 +-
 drivers/gpu/drm/i915/intel_pch.c              |   3 +
 drivers/gpu/drm/i915/intel_pch.h              |   2 +
 drivers/gpu/drm/i915/intel_pm.c               | 120 ++++++++++++++-
 drivers/gpu/drm/i915/intel_step.c             |  30 +++-
 24 files changed, 657 insertions(+), 114 deletions(-)

-- 
2.25.4

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
