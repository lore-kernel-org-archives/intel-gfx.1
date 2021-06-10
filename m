Return-Path: <SRS0=5Iya=LE=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4C22C48BE5
	for <intel-gfx@archiver.kernel.org>; Thu, 10 Jun 2021 20:46:37 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 670EC61374
	for <intel-gfx@archiver.kernel.org>; Thu, 10 Jun 2021 20:46:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 670EC61374
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=Intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CFE26EDE2;
	Thu, 10 Jun 2021 20:46:30 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D7E56EDDC;
 Thu, 10 Jun 2021 20:46:28 +0000 (UTC)
IronPort-SDR: ri13N4uEeLjfAprGP/vY0skW/hvovKmmJYx6jqGKR1ZAtLpW/4kjdzn7HNxQm3Da2oPp0BOBiX
 tjtJR7P9Yp5Q==
X-IronPort-AV: E=McAfee;i="6200,9189,10011"; a="205359426"
X-IronPort-AV: E=Sophos;i="5.83,264,1616482800"; d="scan'208";a="205359426"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2021 13:46:27 -0700
IronPort-SDR: fDQCfbLhCBN8GCGJLVqBIA5q08omZif4EFB0GJvOwI9wlMOEKiMRrJaFZI+M7edUGln5F8QomQ
 wqSYVYtoS+lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,264,1616482800"; d="scan'208";a="448867749"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by orsmga008.jf.intel.com with ESMTP; 10 Jun 2021 13:46:26 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Date: Thu, 10 Jun 2021 13:46:23 -0700
Message-Id: <20210610204626.2995262-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
Subject: [Intel-gfx] [PATCH 0/3] Add support for querying hw info that UMDs
 need
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

Various UMDs require hardware configuration information about the
current platform. A bunch of static information is available in a
fixed table that can be retrieved from the GuC. Further information
can be calculated dynamically from fuse registers.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (2):
  drm/i915/guc: Add fetch of hwconfig table
  drm/i915/uapi: Add query for L3 bank count

Rodrigo Vivi (1):
  drm/i915/uapi: Add query for hwconfig table

 drivers/gpu/drm/i915/Makefile                 |   1 +
 drivers/gpu/drm/i915/gt/intel_gt.c            |  15 ++
 drivers/gpu/drm/i915/gt/intel_gt.h            |   1 +
 .../gpu/drm/i915/gt/intel_hwconfig_types.h    | 102 +++++++++++
 .../gpu/drm/i915/gt/uc/abi/guc_actions_abi.h  |   1 +
 .../gpu/drm/i915/gt/uc/abi/guc_errors_abi.h   |   4 +
 drivers/gpu/drm/i915/gt/uc/intel_guc.c        |   3 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.h        |   2 +
 .../gpu/drm/i915/gt/uc/intel_guc_hwconfig.c   | 167 ++++++++++++++++++
 .../gpu/drm/i915/gt/uc/intel_guc_hwconfig.h   |  19 ++
 drivers/gpu/drm/i915/gt/uc/intel_uc.c         |   6 +
 drivers/gpu/drm/i915/i915_query.c             |  45 +++++
 drivers/gpu/drm/i915/i915_reg.h               |   1 +
 include/uapi/drm/i915_drm.h                   |   2 +
 14 files changed, 368 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/i915/gt/intel_hwconfig_types.h
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.h

-- 
2.25.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
