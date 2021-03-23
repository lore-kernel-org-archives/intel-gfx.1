Return-Path: <SRS0=maCC=IV=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BFB6C433DB
	for <intel-gfx@archiver.kernel.org>; Tue, 23 Mar 2021 11:33:40 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D29D961993
	for <intel-gfx@archiver.kernel.org>; Tue, 23 Mar 2021 11:33:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D29D961993
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31AE26E8BE;
	Tue, 23 Mar 2021 11:33:37 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2F126E0F3;
 Tue, 23 Mar 2021 11:33:35 +0000 (UTC)
IronPort-SDR: XW4eU1nifL2FSINjSQW9PFL22Qbnd0p5KZ8CjzbHsCZ9HI16cBVzgL4gzRHADVlbFtHqr0qeMz
 s6FCuRKzhIfA==
X-IronPort-AV: E=McAfee;i="6000,8403,9931"; a="188140861"
X-IronPort-AV: E=Sophos;i="5.81,271,1610438400"; d="scan'208";a="188140861"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2021 04:33:34 -0700
IronPort-SDR: 3Os2/48mO0MGT7JT8yBsP7yJpizAUXa5734a44KYowrfNdLQluw6TYRjdetKatWhL59HRjzTlv
 7zrpuWbQWhiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,271,1610438400"; d="scan'208";a="408277065"
Received: from linux-akn.iind.intel.com ([10.223.34.148])
 by fmsmga008.fm.intel.com with ESMTP; 23 Mar 2021 04:33:32 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue, 23 Mar 2021 16:54:20 +0530
Message-Id: <20210323112422.1211-1-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v5 0/2] HDMI2.1 PCON Misc Fixes
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

Patch1: Tweaks the drm_helpers for PCON configuration.
Patch2: Removes unwanted code not applicable for older platforms.
[Merged]
Patch3: Fixes condition for starting FRL link training.

rev3:  Patch-1 from rev2 [Read PCON DSC ENC caps only for DPCD
rev >= 1.4] is dropped as it mixes DPCD and DP revisions.

rev4: Rebased

Ankit Nautiyal (2):
  drm/dp_helper: Define options for FRL training for HDMI2.1 PCON
  drm/i915/display: Configure HDMI2.1 Pcon for FRL only if Src-Ctl mode
    is available

 drivers/gpu/drm/drm_dp_helper.c         | 24 ++++++++++++++----------
 drivers/gpu/drm/i915/display/intel_dp.c | 19 +++++++++++--------
 include/drm/drm_dp_helper.h             |  6 ++++--
 3 files changed, 29 insertions(+), 20 deletions(-)


base-commit: 8e469260b87ff08620181d86570f7ec4e41c0ef7
-- 
2.29.2

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
