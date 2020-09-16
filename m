Return-Path: <SRS0=Ht+W=CZ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12644C433E2
	for <intel-gfx@archiver.kernel.org>; Wed, 16 Sep 2020 05:39:53 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC1C7206B6
	for <intel-gfx@archiver.kernel.org>; Wed, 16 Sep 2020 05:39:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC1C7206B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E616E6E98E;
	Wed, 16 Sep 2020 05:39:51 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90EAA6E287
 for <intel-gfx@lists.freedesktop.org>; Wed, 16 Sep 2020 05:39:50 +0000 (UTC)
IronPort-SDR: XTvjqmvNDRVWW2CotPiKMT7l+/1K+hmlY70xhjySIRhjsTOVe+MGenFl0OwtOagNLpTdaxOpQT
 1iPWqnl9du2g==
X-IronPort-AV: E=McAfee;i="6000,8403,9745"; a="138905767"
X-IronPort-AV: E=Sophos;i="5.76,431,1592895600"; d="scan'208";a="138905767"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2020 22:39:50 -0700
IronPort-SDR: hmjJxQpXjsWDYUPUf9KSBbMdMosoT73QEDdj3YTDrKuDeBpCLGsEh7EQ01Z+Mq7dfGhxIs9DlO
 qdIgRHxXySvA==
X-IronPort-AV: E=Sophos;i="5.76,431,1592895600"; d="scan'208";a="287087929"
Received: from vandita-desktop.iind.intel.com ([10.223.74.218])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 15 Sep 2020 22:39:48 -0700
From: Vandita Kulkarni <vandita.kulkarni@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Wed, 16 Sep 2020 11:03:14 +0530
Message-Id: <20200916053318.14270-1-vandita.kulkarni@intel.com>
X-Mailer: git-send-email 2.21.0.5.gaeb582a
MIME-Version: 1.0
Subject: [Intel-gfx] [V11 0/4] Add support for mipi dsi cmd mode
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
Cc: jani.nikula@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

This series contain interrupt handling part of cmd mode.
Configuration patches were merged already.

v10: Address the review comments on patch 3 and 4
v11: fix compilation issue introduced in v10

Vandita Kulkarni (4):
  drm/i915/dsi: Add details about TE in get_config
  i915/dsi: Configure TE interrupt for cmd mode
  drm/i915/dsi: Add TE handler for dsi cmd mode.
  drm/i915/dsi: Initiate fame request in cmd mode

 drivers/gpu/drm/i915/display/icl_dsi.c       |  56 +++++++--
 drivers/gpu/drm/i915/display/intel_display.c |  10 ++
 drivers/gpu/drm/i915/display/intel_dsi.h     |   1 +
 drivers/gpu/drm/i915/i915_irq.c              | 116 ++++++++++++++++++-
 4 files changed, 169 insertions(+), 14 deletions(-)

-- 
2.21.0.5.gaeb582a

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
