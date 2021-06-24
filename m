Return-Path: <SRS0=foSz=LS=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECD0DC49EAF
	for <intel-gfx@archiver.kernel.org>; Thu, 24 Jun 2021 06:49:02 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B98DE613CC
	for <intel-gfx@archiver.kernel.org>; Thu, 24 Jun 2021 06:49:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B98DE613CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03F836EA4A;
	Thu, 24 Jun 2021 06:47:50 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 518DA6E9F9;
 Thu, 24 Jun 2021 06:47:31 +0000 (UTC)
IronPort-SDR: Zh2E5thA1ah90mci/0IWoVGs6/u7vGBTdSGX0mg6Y6MCuu8nkpcJuHhi5NdxJDuKlCDWjoK1ji
 ZllScEa81C5A==
X-IronPort-AV: E=McAfee;i="6200,9189,10024"; a="207346774"
X-IronPort-AV: E=Sophos;i="5.83,295,1616482800"; d="scan'208";a="207346774"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 23:47:26 -0700
IronPort-SDR: k90Q/D66NSV1LHJ+keDU1ZTNSUjQYtrO6uBQpnfAvUBjucbXAIoQwG6rHsoDNKa65pkUHlkoi3
 k1V2M6p3jzQA==
X-IronPort-AV: E=Sophos;i="5.83,295,1616482800"; d="scan'208";a="556390968"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 23:47:26 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Date: Thu, 24 Jun 2021 00:05:04 -0700
Message-Id: <20210624070516.21893-36-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210624070516.21893-1-matthew.brost@intel.com>
References: <20210624070516.21893-1-matthew.brost@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 35/47] drm/i915/guc: Handle context reset
 notification
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

GuC will issue a reset on detecting an engine hang and will notify
the driver via a G2H message. The driver will service the notification
by resetting the guilty context to a simple state or banning it
completely.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  2 ++
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     |  3 ++
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 35 +++++++++++++++++++
 drivers/gpu/drm/i915/i915_trace.h             | 10 ++++++
 4 files changed, 50 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
index 85ef6767f13b..e94b0ef733da 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
@@ -262,6 +262,8 @@ int intel_guc_deregister_done_process_msg(struct intel_guc *guc,
 					  const u32 *msg, u32 len);
 int intel_guc_sched_done_process_msg(struct intel_guc *guc,
 				     const u32 *msg, u32 len);
+int intel_guc_context_reset_process_msg(struct intel_guc *guc,
+					const u32 *msg, u32 len);
 
 void intel_guc_submission_reset_prepare(struct intel_guc *guc);
 void intel_guc_submission_reset(struct intel_guc *guc, bool stalled);
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
index 4ed074df88e5..a2020373b8e8 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
@@ -945,6 +945,9 @@ static int ct_process_request(struct intel_guc_ct *ct, struct ct_incoming_msg *r
 	case INTEL_GUC_ACTION_SCHED_CONTEXT_MODE_DONE:
 		ret = intel_guc_sched_done_process_msg(guc, payload, len);
 		break;
+	case INTEL_GUC_ACTION_CONTEXT_RESET_NOTIFICATION:
+		ret = intel_guc_context_reset_process_msg(guc, payload, len);
+		break;
 	default:
 		ret = -EOPNOTSUPP;
 		break;
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 16b61fe71b07..9845c5bd9832 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -2192,6 +2192,41 @@ int intel_guc_sched_done_process_msg(struct intel_guc *guc,
 	return 0;
 }
 
+static void guc_context_replay(struct intel_context *ce)
+{
+	struct i915_sched_engine *sched_engine = ce->engine->sched_engine;
+
+	__guc_reset_context(ce, true);
+	tasklet_hi_schedule(&sched_engine->tasklet);
+}
+
+static void guc_handle_context_reset(struct intel_guc *guc,
+				     struct intel_context *ce)
+{
+	trace_intel_context_reset(ce);
+	guc_context_replay(ce);
+}
+
+int intel_guc_context_reset_process_msg(struct intel_guc *guc,
+					const u32 *msg, u32 len)
+{
+	struct intel_context *ce;
+	int desc_idx = msg[0];
+
+	if (unlikely(len != 1)) {
+		drm_dbg(&guc_to_gt(guc)->i915->drm, "Invalid length %u", len);
+		return -EPROTO;
+	}
+
+	ce = g2h_context_lookup(guc, desc_idx);
+	if (unlikely(!ce))
+		return -EPROTO;
+
+	guc_handle_context_reset(guc, ce);
+
+	return 0;
+}
+
 void intel_guc_log_submission_info(struct intel_guc *guc,
 				   struct drm_printer *p)
 {
diff --git a/drivers/gpu/drm/i915/i915_trace.h b/drivers/gpu/drm/i915/i915_trace.h
index 97c2e83984ed..c095c4d39456 100644
--- a/drivers/gpu/drm/i915/i915_trace.h
+++ b/drivers/gpu/drm/i915/i915_trace.h
@@ -929,6 +929,11 @@ DECLARE_EVENT_CLASS(intel_context,
 		      __entry->guc_sched_state_no_lock)
 );
 
+DEFINE_EVENT(intel_context, intel_context_reset,
+	     TP_PROTO(struct intel_context *ce),
+	     TP_ARGS(ce)
+);
+
 DEFINE_EVENT(intel_context, intel_context_register,
 	     TP_PROTO(struct intel_context *ce),
 	     TP_ARGS(ce)
@@ -1026,6 +1031,11 @@ trace_i915_request_out(struct i915_request *rq)
 {
 }
 
+static inline void
+trace_intel_context_reset(struct intel_context *ce)
+{
+}
+
 static inline void
 trace_intel_context_register(struct intel_context *ce)
 {
-- 
2.28.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
