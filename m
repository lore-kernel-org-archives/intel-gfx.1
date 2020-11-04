Return-Path: <SRS0=5tEz=EK=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89A36C4741F
	for <intel-gfx@archiver.kernel.org>; Wed,  4 Nov 2020 12:21:00 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28386208C7
	for <intel-gfx@archiver.kernel.org>; Wed,  4 Nov 2020 12:20:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 28386208C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FD906ECF9;
	Wed,  4 Nov 2020 12:20:59 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 950F46ECF8
 for <Intel-gfx@lists.freedesktop.org>; Wed,  4 Nov 2020 12:20:57 +0000 (UTC)
IronPort-SDR: tWwqq0WtcyRD2hnh4C6FpFIrvqX4Tw+MpI39Z7Hew6y0kyx0OOgSJ15KcS0iqGY5H5Let6yjqu
 uQa2Hv03MXkw==
X-IronPort-AV: E=McAfee;i="6000,8403,9794"; a="156196396"
X-IronPort-AV: E=Sophos;i="5.77,450,1596524400"; d="scan'208";a="156196396"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2020 04:20:56 -0800
IronPort-SDR: zWtfKkhh89DxsdpPWRXQe5mO2isEFgzAQGdQrW3T/GBN7b2JeQ0bAdHmiikh9uMCyRnrXKkDJu
 u5ArSa1B3qZw==
X-IronPort-AV: E=Sophos;i="5.77,450,1596524400"; d="scan'208";a="538901768"
Received: from marak-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.249.42.32])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2020 04:20:55 -0800
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Date: Wed,  4 Nov 2020 12:20:43 +0000
Message-Id: <20201104122043.876567-2-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201104122043.876567-1-tvrtko.ursulin@linux.intel.com>
References: <20201104122043.876567-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [RFC 2/2] drm/i915: Use user engine names in error
 state ecode
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

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Instead of printing out the internal engine mask, which can change between
kernel versions making it difficult to map to actual engines, list user
friendly engine names in the ecode string. For example:

  [drm] GPU HANG: ecode 9:vcs1:a77ffefe, in gem_exec_captur [929]

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/i915/i915_gpu_error.c | 38 ++++++++++++++++-----------
 drivers/gpu/drm/i915/i915_gpu_error.h |  2 +-
 2 files changed, 24 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
index 857db66cc4a3..ce876e3f3ec5 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.c
+++ b/drivers/gpu/drm/i915/i915_gpu_error.c
@@ -1659,32 +1659,40 @@ static u32 generate_ecode(const struct intel_engine_coredump *ee)
 static const char *error_msg(struct i915_gpu_coredump *error)
 {
 	struct intel_engine_coredump *first = NULL;
+	int space = sizeof(error->error_msg) - 1, len;
 	struct intel_gt_coredump *gt;
-	intel_engine_mask_t engines;
-	int len;
+	char *p = error->error_msg;
+
+	len = scnprintf(p, space, "GPU HANG: ecode %d:",
+			INTEL_GEN(error->i915));
+	p += len;
+	space -= len;
 
-	engines = 0;
 	for (gt = error->gt; gt; gt = gt->next) {
 		struct intel_engine_coredump *cs;
 
 		for (cs = gt->engine; cs; cs = cs->next) {
-			if (cs->hung) {
-				engines |= cs->engine->mask;
-				if (!first)
-					first = cs;
-			}
+			if (!cs->hung)
+				continue;
+
+			len = scnprintf(p, space, "%s%s",
+					first ? "," : "",
+					cs->engine->name);
+			p += len;
+			space -= len;
+
+			if (!first)
+				first = cs;
 		}
 	}
 
-	len = scnprintf(error->error_msg, sizeof(error->error_msg),
-			"GPU HANG: ecode %d:%x:%08x",
-			INTEL_GEN(error->i915), engines,
-			generate_ecode(first));
+	len = scnprintf(p, space, ":%08x", generate_ecode(first));
+	p += len;
+	space -= len;
+
 	if (first && first->context.pid) {
 		/* Just show the first executing process, more is confusing */
-		len += scnprintf(error->error_msg + len,
-				 sizeof(error->error_msg) - len,
-				 ", in %s [%d]",
+		len += scnprintf(p, space, ", in %s [%d]",
 				 first->context.comm, first->context.pid);
 	}
 
diff --git a/drivers/gpu/drm/i915/i915_gpu_error.h b/drivers/gpu/drm/i915/i915_gpu_error.h
index 3a7ca90a3436..6b8573ddbe67 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.h
+++ b/drivers/gpu/drm/i915/i915_gpu_error.h
@@ -168,7 +168,7 @@ struct i915_gpu_coredump {
 
 	struct intel_gt_coredump *gt;
 
-	char error_msg[128];
+	char error_msg[256];
 	bool simulated;
 	bool wakelock;
 	bool suspended;
-- 
2.25.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
