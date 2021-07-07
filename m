Return-Path: <SRS0=YrHI=L7=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA715C07E9C
	for <intel-gfx@archiver.kernel.org>; Wed,  7 Jul 2021 05:06:59 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 811D261C99
	for <intel-gfx@archiver.kernel.org>; Wed,  7 Jul 2021 05:06:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 811D261C99
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50AA76E828;
	Wed,  7 Jul 2021 05:06:52 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E85D56E81C
 for <intel-gfx@lists.freedesktop.org>; Wed,  7 Jul 2021 05:06:50 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10037"; a="196406290"
X-IronPort-AV: E=Sophos;i="5.83,330,1616482800"; d="scan'208";a="196406290"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2021 22:06:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,330,1616482800"; d="scan'208";a="457348325"
Received: from anushasr-mobl6.jf.intel.com ([10.165.21.155])
 by orsmga008.jf.intel.com with ESMTP; 06 Jul 2021 22:06:50 -0700
From: Anusha Srivatsa <anusha.srivatsa@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue,  6 Jul 2021 22:06:44 -0700
Message-Id: <20210707050645.31043-8-anusha.srivatsa@intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210707050645.31043-1-anusha.srivatsa@intel.com>
References: <20210707050645.31043-1-anusha.srivatsa@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 7/8] drm/i915/rkl: s/IS_RKL_REVID/IS_RKL_GT_STEP
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

Add stepping info table for RKL.

Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
---
 drivers/gpu/drm/i915/display/intel_psr.c | 4 ++--
 drivers/gpu/drm/i915/i915_drv.h          | 9 +++------
 drivers/gpu/drm/i915/intel_step.c        | 9 +++++++++
 3 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 9643624fe160..818153007970 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -594,7 +594,7 @@ static void hsw_activate_psr2(struct intel_dp *intel_dp)
 	if (intel_dp->psr.psr2_sel_fetch_enabled) {
 		/* WA 1408330847 */
 		if (IS_TGL_DISPLAY_STEP(dev_priv, STEP_A0, STEP_A0) ||
-		    IS_RKL_REVID(dev_priv, RKL_REVID_A0, RKL_REVID_A0))
+		    IS_RKL_GT_STEP(dev_priv, STEP_A0, STEP_A0))
 			intel_de_rmw(dev_priv, CHICKEN_PAR1_1,
 				     DIS_RAM_BYPASS_PSR2_MAN_TRACK,
 				     DIS_RAM_BYPASS_PSR2_MAN_TRACK);
@@ -1342,7 +1342,7 @@ static void intel_psr_disable_locked(struct intel_dp *intel_dp)
 	/* WA 1408330847 */
 	if (intel_dp->psr.psr2_sel_fetch_enabled &&
 	    (IS_TGL_DISPLAY_STEP(dev_priv, STEP_A0, STEP_A0) ||
-	     IS_RKL_REVID(dev_priv, RKL_REVID_A0, RKL_REVID_A0)))
+	     IS_RKL_GT_STEP(dev_priv, STEP_A0, STEP_A0)))
 		intel_de_rmw(dev_priv, CHICKEN_PAR1_1,
 			     DIS_RAM_BYPASS_PSR2_MAN_TRACK, 0);
 
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index e9156d1a89a7..74a30d55fcb7 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -1511,12 +1511,9 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
 	(IS_TIGERLAKE(__i915) && !(IS_TGL_U(__i915) || IS_TGL_Y(__i915)) && \
 	 IS_GT_STEP(__i915, since, until))
 
-#define RKL_REVID_A0		0x0
-#define RKL_REVID_B0		0x1
-#define RKL_REVID_C0		0x4
-
-#define IS_RKL_REVID(p, since, until) \
-	(IS_ROCKETLAKE(p) && IS_REVID(p, since, until))
+#define IS_RKL_GT_STEP(__i915, since, until) \
+	(IS_ROCKETLAKE(__i915) && \
+	 IS_GT_STEP(__i915, since, until))
 
 #define DG1_REVID_A0		0x0
 #define DG1_REVID_B0		0x1
diff --git a/drivers/gpu/drm/i915/intel_step.c b/drivers/gpu/drm/i915/intel_step.c
index a7144f24921e..2a97d1703e5a 100644
--- a/drivers/gpu/drm/i915/intel_step.c
+++ b/drivers/gpu/drm/i915/intel_step.c
@@ -76,6 +76,12 @@ static const struct intel_step_info tgl_revids[] = {
 	[1] = { .gt_step = STEP_B0, .display_step = STEP_D0 },
 };
 
+static const struct intel_step_info rkl_revids[] = {
+	[0x0] = { .gt_step = STEP_A0 },
+	[0x1] = { .gt_step = STEP_B0 },
+	[0x4] = { .gt_step = STEP_C0 },
+};
+
 static const struct intel_step_info adls_revids[] = {
 	[0x0] = { .gt_step = STEP_A0, .display_step = STEP_A0 },
 	[0x1] = { .gt_step = STEP_A0, .display_step = STEP_A2 },
@@ -107,6 +113,9 @@ void intel_step_init(struct drm_i915_private *i915)
 	} else if (IS_TGL_U(i915) || IS_TGL_Y(i915)) {
 		revids = tgl_uy_revids;
 		size = ARRAY_SIZE(tgl_uy_revids);
+	} else if (IS_ROCKETLAKE(i915)) {
+		revids = rkl_revids;
+		size = ARRAY_SIZE(rkl_revids);
 	} else if (IS_TIGERLAKE(i915)) {
 		revids = tgl_revids;
 		size = ARRAY_SIZE(tgl_revids);
-- 
2.32.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
