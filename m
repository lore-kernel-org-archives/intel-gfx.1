Return-Path: <SRS0=UgYw=MJ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65AF0C636C9
	for <intel-gfx@archiver.kernel.org>; Sat, 17 Jul 2021 05:14:44 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FC2C611AB
	for <intel-gfx@archiver.kernel.org>; Sat, 17 Jul 2021 05:14:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0FC2C611AB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 533606EA1E;
	Sat, 17 Jul 2021 05:14:35 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 333906EA14
 for <intel-gfx@lists.freedesktop.org>; Sat, 17 Jul 2021 05:14:31 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10047"; a="191188866"
X-IronPort-AV: E=Sophos;i="5.84,246,1620716400"; d="scan'208";a="191188866"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2021 22:14:31 -0700
X-IronPort-AV: E=Sophos;i="5.84,246,1620716400"; d="scan'208";a="563335055"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2021 22:14:30 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Fri, 16 Jul 2021 22:14:19 -0700
Message-Id: <20210717051426.4120328-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 0/7] More workaround updates
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

The first six patches are just general maintenance of workarounds for
various platforms.  The final patch switches the way we match ranges of
steppings in the driver from an inclusive upper bound to an exclusive
upper bound; this matches how workarounds are defined in our specs and
should help reduce simple mistakes going forward.

Matt Roper (7):
  drm/i915: Fix application of WaInPlaceDecompressionHang
  drm/i915/icl: Drop a couple unnecessary workarounds
  drm/i915: Program DFR enable/disable as a GT workaround
  drm/i915/adl_s: Wa_14011765242 is also needed on A1 display stepping
  drm/i915/rkl: Wa_1409767108 also applies to RKL
  drm/i915/rkl: Wa_1408330847 no longer applies to RKL
  drm/i915: Make workaround upper bounds exclusive

 drivers/gpu/drm/i915/display/intel_cdclk.c    |  2 +-
 .../drm/i915/display/intel_display_power.c    |  5 +-
 drivers/gpu/drm/i915/display/intel_psr.c      | 24 +++----
 .../drm/i915/display/skl_universal_plane.c    |  8 +--
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c      |  2 +-
 drivers/gpu/drm/i915/gt/intel_region_lmem.c   |  2 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c   | 69 +++++++------------
 drivers/gpu/drm/i915/i915_drv.h               |  4 +-
 drivers/gpu/drm/i915/intel_device_info.c      |  4 +-
 drivers/gpu/drm/i915/intel_pm.c               | 16 ++---
 drivers/gpu/drm/i915/intel_step.h             |  1 +
 11 files changed, 55 insertions(+), 82 deletions(-)

-- 
2.25.4

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
