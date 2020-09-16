Return-Path: <SRS0=Ht+W=CZ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92899C433E2
	for <intel-gfx@archiver.kernel.org>; Wed, 16 Sep 2020 17:17:06 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CAFA223D6
	for <intel-gfx@archiver.kernel.org>; Wed, 16 Sep 2020 17:17:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CAFA223D6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=Intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CEF56EA8E;
	Wed, 16 Sep 2020 17:17:03 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94D536EA88
 for <Intel-GFX@lists.freedesktop.org>; Wed, 16 Sep 2020 17:16:55 +0000 (UTC)
IronPort-SDR: 9yJCkg1FNR5i4kt01lfGvoFsjjGAseoWqWoCJze/DSQAjYL05+5tw32Aqt828uB3dwKj11WwK6
 NYD2pMRm9/og==
X-IronPort-AV: E=McAfee;i="6000,8403,9746"; a="139534274"
X-IronPort-AV: E=Sophos;i="5.76,433,1592895600"; d="scan'208";a="139534274"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2020 10:16:55 -0700
IronPort-SDR: sCRkERLkYeq/P/l8xE/APeiYc+AM8PiPVCdqfqH4R9mtvb+Yl8gm3SL4Of5j6GbMmnhVZUr6K8
 p6rdQe/pWgxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,433,1592895600"; d="scan'208";a="287259453"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by fmsmga007.fm.intel.com with ESMTP; 16 Sep 2020 10:16:54 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Date: Wed, 16 Sep 2020 10:16:48 -0700
Message-Id: <20200916171653.2021483-8-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200916171653.2021483-1-John.C.Harrison@Intel.com>
References: <20200916171653.2021483-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
Subject: [Intel-gfx] [PATCH 07/12] drm/i915/guc: Setup doorbells data in ADS
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

From: Michal Wajdeczko <michal.wajdeczko@intel.com>

While i915 does not use GuC doorbells, the firmware requires that some
initialisation is done.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c  | 9 +++++++++
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h | 2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h  | 5 +++++
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
index b2f05139de05..75fcce64fc57 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
@@ -119,6 +119,7 @@ static void guc_mapping_table_init(struct intel_gt *gt,
 static void __guc_ads_init(struct intel_guc *guc)
 {
 	struct intel_gt *gt = guc_to_gt(guc);
+	struct drm_i915_private *i915 = gt->i915;
 	struct __guc_ads_blob *blob = guc->ads_blob;
 	const u32 skipped_size = LRC_PPHWSP_SZ * PAGE_SIZE + LR_HW_CONTEXT_SIZE;
 	u32 base;
@@ -158,6 +159,14 @@ static void __guc_ads_init(struct intel_guc *guc)
 	blob->system_info.vebox_enable_mask = VEBOX_MASK(gt);
 	blob->system_info.vdbox_sfc_support_mask = gt->info.vdbox_sfc_access;
 
+	if (INTEL_GEN(i915) >= 12 && !IS_DGFX(i915)) {
+		u32 distdbreg = intel_uncore_read(gt->uncore,
+						  GEN12_DIST_DBS_POPULATED);
+		blob->system_info.num_of_doorbells_per_sqidi =
+			((distdbreg >> GEN12_DOORBELLS_PER_SQIDI_SHIFT) &
+			 GEN12_DOORBELLS_PER_SQIDI) + 1;
+	}
+
 	guc_mapping_table_init(guc_to_gt(guc), &blob->system_info);
 
 	base = intel_guc_ggtt_offset(guc, guc->ads_vma);
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
index 0cd4a7f7f4cb..3492fb0d5dec 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
@@ -383,7 +383,7 @@ struct guc_gt_system_info {
 	u32 vdbox_enable_mask;
 	u32 vdbox_sfc_support_mask;
 	u32 vebox_enable_mask;
-	u32 reserved1;
+	u32 num_of_doorbells_per_sqidi;
 	u8 mapping_table[GUC_MAX_ENGINE_CLASSES][GUC_MAX_INSTANCES_PER_CLASS];
 	u32 reserved2[8];
 } __packed;
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h
index 1949346e714e..b37fc2ffaef2 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h
@@ -118,6 +118,11 @@ struct guc_doorbell_info {
 #define   GEN8_DRB_VALID		  (1<<0)
 #define GEN8_DRBREGU(x)			_MMIO(0x1000 + (x) * 8 + 4)
 
+#define GEN12_DIST_DBS_POPULATED		_MMIO(0xd08)
+#define   GEN12_DOORBELLS_PER_SQIDI_SHIFT	16
+#define   GEN12_DOORBELLS_PER_SQIDI		(0xff)
+#define   GEN12_SQIDIS_DOORBELL_EXIST		(0xffff)
+
 #define DE_GUCRMR			_MMIO(0x44054)
 
 #define GUC_BCS_RCS_IER			_MMIO(0xC550)
-- 
2.25.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
