Return-Path: <SRS0=rnDU=G2=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4DFCC433E0
	for <intel-gfx@archiver.kernel.org>; Sat, 23 Jan 2021 14:56:14 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A104F22AAA
	for <intel-gfx@archiver.kernel.org>; Sat, 23 Jan 2021 14:56:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A104F22AAA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC1C16E1C0;
	Sat, 23 Jan 2021 14:56:12 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C1D16E1C0
 for <intel-gfx@lists.freedesktop.org>; Sat, 23 Jan 2021 14:56:11 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from build.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 23681108-1500050 
 for multiple; Sat, 23 Jan 2021 14:55:43 +0000
From: Chris Wilson <chris@chris-wilson.co.uk>
To: intel-gfx@lists.freedesktop.org
Date: Sat, 23 Jan 2021 14:55:43 +0000
Message-Id: <20210123145543.10533-1-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH] drm/i915/gem: Move freeze/freeze_late next to
 suspend/suspend_late
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
Cc: Matthew Auld <matthew.auld@intel.com>, Guenter Roeck <linux@roeck-us.net>,
 Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Push the hibernate pm routines next to the suspend pm routines in
gem/i915_gem_pm.c. This has the side-effect of putting the wbinvd()
abusers next to each other.

Reported-by: Guenter Roeck <linux@roeck-us.net>
Fixes: 30d2bfd09383 ("drm/i915/gem: Almagamate clflushes on freeze")
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_pm.c    | 41 +++++++++++++++++++++++
 drivers/gpu/drm/i915/gem/i915_gem_pm.h    |  3 ++
 drivers/gpu/drm/i915/i915_drv.c           |  1 +
 drivers/gpu/drm/i915/i915_drv.h           |  2 --
 drivers/gpu/drm/i915/i915_gem.c           | 41 -----------------------
 drivers/gpu/drm/i915/selftests/i915_gem.c |  1 +
 6 files changed, 46 insertions(+), 43 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pm.c b/drivers/gpu/drm/i915/gem/i915_gem_pm.c
index 215766cc22bf..000e1cd8e920 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_pm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_pm.c
@@ -85,6 +85,47 @@ void i915_gem_suspend_late(struct drm_i915_private *i915)
 		wbinvd_on_all_cpus();
 }
 
