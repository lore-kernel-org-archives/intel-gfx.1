Return-Path: <SRS0=NnJ0=BU=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7467C433E0
	for <intel-gfx@archiver.kernel.org>; Mon, 10 Aug 2020 08:59:07 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C247F2070B
	for <intel-gfx@archiver.kernel.org>; Mon, 10 Aug 2020 08:59:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C247F2070B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D25F6E3B8;
	Mon, 10 Aug 2020 08:59:05 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F9546E3B8
 for <intel-gfx@lists.freedesktop.org>; Mon, 10 Aug 2020 08:59:03 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from build.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 22081696-1500050 
 for multiple; Mon, 10 Aug 2020 09:58:55 +0100
From: Chris Wilson <chris@chris-wilson.co.uk>
To: intel-gfx@lists.freedesktop.org
Date: Mon, 10 Aug 2020 09:58:54 +0100
Message-Id: <20200810085855.28433-2-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200810085855.28433-1-chris@chris-wilson.co.uk>
References: <20200810085855.28433-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 2/3] drm/i915/selftests: Finish pending mock
 requests on cancellation.
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

Flush all the pending requests from the mock engine when they are
cancelled.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 drivers/gpu/drm/i915/gt/mock_engine.c | 29 +++++++++++++++++++++++----
 1 file changed, 25 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/mock_engine.c b/drivers/gpu/drm/i915/gt/mock_engine.c
index 79764305b8ec..bb6f86cf9d4b 100644
--- a/drivers/gpu/drm/i915/gt/mock_engine.c
+++ b/drivers/gpu/drm/i915/gt/mock_engine.c
@@ -233,19 +233,40 @@ static void mock_reset_rewind(struct intel_engine_cs *engine, bool stalled)
 	GEM_BUG_ON(stalled);
 }
 
+static void mark_eio(struct i915_request *rq)
+{
+	if (i915_request_completed(rq))
+		return;
+
+	GEM_BUG_ON(i915_request_signaled(rq));
+
+	i915_request_set_error_once(rq, -EIO);
+	i915_request_mark_complete(rq);
+}
+
 static void mock_reset_cancel(struct intel_engine_cs *engine)
 {
-	struct i915_request *request;
+	struct mock_engine *mock =
+		container_of(engine, typeof(*mock), base);
+	struct i915_request *rq;
 	unsigned long flags;
 
+	del_timer_sync(&mock->hw_delay);
+
 	spin_lock_irqsave(&engine->active.lock, flags);
 
 	/* Mark all submitted requests as skipped. */
-	list_for_each_entry(request, &engine->active.requests, sched.link) {
-		i915_request_set_error_once(request, -EIO);
-		i915_request_mark_complete(request);
+	list_for_each_entry(rq, &engine->active.requests, sched.link)
+		mark_eio(rq);
+
+	/* Cancel and submit all pending requests. */
+	list_for_each_entry(rq, &mock->hw_queue, mock.link) {
+		mark_eio(rq);
+		__i915_request_submit(rq);
 	}
+	INIT_LIST_HEAD(&mock->hw_queue);
 
+	intel_engine_signal_breadcrumbs(engine);
 	spin_unlock_irqrestore(&engine->active.lock, flags);
 }
 
-- 
2.20.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
