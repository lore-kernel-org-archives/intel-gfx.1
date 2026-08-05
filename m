Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F22CC561E6
	for <intel-gfx@archiver.kernel.org>; Wed,  5 Aug 2026 06:45:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBFB610ED1D;
	Wed,  5 Aug 2026 06:45:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PJPk3UJG";
	dkim-atps=neutral
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78C2D10ED1D
 for <intel-gfx@lists.freedesktop.org>; Wed,  5 Aug 2026 06:45:47 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-38511175ad3so530006a91.2
 for <intel-gfx@lists.freedesktop.org>; Tue, 04 Aug 2026 23:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785912347; x=1786517147; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=3IeHonVU+uKZ8ZJ0JwyJk4mskUUQ64nNqMUIv81MkYQ=;
 b=PJPk3UJGYSTMbSViDvcyirOYDyzsijwjbYCuirXLG1mi3IoXzflQ1pdF1Hbqr86A7v
 mOGS3RZlx0bI7Ncl37hLdWxKwgtP2Fr/C1z7Cg6JEyOB3Ue6PEeAfcl0W+NRp1QIPMB4
 8vWgEb010HpRdwhKKSeYUzeDaFlej2+Y7uJmSgz/RmNgBzfdXL+se/+z5+ipXN8ZZ8sT
 VLlT9MdPLq/gj+nGpW5XZ6NMYf3gB6/X99CtAnK6GTqaOKo4cO9rLyLkeZxHuC/GyprG
 GJCyhDNt1THRUcnk+fW5KuXrzyShr+WXAB+7opCxdEAM4TiK5UtveVw1sHS7dRjokTqH
 JPeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785912347; x=1786517147;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=3IeHonVU+uKZ8ZJ0JwyJk4mskUUQ64nNqMUIv81MkYQ=;
 b=TQyiFwJBM3cdAwZSWDF1U597zl4d27ZsCvfYRk/agFfAVydwMyrfXc04A3/5et6xG5
 RtvN9z7WFWFR3O+1dffIcMldm1PO0lWFCbnaAT0wN7JD4VM854ko6MM+xSZ0jPFv5nwO
 du188gOcG6tuJfGoKqEPfeqhU7wNXpPFCm+prHlTcDOZxxNIHtpql5PUB5qzWh4qEGHL
 RyS5KDS2TNU5f5LniBF/i9l64MclVkLdlr+boO7VeC6q1dIWJPjE0C4CFueJ+0jATuO1
 SBWHeX4ZVUIGSwjOWY/VzslvPr90fPVbZR/JHac/tRC4D30y3VubxPQjBZecM2zRTonw
 UVxA==
X-Gm-Message-State: AOJu0Yw7VKBZK1hosQ6ErzH8hnuLk+iDtDT/gAhlm9swlUoeNJ3CiPs6
 r0c+Qov7RdM0eyyVWQz9pGtErj7oyCbtZ8wPF7asu0KrSbODSvBGmqkMiErq3eGm
X-Gm-Gg: AR+sD10h0lbsSpmfCgsb8+PDv1GkaB1/zoLcrNLoxkAztx3RaQn6JdbV+2hFUs1g9+1
 3q4WVL55hjHgs4e5XGjBPVx6w/lK6L/6hH8dZoU48u4L1dOhTdBeOKj+PLd39MmxXpY7Xvd+q70
 BaCBoP9Q2RG56RHOrLpkXklM4qqLxB+tC75c+jebfVUKlXYIxEb5kBn6OhNp/LQtP4AIAWLU6Hk
 1Z87ipby0Z73l5x+1PyrqSCxhE3fyjHXh9dqd94uuTs42ZDoDyL/dijrgXRujCP7J93ymiLKCtj
 Kk6UcuXjgM+TES5N8rga/sflxt88o3goGYGhGcwnmn2BdN0d4SlK0TIxcq9B1u+YM6lKk7la5y1
 GmduVTKqKQNW8gKlNKS3NwpaJHG+ZMby2pGX+hVqFNJMHE/loZifBgi1wG4MEtKncRS2j89DAhW
 J9aIr8UqSv1Gh7D5sg1FdBY0SyKRxqyaInCs8XbCpnZUEIH8G5FUzhFVjponmGE4ommyOCCHR9E
 9EiN8K0u1rbY9Y26g1u
X-Received: by 2002:a17:90b:3c06:b0:38d:e658:595a with SMTP id
 98e67ed59e1d1-3903c54f1fdmr4635061a91.2.1785912346774; 
 Tue, 04 Aug 2026 23:45:46 -0700 (PDT)
