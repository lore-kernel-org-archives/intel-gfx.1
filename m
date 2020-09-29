Return-Path: <SRS0=bDtt=DG=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F726C4346E
	for <intel-gfx@archiver.kernel.org>; Tue, 29 Sep 2020 09:15:12 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9FC8F208FE
	for <intel-gfx@archiver.kernel.org>; Tue, 29 Sep 2020 09:15:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9FC8F208FE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11C626E45E;
	Tue, 29 Sep 2020 09:15:11 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60E0C6E45C;
 Tue, 29 Sep 2020 09:15:09 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from haswell.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 22564886-1500050 
 for multiple; Tue, 29 Sep 2020 10:14:56 +0100
From: Chris Wilson <chris@chris-wilson.co.uk>
To: intel-gfx@lists.freedesktop.org
Date: Tue, 29 Sep 2020 10:14:59 +0100
Message-Id: <20200929091459.509146-1-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200928220027.417167-1-chris@chris-wilson.co.uk>
References: <20200928220027.417167-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH i-g-t v2] i915/gen9_exec_parse: Check parsing of
 large objects
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

Simply check that we support parsing of batches as large as the uAPI
allows.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
Try a few intermediate object sizes since CI machines do not have enough
memory to reach the upper bounds of the uAPI.
---
 tests/i915/gen9_exec_parse.c | 47 ++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/tests/i915/gen9_exec_parse.c b/tests/i915/gen9_exec_parse.c
index 8cd82f568..f735e7e1c 100644
--- a/tests/i915/gen9_exec_parse.c
+++ b/tests/i915/gen9_exec_parse.c
@@ -566,6 +566,50 @@ static void test_bb_start(const int i915, const uint32_t handle, int test)
 	gem_close(i915, target_bo);
 }
 
+static void test_bb_large(int i915)
+{
+	const uint32_t bbe = MI_BATCH_BUFFER_END;
+	static const uint32_t sizes[] = {
+		(1ull << 30) - 4096,
+		(1ull << 30) + 4096,
+		(2ull << 30) - 4096,
+		(2ull << 30) + 4096,
+		(3ull << 30) - 4096,
+		(3ull << 30) + 4096,
+		(4ull << 30) - 4096,
+	};
+	struct drm_i915_gem_exec_object2 obj = {};
+	struct drm_i915_gem_execbuffer2 execbuf = {
+		.buffers_ptr = to_user_pointer(&obj),
+		.buffer_count = 1,
+		.flags = I915_EXEC_BLT,
+	};
+	uint64_t required, total;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(sizes); i++) {
+		if (!__intel_check_memory(2, sizes[i], CHECK_RAM,
+					  &required, &total))
+			break;
+
+		igt_debug("Using object size %#x\n", sizes[i]);
+		obj.handle = gem_create(i915, sizes[i]),
+		gem_write(i915, obj.handle, sizes[i] - 64, &bbe, sizeof(bbe));
+
+		execbuf.batch_start_offset = 0;
+		igt_assert_eq(__checked_execbuf(i915, &execbuf), 0);
+
+		execbuf.batch_start_offset = sizes[i] - 64;
+		igt_assert_eq(__checked_execbuf(i915, &execbuf), 0);
+
+		gem_close(i915, obj.handle);
+	}
+
+	igt_require_f(i > 0 && sizes[i - 1] > 1ull << 31,
+		      "Insufficient free memory, require at least %'"PRIu64"MiB but only have %'"PRIu64"MiB available",
+		      required >> 20, total >> 20);
+}
+
 static void test_bb_chained(const int i915, const uint32_t handle)
 {
 	const uint32_t batch[] = {
@@ -1053,6 +1097,9 @@ igt_main
 	igt_subtest("bb-start-far")
 		test_bb_start(i915, handle, BB_START_FAR);
 
+	igt_subtest("bb-large")
+		test_bb_large(i915);
+
 	igt_fixture {
 		igt_stop_hang_detector();
 		gem_close(i915, handle);
-- 
2.28.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
