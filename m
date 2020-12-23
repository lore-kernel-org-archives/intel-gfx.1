Return-Path: <SRS0=gLHY=F3=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9C49C433DB
	for <intel-gfx@archiver.kernel.org>; Wed, 23 Dec 2020 11:12:38 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A543C222F9
	for <intel-gfx@archiver.kernel.org>; Wed, 23 Dec 2020 11:12:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A543C222F9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12FE46E93B;
	Wed, 23 Dec 2020 11:12:17 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E2516E8FF
 for <intel-gfx@lists.freedesktop.org>; Wed, 23 Dec 2020 11:11:56 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from build.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 23412179-1500050 
 for multiple; Wed, 23 Dec 2020 11:11:27 +0000
From: Chris Wilson <chris@chris-wilson.co.uk>
To: intel-gfx@lists.freedesktop.org
Date: Wed, 23 Dec 2020 11:10:27 +0000
Message-Id: <20201223111126.3338-3-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201223111126.3338-1-chris@chris-wilson.co.uk>
References: <20201223111126.3338-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 03/62] drm/i915/gt: Decouple inflight virtual
 engines
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

Once a virtual engine has been bound to a sibling, it will remain bound
until we finally schedule out the last active request. We can not rebind
the context to a new sibling while it is inflight as the context save
will conflict, hence we wait. As we cannot then use any other sibliing
while the context is inflight, only kick the bound sibling while it
inflight and upon scheduling out the kick the rest (so that we can swap
engines on timeslicing if the previously bound engine becomes
oversubscribed).

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 .../drm/i915/gt/intel_execlists_submission.c  | 28 ++++++++-----------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index ddfd6b271b3b..fbd0572ed834 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -581,9 +581,8 @@ static inline void execlists_schedule_in(struct i915_request *rq, int idx)
 static void kick_siblings(struct i915_request *rq, struct intel_context *ce)
 {
 	struct virtual_engine *ve = container_of(ce, typeof(*ve), context);
-	struct i915_request *next = READ_ONCE(ve->request);
 
-	if (next == rq || (next && next->execution_mask & ~rq->execution_mask))
+	if (READ_ONCE(ve->request))
 		tasklet_hi_schedule(&ve->base.execlists.tasklet);
 }
 
@@ -997,17 +996,13 @@ first_virtual_engine(struct intel_engine_cs *engine)
 		struct i915_request *rq = READ_ONCE(ve->request);
 
 		/* lazily cleanup after another engine handled rq */
-		if (!rq) {
+		if (!rq || !virtual_matches(ve, rq, engine)) {
 			rb_erase_cached(rb, &el->virtual);
 			RB_CLEAR_NODE(rb);
 			rb = rb_first_cached(&el->virtual);
 			continue;
 		}
 
-		if (!virtual_matches(ve, rq, engine)) {
-			rb = rb_next(rb);
-			continue;
-		}
 		return ve;
 	}
 
@@ -3435,7 +3430,6 @@ static void virtual_submission_tasklet(unsigned long data)
 	if (unlikely(!mask))
 		return;
 
-	local_irq_disable();
 	for (n = 0; n < ve->num_siblings; n++) {
 		struct intel_engine_cs *sibling = READ_ONCE(ve->siblings[n]);
 		struct ve_node * const node = &ve->nodes[sibling->id];
@@ -3445,20 +3439,19 @@ static void virtual_submission_tasklet(unsigned long data)
 		if (!READ_ONCE(ve->request))
 			break; /* already handled by a sibling's tasklet */
 
+		spin_lock_irq(&sibling->active.lock);
+
 		if (unlikely(!(mask & sibling->mask))) {
 			if (!RB_EMPTY_NODE(&node->rb)) {
-				spin_lock(&sibling->active.lock);
 				rb_erase_cached(&node->rb,
 						&sibling->execlists.virtual);
 				RB_CLEAR_NODE(&node->rb);
-				spin_unlock(&sibling->active.lock);
 			}
-			continue;
-		}
 
-		spin_lock(&sibling->active.lock);
+			goto unlock_engine;
+		}
 
-		if (!RB_EMPTY_NODE(&node->rb)) {
+		if (unlikely(!RB_EMPTY_NODE(&node->rb))) {
 			/*
 			 * Cheat and avoid rebalancing the tree if we can
 			 * reuse this node in situ.
@@ -3498,9 +3491,12 @@ static void virtual_submission_tasklet(unsigned long data)
 		if (first && prio > sibling->execlists.queue_priority_hint)
 			tasklet_hi_schedule(&sibling->execlists.tasklet);
 
-		spin_unlock(&sibling->active.lock);
+unlock_engine:
+		spin_unlock_irq(&sibling->active.lock);
+
+		if (intel_context_inflight(&ve->context))
+			break;
 	}
-	local_irq_enable();
 }
 
 static void virtual_submit_request(struct i915_request *rq)
-- 
2.20.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
