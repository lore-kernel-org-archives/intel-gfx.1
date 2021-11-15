Return-Path: <SRS0=QaN2=QC=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CF45C433EF
	for <intel-gfx@archiver.kernel.org>; Mon, 15 Nov 2021 10:10:42 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF1A263211
	for <intel-gfx@archiver.kernel.org>; Mon, 15 Nov 2021 10:10:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DF1A263211
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 648706E450;
	Mon, 15 Nov 2021 10:10:38 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78FE86E442;
 Mon, 15 Nov 2021 10:10:36 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10168"; a="233659998"
X-IronPort-AV: E=Sophos;i="5.87,236,1631602800"; d="scan'208";a="233659998"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 02:10:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,236,1631602800"; d="scan'208";a="734913941"
Received: from tilak-nuc8i7beh.iind.intel.com ([10.145.162.9])
 by fmsmga005.fm.intel.com with ESMTP; 15 Nov 2021 02:10:32 -0800
From: Tilak Tangudu <tilak.tangudu@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Date: Mon, 15 Nov 2021 15:40:17 +0530
Message-Id: <20211115101018.3141302-1-tilak.tangudu@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 0/1] Enable runtime pm autosuspend by default
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

Enable runtime pm autosuspend by default

Signed-off-by: Tilak Tangudu <tilak.tangudu@intel.com>

Tilak Tangudu (1):
  drm/i915/rpm: Enable runtime pm autosuspend by default

 drivers/gpu/drm/i915/intel_runtime_pm.c | 4 ++++
 1 file changed, 4 insertions(+)

-- 
2.25.1

