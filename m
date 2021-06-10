Return-Path: <SRS0=5Iya=LE=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0368CC48BDF
	for <intel-gfx@archiver.kernel.org>; Thu, 10 Jun 2021 19:13:19 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9D83613E1
	for <intel-gfx@archiver.kernel.org>; Thu, 10 Jun 2021 19:13:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9D83613E1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 412F56EDCE;
	Thu, 10 Jun 2021 19:13:18 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ACDF6EDDC
 for <intel-gfx@lists.freedesktop.org>; Thu, 10 Jun 2021 19:13:17 +0000 (UTC)
IronPort-SDR: qGPYJJhcsXPS36ZXNr2BKJdczT7P0WIt9XM1nNcuI8x6dNMQ0d2KQX4he8K8VlPtcRsa2sGGHI
 juElsLdD3GJQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10011"; a="185751425"
X-IronPort-AV: E=Sophos;i="5.83,264,1616482800"; d="scan'208";a="185751425"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2021 12:13:16 -0700
IronPort-SDR: 4jw8zPIHTcJaWKgRiJUptZ1VgHhmi/b/fEVu2HT/k3+bMy1NnGj5s7MNpNKHmIPTyVgDKjWgB3
 edOFwYnKXVzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,264,1616482800"; d="scan'208";a="486301477"
Received: from anushasr-mobl6.jf.intel.com ([10.165.21.155])
 by fmsmga002.fm.intel.com with ESMTP; 10 Jun 2021 12:13:16 -0700
From: Anusha Srivatsa <anusha.srivatsa@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Thu, 10 Jun 2021 12:13:05 -0700
Message-Id: <20210610191309.25862-1-anusha.srivatsa@intel.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [Intel-gfx] [CI 0/4] Pipe DMC Support
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

With all DMC cleanup patches merged, sending the
rebased version of actual Pipe DMC bits.

One change from previous verison is a fix of SKL
regression. Corner cases for stepping-substepping
combination was missing from fw_info_matches_stepping()
helper. Luckily SKL was the only platform in CI that came
under this category and DMC refused to load.

v2: SKL fix tested on SKL.

v3: Minor changes in Pipe DMC plugging patch
as suggested by Lucas


Anusha Srivatsa (4):
  drm/i915/dmc: Introduce DMC_FW_MAIN
  drm/i915/xelpd: Pipe A DMC plugging
  drm/i915/adl_p: Pipe B DMC Support
  drm/i915/adl_p: Load DMC

 .../drm/i915/display/intel_display_debugfs.c  |   6 +-
 .../drm/i915/display/intel_display_power.c    |   5 +-
 drivers/gpu/drm/i915/display/intel_dmc.c      | 162 +++++++++++-------
 drivers/gpu/drm/i915/display/intel_dmc.h      |  23 ++-
 drivers/gpu/drm/i915/i915_reg.h               |   2 +-
 5 files changed, 124 insertions(+), 74 deletions(-)

-- 
2.25.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
