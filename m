Return-Path: <SRS0=dOvl=BM=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3CC7C433EB
	for <intel-gfx@archiver.kernel.org>; Sun,  2 Aug 2020 16:44:43 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C597620738
	for <intel-gfx@archiver.kernel.org>; Sun,  2 Aug 2020 16:44:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C597620738
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82E066E1CE;
	Sun,  2 Aug 2020 16:44:34 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28BF56E1B5
 for <intel-gfx@lists.freedesktop.org>; Sun,  2 Aug 2020 16:44:31 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from build.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 22010434-1500050 
 for multiple; Sun, 02 Aug 2020 17:44:16 +0100
From: Chris Wilson <chris@chris-wilson.co.uk>
To: intel-gfx@lists.freedesktop.org
Date: Sun,  2 Aug 2020 17:43:45 +0100
Message-Id: <20200802164412.2738-16-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200802164412.2738-1-chris@chris-wilson.co.uk>
References: <20200802164412.2738-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 15/42] drm/i915/gt: Refactor heartbeat request
 construction and submission
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

Pull the individual strands of creating a custom heartbeat requests into
a pair of common functions. This will reduce the number of changes we
will need to make in future.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 .../gpu/drm/i915/gt/intel_engine_heartbeat.c  | 56 +++++++++++++------
 1 file changed, 38 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
index 8ffdf676c0a0..eb4393b2342e 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
@@ -37,12 +37,33 @@ static bool next_heartbeat(struct intel_engine_cs *engine)
 	return true;
 }
 
+static struct i915_request *
+heartbeat_create(struct intel_context *ce, gfp_t gfp)
+{
+	struct i915_request *rq;
+
+	intel_context_enter(ce);
+	rq = __i915_request_create(ce, gfp);
+	intel_context_exit(ce);
+
+	return rq;
+}
+
 static void idle_pulse(struct intel_engine_cs *engine, struct i915_request *rq)
 {
 	engine->wakeref_serial = READ_ONCE(engine->serial) + 1;
 	i915_request_add_active_barriers(rq);
 }
 
+static void heartbeat_commit(struct i915_request *rq,
+			     const struct i915_sched_attr *attr)
+{
+	idle_pulse(rq->engine, rq);
+
+	__i915_request_commit(rq);
+	__i915_request_queue(rq, attr);
+}
+
 static void show_heartbeat(const struct i915_request *rq,
 			   struct intel_engine_cs *engine)
 {
@@ -137,18 +158,14 @@ static void heartbeat(struct work_struct *wrk)
 		goto out;
 	}
 
-	intel_context_enter(ce);
-	rq = __i915_request_create(ce, GFP_NOWAIT | __GFP_NOWARN);
-	intel_context_exit(ce);
+	rq = heartbeat_create(ce, GFP_NOWAIT | __GFP_NOWARN);
 	if (IS_ERR(rq))
 		goto unlock;
 
-	idle_pulse(engine, rq);
 	if (engine->i915->params.enable_hangcheck)
 		engine->heartbeat.systole = i915_request_get(rq);
 
-	__i915_request_commit(rq);
-	__i915_request_queue(rq, &attr);
+	heartbeat_commit(rq, &attr);
 
 unlock:
 	mutex_unlock(&ce->timeline->mutex);
@@ -220,19 +237,14 @@ int intel_engine_pulse(struct intel_engine_cs *engine)
 		goto out_rpm;
 	}
 
-	intel_context_enter(ce);
-	rq = __i915_request_create(ce, GFP_NOWAIT | __GFP_NOWARN);
-	intel_context_exit(ce);
+	rq = heartbeat_create(ce, GFP_NOWAIT | __GFP_NOWARN);
 	if (IS_ERR(rq)) {
 		err = PTR_ERR(rq);
 		goto out_unlock;
 	}
 
 	__set_bit(I915_FENCE_FLAG_SENTINEL, &rq->fence.flags);
-	idle_pulse(engine, rq);
-
-	__i915_request_commit(rq);
-	__i915_request_queue(rq, &attr);
+	heartbeat_commit(rq, &attr);
 	GEM_BUG_ON(rq->sched.attr.priority < I915_PRIORITY_BARRIER);
 	err = 0;
 
@@ -245,8 +257,9 @@ int intel_engine_pulse(struct intel_engine_cs *engine)
 
 int intel_engine_flush_barriers(struct intel_engine_cs *engine)
 {
+	struct intel_context *ce = engine->kernel_context;
 	struct i915_request *rq;
-	int err = 0;
+	int err;
 
 	if (llist_empty(&engine->barrier_tasks))
 		return 0;
@@ -254,15 +267,22 @@ int intel_engine_flush_barriers(struct intel_engine_cs *engine)
 	if (!intel_engine_pm_get_if_awake(engine))
 		return 0;
 
-	rq = i915_request_create(engine->kernel_context);
+	if (mutex_lock_interruptible(&ce->timeline->mutex)) {
+		err = -EINTR;
+		goto out_rpm;
+	}
+
+	rq = heartbeat_create(ce, GFP_KERNEL);
 	if (IS_ERR(rq)) {
 		err = PTR_ERR(rq);
-		goto out_rpm;
+		goto out_unlock;
 	}
 
-	idle_pulse(engine, rq);
-	i915_request_add(rq);
+	heartbeat_commit(rq, NULL);
 
+	err = 0;
+out_unlock:
+	mutex_unlock(&ce->timeline->mutex);
 out_rpm:
 	intel_engine_pm_put(engine);
 	return err;
-- 
2.20.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
