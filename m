Return-Path: <SRS0=Dys0=IH=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8118C433E0
	for <intel-gfx@archiver.kernel.org>; Tue,  9 Mar 2021 04:48:46 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90FFA65290
	for <intel-gfx@archiver.kernel.org>; Tue,  9 Mar 2021 04:48:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90FFA65290
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E031C6E461;
	Tue,  9 Mar 2021 04:48:42 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 715BE6E45E;
 Tue,  9 Mar 2021 04:48:41 +0000 (UTC)
IronPort-SDR: e7CYCYA6hF/xTRvQO0inqLrSBvoXy9sqJQdCTVCg/JYHFUhE1LRHXkbRd34zZCB51XDYT60DBM
 Y6wxvmBotZfA==
X-IronPort-AV: E=McAfee;i="6000,8403,9917"; a="184796074"
X-IronPort-AV: E=Sophos;i="5.81,234,1610438400"; d="scan'208";a="184796074"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2021 20:48:40 -0800
IronPort-SDR: x7UuB+tdOb9YTwyL8zeYp1VZLrLVoHhgHzq2pRvq0DNzba7tRrmlsOop2Daz+ctY+hRtWOYeEY
 KoTWJ0r0Z24w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,234,1610438400"; d="scan'208";a="376369234"
Received: from linux-akn.iind.intel.com ([10.223.34.148])
 by fmsmga007.fm.intel.com with ESMTP; 08 Mar 2021 20:48:39 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue,  9 Mar 2021 10:09:12 +0530
Message-Id: <20210309043915.1921-1-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v3 0/3] HDMI2.1 PCON Misc Fixes
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Patch1: Tweaks the drm_helpers for PCON configuration.
Patch2: Removes unwanted code not applicable for older platforms.
Patch3: Fixes condition for starting FRL link training.

rev3:  Patch-1 from rev2 [Read PCON DSC ENC caps only for DPCD
rev >= 1.4] is dropped as it mixes DPCD and DP revisions.

Ankit Nautiyal (3):
  drm/dp_helper: Define options for FRL training for HDMI2.1 PCON
  drm/i915/display: Remove FRL related code from disable DP sequence for
    older platforms
  drm/i915/display: Configure HDMI2.1 Pcon for FRL only if Src-Ctl mode
    is available

 drivers/gpu/drm/drm_dp_helper.c         | 24 ++++++++++++++----------
 drivers/gpu/drm/i915/display/intel_dp.c | 15 ++++++---------
 include/drm/drm_dp_helper.h             |  6 ++++--
 3 files changed, 24 insertions(+), 21 deletions(-)

-- 
2.29.2

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
