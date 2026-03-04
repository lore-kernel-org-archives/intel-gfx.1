Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7E00EFCE20
	for <intel-gfx@archiver.kernel.org>; Wed,  4 Mar 2026 17:12:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75ECB10EA6F;
	Wed,  4 Mar 2026 17:12:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UvIUSDpV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C8E710EA6F
 for <intel-gfx@lists.freedesktop.org>; Wed,  4 Mar 2026 17:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772644350; x=1804180350;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jAPhIH/5gAtGBZdRl41Q3pWZ+nhABxE5it2ZZZnd1Wo=;
 b=UvIUSDpVCAo5sxd9ZNsq71QViRj9kq28lJgwi+PWIJgFFFQMBoP4nuP3
 Vn2/FXiJDE3HsqhrcuKxglv6CbPTy52nKCv3XELUJWQnNv9PlEwC4pQj0
 ITCaqURfiq1IYfrHjoOXZ3j4pyVfYz4R4zoLdkUHUZHJDGW5GaModbyva
 fqd4GjJHiU55hKAkQWOM8Z51eaGeZnNYNbAFGvoCRdeYzUbdaT0iD8Uz/
 HlOIegsuMGKvO5p2facqPof9E0dH8rtqQ5Rm/Pv2gWKtFVS5zrjS/nakc
 b4DK/fs6S0bbPxNTyQVhB2catqqvWYbWbTXgquXCUY/ENxYC/7CHHjUxH w==;
X-CSE-ConnectionGUID: iXEboz1wQ4em2sRsBUdcJw==
X-CSE-MsgGUID: YHRLOPtuRFumru6QHAabNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="72739296"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="72739296"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 09:12:29 -0800
X-CSE-ConnectionGUID: W+y1doeIRT+1ir3QhI5rVg==
X-CSE-MsgGUID: DQee+wPuQaG+yFeI0bcObA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="223370796"
Received: from dut6094bmgfrd.fm.intel.com ([10.80.55.31])
 by orviesa005.jf.intel.com with ESMTP; 04 Mar 2026 09:12:29 -0800
From: Jia Yao <jia.yao@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: Jia Yao <jia.yao@intel.com>, Alex Zuo <alex.zuo@intel.com>,
 Shuicheng Lin <shuicheng.lin@intel.com>, Xin Wang <x.wang@intel.com>,
 stable@vger.kernel.org, Matt Roper <matthew.d.roper@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v2] drm/i915/dg2: Update workaround 22013059131
Date: Wed,  4 Mar 2026 17:12:26 +0000
Message-ID: <20260304171226.43208-1-jia.yao@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Setting the LSC chicken bit FORCE_1_SUB_MESSAGE_PER_FRAGMENT is not
required as part of the workaround, so it can be removed.

v2: Update commit message: clarify why LSC chicken bit
    FORCE_1_SUB_MESSAGE_PER_FRAGMENT is removed.

Bspec: 54833
Fixes: 645cc0b9d972 ("drm/i915/dg2: Add initial gt/ctx/engine workarounds")
Cc: Alex Zuo <alex.zuo@intel.com>
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Cc: Xin Wang  <x.wang@intel.com>
Cc: stable@vger.kernel.org
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Jia Yao <jia.yao@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_workarounds.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index f78d991ad7bf..404a6ffafbd0 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -2867,10 +2867,6 @@ general_render_compute_wa_init(struct intel_engine_cs *engine, struct i915_wa_li
 				     MAXREQS_PER_BANK,
 				     REG_FIELD_PREP(MAXREQS_PER_BANK, 2));
 
-		/* Wa_22013059131:dg2 */
-		wa_mcr_write_or(wal, LSC_CHICKEN_BIT_0,
-				FORCE_1_SUB_MESSAGE_PER_FRAGMENT);
-
 		/*
 		 * Wa_22012654132
 		 *
-- 
2.43.0

