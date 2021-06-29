Return-Path: <SRS0=NZj8=LX=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C5A5C11F67
	for <intel-gfx@archiver.kernel.org>; Tue, 29 Jun 2021 23:20:59 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4605E61D56
	for <intel-gfx@archiver.kernel.org>; Tue, 29 Jun 2021 23:20:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4605E61D56
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC8CB6E0AD;
	Tue, 29 Jun 2021 23:20:58 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDC6D6E0AD
 for <intel-gfx@lists.freedesktop.org>; Tue, 29 Jun 2021 23:20:57 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10030"; a="206435600"
X-IronPort-AV: E=Sophos;i="5.83,310,1616482800"; d="scan'208";a="206435600"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2021 16:20:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,310,1616482800"; d="scan'208";a="476111780"
Received: from anushasr-mobl6.jf.intel.com ([10.165.21.155])
 by fmsmga004.fm.intel.com with ESMTP; 29 Jun 2021 16:20:56 -0700
From: Anusha Srivatsa <anusha.srivatsa@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue, 29 Jun 2021 16:20:48 -0700
Message-Id: <20210629232049.7584-1-anusha.srivatsa@intel.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Intel-gfx] [RFC 1/2] drm/i915/dmc: Add soc stepping to intel_step
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

DMC firmware looks for SOC stepping to load specific firmware.
While we maintained a separate lookup table, lets consolidate
SOC steppings with gt and display steppings.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
---
 drivers/gpu/drm/i915/intel_step.c | 46 +++++++++++++++----------------
 drivers/gpu/drm/i915/intel_step.h | 13 +++++++++
 2 files changed, 36 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/i915/intel_step.c b/drivers/gpu/drm/i915/intel_step.c
