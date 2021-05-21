Return-Path: <SRS0=c41V=KQ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62B50C4707E
	for <intel-gfx@archiver.kernel.org>; Fri, 21 May 2021 19:51:52 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DA90613AF
	for <intel-gfx@archiver.kernel.org>; Fri, 21 May 2021 19:51:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2DA90613AF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ACAE6E84C;
	Fri, 21 May 2021 19:51:50 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE8F66E844
 for <intel-gfx@lists.freedesktop.org>; Fri, 21 May 2021 19:51:48 +0000 (UTC)
IronPort-SDR: VFwvr3cW6j3DiKJytitV7CmwnZYl2EffvRx3yga/qitoQMIlkweqKLUu6erjUcAyoCMTCeK+rF
 amI3kdZtT4JA==
X-IronPort-AV: E=McAfee;i="6200,9189,9991"; a="287102554"
X-IronPort-AV: E=Sophos;i="5.82,319,1613462400"; d="scan'208";a="287102554"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2021 12:51:47 -0700
IronPort-SDR: DOOxqp7h0dekPtT8C7Qt/K/8RX3Y2m5IIgkJCbvWRoCSzKxuxRxHwJzpZI+GJFis3wsMoqwMrH
 Dbv7mmb6lO0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,319,1613462400"; d="scan'208";a="476212995"
Received: from anushasr-mobl6.jf.intel.com ([10.165.21.155])
 by fmsmga002.fm.intel.com with ESMTP; 21 May 2021 12:51:47 -0700
From: Anusha Srivatsa <anusha.srivatsa@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Fri, 21 May 2021 12:51:28 -0700
Message-Id: <20210521195131.27775-1-anusha.srivatsa@intel.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 0/3] More DMC cleanup
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

Last of prep patches before Pipe DMC patches
can land.

v2: Add struct intel_dmc to intel_dmc.h in a separate
patch

v3: Minor code shuffling and indentation fixes.

Anusha Srivatsa (3):
  drm/i915/dmc: s/DRM_ERROR/drm_err
  drm/i915/dmc: Add intel_dmc_has_payload() helper
  drm/i915/dmc: Move struct intel_dmc to intel_dmc.h

 .../drm/i915/display/intel_display_debugfs.c  |  4 +-
 .../drm/i915/display/intel_display_power.c    | 16 ++---
 drivers/gpu/drm/i915/display/intel_dmc.c      | 61 +++++++++++--------
 drivers/gpu/drm/i915/display/intel_dmc.h      | 22 +++++++
 drivers/gpu/drm/i915/i915_drv.h               | 18 +-----
 drivers/gpu/drm/i915/i915_gpu_error.c         |  2 +-
 6 files changed, 69 insertions(+), 54 deletions(-)

-- 
2.25.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
