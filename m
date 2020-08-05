Return-Path: <SRS0=TleC=BP=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6D89C433E1
	for <intel-gfx@archiver.kernel.org>; Wed,  5 Aug 2020 12:23:17 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8B4322D2B
	for <intel-gfx@archiver.kernel.org>; Wed,  5 Aug 2020 12:23:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B8B4322D2B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85D156E5BF;
	Wed,  5 Aug 2020 12:23:00 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58BCD6E58B
 for <intel-gfx@lists.freedesktop.org>; Wed,  5 Aug 2020 12:22:55 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from build.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 22039463-1500050 
 for multiple; Wed, 05 Aug 2020 13:22:31 +0100
From: Chris Wilson <chris@chris-wilson.co.uk>
To: intel-gfx@lists.freedesktop.org
Date: Wed,  5 Aug 2020 13:21:58 +0100
Message-Id: <20200805122231.23313-5-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200805122231.23313-1-chris@chris-wilson.co.uk>
References: <20200805122231.23313-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 04/37] drm/i915/gt: Defer enabling the
 breadcrumb interrupt to after submission
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
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Move the register slow register write and readback from out of the
critical path for execlists submission and delay it until the following
worker, shaving off around 200us. Note that the same signal_irq_work() is
allowed to run concurrently on each CPU (but it will only be queued once,
once running though it can be requeued and reexecuted) so we have to
remember to lock the global interactions as we cannot rely on the
signal_irq_work() itself providing the serialisation (in constrast to a
tasklet).

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 drivers/gpu/drm/i915/gt/intel_breadcrumbs.c | 72 ++++++++++++++-------
 drivers/gpu/drm/i915/gt/intel_engine_pm.h   |  5 ++
 2 files changed, 52 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c b/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c
index d8b206e53660..dee6d5c9b413 100644
--- a/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c
+++ b/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c
@@ -30,6 +30,7 @@
 #include "i915_trace.h"
 #include "intel_breadcrumbs.h"
 #include "intel_context.h"
+#include "intel_engine_pm.h"
 #include "intel_gt_pm.h"
 #include "intel_gt_requests.h"
 
