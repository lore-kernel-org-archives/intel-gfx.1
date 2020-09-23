Return-Path: <SRS0=ky/+=DA=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 896A1C2D0A8
	for <intel-gfx@archiver.kernel.org>; Wed, 23 Sep 2020 11:16:37 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B9CC205F4
	for <intel-gfx@archiver.kernel.org>; Wed, 23 Sep 2020 11:16:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B9CC205F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D770F6E94B;
	Wed, 23 Sep 2020 11:16:36 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 567B96E966
 for <intel-gfx@lists.freedesktop.org>; Wed, 23 Sep 2020 11:16:36 +0000 (UTC)
IronPort-SDR: 9EM/yrMFmaX1NQ5FYelMPoMfmgsf5qY/pzc7l82WGWy4X3V/w9BX+tJzXxt47RprDmSE6Ln2oV
 r17Xakvb463Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9752"; a="178932832"
X-IronPort-AV: E=Sophos;i="5.77,293,1596524400"; d="scan'208";a="178932832"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2020 04:16:35 -0700
IronPort-SDR: RmsamhgXiOh+cD1rxZTB4Jfou7nc3Ih+kLdVSWtTrWLAmXg1DLYRV0qPxmVlZBVNzt1vzZcRNO
 Li4DMU24jZNA==
X-IronPort-AV: E=Sophos;i="5.77,293,1596524400"; d="scan'208";a="511610337"
Received: from genxfsim-desktop.iind.intel.com ([10.223.74.178])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2020 04:16:34 -0700
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Wed, 23 Sep 2020 16:35:23 +0530
Message-Id: <20200923110527.28661-1-anshuman.gupta@intel.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v2 0/4] Gen12 HDCP 1.4 support on DP MST
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

This is the v2 version after testing DP with some rough
changes in kms_content_protection IGT in order to test stream
encryption with multiple streams.
DP MST link authentication, stream encryption and link integrity
check has been tested with this series on TGL platform.

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
 drivers/gpu/drm/i915/display/intel_hdcp.c     | 70 ++++++++++------
 drivers/gpu/drm/i915/display/intel_hdcp.h     |  4 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c     | 14 ++--
 drivers/gpu/drm/i915/i915_reg.h               |  1 +
 9 files changed, 147 insertions(+), 58 deletions(-)

-- 
2.26.2

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
