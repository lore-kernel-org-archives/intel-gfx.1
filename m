Return-Path: <SRS0=Vnqj=M2=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04744C4338F
	for <intel-gfx@archiver.kernel.org>; Tue,  3 Aug 2021 22:13:00 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA24760184
	for <intel-gfx@archiver.kernel.org>; Tue,  3 Aug 2021 22:12:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CA24760184
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D88866E949;
	Tue,  3 Aug 2021 22:12:04 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC8696E2D1;
 Tue,  3 Aug 2021 22:11:55 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10065"; a="235745905"
X-IronPort-AV: E=Sophos;i="5.84,292,1620716400"; d="scan'208";a="235745905"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2021 15:11:54 -0700
X-IronPort-AV: E=Sophos;i="5.84,292,1620716400"; d="scan'208";a="511512713"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2021 15:11:54 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Date: Tue,  3 Aug 2021 15:29:14 -0700
Message-Id: <20210803222943.27686-18-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210803222943.27686-1-matthew.brost@intel.com>
References: <20210803222943.27686-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 17/46] drm/i915/guc: Add multi-lrc context
 registration
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

Add multi-lrc context registration H2G. In addition a workqueue and
process descriptor are setup during multi-lrc context registration as
these data structures are needed for multi-lrc submission.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_context_types.h |   6 +
 drivers/gpu/drm/i915/gt/intel_lrc.c           |   5 +
 .../gpu/drm/i915/gt/uc/abi/guc_actions_abi.h  |   1 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |   2 +-
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 117 +++++++++++++++++-
 5 files changed, 129 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
index eb82be15b7a2..9665cb31bab0 100644
--- a/drivers/gpu/drm/i915/gt/intel_context_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
@@ -211,9 +211,15 @@ struct intel_context {
 	/* Pointer to parent */
 	struct intel_context *parent;
 
+	/* GuC workqueue head / tail - only applies to parent */
+	u16 guc_wqi_tail;
+	u16 guc_wqi_head;
+
 	/* Number of children if parent */
 	u8 guc_number_children;
 
+	u8 parent_page; /* if set, page num reserved for parent context */
+
 	/*
 	 * GuC priority management
 	 */
diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
index c466fc966005..4b65c3a98331 100644
--- a/drivers/gpu/drm/i915/gt/intel_lrc.c
+++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
@@ -861,6 +861,11 @@ __lrc_alloc_state(struct intel_context *ce, struct intel_engine_cs *engine)
 		context_size += PAGE_SIZE;
 	}
 
+	if (intel_context_is_parent(ce)) {
+		ce->parent_page = context_size / PAGE_SIZE;
+		context_size += PAGE_SIZE;
+	}
+
 	obj = i915_gem_object_create_lmem(engine->i915, context_size, 0);
 	if (IS_ERR(obj))
 		obj = i915_gem_object_create_shmem(engine->i915, context_size);
diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
index d832c8f11c11..0a496acec213 100644
--- a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
+++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
@@ -142,6 +142,7 @@ enum intel_guc_action {
 	INTEL_GUC_ACTION_REGISTER_COMMAND_TRANSPORT_BUFFER = 0x4505,
 	INTEL_GUC_ACTION_DEREGISTER_COMMAND_TRANSPORT_BUFFER = 0x4506,
 	INTEL_GUC_ACTION_DEREGISTER_CONTEXT_DONE = 0x4600,
+	INTEL_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC = 0x4601,
 	INTEL_GUC_ACTION_RESET_CLIENT = 0x5507,
 	INTEL_GUC_ACTION_LIMIT
 };
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
index 82534259b7ad..e08fbd40281c 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
@@ -51,7 +51,7 @@
 
 #define GUC_DOORBELL_INVALID		256
 
-#define GUC_WQ_SIZE			(PAGE_SIZE * 2)
+#define GUC_WQ_SIZE			(PAGE_SIZE / 2)
 
 /* Work queue item header definitions */
 #define WQ_STATUS_ACTIVE		1
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index c5c73c42bcf7..98c1c0b7b087 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -439,6 +439,39 @@ static inline struct i915_priolist *to_priolist(struct rb_node *rb)
 	return rb_entry(rb, struct i915_priolist, node);
 }
 