Received: from liuweife-desk2.sh.intel.com ([192.55.55.42])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-13fca926c0bsm10399086c88.14.2026.08.04.23.45.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Aug 2026 23:45:46 -0700 (PDT)
From: Weifeng Liu <weifeng.liu.z@gmail.com>
To: intel-gfx@lists.freedesktop.org
Cc: matthew.brost@intel.com, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 tursulin@ursulin.net, dri-devel@lists.freedesktop.org,
 Weifeng Liu <weifeng.liu.z@gmail.com>
Subject: [PATCH] drm/i915: Make suspend idle wait uninterruptible
Date: Wed,  5 Aug 2026 14:45:39 +0800
Message-ID: <20260805064539.1034880-1-weifeng.liu.z@gmail.com>
X-Mailer: git-send-email 2.55.0
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

wait_for_suspend() only handles -ETIME from the GT idle wait. However,
the wait can also be interrupted by a pending signal while retiring
requests or waiting for GuC messages, e.g., during the reboot process
invoked by init. This skips the wedge and cleanup path and may leave
suspend waiting indefinitely for a leaked wakeref.

Make only the suspend idle wait uninterruptible while preserving its
existing timeout. Other callers remain interruptible, and the GT is
still wedged only when the timeout expires.

Cc: Matthew Brost <matthew.brost@intel.com>
Assisted-by: OpenCode:GPT-5.6-Sol
Signed-off-by: Weifeng Liu <weifeng.liu.z@gmail.com>
---
 drivers/gpu/drm/i915/gt/intel_gt.c            | 24 +++++++++++++++----
 drivers/gpu/drm/i915/gt/intel_gt.h            |  1 +
 drivers/gpu/drm/i915/gt/intel_gt_pm.c         |  3 ++-
 drivers/gpu/drm/i915/gt/intel_gt_requests.c   |  8 ++++---
 drivers/gpu/drm/i915/gt/intel_gt_requests.h   | 13 ++++++++--
 drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  3 ++-
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  5 ++--
 drivers/gpu/drm/i915/gt/uc/intel_uc.h         |  6 +++--
 8 files changed, 47 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index 5c7f862f7100..5eaa52f535d4 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -659,7 +659,9 @@ static void __intel_gt_disable(struct intel_gt *gt)
 	GEM_BUG_ON(intel_gt_pm_is_awake(gt));
 }
 
