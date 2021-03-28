Return-Path: <SRS0=JRju=I2=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2083BC433C1
	for <intel-gfx@archiver.kernel.org>; Sun, 28 Mar 2021 22:57:51 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DACE461864
	for <intel-gfx@archiver.kernel.org>; Sun, 28 Mar 2021 22:57:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DACE461864
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61E5789FC9;
	Sun, 28 Mar 2021 22:57:49 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62D6289FA6
 for <intel-gfx@lists.freedesktop.org>; Sun, 28 Mar 2021 22:57:48 +0000 (UTC)
IronPort-SDR: Fc/CWQFBEXL9inWOKbzeV+jrJnAcua4WzaKr8bV2xlOicbIG794zvq2KIYWTjA76pOTYMYaXjL
 Xbi6P9effK3w==
X-IronPort-AV: E=McAfee;i="6000,8403,9937"; a="255443996"
X-IronPort-AV: E=Sophos;i="5.81,285,1610438400"; d="scan'208";a="255443996"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2021 15:57:48 -0700
IronPort-SDR: l/98SNBMFZnc+Qh1y1o8ZXNQhb0IBrQXzzrV8RqkuHL8PfMjgWm+w4/C0vBM0tb8oFXxBh2ZIj
 AV357ITn3r6w==
X-IronPort-AV: E=Sophos;i="5.81,285,1610438400"; d="scan'208";a="376213763"
Received: from dceraolo-linux.fm.intel.com ([10.1.27.145])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2021 15:57:47 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Sun, 28 Mar 2021 15:56:57 -0700
Message-Id: <20210328225709.18541-6-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210328225709.18541-1-daniele.ceraolospurio@intel.com>
References: <20210328225709.18541-1-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v3 05/16] drm/i915/pxp: Implement funcs to
 create the TEE channel
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
Cc: "Huang, Sean Z" <sean.z.huang@intel.com>, Huang@freedesktop.org,
	Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

From: "Huang, Sean Z" <sean.z.huang@intel.com>

Implement the funcs to create the TEE channel, so kernel can
send the TEE commands directly to TEE for creating the arbitrary
(default) session.

v2: fix locking, don't pollute dev_priv (Chris)

Signed-off-by: Huang, Sean Z <sean.z.huang@intel.com>
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
---
 drivers/gpu/drm/i915/Makefile              |  3 +-
 drivers/gpu/drm/i915/pxp/intel_pxp.c       | 13 ++++
 drivers/gpu/drm/i915/pxp/intel_pxp_tee.c   | 77 ++++++++++++++++++++++
 drivers/gpu/drm/i915/pxp/intel_pxp_tee.h   | 14 ++++
 drivers/gpu/drm/i915/pxp/intel_pxp_types.h |  3 +
 5 files changed, 109 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_tee.h

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index a797c6e5830c..14795f6a3c86 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -272,7 +272,8 @@ i915-y += i915_perf.o
 
 # Protected execution platform (PXP) support
 i915-$(CONFIG_DRM_I915_PXP) += \
-	pxp/intel_pxp.o
+	pxp/intel_pxp.o \
+	pxp/intel_pxp_tee.o
 
 # Post-mortem debug and GPU hang state capture
 i915-$(CONFIG_DRM_I915_CAPTURE_ERROR) += i915_gpu_error.o
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.c b/drivers/gpu/drm/i915/pxp/intel_pxp.c
index 7a4258c8f6a1..a0fc43f72cad 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp.c
@@ -3,6 +3,7 @@
  * Copyright(c) 2020 Intel Corporation.
  */
 #include "intel_pxp.h"
+#include "intel_pxp_tee.h"
 #include "gt/intel_context.h"
 #include "i915_drv.h"
 
@@ -50,7 +51,16 @@ void intel_pxp_init(struct intel_pxp *pxp)
 	if (ret)
 		return;
 
+	ret = intel_pxp_tee_component_init(pxp);
+	if (ret)
+		goto out_context;
+
 	drm_info(&gt->i915->drm, "Protected Xe Path (PXP) protected content support initialized\n");
