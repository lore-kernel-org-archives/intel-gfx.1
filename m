Return-Path: <SRS0=1oYm=FV=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08D33C4361B
	for <intel-gfx@archiver.kernel.org>; Thu, 17 Dec 2020 17:26:34 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C0F1235DD
	for <intel-gfx@archiver.kernel.org>; Thu, 17 Dec 2020 17:26:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C0F1235DD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 036916E24E;
	Thu, 17 Dec 2020 17:26:33 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33A966E1BC;
 Thu, 17 Dec 2020 17:26:31 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from haswell.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 23357963-1500050 
 for multiple; Thu, 17 Dec 2020 17:26:20 +0000
From: Chris Wilson <chris@chris-wilson.co.uk>
To: intel-gfx@lists.freedesktop.org
Date: Thu, 17 Dec 2020 17:26:18 +0000
Message-Id: <20201217172618.1637044-1-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH i-g-t] i915/perf_pmu: Exercise
 I915_PMU_SOFTWARE_GT_AWAKE_TIME
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

Measure the sample gt-awake time while each engine and every engine is
busy. They should all report the same duration, the elapsed runtime of
the batch.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
---
 include/drm-uapi/i915_drm.h |  3 ++-
 tests/i915/perf_pmu.c       | 42 +++++++++++++++++++++++++++++++++++++
 2 files changed, 44 insertions(+), 1 deletion(-)

diff --git a/include/drm-uapi/i915_drm.h b/include/drm-uapi/i915_drm.h
index ef696d1a5..bf9ea471c 100644
--- a/include/drm-uapi/i915_drm.h
+++ b/include/drm-uapi/i915_drm.h
@@ -177,8 +177,9 @@ enum drm_i915_pmu_engine_sample {
 #define I915_PMU_REQUESTED_FREQUENCY	__I915_PMU_OTHER(1)
 #define I915_PMU_INTERRUPTS		__I915_PMU_OTHER(2)
 #define I915_PMU_RC6_RESIDENCY		__I915_PMU_OTHER(3)
+#define I915_PMU_SOFTWARE_GT_AWAKE_TIME	__I915_PMU_OTHER(4)
 
-#define I915_PMU_LAST I915_PMU_RC6_RESIDENCY
+#define I915_PMU_LAST /* Deprecated - do not use */ I915_PMU_RC6_RESIDENCY
 
 /* Each region is a minimum of 16k, and there are at most 255 of them.
  */
diff --git a/tests/i915/perf_pmu.c b/tests/i915/perf_pmu.c
index c2b186d39..90182074b 100644
--- a/tests/i915/perf_pmu.c
+++ b/tests/i915/perf_pmu.c
@@ -883,6 +883,42 @@ sema_busy(int gem_fd,
 	close(fd[1]);
 }
 
+static void test_awake(int i915)
+{
+	const struct intel_execution_engine2 *e;
+	unsigned long slept;
+	uint64_t val;
+	int fd;
+
+	fd = perf_i915_open(i915, I915_PMU_SOFTWARE_GT_AWAKE_TIME);
+	igt_skip_on(fd < 0);
+
+	/* Check that each engine is captured by the GT wakeref */
+	__for_each_physical_engine(i915, e) {
+		igt_spin_new(i915, .engine = e->flags);
+
+		val = pmu_read_single(fd);
+		slept = measured_usleep(batch_duration_ns / 1000);
+		val = pmu_read_single(fd) - val;
+
+		gem_quiescent_gpu(i915);
+		assert_within_epsilon(val, slept, tolerance);
+	}
+
+	/* And that the total GT wakeref matches walltime not summation */
+	__for_each_physical_engine(i915, e)
+		igt_spin_new(i915, .engine = e->flags);
+
+	val = pmu_read_single(fd);
+	slept = measured_usleep(batch_duration_ns / 1000);
+	val = pmu_read_single(fd) - val;
+
+	gem_quiescent_gpu(i915);
+	assert_within_epsilon(val, slept, tolerance);
+
+	close(fd);
+}
+
 #define   MI_WAIT_FOR_PIPE_C_VBLANK (1<<21)
 #define   MI_WAIT_FOR_PIPE_B_VBLANK (1<<11)
 #define   MI_WAIT_FOR_PIPE_A_VBLANK (1<<3)
@@ -2250,6 +2286,12 @@ igt_main
 	igt_subtest("rc6-suspend")
 		test_rc6(fd, TEST_S3);
 
+	/**
+	 * Test GT wakeref tracking (similar to RC0, opposite of RC6)
+	 */
+	igt_subtest("gt-awake")
+		test_awake(fd);
+
 	/**
 	 * Check render nodes are counted.
 	 */
-- 
2.29.2

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
