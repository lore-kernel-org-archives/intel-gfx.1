Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE0F1C7EE2F
	for <intel-gfx@archiver.kernel.org>; Tue,  6 Jun 2023 22:15:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEB2210E3DB;
	Tue,  6 Jun 2023 22:15:18 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B14CD10E19B;
 Tue,  6 Jun 2023 22:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686089716; x=1717625716;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OCshV4vi//ZRemMrlAfACm3yUYuC1FndE2VlA77WpPE=;
 b=QPdA42z3bJ1F9SGZEqx4PjSQsLwSkM6rKSysk3AUewvXHfDdUh6KTR9X
 xKOqnP/kyMCuDBMTZrldNd0xJ423kG2POw8gPTvC8Hekj1Iia8vFHJddE
 Z8m65gO/M2VUuBlLo2uWidyiBaF9bwVfUcxRxhqUVve31kvTSTLZXybWn
 /CIT1Cj3zLad6t8c+JiBC4uSsdKV3ZGohWpRN1bim4SMnFgRS+R0OmVV4
 NwY6PDS2YSvWhMvJF9yi/rl/sApQva7zh5yJ5ZA/BTtMbtzwbMRszJNyO
 qfuj7FCi4H+Vs1i4LrLFhrCgFw8/6/PXQ9vGWtdMgCU5r7XghBKgJpNmx w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="346420152"
X-IronPort-AV: E=Sophos;i="6.00,222,1681196400"; d="scan'208";a="346420152"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 15:15:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="742341998"
X-IronPort-AV: E=Sophos;i="6.00,222,1681196400"; d="scan'208";a="742341998"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.27.27])
 by orsmga001.jf.intel.com with ESMTP; 06 Jun 2023 15:15:10 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	igt-dev@lists.freedesktop.org
Date: Tue,  6 Jun 2023 15:14:18 -0700
Message-Id: <20230606221418.296888-1-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH i-g-t] tests/gem_ctx_persistence: Skip hang
 subtest with GuC
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

Hang subtest is not supported with GuC submission enabled.

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 tests/i915/gem_ctx_persistence.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/i915/gem_ctx_persistence.c b/tests/i915/gem_ctx_persistence.c
index df9b1c491..d2558354e 100644
--- a/tests/i915/gem_ctx_persistence.c
+++ b/tests/i915/gem_ctx_persistence.c
@@ -577,6 +577,8 @@ static void test_nohangcheck_hang(int i915, const intel_ctx_cfg_t *cfg)
 	int testable_engines = 0;
 	int dir;
 
+	igt_require(!gem_using_guc_submission(i915));
+
 	cleanup(i915);
 
 	/*
-- 
2.38.1

