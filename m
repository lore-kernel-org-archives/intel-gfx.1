Return-Path: <SRS0=bPsW=GC=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8123DC433DB
	for <intel-gfx@archiver.kernel.org>; Wed, 30 Dec 2020 10:05:22 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1BC521973
	for <intel-gfx@archiver.kernel.org>; Wed, 30 Dec 2020 10:05:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B1BC521973
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A755891FF;
	Wed, 30 Dec 2020 10:05:21 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38827890B1;
 Wed, 30 Dec 2020 10:05:18 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from haswell.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 23462025-1500050 
 for multiple; Wed, 30 Dec 2020 10:05:11 +0000
From: Chris Wilson <chris@chris-wilson.co.uk>
To: intel-gfx@lists.freedesktop.org
Date: Wed, 30 Dec 2020 10:05:11 +0000
Message-Id: <20201230100511.753653-1-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH i-g-t] i915/gem_exec_balancer: Exercise
 non-persistent behaviours
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

Verify that the virtual engine is destroyed when the context is lost if
persistence is disabled either on the context or system-wide.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/i915/gem_exec_balancer.c | 165 +++++++++++++++++++++++++++++++++
 1 file changed, 165 insertions(+)

diff --git a/tests/i915/gem_exec_balancer.c b/tests/i915/gem_exec_balancer.c
index 9fd41ba93..5ce0b495c 100644
--- a/tests/i915/gem_exec_balancer.c
+++ b/tests/i915/gem_exec_balancer.c
@@ -31,6 +31,7 @@
 #include "igt.h"
 #include "igt_gt.h"
 #include "igt_perf.h"
+#include "igt_sysfs.h"
 #include "sw_sync.h"
 
 IGT_TEST_DESCRIPTION("Exercise in-kernel load-balancing");
@@ -3066,6 +3067,154 @@ static void fairslice(int i915)
 	}
 }
 
+static int wait_for_status(int fence, int timeout)
+{
+	int err;
+
+	err = sync_fence_wait(fence, timeout);
+	if (err)
+		return err;
+
+	return sync_fence_status(fence);
+}
+
+static void __persistence(int i915,
+			  struct i915_engine_class_instance *ci,
+			  unsigned int count,
+			  bool persistent)
+{
+	igt_spin_t *spin;
+	uint32_t ctx;
+
+	/*
+	 * A nonpersistent context is terminated immediately upon closure,
+	 * any inflight request is cancelled.
+	 */
+
+	ctx = load_balancer_create(i915, ci, count);
+	if (!persistent)
+		gem_context_set_persistence(i915, ctx, persistent);
+
+	spin = igt_spin_new(i915, ctx, .flags = IGT_SPIN_FENCE_OUT);
+	gem_context_destroy(i915, ctx);
+
+	igt_assert_eq(wait_for_status(spin->out_fence, 500), -EIO);
+	igt_spin_free(i915, spin);
+}
+
+static void persistence(int i915)
+{
+	for (int class = 0; class < 32; class++) {
+		struct i915_engine_class_instance *ci;
+		unsigned int count = 0;
+
+		ci = list_engines(i915, 1u << class, &count);
+		if (!ci || count < 2) {
+			free(ci);
+			continue;
+		}
+
+		__persistence(i915, ci, count, false);
+		free(ci);
+	}
+}
+
+static bool set_heartbeat(int i915, const char *name, unsigned int value)
+{
+	unsigned int x;
+
+	if (gem_engine_property_printf(i915, name,
+				       "heartbeat_interval_ms",
+				       "%d", value) < 0)
+		return false;
+
+	x = ~value;
+	gem_engine_property_scanf(i915, name,
+				  "heartbeat_interval_ms",
+				  "%d", &x);
+	igt_assert_eq(x, value);
+
+	return true;
+}
+
+static void noheartbeat(int i915)
+{
+	const struct intel_execution_engine2 *e;
+
+	/*
+	 * Check that non-persistent contexts are also cleaned up if we
+	 * close the context while they are active, but the engine's
+	 * heartbeat has already been disabled.
+	 */
+
+	__for_each_physical_engine(i915, e)
+		set_heartbeat(i915, e->name, 0);
+
+	for (int class = 0; class < 32; class++) {
+		struct i915_engine_class_instance *ci;
+		unsigned int count = 0;
+
+		ci = list_engines(i915, 1u << class, &count);
+		if (!ci || count < 2) {
+			free(ci);
+			continue;
+		}
+
+		__persistence(i915, ci, count, true);
+		free(ci);
+	}
+
+	igt_require_gem(i915); /* restore default parameters */
+}
+
+static bool enable_hangcheck(int dir, bool state)
+{
+	return igt_sysfs_set(dir, "enable_hangcheck", state ? "1" : "0");
+}
+
+static void nohangcheck(int i915)
+{
+	int params = igt_params_open(i915);
+
+	igt_require(enable_hangcheck(params, false));
+
+	for (int class = 0; class < 32; class++) {
+		struct i915_engine_class_instance *ci;
+		unsigned int count = 0;
+
+		ci = list_engines(i915, 1u << class, &count);
+		if (!ci || count < 2) {
+			free(ci);
+			continue;
+		}
+
+		__persistence(i915, ci, count, true);
+		free(ci);
+	}
+
+	enable_hangcheck(params, true);
+	close(params);
+}
+
+static bool has_persistence(int i915)
+{
+	struct drm_i915_gem_context_param p = {
+		.param = I915_CONTEXT_PARAM_PERSISTENCE,
+	};
+	uint64_t saved;
+
+	if (__gem_context_get_param(i915, &p))
+		return false;
+
+	saved = p.value;
+	p.value = 0;
+	if (__gem_context_set_param(i915, &p))
+		return false;
+
+	p.value = saved;
+	return __gem_context_set_param(i915, &p) == 0;
+}
+
 static bool has_context_engines(int i915)
 {
 	struct drm_i915_gem_context_param p = {
@@ -3229,4 +3378,20 @@ igt_main
 		igt_subtest("hang")
 			hangme(i915);
 	}
+
+	igt_subtest_group {
+		igt_fixture {
+			igt_require_gem(i915); /* reset parameters */
+			igt_require(has_persistence(i915));
+		}
+
+		igt_subtest("persistence")
+			persistence(i915);
+
+		igt_subtest("noheartbeat")
+			noheartbeat(i915);
+
+		igt_subtest("nohangcheck")
+			nohangcheck(i915);
+	}
 }
-- 
2.30.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
