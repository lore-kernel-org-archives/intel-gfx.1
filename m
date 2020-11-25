Return-Path: <SRS0=W/nN=E7=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C04EC56202
	for <intel-gfx@archiver.kernel.org>; Wed, 25 Nov 2020 20:07:39 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0A342075A
	for <intel-gfx@archiver.kernel.org>; Wed, 25 Nov 2020 20:07:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E0A342075A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 159BF6EA7E;
	Wed, 25 Nov 2020 20:07:38 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC7196EA7E
 for <intel-gfx@lists.freedesktop.org>; Wed, 25 Nov 2020 20:07:36 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from build.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 23108290-1500050 
 for <intel-gfx@lists.freedesktop.org>; Wed, 25 Nov 2020 20:07:32 +0000
From: Chris Wilson <chris@chris-wilson.co.uk>
To: intel-gfx@lists.freedesktop.org
Date: Wed, 25 Nov 2020 20:07:32 +0000
Message-Id: <20201125200733.24581-1-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Intel-gfx] [CI 1/2] drm/i915/gt: Decouple completed requests on
 unwind
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

Since the introduction of preempt-to-busy, requests can complete in the
background, even while they are not on the engine->active.requests list.
As such, the engine->active.request list itself is not in strict
retirement order, and we have to scan the entire list while unwinding to
not miss any. However, if the request is completed we currently leave it
on the list [until retirement], but we could just as simply remove it
and stop treating it as active. We would only have to then traverse it
once while unwinding in quick succession.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_lrc.c | 6 ++++--
 drivers/gpu/drm/i915/i915_request.c | 3 ++-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
index 30aa59fb7271..cf11cbac241b 100644
--- a/drivers/gpu/drm/i915/gt/intel_lrc.c
+++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
@@ -1116,8 +1116,10 @@ __unwind_incomplete_requests(struct intel_engine_cs *engine)
 	list_for_each_entry_safe_reverse(rq, rn,
 					 &engine->active.requests,
 					 sched.link) {
-		if (i915_request_completed(rq))
-			continue; /* XXX */
+		if (i915_request_completed(rq)) {
+			list_del_init(&rq->sched.link);
+			continue;
+		}
 
 		__i915_request_unsubmit(rq);
 
diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
index 8d7d29c9e375..a9db1376b996 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -321,7 +321,8 @@ bool i915_request_retire(struct i915_request *rq)
 	 * after removing the breadcrumb and signaling it, so that we do not
 	 * inadvertently attach the breadcrumb to a completed request.
 	 */
-	remove_from_engine(rq);
+	if (!list_empty(&rq->sched.link))
+		remove_from_engine(rq);
 	GEM_BUG_ON(!llist_empty(&rq->execute_cb));
 
 	__list_del_entry(&rq->link); /* poison neither prev/next (RCU walks) */
-- 
2.20.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
