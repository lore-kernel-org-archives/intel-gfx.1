Return-Path: <SRS0=ObOY=N5=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BA3AC433FE
	for <intel-gfx@archiver.kernel.org>; Tue,  7 Sep 2021 17:19:38 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C48596108D
	for <intel-gfx@archiver.kernel.org>; Tue,  7 Sep 2021 17:19:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C48596108D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0E396E08C;
	Tue,  7 Sep 2021 17:19:28 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F3F86E088;
 Tue,  7 Sep 2021 17:19:27 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10100"; a="220322734"
X-IronPort-AV: E=Sophos;i="5.85,274,1624345200"; d="scan'208";a="220322734"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2021 10:19:26 -0700
X-IronPort-AV: E=Sophos;i="5.85,274,1624345200"; d="scan'208";a="605352250"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2021 10:19:26 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Matt Roper <matthew.d.roper@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Date: Tue,  7 Sep 2021 10:19:11 -0700
Message-Id: <20210907171916.2548047-4-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20210907171916.2548047-1-matthew.d.roper@intel.com>
References: <20210907171916.2548047-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 3/8] drm/i915/xehp: Add Compute CS IRQ handlers
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

Add execlists and GuC interrupts for compute CS into existing IRQ handlers.

All compute command streamers belong to the same compute class, so the
only change needed to enable their interrupts is to program their GT engine
interrupt mask registers.

CCS0 shares the register with CCS1, while CCS2 and CCS3 are in a new one.

BSpec: 50844, 54029, 54030, 53223, 53224.
Original-patch-by: Michel Thierry
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_irq.c | 15 ++++++++++++++-
 drivers/gpu/drm/i915/i915_drv.h        |  2 ++
 drivers/gpu/drm/i915/i915_reg.h        |  3 +++
 3 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_irq.c b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
index b2de83be4d97..612281d47513 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_irq.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
@@ -96,7 +96,7 @@ gen11_gt_identity_handler(struct intel_gt *gt, const u32 identity)
 	if (unlikely(!intr))
 		return;
 
-	if (class <= COPY_ENGINE_CLASS)
+	if (class <= COPY_ENGINE_CLASS || class == COMPUTE_CLASS)
 		return gen11_engine_irq_handler(gt, class, instance, intr);
 
 	if (class == OTHER_CLASS)
@@ -178,6 +178,8 @@ void gen11_gt_irq_reset(struct intel_gt *gt)
 	/* Disable RCS, BCS, VCS and VECS class engines. */
 	intel_uncore_write(uncore, GEN11_RENDER_COPY_INTR_ENABLE, 0);
 	intel_uncore_write(uncore, GEN11_VCS_VECS_INTR_ENABLE,	  0);
+	if (CCS_MASK(gt))
+		intel_uncore_write(uncore, GEN12_CCS_RSVD_INTR_ENABLE, 0);
 
 	/* Restore masks irqs on RCS, BCS, VCS and VECS engines. */
 	intel_uncore_write(uncore, GEN11_RCS0_RSVD_INTR_MASK,	~0);
@@ -191,6 +193,10 @@ void gen11_gt_irq_reset(struct intel_gt *gt)
 	intel_uncore_write(uncore, GEN11_VECS0_VECS1_INTR_MASK,	~0);
 	if (HAS_ENGINE(gt, VECS2) || HAS_ENGINE(gt, VECS3))
 		intel_uncore_write(uncore, GEN12_VECS2_VECS3_INTR_MASK, ~0);
+	if (HAS_ENGINE(gt, CCS0) || HAS_ENGINE(gt, CCS1))
+		intel_uncore_write(uncore, GEN12_CCS0_CCS1_INTR_MASK, ~0);
+	if (HAS_ENGINE(gt, CCS2) || HAS_ENGINE(gt, CCS3))
+		intel_uncore_write(uncore, GEN12_CCS2_CCS3_INTR_MASK, ~0);
 
 	intel_uncore_write(uncore, GEN11_GPM_WGBOXPERF_INTR_ENABLE, 0);
 	intel_uncore_write(uncore, GEN11_GPM_WGBOXPERF_INTR_MASK,  ~0);
