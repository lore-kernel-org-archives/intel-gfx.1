Return-Path: <SRS0=S5Fm=B6=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55F10C433E4
	for <intel-gfx@archiver.kernel.org>; Thu, 20 Aug 2020 13:36:34 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D4F122B3F
	for <intel-gfx@archiver.kernel.org>; Thu, 20 Aug 2020 13:36:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D4F122B3F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA12D6E0AF;
	Thu, 20 Aug 2020 13:36:32 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B17536E04B;
 Thu, 20 Aug 2020 13:36:30 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from haswell.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 22187470-1500050 
 for multiple; Thu, 20 Aug 2020 14:36:12 +0100
From: Chris Wilson <chris@chris-wilson.co.uk>
To: intel-gfx@lists.freedesktop.org
Date: Thu, 20 Aug 2020 14:36:00 +0100
Message-Id: <20200820133600.8259-1-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH i-g-t] i915/gem_exec_capture: Check the capture
 runs in isolation
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

Capturing the error state for one context should not impede progress of
other contexts across the system. That is we reset the engine, remove
the context from the execution queue, then capture it. Once the hanging
request has been removed, we can execute any other context instead.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 tests/i915/gem_exec_capture.c | 66 +++++++++++++++++++++++++++++++++--
 1 file changed, 64 insertions(+), 2 deletions(-)

diff --git a/tests/i915/gem_exec_capture.c b/tests/i915/gem_exec_capture.c
index 1a53d2fb7..186bed7e2 100644
--- a/tests/i915/gem_exec_capture.c
+++ b/tests/i915/gem_exec_capture.c
@@ -195,6 +195,7 @@ static struct offset {
 	      unsigned int size, int count,
 	      unsigned int flags)
 #define INCREMENTAL 0x1
+#define ASYNC 0x2
 {
 	const int gen = intel_gen(intel_get_drm_devid(fd));
 	struct drm_i915_gem_exec_object2 *obj;
@@ -303,9 +304,11 @@ static struct offset {
 		igt_assert(gem_bo_busy(fd, obj[0].handle));
 	munmap(seqno, 4096);
 
-	igt_force_gpu_reset(fd);
+	if (!(flags & ASYNC)) {
+		igt_force_gpu_reset(fd);
+		gem_sync(fd, obj[count + 1].handle);
+	}
 
-	gem_sync(fd, obj[count + 1].handle);
 	gem_close(fd, obj[count + 1].handle);
 	for (i = 0; i < count; i++) {
 		offsets[i].addr = obj[i + 1].offset;
@@ -491,6 +494,62 @@ static void many(int fd, int dir, uint64_t size, unsigned int flags)
 	free(offsets);
 }
 
+static void prioinv(int fd, int dir, unsigned ring)
+{
+	const uint32_t bbe = MI_BATCH_BUFFER_END;
+	struct drm_i915_gem_exec_object2 obj = {
+		.handle = gem_create(fd, 4096),
+	};
+	struct drm_i915_gem_execbuffer2 execbuf = {
+		.buffers_ptr = to_user_pointer(&obj),
+		.buffer_count = 1,
+		.flags = ring,
+	};
+	int64_t timeout = NSEC_PER_SEC; /* 1s, feeling generous, blame debug */
+	uint64_t ram, gtt, size = 4 << 20;
+	unsigned long count;
+	int link[2], dummy;
+
+	igt_require(gem_scheduler_enabled(fd));
+	igt_require(igt_params_set(fd, "reset", "%u", -1)); /* engine resets! */
+	igt_require(gem_gpu_reset_type(fd) > 1);
+
+	gtt = gem_aperture_size(fd) / size;
+	ram = (intel_get_avail_ram_mb() << 20) / size;
+	igt_debug("Available objects in GTT:%"PRIu64", RAM:%"PRIu64"\n",
+		  gtt, ram);
+
+	count = min(gtt, ram) / 4;
+	igt_require(count > 1);
+
+	intel_require_memory(count, size, CHECK_RAM);
+
+	gem_write(fd, obj.handle, 0, &bbe, sizeof(bbe));
+	gem_execbuf(fd, &execbuf);
+	gem_sync(fd, obj.handle);
+
+	igt_assert(pipe(link) == 0);
+	igt_fork(child, 1) {
+		fd = gem_reopen_driver(fd);
+		igt_debug("Submitting large hang + capture\n");
+		free(__captureN(fd, dir, ring, size, count, ASYNC));
+		write(link[1], &fd, sizeof(fd)); /* wake the parent up */
+		igt_force_gpu_reset(fd);
+	}
+	read(link[0], &dummy, sizeof(dummy));
+
+	igt_debug("Submitting nop\n");
+	gem_execbuf(fd, &execbuf);
+	igt_assert_eq(gem_wait(fd, obj.handle, &timeout), 0);
+	gem_close(fd, obj.handle);
+
+	igt_waitchildren();
+	close(link[0]);
+	close(link[1]);
+
+	gem_quiescent_gpu(fd);
+}
+
 static void userptr(int fd, int dir)
 {
 	uint32_t handle;
@@ -588,6 +647,9 @@ igt_main
 		userptr(fd, dir);
 	}
 
+	test_each_engine("pi", fd, e)
+		prioinv(fd, dir, e->flags);
+
 	igt_fixture {
 		close(dir);
 		igt_disallow_hang(fd, hang);
-- 
2.28.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
