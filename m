Return-Path: <SRS0=foSz=LS=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F096DC48BDF
	for <intel-gfx@archiver.kernel.org>; Thu, 24 Jun 2021 06:47:57 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1C1061351
	for <intel-gfx@archiver.kernel.org>; Thu, 24 Jun 2021 06:47:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1C1061351
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BADB36EA13;
	Thu, 24 Jun 2021 06:47:31 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BBA96E9F6;
 Thu, 24 Jun 2021 06:47:29 +0000 (UTC)
IronPort-SDR: swaXW+aVot4LBJN4HMo1K22IW5QweIk30xK/nkhx96MEfMCEjcrUgZoLZYh0zlkFMhBAiJOZBD
 qCxk8LXmfUtg==
X-IronPort-AV: E=McAfee;i="6200,9189,10024"; a="293039164"
X-IronPort-AV: E=Sophos;i="5.83,295,1616482800"; d="scan'208";a="293039164"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 23:47:26 -0700
IronPort-SDR: +O1puhFMBYZeeS1pLSp4H3EMD7GYEx1zJEIUxKBWYLDq+UzEL8ilfbfhBU3fR/ZUjKl0Rmcs+3
 df8AIvoFtPtw==
X-IronPort-AV: E=Sophos;i="5.83,295,1616482800"; d="scan'208";a="556390935"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 23:47:25 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Date: Thu, 24 Jun 2021 00:04:53 -0700
Message-Id: <20210624070516.21893-25-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210624070516.21893-1-matthew.brost@intel.com>
References: <20210624070516.21893-1-matthew.brost@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 24/47] drm/i915/guc: Add several request trace
 points
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

Add trace points for request dependencies and GuC submit. Extended
existing request trace points to include submit fence value,, guc_id,
and ring tail value.

Cc: John Harrison <john.c.harrison@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  3 ++
 drivers/gpu/drm/i915/i915_request.c           |  3 ++
 drivers/gpu/drm/i915/i915_trace.h             | 39 ++++++++++++++++++-
 3 files changed, 43 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 89b3c7e5d15b..c2327eebc09c 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -422,6 +422,7 @@ static int guc_dequeue_one_context(struct intel_guc *guc)
 			guc->stalled_request = last;
 			return false;
 		}
+		trace_i915_request_guc_submit(last);
 	}
 
 	guc->stalled_request = NULL;
@@ -642,6 +643,8 @@ static int guc_bypass_tasklet_submit(struct intel_guc *guc,
 	ret = guc_add_request(guc, rq);
 	if (ret == -EBUSY)
 		guc->stalled_request = rq;
+	else
+		trace_i915_request_guc_submit(rq);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
index d92c9f25c9f4..7f7aa096e873 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -1344,6 +1344,9 @@ __i915_request_await_execution(struct i915_request *to,
 			return err;
 	}
 
+	trace_i915_request_dep_to(to);
+	trace_i915_request_dep_from(from);
+
 	/* Couple the dependency tree for PI on this exposed to->fence */
 	if (to->engine->sched_engine->schedule) {
 		err = i915_sched_node_add_dependency(&to->sched,
diff --git a/drivers/gpu/drm/i915/i915_trace.h b/drivers/gpu/drm/i915/i915_trace.h
index 6778ad2a14a4..b02d04b6c8f6 100644
--- a/drivers/gpu/drm/i915/i915_trace.h
+++ b/drivers/gpu/drm/i915/i915_trace.h
@@ -794,22 +794,27 @@ DECLARE_EVENT_CLASS(i915_request,
 	    TP_STRUCT__entry(
 			     __field(u32, dev)
 			     __field(u64, ctx)
+			     __field(u32, guc_id)
 			     __field(u16, class)
 			     __field(u16, instance)
 			     __field(u32, seqno)
+			     __field(u32, tail)
 			     ),
 
 	    TP_fast_assign(
 			   __entry->dev = rq->engine->i915->drm.primary->index;
 			   __entry->class = rq->engine->uabi_class;
 			   __entry->instance = rq->engine->uabi_instance;
+			   __entry->guc_id = rq->context->guc_id;
 			   __entry->ctx = rq->fence.context;
 			   __entry->seqno = rq->fence.seqno;
+			   __entry->tail = rq->tail;
 			   ),
 
-	    TP_printk("dev=%u, engine=%u:%u, ctx=%llu, seqno=%u",
+	    TP_printk("dev=%u, engine=%u:%u, guc_id=%u, ctx=%llu, seqno=%u, tail=%u",
 		      __entry->dev, __entry->class, __entry->instance,
-		      __entry->ctx, __entry->seqno)
+		      __entry->guc_id, __entry->ctx, __entry->seqno,
+		      __entry->tail)
 );
 
 DEFINE_EVENT(i915_request, i915_request_add,
@@ -818,6 +823,21 @@ DEFINE_EVENT(i915_request, i915_request_add,
 );
 
 #if defined(CONFIG_DRM_I915_LOW_LEVEL_TRACEPOINTS)
+DEFINE_EVENT(i915_request, i915_request_dep_to,
+	     TP_PROTO(struct i915_request *rq),
+	     TP_ARGS(rq)
+);
+
+DEFINE_EVENT(i915_request, i915_request_dep_from,
+	     TP_PROTO(struct i915_request *rq),
+	     TP_ARGS(rq)
+);
+
+DEFINE_EVENT(i915_request, i915_request_guc_submit,
+	     TP_PROTO(struct i915_request *rq),
+	     TP_ARGS(rq)
+);
+
 DEFINE_EVENT(i915_request, i915_request_submit,
 	     TP_PROTO(struct i915_request *rq),
 	     TP_ARGS(rq)
@@ -887,6 +907,21 @@ TRACE_EVENT(i915_request_out,
 
 #else
 #if !defined(TRACE_HEADER_MULTI_READ)
+static inline void
+trace_i915_request_dep_to(struct i915_request *rq)
+{
+}
+
+static inline void
+trace_i915_request_dep_from(struct i915_request *rq)
+{
+}
+
+static inline void
+trace_i915_request_guc_submit(struct i915_request *rq)
+{
+}
+
 static inline void
 trace_i915_request_submit(struct i915_request *rq)
 {
-- 
2.28.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
