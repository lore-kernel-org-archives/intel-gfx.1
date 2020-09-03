Return-Path: <SRS0=04ZO=CM=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 837E1C433E9
	for <intel-gfx@archiver.kernel.org>; Thu,  3 Sep 2020 12:24:12 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B3AD20767
	for <intel-gfx@archiver.kernel.org>; Thu,  3 Sep 2020 12:24:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B3AD20767
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3ACE6E1D6;
	Thu,  3 Sep 2020 12:24:11 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9E8F6E1D6
 for <intel-gfx@lists.freedesktop.org>; Thu,  3 Sep 2020 12:24:10 +0000 (UTC)
IronPort-SDR: RO4/pckyMn5P4OfzJj6P7DzkSpFC/qU7hmI8zoi0d6ao0f4tWyhmQzaGtmbihNxVaHT47VIoZK
 PBqMePNITBOg==
X-IronPort-AV: E=McAfee;i="6000,8403,9732"; a="219116020"
X-IronPort-AV: E=Sophos;i="5.76,386,1592895600"; d="scan'208";a="219116020"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2020 05:24:10 -0700
IronPort-SDR: RSOvCfd5qErgpazGe16w/G/2Q1J5wV+NNedPnmOSCWPbyBsxRIXjGI9Dl1ydaXePQjVIlVGU6f
 JWAoH1LJM1Ow==
X-IronPort-AV: E=Sophos;i="5.76,386,1592895600"; d="scan'208";a="478034599"
Received: from unknown (HELO genxfsim-desktop.iind.intel.com) ([10.223.74.178])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2020 05:24:08 -0700
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Thu,  3 Sep 2020 17:42:31 +0530
Message-Id: <20200903121235.22760-1-anshuman.gupta@intel.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 0/4] Gen12 HDCP 1.4 support on DP MST
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
Cc: seanpaul@chromium.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

This is the version after addressing the review comment from 
sean over RFC patch https://patchwork.freedesktop.org/series/81222/

Addressed Below Comments:
Typo fixes.
Cosmetic Fixes.
Used single hook for stream select and stream status validation. 

Anshuman Gupta (4):
  drm/i915/hdcp: DP MST transcoder for link and stream
  drm/i915/hdcp: Move HDCP enc status timeout to header
  drm/i915/hdcp: HDCP stream encryption support
  drm/i915/hdcp: Enable Gen12 HDCP 1.4 DP MST support

 drivers/gpu/drm/i915/display/intel_ddi.c      | 12 +--
 drivers/gpu/drm/i915/display/intel_ddi.h      |  6 +-
 .../drm/i915/display/intel_display_types.h    |  6 ++
 drivers/gpu/drm/i915/display/intel_dp_hdcp.c  | 80 ++++++++++++++++---
 drivers/gpu/drm/i915/display/intel_dp_mst.c   | 12 +--
 drivers/gpu/drm/i915/display/intel_hdcp.c     | 60 +++++++++-----
 drivers/gpu/drm/i915/display/intel_hdcp.h     |  4 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c     | 14 ++--
 drivers/gpu/drm/i915/i915_reg.h               |  1 +
 9 files changed, 138 insertions(+), 57 deletions(-)

-- 
2.26.2

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
