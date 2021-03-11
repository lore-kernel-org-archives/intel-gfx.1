Return-Path: <SRS0=Ajii=IJ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EEF5C433E0
	for <intel-gfx@archiver.kernel.org>; Thu, 11 Mar 2021 18:36:43 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB7E964FE0
	for <intel-gfx@archiver.kernel.org>; Thu, 11 Mar 2021 18:36:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB7E964FE0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63EF06E526;
	Thu, 11 Mar 2021 18:36:42 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83B5C6E526
 for <intel-gfx@lists.freedesktop.org>; Thu, 11 Mar 2021 18:36:41 +0000 (UTC)
IronPort-SDR: QuAOiBAb18L8GH/N5Lk3bHCk374n93Puu6T3KvZEzDelij5optcvWricwQ3gwFeowO+x2bN57x
 llEzZ39lKQfQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9920"; a="176310870"
X-IronPort-AV: E=Sophos;i="5.81,241,1610438400"; d="scan'208";a="176310870"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2021 10:36:40 -0800
IronPort-SDR: AXqw7gIVVAS/N9kMccgPZVQzTLi3td7Uj0HM/seHYCBgsYcEoB1eGDSnr19Uclc3ILC0TLWV+w
 2aIltYkuiU7w==
X-IronPort-AV: E=Sophos;i="5.81,241,1610438400"; d="scan'208";a="589312440"
Received: from sdhanava-desk2.jf.intel.com ([10.165.21.144])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2021 10:36:40 -0800
From: Swathi Dhanavanthri <swathi.dhanavanthri@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Thu, 11 Mar 2021 10:26:12 -0800
Message-Id: <20210311182612.17004-1-swathi.dhanavanthri@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH] drm/i915: Add Wa_14011060649
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

This is a permanent workaround for TGL,RKL,DG1 and ADLS.

Signed-off-by: Swathi Dhanavanthri <swathi.dhanavanthri@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_workarounds.c | 23 +++++++++++++++++++++
 drivers/gpu/drm/i915/i915_reg.h             |  3 +++
 2 files changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index 3b4a7da60f0b..683a0446337a 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -1117,11 +1117,34 @@ icl_gt_workarounds_init(struct drm_i915_private *i915, struct i915_wa_list *wal)
 			    L3_CLKGATE_DIS | L3_CR2X_CLKGATE_DIS);
 }
 
+/*
+ * This is a common function for WA 14011060649
+ */
+static void
+wa_14011060649(struct drm_i915_private *i915, struct i915_wa_list *wal)
+{
+	struct intel_engine_cs *engine;
+	struct intel_gt *gt = &i915->gt;
+	int id;
+
+	for_each_engine(engine, gt, id) {
+		if ((engine->class != VIDEO_DECODE_CLASS) ||
+		    (engine->instance % 2))
+			continue;
+
+		wa_write_or(wal, VDBOX_CGCTL3F10(engine->mmio_base),
+			    IECPUNIT_CLKGATE_DIS);
+	}
+}
+
 static void
 gen12_gt_workarounds_init(struct drm_i915_private *i915,
 			  struct i915_wa_list *wal)
 {
 	wa_init_mcr(i915, wal);
+
+	/* Wa_14011060649:tgl,rkl,dg1,adls */
+	wa_14011060649(i915, wal);
 }
 
 static void
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index e5dd0203991b..cc60556306e2 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -2715,6 +2715,9 @@ static inline bool i915_mmio_reg_valid(i915_reg_t reg)
 #define RING_INDIRECT_CTX_OFFSET(base)	_MMIO((base) + 0x1c8) /* gen8+ */
 #define RING_CTX_TIMESTAMP(base)	_MMIO((base) + 0x3a8) /* gen8+ */
 
+#define VDBOX_CGCTL3F10(base)		_MMIO((base) + 0x3f10)
+#define   IECPUNIT_CLKGATE_DIS		REG_BIT(22)
+
 #define ERROR_GEN6	_MMIO(0x40a0)
 #define GEN7_ERR_INT	_MMIO(0x44040)
 #define   ERR_INT_POISON		(1 << 31)
-- 
2.20.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
