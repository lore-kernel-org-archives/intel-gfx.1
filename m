Return-Path: <SRS0=HG33=FU=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 556B1C2BBCD
	for <intel-gfx@archiver.kernel.org>; Wed, 16 Dec 2020 16:55:12 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E247E225A9
	for <intel-gfx@archiver.kernel.org>; Wed, 16 Dec 2020 16:55:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E247E225A9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63C0889BB3;
	Wed, 16 Dec 2020 16:55:11 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48E9B897F0;
 Wed, 16 Dec 2020 16:55:09 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from haswell.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 23346482-1500050 
 for multiple; Wed, 16 Dec 2020 16:54:55 +0000
From: Chris Wilson <chris@chris-wilson.co.uk>
To: intel-gfx@lists.freedesktop.org
Date: Wed, 16 Dec 2020 16:54:57 +0000
Message-Id: <20201216165457.1361781-1-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH i-g-t] i915/perf_pmu: Replace init/read-other
 with a plea
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

We cannot assume we know how many PMU there are exactly, so pick -1ULL
to represent all invalid metrics. Similarly, we have to rely on explicit
testing for each PMU to prove their existence and correct functioning.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 tests/i915/perf_pmu.c | 56 ++++++++++++-------------------------------
 1 file changed, 15 insertions(+), 41 deletions(-)

diff --git a/tests/i915/perf_pmu.c b/tests/i915/perf_pmu.c
index e2f975a1a..db375341c 100644
--- a/tests/i915/perf_pmu.c
+++ b/tests/i915/perf_pmu.c
@@ -1165,38 +1165,12 @@ do { \
 	igt_assert_eq(errno, EINVAL);
 }
 
-static void init_other(int i915, unsigned int i, bool valid)
+static void open_invalid(int i915)
 {
 	int fd;
 
-	fd = perf_i915_open(i915, __I915_PMU_OTHER(i));
-	igt_require(!(fd < 0 && errno == ENODEV));
-	if (valid) {
-		igt_assert(fd >= 0);
-	} else {
-		igt_assert(fd < 0);
-		return;
-	}
-
-	close(fd);
-}
-
-static void read_other(int i915, unsigned int i, bool valid)
-{
-	int fd;
-
-	fd = perf_i915_open(i915, __I915_PMU_OTHER(i));
-	igt_require(!(fd < 0 && errno == ENODEV));
-	if (valid) {
-		igt_assert(fd >= 0);
-	} else {
-		igt_assert(fd < 0);
-		return;
-	}
-
-	(void)pmu_read_single(fd);
-
-	close(fd);
+	fd = perf_i915_open(i915, -1ULL);
+	igt_assert(fd < 0);
 }
 
 static bool cpu0_hotplug_support(void)
@@ -2058,6 +2032,12 @@ igt_main
 	unsigned int num_engines = 0;
 	int fd = -1;
 
+	/**
+	 * All PMU should be accompanied by a test.
+	 *
+	 * Including all the I915_PMU_OTHER(x).
+	 */
+
 	igt_fixture {
 		fd = __drm_open_driver(DRIVER_INTEL);
 
@@ -2075,6 +2055,12 @@ igt_main
 	igt_subtest("invalid-init")
 		invalid_init(fd);
 
+	/**
+	 * Double check the invalid metric does fail.
+	 */
+	igt_subtest("invalid-open")
+		open_invalid(fd);
+
 	igt_subtest_with_dynamic("faulting-read") {
 		for_each_mmap_offset_type(fd, t) {
 			igt_dynamic_f("%s", t->name)
@@ -2228,18 +2214,6 @@ igt_main
 		all_busy_check_all(fd, num_engines,
 				   TEST_BUSY | TEST_TRAILING_IDLE);
 
-	/**
-	 * Test that non-engine counters can be initialized and read. Apart
-	 * from the invalid metric which should fail.
-	 */
-	for (unsigned int i = 0; i < num_other_metrics + 1; i++) {
-		igt_subtest_f("other-init-%u", i)
-			init_other(fd, i, i < num_other_metrics);
-
-		igt_subtest_f("other-read-%u", i)
-			read_other(fd, i, i < num_other_metrics);
-	}
-
 	/**
 	 * Test counters are not affected by CPU offline/online events.
 	 */
-- 
2.29.2

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
