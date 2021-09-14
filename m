Return-Path: <SRS0=u2GV=OE=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44746C433F5
	for <intel-gfx@archiver.kernel.org>; Tue, 14 Sep 2021 18:25:31 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F0E3610F9
	for <intel-gfx@archiver.kernel.org>; Tue, 14 Sep 2021 18:25:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0F0E3610F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73E516E52E;
	Tue, 14 Sep 2021 18:25:30 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3DC26E52E
 for <intel-gfx@lists.freedesktop.org>; Tue, 14 Sep 2021 18:25:29 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10107"; a="209326977"
X-IronPort-AV: E=Sophos;i="5.85,292,1624345200"; d="scan'208";a="209326977"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2021 11:25:29 -0700
X-IronPort-AV: E=Sophos;i="5.85,292,1624345200"; d="scan'208";a="544230319"
Received: from lveltman-mobl.ger.corp.intel.com (HELO localhost)
 ([10.251.216.6])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2021 11:25:27 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	Dave Airlie <airlied@gmail.com>
Date: Tue, 14 Sep 2021 21:24:58 +0300
Message-Id: <cover.1631643729.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 00/24] i915/display: split and constify vtable
 (v5)
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

This is Dave's series [1] with patch 2 (drm/i915/uncore: constify the
register vtables.) dropped because it conflicts between drm-intel-next
and drm-intel-gt-next. I want to get proper CI results on this before
merging. We can do the leftover patch afterwards. Everything else is
unmodified.

BR,
Jani.

[1] https://patchwork.freedesktop.org/series/94529/

Dave Airlie (24):
  drm/i915/uncore: split the fw get function into separate vfunc
  drm/i915/pm: drop get_fifo_size vfunc.
  drm/i915: make update_wm take a dev_priv.
  drm/i915/wm: provide wrappers around watermark vfuncs calls (v2)
  drm/i915: add wrappers around cdclk vtable funcs.
  drm/i915/display: add intel_fdi_link_train wrapper.
  drm/i915: split clock gating init from display vtable
  drm/i915: split watermark vfuncs from display vtable.
  drm/i915: split color functions from display vtable
  drm/i915: split audio functions from display vtable
  drm/i915: split cdclk functions from display vtable.
  drm/i915: split irq hotplug function from display vtable
  drm/i915: split fdi link training from display vtable.
  drm/i915: split the dpll clock compute out from display vtable.
  drm/i915: constify fdi link training vtable
  drm/i915: constify hotplug function vtable.
  drm/i915: constify color function vtable.
  drm/i915: constify the audio function vtable
  drm/i915: constify the dpll clock vtable
  drm/i915: constify the cdclk vtable
  drm/i915: drop unused function ptr and comments.
  drm/i915: constify display function vtable
  drm/i915: constify clock gating init vtable.
  drm/i915: constify display wm vtable

 drivers/gpu/drm/i915/display/intel_audio.c    |  43 ++-
 drivers/gpu/drm/i915/display/intel_cdclk.c    | 337 +++++++++++++-----
 drivers/gpu/drm/i915/display/intel_cdclk.h    |   4 +-
 drivers/gpu/drm/i915/display/intel_color.c    | 138 ++++---
 drivers/gpu/drm/i915/display/intel_display.c  | 291 +++++++++------
 .../drm/i915/display/intel_display_power.c    |   2 +-
 drivers/gpu/drm/i915/display/intel_dpll.c     |  48 ++-
 drivers/gpu/drm/i915/display/intel_fdi.c      |  26 +-
 drivers/gpu/drm/i915/display/intel_fdi.h      |   2 +
 drivers/gpu/drm/i915/display/intel_hotplug.c  |   4 +-
 drivers/gpu/drm/i915/i915_drv.h               | 124 ++++---
 drivers/gpu/drm/i915/i915_irq.c               |  28 +-
 drivers/gpu/drm/i915/intel_pm.c               | 231 ++++++------
 drivers/gpu/drm/i915/intel_pm.h               |   1 -
 drivers/gpu/drm/i915/intel_uncore.c           |  70 ++--
 drivers/gpu/drm/i915/intel_uncore.h           |   7 +-
 16 files changed, 888 insertions(+), 468 deletions(-)

-- 
2.30.2

