Return-Path: <SRS0=TENP=GH=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55DF6C433E6
	for <intel-gfx@archiver.kernel.org>; Mon,  4 Jan 2021 14:01:47 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD937221E5
	for <intel-gfx@archiver.kernel.org>; Mon,  4 Jan 2021 14:01:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD937221E5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76C1A89F71;
	Mon,  4 Jan 2021 14:01:45 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D53189F5B
 for <intel-gfx@lists.freedesktop.org>; Mon,  4 Jan 2021 14:01:43 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from build.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 23496925-1500050 
 for multiple; Mon, 04 Jan 2021 14:01:35 +0000
From: Chris Wilson <chris@chris-wilson.co.uk>
To: intel-gfx@lists.freedesktop.org
Date: Mon,  4 Jan 2021 14:01:34 +0000
Message-Id: <20210104140135.26285-1-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 1/2] drm/i915/gem: Almagamate clflushes on
 suspend
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

When flushing objects larger than the CPU cache it is preferrable to use
a single wbinvd() rather than overlapping clflush(). At runtime, we
avoid wbinvd() due to its system-wide latencies, but during
singlethreaded suspend, no one will observe the imposed latency and we
can opt for the faster wbinvd to clear all objects in a single hit.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 drivers/gpu/drm/i915/gem/i915_gem_pm.c | 34 ++++++--------------------
 1 file changed, 7 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pm.c b/drivers/gpu/drm/i915/gem/i915_gem_pm.c
index 40d3e40500fa..6f9bba1ba20e 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_pm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_pm.c
@@ -32,13 +32,6 @@ void i915_gem_suspend(struct drm_i915_private *i915)
 	i915_gem_drain_freed_objects(i915);
 }
 
-static struct drm_i915_gem_object *first_mm_object(struct list_head *list)
-{
-	return list_first_entry_or_null(list,
-					struct drm_i915_gem_object,
-					mm.link);
-}
-
 void i915_gem_suspend_late(struct drm_i915_private *i915)
 {
 	struct drm_i915_gem_object *obj;
@@ -48,6 +41,7 @@ void i915_gem_suspend_late(struct drm_i915_private *i915)
 		NULL
 	}, **phase;
 	unsigned long flags;
+	bool flush = false;
 
 	/*
 	 * Neither the BIOS, ourselves or any other kernel
@@ -73,29 +67,15 @@ void i915_gem_suspend_late(struct drm_i915_private *i915)
 
 	spin_lock_irqsave(&i915->mm.obj_lock, flags);
 	for (phase = phases; *phase; phase++) {
-		LIST_HEAD(keep);
-
-		while ((obj = first_mm_object(*phase))) {
-			list_move_tail(&obj->mm.link, &keep);
-
-			/* Beware the background _i915_gem_free_objects */
-			if (!kref_get_unless_zero(&obj->base.refcount))
-				continue;
-
-			spin_unlock_irqrestore(&i915->mm.obj_lock, flags);
-
-			i915_gem_object_lock(obj, NULL);
-			drm_WARN_ON(&i915->drm,
-			    i915_gem_object_set_to_gtt_domain(obj, false));
-			i915_gem_object_unlock(obj);
-			i915_gem_object_put(obj);
-
-			spin_lock_irqsave(&i915->mm.obj_lock, flags);
+		list_for_each_entry(obj, *phase, mm.link) {
+			if (!(obj->cache_coherent & I915_BO_CACHE_COHERENT_FOR_READ))
+				flush |= (obj->read_domains & I915_GEM_DOMAIN_CPU) == 0;
+			__start_cpu_write(obj); /* presume auto-hibernate */
 		}
-
-		list_splice_tail(&keep, *phase);
 	}
 	spin_unlock_irqrestore(&i915->mm.obj_lock, flags);
+	if (flush)
+		wbinvd_on_all_cpus();
 }
 
 void i915_gem_resume(struct drm_i915_private *i915)
-- 
2.20.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
