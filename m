Return-Path: <SRS0=MAHO=MV=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40A16C4338F
	for <intel-gfx@archiver.kernel.org>; Thu, 29 Jul 2021 05:41:34 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05F246103B
	for <intel-gfx@archiver.kernel.org>; Thu, 29 Jul 2021 05:41:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 05F246103B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0ACE6EC86;
	Thu, 29 Jul 2021 05:41:26 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF54F6EA47
 for <intel-gfx@lists.freedesktop.org>; Thu, 29 Jul 2021 05:41:24 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10059"; a="199987832"
X-IronPort-AV: E=Sophos;i="5.84,278,1620716400"; d="scan'208";a="199987832"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2021 22:41:23 -0700
X-IronPort-AV: E=Sophos;i="5.84,278,1620716400"; d="scan'208";a="567114070"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2021 22:41:23 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Wed, 28 Jul 2021 22:41:14 -0700
Message-Id: <20210729054118.2458523-3-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20210729054118.2458523-1-matthew.d.roper@intel.com>
References: <20210729054118.2458523-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 2/6] drm/i915: Re-use gen11 forcewake read
 functions on gen12
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

The forcewake read logic is identical between gen11 and gen12, only the
forcewake table data (which is tracked separately) differs; there's no
need to generate a separate set of gen12 read functions when the gen11
functions will work just as well.

We'll keep the separate write functions for now since the generated code
directly references different shadow tables between the two platforms.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/intel_uncore.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
index bca548c81572..ea910f7ee635 100644
--- a/drivers/gpu/drm/i915/intel_uncore.c
+++ b/drivers/gpu/drm/i915/intel_uncore.c
@@ -945,9 +945,6 @@ static const struct intel_forcewake_range __vlv_fw_ranges[] = {
 #define __gen11_fwtable_reg_read_fw_domains(uncore, offset) \
 	find_fw_domain(uncore, offset)
 
-#define __gen12_fwtable_reg_read_fw_domains(uncore, offset) \
-	find_fw_domain(uncore, offset)
-
 /* *Must* be sorted by offset! See intel_shadow_table_check(). */
 static const i915_reg_t gen8_shadowed_regs[] = {
 	RING_TAIL(RENDER_RING_BASE),	/* 0x2000 (base) */
@@ -1617,7 +1614,6 @@ __gen_read(func, 16) \
 __gen_read(func, 32) \
 __gen_read(func, 64)
 
-__gen_reg_read_funcs(gen12_fwtable);
 __gen_reg_read_funcs(gen11_fwtable);
 __gen_reg_read_funcs(fwtable);
 __gen_reg_read_funcs(gen6);
@@ -2091,7 +2087,7 @@ static int uncore_forcewake_init(struct intel_uncore *uncore)
 	} else if (GRAPHICS_VER(i915) >= 12) {
 		ASSIGN_FW_DOMAINS_TABLE(uncore, __gen12_fw_ranges);
 		ASSIGN_WRITE_MMIO_VFUNCS(uncore, gen12_fwtable);
-		ASSIGN_READ_MMIO_VFUNCS(uncore, gen12_fwtable);
+		ASSIGN_READ_MMIO_VFUNCS(uncore, gen11_fwtable);
 	} else if (GRAPHICS_VER(i915) == 11) {
 		ASSIGN_FW_DOMAINS_TABLE(uncore, __gen11_fw_ranges);
 		ASSIGN_WRITE_MMIO_VFUNCS(uncore, gen11_fwtable);
-- 
2.25.4

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
