Return-Path: <SRS0=EmSX=BK=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B0B6C433E0
	for <intel-gfx@archiver.kernel.org>; Fri, 31 Jul 2020 15:48:40 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCBCF2083B
	for <intel-gfx@archiver.kernel.org>; Fri, 31 Jul 2020 15:48:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CCBCF2083B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 650006EB09;
	Fri, 31 Jul 2020 15:48:39 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 904336EB0D
 for <intel-gfx@lists.freedesktop.org>; Fri, 31 Jul 2020 15:48:37 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from build.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 21995296-1500050 
 for <intel-gfx@lists.freedesktop.org>; Fri, 31 Jul 2020 16:48:34 +0100
From: Chris Wilson <chris@chris-wilson.co.uk>
To: intel-gfx@lists.freedesktop.org
Date: Fri, 31 Jul 2020 16:48:32 +0100
Message-Id: <20200731154834.8378-2-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200731154834.8378-1-chris@chris-wilson.co.uk>
References: <20200731154834.8378-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [Intel-gfx] [CI 2/4] drm/i915/gt: Replace
 intel_engine_transfer_stale_breadcrumbs
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

After staring at the breadcrumb enabling/cancellation and coming to the
conclusion that the cause of the mysterious stale breadcrumbs must the
act of submitting a completed requests, we can then redirect those
completed requests onto a dedicated signaled_list at the time of
construction and so eliminate intel_engine_transfer_stale_breadcrumbs().

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_breadcrumbs.c | 50 ++++++++-------------
 drivers/gpu/drm/i915/gt/intel_engine.h      |  3 --
 drivers/gpu/drm/i915/gt/intel_lrc.c         | 15 -------
 drivers/gpu/drm/i915/i915_request.c         |  5 +--
 4 files changed, 21 insertions(+), 52 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c b/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c
index 3d211a0c2b5a..fbdc465a5870 100644
--- a/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c
+++ b/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c
@@ -142,16 +142,16 @@ static void add_retire(struct intel_breadcrumbs *b, struct intel_timeline *tl)
 	intel_engine_add_retire(engine, tl);
 }
 
-static void __signal_request(struct i915_request *rq, struct list_head *signals)
+static bool __signal_request(struct i915_request *rq, struct list_head *signals)
 {
-	GEM_BUG_ON(!test_bit(I915_FENCE_FLAG_SIGNAL, &rq->fence.flags));
 	clear_bit(I915_FENCE_FLAG_SIGNAL, &rq->fence.flags);
 
 	if (!__dma_fence_signal(&rq->fence))
-		return;
+		return false;
 
 	i915_request_get(rq);
 	list_add_tail(&rq->signal_link, signals);
+	return true;
 }
 
 static void signal_irq_work(struct irq_work *work)
@@ -278,32 +278,6 @@ void intel_engine_reset_breadcrumbs(struct intel_engine_cs *engine)
 	spin_unlock_irqrestore(&b->irq_lock, flags);
 }
 
-void intel_engine_transfer_stale_breadcrumbs(struct intel_engine_cs *engine,
-					     struct intel_context *ce)
-{
-	struct intel_breadcrumbs *b = &engine->breadcrumbs;
-	unsigned long flags;
-
-	spin_lock_irqsave(&b->irq_lock, flags);
-	if (!list_empty(&ce->signals)) {
-		struct i915_request *rq, *next;
-
-		/* Queue for executing the signal callbacks in the irq_work */
-		list_for_each_entry_safe(rq, next, &ce->signals, signal_link) {
-			GEM_BUG_ON(rq->engine != engine);
-			GEM_BUG_ON(!__request_completed(rq));
-
-			__signal_request(rq, &b->signaled_requests);
-		}
-
-		INIT_LIST_HEAD(&ce->signals);
-		list_del_init(&ce->signal_link);
-
-		irq_work_queue(&b->irq_work);
-	}
-	spin_unlock_irqrestore(&b->irq_lock, flags);
-}
-
 void intel_engine_fini_breadcrumbs(struct intel_engine_cs *engine)
 {
 }
