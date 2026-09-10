Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7E91C79F9F
	for <intel-gfx@archiver.kernel.org>; Thu, 10 Sep 2026 18:43:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AA2610E2A0;
	Thu, 10 Sep 2026 18:43:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CKh1UiXX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91C5D10E2AE
 for <intel-gfx@lists.freedesktop.org>; Thu, 10 Sep 2026 18:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789065784; x=1820601784;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=v2Z98pVSjp1/0TZN8uXaJZY254nJuFWe+zIdEFregIo=;
 b=CKh1UiXXaPkM2fV0opQLhwhb7WpgGAgIQTJ/jizmbk3+n7g5M+G8Y9P3
 L5jL3mtHP2k678v+6V02hcwZwSiewsP389HNF8UznJzcGsiG+0dnZE2NH
 Xt0I0qRsecqsV+Gks/Hg00TgkRJro9dUxDgkXLBqUUvEAUSVU1z6Mh2TT
 lztdmmzg+pPzbtyHzcpv7R2Q3Snm8Eqg/ukgBlPVCFo6vu84pE4e08F9/
 u97DNhX4H7xV3KwEuoAsXIyRfCGATPKUS+Lf2/Zp5Dmy6jO9DNmROnmLT
 ITWnrhSNaGdfB3/hDopm9n46RZ1pEbvP/E9mluEP3GCcbKuSAuB2XXBaY w==;
X-CSE-ConnectionGUID: cr9B09k3RU68wYkA+dc0mQ==
X-CSE-MsgGUID: QEi8j9USRtuqt8TlH2Eo8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="77085243"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="77085243"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 11:43:03 -0700
X-CSE-ConnectionGUID: fbSaiC4MSimGv6WcgwfeJQ==
X-CSE-MsgGUID: J6HATtR1TnaH2BdLeqzBgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; d="scan'208";a="268424702"
Received: from orsosgc001.jf.intel.com ([10.54.56.63])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 11:43:03 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-gfx@lists.freedesktop.org,
	vinay.belgaumkar@intel.com
Subject: [PATCH 1/2] drm/i915/guc: Use a delayed wakeref put in
 guc_engine_busyness()
Date: Thu, 10 Sep 2026 11:42:55 -0700
Message-ID: <20260910184253.1231313-5-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260910184253.1231313-4-umesh.nerlige.ramappa@intel.com>
References: <20260910184253.1231313-4-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

perf can invoke the PMU callbacks from the scheduler with the runqueue
lock held, e.g. pmu->del() via perf_cgroup_switch() from
finish_task_switch(). guc_engine_busyness() drops its GT wakeref there
with intel_gt_pm_put_async(), which lands in mod_delayed_work() with a
zero delay. That queues the work immediately and wakes a worker via
try_to_wake_up(), which then deadlocks on the runqueue lock we are
already holding. The put also happens under guc->timestamp.lock, so the
stall blocks any concurrent __guc_context_update_stats() too, and the
machine hard locks up.

Only reachable when a concurrent put drops the refcount to 1 inside the
get_if_awake()/put_async() window, which makes it rare and load
dependent.

Add intel_gt_pm_put_delay() and use it with a 1 jiffy delay. A non-zero
delay takes the add_timer_on() path in __queue_delayed_work() instead,
so no task is ever woken from here.

Fixes: 77cdd054dd2c ("drm/i915/pmu: Connect engine busyness stats from GuC to pmu")
Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16984
Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Assisted-by: Claude:claude-opus-5
---
 drivers/gpu/drm/i915/gt/intel_gt_pm.h         | 24 +++++++++++++++++++
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  7 +++++-
 2 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.h b/drivers/gpu/drm/i915/gt/intel_gt_pm.h
index 6f25c747bc29..24c8b014864d 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_pm.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.h
@@ -72,6 +72,30 @@ static inline void intel_gt_pm_put_async(struct intel_gt *gt, intel_wakeref_t ha
 	intel_gt_pm_put_async_untracked(gt);
 }
 
+/**
+ * intel_gt_pm_put_delay - release the GT wakeref, deferred by a timer
+ *
+ * @gt: pointer to the gt
+ * @handle: the handle returned by the matching intel_gt_pm_get*()
+ * @delay: delay, in jiffies, before the release is processed
+ *
+ * As intel_gt_pm_put_async(), except that dropping the last reference arms a
+ * timer instead of queueing the release immediately.
+ *
+ * intel_gt_pm_put_async() ends up in mod_delayed_work() with a zero delay,
+ * which queues the work straight away and so wakes a workqueue worker through
+ * try_to_wake_up(). That deadlocks if the caller already holds a runqueue
+ * lock, since try_to_wake_up() then tries to take it again. Callers which can
+ * run from inside the scheduler must use this variant with a non-zero @delay,
+ * which takes the add_timer_on() path and never wakes a task.
+ */
+static inline void intel_gt_pm_put_delay(struct intel_gt *gt, intel_wakeref_t handle,
+					 unsigned long delay)
+{
+	intel_wakeref_untrack(&gt->wakeref, handle);
+	intel_wakeref_put_delay(&gt->wakeref, delay);
+}
+
 #define with_intel_gt_pm(gt, wf) \
 	for ((wf) = intel_gt_pm_get(gt); (wf); intel_gt_pm_put((gt), (wf)), (wf) = NULL)
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 788e59cdfac9..32d722c378e8 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -1361,7 +1361,12 @@ static ktime_t guc_engine_busyness(struct intel_engine_cs *engine, ktime_t *now)
 		 */
 		guc_update_engine_gt_clks(engine);
 		guc_update_pm_timestamp(guc, now);
-		intel_gt_pm_put_async(gt, wakeref);
+		/*
+		 * We are reached from the perf callbacks, which perf may invoke
+		 * from the scheduler with the runqueue lock held. Defer the put
+		 * on a timer so that it can never wake a task from here.
+		 */
+		intel_gt_pm_put_delay(gt, wakeref, 1);
 		if (i915_reset_count(gpu_error) != reset_count) {
 			*stats = stats_saved;
 			guc->timestamp.gt_stamp = gt_stamp_saved;
-- 
2.55.0

