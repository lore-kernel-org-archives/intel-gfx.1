Return-Path: <SRS0=tFHw=MF=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57639C11F6E
	for <intel-gfx@archiver.kernel.org>; Tue, 13 Jul 2021 19:36:56 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 204C760725
	for <intel-gfx@archiver.kernel.org>; Tue, 13 Jul 2021 19:36:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 204C760725
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89E106E12C;
	Tue, 13 Jul 2021 19:36:47 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D29A16E11C
 for <intel-gfx@lists.freedesktop.org>; Tue, 13 Jul 2021 19:36:44 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10044"; a="190609863"
X-IronPort-AV: E=Sophos;i="5.84,237,1620716400"; d="scan'208";a="190609863"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2021 12:36:43 -0700
X-IronPort-AV: E=Sophos;i="5.84,237,1620716400"; d="scan'208";a="487456135"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2021 12:36:43 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue, 13 Jul 2021 12:36:23 -0700
Message-Id: <20210713193635.3390052-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Subject: [Intel-gfx] [CI v4 00/12] Minor revid/stepping and workaround
 cleanup
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

PCI revision IDs don't always map to GT and display IP steppings in an
intuitive/sensible way.  On many of our recent platforms we've switched
to using revid->stepping lookup tables with the infrastructure in
intel_step.c to handle stepping lookups and comparisons.  This series
converts several of our older platforms over to the same table-based
scheme; this is good not only for consistency, but also because some
upcoming DMC work will rely on table-based lookups.  Going forward the
only place that revision ID's should really get used directly is when
checking to see if we're running on pre-production hardware.

Note:  I haven't added the stepping tables for CFL and its derivatives
(WHL, AML) yet since there are so many different variants and the
steppings work a bit strangely on some of them.  We don't have any
stepping-specific workarounds on these platforms, so the tables aren't
necessary until Anusha's DMC work arrives; I'll let her determine the
best way to handle the tables for those.  Ditto for CML.

Let's also take the opportunity to drop a bit of effectively dead code
in the workarounds file too.

v2:
 - Include an already-reviewed patch from Anusha's DMC series as the
   first patch here that changes the naming of the revision ID tables,
   and then adjust the naming of the new tables I add here to follow the
   same convention.
 - Drop the pre-production revisions for all gen11 and earlier
   platforms; we're past the point where we usually drop the
   pre-production support.  intel_detect_preproduction_hw() is updated
   with the proper revids for ICL to ensure we print an error and taint
   the kernel if the kernel is loaded on a pre-production platform.
 - ICL workarounds that only apply to pre-production steppings are
   dropped.
 - For platforms where GT stepping is always the same as display
   stepping, we use a macro to assign them both at once to make it more
   obvious how the platform works.
 - Stepping tables for BXT and GLK are added.  They're completely unused
   in our current code (we have no stepping-specific workarounds), but
   some DMC patches from Anusha will arrive shortly that require these.
   Note that the BXT revision macros we had previously were completely
   wrong; it's a good thing they weren't actually being used for
   anything.

v3:
 - Use COMMON_STEP() macro on a few more platforms.  (Anusha)

v4:
 - s/COMMON_STEPPING/COMMON_STEP/ across whole series.  (Lucas)

Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Anusha Srivatsa <anusha.srivatsa@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>

Anusha Srivatsa (1):
  drm/i915/step: s/<platform>_revid_tbl/<platform>_revids

Matt Roper (11):
  drm/i915: Make pre-production detection use direct revid comparison
  drm/i915/skl: Use revid->stepping tables
  drm/i915/kbl: Drop pre-production revision from stepping table
  drm/i915/bxt: Use revid->stepping tables
  drm/i915/glk: Use revid->stepping tables
  drm/i915/icl: Use revid->stepping tables
  drm/i915/jsl_ehl: Use revid->stepping tables
  drm/i915/rkl: Use revid->stepping tables
  drm/i915/dg1: Use revid->stepping tables
  drm/i915/cnl: Drop all workarounds
  drm/i915/icl: Drop workarounds that only apply to pre-production
    steppings

 .../drm/i915/display/intel_display_power.c    |   2 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c |   2 +-
 drivers/gpu/drm/i915/display/intel_psr.c      |   4 +-
 drivers/gpu/drm/i915/gt/intel_region_lmem.c   |   2 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c   | 108 ++----------------
 drivers/gpu/drm/i915/i915_drv.c               |   9 +-
 drivers/gpu/drm/i915/i915_drv.h               |  79 ++-----------
 drivers/gpu/drm/i915/intel_pm.c               |   2 +-
 drivers/gpu/drm/i915/intel_step.c             | 104 ++++++++++++++---
 drivers/gpu/drm/i915/intel_step.h             |   4 +
 10 files changed, 119 insertions(+), 197 deletions(-)

-- 
2.25.4

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