+/*
+ * When using multi-lrc submission an extra page in the context state is
+ * reserved for the process descriptor and work queue.
+ *
+ * The layout of this page is below:
+ * 0						guc_process_desc
+ * ...						unused
+ * PAGE_SIZE / 2				work queue start
+ * ...						work queue
+ * PAGE_SIZE - 1				work queue end
+ */
+#define WQ_OFFSET	(PAGE_SIZE / 2)
+static inline u32 __get_process_desc_offset(struct intel_context *ce)
+{
+	GEM_BUG_ON(!ce->parent_page);
+
+	return ce->parent_page * PAGE_SIZE;
+}
+
+static inline u32 __get_wq_offset(struct intel_context *ce)
+{
+	return __get_process_desc_offset(ce) + WQ_OFFSET;
+}
+
+static inline struct guc_process_desc *
+__get_process_desc(struct intel_context *ce)
+{
+	return (struct guc_process_desc *)
+		(ce->lrc_reg_state +
+		 ((__get_process_desc_offset(ce) -
+		   LRC_STATE_OFFSET) / sizeof(u32)));
+}
+
 static u32 __get_lrc_desc_offset(struct intel_guc *guc, int index)
 {
 	GEM_BUG_ON(index >= guc->lrcd_reg.max_idx);
@@ -1743,6 +1776,28 @@ static void unpin_guc_id(struct intel_guc *guc,
 	spin_unlock_irqrestore(&guc->contexts_lock, flags);
 }
 
+static int __guc_action_register_multi_lrc(struct intel_guc *guc,
+					   struct intel_context *ce,
+					   u32 guc_id,
+					   bool loop)
+{
+	struct intel_context *child;
+	u32 action[4 + MAX_ENGINE_INSTANCE];
+	int len = 0;
+
+	GEM_BUG_ON(ce->guc_number_children > MAX_ENGINE_INSTANCE);
+
+	action[len++] = INTEL_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC;
+	action[len++] = guc_id;
+	action[len++] = ce->guc_number_children + 1;
+	action[len++] = __get_lrc_desc_offset(guc, ce->guc_lrcd_reg_idx);
+	for_each_child(ce, child)
+		action[len++] =
+			__get_lrc_desc_offset(guc, child->guc_lrcd_reg_idx);
+
+	return guc_submission_send_busy_loop(guc, action, len, 0, loop);
+}
+
 static int __guc_action_register_context(struct intel_guc *guc,
 					 struct intel_context *ce,
 					 u32 guc_id,
@@ -1763,9 +1818,14 @@ static int register_context(struct intel_context *ce, bool loop)
 	struct intel_guc *guc = ce_to_guc(ce);
 	int ret;
 
+	GEM_BUG_ON(intel_context_is_child(ce));
 	trace_intel_context_register(ce);
 
-	ret = __guc_action_register_context(guc, ce, ce->guc_id, loop);
+	if (intel_context_is_parent(ce))
+		ret =  __guc_action_register_multi_lrc(guc, ce, ce->guc_id,
+						       loop);
+	else
+		ret = __guc_action_register_context(guc, ce, ce->guc_id, loop);
 	if (likely(!ret))
 		set_context_registered(ce);
 
@@ -1790,6 +1850,7 @@ static int deregister_context(struct intel_context *ce, u32 guc_id, bool loop)
 {
 	struct intel_guc *guc = ce_to_guc(ce);
 
+	GEM_BUG_ON(intel_context_is_child(ce));
 	trace_intel_context_deregister(ce);
 
 	return __guc_action_deregister_context(guc, guc_id, loop);
@@ -1860,7 +1921,11 @@ static void __free_lrcd_reg_idx(struct intel_guc *guc, struct intel_context *ce)
 
 static void free_lrcd_reg_idx(struct intel_guc *guc, struct intel_context *ce)
 {
+	struct intel_context *child;
+
 	__free_lrcd_reg_idx(guc, ce);
+	for_each_child(ce, child)
+		__free_lrcd_reg_idx(guc, child);
 }
 
 static int guc_lrcd_reg_init(struct intel_guc *guc)
@@ -1901,6 +1966,7 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
 	int prio = I915_CONTEXT_DEFAULT_PRIORITY;
 	bool context_registered;
 	intel_wakeref_t wakeref;
+	struct intel_context *child;
 	int ret = 0;
 
 	GEM_BUG_ON(!engine->mask);
@@ -1921,6 +1987,13 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
 			return ret;
 		ce->guc_lrcd_reg_idx = ret;
 	}
+	for_each_child(ce, child)
+		if (likely(!child->guc_lrcd_reg_idx)) {
+			ret = alloc_lrcd_reg_idx(guc, !loop);
+			if (unlikely(ret < 0))
+				return ret;
+			child->guc_lrcd_reg_idx = ret;
+		}
 
 	context_registered = lrc_desc_registered(guc, desc_idx);
 
@@ -1944,6 +2017,42 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
 	guc_context_policy_init(engine, desc);
 	init_sched_state(ce);
 
+	/*
+	 * Context is a parent, we need to register a process descriptor
+	 * describing a work queue and register all child contexts.
+	 */
+	if (intel_context_is_parent(ce)) {
+		struct guc_process_desc *pdesc;
+
+		ce->guc_wqi_tail = 0;
+		ce->guc_wqi_head = 0;
+
+		desc->process_desc = i915_ggtt_offset(ce->state) +
+			__get_process_desc_offset(ce);
+		desc->wq_addr = i915_ggtt_offset(ce->state) +
+			__get_wq_offset(ce);
+		desc->wq_size = GUC_WQ_SIZE;
+
+		pdesc = __get_process_desc(ce);
+		memset(pdesc, 0, sizeof(*(pdesc)));
+		pdesc->stage_id = ce->guc_id;
+		pdesc->wq_base_addr = desc->wq_addr;
+		pdesc->wq_size_bytes = desc->wq_size;
+		pdesc->priority = GUC_CLIENT_PRIORITY_KMD_NORMAL;
+		pdesc->wq_status = WQ_STATUS_ACTIVE;
+
+		for_each_child(ce, child) {
+			desc = __get_lrc_desc(guc, child->guc_lrcd_reg_idx);
+
+			desc->engine_class =
+				engine_class_to_guc_class(engine->class);
+			desc->hw_context_desc = child->lrc.lrca;
+			desc->priority = GUC_CLIENT_PRIORITY_KMD_NORMAL;
+			desc->context_flags = CONTEXT_REGISTRATION_FLAG_KMD;
+			guc_context_policy_init(engine, desc);
+		}
+	}
+
 	/*
 	 * The context_lookup xarray is used to determine if the hardware
 	 * context is currently registered. There are two cases in which it
@@ -3653,6 +3762,12 @@ g2h_context_lookup(struct intel_guc *guc, u32 desc_idx)
 		return NULL;
 	}
 
+	if (unlikely(intel_context_is_child(ce))) {
+		drm_err(&guc_to_gt(guc)->i915->drm,
+			"Context is child, desc_idx %u", desc_idx);
+		return NULL;
+	}
+
 	return ce;
 }
 
-- 
2.28.0

