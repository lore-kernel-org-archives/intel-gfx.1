Return-Path: <SRS0=MAHO=MV=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78FECC432BE
	for <intel-gfx@archiver.kernel.org>; Thu, 29 Jul 2021 05:41:32 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4454C6103B
	for <intel-gfx@archiver.kernel.org>; Thu, 29 Jul 2021 05:41:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4454C6103B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ED016EC81;
	Thu, 29 Jul 2021 05:41:26 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4569F6EA47
 for <intel-gfx@lists.freedesktop.org>; Thu, 29 Jul 2021 05:41:25 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10059"; a="199987833"
X-IronPort-AV: E=Sophos;i="5.84,278,1620716400"; d="scan'208";a="199987833"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2021 22:41:23 -0700
X-IronPort-AV: E=Sophos;i="5.84,278,1620716400"; d="scan'208";a="567114074"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2021 22:41:23 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Wed, 28 Jul 2021 22:41:15 -0700
Message-Id: <20210729054118.2458523-4-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20210729054118.2458523-1-matthew.d.roper@intel.com>
References: <20210729054118.2458523-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 3/6] drm/i915: Make shadow tables range-based
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

Rather than defining our shadow tables as a list of individual
registers, provide them as a list of register ranges; we'll have some
ranges of multiple registers being added soon (and we already have a
couple adjacent registers that we can squash into a single range now).

This change also defines the table with hex literal values rather than
symbolic register names; since that's how the tables are defined in the
bspec, this change should make it easier to review the tables overall.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_workarounds.c   |  13 +-
 drivers/gpu/drm/i915/intel_uncore.c           | 160 +++++++++---------
 drivers/gpu/drm/i915/intel_uncore.h           |   6 +
 drivers/gpu/drm/i915/selftests/intel_uncore.c |  32 ++--
 4 files changed, 108 insertions(+), 103 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index 9173df59821a..7558414bafb2 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -1963,12 +1963,7 @@ void intel_engine_apply_workarounds(struct intel_engine_cs *engine)
 	wa_list_apply(engine->gt, &engine->wa_list);
 }
 
