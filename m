Return-Path: <SRS0=MAHO=MV=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD78CC43216
	for <intel-gfx@archiver.kernel.org>; Thu, 29 Jul 2021 17:00:34 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7AD0A608FB
	for <intel-gfx@archiver.kernel.org>; Thu, 29 Jul 2021 17:00:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7AD0A608FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33B206EE01;
	Thu, 29 Jul 2021 17:00:24 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEB7A6EDFA
 for <intel-gfx@lists.freedesktop.org>; Thu, 29 Jul 2021 17:00:22 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10060"; a="212966815"
X-IronPort-AV: E=Sophos;i="5.84,279,1620716400"; d="scan'208";a="212966815"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2021 10:00:22 -0700
X-IronPort-AV: E=Sophos;i="5.84,279,1620716400"; d="scan'208";a="417712147"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2021 10:00:22 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Thu, 29 Jul 2021 09:59:59 -0700
Message-Id: <20210729170008.2836648-10-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20210729170008.2836648-1-matthew.d.roper@intel.com>
References: <20210729170008.2836648-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v4 09/18] drm/i915/xehpsdv: Add maximum sseu
 limits
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

Due to the removal of legacy slices and the transition to a
gslice/cslice/mslice/etc. design, we'll internally store all DSS under
"slice0."

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Caz Yokoyama <caz.yokoyama@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_sseu.c         | 5 ++++-
 drivers/gpu/drm/i915/gt/intel_sseu.h         | 2 +-
 drivers/gpu/drm/i915/gt/intel_sseu_debugfs.c | 2 +-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_sseu.c b/drivers/gpu/drm/i915/gt/intel_sseu.c
index 5d1b7d06c96b..16c0552fcd1d 100644
--- a/drivers/gpu/drm/i915/gt/intel_sseu.c
+++ b/drivers/gpu/drm/i915/gt/intel_sseu.c
@@ -145,7 +145,10 @@ static void gen12_sseu_info_init(struct intel_gt *gt)
 	 * across the entire device. Then calculate out the DSS for each
 	 * workload type within that software slice.
 	 */
-	intel_sseu_set_info(sseu, 1, 6, 16);
+	if (IS_XEHPSDV(gt->i915))
+		intel_sseu_set_info(sseu, 1, 32, 16);
+	else
+		intel_sseu_set_info(sseu, 1, 6, 16);
 
 	/*
 	 * As mentioned above, Xe_HP does not have the concept of a slice.
diff --git a/drivers/gpu/drm/i915/gt/intel_sseu.h b/drivers/gpu/drm/i915/gt/intel_sseu.h
index 74487650b08f..204ea6709460 100644
--- a/drivers/gpu/drm/i915/gt/intel_sseu.h
+++ b/drivers/gpu/drm/i915/gt/intel_sseu.h
@@ -16,7 +16,7 @@ struct intel_gt;
 struct drm_printer;
 
 #define GEN_MAX_SLICES		(6) /* CNL upper bound */
-#define GEN_MAX_SUBSLICES	(8) /* ICL upper bound */
+#define GEN_MAX_SUBSLICES	(32) /* XEHPSDV upper bound */
 #define GEN_SSEU_STRIDE(max_entries) DIV_ROUND_UP(max_entries, BITS_PER_BYTE)
 #define GEN_MAX_SUBSLICE_STRIDE GEN_SSEU_STRIDE(GEN_MAX_SUBSLICES)
 #define GEN_MAX_EUS		(16) /* TGL upper bound */
diff --git a/drivers/gpu/drm/i915/gt/intel_sseu_debugfs.c b/drivers/gpu/drm/i915/gt/intel_sseu_debugfs.c
index 714fe8495775..a424150b052e 100644
--- a/drivers/gpu/drm/i915/gt/intel_sseu_debugfs.c
+++ b/drivers/gpu/drm/i915/gt/intel_sseu_debugfs.c
@@ -53,7 +53,7 @@ static void cherryview_sseu_device_status(struct intel_gt *gt,
 static void gen10_sseu_device_status(struct intel_gt *gt,
 				     struct sseu_dev_info *sseu)
 {
-#define SS_MAX 6
+#define SS_MAX 8
 	struct intel_uncore *uncore = gt->uncore;
 	const struct intel_gt_info *info = &gt->info;
 	u32 s_reg[SS_MAX], eu_reg[2 * SS_MAX], eu_mask[2];
-- 
2.25.4

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
