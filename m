Return-Path: <SRS0=Sdza=PK=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 465ECC433F5
	for <intel-gfx@archiver.kernel.org>; Fri, 22 Oct 2021 19:28:25 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05C956109D
	for <intel-gfx@archiver.kernel.org>; Fri, 22 Oct 2021 19:28:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 05C956109D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 610BE6EDA6;
	Fri, 22 Oct 2021 19:28:24 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 721BC6EDA6
 for <intel-gfx@lists.freedesktop.org>; Fri, 22 Oct 2021 19:28:22 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10145"; a="315575245"
X-IronPort-AV: E=Sophos;i="5.87,173,1631602800"; d="scan'208";a="315575245"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 12:28:21 -0700
X-IronPort-AV: E=Sophos;i="5.87,173,1631602800"; d="scan'208";a="445402478"
Received: from vksheth-mobl1.gar.corp.intel.com (HELO
 smullati-desk.gar.corp.intel.com) ([10.215.116.196])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 12:28:19 -0700
From: Mullati Siva <siva.mullati@intel.com>
To: intel-gfx@lists.freedesktop.org,
	siva.mullati@intel.com
Cc: lucas.demarchi@intel.com,
	jani.nikula@intel.com
Date: Sat, 23 Oct 2021 00:57:56 +0530
Message-Id: <20211022192756.1228354-1-siva.mullati@intel.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH] drm/i915: abstraction for iosf to compile on
 all archs
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

From: "Mullati, Siva" <siva.mullati@intel.com>

The asm/iosf_mbi.h header is x86-only. Let's make IOSF_MBI kconfig
selection conditional to x86 and provide a header with stubs for other
architectures. This helps getting i915 available for other
architectures in future.

Signed-off-by: Mullati, Siva <siva.mullati@intel.com>
---
 drivers/gpu/drm/i915/Kconfig         |  2 +-
 drivers/gpu/drm/i915/i915_iosf_mbi.h | 42 ++++++++++++++++++++++++++++
 drivers/gpu/drm/i915/intel_uncore.c  |  2 +-
 drivers/gpu/drm/i915/vlv_sideband.c  |  3 +-
 4 files changed, 45 insertions(+), 4 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/i915_iosf_mbi.h

diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
index bf041b26ffec..8bea99622dd5 100644
--- a/drivers/gpu/drm/i915/Kconfig
+++ b/drivers/gpu/drm/i915/Kconfig
@@ -21,7 +21,7 @@ config DRM_I915
 	select ACPI_VIDEO if ACPI
 	select ACPI_BUTTON if ACPI
 	select SYNC_FILE
-	select IOSF_MBI
+	select IOSF_MBI if X86
 	select CRC32
 	select SND_HDA_I915 if SND_HDA_CORE
 	select CEC_CORE if CEC_NOTIFIER
diff --git a/drivers/gpu/drm/i915/i915_iosf_mbi.h b/drivers/gpu/drm/i915/i915_iosf_mbi.h
new file mode 100644
index 000000000000..8f81b7603d37
--- /dev/null
+++ b/drivers/gpu/drm/i915/i915_iosf_mbi.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2021 Intel Corporation
+ */
+
+#ifndef __I915_IOSF_MBI_H__
+#define __I915_IOSF_MBI_H__
+
+#if IS_ENABLED(CONFIG_IOSF_MBI)
+#include <asm/iosf_mbi.h>
+#else
+
+/* Stubs to compile for all non-x86 archs */
+#define MBI_PMIC_BUS_ACCESS_BEGIN       1
+#define MBI_PMIC_BUS_ACCESS_END         2
+
+struct notifier_block;
+
+static inline void iosf_mbi_punit_acquire(void) {}
+static inline void iosf_mbi_punit_release(void) {}
+static inline void iosf_mbi_assert_punit_acquired(void) {}
+
+static inline
+int iosf_mbi_register_pmic_bus_access_notifier(struct notifier_block *nb)
+{
+	return 0;
+}
+
+static inline int
+iosf_mbi_unregister_pmic_bus_access_notifier_unlocked(struct notifier_block *nb)
+{
+	return 0;
+}
+
+static inline
+int iosf_mbi_unregister_pmic_bus_access_notifier(struct notifier_block *nb)
+{
+	return 0;
+}
+#endif
+
+#endif /* __I915_IOSF_MBI_H__ */
diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
index e072054adac5..722910d02b5f 100644
--- a/drivers/gpu/drm/i915/intel_uncore.c
+++ b/drivers/gpu/drm/i915/intel_uncore.c
@@ -22,11 +22,11 @@
  */
 
 #include <linux/pm_runtime.h>
-#include <asm/iosf_mbi.h>
 
 #include "gt/intel_lrc_reg.h" /* for shadow reg list */
 
 #include "i915_drv.h"
+#include "i915_iosf_mbi.h"
 #include "i915_trace.h"
 #include "i915_vgpu.h"
 #include "intel_pm.h"
diff --git a/drivers/gpu/drm/i915/vlv_sideband.c b/drivers/gpu/drm/i915/vlv_sideband.c
index 35380738a951..ed2ac5752ac4 100644
--- a/drivers/gpu/drm/i915/vlv_sideband.c
+++ b/drivers/gpu/drm/i915/vlv_sideband.c
@@ -3,9 +3,8 @@
  * Copyright © 2013-2021 Intel Corporation
  */
 
-#include <asm/iosf_mbi.h>
-
 #include "i915_drv.h"
+#include "i915_iosf_mbi.h"
 #include "vlv_sideband.h"
 
 /*
-- 
2.33.0

