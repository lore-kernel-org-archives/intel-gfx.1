Return-Path: <SRS0=JclI=ET=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBC4FC55ABD
	for <intel-gfx@archiver.kernel.org>; Fri, 13 Nov 2020 15:05:14 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86F9C22201
	for <intel-gfx@archiver.kernel.org>; Fri, 13 Nov 2020 15:05:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86F9C22201
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2D636E50E;
	Fri, 13 Nov 2020 15:05:11 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B37B06E500;
 Fri, 13 Nov 2020 15:05:09 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from haswell.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 22984798-1500050 
 for multiple; Fri, 13 Nov 2020 15:05:03 +0000
From: Chris Wilson <chris@chris-wilson.co.uk>
To: intel-gfx@lists.freedesktop.org
Date: Fri, 13 Nov 2020 15:05:02 +0000
Message-Id: <20201113150502.1349191-1-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH i-g-t] i915: Use igt_device_get_pci_device()
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
Cc: igt-dev@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Avoid hard coding the expected PCI location, and refer to the pci device
used for the test device instead.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/i915/gem_exec_endless.c | 3 ++-
 tests/i915/gem_exec_latency.c | 3 ++-
 tests/i915/gem_workarounds.c  | 3 ++-
 tests/i915/gen7_exec_parse.c  | 3 ++-
 4 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/tests/i915/gem_exec_endless.c b/tests/i915/gem_exec_endless.c
index 15026b910..f32e6dae0 100644
--- a/tests/i915/gem_exec_endless.c
+++ b/tests/i915/gem_exec_endless.c
@@ -26,6 +26,7 @@
 #include "i915/gem.h"
 #include "i915/gem_ring.h"
 #include "igt.h"
+#include "igt_device.h"
 #include "igt_sysfs.h"
 #include "sw_sync.h"
 
@@ -368,7 +369,7 @@ igt_main
 			igt_require(gem_scheduler_has_preemption(i915));
 
 			intel_register_access_init(&mmio,
-						   intel_get_pci_device(),
+						   igt_device_get_pci_device(i915),
 						   false, i915);
 
 			sysfs = igt_sysfs_open(i915);
diff --git a/tests/i915/gem_exec_latency.c b/tests/i915/gem_exec_latency.c
index 568d727f2..4de38288f 100644
--- a/tests/i915/gem_exec_latency.c
+++ b/tests/i915/gem_exec_latency.c
@@ -40,6 +40,7 @@
 #include "drm.h"
 
 #include "igt.h"
+#include "igt_device.h"
 #include "igt_sysfs.h"
 #include "igt_vgem.h"
 #include "igt_dummyload.h"
@@ -668,7 +669,7 @@ igt_main
 		if (ring_size > 1024)
 			ring_size = 1024;
 
-		intel_register_access_init(&mmio_data, intel_get_pci_device(), false, device);
+		intel_register_access_init(&mmio_data, igt_device_get_pci_device(device), false, device);
 		rcs_clock = clockrate(device, 0x2000 + TIMESTAMP);
 		igt_info("RCS timestamp clock: %.0fKHz, %.1fns\n",
 			 rcs_clock / 1e3, 1e9 / rcs_clock);
diff --git a/tests/i915/gem_workarounds.c b/tests/i915/gem_workarounds.c
index 4f043d7dd..00b475c27 100644
--- a/tests/i915/gem_workarounds.c
+++ b/tests/i915/gem_workarounds.c
@@ -29,6 +29,7 @@
 
 #include "i915/gem.h"
 #include "igt.h"
+#include "igt_device.h"
 
 #define PAGE_SIZE 4096
 #define PAGE_ALIGN(x) ALIGN(x, PAGE_SIZE)
@@ -258,7 +259,7 @@ igt_main
 		device = drm_open_driver(DRIVER_INTEL);
 		igt_require_gem(device);
 
-		intel_mmio_use_pci_bar(&mmio_data, intel_get_pci_device());
+		intel_mmio_use_pci_bar(&mmio_data, igt_device_get_pci_device(device));
 
 		gen = intel_gen(intel_get_drm_devid(device));
 
diff --git a/tests/i915/gen7_exec_parse.c b/tests/i915/gen7_exec_parse.c
index 2ba438c99..f7201bb9f 100644
--- a/tests/i915/gen7_exec_parse.c
+++ b/tests/i915/gen7_exec_parse.c
@@ -30,6 +30,7 @@
 #include <drm.h>
 
 #include "igt.h"
+#include "igt_device.h"
 #include "i915/gem.h"
 #include "sw_sync.h"
 
@@ -578,7 +579,7 @@ igt_main
 #undef REG
 
 		igt_fixture {
-			intel_register_access_init(&mmio_data, intel_get_pci_device(), 0, fd);
+			intel_register_access_init(&mmio_data, igt_device_get_pci_device(fd), 0, fd);
 		}
 
 		for (int i = 0; i < ARRAY_SIZE(lris); i++) {
-- 
2.29.2

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