index ba9479a67521..bc139c7e3e37 100644
--- a/drivers/gpu/drm/i915/intel_step.c
+++ b/drivers/gpu/drm/i915/intel_step.c
@@ -16,42 +16,42 @@
 
 /* FIXME: what about REVID_E0 */
 static const struct intel_step_info kbl_revids[] = {
-	[0] = { .gt_step = STEP_A0, .display_step = STEP_A0 },
-	[1] = { .gt_step = STEP_B0, .display_step = STEP_B0 },
-	[2] = { .gt_step = STEP_C0, .display_step = STEP_B0 },
-	[3] = { .gt_step = STEP_D0, .display_step = STEP_B0 },
-	[4] = { .gt_step = STEP_F0, .display_step = STEP_C0 },
-	[5] = { .gt_step = STEP_C0, .display_step = STEP_B1 },
-	[6] = { .gt_step = STEP_D1, .display_step = STEP_B1 },
-	[7] = { .gt_step = STEP_G0, .display_step = STEP_C0 },
+	[0] = { .gt_step = STEP_A0, .display_step = STEP_A0, .soc_step = STEP_G0 },
+	[1] = { .gt_step = STEP_B0, .display_step = STEP_B0, .soc_step = STEP_A0 },
+	[2] = { .gt_step = STEP_C0, .display_step = STEP_B0, .soc_step = STEP_H0 },
+	[3] = { .gt_step = STEP_D0, .display_step = STEP_B0, .soc_step = STEP_J0 },
+	[4] = { .gt_step = STEP_F0, .display_step = STEP_C0, .soc_step = STEP_B0 },
+	[5] = { .gt_step = STEP_C0, .display_step = STEP_B1, .soc_step = STEP_H5 },
+	[6] = { .gt_step = STEP_D1, .display_step = STEP_B1, .soc_step = STEP_J1 },
+	[7] = { .gt_step = STEP_G0, .display_step = STEP_C0, .soc_step = STEP_Y0 },
 };
 
 static const struct intel_step_info tgl_uy_revid_step_tbl[] = {
-	[0] = { .gt_step = STEP_A0, .display_step = STEP_A0 },
-	[1] = { .gt_step = STEP_B0, .display_step = STEP_C0 },
-	[2] = { .gt_step = STEP_B1, .display_step = STEP_C0 },
-	[3] = { .gt_step = STEP_C0, .display_step = STEP_D0 },
+	[0] = { .gt_step = STEP_A0, .display_step = STEP_A0, .soc_step = STEP_A0 },
+	[1] = { .gt_step = STEP_B0, .display_step = STEP_C0, .soc_step = STEP_B2 },
+	[2] = { .gt_step = STEP_B1, .display_step = STEP_C0, .soc_step = STEP_B10 },
+	[3] = { .gt_step = STEP_C0, .display_step = STEP_D0, .soc_step = STEP_C0 },
 };
 
 /* Same GT stepping between tgl_uy_revids and tgl_revids don't mean the same HW */
 static const struct intel_step_info tgl_revid_step_tbl[] = {
-	[0] = { .gt_step = STEP_A0, .display_step = STEP_B0 },
-	[1] = { .gt_step = STEP_B0, .display_step = STEP_D0 },
+	[0] = { .gt_step = STEP_A0, .display_step = STEP_B0, .soc_step = STEP_P0 },
+	[1] = { .gt_step = STEP_B0, .display_step = STEP_D0, .soc_step = STEP_R0 },
 };
 
 static const struct intel_step_info adls_revid_step_tbl[] = {
-	[0x0] = { .gt_step = STEP_A0, .display_step = STEP_A0 },
-	[0x1] = { .gt_step = STEP_A0, .display_step = STEP_A2 },
-	[0x4] = { .gt_step = STEP_B0, .display_step = STEP_B0 },
-	[0x8] = { .gt_step = STEP_C0, .display_step = STEP_B0 },
-	[0xC] = { .gt_step = STEP_D0, .display_step = STEP_C0 },
+	[0x0] = { .gt_step = STEP_A0, .display_step = STEP_A0, .soc_step = STEP_A0 },
+	[0x1] = { .gt_step = STEP_A0, .display_step = STEP_A2, .soc_step = STEP_A2 },
+	[0x4] = { .gt_step = STEP_B0, .display_step = STEP_B0, .soc_step = STEP_B0 },
+	[0x8] = { .gt_step = STEP_C0, .display_step = STEP_B0, .soc_step = STEP_G0 },
+	[0xC] = { .gt_step = STEP_D0, .display_step = STEP_C0, .soc_step = STEP_H0 },
 };
 
 static const struct intel_step_info adlp_revid_step_tbl[] = {
-	[0x0] = { .gt_step = STEP_A0, .display_step = STEP_A0 },
-	[0x4] = { .gt_step = STEP_B0, .display_step = STEP_B0 },
-	[0x8] = { .gt_step = STEP_C0, .display_step = STEP_C0 },
-	[0xC] = { .gt_step = STEP_C0, .display_step = STEP_D0 },
+	[0x0] = { .gt_step = STEP_A0, .display_step = STEP_A0, .soc_step = STEP_J0 },
+	[0x4] = { .gt_step = STEP_B0, .display_step = STEP_B0, .soc_step = STEP_Q0 },
+	[0x8] = { .gt_step = STEP_C0, .display_step = STEP_C0, .soc_step = STEP_K0 },
+	[0xC] = { .gt_step = STEP_C0, .display_step = STEP_D0, .soc_step = STEP_L0 },
 };
 
 void intel_step_init(struct drm_i915_private *i915)
diff --git a/drivers/gpu/drm/i915/intel_step.h b/drivers/gpu/drm/i915/intel_step.h
index 958a8bb5d677..2b0b0aaffe27 100644
--- a/drivers/gpu/drm/i915/intel_step.h
+++ b/drivers/gpu/drm/i915/intel_step.h
@@ -13,6 +13,7 @@ struct drm_i915_private;
 struct intel_step_info {
 	u8 gt_step;
 	u8 display_step;
+	u8 soc_step;
 };
 
 /*
@@ -25,12 +26,24 @@ enum intel_step {
 	STEP_A2,
 	STEP_B0,
 	STEP_B1,
+	STEP_B2,
+	STEP_B10,
 	STEP_C0,
 	STEP_D0,
 	STEP_D1,
 	STEP_E0,
 	STEP_F0,
 	STEP_G0,
+	STEP_H0,
+	STEP_H5,
+	STEP_J0,
+	STEP_J1,
+	STEP_K0,
+	STEP_L0,
+	STEP_P0,
+	STEP_Q0,
+	STEP_R0,
+	STEP_Y0,
 	STEP_FUTURE,
 	STEP_FOREVER,
 };
-- 
2.32.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
