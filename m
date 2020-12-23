Return-Path: <SRS0=gLHY=F3=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DD78C4332B
	for <intel-gfx@archiver.kernel.org>; Wed, 23 Dec 2020 11:12:44 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B6B3222F9
	for <intel-gfx@archiver.kernel.org>; Wed, 23 Dec 2020 11:12:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B6B3222F9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D32D6E937;
	Wed, 23 Dec 2020 11:12:16 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CD3A6E908
 for <intel-gfx@lists.freedesktop.org>; Wed, 23 Dec 2020 11:11:56 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from build.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 23412256-1500050 
 for multiple; Wed, 23 Dec 2020 11:11:38 +0000
From: Chris Wilson <chris@chris-wilson.co.uk>
To: intel-gfx@lists.freedesktop.org
Date: Wed, 23 Dec 2020 11:11:23 +0000
Message-Id: <20201223111126.3338-59-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201223111126.3338-1-chris@chris-wilson.co.uk>
References: <20201223111126.3338-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 59/62] drm/i915/gt: Enable busy-stats for
 ring-scheduler
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
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Couple up the context in/out accounting to record how long each engine
is busy handling requests. This is exposed to userspace for more accurate
measurements, and also enables our soft-rps timer.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 drivers/gpu/drm/i915/gt/intel_ring_scheduler.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_ring_scheduler.c b/drivers/gpu/drm/i915/gt/intel_ring_scheduler.c
index 338d847445ca..b95f4ad4bd00 100644
--- a/drivers/gpu/drm/i915/gt/intel_ring_scheduler.c
+++ b/drivers/gpu/drm/i915/gt/intel_ring_scheduler.c
@@ -11,6 +11,7 @@
 #include "intel_breadcrumbs.h"
 #include "intel_context.h"
 #include "intel_engine_pm.h"
+#include "intel_engine_stats.h"
 #include "intel_gt.h"
 #include "intel_gt_pm.h"
 #include "intel_gt_requests.h"
@@ -63,6 +64,8 @@ static struct intel_engine_cs *__schedule_in(struct i915_request *rq)
 	if (engine->fw_domain && !engine->fw_active++)
 		intel_uncore_forcewake_get(engine->uncore, engine->fw_domain);
 
+	intel_engine_context_in(engine);
+
 	CE_TRACE(ce, "schedule-in\n");
 
 	return engine;
@@ -96,6 +99,8 @@ static void __schedule_out(struct i915_request *rq)
 	else
 		i915_request_update_deadline(list_next_entry(rq, link));
 
+	intel_engine_context_out(engine);
+
 	if (engine->fw_domain && !--engine->fw_active)
 		intel_uncore_forcewake_put(engine->uncore, engine->fw_domain);
 	intel_gt_pm_put_async(engine->gt);
@@ -755,6 +760,7 @@ int intel_ring_scheduler_setup(struct intel_engine_cs *engine)
 
 	engine->flags |= I915_ENGINE_HAS_SCHEDULER;
 	engine->flags |= I915_ENGINE_NEEDS_BREADCRUMB_TASKLET;
+	engine->flags |= I915_ENGINE_SUPPORTS_STATS;
 
 	/* Finally, take ownership and responsibility for cleanup! */
 	engine->release = ring_release;
-- 
2.20.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
