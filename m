Return-Path: <SRS0=Rx2D=HK=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96182C433DB
	for <intel-gfx@archiver.kernel.org>; Mon,  8 Feb 2021 10:52:56 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38A9964E45
	for <intel-gfx@archiver.kernel.org>; Mon,  8 Feb 2021 10:52:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 38A9964E45
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 811FF6E86A;
	Mon,  8 Feb 2021 10:52:55 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71FEC6E239
 for <intel-gfx@lists.freedesktop.org>; Mon,  8 Feb 2021 10:52:54 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.69.177; 
Received: from build.alporthouse.com (unverified [78.156.69.177]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 23809225-1500050 
 for multiple; Mon, 08 Feb 2021 10:52:44 +0000
From: Chris Wilson <chris@chris-wilson.co.uk>
To: intel-gfx@lists.freedesktop.org
Date: Mon,  8 Feb 2021 10:52:23 +0000
Message-Id: <20210208105236.28498-18-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210208105236.28498-1-chris@chris-wilson.co.uk>
References: <20210208105236.28498-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 18/31] drm/i915/gt: Wrap
 intel_timeline.has_initial_breadcrumb
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

In preparation for removing the has_initial_breadcrumb field, add a
helper function for the existing callers.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Reviewed-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c        | 2 +-
 drivers/gpu/drm/i915/gt/intel_ring_submission.c | 4 ++--
 drivers/gpu/drm/i915/gt/intel_timeline.c        | 6 +++---
 drivers/gpu/drm/i915/gt/intel_timeline.h        | 6 ++++++
 drivers/gpu/drm/i915/gt/selftest_timeline.c     | 5 +++--
 5 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
index 8791e03ebe61..d8763146e054 100644
--- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
@@ -354,7 +354,7 @@ int gen8_emit_init_breadcrumb(struct i915_request *rq)
 	u32 *cs;
 
 	GEM_BUG_ON(i915_request_has_initial_breadcrumb(rq));
-	if (!i915_request_timeline(rq)->has_initial_breadcrumb)
+	if (!intel_timeline_has_initial_breadcrumb(i915_request_timeline(rq)))
 		return 0;
 
 	cs = intel_ring_begin(rq, 6);
diff --git a/drivers/gpu/drm/i915/gt/intel_ring_submission.c b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
index 47f05e7a4e8c..00e85a3b228a 100644
--- a/drivers/gpu/drm/i915/gt/intel_ring_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
@@ -900,7 +900,7 @@ static int ring_request_alloc(struct i915_request *request)
 	int ret;
 
 	GEM_BUG_ON(!intel_context_is_pinned(request->context));
-	GEM_BUG_ON(i915_request_timeline(request)->has_initial_breadcrumb);
+	GEM_BUG_ON(intel_timeline_has_initial_breadcrumb(i915_request_timeline(request)));
 
 	/*
 	 * Flush enough space to reduce the likelihood of waiting after
@@ -1280,7 +1280,7 @@ int intel_ring_submission_setup(struct intel_engine_cs *engine)
 		err = PTR_ERR(timeline);
 		goto err;
 	}
-	GEM_BUG_ON(timeline->has_initial_breadcrumb);
+	GEM_BUG_ON(intel_timeline_has_initial_breadcrumb(timeline));
 
 	err = intel_timeline_pin(timeline, NULL);
 	if (err)
diff --git a/drivers/gpu/drm/i915/gt/intel_timeline.c b/drivers/gpu/drm/i915/gt/intel_timeline.c
index 491b8df174c2..1505dffbaba9 100644
--- a/drivers/gpu/drm/i915/gt/intel_timeline.c
+++ b/drivers/gpu/drm/i915/gt/intel_timeline.c
@@ -444,14 +444,14 @@ void intel_timeline_exit(struct intel_timeline *tl)
 static u32 timeline_advance(struct intel_timeline *tl)
 {
 	GEM_BUG_ON(!atomic_read(&tl->pin_count));
-	GEM_BUG_ON(tl->seqno & tl->has_initial_breadcrumb);
+	GEM_BUG_ON(tl->seqno & intel_timeline_has_initial_breadcrumb(tl));
 
-	return tl->seqno += 1 + tl->has_initial_breadcrumb;
+	return tl->seqno += 1 + intel_timeline_has_initial_breadcrumb(tl);
 }
 
 static void timeline_rollback(struct intel_timeline *tl)
 {
-	tl->seqno -= 1 + tl->has_initial_breadcrumb;
+	tl->seqno -= 1 + intel_timeline_has_initial_breadcrumb(tl);
 }
 
 static noinline int
diff --git a/drivers/gpu/drm/i915/gt/intel_timeline.h b/drivers/gpu/drm/i915/gt/intel_timeline.h
index b1f81d947f8d..7d6218b55df6 100644
--- a/drivers/gpu/drm/i915/gt/intel_timeline.h
+++ b/drivers/gpu/drm/i915/gt/intel_timeline.h
@@ -42,6 +42,12 @@ static inline void intel_timeline_put(struct intel_timeline *timeline)
 	kref_put(&timeline->kref, __intel_timeline_free);
 }
 
+static inline bool
+intel_timeline_has_initial_breadcrumb(const struct intel_timeline *tl)
+{
+	return tl->has_initial_breadcrumb;
+}
+
 static inline int __intel_timeline_sync_set(struct intel_timeline *tl,
 					    u64 context, u32 seqno)
 {
diff --git a/drivers/gpu/drm/i915/gt/selftest_timeline.c b/drivers/gpu/drm/i915/gt/selftest_timeline.c
index d283dce5b4ac..562a450d2832 100644
--- a/drivers/gpu/drm/i915/gt/selftest_timeline.c
+++ b/drivers/gpu/drm/i915/gt/selftest_timeline.c
@@ -665,7 +665,7 @@ static int live_hwsp_wrap(void *arg)
 	if (IS_ERR(tl))
 		return PTR_ERR(tl);
 
-	if (!tl->has_initial_breadcrumb || !tl->hwsp_cacheline)
+	if (!intel_timeline_has_initial_breadcrumb(tl) || !tl->hwsp_cacheline)
 		goto out_free;
 
 	err = intel_timeline_pin(tl, NULL);
@@ -1234,7 +1234,8 @@ static int live_hwsp_rollover_user(void *arg)
 			goto out;
 
 		tl = ce->timeline;
-		if (!tl->has_initial_breadcrumb || !tl->hwsp_cacheline)
+		if (!intel_timeline_has_initial_breadcrumb(tl) ||
+		    !tl->hwsp_cacheline)
 			goto out;
 
 		timeline_rollback(tl);
-- 
2.20.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