-struct mcr_range {
-	u32 start;
-	u32 end;
-};
-
-static const struct mcr_range mcr_ranges_gen8[] = {
+static const struct i915_range mcr_ranges_gen8[] = {
 	{ .start = 0x5500, .end = 0x55ff },
 	{ .start = 0x7000, .end = 0x7fff },
 	{ .start = 0x9400, .end = 0x97ff },
@@ -1977,7 +1972,7 @@ static const struct mcr_range mcr_ranges_gen8[] = {
 	{},
 };
 
-static const struct mcr_range mcr_ranges_gen12[] = {
+static const struct i915_range mcr_ranges_gen12[] = {
 	{ .start =  0x8150, .end =  0x815f },
 	{ .start =  0x9520, .end =  0x955f },
 	{ .start =  0xb100, .end =  0xb3ff },
@@ -1986,7 +1981,7 @@ static const struct mcr_range mcr_ranges_gen12[] = {
 	{},
 };
 
-static const struct mcr_range mcr_ranges_xehp[] = {
+static const struct i915_range mcr_ranges_xehp[] = {
 	{ .start =  0x4000, .end =  0x4aff },
 	{ .start =  0x5200, .end =  0x52ff },
 	{ .start =  0x5400, .end =  0x7fff },
@@ -2004,7 +1999,7 @@ static const struct mcr_range mcr_ranges_xehp[] = {
 
 static bool mcr_range(struct drm_i915_private *i915, u32 offset)
 {
-	const struct mcr_range *mcr_ranges;
+	const struct i915_range *mcr_ranges;
 	int i;
 
 	if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50))
diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
index ea910f7ee635..2cfbc16f7dee 100644
--- a/drivers/gpu/drm/i915/intel_uncore.c
+++ b/drivers/gpu/drm/i915/intel_uncore.c
@@ -946,101 +946,95 @@ static const struct intel_forcewake_range __vlv_fw_ranges[] = {
 	find_fw_domain(uncore, offset)
 
 /* *Must* be sorted by offset! See intel_shadow_table_check(). */
-static const i915_reg_t gen8_shadowed_regs[] = {
-	RING_TAIL(RENDER_RING_BASE),	/* 0x2000 (base) */
-	GEN6_RPNSWREQ,			/* 0xA008 */
-	GEN6_RC_VIDEO_FREQ,		/* 0xA00C */
-	RING_TAIL(GEN6_BSD_RING_BASE),	/* 0x12000 (base) */
-	RING_TAIL(VEBOX_RING_BASE),	/* 0x1a000 (base) */
-	RING_TAIL(BLT_RING_BASE),	/* 0x22000 (base) */
+static const struct i915_range gen8_shadowed_regs[] = {
+	{ .start =  0x2030, .end =  0x2030 },
+	{ .start =  0xA008, .end =  0xA00C },
+	{ .start = 0x12030, .end = 0x12030 },
+	{ .start = 0x1a030, .end = 0x1a030 },
+	{ .start = 0x22030, .end = 0x22030 },
 	/* TODO: Other registers are not yet used */
 };
 
-static const i915_reg_t gen11_shadowed_regs[] = {
-	RING_TAIL(RENDER_RING_BASE),			/* 0x2000 (base) */
-	RING_EXECLIST_CONTROL(RENDER_RING_BASE),        /* 0x2550 */
-	GEN6_RPNSWREQ,					/* 0xA008 */
-	GEN6_RC_VIDEO_FREQ,				/* 0xA00C */
-	RING_TAIL(BLT_RING_BASE),			/* 0x22000 (base) */
-	RING_EXECLIST_CONTROL(BLT_RING_BASE),		/* 0x22550 */
-	RING_TAIL(GEN11_BSD_RING_BASE),			/* 0x1C0000 (base) */
-	RING_EXECLIST_CONTROL(GEN11_BSD_RING_BASE),	/* 0x1C0550 */
-	RING_TAIL(GEN11_BSD2_RING_BASE),		/* 0x1C4000 (base) */
-	RING_EXECLIST_CONTROL(GEN11_BSD2_RING_BASE),	/* 0x1C4550 */
-	RING_TAIL(GEN11_VEBOX_RING_BASE),		/* 0x1C8000 (base) */
-	RING_EXECLIST_CONTROL(GEN11_VEBOX_RING_BASE),	/* 0x1C8550 */
-	RING_TAIL(GEN11_BSD3_RING_BASE),		/* 0x1D0000 (base) */
-	RING_EXECLIST_CONTROL(GEN11_BSD3_RING_BASE),	/* 0x1D0550 */
-	RING_TAIL(GEN11_BSD4_RING_BASE),		/* 0x1D4000 (base) */
-	RING_EXECLIST_CONTROL(GEN11_BSD4_RING_BASE),	/* 0x1D4550 */
-	RING_TAIL(GEN11_VEBOX2_RING_BASE),		/* 0x1D8000 (base) */
-	RING_EXECLIST_CONTROL(GEN11_VEBOX2_RING_BASE),	/* 0x1D8550 */
+static const struct i915_range gen11_shadowed_regs[] = {
+	{ .start =   0x2030, .end =   0x2030 },
+	{ .start =   0x2550, .end =   0x2550 },
+	{ .start =   0xA008, .end =   0xA00C },
+	{ .start =  0x22030, .end =  0x22030 },
+	{ .start =  0x22550, .end =  0x22550 },
+	{ .start = 0x1C0030, .end = 0x1C0030 },
+	{ .start = 0x1C0550, .end = 0x1C0550 },
+	{ .start = 0x1C4030, .end = 0x1C4030 },
+	{ .start = 0x1C4550, .end = 0x1C4550 },
+	{ .start = 0x1C8030, .end = 0x1C8030 },
+	{ .start = 0x1C8550, .end = 0x1C8550 },
+	{ .start = 0x1D0030, .end = 0x1D0030 },
+	{ .start = 0x1D0550, .end = 0x1D0550 },
+	{ .start = 0x1D4030, .end = 0x1D4030 },
+	{ .start = 0x1D4550, .end = 0x1D4550 },
+	{ .start = 0x1D8030, .end = 0x1D8030 },
+	{ .start = 0x1D8550, .end = 0x1D8550 },
 	/* TODO: Other registers are not yet used */
 };
 
-static const i915_reg_t gen12_shadowed_regs[] = {
-	RING_TAIL(RENDER_RING_BASE),			/* 0x2000 (base) */
-	RING_EXECLIST_CONTROL(RENDER_RING_BASE),	/* 0x2550 */
-	GEN6_RPNSWREQ,					/* 0xA008 */
-	GEN6_RC_VIDEO_FREQ,				/* 0xA00C */
-	RING_TAIL(BLT_RING_BASE),			/* 0x22000 (base) */
-	RING_EXECLIST_CONTROL(BLT_RING_BASE),		/* 0x22550 */
-	RING_TAIL(GEN11_BSD_RING_BASE),			/* 0x1C0000 (base) */
-	RING_EXECLIST_CONTROL(GEN11_BSD_RING_BASE),	/* 0x1C0550 */
-	RING_TAIL(GEN11_BSD2_RING_BASE),		/* 0x1C4000 (base) */
-	RING_EXECLIST_CONTROL(GEN11_BSD2_RING_BASE),	/* 0x1C4550 */
-	RING_TAIL(GEN11_VEBOX_RING_BASE),		/* 0x1C8000 (base) */
-	RING_EXECLIST_CONTROL(GEN11_VEBOX_RING_BASE),	/* 0x1C8550 */
-	RING_TAIL(GEN11_BSD3_RING_BASE),		/* 0x1D0000 (base) */
-	RING_EXECLIST_CONTROL(GEN11_BSD3_RING_BASE),	/* 0x1D0550 */
-	RING_TAIL(GEN11_BSD4_RING_BASE),		/* 0x1D4000 (base) */
-	RING_EXECLIST_CONTROL(GEN11_BSD4_RING_BASE),	/* 0x1D4550 */
-	RING_TAIL(GEN11_VEBOX2_RING_BASE),		/* 0x1D8000 (base) */
-	RING_EXECLIST_CONTROL(GEN11_VEBOX2_RING_BASE),	/* 0x1D8550 */
+static const struct i915_range gen12_shadowed_regs[] = {
+	{ .start =   0x2030, .end =   0x2030 },
+	{ .start =   0x2550, .end =   0x2550 },
+	{ .start =   0xA008, .end =   0xA00C },
+	{ .start =  0x22030, .end =  0x22030 },
+	{ .start =  0x22550, .end =  0x22550 },
+	{ .start = 0x1C0030, .end = 0x1C0030 },
+	{ .start = 0x1C0550, .end = 0x1C0550 },
+	{ .start = 0x1C4030, .end = 0x1C4030 },
+	{ .start = 0x1C4550, .end = 0x1C4550 },
+	{ .start = 0x1C8030, .end = 0x1C8030 },
+	{ .start = 0x1C8550, .end = 0x1C8550 },
+	{ .start = 0x1D0030, .end = 0x1D0030 },
+	{ .start = 0x1D0550, .end = 0x1D0550 },
+	{ .start = 0x1D4030, .end = 0x1D4030 },
+	{ .start = 0x1D4550, .end = 0x1D4550 },
+	{ .start = 0x1D8030, .end = 0x1D8030 },
+	{ .start = 0x1D8550, .end = 0x1D8550 },
 	/* TODO: Other registers are not yet used */
 };
 
-static const i915_reg_t xehp_shadowed_regs[] = {
-	RING_TAIL(RENDER_RING_BASE),			/* 0x2000 (base) */
-	RING_EXECLIST_CONTROL(RENDER_RING_BASE),        /* 0x2550 */
-	GEN6_RPNSWREQ,					/* 0xA008 */
-	GEN6_RC_VIDEO_FREQ,				/* 0xA00C */
-	RING_TAIL(BLT_RING_BASE),			/* 0x22000 (base) */
-	RING_EXECLIST_CONTROL(BLT_RING_BASE),		/* 0x22550 */
-	RING_TAIL(GEN11_BSD_RING_BASE),			/* 0x1C0000 (base) */
-	RING_EXECLIST_CONTROL(GEN11_BSD_RING_BASE),	/* 0x1C0550 */
-	RING_TAIL(GEN11_BSD2_RING_BASE),		/* 0x1C4000 (base) */
-	RING_EXECLIST_CONTROL(GEN11_BSD2_RING_BASE),	/* 0x1C4550 */
-	RING_TAIL(GEN11_VEBOX_RING_BASE),		/* 0x1C8000 (base) */
-	RING_EXECLIST_CONTROL(GEN11_VEBOX_RING_BASE),	/* 0x1C8550 */
-	RING_TAIL(GEN11_BSD3_RING_BASE),		/* 0x1D0000 (base) */
-	RING_EXECLIST_CONTROL(GEN11_BSD3_RING_BASE),	/* 0x1D0550 */
-	RING_TAIL(GEN11_BSD4_RING_BASE),		/* 0x1D4000 (base) */
-	RING_EXECLIST_CONTROL(GEN11_BSD4_RING_BASE),	/* 0x1D4550 */
-	RING_TAIL(GEN11_VEBOX2_RING_BASE),		/* 0x1D8000 (base) */
-	RING_EXECLIST_CONTROL(GEN11_VEBOX2_RING_BASE),	/* 0x1D8550 */
-	RING_TAIL(XEHP_BSD5_RING_BASE),			/* 0x1E0000 (base) */
-	RING_EXECLIST_CONTROL(XEHP_BSD5_RING_BASE),	/* 0x1E0550 */
-	RING_TAIL(XEHP_BSD6_RING_BASE),			/* 0x1E4000 (base) */
-	RING_EXECLIST_CONTROL(XEHP_BSD6_RING_BASE),	/* 0x1E4550 */
-	RING_TAIL(XEHP_VEBOX3_RING_BASE),		/* 0x1E8000 (base) */
-	RING_EXECLIST_CONTROL(XEHP_VEBOX3_RING_BASE),	/* 0x1E8550 */
-	RING_TAIL(XEHP_BSD7_RING_BASE),			/* 0x1F0000 (base) */
-	RING_EXECLIST_CONTROL(XEHP_BSD7_RING_BASE),	/* 0x1F0550 */
-	RING_TAIL(XEHP_BSD8_RING_BASE),			/* 0x1F4000 (base) */
-	RING_EXECLIST_CONTROL(XEHP_BSD8_RING_BASE),	/* 0x1F4550 */
-	RING_TAIL(XEHP_VEBOX4_RING_BASE),		/* 0x1F8000 (base) */
-	RING_EXECLIST_CONTROL(XEHP_VEBOX4_RING_BASE),	/* 0x1F8550 */
+static const struct i915_range xehp_shadowed_regs[] = {
+	{ .start =   0x2000, .end =   0x2030 },
+	{ .start =   0x2550, .end =   0x2550 },
+	{ .start =   0xA008, .end =   0xA00C },
+	{ .start =  0x22030, .end =  0x22030 },
+	{ .start =  0x22550, .end =  0x22550 },
+	{ .start = 0x1C0030, .end = 0x1C0030 },
+	{ .start = 0x1C0550, .end = 0x1C0550 },
+	{ .start = 0x1C4030, .end = 0x1C4030 },
+	{ .start = 0x1C4550, .end = 0x1C4550 },
+	{ .start = 0x1C8030, .end = 0x1C8030 },
+	{ .start = 0x1C8550, .end = 0x1C8550 },
+	{ .start = 0x1D0030, .end = 0x1D0030 },
+	{ .start = 0x1D0550, .end = 0x1D0550 },
+	{ .start = 0x1D4030, .end = 0x1D4030 },
+	{ .start = 0x1D4550, .end = 0x1D4550 },
+	{ .start = 0x1D8030, .end = 0x1D8030 },
+	{ .start = 0x1D8550, .end = 0x1D8550 },
+	{ .start = 0x1E0030, .end = 0x1E0030 },
+	{ .start = 0x1E0550, .end = 0x1E0550 },
+	{ .start = 0x1E4030, .end = 0x1E4030 },
+	{ .start = 0x1E4550, .end = 0x1E4550 },
+	{ .start = 0x1E8030, .end = 0x1E8030 },
+	{ .start = 0x1E8550, .end = 0x1E8550 },
+	{ .start = 0x1F0030, .end = 0x1F0030 },
+	{ .start = 0x1F0550, .end = 0x1F0550 },
+	{ .start = 0x1F4030, .end = 0x1F4030 },
+	{ .start = 0x1F4550, .end = 0x1F4550 },
+	{ .start = 0x1F8030, .end = 0x1F8030 },
+	{ .start = 0x1F8550, .end = 0x1F8550 },
 	/* TODO: Other registers are not yet used */
 };
 
-static int mmio_reg_cmp(u32 key, const i915_reg_t *reg)
+static int mmio_range_cmp(u32 key, const struct i915_range *range)
 {
-	u32 offset = i915_mmio_reg_offset(*reg);
-
-	if (key < offset)
+	if (key < range->start)
 		return -1;
-	else if (key > offset)
+	else if (key > range->end)
 		return 1;
 	else
 		return 0;
@@ -1049,9 +1043,9 @@ static int mmio_reg_cmp(u32 key, const i915_reg_t *reg)
 #define __is_X_shadowed(x) \
 static bool is_##x##_shadowed(u32 offset) \
 { \
-	const i915_reg_t *regs = x##_shadowed_regs; \
+	const struct i915_range *regs = x##_shadowed_regs; \
 	return BSEARCH(offset, regs, ARRAY_SIZE(x##_shadowed_regs), \
-		       mmio_reg_cmp); \
+		       mmio_range_cmp); \
 }
 
 __is_X_shadowed(gen8)
diff --git a/drivers/gpu/drm/i915/intel_uncore.h b/drivers/gpu/drm/i915/intel_uncore.h
index 3c0b0a8b5250..531665b08039 100644
--- a/drivers/gpu/drm/i915/intel_uncore.h
+++ b/drivers/gpu/drm/i915/intel_uncore.h
@@ -119,6 +119,12 @@ struct intel_forcewake_range {
 	enum forcewake_domains domains;
 };
 
+/* Other register ranges (e.g., shadow tables, MCR tables, etc.) */
+struct i915_range {
+	u32 start;
+	u32 end;
+};
+
 struct intel_uncore {
 	void __iomem *regs;
 
diff --git a/drivers/gpu/drm/i915/selftests/intel_uncore.c b/drivers/gpu/drm/i915/selftests/intel_uncore.c
index 720b60853f8b..d3e36ed32646 100644
--- a/drivers/gpu/drm/i915/selftests/intel_uncore.c
+++ b/drivers/gpu/drm/i915/selftests/intel_uncore.c
@@ -62,30 +62,40 @@ static int intel_fw_table_check(const struct intel_forcewake_range *ranges,
 static int intel_shadow_table_check(void)
 {
 	struct {
-		const i915_reg_t *regs;
+		const struct i915_range *regs;
 		unsigned int size;
-	} reg_lists[] = {
+	} range_lists[] = {
 		{ gen8_shadowed_regs, ARRAY_SIZE(gen8_shadowed_regs) },
 		{ gen11_shadowed_regs, ARRAY_SIZE(gen11_shadowed_regs) },
 		{ gen12_shadowed_regs, ARRAY_SIZE(gen12_shadowed_regs) },
 		{ xehp_shadowed_regs, ARRAY_SIZE(xehp_shadowed_regs) },
 	};
-	const i915_reg_t *reg;
+	const struct i915_range *range;
 	unsigned int i, j;
 	s32 prev;
 
-	for (j = 0; j < ARRAY_SIZE(reg_lists); ++j) {
-		reg = reg_lists[j].regs;
-		for (i = 0, prev = -1; i < reg_lists[j].size; i++, reg++) {
-			u32 offset = i915_mmio_reg_offset(*reg);
+	for (j = 0; j < ARRAY_SIZE(range_lists); ++j) {
+		range = range_lists[j].regs;
+		for (i = 0, prev = -1; i < range_lists[j].size; i++, range++) {
+			if (range->end < range->start) {
+				pr_err("%s: range[%d]:(%06x-%06x) has end before start\n",
+				       __func__, i, range->start, range->end);
+				return -EINVAL;
+			}
+
+			if (prev >= range->start) {
+				pr_err("%s: range[%d]:(%06x-%06x) is before end of previous (%06x)\n",
+				       __func__, i, range->start, range->end, prev);
+				return -EINVAL;
+			}
 
-			if (prev >= (s32)offset) {
-				pr_err("%s: entry[%d]:(%x) is before previous (%x)\n",
-				       __func__, i, offset, prev);
+			if (range->start % 4) {
+				pr_err("%s: range[%d]:(%06x-%06x) has non-dword-aligned start\n",
+				       __func__, i, range->start, range->end);
 				return -EINVAL;
 			}
 
-			prev = offset;
+			prev = range->end;
 		}
 	}
 
-- 
2.25.4

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