+int i915_gem_freeze(struct drm_i915_private *i915)
+{
+	/* Discard all purgeable objects, let userspace recover those as
+	 * required after resuming.
+	 */
+	i915_gem_shrink_all(i915);
+
+	return 0;
+}
+
+int i915_gem_freeze_late(struct drm_i915_private *i915)
+{
+	struct drm_i915_gem_object *obj;
+	intel_wakeref_t wakeref;
+
+	/*
+	 * Called just before we write the hibernation image.
+	 *
+	 * We need to update the domain tracking to reflect that the CPU
+	 * will be accessing all the pages to create and restore from the
+	 * hibernation, and so upon restoration those pages will be in the
+	 * CPU domain.
+	 *
+	 * To make sure the hibernation image contains the latest state,
+	 * we update that state just before writing out the image.
+	 *
+	 * To try and reduce the hibernation image, we manually shrink
+	 * the objects as well, see i915_gem_freeze()
+	 */
+
+	with_intel_runtime_pm(&i915->runtime_pm, wakeref)
+		i915_gem_shrink(i915, -1UL, NULL, ~0);
+	i915_gem_drain_freed_objects(i915);
+
+	wbinvd_on_all_cpus();
+	list_for_each_entry(obj, &i915->mm.shrink_list, mm.link)
+		__start_cpu_write(obj);
+
+	return 0;
+}
+
 void i915_gem_resume(struct drm_i915_private *i915)
 {
 	GEM_TRACE("%s\n", dev_name(i915->drm.dev));
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pm.h b/drivers/gpu/drm/i915/gem/i915_gem_pm.h
index 26b78dbdc225..c9a66630e92e 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_pm.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_pm.h
@@ -19,4 +19,7 @@ void i915_gem_idle_work_handler(struct work_struct *work);
 void i915_gem_suspend(struct drm_i915_private *i915);
 void i915_gem_suspend_late(struct drm_i915_private *i915);
 
+int i915_gem_freeze(struct drm_i915_private *i915);
+int i915_gem_freeze_late(struct drm_i915_private *i915);
+
 #endif /* __I915_GEM_PM_H__ */
diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
index b37b189e219c..6bc514cd1682 100644
--- a/drivers/gpu/drm/i915/i915_drv.c
+++ b/drivers/gpu/drm/i915/i915_drv.c
@@ -65,6 +65,7 @@
 #include "gem/i915_gem_context.h"
 #include "gem/i915_gem_ioctls.h"
 #include "gem/i915_gem_mman.h"
+#include "gem/i915_gem_pm.h"
 #include "gt/intel_gt.h"
 #include "gt/intel_gt_pm.h"
 #include "gt/intel_rc6.h"
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 7efb501e22d2..dcc8c054f7c0 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -1830,8 +1830,6 @@ int i915_gem_init_userptr(struct drm_i915_private *dev_priv);
 void i915_gem_cleanup_userptr(struct drm_i915_private *dev_priv);
 void i915_gem_init_early(struct drm_i915_private *dev_priv);
 void i915_gem_cleanup_early(struct drm_i915_private *dev_priv);
-int i915_gem_freeze(struct drm_i915_private *dev_priv);
-int i915_gem_freeze_late(struct drm_i915_private *dev_priv);
 
 struct intel_memory_region *i915_gem_shmem_setup(struct drm_i915_private *i915);
 
diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
index 9b04dff5eb32..aa4490934469 100644
--- a/drivers/gpu/drm/i915/i915_gem.c
+++ b/drivers/gpu/drm/i915/i915_gem.c
@@ -1145,47 +1145,6 @@ void i915_gem_cleanup_early(struct drm_i915_private *dev_priv)
 	drm_WARN_ON(&dev_priv->drm, dev_priv->mm.shrink_count);
 }
 
-int i915_gem_freeze(struct drm_i915_private *dev_priv)
-{
-	/* Discard all purgeable objects, let userspace recover those as
-	 * required after resuming.
-	 */
-	i915_gem_shrink_all(dev_priv);
-
-	return 0;
-}
-
-int i915_gem_freeze_late(struct drm_i915_private *i915)
-{
-	struct drm_i915_gem_object *obj;
-	intel_wakeref_t wakeref;
-
-	/*
-	 * Called just before we write the hibernation image.
-	 *
-	 * We need to update the domain tracking to reflect that the CPU
-	 * will be accessing all the pages to create and restore from the
-	 * hibernation, and so upon restoration those pages will be in the
-	 * CPU domain.
-	 *
-	 * To make sure the hibernation image contains the latest state,
-	 * we update that state just before writing out the image.
-	 *
-	 * To try and reduce the hibernation image, we manually shrink
-	 * the objects as well, see i915_gem_freeze()
-	 */
-
-	with_intel_runtime_pm(&i915->runtime_pm, wakeref)
-		i915_gem_shrink(i915, -1UL, NULL, ~0);
-	i915_gem_drain_freed_objects(i915);
-
-	wbinvd_on_all_cpus();
-	list_for_each_entry(obj, &i915->mm.shrink_list, mm.link)
-		__start_cpu_write(obj);
-
-	return 0;
-}
-
 int i915_gem_open(struct drm_i915_private *i915, struct drm_file *file)
 {
 	struct drm_i915_file_private *file_priv;
diff --git a/drivers/gpu/drm/i915/selftests/i915_gem.c b/drivers/gpu/drm/i915/selftests/i915_gem.c
index 412e21604a05..dc394fb7ccfa 100644
--- a/drivers/gpu/drm/i915/selftests/i915_gem.c
+++ b/drivers/gpu/drm/i915/selftests/i915_gem.c
@@ -8,6 +8,7 @@
 
 #include "gem/selftests/igt_gem_utils.h"
 #include "gem/selftests/mock_context.h"
+#include "gem/i915_gem_pm.h"
 #include "gt/intel_gt.h"
 #include "gt/intel_gt_pm.h"
 
-- 
2.20.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