-int intel_gt_wait_for_idle(struct intel_gt *gt, long timeout)
+static int __intel_gt_wait_for_idle(struct intel_gt *gt,
+				    bool interruptible,
+				    long timeout)
 {
 	long remaining_timeout;
 
@@ -667,10 +669,11 @@ int intel_gt_wait_for_idle(struct intel_gt *gt, long timeout)
 	if (!intel_gt_pm_is_awake(gt))
 		return 0;
 
-	while ((timeout = intel_gt_retire_requests_timeout(gt, timeout,
-							   &remaining_timeout)) > 0) {
+	while ((timeout = __intel_gt_retire_requests_timeout(gt, interruptible,
+							     timeout,
+							     &remaining_timeout)) > 0) {
 		cond_resched();
-		if (signal_pending(current))
+		if (interruptible && signal_pending(current))
 			return -EINTR;
 	}
 
@@ -680,7 +683,18 @@ int intel_gt_wait_for_idle(struct intel_gt *gt, long timeout)
 	if (remaining_timeout < 0)
 		remaining_timeout = 0;
 
-	return intel_uc_wait_for_idle(&gt->uc, remaining_timeout);
+	return intel_uc_wait_for_idle(&gt->uc, interruptible,
+				      remaining_timeout);
+}
+
+int intel_gt_wait_for_idle(struct intel_gt *gt, long timeout)
+{
+	return __intel_gt_wait_for_idle(gt, true, timeout);
+}
+
+int intel_gt_wait_for_idle_uninterruptible(struct intel_gt *gt, long timeout)
+{
+	return __intel_gt_wait_for_idle(gt, false, timeout);
 }
 
 int intel_gt_init(struct intel_gt *gt)
diff --git a/drivers/gpu/drm/i915/gt/intel_gt.h b/drivers/gpu/drm/i915/gt/intel_gt.h
index 998ca029b73a..6c7e5415f1dc 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt.h
@@ -143,6 +143,7 @@ void intel_gt_driver_release(struct intel_gt *gt);
 void intel_gt_driver_late_release_all(struct drm_i915_private *i915);
 
 int intel_gt_wait_for_idle(struct intel_gt *gt, long timeout);
+int intel_gt_wait_for_idle_uninterruptible(struct intel_gt *gt, long timeout);
 
 void intel_gt_check_and_clear_faults(struct intel_gt *gt);
 i915_reg_t intel_gt_perf_limit_reasons_reg(struct intel_gt *gt);
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
index c7f59d60fac6..9fe31aa07ae8 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_pm.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
@@ -315,7 +315,8 @@ static void wait_for_suspend(struct intel_gt *gt)
 	if (!intel_gt_pm_is_awake(gt))
 		return;
 
-	if (intel_gt_wait_for_idle(gt, I915_GT_SUSPEND_IDLE_TIMEOUT) == -ETIME) {
+	if (intel_gt_wait_for_idle_uninterruptible(gt,
+						   I915_GT_SUSPEND_IDLE_TIMEOUT) == -ETIME) {
 		/*
 		 * Forcibly cancel outstanding work and leave
 		 * the gpu quiet.
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_requests.c b/drivers/gpu/drm/i915/gt/intel_gt_requests.c
index 93298820bee2..b37e8f1d0b5c 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_requests.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_requests.c
@@ -130,8 +130,10 @@ void intel_engine_fini_retire(struct intel_engine_cs *engine)
 	GEM_BUG_ON(engine->retire);
 }
 
-long intel_gt_retire_requests_timeout(struct intel_gt *gt, long timeout,
-				      long *remaining_timeout)
+long __intel_gt_retire_requests_timeout(struct intel_gt *gt,
+					bool interruptible,
+					long timeout,
+					long *remaining_timeout)
 {
 	struct intel_gt_timelines *timelines = &gt->timelines;
 	struct intel_timeline *tl, *tn;
@@ -159,7 +161,7 @@ long intel_gt_retire_requests_timeout(struct intel_gt *gt, long timeout,
 				mutex_unlock(&tl->mutex);
 
 				timeout = dma_fence_wait_timeout(fence,
-								 true,
+								 interruptible,
 								 timeout);
 				dma_fence_put(fence);
 
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_requests.h b/drivers/gpu/drm/i915/gt/intel_gt_requests.h
index d2969f68dd64..9242f85f4040 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_requests.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_requests.h
@@ -12,8 +12,17 @@ struct intel_engine_cs;
 struct intel_gt;
 struct intel_timeline;
 
-long intel_gt_retire_requests_timeout(struct intel_gt *gt, long timeout,
-				      long *remaining_timeout);
+long __intel_gt_retire_requests_timeout(struct intel_gt *gt,
+					bool interruptible,
+					long timeout,
+					long *remaining_timeout);
+static inline long
+intel_gt_retire_requests_timeout(struct intel_gt *gt, long timeout,
+				 long *remaining_timeout)
+{
+	return __intel_gt_retire_requests_timeout(gt, true, timeout,
+						    remaining_timeout);
+}
 static inline void intel_gt_retire_requests(struct intel_gt *gt)
 {
 	intel_gt_retire_requests_timeout(gt, 0, NULL);
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
index 053780f562c1..b5f4fddf5c1d 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
@@ -509,7 +509,8 @@ static inline void intel_guc_disable_msg(struct intel_guc *guc, u32 mask)
 	spin_unlock_irq(&guc->irq_lock);
 }
 
-int intel_guc_wait_for_idle(struct intel_guc *guc, long timeout);
+int intel_guc_wait_for_idle(struct intel_guc *guc, bool interruptible,
+			    long timeout);
 
 int intel_guc_deregister_done_process_msg(struct intel_guc *guc,
 					  const u32 *msg, u32 len);
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 788e59cdfac9..aa74208c2b4e 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -680,14 +680,15 @@ int intel_guc_wait_for_pending_msg(struct intel_guc *guc,
 	return (timeout < 0) ? timeout : 0;
 }
 
-int intel_guc_wait_for_idle(struct intel_guc *guc, long timeout)
+int intel_guc_wait_for_idle(struct intel_guc *guc, bool interruptible,
+			    long timeout)
 {
 	if (!intel_uc_uses_guc_submission(&guc_to_gt(guc)->uc))
 		return 0;
 
 	return intel_guc_wait_for_pending_msg(guc,
 					      &guc->outstanding_submission_g2h,
-					      true, timeout);
+					      interruptible, timeout);
 }
 
 static int guc_context_policy_init_v70(struct intel_context *ce, bool loop);
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.h b/drivers/gpu/drm/i915/gt/uc/intel_uc.h
index 014bb7d83689..b62fe3b96b64 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.h
@@ -96,9 +96,11 @@ uc_state_checkers(gsc, gsc_uc);
 #undef uc_state_checkers
 #undef __uc_state_checker
 
-static inline int intel_uc_wait_for_idle(struct intel_uc *uc, long timeout)
+static inline int intel_uc_wait_for_idle(struct intel_uc *uc,
+					 bool interruptible,
+					 long timeout)
 {
-	return intel_guc_wait_for_idle(&uc->guc, timeout);
+	return intel_guc_wait_for_idle(&uc->guc, interruptible, timeout);
 }
 
 #define intel_uc_ops_function(_NAME, _OPS, _TYPE, _RET) \
-- 
2.55.0

