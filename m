Return-Path: <SRS0=dOvl=BM=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9BF5C433DF
	for <intel-gfx@archiver.kernel.org>; Sun,  2 Aug 2020 15:34:33 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C764E2063A
	for <intel-gfx@archiver.kernel.org>; Sun,  2 Aug 2020 15:34:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C764E2063A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CB0A6E09F;
	Sun,  2 Aug 2020 15:34:33 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 922B96E09F
 for <intel-gfx@lists.freedesktop.org>; Sun,  2 Aug 2020 15:34:31 +0000 (UTC)
IronPort-SDR: uErITpVdJ2aFD49xoxK4RWbz3Jkwv7QzERx9zQP7qA/JhSGCjoEbcjraVkIyEGdkSk/G6/Da5X
 14m+/Hu0EvWA==
X-IronPort-AV: E=McAfee;i="6000,8403,9700"; a="149448843"
X-IronPort-AV: E=Sophos;i="5.75,426,1589266800"; d="scan'208";a="149448843"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2020 08:34:31 -0700
IronPort-SDR: NaUhvwHZHmvBLLzrVCg82zsH44HcCqygo8XSndWvAkP61GOfrtvQ1deuVXzwXzPhuD/kmhy1Os
 0jKxxEBz/OpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,426,1589266800"; d="scan'208";a="395802835"
Received: from irvmail001.ir.intel.com ([163.33.26.43])
 by fmsmga001.fm.intel.com with ESMTP; 02 Aug 2020 08:34:30 -0700
Received: from mwajdecz-MOBL.ger.corp.intel.com
 (mwajdecz-mobl.ger.corp.intel.com [10.249.133.5])
 by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
 072FYT3r017247; Sun, 2 Aug 2020 16:34:29 +0100
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Sun,  2 Aug 2020 17:34:08 +0200
Message-Id: <20200802153410.2298-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 0/2] Add generic i915_ggtt ballooning support
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

Rebase forgotten series [1]

[1] https://patchwork.freedesktop.org/series/71920/

Michal Wajdeczko (2):
  drm/i915/ggtt: Add generic i915_ggtt ballooning support
  drm/i915/vgt: Move VGT GGTT ballooning nodes to i915_ggtt

 drivers/gpu/drm/i915/gt/intel_ggtt.c | 69 +++++++++++++++++++------
 drivers/gpu/drm/i915/gt/intel_gtt.h  |  5 ++
 drivers/gpu/drm/i915/i915_vgpu.c     | 75 +++++-----------------------
 3 files changed, 71 insertions(+), 78 deletions(-)

-- 
2.27.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
