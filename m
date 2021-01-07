Return-Path: <SRS0=BkXb=GK=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49C0FC433E6
	for <intel-gfx@archiver.kernel.org>; Thu,  7 Jan 2021 22:17:38 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BA67235FD
	for <intel-gfx@archiver.kernel.org>; Thu,  7 Jan 2021 22:17:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9BA67235FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B1246E550;
	Thu,  7 Jan 2021 22:17:37 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD04B6E550
 for <intel-gfx@lists.freedesktop.org>; Thu,  7 Jan 2021 22:17:35 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from build.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 23532723-1500050 
 for multiple; Thu, 07 Jan 2021 22:17:26 +0000
From: Chris Wilson <chris@chris-wilson.co.uk>
To: intel-gfx@lists.freedesktop.org
Date: Thu,  7 Jan 2021 22:17:21 +0000
Message-Id: <20210107221724.10036-2-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210107221724.10036-1-chris@chris-wilson.co.uk>
References: <20210107221724.10036-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 2/5] drm/i915/gt: Restore ce->signal flush
 before releasing virtual engine
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

Before we mark the virtual engine as no longer inflight, flush any
ongoing signaling that may be using the ce->signal_link along the
previous breadcrumbs. On switch to a new physical engine, that link will
be inserted into the new set of breadcrumbs, causing confusion to an
ongoing iterator.

This patch undoes a last minute mistake introduced into commit
bab0557c8dca ("drm/i915/gt: Remove virtual breadcrumb before transfer"),
whereby instead of unconditionally applying the flush, it was only
applied if the request itself was going to be reused.

v2: Generalise and cancel all remaining ce->signals

Fixes: bab0557c8dca ("drm/i915/gt: Remove virtual breadcrumb before transfer")
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 drivers/gpu/drm/i915/gt/intel_breadcrumbs.c   | 33 +++++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_breadcrumbs.h   |  4 +++
 .../drm/i915/gt/intel_execlists_submission.c  | 25 ++++++--------
 3 files changed, 47 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c b/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c
index 2eabb9ab5d47..7137b6f24f55 100644
--- a/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c
+++ b/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c
@@ -472,6 +472,39 @@ void i915_request_cancel_breadcrumb(struct i915_request *rq)
 	i915_request_put(rq);
 }
 
+void intel_context_remove_breadcrumbs(struct intel_context *ce,
+				      struct intel_breadcrumbs *b)
+{
+	struct i915_request *rq, *rn;
+	bool release = false;
+	unsigned long flags;
+
+	spin_lock_irqsave(&ce->signal_lock, flags);
+
+	if (list_empty(&ce->signals))
+		goto unlock;
+
+	list_for_each_entry_safe(rq, rn, &ce->signals, signal_link) {
+		GEM_BUG_ON(!__i915_request_is_complete(rq));
+		if (!test_and_clear_bit(I915_FENCE_FLAG_SIGNAL,
+					&rq->fence.flags))
+			continue;
+
+		list_del_rcu(&rq->signal_link);
+		irq_signal_request(rq, b);
+		i915_request_put(rq);
+	}
+	release = remove_signaling_context(b, ce);
+
+unlock:
+	spin_unlock_irqrestore(&ce->signal_lock, flags);
+	if (release)
+		intel_context_put(ce);
+
+	while (atomic_read(&b->signaler_active))
+		cpu_relax();
+}
+
 static void print_signals(struct intel_breadcrumbs *b, struct drm_printer *p)
 {
 	struct intel_context *ce;
diff --git a/drivers/gpu/drm/i915/gt/intel_breadcrumbs.h b/drivers/gpu/drm/i915/gt/intel_breadcrumbs.h
index 75cc9cff3ae3..3ce5ce270b04 100644
--- a/drivers/gpu/drm/i915/gt/intel_breadcrumbs.h
+++ b/drivers/gpu/drm/i915/gt/intel_breadcrumbs.h
@@ -6,6 +6,7 @@
 #ifndef __INTEL_BREADCRUMBS__
 #define __INTEL_BREADCRUMBS__
 
+#include <linux/atomic.h>
 #include <linux/irq_work.h>
 
 #include "intel_engine_types.h"
@@ -44,4 +45,7 @@ void intel_engine_print_breadcrumbs(struct intel_engine_cs *engine,
 bool i915_request_enable_breadcrumb(struct i915_request *request);
 void i915_request_cancel_breadcrumb(struct i915_request *request);
 
+void intel_context_remove_breadcrumbs(struct intel_context *ce,
+				      struct intel_breadcrumbs *b);
+
 #endif /* __INTEL_BREADCRUMBS__ */
diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index 2f8e10450f7e..eb69eef9d7db 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -581,21 +581,6 @@ resubmit_virtual_request(struct i915_request *rq, struct virtual_engine *ve)
 {
 	struct intel_engine_cs *engine = rq->engine;
 
-	/* Flush concurrent rcu iterators in signal_irq_work */
-	if (test_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT, &rq->fence.flags)) {
-		/*
-		 * After this point, the rq may be transferred to a new
-		 * sibling, so before we clear ce->inflight make sure that
-		 * the context has been removed from the b->signalers and
-		 * furthermore we need to make sure that the concurrent
-		 * iterator in signal_irq_work is no longer following
-		 * ce->signal_link.
-		 */
-		i915_request_cancel_breadcrumb(rq);
-		while (atomic_read(&engine->breadcrumbs->signaler_active))
-			cpu_relax();
-	}
-
 	spin_lock_irq(&engine->active.lock);
 
 	clear_bit(I915_FENCE_FLAG_PQUEUE, &rq->fence.flags);
@@ -610,6 +595,16 @@ static void kick_siblings(struct i915_request *rq, struct intel_context *ce)
 	struct virtual_engine *ve = container_of(ce, typeof(*ve), context);
 	struct intel_engine_cs *engine = rq->engine;
 
+	/*
+	 * After this point, the rq may be transferred to a new sibling, so
+	 * before we clear ce->inflight make sure that the context has been
+	 * removed from the b->signalers and furthermore we need to make sure
+	 * that the concurrent iterator in signal_irq_work is no longer
+	 * following ce->signal_link.
+	 */
+	if (!list_empty(&ce->signals))
+		intel_context_remove_breadcrumbs(ce, engine->breadcrumbs);
+
 	/*
 	 * This engine is now too busy to run this virtual request, so
 	 * see if we can find an alternative engine for it to execute on.
-- 
2.20.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
