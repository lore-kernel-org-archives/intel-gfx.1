Return-Path: <SRS0=eaB6=PN=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0CEDC433F5
	for <intel-gfx@archiver.kernel.org>; Mon, 25 Oct 2021 07:19:47 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7CCDD60724
	for <intel-gfx@archiver.kernel.org>; Mon, 25 Oct 2021 07:19:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7CCDD60724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B09DA89C69;
	Mon, 25 Oct 2021 07:19:46 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDD1189C69
 for <intel-gfx@lists.freedesktop.org>; Mon, 25 Oct 2021 07:19:45 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10147"; a="227037239"
X-IronPort-AV: E=Sophos;i="5.87,179,1631602800"; d="scan'208";a="227037239"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2021 00:19:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,179,1631602800"; d="scan'208";a="496659714"
Received: from tejas-system-product-name.iind.intel.com ([10.145.162.130])
 by orsmga008.jf.intel.com with ESMTP; 25 Oct 2021 00:19:41 -0700
From: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Mon, 25 Oct 2021 12:43:15 +0530
Message-Id: <20211025071317.3393329-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH V2 0/2] Enable PXP support
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
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

There are recent tests added in IGT which tests PXP.
As PXP not enabled by default CI is skipping the tests.

This patch series :
1. Enables PXP
2. Fixes the crash occures(RPM wakelock not acquired) 
after enabling PXP

Tejas Upadhyay (2):
  drm/i915/pxp: run CI with PXP and MEI_PXP enabled.
  drm/i915/gt: Hold RPM wakelock during PXP suspend

 drivers/gpu/drm/i915/Kconfig.debug    | 2 ++
 drivers/gpu/drm/i915/gt/intel_gt_pm.c | 6 +++++-
 2 files changed, 7 insertions(+), 1 deletion(-)

-- 
2.31.1

