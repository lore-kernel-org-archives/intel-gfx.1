Return-Path: <SRS0=UDYx=M7=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF808C4338F
	for <intel-gfx@archiver.kernel.org>; Sun,  8 Aug 2021 17:50:15 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75BFA60EE9
	for <intel-gfx@archiver.kernel.org>; Sun,  8 Aug 2021 17:50:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 75BFA60EE9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32C0689A6D;
	Sun,  8 Aug 2021 17:50:10 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAFF189A5D;
 Sun,  8 Aug 2021 17:50:08 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10070"; a="275624398"
X-IronPort-AV: E=Sophos;i="5.84,305,1620716400"; d="scan'208";a="275624398"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2021 10:50:07 -0700
X-IronPort-AV: E=Sophos;i="5.84,305,1620716400"; d="scan'208";a="482935736"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2021 10:50:07 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Date: Sun,  8 Aug 2021 11:07:54 -0700
Message-Id: <20210808180757.81440-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 0/3] Clean up some CI failures for GuC submission
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

Address CI failure related to reset [1]. In addition to the public CI
failure we also fix several issues uncovered recenting in our internal
CI related to resets. Patch #1 address all of these issues.

Workaround an existing memory corruption, in gt_lrc selftest, exposed by
enabling GuC submission [2].

Lastly, add a selftest to give us confidence in some of the reset code
that is rather hard / intermittent to exercise via IGTs.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>

[1] https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10456/fi-rkl-guc/igt@i915_selftest@live@workarounds.html
[2] https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_20772/fi-rkl-guc/igt@i915_selftest@live@gt_lrc.html

Matthew Brost (3):
  drm/i915/guc: Fix several issues related to resets / request
    cancelation
  drm/i915/selftests: Fix memory corruption in live_lrc_isolation
  drm/i915/selftests: Add initial GuC selftest for scrubbing lost G2H

 drivers/gpu/drm/i915/gt/intel_context_types.h |   4 +
 drivers/gpu/drm/i915/gt/selftest_lrc.c        |  29 +++-
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  61 ++++++---
 drivers/gpu/drm/i915/gt/uc/selftest_guc.c     | 126 ++++++++++++++++++
 .../drm/i915/selftests/i915_live_selftests.h  |   1 +
 .../i915/selftests/intel_scheduler_helpers.c  |  12 ++
 .../i915/selftests/intel_scheduler_helpers.h  |   2 +
 7 files changed, 218 insertions(+), 17 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gt/uc/selftest_guc.c

-- 
2.28.0

