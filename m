Return-Path: <SRS0=qdHQ=OA=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F303C433EF
	for <intel-gfx@archiver.kernel.org>; Fri, 10 Sep 2021 15:39:22 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FDE260295
	for <intel-gfx@archiver.kernel.org>; Fri, 10 Sep 2021 15:39:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1FDE260295
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 170136EA23;
	Fri, 10 Sep 2021 15:39:11 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F7956EA20;
 Fri, 10 Sep 2021 15:39:08 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10103"; a="284807759"
X-IronPort-AV: E=Sophos;i="5.85,283,1624345200"; d="scan'208";a="284807759"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2021 08:39:07 -0700
X-IronPort-AV: E=Sophos;i="5.85,283,1624345200"; d="scan'208";a="649412254"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2021 08:39:07 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Fri, 10 Sep 2021 08:36:11 -0700
Message-Id: <20210910153627.1060858-2-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210910153627.1060858-1-daniele.ceraolospurio@intel.com>
References: <20210910153627.1060858-1-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH v9 01/17] drm/i915/pxp: Define PXP component
 interface
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

This will be used for communication between the i915 driver and the mei
one. Defining it in a stand-alone patch to avoid circualr dependedencies
between the patches modifying the 2 drivers.

Split out from an original patch from  Huang, Sean Z

v2: rename the component struct (Rodrigo)

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 include/drm/i915_component.h         |  1 +
 include/drm/i915_pxp_tee_interface.h | 42 ++++++++++++++++++++++++++++
 2 files changed, 43 insertions(+)
 create mode 100644 include/drm/i915_pxp_tee_interface.h

diff --git a/include/drm/i915_component.h b/include/drm/i915_component.h
index 55c3b123581b..c1e2a43d2d1e 100644
--- a/include/drm/i915_component.h
+++ b/include/drm/i915_component.h
@@ -29,6 +29,7 @@
 enum i915_component_type {
 	I915_COMPONENT_AUDIO = 1,
 	I915_COMPONENT_HDCP,
+	I915_COMPONENT_PXP
 };
 
 /* MAX_PORT is the number of port
diff --git a/include/drm/i915_pxp_tee_interface.h b/include/drm/i915_pxp_tee_interface.h
new file mode 100644
index 000000000000..af593ec64469
--- /dev/null
+++ b/include/drm/i915_pxp_tee_interface.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2020 Intel Corporation
+ */
+
+#ifndef _I915_PXP_TEE_INTERFACE_H_
+#define _I915_PXP_TEE_INTERFACE_H_
+
+#include <linux/mutex.h>
+#include <linux/device.h>
+
+/**
+ * struct i915_pxp_component_ops - ops for PXP services.
+ * @owner: Module providing the ops
+ * @send: sends data to PXP
+ * @receive: receives data from PXP
+ */
+struct i915_pxp_component_ops {
+	/**
+	 * @owner: owner of the module provding the ops
+	 */
+	struct module *owner;
+
+	int (*send)(struct device *dev, const void *message, size_t size);
+	int (*recv)(struct device *dev, void *buffer, size_t size);
+};
+
+/**
+ * struct i915_pxp_component - Used for communication between i915 and TEE
+ * drivers for the PXP services
+ * @tee_dev: device that provide the PXP service from TEE Bus.
+ * @pxp_ops: Ops implemented by TEE driver, used by i915 driver.
+ */
+struct i915_pxp_component {
+	struct device *tee_dev;
+	const struct i915_pxp_component_ops *ops;
+
+	/* To protect the above members. */
+	struct mutex mutex;
+};
+
+#endif /* _I915_TEE_PXP_INTERFACE_H_ */
-- 
2.25.1

