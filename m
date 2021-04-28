Return-Path: <SRS0=ja9S=JZ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 369CBC433B4
	for <intel-gfx@archiver.kernel.org>; Wed, 28 Apr 2021 21:13:18 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C73F66143A
	for <intel-gfx@archiver.kernel.org>; Wed, 28 Apr 2021 21:13:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C73F66143A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E97BE6EC48;
	Wed, 28 Apr 2021 21:13:16 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE0386E19A
 for <intel-gfx@lists.freedesktop.org>; Wed, 28 Apr 2021 21:13:01 +0000 (UTC)
IronPort-SDR: o6uZqYCg7SBe8aMq1X3eTi25Mq/2Xby36o4Ap0OIn5Rcl7fYpdkXiAfsFpNMjNHxx5J0nnyDA4
 sWYyPYJhJMzA==
X-IronPort-AV: E=McAfee;i="6200,9189,9968"; a="193665200"
X-IronPort-AV: E=Sophos;i="5.82,258,1613462400"; d="scan'208";a="193665200"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2021 14:13:00 -0700
IronPort-SDR: FX31l9OOECK7h3+S3fI2J+U2wUxbeqihkmhjNiPYIjxhHIvSOsEedGCxZHZJ5JUQNTO+YkfmD8
 GHKS8SZ6iXTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,258,1613462400"; d="scan'208";a="423716006"
Received: from anushasr-mobl6.jf.intel.com ([10.165.21.155])
 by fmsmga008.fm.intel.com with ESMTP; 28 Apr 2021 14:13:00 -0700
From: Anusha Srivatsa <anusha.srivatsa@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Wed, 28 Apr 2021 14:12:46 -0700
Message-Id: <20210428211249.11037-1-anusha.srivatsa@intel.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 0/3] Pipe DMC Prep patches
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

This series adds the prep work needed before the
actual Pipe DMC implementation.

Anusha Srivatsa (3):
  drm/i915/csr: s/DRM_ERROR/drm_err
  drm/i915/csr: Add intel_csr_has_dmc_payload() helper
  drm/i915/csr: Introduce DMC_FW_MAIN

 drivers/gpu/drm/i915/display/intel_csr.c      | 94 +++++++++----------
 drivers/gpu/drm/i915/display/intel_csr.h      | 33 +++++++
 .../drm/i915/display/intel_display_debugfs.c  |  4 +-
 .../drm/i915/display/intel_display_power.c    | 16 ++--
 drivers/gpu/drm/i915/i915_drv.h               | 18 +---
 drivers/gpu/drm/i915/i915_gpu_error.c         |  2 +-
 6 files changed, 92 insertions(+), 75 deletions(-)

-- 
2.25.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
