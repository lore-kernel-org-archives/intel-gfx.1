Return-Path: <SRS0=3Vrl=O4=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7881C433F5
	for <intel-gfx@archiver.kernel.org>; Fri,  8 Oct 2021 21:57:22 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B30D60F5D
	for <intel-gfx@archiver.kernel.org>; Fri,  8 Oct 2021 21:57:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7B30D60F5D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6856E6E880;
	Fri,  8 Oct 2021 21:57:14 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97E786E878;
 Fri,  8 Oct 2021 21:57:12 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10131"; a="206715321"
X-IronPort-AV: E=Sophos;i="5.85,358,1624345200"; d="scan'208";a="206715321"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2021 14:57:12 -0700
X-IronPort-AV: E=Sophos;i="5.85,358,1624345200"; d="scan'208";a="489625431"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2021 14:57:11 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
	Matt Roper <matthew.d.roper@intel.com>
Date: Fri,  8 Oct 2021 14:56:24 -0700
Message-Id: <20211008215635.2026385-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 00/11] i915: Initial multi-tile support
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

Some of our upcoming platforms, including the Xe_HP SDV, support a
"multi-tile" design.  A multi-tile platform is effectively a platform
with multiple GT instances and local memory regions, all behind a single
PCI device.  From an i915 perspective, this translates to multiple
intel_gt structures per drm_i915_private.  This series provides the
initial refactoring to support multiple independent GTs per card, but
further work (especially related to local memory) will be required to
fully enable a multi-tile platform.

Note that the presence of multiple GTs is largely transparent to
userspace.  A multi-tile platform will advertise a larger list of
engines to userspace, but the concept of "tile" is not something
userspace has to worry about directly.  There will be some uapi
implications later due to the devices having multiple local memory
regions, but that aspect of multi-tile is not covered by this patch
series and will show up in future work.


Daniele Ceraolo Spurio (2):
  drm/i915: split general MMIO setup from per-GT uncore init
  drm/i915: Initial support for per-tile uncore

Matt Roper (1):
  drm/i915: Restructure probe to handle multi-tile platforms

Michal Wajdeczko (1):
  drm/i915/guc: Update CT debug macro for multi-tile

Michał Winiarski (1):
  drm/i915: Store backpointer to GT in uncore

Paulo Zanoni (3):
  drm/i915: rework some irq functions to take intel_gt as argument
  drm/i915/xehp: Determine which tile raised an interrupt
  drm/i915/xehp: Make IRQ reset and postinstall multi-tile aware

Tvrtko Ursulin (2):
  drm/i915: Prepare for multiple gts
  drm/i915/xehpsdv: Initialize multi-tiles

Venkata Sandeep Dhanalakota (1):
  drm/i915: Release per-gt resources allocated

 drivers/gpu/drm/i915/gt/intel_gt.c            | 180 +++++++++++++++++-
 drivers/gpu/drm/i915/gt/intel_gt.h            |  11 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm.c         |   9 +-
 drivers/gpu/drm/i915/gt/intel_gt_types.h      |   7 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     |   6 +-
 drivers/gpu/drm/i915/i915_debugfs.c           |   5 +-
 drivers/gpu/drm/i915/i915_drv.c               |  80 ++++++--
 drivers/gpu/drm/i915/i915_drv.h               |   9 +
 drivers/gpu/drm/i915/i915_irq.c               |  71 ++++---
 drivers/gpu/drm/i915/i915_pci.c               |   1 +
 drivers/gpu/drm/i915/i915_reg.h               |   4 +
 drivers/gpu/drm/i915/intel_device_info.h      |   1 +
 drivers/gpu/drm/i915/intel_memory_region.h    |   3 +
 drivers/gpu/drm/i915/intel_uncore.c           |  36 ++--
 drivers/gpu/drm/i915/intel_uncore.h           |   6 +-
 .../gpu/drm/i915/selftests/mock_gem_device.c  |   3 +-
 drivers/gpu/drm/i915/selftests/mock_uncore.c  |   2 +-
 17 files changed, 345 insertions(+), 89 deletions(-)

-- 
2.33.0

