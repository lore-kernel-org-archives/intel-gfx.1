Return-Path: <SRS0=AA48=MI=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 225F1C636CE
	for <intel-gfx@archiver.kernel.org>; Fri, 16 Jul 2021 20:01:06 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8FF0613F3
	for <intel-gfx@archiver.kernel.org>; Fri, 16 Jul 2021 20:01:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D8FF0613F3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BFE66EA21;
	Fri, 16 Jul 2021 19:59:48 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DE736E9ED;
 Fri, 16 Jul 2021 19:59:41 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10047"; a="210596735"
X-IronPort-AV: E=Sophos;i="5.84,245,1620716400"; d="scan'208";a="210596735"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2021 12:59:41 -0700
X-IronPort-AV: E=Sophos;i="5.84,245,1620716400"; d="scan'208";a="507238981"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2021 12:59:40 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Date: Fri, 16 Jul 2021 13:17:01 -0700
Message-Id: <20210716201724.54804-29-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210716201724.54804-1-matthew.brost@intel.com>
References: <20210716201724.54804-1-matthew.brost@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 28/51] drm/i915/guc: Add disable interrupts to
 guc sanitize
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

Add disable GuC interrupts to intel_guc_sanitize(). Part of this
requires moving the guc_*_interrupt wrapper function into header file
intel_guc.h.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc.h | 16 ++++++++++++++++
 drivers/gpu/drm/i915/gt/uc/intel_uc.c  | 21 +++------------------
 2 files changed, 19 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
index d75a76882a44..b3cfc52fe0bc 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
@@ -217,9 +217,25 @@ static inline bool intel_guc_is_ready(struct intel_guc *guc)
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
index f0b02200aa01..ab11fe731ee7 100644
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
