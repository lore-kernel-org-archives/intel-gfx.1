Return-Path: <SRS0=HVxp=NR=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83962C4320E
	for <intel-gfx@archiver.kernel.org>; Thu, 26 Aug 2021 03:29:26 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 345F461008
	for <intel-gfx@archiver.kernel.org>; Thu, 26 Aug 2021 03:29:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 345F461008
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 673556E4EA;
	Thu, 26 Aug 2021 03:28:46 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED1AE6E4B6;
 Thu, 26 Aug 2021 03:28:40 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10087"; a="215811066"
X-IronPort-AV: E=Sophos;i="5.84,352,1620716400"; d="scan'208";a="215811066"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2021 20:28:40 -0700
X-IronPort-AV: E=Sophos;i="5.84,352,1620716400"; d="scan'208";a="684738540"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2021 20:28:39 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Cc: <daniele.ceraolospurio@intel.com>
Date: Wed, 25 Aug 2021 20:23:08 -0700
Message-Id: <20210826032327.18078-9-matthew.brost@intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210826032327.18078-1-matthew.brost@intel.com>
References: <20210826032327.18078-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 08/27] drm/i915/selftests: Add a cancel request
 selftest that triggers a reset
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

Add a cancel request selftest that results in an engine reset to cancel
the request as it is non-preemptable. Also insert a NOP request after
the cancelled request and confirm that it completely successfully.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/selftests/i915_request.c | 100 ++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/drivers/gpu/drm/i915/selftests/i915_request.c b/drivers/gpu/drm/i915/selftests/i915_request.c
index d67710d10615..e2c5db77f087 100644
--- a/drivers/gpu/drm/i915/selftests/i915_request.c
+++ b/drivers/gpu/drm/i915/selftests/i915_request.c
@@ -772,6 +772,98 @@ static int __cancel_completed(struct intel_engine_cs *engine)
 	return err;
 }
 
+static int __cancel_reset(struct intel_engine_cs *engine)
+{
+	struct intel_context *ce;
+	struct igt_spinner spin;
+	struct i915_request *rq, *nop;
+	unsigned long preempt_timeout_ms;
+	int err = 0;
+
+	preempt_timeout_ms = engine->props.preempt_timeout_ms;
+	engine->props.preempt_timeout_ms = 100;
+
+	if (igt_spinner_init(&spin, engine->gt))
+		goto out_restore;
+
+	ce = intel_context_create(engine);
+	if (IS_ERR(ce)) {
+		err = PTR_ERR(ce);
+		goto out_spin;
+	}
+
+	rq = igt_spinner_create_request(&spin, ce, MI_NOOP);
+	if (IS_ERR(rq)) {
+		err = PTR_ERR(rq);
+		goto out_ce;
+	}
+
+	pr_debug("%s: Cancelling active request\n", engine->name);
+	i915_request_get(rq);
+	i915_request_add(rq);
+	if (!igt_wait_for_spinner(&spin, rq)) {
+		struct drm_printer p = drm_info_printer(engine->i915->drm.dev);
+
+		pr_err("Failed to start spinner on %s\n", engine->name);
+		intel_engine_dump(engine, &p, "%s\n", engine->name);
+		err = -ETIME;
+		goto out_rq;
+	}
+
+	nop = intel_context_create_request(ce);
+	if (IS_ERR(nop))
+		goto out_nop;
+	i915_request_get(nop);
+	i915_request_add(nop);
+
+	i915_request_cancel(rq, -EINTR);
+
+	if (i915_request_wait(rq, 0, HZ) < 0) {
+		struct drm_printer p = drm_info_printer(engine->i915->drm.dev);
+
+		pr_err("%s: Failed to cancel hung request\n", engine->name);
+		intel_engine_dump(engine, &p, "%s\n", engine->name);
+		err = -ETIME;
+		goto out_nop;
+	}
+
+	if (rq->fence.error != -EINTR) {
+		pr_err("%s: fence not cancelled (%u)\n",
+		       engine->name, rq->fence.error);
+		err = -EINVAL;
+		goto out_nop;
+	}
+
+	if (i915_request_wait(nop, 0, HZ) < 0) {
+		struct drm_printer p = drm_info_printer(engine->i915->drm.dev);
+
+		pr_err("%s: Failed to complete nop request\n", engine->name);
+		intel_engine_dump(engine, &p, "%s\n", engine->name);
+		err = -ETIME;
+		goto out_nop;
+	}
+
+	if (nop->fence.error != 0) {
+		pr_err("%s: Nop request errored (%u)\n",
+		       engine->name, nop->fence.error);
+		err = -EINVAL;
+	}
+
+out_nop:
+	i915_request_put(nop);
+out_rq:
+	i915_request_put(rq);
+out_ce:
+	intel_context_put(ce);
+out_spin:
+	igt_spinner_fini(&spin);
+out_restore:
+	engine->props.preempt_timeout_ms = preempt_timeout_ms;
+	if (err)
+		pr_err("%s: %s error %d\n", __func__, engine->name, err);
+	return err;
+}
+
 static int live_cancel_request(void *arg)
 {
 	struct drm_i915_private *i915 = arg;
@@ -804,6 +896,14 @@ static int live_cancel_request(void *arg)
 			return err;
 		if (err2)
 			return err2;
+
+		/* Expects reset so call outside of igt_live_test_* */
+		err = __cancel_reset(engine);
+		if (err)
+			return err;
+
+		if (igt_flush_test(i915))
+			return -EIO;
 	}
 
 	return 0;
-- 
2.32.0