@@ -218,6 +224,8 @@ void gen11_gt_irq_postinstall(struct intel_gt *gt)
 	/* Enable RCS, BCS, VCS and VECS class interrupts. */
 	intel_uncore_write(uncore, GEN11_RENDER_COPY_INTR_ENABLE, dmask);
 	intel_uncore_write(uncore, GEN11_VCS_VECS_INTR_ENABLE, dmask);
+	if (CCS_MASK(gt))
+		intel_uncore_write(uncore, GEN12_CCS_RSVD_INTR_ENABLE, smask);
 
 	/* Unmask irqs on RCS, BCS, VCS and VECS engines. */
 	intel_uncore_write(uncore, GEN11_RCS0_RSVD_INTR_MASK, ~smask);
@@ -231,6 +239,11 @@ void gen11_gt_irq_postinstall(struct intel_gt *gt)
 	intel_uncore_write(uncore, GEN11_VECS0_VECS1_INTR_MASK, ~dmask);
 	if (HAS_ENGINE(gt, VECS2) || HAS_ENGINE(gt, VECS3))
 		intel_uncore_write(uncore, GEN12_VECS2_VECS3_INTR_MASK, ~dmask);
+	if (HAS_ENGINE(gt, CCS0) || HAS_ENGINE(gt, CCS1))
+		intel_uncore_write(uncore, GEN12_CCS0_CCS1_INTR_MASK, ~dmask);
+	if (HAS_ENGINE(gt, CCS2) || HAS_ENGINE(gt, CCS3))
+		intel_uncore_write(uncore, GEN12_CCS2_CCS3_INTR_MASK, ~dmask);
+
 	/*
 	 * RPS interrupts will get enabled/disabled on demand when RPS itself
 	 * is enabled/disabled.
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 1fd3040b6771..5b6eee5d8ade 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -1573,6 +1573,8 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
 	ENGINE_INSTANCES_MASK(gt, VCS0, I915_MAX_VCS)
 #define VEBOX_MASK(gt) \
 	ENGINE_INSTANCES_MASK(gt, VECS0, I915_MAX_VECS)
+#define CCS_MASK(gt) \
+	ENGINE_INSTANCES_MASK(gt, CCS0, I915_MAX_CCS)
 
 /*
  * The Gen7 cmdparser copies the scanned buffer to the ggtt for execution
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 33d6aa0b07c1..31e9c2cc4c0c 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -8139,6 +8139,7 @@ enum {
 #define GEN11_GPM_WGBOXPERF_INTR_ENABLE	_MMIO(0x19003c)
 #define GEN11_CRYPTO_RSVD_INTR_ENABLE	_MMIO(0x190040)
 #define GEN11_GUNIT_CSME_INTR_ENABLE	_MMIO(0x190044)
+#define GEN12_CCS_RSVD_INTR_ENABLE	_MMIO(0x190048)
 
 #define GEN11_RCS0_RSVD_INTR_MASK	_MMIO(0x190090)
 #define GEN11_BCS_RSVD_INTR_MASK	_MMIO(0x1900a0)
@@ -8152,6 +8153,8 @@ enum {
 #define GEN11_GPM_WGBOXPERF_INTR_MASK	_MMIO(0x1900ec)
 #define GEN11_CRYPTO_RSVD_INTR_MASK	_MMIO(0x1900f0)
 #define GEN11_GUNIT_CSME_INTR_MASK	_MMIO(0x1900f4)
+#define GEN12_CCS0_CCS1_INTR_MASK	_MMIO(0x190100)
+#define GEN12_CCS2_CCS3_INTR_MASK	_MMIO(0x190104)
 
 #define   ENGINE1_MASK			REG_GENMASK(31, 16)
 #define   ENGINE0_MASK			REG_GENMASK(15, 0)
-- 
2.25.4

