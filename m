Return-Path: <SRS0=MAHO=MV=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D5D8C4338F
	for <intel-gfx@archiver.kernel.org>; Thu, 29 Jul 2021 17:00:27 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF5E060560
	for <intel-gfx@archiver.kernel.org>; Thu, 29 Jul 2021 17:00:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AF5E060560
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12CEF6EDF5;
	Thu, 29 Jul 2021 17:00:23 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB1816EDF3
 for <intel-gfx@lists.freedesktop.org>; Thu, 29 Jul 2021 17:00:21 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10060"; a="212966784"
X-IronPort-AV: E=Sophos;i="5.84,279,1620716400"; d="scan'208";a="212966784"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2021 10:00:19 -0700
X-IronPort-AV: E=Sophos;i="5.84,279,1620716400"; d="scan'208";a="417712099"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2021 10:00:19 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Thu, 29 Jul 2021 09:59:50 -0700
Message-Id: <20210729170008.2836648-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v4 00/18] Begin enabling Xe_HP SDV and DG2
 platforms
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

This series provides some of the initial enablement patches for two
upcoming discrete GPUs:
 * XeHP SDV:  Xe_HP (version 12.50) graphics IP, no display IP
 * DG2:  Xe_HPG (version 12.55) graphics IP, Xe_LPD (version 13) display IP

Both platforms will need additional enablement patches beyond what's
present in this series before they're truly usable, including various
LMEM and GuC work that's already happening separately.  The new
features/functionality that these platforms bring (such as multi-tile
support, dedicated compute engines, etc.) may be referenced in passing
in some of these patches but will be fully enabled in future series.

v2:
 - General rebase and incorporation of r-b's.
 - Re-order intel_gt_info and intel_device_info structures to eliminate
   some unnecessary padding after the size change of
   intel_engine_mask_t.  (Tvrtko)
 - Use 'intel_step' mechanisms for revid->stepping mapping.  (Jani)
 - Drop the DSC patches for now; they need some rework.  (Jani)

v3:
 - About 20 of the patches have landed upstream now.  Rebase and resend
   the rest.  Some of these are already reviewed, but have dependencies
   on other unreviewed patches (e.g., the new engine definitions, the
   initial SNPS PHY support, etc.).

v4:
 - Several more patches have landed upstream; rebase and re-send the
   rest.  Some of the remaining patches are reviewed but still have
   dependencies on non-reviewed patches, so the order is shuffled this
   time to group patches by dependency rather than by xehp vs xehpsdv vs
   dg2.
 - Minor cleanup to "drm/i915/xehp: handle new steering options"
   suggested by Caz.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: James Ausmus <james.ausmus@intel.com>

Akeem G Abodunrin (1):
  drm/i915/dg2: Add new LRI reg offsets

Ankit Nautiyal (1):
  drm/i915/dg2: Configure PCON in DP pre-enable path

Daniele Ceraolo Spurio (1):
  drm/i915/xehp: handle new steering options

Lucas De Marchi (2):
  drm/i915/xehpsdv: Define MOCS table for XeHP SDV
  drm/i915/xehpsdv: factor out function to read RP_STATE_CAP

Matt Roper (11):
  drm/i915/xehpsdv: Define steering tables
  drm/i915/dg2: Add forcewake table
  drm/i915/dg2: Update LNCF steering ranges
  drm/i915/dg2: Add SQIDI steering
  drm/i915/xehp: Loop over all gslices for INSTDONE processing
  drm/i915/dg2: Report INSTDONE_GEOM values in error state
  drm/i915/xehpsdv: Add maximum sseu limits
  drm/i915/dg2: DG2 uses the same sseu limits as XeHP SDV
  drm/i915/dg2: Define MOCS table for DG2
  drm/i915/xehpsdv: Read correct RP_STATE_CAP register
  drm/i915/dg2: Maintain backward-compatible nested batch behavior

Matthew Auld (1):
  drm/i915/xehp: Changes to ss/eu definitions

Stuart Summers (1):
  drm/i915/xehpsdv: Add compute DSS type

 drivers/gpu/drm/i915/display/intel_ddi.c     |   3 +
 drivers/gpu/drm/i915/gt/debugfs_gt_pm.c      |   8 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c    |  55 ++--
 drivers/gpu/drm/i915/gt/intel_engine_types.h |  15 +-
 drivers/gpu/drm/i915/gt/intel_gt.c           |  68 ++++-
 drivers/gpu/drm/i915/gt/intel_gt_types.h     |   7 +
 drivers/gpu/drm/i915/gt/intel_lrc.c          |  85 +++++-
 drivers/gpu/drm/i915/gt/intel_mocs.c         |  66 +++-
 drivers/gpu/drm/i915/gt/intel_region_lmem.c  |   1 +
 drivers/gpu/drm/i915/gt/intel_rps.c          |  19 +-
 drivers/gpu/drm/i915/gt/intel_rps.h          |   1 +
 drivers/gpu/drm/i915/gt/intel_sseu.c         | 116 +++++--
 drivers/gpu/drm/i915/gt/intel_sseu.h         |  20 +-
 drivers/gpu/drm/i915/gt/intel_sseu_debugfs.c |   2 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c  | 155 +++++++++-
 drivers/gpu/drm/i915/i915_debugfs.c          |   8 +-
 drivers/gpu/drm/i915/i915_drv.h              |   3 +
 drivers/gpu/drm/i915/i915_getparam.c         |   6 +-
 drivers/gpu/drm/i915/i915_gpu_error.c        |  36 ++-
 drivers/gpu/drm/i915/i915_pci.c              |   1 +
 drivers/gpu/drm/i915/i915_reg.h              |  15 +-
 drivers/gpu/drm/i915/intel_device_info.h     |   1 +
 drivers/gpu/drm/i915/intel_uncore.c          | 305 ++++++++++---------
 include/uapi/drm/i915_drm.h                  |   3 -
 24 files changed, 771 insertions(+), 228 deletions(-)

-- 
2.25.4

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
