Return-Path: <SRS0=r3jS=N6=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D4F8C433EF
	for <intel-gfx@archiver.kernel.org>; Wed,  8 Sep 2021 01:43:03 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A15961139
	for <intel-gfx@archiver.kernel.org>; Wed,  8 Sep 2021 01:43:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3A15961139
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=Intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E87136E0F1;
	Wed,  8 Sep 2021 01:43:01 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBD8C6E0F1;
 Wed,  8 Sep 2021 01:43:00 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10100"; a="242653608"
X-IronPort-AV: E=Sophos;i="5.85,276,1624345200"; d="scan'208";a="242653608"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2021 18:43:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,276,1624345200"; d="scan'208";a="431134812"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by orsmga003.jf.intel.com with ESMTP; 07 Sep 2021 18:42:59 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Cc: DRI-Devel@Lists.FreeDesktop.Org, John Harrison <John.C.Harrison@Intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Date: Tue,  7 Sep 2021 18:42:51 -0700
Message-Id: <20210908014259.50346-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 0/8] [CI] Enable GuC submission by default on DG1
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

From: John Harrison <John.C.Harrison@Intel.com>

Minimum set of patches to enable GuC submission on DG1 and enable it by
default.

A little difficult to test as IGTs do not work with DG1 due to a bunch
of uAPI features being disabled (e.g. relocations, caching memory
options, etc...). Hence extra patches at the end to enable some
features / add debugging info.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


Daniele Ceraolo Spurio (1):
  drm/i915/guc: put all guc objects in lmem when available

Matthew Brost (5):
  drm/i915/guc: Add DG1 GuC / HuC firmware defs
  drm/i915/guc: Enable GuC submission by default on DG1
  Me: Allow relocs on DG1 for CI
  Me: Workaround LMEM blow up
  Me: Dump GuC log to dmesg on SLPC load failure

Venkata Sandeep Dhanalakota (1):
  drm/i915: Do not define vma on stack

Vinay Belgaumkar (1):
  drm/i915: Get PM ref before accessing HW register

 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_lmem.c      | 26 +++++
 drivers/gpu/drm/i915/gem/i915_gem_lmem.h      |  4 +
 drivers/gpu/drm/i915/gt/intel_rps.c           |  8 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.c        |  9 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c     | 13 ++-
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c   |  3 +
 drivers/gpu/drm/i915/gt/uc/intel_huc.c        | 14 ++-
 drivers/gpu/drm/i915/gt/uc/intel_uc.c         |  2 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      | 90 ++++++++++++++---
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h      |  2 +
 drivers/gpu/drm/i915/i915_gpu_error.c         | 99 ++++++++++++++++++-
 drivers/gpu/drm/i915/i915_gpu_error.h         |  3 +
 13 files changed, 251 insertions(+), 24 deletions(-)

-- 
2.25.1

