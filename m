Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B578CA5FAD
	for <intel-gfx@archiver.kernel.org>; Tue, 29 Sep 2026 19:01:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 008DE10F04C;
	Tue, 29 Sep 2026 19:01:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="frTny/Cu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2AC610F006
 for <intel-gfx@lists.freedesktop.org>; Tue, 29 Sep 2026 19:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790708514; x=1822244514;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iLGnG0G7MNQljCMe2DDTdilJNq4gepnrABEmEM3BmKc=;
 b=frTny/Cu3bUNChXmvGkUevyI2zgNHjcjF282m1AZKBTPS031+6EeCeKB
 TSWVpXx2gA1u1RoKPix3RguHMFqCpxz8ZAcWccXjYe3GrPqzbYfXTjNg+
 sJWNDTAtg0JACuwpXSbHrEdTq+2Q4dBbuOTWx1DMmiI2XT0K8eqfZ5HyM
 rgW1vOWTnHpWyxcj7GMkNkgl5WxEQ2mjX8jNBJF+Kyk8KmiylryvdGimV
 BVUQvxHJatcM9yGADSu2quGdwjE75GIumdMgBdWChYke86S3m9vAU58ii
 aUiwdssxRVtzHSJz2kf+p/8dWkaMxdC6yCH2nSkPk5jpDkdvLJ4V9C7L3 g==;
X-CSE-ConnectionGUID: lK9104IcQh2BtWNX15AAXw==
X-CSE-MsgGUID: Xap+b/8SQsSjp0KpE/iVoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="90564114"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="90564114"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 12:01:54 -0700
X-CSE-ConnectionGUID: LtS4+Ez1QByvB/lhm6fpBQ==
X-CSE-MsgGUID: vzIF/CUxQPuEfhgw5ennHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="274062223"
Received: from orsosgc001.jf.intel.com ([10.54.56.63])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 12:01:54 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-gfx@lists.freedesktop.org,
	vinay.belgaumkar@intel.com
Cc: dev@lankhorst.se
Subject: [PATCH 3/3] drm/i915/pmu: Use a delayed wakeref put in get_rc6()
Date: Tue, 29 Sep 2026 12:01:51 -0700
Message-ID: <20260929190147.2886670-8-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929190147.2886670-5-umesh.nerlige.ramappa@intel.com>
References: <20260929190147.2886670-5-umesh.nerlige.ramappa@intel.com>
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

get_rc6() has the same runqueue lock deadlock as guc_engine_busyness():
it is called from the PMU callbacks, which perf can invoke from the
scheduler with the runqueue lock held, and intel_gt_pm_put_async() there
can wake a workqueue worker via try_to_wake_up().

Use intel_gt_pm_put_delay() so the deferred put arms a timer instead.

The remaining async puts in atomic contexts (hrtimer, tasklet, irq_work,
G2H handlers) cannot run with the runqueue lock held and are left alone.

Fixes: 07779a76ee1f ("drm/i915: Mark up the calling context for intel_wakeref_put()")
Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Assisted-by: Claude:claude-opus-5
---
v2: Reword comment in code (Vinay)
---
 drivers/gpu/drm/i915/i915_pmu.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
index 9ea5626399e5..0ebf1620519b 100644
--- a/drivers/gpu/drm/i915/i915_pmu.c
+++ b/drivers/gpu/drm/i915/i915_pmu.c
@@ -229,7 +229,16 @@ static u64 get_rc6(struct intel_gt *gt)
 	wakeref = intel_gt_pm_get_if_awake(gt);
 	if (wakeref) {
 		val = __get_rc6(gt);
-		intel_gt_pm_put_async(gt, wakeref);
+		/*
+		 * Perf framework may invoke this from the scheduler with the
+		 * runqueue lock held. If we are the last to drop the reference
+		 * here, then we cannot use intel_gt_pm_put_async since that can
+		 * result in waking up a task from this context which would try
+		 * to re-acquire the runqueue lock. To avoid such a deadlock,
+		 * defer the put on a timer so that waking the task can happen
+		 * from a timer context.
+		 */
+		intel_gt_pm_put_delay(gt, wakeref, 1);
 	}
 
 	spin_lock_irqsave(&pmu->lock, flags);
-- 
2.55.0

