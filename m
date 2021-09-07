Return-Path: <SRS0=ObOY=N5=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32491C433F5
	for <intel-gfx@archiver.kernel.org>; Tue,  7 Sep 2021 17:19:36 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F00DB610D0
	for <intel-gfx@archiver.kernel.org>; Tue,  7 Sep 2021 17:19:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F00DB610D0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66A656E090;
	Tue,  7 Sep 2021 17:19:28 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E553E6E087;
 Tue,  7 Sep 2021 17:19:26 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10100"; a="220322730"
X-IronPort-AV: E=Sophos;i="5.85,274,1624345200"; d="scan'208";a="220322730"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2021 10:19:26 -0700
X-IronPort-AV: E=Sophos;i="5.85,274,1624345200"; d="scan'208";a="605352242"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2021 10:19:26 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
	Matt Roper <matthew.d.roper@intel.com>
Date: Tue,  7 Sep 2021 10:19:08 -0700
Message-Id: <20210907171916.2548047-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 0/8] i915: Introduce Xe_HP compute engines
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

The Xe_HP architecture introduces compute engines as a new engine class.
These compute command streamers (CCS) are similar to the render engine,
except that they're intended for GPGPU usage and lack support for the 3D
pipeline.

The definition of I915_ENGINE_CLASS_COMPUTE is new ABI; see below for a
link to a UMD (compute) merge request that utilizes the new ABI.

This series adds some of the basic enablement for the CCS engines, but
does not yet add them to the engine list for the relevant platforms
(XeHP SDV and DG2); that will be handled in future series.

UMD (compute): https://github.com/intel/compute-runtime/pull/451

Daniele Ceraolo Spurio (1):
  drm/i915/xehp: compute engine pipe_control

John Harrison (1):
  drm/i915/xehp: Extend uninterruptible OpenCL workloads to CCS

Matt Roper (6):
  drm/i915/xehp: Define compute class and engine
  drm/i915/xehp: CCS shares the render reset domain
  drm/i915/xehp: Add Compute CS IRQ handlers
  drm/i915/xehp: CCS should use RCS setup functions
  drm/i915/xehp: Define context scheduling attributes in lrc descriptor
  drm/i915/xehp: Enable ccs/dual-ctx in RCU_MODE

 .../drm/i915/gem/selftests/i915_gem_context.c |  8 ++--
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c      | 31 ++++++++++-----
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     | 39 ++++++++++++++++++-
 drivers/gpu/drm/i915/gt/intel_engine_types.h  | 11 +++++-
 drivers/gpu/drm/i915/gt/intel_engine_user.c   |  5 ++-
 .../drm/i915/gt/intel_execlists_submission.c  | 34 +++++++++++++++-
 drivers/gpu/drm/i915/gt/intel_gpu_commands.h  | 15 +++++++
 drivers/gpu/drm/i915/gt/intel_gt_irq.c        | 15 ++++++-
 drivers/gpu/drm/i915/gt/intel_lrc.c           |  4 +-
 drivers/gpu/drm/i915/gt/intel_lrc.h           | 10 +++++
 drivers/gpu/drm/i915/gt/intel_reset.c         |  4 ++
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   | 13 ++++---
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 28 ++++++++++++-
 drivers/gpu/drm/i915/i915_drv.h               |  2 +
 drivers/gpu/drm/i915/i915_perf.c              |  4 +-
 drivers/gpu/drm/i915/i915_reg.h               | 20 +++++++++-
 include/uapi/drm/i915_drm.h                   |  1 +
 17 files changed, 215 insertions(+), 29 deletions(-)

-- 
2.25.4