+
+	return;
+
+out_context:
+	destroy_vcs_context(pxp);
 }
 
 void intel_pxp_fini(struct intel_pxp *pxp)
@@ -58,5 +68,8 @@ void intel_pxp_fini(struct intel_pxp *pxp)
 	if (!intel_pxp_is_enabled(pxp))
 		return;
 
+	intel_pxp_tee_component_fini(pxp);
+
 	destroy_vcs_context(pxp);
+
 }
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
new file mode 100644
index 000000000000..21916ec0f6ff
--- /dev/null
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
@@ -0,0 +1,77 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright(c) 2020 Intel Corporation.
+ */
+
+#include <linux/component.h>
+#include "drm/i915_pxp_tee_interface.h"
+#include "drm/i915_component.h"
+#include "i915_drv.h"
+#include "intel_pxp.h"
+#include "intel_pxp_tee.h"
+
+static inline struct intel_pxp *i915_dev_to_pxp(struct device *i915_kdev)
+{
+	return &kdev_to_i915(i915_kdev)->gt.pxp;
+}
+
+/**
+ * i915_pxp_tee_component_bind - bind function to pass the function pointers to pxp_tee
+ * @i915_kdev: pointer to i915 kernel device
+ * @tee_kdev: pointer to tee kernel device
+ * @data: pointer to pxp_tee_master containing the function pointers
+ *
+ * This bind function is called during the system boot or resume from system sleep.
+ *
+ * Return: return 0 if successful.
+ */
+static int i915_pxp_tee_component_bind(struct device *i915_kdev,
+				       struct device *tee_kdev, void *data)
+{
+	struct intel_pxp *pxp = i915_dev_to_pxp(i915_kdev);
+
+	pxp->pxp_component = data;
+	pxp->pxp_component->tee_dev = tee_kdev;
+
+	return 0;
+}
+
+static void i915_pxp_tee_component_unbind(struct device *i915_kdev,
+					  struct device *tee_kdev, void *data)
+{
+	struct intel_pxp *pxp = i915_dev_to_pxp(i915_kdev);
+
+	pxp->pxp_component = NULL;
+}
+
+static const struct component_ops i915_pxp_tee_component_ops = {
+	.bind   = i915_pxp_tee_component_bind,
+	.unbind = i915_pxp_tee_component_unbind,
+};
+
+int intel_pxp_tee_component_init(struct intel_pxp *pxp)
+{
+	int ret;
+	struct intel_gt *gt = pxp_to_gt(pxp);
+	struct drm_i915_private *i915 = gt->i915;
+
+	ret = component_add_typed(i915->drm.dev, &i915_pxp_tee_component_ops,
+				  I915_COMPONENT_PXP);
+	if (ret < 0) {
+		drm_err(&i915->drm, "Failed to add PXP component (%d)\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+void intel_pxp_tee_component_fini(struct intel_pxp *pxp)
+{
+	struct intel_gt *gt = pxp_to_gt(pxp);
+	struct drm_i915_private *i915 = gt->i915;
+
+	if (!pxp->pxp_component)
+		return;
+
+	component_del(i915->drm.dev, &i915_pxp_tee_component_ops);
+}
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.h b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.h
new file mode 100644
index 000000000000..23d050a5d3e7
--- /dev/null
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright(c) 2020, Intel Corporation. All rights reserved.
+ */
+
+#ifndef __INTEL_PXP_TEE_H__
+#define __INTEL_PXP_TEE_H__
+
+#include "intel_pxp.h"
+
+int intel_pxp_tee_component_init(struct intel_pxp *pxp);
+void intel_pxp_tee_component_fini(struct intel_pxp *pxp);
+
+#endif /* __INTEL_PXP_TEE_H__ */
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_types.h b/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
index bd12c520e60a..3e95d21513e8 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
@@ -7,8 +7,11 @@
 #define __INTEL_PXP_TYPES_H__
 
 struct intel_context;
+struct i915_pxp_component;
 
 struct intel_pxp {
+	struct i915_pxp_component *pxp_component;
+
 	struct intel_context *ce;
 };
 
-- 
2.29.2

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
