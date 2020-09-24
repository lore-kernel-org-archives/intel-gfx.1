Return-Path: <SRS0=6TpN=DB=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B792C4727D
	for <intel-gfx@archiver.kernel.org>; Thu, 24 Sep 2020 12:49:06 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2CEF20708
	for <intel-gfx@archiver.kernel.org>; Thu, 24 Sep 2020 12:49:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C2CEF20708
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 258086E243;
	Thu, 24 Sep 2020 12:49:05 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93E506E243
 for <intel-gfx@lists.freedesktop.org>; Thu, 24 Sep 2020 12:49:04 +0000 (UTC)
IronPort-SDR: df2kwoRy9sPgxImV+hoPSdjwe5DNAEeP0Rn6I424P697A82MSV2L9IC63TnD6Y1vALNj5uzkpr
 jQmC0XlKdSyA==
X-IronPort-AV: E=McAfee;i="6000,8403,9753"; a="160480077"
X-IronPort-AV: E=Sophos;i="5.77,297,1596524400"; d="scan'208";a="160480077"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2020 05:49:03 -0700
IronPort-SDR: Efn8SmNDmzi8vbmf/menp0pVjbx5a44ZEKxuJ8WygC8sUbA9Br6T3y7bZNaJ/Wz0EYFFSI5i1a
 wyI8ycAhfQEw==
X-IronPort-AV: E=Sophos;i="5.77,297,1596524400"; d="scan'208";a="486889745"
Received: from vandita-desktop.iind.intel.com ([10.223.74.218])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 24 Sep 2020 05:49:02 -0700
From: Vandita Kulkarni <vandita.kulkarni@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Thu, 24 Sep 2020 18:12:04 +0530
Message-Id: <20200924124209.17916-1-vandita.kulkarni@intel.com>
X-Mailer: git-send-email 2.21.0.5.gaeb582a
MIME-Version: 1.0
Subject: [Intel-gfx] [V14 0/5] Add support for mipi dsi cmd mode
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

Vandita Kulkarni (5):
  drm/i915/dsi: Add details about TE in get_config
  i915/dsi: Configure TE interrupt for cmd mode
  drm/i915/dsi: Add TE handler for dsi cmd mode.
  drm/i915/dsi: Initiate frame request in cmd mode
  drm/i915/dsi: Enable software vblank counter

 drivers/gpu/drm/i915/display/icl_dsi.c       |  56 +++++++--
 drivers/gpu/drm/i915/display/intel_display.c |  11 ++
 drivers/gpu/drm/i915/display/intel_dsi.h     |   1 +
 drivers/gpu/drm/i915/display/intel_sprite.c  |   7 ++
 drivers/gpu/drm/i915/i915_irq.c              | 119 ++++++++++++++++++-
 5 files changed, 180 insertions(+), 14 deletions(-)

-- 
2.21.0.5.gaeb582a

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
