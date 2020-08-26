Return-Path: <SRS0=RAJW=CE=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DB0BC433E4
	for <intel-gfx@archiver.kernel.org>; Wed, 26 Aug 2020 13:29:18 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A9AD21775
	for <intel-gfx@archiver.kernel.org>; Wed, 26 Aug 2020 13:29:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A9AD21775
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34BAB6EA84;
	Wed, 26 Aug 2020 13:29:17 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1FA46E391
 for <intel-gfx@lists.freedesktop.org>; Wed, 26 Aug 2020 13:28:30 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from build.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 22244749-1500050 
 for multiple; Wed, 26 Aug 2020 14:28:16 +0100
From: Chris Wilson <chris@chris-wilson.co.uk>
To: intel-gfx@lists.freedesktop.org
Date: Wed, 26 Aug 2020 14:27:55 +0100
Message-Id: <20200826132811.17577-23-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200826132811.17577-1-chris@chris-wilson.co.uk>
References: <20200826132811.17577-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 23/39] drm/i915/gt: Move the breadcrumb to the
 signaler if completed upon cancel
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

If while we are cancelling the breadcrumb signaling, we find that the
request is already completed, move it to the irq signaler and let it be
signaled.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 drivers/gpu/drm/i915/gt/intel_breadcrumbs.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c b/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c
index a24cc1ff08a0..f5f6feed0fa6 100644
--- a/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c
+++ b/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c
@@ -363,6 +363,14 @@ void intel_breadcrumbs_free(struct intel_breadcrumbs *b)
 	kfree(b);
 }
 
+static void irq_signal_request(struct i915_request *rq,
+			       struct intel_breadcrumbs *b)
+{
+	if (__signal_request(rq) &&
+	    llist_add(&rq->signal_node, &b->signaled_requests))
+		irq_work_queue(&b->irq_work);
+}
+
 static void insert_breadcrumb(struct i915_request *rq)
 {
 	struct intel_breadcrumbs *b = READ_ONCE(rq->engine)->breadcrumbs;
@@ -380,9 +388,7 @@ static void insert_breadcrumb(struct i915_request *rq)
 	 * its signal completion.
 	 */
 	if (__request_completed(rq)) {
-		if (__signal_request(rq) &&
-		    llist_add(&rq->signal_node, &b->signaled_requests))
-			irq_work_queue(&b->irq_work);
+		irq_signal_request(rq, b);
 		return;
 	}
 
@@ -453,6 +459,7 @@ bool i915_request_enable_breadcrumb(struct i915_request *rq)
 
 void i915_request_cancel_breadcrumb(struct i915_request *rq)
 {
+	struct intel_breadcrumbs *b = READ_ONCE(rq->engine)->breadcrumbs;
 	struct intel_context *ce = rq->context;
 	bool release;
 
@@ -461,11 +468,16 @@ void i915_request_cancel_breadcrumb(struct i915_request *rq)
 
 	spin_lock(&ce->signal_lock);
 	list_del_rcu(&rq->signal_link);
-	release = remove_signaling_context(rq->engine->breadcrumbs, ce);
+	release = remove_signaling_context(b, ce);
 	spin_unlock(&ce->signal_lock);
 	if (release)
 		intel_context_put(ce);
 
+	if (__request_completed(rq)) {
+		irq_signal_request(rq, b);
+		return;
+	}
+
 	i915_request_put(rq);
 }
 
-- 
2.20.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
