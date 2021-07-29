Return-Path: <SRS0=MAHO=MV=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA5B9C4338F
	for <intel-gfx@archiver.kernel.org>; Thu, 29 Jul 2021 05:41:28 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DA076103B
	for <intel-gfx@archiver.kernel.org>; Thu, 29 Jul 2021 05:41:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9DA076103B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0682F6EB4B;
	Thu, 29 Jul 2021 05:41:26 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 532C16EB4B
 for <intel-gfx@lists.freedesktop.org>; Thu, 29 Jul 2021 05:41:25 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10059"; a="199987834"
X-IronPort-AV: E=Sophos;i="5.84,278,1620716400"; d="scan'208";a="199987834"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2021 22:41:23 -0700
X-IronPort-AV: E=Sophos;i="5.84,278,1620716400"; d="scan'208";a="567114078"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2021 22:41:23 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Wed, 28 Jul 2021 22:41:16 -0700
Message-Id: <20210729054118.2458523-5-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20210729054118.2458523-1-matthew.d.roper@intel.com>
References: <20210729054118.2458523-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 4/6] drm/i915/gen11: Update shadowed register
 table
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

The bspec lists many shadowed registers (i.e., registers for which we
don't need to grab forcewake when writing) that we weren't tracking in
the driver.  Although we may not actually use all of these registers
right now, it's best to just match the bspec list exactly.

Note that the bspec also lists registers that are shadowed for various
HW-internal accesses; we can ignore those and just list the ones that
are shadowed for accesses from the IA/CPU.

Bspec: 18333
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/intel_uncore.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
index 2cfbc16f7dee..31e0456dce5a 100644
--- a/drivers/gpu/drm/i915/intel_uncore.c
+++ b/drivers/gpu/drm/i915/intel_uncore.c
@@ -960,20 +960,26 @@ static const struct i915_range gen11_shadowed_regs[] = {
 	{ .start =   0x2550, .end =   0x2550 },
 	{ .start =   0xA008, .end =   0xA00C },
 	{ .start =  0x22030, .end =  0x22030 },
-	{ .start =  0x22550, .end =  0x22550 },
+	{ .start =  0x22230, .end =  0x22230 },
+	{ .start =  0x22510, .end =  0x22550 },
 	{ .start = 0x1C0030, .end = 0x1C0030 },
-	{ .start = 0x1C0550, .end = 0x1C0550 },
+	{ .start = 0x1C0230, .end = 0x1C0230 },
+	{ .start = 0x1C0510, .end = 0x1C0550 },
 	{ .start = 0x1C4030, .end = 0x1C4030 },
-	{ .start = 0x1C4550, .end = 0x1C4550 },
+	{ .start = 0x1C4230, .end = 0x1C4230 },
+	{ .start = 0x1C4510, .end = 0x1C4550 },
 	{ .start = 0x1C8030, .end = 0x1C8030 },
-	{ .start = 0x1C8550, .end = 0x1C8550 },
+	{ .start = 0x1C8230, .end = 0x1C8230 },
+	{ .start = 0x1C8510, .end = 0x1C8550 },
 	{ .start = 0x1D0030, .end = 0x1D0030 },
-	{ .start = 0x1D0550, .end = 0x1D0550 },
+	{ .start = 0x1D0230, .end = 0x1D0230 },
+	{ .start = 0x1D0510, .end = 0x1D0550 },
 	{ .start = 0x1D4030, .end = 0x1D4030 },
-	{ .start = 0x1D4550, .end = 0x1D4550 },
+	{ .start = 0x1D4230, .end = 0x1D4230 },
+	{ .start = 0x1D4510, .end = 0x1D4550 },
 	{ .start = 0x1D8030, .end = 0x1D8030 },
-	{ .start = 0x1D8550, .end = 0x1D8550 },
-	/* TODO: Other registers are not yet used */
+	{ .start = 0x1D8230, .end = 0x1D8230 },
+	{ .start = 0x1D8510, .end = 0x1D8550 },
 };
 
 static const struct i915_range gen12_shadowed_regs[] = {
-- 
2.25.4

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
