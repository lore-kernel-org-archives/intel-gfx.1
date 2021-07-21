Return-Path: <SRS0=klwv=MN=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B0FFC6377E
	for <intel-gfx@archiver.kernel.org>; Wed, 21 Jul 2021 22:30:58 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EED736023D
	for <intel-gfx@archiver.kernel.org>; Wed, 21 Jul 2021 22:30:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EED736023D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60D2D6EB4A;
	Wed, 21 Jul 2021 22:30:54 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAB786EB40
 for <intel-gfx@lists.freedesktop.org>; Wed, 21 Jul 2021 22:30:50 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10052"; a="211528005"
X-IronPort-AV: E=Sophos;i="5.84,258,1620716400"; d="scan'208";a="211528005"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2021 15:30:49 -0700
X-IronPort-AV: E=Sophos;i="5.84,258,1620716400"; d="scan'208";a="658464188"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2021 15:30:47 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Wed, 21 Jul 2021 15:30:32 -0700
Message-Id: <20210721223043.834562-8-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20210721223043.834562-1-matthew.d.roper@intel.com>
References: <20210721223043.834562-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [CI 07/18] drm/i915/selftests: Allow for larger engine
 counts
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

Increasing the engine count causes a couple of local array variables
to exceed the kernel stack limit. So make them dynamic allocations
instead.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/gt/selftest_execlists.c  | 10 ++++--
 .../gpu/drm/i915/gt/selftest_workarounds.c    | 32 ++++++++++++-------
 2 files changed, 29 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/selftest_execlists.c b/drivers/gpu/drm/i915/gt/selftest_execlists.c
index 73ddc6e14730..22a124b134b6 100644
--- a/drivers/gpu/drm/i915/gt/selftest_execlists.c
+++ b/drivers/gpu/drm/i915/gt/selftest_execlists.c
@@ -3561,12 +3561,16 @@ static int smoke_crescendo(struct preempt_smoke *smoke, unsigned int flags)
 #define BATCH BIT(0)
 {
 	struct task_struct *tsk[I915_NUM_ENGINES] = {};
-	struct preempt_smoke arg[I915_NUM_ENGINES];
+	struct preempt_smoke *arg;
 	struct intel_engine_cs *engine;
 	enum intel_engine_id id;
 	unsigned long count;
 	int err = 0;
 
+	arg = kmalloc_array(I915_NUM_ENGINES, sizeof(*arg), GFP_KERNEL);
+	if (!arg)
+		return -ENOMEM;
+
 	for_each_engine(engine, smoke->gt, id) {
 		arg[id] = *smoke;
 		arg[id].engine = engine;
@@ -3574,7 +3578,7 @@ static int smoke_crescendo(struct preempt_smoke *smoke, unsigned int flags)
 			arg[id].batch = NULL;
 		arg[id].count = 0;
 
-		tsk[id] = kthread_run(smoke_crescendo_thread, &arg,
+		tsk[id] = kthread_run(smoke_crescendo_thread, arg,
 				      "igt/smoke:%d", id);
 		if (IS_ERR(tsk[id])) {
 			err = PTR_ERR(tsk[id]);
@@ -3603,6 +3607,8 @@ static int smoke_crescendo(struct preempt_smoke *smoke, unsigned int flags)
 
 	pr_info("Submitted %lu crescendo:%x requests across %d engines and %d contexts\n",
 		count, flags, smoke->gt->info.num_engines, smoke->ncontext);
+
+	kfree(arg);
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/i915/gt/selftest_workarounds.c b/drivers/gpu/drm/i915/gt/selftest_workarounds.c
index 7ebc4edb8ecf..7a38ce40feb2 100644
--- a/drivers/gpu/drm/i915/gt/selftest_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/selftest_workarounds.c
@@ -1175,31 +1175,36 @@ live_gpu_reset_workarounds(void *arg)
 {
 	struct intel_gt *gt = arg;
 	intel_wakeref_t wakeref;
-	struct wa_lists lists;
+	struct wa_lists *lists;
 	bool ok;
 
 	if (!intel_has_gpu_reset(gt))
 		return 0;
 
+	lists = kzalloc(sizeof(*lists), GFP_KERNEL);
+	if (!lists)
+		return -ENOMEM;
+
 	pr_info("Verifying after GPU reset...\n");
 
 	igt_global_reset_lock(gt);
 	wakeref = intel_runtime_pm_get(gt->uncore->rpm);
 
-	reference_lists_init(gt, &lists);
+	reference_lists_init(gt, lists);
 
-	ok = verify_wa_lists(gt, &lists, "before reset");
+	ok = verify_wa_lists(gt, lists, "before reset");
 	if (!ok)
 		goto out;
 
 	intel_gt_reset(gt, ALL_ENGINES, "live_workarounds");
 
-	ok = verify_wa_lists(gt, &lists, "after reset");
+	ok = verify_wa_lists(gt, lists, "after reset");
 
 out:
-	reference_lists_fini(gt, &lists);
+	reference_lists_fini(gt, lists);
 	intel_runtime_pm_put(gt->uncore->rpm, wakeref);
 	igt_global_reset_unlock(gt);
+	kfree(lists);
 
 	return ok ? 0 : -ESRCH;
 }
@@ -1214,16 +1219,20 @@ live_engine_reset_workarounds(void *arg)
 	struct igt_spinner spin;
 	struct i915_request *rq;
 	intel_wakeref_t wakeref;
-	struct wa_lists lists;
+	struct wa_lists *lists;
 	int ret = 0;
 
 	if (!intel_has_reset_engine(gt))
 		return 0;
 
+	lists = kzalloc(sizeof(*lists), GFP_KERNEL);
+	if (!lists)
+		return -ENOMEM;
+
 	igt_global_reset_lock(gt);
 	wakeref = intel_runtime_pm_get(gt->uncore->rpm);
 
-	reference_lists_init(gt, &lists);
+	reference_lists_init(gt, lists);
 
 	for_each_engine(engine, gt, id) {
 		bool ok;
@@ -1235,7 +1244,7 @@ live_engine_reset_workarounds(void *arg)
 			break;
 		}
 
-		ok = verify_wa_lists(gt, &lists, "before reset");
+		ok = verify_wa_lists(gt, lists, "before reset");
 		if (!ok) {
 			ret = -ESRCH;
 			goto err;
@@ -1247,7 +1256,7 @@ live_engine_reset_workarounds(void *arg)
 			goto err;
 		}
 
-		ok = verify_wa_lists(gt, &lists, "after idle reset");
+		ok = verify_wa_lists(gt, lists, "after idle reset");
 		if (!ok) {
 			ret = -ESRCH;
 			goto err;
@@ -1282,7 +1291,7 @@ live_engine_reset_workarounds(void *arg)
 		igt_spinner_end(&spin);
 		igt_spinner_fini(&spin);
 
-		ok = verify_wa_lists(gt, &lists, "after busy reset");
+		ok = verify_wa_lists(gt, lists, "after busy reset");
 		if (!ok) {
 			ret = -ESRCH;
 			goto err;
@@ -1294,9 +1303,10 @@ live_engine_reset_workarounds(void *arg)
 			break;
 	}
 
-	reference_lists_fini(gt, &lists);
+	reference_lists_fini(gt, lists);
 	intel_runtime_pm_put(gt->uncore->rpm, wakeref);
 	igt_global_reset_unlock(gt);
+	kfree(lists);
 
 	igt_flush_test(gt->i915);
 
-- 
2.25.4

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
