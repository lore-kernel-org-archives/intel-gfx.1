Return-Path: <SRS0=MV7T=MT=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBFB7C4320A
	for <intel-gfx@archiver.kernel.org>; Tue, 27 Jul 2021 00:07:30 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA43960F6B
	for <intel-gfx@archiver.kernel.org>; Tue, 27 Jul 2021 00:07:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AA43960F6B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAC3E73363;
	Tue, 27 Jul 2021 00:07:28 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 726346FEAE;
 Tue, 27 Jul 2021 00:06:00 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10057"; a="191932133"
X-IronPort-AV: E=Sophos;i="5.84,272,1620716400"; d="scan'208";a="191932133"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2021 17:06:00 -0700
X-IronPort-AV: E=Sophos;i="5.84,272,1620716400"; d="scan'208";a="662339168"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2021 17:06:00 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Date: Mon, 26 Jul 2021 17:23:28 -0700
Message-Id: <20210727002348.97202-14-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210727002348.97202-1-matthew.brost@intel.com>
References: <20210727002348.97202-1-matthew.brost@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 13/33] drm/i915/guc: Handle engine reset failure
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

GuC will notify the driver, via G2H, if it fails to
reset an engine. We recover by resorting to a full GPU
reset.

v2:
 (John Harrison):
  - s/drm_dbg/drm_err

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Fernando Pacheco <fernando.pacheco@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  2 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     |  3 ++
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 43 +++++++++++++++++++
 3 files changed, 48 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
index c79da154c16d..9c8d53a32e0d 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
@@ -271,6 +271,8 @@ int intel_guc_sched_done_process_msg(struct intel_guc *guc,
 				     const u32 *msg, u32 len);
 int intel_guc_context_reset_process_msg(struct intel_guc *guc,
 					const u32 *msg, u32 len);
+int intel_guc_engine_failure_process_msg(struct intel_guc *guc,
+					 const u32 *msg, u32 len);
 
 void intel_guc_submission_reset_prepare(struct intel_guc *guc);
 void intel_guc_submission_reset(struct intel_guc *guc, bool stalled);
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
index 231a42887675..18917b443f05 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
@@ -987,6 +987,9 @@ static int ct_process_request(struct intel_guc_ct *ct, struct ct_incoming_msg *r
 	case INTEL_GUC_ACTION_CONTEXT_RESET_NOTIFICATION:
 		ret = intel_guc_context_reset_process_msg(guc, payload, len);
 		break;
+	case INTEL_GUC_ACTION_ENGINE_FAILURE_NOTIFICATION:
+		ret = intel_guc_engine_failure_process_msg(guc, payload, len);
+		break;
 	default:
 		ret = -EOPNOTSUPP;
 		break;
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 7be84b0761b5..d76494e3e271 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -2237,6 +2237,49 @@ int intel_guc_context_reset_process_msg(struct intel_guc *guc,
 	return 0;
 }
 
+static struct intel_engine_cs *
+guc_lookup_engine(struct intel_guc *guc, u8 guc_class, u8 instance)
+{
+	struct intel_gt *gt = guc_to_gt(guc);
+	u8 engine_class = guc_class_to_engine_class(guc_class);
+
+	/* Class index is checked in class converter */
+	GEM_BUG_ON(instance > MAX_ENGINE_INSTANCE);
+
+	return gt->engine_class[engine_class][instance];
+}
+
+int intel_guc_engine_failure_process_msg(struct intel_guc *guc,
+					 const u32 *msg, u32 len)
+{
+	struct intel_engine_cs *engine;
+	u8 guc_class, instance;
+	u32 reason;
+
+	if (unlikely(len != 3)) {
+		drm_err(&guc_to_gt(guc)->i915->drm, "Invalid length %u", len);
+		return -EPROTO;
+	}
+
+	guc_class = msg[0];
+	instance = msg[1];
+	reason = msg[2];
+
+	engine = guc_lookup_engine(guc, guc_class, instance);
+	if (unlikely(!engine)) {
+		drm_err(&guc_to_gt(guc)->i915->drm,
+			"Invalid engine %d:%d", guc_class, instance);
+		return -EPROTO;
+	}
+
+	intel_gt_handle_error(guc_to_gt(guc), engine->mask,
+			      I915_ERROR_CAPTURE,
+			      "GuC failed to reset %s (reason=0x%08x)\n",
+			      engine->name, reason);
+
+	return 0;
+}
+
 void intel_guc_submission_print_info(struct intel_guc *guc,
 				     struct drm_printer *p)
 {
-- 
2.28.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
