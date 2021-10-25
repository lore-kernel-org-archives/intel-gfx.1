Return-Path: <SRS0=eaB6=PN=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E53A2C433EF
	for <intel-gfx@archiver.kernel.org>; Mon, 25 Oct 2021 16:38:52 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B51E960F22
	for <intel-gfx@archiver.kernel.org>; Mon, 25 Oct 2021 16:38:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B51E960F22
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A3E06E17A;
	Mon, 25 Oct 2021 16:38:48 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16BD06E174;
 Mon, 25 Oct 2021 16:38:46 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10148"; a="210479314"
X-IronPort-AV: E=Sophos;i="5.87,181,1631602800"; d="scan'208";a="210479314"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2021 09:38:44 -0700
X-IronPort-AV: E=Sophos;i="5.87,181,1631602800"; d="scan'208";a="571695932"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2021 09:38:44 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Cc: <joonas.lahtinen@linux.intel.com>, <daniele.ceraolospurio@intel.com>,
 <john.c.harrison@intel.com>
Date: Mon, 25 Oct 2021 09:34:04 -0700
Message-Id: <20211025163404.2774-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH] drm/i915/trace: Hide backend specific fields
 behind Kconfig
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

Hide the guc_id and tail fields, for request trace points, behind
CONFIG_DRM_I915_LOW_LEVEL_TRACEPOINTS Kconfig option. Trace points
are ABI (maybe?) so don't change them without kernel developers Kconfig
options.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/i915_trace.h | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_trace.h b/drivers/gpu/drm/i915/i915_trace.h
index 9795f456cccf..4f5238d02b51 100644
--- a/drivers/gpu/drm/i915/i915_trace.h
+++ b/drivers/gpu/drm/i915/i915_trace.h
@@ -787,6 +787,7 @@ TRACE_EVENT(i915_request_queue,
 		      __entry->ctx, __entry->seqno, __entry->flags)
 );
 
+#if defined(CONFIG_DRM_I915_LOW_LEVEL_TRACEPOINTS)
 DECLARE_EVENT_CLASS(i915_request,
 	    TP_PROTO(struct i915_request *rq),
 	    TP_ARGS(rq),
@@ -816,6 +817,32 @@ DECLARE_EVENT_CLASS(i915_request,
 		      __entry->guc_id, __entry->ctx, __entry->seqno,
 		      __entry->tail)
 );
+#else
+DECLARE_EVENT_CLASS(i915_request,
+	    TP_PROTO(struct i915_request *rq),
+	    TP_ARGS(rq),
+
+	    TP_STRUCT__entry(
+			     __field(u32, dev)
+			     __field(u64, ctx)
+			     __field(u16, class)
+			     __field(u16, instance)
+			     __field(u32, seqno)
+			     ),
+
+	    TP_fast_assign(
+			   __entry->dev = rq->engine->i915->drm.primary->index;
+			   __entry->class = rq->engine->uabi_class;
+			   __entry->instance = rq->engine->uabi_instance;
+			   __entry->ctx = rq->fence.context;
+			   __entry->seqno = rq->fence.seqno;
+			   ),
+
+	    TP_printk("dev=%u, engine=%u:%u, ctx=%llu, seqno=%u",
+		      __entry->dev, __entry->class, __entry->instance,
+		      __entry->ctx, __entry->seqno)
+);
+#endif
 
 DEFINE_EVENT(i915_request, i915_request_add,
 	     TP_PROTO(struct i915_request *rq),
-- 
2.32.0

