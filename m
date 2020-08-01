Return-Path: <SRS0=JvXe=BL=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56054C433E1
	for <intel-gfx@archiver.kernel.org>; Sat,  1 Aug 2020 16:02:36 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37755207BC
	for <intel-gfx@archiver.kernel.org>; Sat,  1 Aug 2020 16:02:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 37755207BC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC8786EB95;
	Sat,  1 Aug 2020 16:02:30 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B5F96EB7C
 for <intel-gfx@lists.freedesktop.org>; Sat,  1 Aug 2020 16:02:28 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from build.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 22003546-1500050 
 for <intel-gfx@lists.freedesktop.org>; Sat, 01 Aug 2020 17:02:25 +0100
From: Chris Wilson <chris@chris-wilson.co.uk>
To: intel-gfx@lists.freedesktop.org
Date: Sat,  1 Aug 2020 17:02:24 +0100
Message-Id: <20200801160225.6814-1-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Intel-gfx] [CI 1/2] drm/i915/gt: Move intel_breadcrumbs_arm_irq
 earlier
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

Move the __intel_breadcrumbs_arm_irq earlier, next to the disarm_irq, so
that we can make use of it in the following patch.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_breadcrumbs.c | 84 ++++++++++-----------
 1 file changed, 42 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c b/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c
index 2ffd47a86656..9dd99969fd07 100644
--- a/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c
+++ b/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c
@@ -54,6 +54,36 @@ static void irq_disable(struct intel_engine_cs *engine)
 	spin_unlock(&engine->gt->irq_lock);
 }
 
+static void __intel_breadcrumbs_arm_irq(struct intel_breadcrumbs *b)
+{
+	lockdep_assert_held(&b->irq_lock);
+
+	if (!b->irq_engine || b->irq_armed)
+		return;
+
+	if (!intel_gt_pm_get_if_awake(b->irq_engine->gt))
+		return;
+
+	/*
+	 * The breadcrumb irq will be disarmed on the interrupt after the
+	 * waiters are signaled. This gives us a single interrupt window in
+	 * which we can add a new waiter and avoid the cost of re-enabling
+	 * the irq.
+	 */
+	WRITE_ONCE(b->irq_armed, true);
+
+	/*
+	 * Since we are waiting on a request, the GPU should be busy
+	 * and should have its own rpm reference. This is tracked
+	 * by i915->gt.awake, we can forgo holding our own wakref
+	 * for the interrupt as before i915->gt.awake is released (when
+	 * the driver is idle) we disarm the breadcrumbs.
+	 */
+
+	if (!b->irq_enabled++)
+		irq_enable(b->irq_engine);
+}
+
 static void __intel_breadcrumbs_disarm_irq(struct intel_breadcrumbs *b)
 {
 	lockdep_assert_held(&b->irq_lock);
@@ -69,18 +99,6 @@ static void __intel_breadcrumbs_disarm_irq(struct intel_breadcrumbs *b)
 	intel_gt_pm_put_async(b->irq_engine->gt);
 }
 
-void intel_breadcrumbs_park(struct intel_breadcrumbs *b)
-{
-	unsigned long flags;
-
-	if (!READ_ONCE(b->irq_armed))
-		return;
-
-	spin_lock_irqsave(&b->irq_lock, flags);
-	__intel_breadcrumbs_disarm_irq(b);
-	spin_unlock_irqrestore(&b->irq_lock, flags);
-}
-
 static inline bool __request_completed(const struct i915_request *rq)
 {
 	return i915_seqno_passed(__hwsp_seqno(rq), rq->fence.seqno);
@@ -214,36 +232,6 @@ static void signal_irq_work(struct irq_work *work)
 	}
 }
 
-static void __intel_breadcrumbs_arm_irq(struct intel_breadcrumbs *b)
-{
-	lockdep_assert_held(&b->irq_lock);
-
-	if (!b->irq_engine || b->irq_armed)
-		return;
-
-	if (!intel_gt_pm_get_if_awake(b->irq_engine->gt))
-		return;
-
-	/*
-	 * The breadcrumb irq will be disarmed on the interrupt after the
-	 * waiters are signaled. This gives us a single interrupt window in
-	 * which we can add a new waiter and avoid the cost of re-enabling
-	 * the irq.
-	 */
-	WRITE_ONCE(b->irq_armed, true);
-
-	/*
-	 * Since we are waiting on a request, the GPU should be busy
-	 * and should have its own rpm reference. This is tracked
-	 * by i915->gt.awake, we can forgo holding our own wakref
-	 * for the interrupt as before i915->gt.awake is released (when
-	 * the driver is idle) we disarm the breadcrumbs.
-	 */
-
-	if (!b->irq_enabled++)
-		irq_enable(b->irq_engine);
-}
-
 struct intel_breadcrumbs *
 intel_breadcrumbs_create(struct intel_engine_cs *irq_engine)
 {
@@ -281,6 +269,18 @@ void intel_breadcrumbs_reset(struct intel_breadcrumbs *b)
 	spin_unlock_irqrestore(&b->irq_lock, flags);
 }
 
+void intel_breadcrumbs_park(struct intel_breadcrumbs *b)
+{
+	unsigned long flags;
+
+	if (!READ_ONCE(b->irq_armed))
+		return;
+
+	spin_lock_irqsave(&b->irq_lock, flags);
+	__intel_breadcrumbs_disarm_irq(b);
+	spin_unlock_irqrestore(&b->irq_lock, flags);
+}
+
 void intel_breadcrumbs_free(struct intel_breadcrumbs *b)
 {
 	kfree(b);
-- 
2.20.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