@@ -317,6 +291,17 @@ static void insert_breadcrumb(struct i915_request *rq,
 	if (test_bit(I915_FENCE_FLAG_SIGNAL, &rq->fence.flags))
 		return;
 
+	/*
+	 * If the request is already completed, we can transfer it
+	 * straight onto a signaled list, and queue the irq worker for
+	 * its signal completion.
+	 */
+	if (__request_completed(rq)) {
+		if (__signal_request(rq, &b->signaled_requests))
+			irq_work_queue(&b->irq_work);
+		return;
+	}
+
 	__intel_breadcrumbs_arm_irq(b);
 
 	/*
@@ -344,8 +329,11 @@ static void insert_breadcrumb(struct i915_request *rq,
 	if (pos == &ce->signals) /* catch transitions from empty list */
 		list_move_tail(&ce->signal_link, &b->signalers);
 	GEM_BUG_ON(!check_signal_order(ce, rq));
-
 	set_bit(I915_FENCE_FLAG_SIGNAL, &rq->fence.flags);
+
+	/* Check after attaching to irq, interrupt may have already fired. */
+	if (__request_completed(rq))
+		irq_work_queue(&b->irq_work);
 }
 
 bool i915_request_enable_breadcrumb(struct i915_request *rq)
@@ -401,7 +389,7 @@ bool i915_request_enable_breadcrumb(struct i915_request *rq)
 
 	spin_unlock(&b->irq_lock);
 
-	return !__request_completed(rq);
+	return true;
 }
 
 void i915_request_cancel_breadcrumb(struct i915_request *rq)
diff --git a/drivers/gpu/drm/i915/gt/intel_engine.h b/drivers/gpu/drm/i915/gt/intel_engine.h
index a9249a23903a..faf00a353e25 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine.h
+++ b/drivers/gpu/drm/i915/gt/intel_engine.h
@@ -237,9 +237,6 @@ intel_engine_signal_breadcrumbs(struct intel_engine_cs *engine)
 void intel_engine_reset_breadcrumbs(struct intel_engine_cs *engine);
 void intel_engine_fini_breadcrumbs(struct intel_engine_cs *engine);
 
-void intel_engine_transfer_stale_breadcrumbs(struct intel_engine_cs *engine,
-					     struct intel_context *ce);
-
 void intel_engine_print_breadcrumbs(struct intel_engine_cs *engine,
 				    struct drm_printer *p);
 
diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
index d06e8420ee59..94c0942934ff 100644
--- a/drivers/gpu/drm/i915/gt/intel_lrc.c
+++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
@@ -1805,18 +1805,6 @@ static bool virtual_matches(const struct virtual_engine *ve,
 	return true;
 }
 
-static void virtual_xfer_breadcrumbs(struct virtual_engine *ve)
-{
-	/*
-	 * All the outstanding signals on ve->siblings[0] must have
-	 * been completed, just pending the interrupt handler. As those
-	 * signals still refer to the old sibling (via rq->engine), we must
-	 * transfer those to the old irq_worker to keep our locking
-	 * consistent.
-	 */
-	intel_engine_transfer_stale_breadcrumbs(ve->siblings[0], &ve->context);
-}
-
 #define for_each_waiter(p__, rq__) \
 	list_for_each_entry_lockless(p__, \
 				     &(rq__)->sched.waiters_list, \
@@ -2275,9 +2263,6 @@ static void execlists_dequeue(struct intel_engine_cs *engine)
 					virtual_update_register_offsets(regs,
 									engine);
 
-				if (!list_empty(&ve->context.signals))
-					virtual_xfer_breadcrumbs(ve);
-
 				/*
 				 * Move the bound engine to the top of the list
 				 * for future execution. We then kick this
diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
index 350bf6f158cb..0cf2a10a24f1 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -592,9 +592,8 @@ bool __i915_request_submit(struct i915_request *request)
 	 */
 	__notify_execute_cb_irq(request);
 
-	if (test_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT, &request->fence.flags) &&
-	    !i915_request_enable_breadcrumb(request))
-		intel_engine_signal_breadcrumbs(engine);
+	if (test_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT, &request->fence.flags))
+		i915_request_enable_breadcrumb(request);
 
 	return result;
 }
-- 
2.20.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
