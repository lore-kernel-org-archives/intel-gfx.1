Return-Path: <SRS0=k0IE=ES=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DA90C2D0A3
	for <intel-gfx@archiver.kernel.org>; Thu, 12 Nov 2020 11:14:26 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 440D522201
	for <intel-gfx@archiver.kernel.org>; Thu, 12 Nov 2020 11:14:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 440D522201
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBA1C892A0;
	Thu, 12 Nov 2020 11:14:23 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F8D488130;
 Thu, 12 Nov 2020 11:14:21 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from haswell.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 22970774-1500050 
 for multiple; Thu, 12 Nov 2020 11:14:15 +0000
From: Chris Wilson <chris@chris-wilson.co.uk>
To: intel-gfx@lists.freedesktop.org
Date: Thu, 12 Nov 2020 11:14:13 +0000
Message-Id: <20201112111413.983404-1-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH i-g-t] i915/gem_mmap_gtt: Reset a busy mmaped
 object
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

Exercise the gtt mmap revocation for a reset on a busy object.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/i915/gem_mmap_gtt.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/tests/i915/gem_mmap_gtt.c b/tests/i915/gem_mmap_gtt.c
index 3cce19e9a..2a0f2311f 100644
--- a/tests/i915/gem_mmap_gtt.c
+++ b/tests/i915/gem_mmap_gtt.c
@@ -45,6 +45,7 @@
 #include "igt.h"
 #include "igt_sysfs.h"
 #include "igt_x86.h"
+#include "sw_sync.h"
 
 #ifndef PAGE_SIZE
 #define PAGE_SIZE 4096
@@ -729,6 +730,38 @@ test_hang(int fd)
 	igt_disallow_hang(fd, hang);
 }
 
+static void
+test_hang_busy(int i915)
+{
+	igt_spin_t *spin;
+	igt_hang_t hang;
+	uint32_t *ptr, *x;
+
+	hang = igt_allow_hang(i915, 0, 0);
+	igt_require(igt_params_set(i915, "reset", "1")); /* global */
+
+	spin = igt_spin_new(i915, .flags = IGT_SPIN_POLL_RUN | IGT_SPIN_FENCE_OUT);
+	igt_spin_busywait_until_started(spin);
+
+	/* Fault in the busy object */
+	ptr = gem_mmap__gtt(i915, spin->handle, 4096, PROT_READ);
+	x = ptr + ((uintptr_t)spin->condition & 4095) / sizeof(*ptr);
+	igt_assert_eq_u32(*x, spin->cmd_precondition);
+
+	igt_assert(gem_bo_busy(i915, spin->handle));
+	igt_force_gpu_reset(i915);
+
+	/* Check we reset the busy mmap */
+	gem_sync(i915, spin->handle);
+	igt_assert_eq(sync_fence_status(spin->out_fence), -5);
+
+	igt_assert_eq_u32(*x, spin->cmd_precondition);
+	munmap(ptr, 4096);
+
+	igt_spin_free(i915, spin);
+	igt_disallow_hang(i915, hang);
+}
+
 static int min_tile_width(uint32_t devid, int tiling)
 {
 	if (tiling < 0) {
@@ -1183,6 +1216,8 @@ igt_main
 		test_clflush(fd);
 	igt_subtest("hang")
 		test_hang(fd);
+	igt_subtest("hang-busy")
+		test_hang_busy(fd);
 	igt_subtest("basic-read-write")
 		test_read_write(fd, READ_BEFORE_WRITE);
 	igt_subtest("basic-write-read")
-- 
2.29.2

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
