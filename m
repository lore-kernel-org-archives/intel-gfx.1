Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD394C6FA82
	for <intel-gfx@archiver.kernel.org>; Sat, 10 Sep 2022 00:12:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5735610E1D3;
	Sat, 10 Sep 2022 00:12:11 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EED9110E1CA;
 Sat, 10 Sep 2022 00:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662768726; x=1694304726;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qGhB+V3zghSa97YuScVkE0tjlkW7TolISaaX736XKn4=;
 b=Cfo8nLWw4YWqz/0FRj6SFD2G3ct3lBmP3fRxzI2KlB3dw9wy+TpzWfBi
 wlGx+hj88LazpcZVTvMshT0Q41RqnkMz510alMHDGPJSUV0ZXNIqiP9eu
 E7Iw4MHd5oP8Fw7B1Vw6VcQKKnvTuvIC+KltqP0NPh754agf6iPU5L48I
 ca5s7ITuRqqCzTPU6BKt7xzy6kKYuUNyFRWbocZuOAyxQ/FdabpPUNKXQ
 z/kHNNGFjFb+DEgmYhuhxZNokXC9ueWLtRNOVFeY9dhiXEu2DopY+qH3y
 2XiBlmFBvros50uQby4rddN76x3D35aHnWKt9p3ET6v1xx9MofhvNAppZ Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10465"; a="298931858"
X-IronPort-AV: E=Sophos;i="5.93,304,1654585200"; d="scan'208";a="298931858"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2022 17:12:05 -0700
X-IronPort-AV: E=Sophos;i="5.93,304,1654585200"; d="scan'208";a="645737281"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2022 17:12:05 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Fri,  9 Sep 2022 17:11:59 -0700
Message-Id: <20220910001202.1733349-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 0/3] i915: freq caps and perf_limit_reasons
 changes for MTL
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
Cc: dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Since https://patchwork.freedesktop.org/series/107908/ is now merged,
rebase this series on latest drm-tip and post a clean series.

Ashutosh Dixit (2):
  drm/i915/mtl: PERF_LIMIT_REASONS changes for MTL
  drm/i915/rps: Freq caps for MTL

Tilak Tangudu (1):
  drm/i915/debugfs: Add perf_limit_reasons in debugfs

 drivers/gpu/drm/i915/gt/intel_gt.c            |  6 +++
 drivers/gpu/drm/i915/gt/intel_gt.h            |  1 +
 drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c | 31 +++++++++++++
 drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c   |  6 +--
 drivers/gpu/drm/i915/gt/intel_rps.c           | 46 +++++++++++++++----
 drivers/gpu/drm/i915/i915_reg.h               | 11 +++++
 6 files changed, 89 insertions(+), 12 deletions(-)

-- 
2.34.1

