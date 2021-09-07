Return-Path: <SRS0=ObOY=N5=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20EE7C4332F
	for <intel-gfx@archiver.kernel.org>; Tue,  7 Sep 2021 17:19:51 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E84B16108D
	for <intel-gfx@archiver.kernel.org>; Tue,  7 Sep 2021 17:19:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E84B16108D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA57E6E0AD;
	Tue,  7 Sep 2021 17:19:31 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 301E56E08C;
 Tue,  7 Sep 2021 17:19:28 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10100"; a="220322737"
X-IronPort-AV: E=Sophos;i="5.85,274,1624345200"; d="scan'208";a="220322737"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2021 10:19:27 -0700
X-IronPort-AV: E=Sophos;i="5.85,274,1624345200"; d="scan'208";a="605352263"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2021 10:19:26 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Matt Roper <matthew.d.roper@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Date: Tue,  7 Sep 2021 10:19:15 -0700
Message-Id: <20210907171916.2548047-8-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20210907171916.2548047-1-matthew.d.roper@intel.com>
References: <20210907171916.2548047-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 7/8] drm/i915/xehp: Enable ccs/dual-ctx in
 RCU_MODE
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
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

We have to specify in the Render Control Unit Mode register
when CCS is enabled.

Bspec: 46034
Original-patch-by: Michel Thierry
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 .../drm/i915/gt/intel_execlists_submission.c  | 26 +++++++++++++++++++
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 26 +++++++++++++++++++
 drivers/gpu/drm/i915/i915_reg.h               |  3 +++
 3 files changed, 55 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index 2b36ec7f3a04..046f7da67ba6 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -2874,6 +2874,29 @@ static int execlists_resume(struct intel_engine_cs *engine)
 	return 0;
 }
 
+static int gen12_rcs_resume(struct intel_engine_cs *engine)
+{
+	int ret;
+
+	ret = execlists_resume(engine);
+	if (ret)
+		return ret;
+
+	/*
+	 * Multi Context programming.
+	 * just need to program this register once no matter how many CCS
+	 * engines there are. Since some of the CCS engines might be fused off,
+	 * we can't do this as part of the init of a specific CCS and we do
+	 * it during RCS init instead. RCS and all CCS engines are reset
+	 * together, so post-reset re-init is covered as well.
+	 */
+	if (CCS_MASK(engine->gt))
+		intel_uncore_write(engine->uncore, GEN12_RCU_MODE,
+			   _MASKED_BIT_ENABLE(GEN12_RCU_MODE_CCS_ENABLE));
+
+	return 0;
+}
+
 static void execlists_reset_prepare(struct intel_engine_cs *engine)
 {
 	ENGINE_TRACE(engine, "depth<-%d\n",
@@ -3394,6 +3417,9 @@ static void rcs_submission_override(struct intel_engine_cs *engine)
 		engine->emit_fini_breadcrumb = gen8_emit_fini_breadcrumb_rcs;
 		break;
 	}
+
+	if (engine->class == RENDER_CLASS)
+		engine->resume = gen12_rcs_resume;
 }
 
 int intel_execlists_submission_setup(struct intel_engine_cs *engine)
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 2f5bf7aa7e3b..db956255d076 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -2350,6 +2350,29 @@ static bool guc_sched_engine_disabled(struct i915_sched_engine *sched_engine)
 	return !sched_engine->tasklet.callback;
 }
 
+static int gen12_rcs_resume(struct intel_engine_cs *engine)
+{
+	int ret;
+
+	ret = guc_resume(engine);
+	if (ret)
+		return ret;
+
+	/*
+	 * Multi Context programming.
+	 * just need to program this register once no matter how many CCS
+	 * engines there are. Since some of the CCS engines might be fused off,
+	 * we can't do this as part of the init of a specific CCS and we do
+	 * it during RCS init instead. RCS and all CCS engines are reset
+	 * together, so post-reset re-init is covered as well.
+	 */
+	if (CCS_MASK(engine->gt))
+		intel_uncore_write(engine->uncore, GEN12_RCU_MODE,
+			   _MASKED_BIT_ENABLE(GEN12_RCU_MODE_CCS_ENABLE));
+
+	return 0;
+}
+
 static void guc_set_default_submission(struct intel_engine_cs *engine)
 {
 	engine->submit_request = guc_submit_request;
@@ -2464,6 +2487,9 @@ static void rcs_submission_override(struct intel_engine_cs *engine)
 		engine->emit_fini_breadcrumb = gen8_emit_fini_breadcrumb_rcs;
 		break;
 	}
+
+	if (engine->class == RENDER_CLASS)
+		engine->resume = gen12_rcs_resume;
 }
 
 static inline void guc_default_irqs(struct intel_engine_cs *engine)
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 5b68c02c35af..57f9456f8c61 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -498,6 +498,9 @@ static inline bool i915_mmio_reg_valid(i915_reg_t reg)
 #define   ECOBITS_PPGTT_CACHE64B	(3 << 8)
 #define   ECOBITS_PPGTT_CACHE4B		(0 << 8)
 
+#define GEN12_RCU_MODE			_MMIO(0x14800)
+#define   GEN12_RCU_MODE_CCS_ENABLE	REG_BIT(0)
+
 #define GAB_CTL				_MMIO(0x24000)
 #define   GAB_CTL_CONT_AFTER_PAGEFAULT	(1 << 8)
 
-- 
2.25.4

