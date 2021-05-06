Return-Path: <SRS0=MDkJ=KB=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15C68C43460
	for <intel-gfx@archiver.kernel.org>; Thu,  6 May 2021 18:59:13 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D384361001
	for <intel-gfx@archiver.kernel.org>; Thu,  6 May 2021 18:59:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D384361001
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8A8D6EDE1;
	Thu,  6 May 2021 18:57:34 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D0916ED72;
 Thu,  6 May 2021 18:57:14 +0000 (UTC)
IronPort-SDR: SZfuize+8TVSG//MBkOdCXOil83qLlNc7Zpoqc4Zp3ovhmYZlAYqRFOwNkGqv/N8xQQd44sBhS
 ubwc9mnf76wA==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="196531027"
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="196531027"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 11:57:13 -0700
IronPort-SDR: LBqKg+Ojkvw0BFT/EGk7LSbKMjpQtadGAX3LtYLtn7To/m7KckSRY1FGpkrdl1Eq8YsFI3R6pO
 +TdcpPiCB3Gw==
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="469583569"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 11:57:12 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Date: Thu,  6 May 2021 12:14:20 -0700
Message-Id: <20210506191451.77768-67-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210506191451.77768-1-matthew.brost@intel.com>
References: <20210506191451.77768-1-matthew.brost@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [RFC PATCH 66/97] drm/i915/guc: Add disable interrupts
 to guc sanitize
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
Cc: jason.ekstrand@intel.com, daniel.vetter@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Add disable GuC interrupts to intel_guc_sanitize(). Part of this
requires moving the guc_*_interrupt wrapper function into header file
intel_guc.h.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com
---
 drivers/gpu/drm/i915/gt/uc/intel_guc.h | 16 ++++++++++++++++
 drivers/gpu/drm/i915/gt/uc/intel_uc.c  | 21 +++------------------
 2 files changed, 19 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
index afea04d56494..277b4496a20e 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
@@ -218,9 +218,25 @@ static inline bool intel_guc_is_ready(struct intel_guc *guc)
 	return intel_guc_is_fw_running(guc) && intel_guc_ct_enabled(&guc->ct);
 }
 
+static inline void intel_guc_reset_interrupts(struct intel_guc *guc)
+{
+	guc->interrupts.reset(guc);
+}
+
+static inline void intel_guc_enable_interrupts(struct intel_guc *guc)
+{
+	guc->interrupts.enable(guc);
+}
+
+static inline void intel_guc_disable_interrupts(struct intel_guc *guc)
+{
+	guc->interrupts.disable(guc);
+}
+
 static inline int intel_guc_sanitize(struct intel_guc *guc)
 {
 	intel_uc_fw_sanitize(&guc->fw);
+	intel_guc_disable_interrupts(guc);
 	intel_guc_ct_sanitize(&guc->ct);
 	guc->mmio_msg = 0;
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
index d5ccffbb89ae..67c1e15845aa 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
@@ -207,21 +207,6 @@ static void guc_handle_mmio_msg(struct intel_guc *guc)
 	spin_unlock_irq(&guc->irq_lock);
 }
 
-static void guc_reset_interrupts(struct intel_guc *guc)
-{
-	guc->interrupts.reset(guc);
-}
-
-static void guc_enable_interrupts(struct intel_guc *guc)
-{
-	guc->interrupts.enable(guc);
-}
-
-static void guc_disable_interrupts(struct intel_guc *guc)
-{
-	guc->interrupts.disable(guc);
-}
-
 static int guc_enable_communication(struct intel_guc *guc)
 {
 	struct intel_gt *gt = guc_to_gt(guc);
@@ -242,7 +227,7 @@ static int guc_enable_communication(struct intel_guc *guc)
 	guc_get_mmio_msg(guc);
 	guc_handle_mmio_msg(guc);
 
-	guc_enable_interrupts(guc);
+	intel_guc_enable_interrupts(guc);
 
 	/* check for CT messages received before we enabled interrupts */
 	spin_lock_irq(&gt->irq_lock);
@@ -265,7 +250,7 @@ static void guc_disable_communication(struct intel_guc *guc)
 	 */
 	guc_clear_mmio_msg(guc);
 
-	guc_disable_interrupts(guc);
+	intel_guc_disable_interrupts(guc);
 
 	intel_guc_ct_disable(&guc->ct);
 
@@ -463,7 +448,7 @@ static int __uc_init_hw(struct intel_uc *uc)
 	if (ret)
 		goto err_out;
 
-	guc_reset_interrupts(guc);
+	intel_guc_reset_interrupts(guc);
 
 	/* WaEnableuKernelHeaderValidFix:skl */
 	/* WaEnableGuCBootHashCheckNotSet:skl,bxt,kbl */
-- 
2.28.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
