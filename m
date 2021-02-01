Return-Path: <SRS0=l6T8=HD=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C92D6C433E9
	for <intel-gfx@archiver.kernel.org>; Mon,  1 Feb 2021 08:58:10 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D98E64E33
	for <intel-gfx@archiver.kernel.org>; Mon,  1 Feb 2021 08:58:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D98E64E33
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E2266E4D4;
	Mon,  1 Feb 2021 08:57:43 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53D586E499
 for <intel-gfx@lists.freedesktop.org>; Mon,  1 Feb 2021 08:57:34 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from build.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 23757737-1500050 
 for multiple; Mon, 01 Feb 2021 08:57:19 +0000
From: Chris Wilson <chris@chris-wilson.co.uk>
To: intel-gfx@lists.freedesktop.org
Date: Mon,  1 Feb 2021 08:56:42 +0000
Message-Id: <20210201085715.27435-24-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210201085715.27435-1-chris@chris-wilson.co.uk>
References: <20210201085715.27435-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 24/57] drm/i915/gt: Only kick the scheduler on
 timeslice/preemption change
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

Kick the scheduler to allow it to see the timeslice duration change,
don't peek into execlists.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 drivers/gpu/drm/i915/gt/sysfs_engines.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/sysfs_engines.c b/drivers/gpu/drm/i915/gt/sysfs_engines.c
index 57ef5383dd4e..526f8402cfb7 100644
--- a/drivers/gpu/drm/i915/gt/sysfs_engines.c
+++ b/drivers/gpu/drm/i915/gt/sysfs_engines.c
@@ -9,6 +9,7 @@
 #include "i915_drv.h"
 #include "intel_engine.h"
 #include "intel_engine_heartbeat.h"
+#include "intel_engine_pm.h"
 #include "sysfs_engines.h"
 
 struct kobj_engine {
@@ -222,9 +223,8 @@ timeslice_store(struct kobject *kobj, struct kobj_attribute *attr,
 		return -EINVAL;
 
 	WRITE_ONCE(engine->props.timeslice_duration_ms, duration);
-
-	if (execlists_active(&engine->execlists))
-		set_timer_ms(&engine->execlists.timer, duration);
+	if (intel_engine_pm_is_awake(engine))
+		intel_engine_kick_scheduler(engine);
 
 	return count;
 }
@@ -326,9 +326,8 @@ preempt_timeout_store(struct kobject *kobj, struct kobj_attribute *attr,
 		return -EINVAL;
 
 	WRITE_ONCE(engine->props.preempt_timeout_ms, timeout);
-
-	if (READ_ONCE(engine->execlists.pending[0]))
-		set_timer_ms(&engine->execlists.preempt, timeout);
+	if (intel_engine_pm_is_awake(engine))
+		intel_engine_kick_scheduler(engine);
 
 	return count;
 }
-- 
2.20.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
