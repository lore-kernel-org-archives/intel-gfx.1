Return-Path: <SRS0=S4gL=NN=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC68AC4338F
	for <intel-gfx@archiver.kernel.org>; Sun, 22 Aug 2021 16:30:22 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E23261267
	for <intel-gfx@archiver.kernel.org>; Sun, 22 Aug 2021 16:30:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7E23261267
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A607D89E06;
	Sun, 22 Aug 2021 16:30:21 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB5A889E06
 for <intel-gfx@lists.freedesktop.org>; Sun, 22 Aug 2021 16:30:19 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10084"; a="302567431"
X-IronPort-AV: E=Sophos;i="5.84,342,1620716400"; d="scan'208";a="302567431"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2021 09:30:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,342,1620716400"; d="scan'208";a="596395718"
Received: from ayazahma-nuc8i7beh.iind.intel.com ([10.145.162.59])
 by fmsmga001.fm.intel.com with ESMTP; 22 Aug 2021 09:30:17 -0700
From: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
Date: Sun, 22 Aug 2021 21:56:53 +0530
Message-Id: <20210822162706.819507-1-ayaz.siddiqui@intel.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [RFC 00/13] drm/i915/lmem: Enable device memory support
 for DG2
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

There are few changes for device memory in Gen12.5+ platforms.

1. Minimum page size has been changed to 64KB.
2. Compression control state (CCS) moved from user-space manages
AUX page tables to flat indexed region of memory. This Flat index
memory is referred as Flat CCS.
3. Due to different page sizes of LMEM(64K) and SMEM(4K), a mix of
LMEM and SMEM pages are not supported in a single page table.

This series is containing patches to cover all the above changes.
 
Todo:
  Handling of Flat CCS during migration buffers from System
 to device memory and vice versa.


Ayaz A Siddiqui (3):
  drm/i915/gem: Remove unused i915_gem_lmem_obj_ops
  drm/i915/lmem: Enable lmem for platforms with Flat CCS
  drm/i915/gt: Clear compress metadata for Gen12.5 >= platforms

Bommu Krishnaiah (1):
  drm/i915: Add vm min alignment support

CQ Tang (1):
  drm/i915/xehpsdv: Add has_flat_ccs to device info

Matthew Auld (7):
  drm/i915/xehpsdv: set min page-size to 64K
  drm/i915/xehpsdv: enforce min GTT alignment
  drm/i915: enforce min page size for scratch
  drm/i915/gtt/xehpsdv: move scratch page to system memory
  drm/i915/xehpsdv: support 64K GTT pages
  drm/i915/selftests: account for min_alignment in GTT selftests
  drm/i915/xehpsdv: implement memory coloring

Stuart Summers (1):
  drm/i915: Add has_64k_pages flag

 drivers/gpu/drm/i915/gem/i915_gem_lmem.h      |   2 -
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c    |   4 +-
 .../gpu/drm/i915/gem/selftests/huge_pages.c   |  61 ++++++++
 .../i915/gem/selftests/i915_gem_client_blt.c  |  23 ++-
 drivers/gpu/drm/i915/gt/gen6_ppgtt.c          |   1 +
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c          | 145 +++++++++++++++++-
 drivers/gpu/drm/i915/gt/intel_ggtt.c          |   3 +
 drivers/gpu/drm/i915/gt/intel_gpu_commands.h  |  14 ++
 drivers/gpu/drm/i915/gt/intel_gt.c            |  19 +++
 drivers/gpu/drm/i915/gt/intel_gt.h            |   1 +
 drivers/gpu/drm/i915/gt/intel_gtt.c           |  23 ++-
 drivers/gpu/drm/i915/gt/intel_gtt.h           |  20 +++
 drivers/gpu/drm/i915/gt/intel_migrate.c       | 121 ++++++++++++++-
 drivers/gpu/drm/i915/gt/intel_migrate.h       |   1 -
 drivers/gpu/drm/i915/gt/intel_ppgtt.c         |   1 +
 drivers/gpu/drm/i915/gt/intel_region_lmem.c   |  27 +++-
 drivers/gpu/drm/i915/i915_drv.h               |   4 +
 drivers/gpu/drm/i915/i915_gem_evict.c         |  17 ++
 drivers/gpu/drm/i915/i915_pci.c               |   3 +
 drivers/gpu/drm/i915/i915_reg.h               |   3 +
 drivers/gpu/drm/i915/i915_vma.c               |  55 +++++--
 drivers/gpu/drm/i915/intel_device_info.h      |   2 +
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c |  96 ++++++++----
 drivers/gpu/drm/i915/selftests/mock_gtt.c     |   2 +
 24 files changed, 575 insertions(+), 73 deletions(-)

-- 
2.26.2

