Return-Path: <SRS0=LtMi=FS=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 240BBC1B0E3
	for <intel-gfx@archiver.kernel.org>; Mon, 14 Dec 2020 10:10:43 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9AEF225A9
	for <intel-gfx@archiver.kernel.org>; Mon, 14 Dec 2020 10:10:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D9AEF225A9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D189D6E171;
	Mon, 14 Dec 2020 10:10:21 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 458C56E197
 for <intel-gfx@lists.freedesktop.org>; Mon, 14 Dec 2020 10:10:04 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from build.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 23317812-1500050 
 for multiple; Mon, 14 Dec 2020 10:09:55 +0000
From: Chris Wilson <chris@chris-wilson.co.uk>
To: intel-gfx@lists.freedesktop.org
Date: Mon, 14 Dec 2020 10:09:18 +0000
Message-Id: <20201214100949.11387-38-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201214100949.11387-1-chris@chris-wilson.co.uk>
References: <20201214100949.11387-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 38/69] drm/i915: Prune empty priolists
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

A side-effect of our priority inheritance scheme is that we promote
requests from one priority to the next, moving them from one list to the
next. This can often leave the old priority list empty, but still
resident in the rbtree, which we then have to traverse during HW
submission. rb_next() is relatively expensive operation so if we can
push that to the update where we can do piecemeal pruning and reuse the
nodes, this reduces the latency for HW submission.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/i915/i915_scheduler.c | 41 +++++++++++++++++++++------
 1 file changed, 32 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_scheduler.c b/drivers/gpu/drm/i915/i915_scheduler.c
index dad5318ca825..c65fa0b012de 100644
--- a/drivers/gpu/drm/i915/i915_scheduler.c
+++ b/drivers/gpu/drm/i915/i915_scheduler.c
@@ -64,9 +64,10 @@ struct list_head *
 i915_sched_lookup_priolist(struct intel_engine_cs *engine, int prio)
 {
 	struct intel_engine_execlists * const execlists = &engine->execlists;
-	struct i915_priolist *p;
+	struct list_head *free = NULL;
 	struct rb_node **parent, *rb;
-	bool first = true;
+	struct i915_priolist *p;
+	bool first;
 
 	lockdep_assert_held(&engine->active.lock);
 	assert_priolists(execlists);
@@ -77,22 +78,40 @@ i915_sched_lookup_priolist(struct intel_engine_cs *engine, int prio)
 find_priolist:
 	/* most positive priority is scheduled first, equal priorities fifo */
 	rb = NULL;
+	first = true;
 	parent = &execlists->queue.rb_root.rb_node;
 	while (*parent) {
 		rb = *parent;
 		p = to_priolist(rb);
-		if (prio > p->priority) {
-			parent = &rb->rb_left;
-		} else if (prio < p->priority) {
-			parent = &rb->rb_right;
-			first = false;
-		} else {
-			return &p->requests;
+
+		if (prio == p->priority)
+			goto out;
+
+		/*
+		 * Prune an empty priolist, we can reuse it if we need to
+		 * allocate. After removing this node and rotating the subtrees
+		 * beneath its parent, we need to restart our descent from the
+		 * parent.
+		 */
+		if (list_empty(&p->requests)) {
+			rb = rb_parent(&p->node);
+			parent = rb ? &rb : &execlists->queue.rb_root.rb_node;
+			rb_erase_cached(&p->node, &execlists->queue);
+			free = i915_priolist_free_defer(p, free);
+			continue;
 		}
+
+		if (prio > p->priority)
+			parent = &rb->rb_left;
+		else
+			parent = &rb->rb_right, first = false;
 	}
 
 	if (prio == I915_PRIORITY_NORMAL) {
 		p = &execlists->default_priolist;
+	} else if (free) {
+		p = container_of(free, typeof(*p), requests);
+		free = p->requests.next;
 	} else {
 		p = kmem_cache_alloc(global.slab_priorities, GFP_ATOMIC);
 		/* Convert an allocation failure to a priority bump */
@@ -117,7 +136,11 @@ i915_sched_lookup_priolist(struct intel_engine_cs *engine, int prio)
 
 	rb_link_node(&p->node, rb, parent);
 	rb_insert_color_cached(&p->node, &execlists->queue, first);
+	GEM_BUG_ON(rb_first_cached(&execlists->queue) !=
+		   rb_first(&execlists->queue.rb_root));
 
+out:
+	i915_priolist_free_many(free);
 	return &p->requests;
 }
 
-- 
2.20.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
