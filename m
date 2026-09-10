Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD45EC79FBF
	for <intel-gfx@archiver.kernel.org>; Thu, 10 Sep 2026 18:43:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C3D710E2AE;
	Thu, 10 Sep 2026 18:43:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WT/tgNWG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC16610E2A0
 for <intel-gfx@lists.freedesktop.org>; Thu, 10 Sep 2026 18:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789065784; x=1820601784;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=EsGIgv4UpZ+3cprwh2SAM0lpReDnHHDfL0pDYGe30MM=;
 b=WT/tgNWGyakGfbzBJEjEXHAn2sZywIv6W00eILuN+f4P5uL5RLIXoSrU
 QfH8msaWt+YFHmpBNYhIkMsDJMuC4ksc2u89pgSvvJoTAMhe1GJXx7XO2
 mJSdss0g4lUiWeCyw91wlzef8kkEl/98M9OLookJREiNL/isX/ZvkvAw1
 s3F6a8l8g4LC1gHzCZOpEccUPMV16QAcVC+IuH2gHkJMsfZYFKqpiCeU5
 8vaNwEswc5FuHN3pauj3ViJsRPa4jl8Z3xNgCAuC4itIBUeBCB62IBk1c
 HA2QYci75gXbZhKGed8EyXV6xwrD0qjJOdlVzPbu7bcpRkvORzFKf6h5F A==;
X-CSE-ConnectionGUID: FPonEdE8RYSi52mSlmIO8A==
X-CSE-MsgGUID: UHWUBMXfSfGj9EfbUikKSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="77085244"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="77085244"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 11:43:03 -0700
X-CSE-ConnectionGUID: SoYrj+HYQEealnP19E+Klg==
X-CSE-MsgGUID: f9/K+NnUQKOTqn3QEI1Hig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; d="scan'208";a="268424706"
Received: from orsosgc001.jf.intel.com ([10.54.56.63])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 11:43:03 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-gfx@lists.freedesktop.org,
	vinay.belgaumkar@intel.com
Subject: [PATCH 2/2] drm/i915/pmu: Use a delayed wakeref put in get_rc6()
Date: Thu, 10 Sep 2026 11:42:56 -0700
Message-ID: <20260910184253.1231313-6-umesh.nerlige.ramappa@intel.com>
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

get_rc6() has the same runqueue lock deadlock as guc_engine_busyness():
it is reached from the PMU callbacks, which perf can invoke from the
scheduler with the runqueue lock held, and intel_gt_pm_put_async() there
can wake a workqueue worker via try_to_wake_up().

Use intel_gt_pm_put_delay() so the deferred put arms a timer instead.

The remaining async puts in atomic contexts (hrtimer, tasklet, irq_work,
G2H handlers) cannot run with the runqueue lock held and are left alone.

Fixes: 07779a76ee1f ("drm/i915: Mark up the calling context for intel_wakeref_put()")
Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Assisted-by: Claude:claude-opus-5
---
 drivers/gpu/drm/i915/i915_pmu.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
index 1c3bafda9c70..4598d9b5678a 100644
--- a/drivers/gpu/drm/i915/i915_pmu.c
+++ b/drivers/gpu/drm/i915/i915_pmu.c
@@ -229,7 +229,12 @@ static u64 get_rc6(struct intel_gt *gt)
 	wakeref = intel_gt_pm_get_if_awake(gt);
 	if (wakeref) {
 		val = __get_rc6(gt);
-		intel_gt_pm_put_async(gt, wakeref);
+		/*
+		 * We are reached from the perf callbacks, which perf may invoke
+		 * from the scheduler with the runqueue lock held. Defer the put
+		 * on a timer so that it can never wake a task from here.
+		 */
+		intel_gt_pm_put_delay(gt, wakeref, 1);
 	}
 
 	spin_lock_irqsave(&pmu->lock, flags);
-- 
2.55.0