@@ -57,12 +58,10 @@ static void irq_disable(struct intel_engine_cs *engine)
 
 static void __intel_breadcrumbs_arm_irq(struct intel_breadcrumbs *b)
 {
-	lockdep_assert_held(&b->irq_lock);
-
-	if (!b->irq_engine || b->irq_armed)
+	if (!b->irq_engine)
 		return;
 
-	if (!intel_gt_pm_get_if_awake(b->irq_engine->gt))
+	if (GEM_WARN_ON(!intel_gt_pm_get_if_awake(b->irq_engine->gt)))
 		return;
 
 	/*
@@ -83,15 +82,13 @@ static void __intel_breadcrumbs_arm_irq(struct intel_breadcrumbs *b)
 
 	if (!b->irq_enabled++)
 		irq_enable(b->irq_engine);
+
+	/* Requests may have completed before we could enable the interrupt. */
+	irq_work_queue(&b->irq_work);
 }
 
 static void __intel_breadcrumbs_disarm_irq(struct intel_breadcrumbs *b)
 {
-	lockdep_assert_held(&b->irq_lock);
-
-	if (!b->irq_engine || !b->irq_armed)
-		return;
-
 	GEM_BUG_ON(!b->irq_enabled);
 	if (!--b->irq_enabled)
 		irq_disable(b->irq_engine);
@@ -105,8 +102,6 @@ static void add_signaling_context(struct intel_breadcrumbs *b,
 {
 	intel_context_get(ce);
 	list_add_tail(&ce->signal_link, &b->signalers);
-	if (list_is_first(&ce->signal_link, &b->signalers))
-		__intel_breadcrumbs_arm_irq(b);
 }
 
 static void remove_signaling_context(struct intel_breadcrumbs *b,
@@ -197,7 +192,30 @@ static void signal_irq_work(struct irq_work *work)
 
 	spin_lock(&b->irq_lock);
 
-	if (list_empty(&b->signalers))
+	/*
+	 * Keep the irq armed until the interrupt after all listeners are gone.
+	 *
+	 * Enabling/disabling the interrupt is rather costly, roughly a couple
+	 * of hundred microseconds. If we are proactive and enable/disable
+	 * the interrupt around every request that wants a breadcrumb, we
+	 * quickly drown in the extra orders of magnitude of latency imposed
+	 * on request submission.
+	 *
+	 * So we try to be lazy, and keep the interrupts enabled until no
+	 * more listeners appear within a breadcrumb interrupt interval (that
+	 * is until a request completes that no one cares about). The
+	 * observation is that listeners come in batches, and will often
+	 * listen to a bunch of requests in succession.
+	 *
+	 * We also try to avoid raising too many interrupts, as they may
+	 * be generated by userspace batches and it is unfortunately rather
+	 * too easy to drown the CPU under a flood of GPU interrupts. Thus
+	 * whenever no one appears to be listening, we turn off the interrupts.
+	 * Fewer interrupts should conserve power -- at the very least, fewer
+	 * interrupt draw less ire from other users of the system and tools
+	 * like powertop.
+	 */
+	if (b->irq_armed && list_empty(&b->signalers))
 		__intel_breadcrumbs_disarm_irq(b);
 
 	list_splice_init(&b->signaled_requests, &signal);
@@ -251,6 +269,15 @@ static void signal_irq_work(struct irq_work *work)
 
 		i915_request_put(rq);
 	}
+
+	if (!READ_ONCE(b->irq_armed) && !list_empty(&b->signalers)) {
+		spin_lock(&b->irq_lock);
+		if (!b->irq_armed)
+			__intel_breadcrumbs_arm_irq(b);
+		spin_unlock(&b->irq_lock);
+	}
+	if (READ_ONCE(b->irq_armed) && intel_engine_is_parking(b->irq_engine))
+		irq_work_queue(&b->irq_work); /* flush the signalers */
 }
 
 struct intel_breadcrumbs *
@@ -292,16 +319,8 @@ void intel_breadcrumbs_reset(struct intel_breadcrumbs *b)
 
 void intel_breadcrumbs_park(struct intel_breadcrumbs *b)
 {
-	unsigned long flags;
-
-	if (!READ_ONCE(b->irq_armed))
-		return;
-
-	spin_lock_irqsave(&b->irq_lock, flags);
-	__intel_breadcrumbs_disarm_irq(b);
-	spin_unlock_irqrestore(&b->irq_lock, flags);
-
-	if (!list_empty(&b->signalers))
+	/* Kick the work once more to drain the signalers */
+	if (READ_ONCE(b->irq_armed))
 		irq_work_queue(&b->irq_work);
 }
 
@@ -362,9 +381,12 @@ static void insert_breadcrumb(struct i915_request *rq,
 	GEM_BUG_ON(!check_signal_order(ce, rq));
 	set_bit(I915_FENCE_FLAG_SIGNAL, &rq->fence.flags);
 
-	/* Check after attaching to irq, interrupt may have already fired. */
-	if (__request_completed(rq))
-		irq_work_queue(&b->irq_work);
+	/*
+	 * Defer enabling the interrupt to after HW submission and recheck
+	 * the request as it may have completed and raised the interrupt as
+	 * we were attaching it into the lists.
+	 */
+	irq_work_queue(&b->irq_work);
 }
 
 bool i915_request_enable_breadcrumb(struct i915_request *rq)
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_pm.h b/drivers/gpu/drm/i915/gt/intel_engine_pm.h
index 418df0a13145..06267c20b0a1 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_pm.h
+++ b/drivers/gpu/drm/i915/gt/intel_engine_pm.h
@@ -17,6 +17,11 @@ intel_engine_pm_is_awake(const struct intel_engine_cs *engine)
 	return intel_wakeref_is_active(&engine->wakeref);
 }
 
+static inline bool intel_engine_is_parking(const struct intel_engine_cs *engine)
+{
+	return atomic_read(&engine->wakeref.count) == 0;
+}
+
 static inline void intel_engine_pm_get(struct intel_engine_cs *engine)
 {
 	intel_wakeref_get(&engine->wakeref);
-- 
2.20.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
