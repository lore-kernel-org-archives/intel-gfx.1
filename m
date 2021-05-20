Return-Path: <SRS0=a6yN=KP=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94D20C433B4
	for <intel-gfx@archiver.kernel.org>; Thu, 20 May 2021 15:13:14 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 473BF600D1
	for <intel-gfx@archiver.kernel.org>; Thu, 20 May 2021 15:13:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 473BF600D1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A8C16F485;
	Thu, 20 May 2021 15:13:12 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C5936F482;
 Thu, 20 May 2021 15:13:09 +0000 (UTC)
IronPort-SDR: DGVIhR36aaJ9jh4TtxhklAhASV/WO7DzeBIHskCJMjEsbKm10vWrlsfk5wrklPqwMRaAHcu8zM
 nBzTWFgc5gTA==
X-IronPort-AV: E=McAfee;i="6200,9189,9989"; a="265162762"
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; d="scan'208";a="265162762"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2021 08:13:07 -0700
IronPort-SDR: ksAxqMANnTBxQKfFtuttN8gZNaq3Gqxeix7y0JQBn8eCzhrlm6cEzqcVjXfXikmJJGHDBl5GxV
 ttyLy2bnVS7Q==
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; d="scan'208";a="543619193"
Received: from fgrogers-mobl.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.241.97])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2021 08:13:05 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Date: Thu, 20 May 2021 16:12:47 +0100
Message-Id: <20210520151254.959958-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Intel-gfx] [RFC 0/7] Per client engine busyness
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Continuing on the identically named thread. First six patches are i915 specific
so please mostly look at the last one only which discusses the common options
for DRM drivers.

I haven't updated intel_gpu_top to use this yet so can't report any performance
numbers.

Tvrtko Ursulin (7):
  drm/i915: Explicitly track DRM clients
  drm/i915: Update client name on context create
  drm/i915: Make GEM contexts track DRM clients
  drm/i915: Track runtime spent in closed and unreachable GEM contexts
  drm/i915: Track all user contexts per client
  drm/i915: Track context current active time
  drm/i915: Expose client engine utilisation via fdinfo

 drivers/gpu/drm/i915/Makefile                 |   5 +-
 drivers/gpu/drm/i915/gem/i915_gem_context.c   |  61 ++++-
 .../gpu/drm/i915/gem/i915_gem_context_types.h |  16 +-
 drivers/gpu/drm/i915/gt/intel_context.c       |  27 +-
 drivers/gpu/drm/i915/gt/intel_context.h       |  15 +-
 drivers/gpu/drm/i915/gt/intel_context_types.h |  24 +-
 .../drm/i915/gt/intel_execlists_submission.c  |  23 +-
 .../gpu/drm/i915/gt/intel_gt_clock_utils.c    |   4 +
 drivers/gpu/drm/i915/gt/intel_lrc.c           |  27 +-
 drivers/gpu/drm/i915/gt/intel_lrc.h           |  24 ++
 drivers/gpu/drm/i915/gt/selftest_lrc.c        |  10 +-
 drivers/gpu/drm/i915/i915_drm_client.c        | 238 ++++++++++++++++++
 drivers/gpu/drm/i915/i915_drm_client.h        | 107 ++++++++
 drivers/gpu/drm/i915/i915_drv.c               |   9 +
 drivers/gpu/drm/i915/i915_drv.h               |   5 +
 drivers/gpu/drm/i915/i915_gem.c               |  21 +-
 drivers/gpu/drm/i915/i915_gpu_error.c         |  31 +--
 drivers/gpu/drm/i915/i915_gpu_error.h         |   2 +-
 18 files changed, 568 insertions(+), 81 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/i915_drm_client.c
 create mode 100644 drivers/gpu/drm/i915/i915_drm_client.h

-- 
2.30.2

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
