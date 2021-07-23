Return-Path: <SRS0=oFzv=MP=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F6CFC4320A
	for <intel-gfx@archiver.kernel.org>; Fri, 23 Jul 2021 17:43:15 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0D6660EFD
	for <intel-gfx@archiver.kernel.org>; Fri, 23 Jul 2021 17:43:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D0D6660EFD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 407526FBA7;
	Fri, 23 Jul 2021 17:43:12 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1748D6FB9F
 for <intel-gfx@lists.freedesktop.org>; Fri, 23 Jul 2021 17:43:06 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10054"; a="275742983"
X-IronPort-AV: E=Sophos;i="5.84,264,1620716400"; d="scan'208";a="275742983"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2021 10:42:51 -0700
X-IronPort-AV: E=Sophos;i="5.84,264,1620716400"; d="scan'208";a="463229090"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2021 10:42:50 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Fri, 23 Jul 2021 10:42:26 -0700
Message-Id: <20210723174239.1551352-18-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20210723174239.1551352-1-matthew.d.roper@intel.com>
References: <20210723174239.1551352-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v3 17/30] drm/i915/dg2: Update LNCF steering
 ranges
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

DG2's replicated register ranges are almost the same at XeHP SDV with
the exception of one LNCF sub-range that switches to gslice steering.
We can re-use the XeHP SDV mslice steering table and just provide a
DG2-specific LNCF steering table.

Bspec: 66534
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index 4c9b5d2725e1..54dec0f98775 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -103,6 +103,12 @@ static const struct intel_mmio_range xehpsdv_lncf_steering_table[] = {
 	{},
 };
 
+static const struct intel_mmio_range dg2_lncf_steering_table[] = {
+	{ 0x00B000, 0x00B0FF },
+	{ 0x00D880, 0x00D8FF },
+	{},
+};
+
 static u16 slicemask(struct intel_gt *gt, int count)
 {
 	u64 dss_mask = intel_sseu_get_subslices(&gt->info.sseu, 0);
@@ -127,7 +133,10 @@ int intel_gt_init_mmio(struct intel_gt *gt)
 			(intel_uncore_read(gt->uncore, GEN10_MIRROR_FUSE3) &
 			 GEN12_MEML3_EN_MASK);
 
-	if (IS_XEHPSDV(gt->i915)) {
+	if (IS_DG2(gt->i915)) {
+		gt->steering_table[MSLICE] = xehpsdv_mslice_steering_table;
+		gt->steering_table[LNCF] = dg2_lncf_steering_table;
+	} else if (IS_XEHPSDV(gt->i915)) {
 		gt->steering_table[MSLICE] = xehpsdv_mslice_steering_table;
 		gt->steering_table[LNCF] = xehpsdv_lncf_steering_table;
 	} else if (GRAPHICS_VER(gt->i915) >= 11 &&
-- 
2.25.4

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
