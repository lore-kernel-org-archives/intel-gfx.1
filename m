Return-Path: <SRS0=Ca3j=E3=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 451A2C5519F
	for <intel-gfx@archiver.kernel.org>; Sat, 21 Nov 2020 00:36:00 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00F5C23A65
	for <intel-gfx@archiver.kernel.org>; Sat, 21 Nov 2020 00:35:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 00F5C23A65
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CFD56E95D;
	Sat, 21 Nov 2020 00:35:47 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 222CA6E943
 for <Intel-gfx@lists.freedesktop.org>; Sat, 21 Nov 2020 00:35:42 +0000 (UTC)
IronPort-SDR: ViukqRdoI8dM77XrMQpdMKCwJ0BMG1nm2bFLPteTyrOeWXcBSq6CX6g7OLmPmRjvXmS+8L6+6O
 EDG16wZydlNQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9811"; a="235707198"
X-IronPort-AV: E=Sophos;i="5.78,357,1599548400"; d="scan'208";a="235707198"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2020 16:35:41 -0800
IronPort-SDR: JZguue4Rq++q3FDwQpwPAGO/hClm8zpI3SM3MFUcM5GTSNpxPshzEgayM/1P3DEDdIsRW03IFR
 +JpW29VImGZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,357,1599548400"; d="scan'208";a="369352673"
Received: from sean-virtualbox.fm.intel.com ([10.105.158.96])
 by FMSMGA003.fm.intel.com with ESMTP; 20 Nov 2020 16:35:40 -0800
From: "Huang, Sean Z" <sean.z.huang@intel.com>
To: Intel-gfx@lists.freedesktop.org
Date: Fri, 20 Nov 2020 16:35:18 -0800
Message-Id: <20201121003540.24980-5-sean.z.huang@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201121003540.24980-1-sean.z.huang@intel.com>
References: <20201121003540.24980-1-sean.z.huang@intel.com>
Subject: [Intel-gfx] [RFC-v2 04/26] drm/i915/pxp: set KCR reg init during
 the boot time
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Set the KCR init during the boot time, which is required by
hardware, to allow us doing further protection operation such
as sending commands to GPU or TEE

Signed-off-by: Huang, Sean Z <sean.z.huang@intel.com>
---
 drivers/gpu/drm/i915/Makefile           |  1 +
 drivers/gpu/drm/i915/pxp/intel_pxp.c    | 11 ++++++-
 drivers/gpu/drm/i915/pxp/intel_pxp_sm.c | 38 +++++++++++++++++++++++++
 drivers/gpu/drm/i915/pxp/intel_pxp_sm.h | 20 +++++++++++++
 4 files changed, 69 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_sm.c
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_sm.h

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 831e8ad57560..81432a9f44d6 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -258,6 +258,7 @@ i915-y += i915_perf.o
 i915-y += \
 	pxp/intel_pxp.o \
 	pxp/intel_pxp_context.o \
+	pxp/intel_pxp_sm.o
 
 # Post-mortem debug and GPU hang state capture
 i915-$(CONFIG_DRM_I915_CAPTURE_ERROR) += i915_gpu_error.o
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.c b/drivers/gpu/drm/i915/pxp/intel_pxp.c
index b6c44b196e9a..f6b7297ee045 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp.c
@@ -6,6 +6,7 @@
 #include "i915_drv.h"
 #include "intel_pxp.h"
 #include "intel_pxp_context.h"
+#include "intel_pxp_sm.h"
 
 static void intel_pxp_write_irq_mask_reg(struct drm_i915_private *i915, u32 mask)
 {
@@ -79,6 +80,8 @@ static void intel_pxp_irq_work(struct work_struct *work)
 
 int intel_pxp_init(struct drm_i915_private *i915)
 {
+	int ret;
+
 	drm_info(&i915->drm, "i915 PXP is inited with i915=[%p]\n", i915);
 
 	i915->pxp.ctx = intel_pxp_create_ctx(i915);
@@ -87,13 +90,19 @@ int intel_pxp_init(struct drm_i915_private *i915)
 		return -EFAULT;
 	}
 
+	ret = pxp_sm_set_kcr_init_reg(i915);
+	if (ret) {
+		drm_err(&i915->drm, "Failed to set kcr init reg\n");
+		return ret;
+	}
+
 	INIT_WORK(&i915->pxp.irq_work, intel_pxp_irq_work);
 
 	i915->pxp.handled_irr = (PXP_IRQ_VECTOR_DISPLAY_PXP_STATE_TERMINATED |
 				 PXP_IRQ_VECTOR_DISPLAY_APP_TERM_PER_FW_REQ |
 				 PXP_IRQ_VECTOR_PXP_DISP_STATE_RESET_COMPLETE);
 
-	return 0;
+	return ret;
 }
 
 void intel_pxp_uninit(struct drm_i915_private *i915)
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_sm.c b/drivers/gpu/drm/i915/pxp/intel_pxp_sm.c
new file mode 100644
index 000000000000..a2c9c71d2372
--- /dev/null
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_sm.c
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright(c) 2020, Intel Corporation. All rights reserved.
+ */
+
+#include "gt/intel_context.h"
+#include "gt/intel_engine_pm.h"
+
+#include "intel_pxp.h"
+#include "intel_pxp_sm.h"
+#include "intel_pxp_context.h"
+
+static int pxp_reg_write(struct drm_i915_private *i915, u32 offset, u32 regval)
+{
+	intel_wakeref_t wakeref;
+
+	if (!i915)
+		return -EINVAL;
+
+	with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
+		i915_reg_t reg_offset = {offset};
+
+		intel_uncore_write(&i915->uncore, reg_offset, regval);
+	}
+
+	return 0;
+}
+
+int pxp_sm_set_kcr_init_reg(struct drm_i915_private *i915)
+{
+	int ret;
+
+	ret = pxp_reg_write(i915, KCR_INIT.reg, KCR_INIT_ALLOW_DISPLAY_ME_WRITES);
+	if (ret)
+		drm_err(&i915->drm, "Failed to write()\n");
+
+	return ret;
+}
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_sm.h b/drivers/gpu/drm/i915/pxp/intel_pxp_sm.h
new file mode 100644
index 000000000000..d061f395aa16
--- /dev/null
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_sm.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright(c) 2020, Intel Corporation. All rights reserved.
+ */
+
+#ifndef __INTEL_PXP_SM_H__
+#define __INTEL_PXP_SM_H__
+
+#include "i915_drv.h"
+#include "i915_reg.h"
+
+/* KCR register definitions */
+#define KCR_INIT            _MMIO(0x320f0)
+#define KCR_INIT_MASK_SHIFT (16)
+/* Setting KCR Init bit is required after system boot */
+#define KCR_INIT_ALLOW_DISPLAY_ME_WRITES (BIT(14) | (BIT(14) << KCR_INIT_MASK_SHIFT))
+
+int pxp_sm_set_kcr_init_reg(struct drm_i915_private *i915);
+
+#endif /* __INTEL_PXP_SM_H__ */
-- 
2.17.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
