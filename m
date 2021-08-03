Return-Path: <SRS0=Vnqj=M2=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A51CC4320A
	for <intel-gfx@archiver.kernel.org>; Tue,  3 Aug 2021 22:12:45 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E03C660184
	for <intel-gfx@archiver.kernel.org>; Tue,  3 Aug 2021 22:12:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E03C660184
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 320886E931;
	Tue,  3 Aug 2021 22:12:01 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE4FC6E40B;
 Tue,  3 Aug 2021 22:11:55 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10065"; a="235745906"
X-IronPort-AV: E=Sophos;i="5.84,292,1620716400"; d="scan'208";a="235745906"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2021 15:11:54 -0700
X-IronPort-AV: E=Sophos;i="5.84,292,1620716400"; d="scan'208";a="511512714"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2021 15:11:54 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Date: Tue,  3 Aug 2021 15:29:15 -0700
Message-Id: <20210803222943.27686-19-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210803222943.27686-1-matthew.brost@intel.com>
References: <20210803222943.27686-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 18/46] drm/i915/guc: Ensure GuC schedule
 operations do not operate on child contexts
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

In GuC parent-child contexts the parent context controls the scheduling,
ensure only the parent does the scheduling operations.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 52 +++++++++++++++----
 1 file changed, 41 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 98c1c0b7b087..f23dd716723f 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -405,6 +405,18 @@ static inline void decr_context_blocked(struct intel_context *ce)
 	ce->guc_state.sched_state -= SCHED_STATE_BLOCKED;
 }
 
+static inline struct intel_context *
+to_parent(struct intel_context *ce)
+{
+	return intel_context_is_child(ce) ? ce->parent : ce;
+}
+
+static inline struct intel_context *
+request_to_scheduling_context(struct i915_request *rq)
+{
+	return to_parent(rq->context);
+}
+
 static inline bool context_guc_id_invalid(struct intel_context *ce)
 {
 	return ce->guc_id == GUC_INVALID_LRC_ID;
@@ -711,7 +723,7 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop);
 static int tasklet_register_context(struct guc_submit_engine *gse,
 				    struct i915_request *rq)
 {
-	struct intel_context *ce = rq->context;
+	struct intel_context *ce = request_to_scheduling_context(rq);
 	struct intel_guc *guc = gse->sched_engine.private_data;
 	int ret = 0;
 
@@ -720,6 +732,7 @@ static int tasklet_register_context(struct guc_submit_engine *gse,
 	GEM_BUG_ON(ce->guc_num_rq_submit_no_id);
 	GEM_BUG_ON(request_has_no_guc_id(rq));
 	GEM_BUG_ON(context_guc_id_invalid(ce));
+	GEM_BUG_ON(intel_context_is_child(ce));
 	GEM_BUG_ON(!atomic_read(&ce->guc_id_ref));
 
 	/*
@@ -2355,6 +2368,7 @@ static void __guc_context_sched_disable(struct intel_guc *guc,
 	GEM_BUG_ON(guc_id == GUC_INVALID_LRC_ID);
 #endif
 
+	GEM_BUG_ON(intel_context_is_child(ce));
 	trace_intel_context_sched_disable(ce);
 
 	guc_submission_send_busy_loop(guc, action, ARRAY_SIZE(action),
@@ -2570,6 +2584,8 @@ static void guc_context_sched_disable(struct intel_context *ce)
 	u16 guc_id;
 	bool enabled;
 
+	GEM_BUG_ON(intel_context_is_child(ce));
+
 	if (submission_disabled(guc) || context_guc_id_invalid(ce) ||
 	    !lrc_desc_registered(guc, ce->guc_id)) {
 		clr_context_enabled(ce);
@@ -2971,6 +2987,8 @@ static void guc_signal_context_fence(struct intel_context *ce)
 {
 	unsigned long flags;
 
+	GEM_BUG_ON(intel_context_is_child(ce));
+
 	spin_lock_irqsave(&ce->guc_state.lock, flags);
 	clr_context_wait_for_deregister_to_register(ce);
 	__guc_signal_context_fence(ce);
@@ -3056,14 +3074,26 @@ static bool context_needs_lrc_desc_pin(struct intel_context *ce, bool new_guc_id
 		!submission_disabled(ce_to_guc(ce));
 }
 
+static void clear_lrca_dirty(struct intel_context *ce)
+{
+	struct intel_context *child;
+
+	GEM_BUG_ON(intel_context_is_child(ce));
+
+	clear_bit(CONTEXT_LRCA_DIRTY, &ce->flags);
+	for_each_child(ce, child)
+		clear_bit(CONTEXT_LRCA_DIRTY, &child->flags);
+}
+
 static int tasklet_pin_guc_id(struct guc_submit_engine *gse,
 			      struct i915_request *rq)
 {
-	struct intel_context *ce = rq->context;
+	struct intel_context *ce = request_to_scheduling_context(rq);
 	int ret = 0;
 
 	lockdep_assert_held(&gse->sched_engine.lock);
 	GEM_BUG_ON(!ce->guc_num_rq_submit_no_id);
+	GEM_BUG_ON(intel_context_is_child(ce));
 
 	if (atomic_add_unless(&ce->guc_id_ref, ce->guc_num_rq_submit_no_id, 0))
 		goto out;
@@ -3091,7 +3121,7 @@ static int tasklet_pin_guc_id(struct guc_submit_engine *gse,
 		gse->submission_stall_reason = STALL_SCHED_DISABLE;
 	}
 
-	clear_bit(CONTEXT_LRCA_DIRTY, &ce->flags);
+	clear_lrca_dirty(ce);
 out:
 	gse->total_num_rq_with_no_guc_id -= ce->guc_num_rq_submit_no_id;
 	GEM_BUG_ON(gse->total_num_rq_with_no_guc_id < 0);
@@ -3122,7 +3152,7 @@ static int tasklet_pin_guc_id(struct guc_submit_engine *gse,
 
 static int guc_request_alloc(struct i915_request *rq)
 {
-	struct intel_context *ce = rq->context;
+	struct intel_context *ce = request_to_scheduling_context(rq);
 	struct intel_guc *guc = ce_to_guc(ce);
 	struct guc_submit_engine *gse = ce_to_gse(ce);
 	unsigned long flags;
@@ -3173,11 +3203,12 @@ static int guc_request_alloc(struct i915_request *rq)
 	 * persistent until the generated request is retired. Thus, sealing these
 	 * race conditions.
 	 *
-	 * There is no need for a lock here as the timeline mutex ensures at
-	 * most one context can be executing this code path at once. The
-	 * guc_id_ref is incremented once for every request in flight and
-	 * decremented on each retire. When it is zero, a lock around the
-	 * increment (in pin_guc_id) is needed to seal a race with unpin_guc_id.
+	 * There is no need for a lock here as the timeline mutex (or
+	 * parallel_submit mutex in the case of multi-lrc) ensures at most one
+	 * context can be executing this code path at once. The guc_id_ref is
+	 * incremented once for every request in flight and decremented on each
+	 * retire. When it is zero, a lock around the increment (in pin_guc_id)
+	 * is needed to seal a race with unpin_guc_id.
 	 */
 	if (atomic_add_unless(&ce->guc_id_ref, 1, 0))
 		goto out;
@@ -3215,8 +3246,7 @@ static int guc_request_alloc(struct i915_request *rq)
 		}
 	}
 
-	clear_bit(CONTEXT_LRCA_DIRTY, &ce->flags);
-
+	clear_lrca_dirty(ce);
 out:
 	incr_num_rq_not_ready(ce);
 
-- 
2.28.0

