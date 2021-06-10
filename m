Return-Path: <SRS0=5Iya=LE=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F349CC47094
	for <intel-gfx@archiver.kernel.org>; Thu, 10 Jun 2021 04:19:01 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B738861019
	for <intel-gfx@archiver.kernel.org>; Thu, 10 Jun 2021 04:19:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B738861019
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45E296E453;
	Thu, 10 Jun 2021 04:19:01 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25AFB6E453;
 Thu, 10 Jun 2021 04:19:00 +0000 (UTC)
IronPort-SDR: e+BbRuKmcEBFTuhpFcFLbuuC6BMfJYXKCTH4eu5PocFBGOiTmiLqyol9hJdSzlKKkscAbwJ2ch
 VPchhV2H/rAQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10010"; a="203373000"
X-IronPort-AV: E=Sophos;i="5.83,262,1616482800"; d="scan'208";a="203373000"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2021 21:18:59 -0700
IronPort-SDR: y2zQaLPS95s78L8McFPPHKXePenC8HI3AELhztjISsP1XAph2hFkHngcJV1yT/cHdqhS4MmlMu
 aXoOZJ68hwbA==
X-IronPort-AV: E=Sophos;i="5.83,262,1616482800"; d="scan'208";a="485997244"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2021 21:18:59 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Date: Wed,  9 Jun 2021 21:36:36 -0700
Message-Id: <20210610043649.144416-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 00/13]  Update firmware to v62.0.0
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

As part of enabling GuC submission [1] we need to update to the latest
and greatest firmware. This series does that. This is a destructive
change. e.g. Without all the patches in this series it will break the
i915 driver. As such, after we review most of these patches they will
squashed into a single patch for merging.

v2: Address comments, looking for remaning RBs so patches can be
squashed and sent for CI

Signed-off-by: Matthew Brost <matthew.brost@intel.com>

[1] https://patchwork.freedesktop.org/series/89844/i

John Harrison (3):
  drm/i915/guc: Support per context scheduling policies
  drm/i915/guc: Unified GuC log
  drm/i915/guc: Update firmware to v62.0.0

Michal Wajdeczko (10):
  drm/i915/guc: Introduce unified HXG messages
  drm/i915/guc: Update MMIO based communication
  drm/i915/guc: Update CTB response status definition
  drm/i915/guc: Add flag for mark broken CTB
  drm/i915/guc: New definition of the CTB descriptor
  drm/i915/guc: New definition of the CTB registration action
  drm/i915/guc: New CTB based communication
  drm/i915/doc: Include GuC ABI documentation
  drm/i915/guc: Kill guc_clients.ct_pool
  drm/i915/guc: Kill ads.client_info

 Documentation/gpu/i915.rst                    |   8 +
 .../gpu/drm/i915/gt/uc/abi/guc_actions_abi.h  | 107 ++++++
 .../gt/uc/abi/guc_communication_ctb_abi.h     | 128 +++++--
 .../gt/uc/abi/guc_communication_mmio_abi.h    |  65 ++--
 .../gpu/drm/i915/gt/uc/abi/guc_messages_abi.h | 213 +++++++++++
 drivers/gpu/drm/i915/gt/uc/intel_guc.c        | 107 ++++--
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    |  45 +--
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     | 356 +++++++++---------
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h     |   6 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |  75 +---
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.c    |  29 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.h    |   6 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      |  26 +-
 13 files changed, 750 insertions(+), 421 deletions(-)

-- 
2.28.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
