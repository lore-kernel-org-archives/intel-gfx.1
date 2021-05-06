Return-Path: <SRS0=MDkJ=KB=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D92D7C43470
	for <intel-gfx@archiver.kernel.org>; Thu,  6 May 2021 18:59:33 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E41761001
	for <intel-gfx@archiver.kernel.org>; Thu,  6 May 2021 18:59:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E41761001
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DF296EDEA;
	Thu,  6 May 2021 18:57:37 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E56F6ED13;
 Thu,  6 May 2021 18:57:13 +0000 (UTC)
IronPort-SDR: jB5AnINX24e8+LDyUw94SmbcZ6hI04oYEhAjre9nwUeVAza8YoSSzdonwGEdiv14JffdjEYGvG
 HhKRWRRpHZTw==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="196531016"
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="196531016"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 11:57:12 -0700
IronPort-SDR: fGkG1MCsNHnDaXIjXSp+v6VARKuILkWjmfBnHIEloPU1htI+YTAGAGZ+T7MezDs1QbiCX2cTMc
 FtK2wOgrROYA==
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="469583510"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 11:57:11 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Date: Thu,  6 May 2021 12:14:03 -0700
Message-Id: <20210506191451.77768-50-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210506191451.77768-1-matthew.brost@intel.com>
References: <20210506191451.77768-1-matthew.brost@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [RFC PATCH 49/97] drm/i915/guc: Disable engine barriers
 with GuC during unpin
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
Cc: jason.ekstrand@intel.com, daniel.vetter@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Disable engine barriers for unpinning with GuC. This feature isn't
needed with the GuC as it disables context scheduling before unpinning
which guarantees the HW will not reference the context. Hence it is
not necessary to defer unpinning until a kernel context request
completes on each engine in the context engine mask.

Cc: John Harrison <john.c.harrison@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_context.c    |  2 +-
 drivers/gpu/drm/i915/gt/intel_context.h    |  1 +
 drivers/gpu/drm/i915/gt/selftest_context.c | 10 ++++++++++
 drivers/gpu/drm/i915/i915_active.c         |  3 +++
 4 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
index 1499b8aace2a..7f97753ab164 100644
--- a/drivers/gpu/drm/i915/gt/intel_context.c
+++ b/drivers/gpu/drm/i915/gt/intel_context.c
@@ -80,7 +80,7 @@ static int intel_context_active_acquire(struct intel_context *ce)
 
 	__i915_active_acquire(&ce->active);
 
-	if (intel_context_is_barrier(ce))
+	if (intel_context_is_barrier(ce) || intel_engine_uses_guc(ce->engine))
 		return 0;
 
 	/* Preallocate tracking nodes */
diff --git a/drivers/gpu/drm/i915/gt/intel_context.h b/drivers/gpu/drm/i915/gt/intel_context.h
index 92ecbab8c1cd..9b211ca5ecc7 100644
--- a/drivers/gpu/drm/i915/gt/intel_context.h
+++ b/drivers/gpu/drm/i915/gt/intel_context.h
@@ -16,6 +16,7 @@
 #include "intel_engine_types.h"
 #include "intel_ring_types.h"
 #include "intel_timeline_types.h"
+#include "uc/intel_guc_submission.h"
 
 #define CE_TRACE(ce, fmt, ...) do {					\
 	const struct intel_context *ce__ = (ce);			\
diff --git a/drivers/gpu/drm/i915/gt/selftest_context.c b/drivers/gpu/drm/i915/gt/selftest_context.c
index 26685b927169..fa7b99a671dd 100644
--- a/drivers/gpu/drm/i915/gt/selftest_context.c
+++ b/drivers/gpu/drm/i915/gt/selftest_context.c
@@ -209,7 +209,13 @@ static int __live_active_context(struct intel_engine_cs *engine)
 	 * This test makes sure that the context is kept alive until a
 	 * subsequent idle-barrier (emitted when the engine wakeref hits 0
 	 * with no more outstanding requests).
+	 *
+	 * In GuC submission mode we don't use idle barriers and we instead
+	 * get a message from the GuC to signal that it is safe to unpin the
+	 * context from memory.
 	 */
+	if (intel_engine_uses_guc(engine))
+		return 0;
 
 	if (intel_engine_pm_is_awake(engine)) {
 		pr_err("%s is awake before starting %s!\n",
@@ -357,7 +363,11 @@ static int __live_remote_context(struct intel_engine_cs *engine)
 	 * on the context image remotely (intel_context_prepare_remote_request),
 	 * which inserts foreign fences into intel_context.active, does not
 	 * clobber the idle-barrier.
+	 *
+	 * In GuC submission mode we don't use idle barriers.
 	 */
+	if (intel_engine_uses_guc(engine))
+		return 0;
 
 	if (intel_engine_pm_is_awake(engine)) {
 		pr_err("%s is awake before starting %s!\n",
diff --git a/drivers/gpu/drm/i915/i915_active.c b/drivers/gpu/drm/i915/i915_active.c
index b1aa1c482c32..9a264898bb91 100644
--- a/drivers/gpu/drm/i915/i915_active.c
+++ b/drivers/gpu/drm/i915/i915_active.c
@@ -968,6 +968,9 @@ void i915_active_acquire_barrier(struct i915_active *ref)
 
 	GEM_BUG_ON(i915_active_is_idle(ref));
 
+	if (llist_empty(&ref->preallocated_barriers))
+		return;
+
 	/*
 	 * Transfer the list of preallocated barriers into the
 	 * i915_active rbtree, but only as proto-nodes. They will be
-- 
2.28.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
