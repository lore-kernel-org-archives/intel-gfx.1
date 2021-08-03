Return-Path: <SRS0=Vnqj=M2=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42239C43214
	for <intel-gfx@archiver.kernel.org>; Tue,  3 Aug 2021 22:12:31 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04738601FC
	for <intel-gfx@archiver.kernel.org>; Tue,  3 Aug 2021 22:12:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 04738601FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A47786E91F;
	Tue,  3 Aug 2021 22:11:58 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1E9289F8E;
 Tue,  3 Aug 2021 22:11:55 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10065"; a="235745903"
X-IronPort-AV: E=Sophos;i="5.84,292,1620716400"; d="scan'208";a="235745903"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2021 15:11:53 -0700
X-IronPort-AV: E=Sophos;i="5.84,292,1620716400"; d="scan'208";a="511512710"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2021 15:11:53 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Date: Tue,  3 Aug 2021 15:29:12 -0700
Message-Id: <20210803222943.27686-16-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210803222943.27686-1-matthew.brost@intel.com>
References: <20210803222943.27686-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 15/46] drm/i915/guc: Introduce context
 parent-child relationship
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

Introduce context parent-child relationship. Once this relationship is
created all pinning / unpinning operations are directed to the parent
context. The parent context is responsible for pinning all of its'
children and itself.

This is a precursor to the full GuC multi-lrc implementation but aligns
to how GuC mutli-lrc interface is defined - a single H2G is used
register / deregister all of the contexts simultaneously.

Subsequent patches in the series will implement the pinning / unpinning
operations for parent / child contexts.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_context.c       | 29 +++++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_context.h       | 18 ++++++++++++
 drivers/gpu/drm/i915/gt/intel_context_types.h | 12 ++++++++
 3 files changed, 59 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
index 745e84c72c90..8cb92b10b547 100644
--- a/drivers/gpu/drm/i915/gt/intel_context.c
+++ b/drivers/gpu/drm/i915/gt/intel_context.c
@@ -395,6 +395,8 @@ intel_context_init(struct intel_context *ce, struct intel_engine_cs *engine)
 	spin_lock_init(&ce->guc_state.lock);
 	INIT_LIST_HEAD(&ce->guc_state.fences);
 
+	INIT_LIST_HEAD(&ce->guc_child_list);
+
 	spin_lock_init(&ce->guc_active.lock);
 	INIT_LIST_HEAD(&ce->guc_active.requests);
 
@@ -414,10 +416,17 @@ intel_context_init(struct intel_context *ce, struct intel_engine_cs *engine)
 
 void intel_context_fini(struct intel_context *ce)
 {
+	struct intel_context *child, *next;
+
 	if (ce->timeline)
 		intel_timeline_put(ce->timeline);
 	i915_vm_put(ce->vm);
 
+	/* Need to put the creation ref for the children */
+	if (intel_context_is_parent(ce))
+		for_each_child_safe(ce, child, next)
+			intel_context_put(child);
+
 	mutex_destroy(&ce->pin_mutex);
 	i915_active_fini(&ce->active);
 }
@@ -533,6 +542,26 @@ struct i915_request *intel_context_find_active_request(struct intel_context *ce)
 	return active;
 }
 
+void intel_context_bind_parent_child(struct intel_context *parent,
+				     struct intel_context *child)
+{
+	/*
+	 * Callers responsibility to validate that this function is used
+	 * correctly but we use GEM_BUG_ON here ensure that they do.
+	 */
+	GEM_BUG_ON(!intel_engine_uses_guc(parent->engine));
+	GEM_BUG_ON(intel_context_is_pinned(parent));
+	GEM_BUG_ON(intel_context_is_child(parent));
+	GEM_BUG_ON(intel_context_is_pinned(child));
+	GEM_BUG_ON(intel_context_is_child(child));
+	GEM_BUG_ON(intel_context_is_parent(child));
+
+	parent->guc_number_children++;
+	list_add_tail(&child->guc_child_link,
+		      &parent->guc_child_list);
+	child->parent = parent;
+}
+
 #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
 #include "selftest_context.c"
 #endif
diff --git a/drivers/gpu/drm/i915/gt/intel_context.h b/drivers/gpu/drm/i915/gt/intel_context.h
index c41098950746..ad6ce5ac4824 100644
--- a/drivers/gpu/drm/i915/gt/intel_context.h
+++ b/drivers/gpu/drm/i915/gt/intel_context.h
@@ -44,6 +44,24 @@ void intel_context_free(struct intel_context *ce);
 int intel_context_reconfigure_sseu(struct intel_context *ce,
 				   const struct intel_sseu sseu);
 
+static inline bool intel_context_is_child(struct intel_context *ce)
+{
+	return !!ce->parent;
+}
+
+static inline bool intel_context_is_parent(struct intel_context *ce)
+{
+	return !!ce->guc_number_children;
+}
+
+void intel_context_bind_parent_child(struct intel_context *parent,
+				     struct intel_context *child);
+
+#define for_each_child(parent, ce)\
+	list_for_each_entry(ce, &(parent)->guc_child_list, guc_child_link)
+#define for_each_child_safe(parent, ce, cn)\
+	list_for_each_entry_safe(ce, cn, &(parent)->guc_child_list, guc_child_link)
+
 /**
  * intel_context_lock_pinned - Stablises the 'pinned' status of the HW context
  * @ce - the context
diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
index 2df79ba39867..66b22b370a72 100644
--- a/drivers/gpu/drm/i915/gt/intel_context_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
@@ -202,6 +202,18 @@ struct intel_context {
 	/* GuC context blocked fence */
 	struct i915_sw_fence guc_blocked;
 
+	/* Head of children list or link in parent's children list */
+	union {
+		struct list_head guc_child_list;	/* parent */
+		struct list_head guc_child_link;	/* child */
+	};
+
+	/* Pointer to parent */
+	struct intel_context *parent;
+
+	/* Number of children if parent */
+	u8 guc_number_children;
+
 	/*
 	 * GuC priority management
 	 */
-- 
2.28.0

