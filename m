Return-Path: <SRS0=LtMi=FS=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1E85C1B0D8
	for <intel-gfx@archiver.kernel.org>; Mon, 14 Dec 2020 10:11:00 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B221C22ADC
	for <intel-gfx@archiver.kernel.org>; Mon, 14 Dec 2020 10:11:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B221C22ADC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ACE16E425;
	Mon, 14 Dec 2020 10:10:29 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 457316E222
 for <intel-gfx@lists.freedesktop.org>; Mon, 14 Dec 2020 10:10:07 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from build.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 23317779-1500050 
 for multiple; Mon, 14 Dec 2020 10:09:51 +0000
From: Chris Wilson <chris@chris-wilson.co.uk>
To: intel-gfx@lists.freedesktop.org
Date: Mon, 14 Dec 2020 10:08:51 +0000
Message-Id: <20201214100949.11387-11-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201214100949.11387-1-chris@chris-wilson.co.uk>
References: <20201214100949.11387-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 11/69] drm/i915/gt: Simplify virtual engine
 handling for execlists_hold()
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

Now that the tasklet completely controls scheduling of the requests, and
we postpone scheduling out the old requests, we can keep a hanging
virtual request bound to the engine on which it hung, and remove it from
te queue. On release, it will be returned to the same engine and remain
in its queue until it is scheduled; after which point it will become
eligible for transfer to a sibling. Instead, we could opt to resubmit the
request along the virtual engine on unhold, making it eligible for load
balancing immediately -- but that seems like a pointless optimisation
for a hanging context.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 .../drm/i915/gt/intel_execlists_submission.c  | 29 -------------------
 1 file changed, 29 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index 26d704694c33..f021e0f4b24b 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -2833,35 +2833,6 @@ static bool execlists_hold(struct intel_engine_cs *engine,
 		goto unlock;
 	}
 
-	if (rq->engine != engine) { /* preempted virtual engine */
-		struct virtual_engine *ve = to_virtual_engine(rq->engine);
-
-		/*
-		 * intel_context_inflight() is only protected by virtue
-		 * of process_csb() being called only by the tasklet (or
-		 * directly from inside reset while the tasklet is suspended).
-		 * Assert that neither of those are allowed to run while we
-		 * poke at the request queues.
-		 */
-		GEM_BUG_ON(!reset_in_progress(&engine->execlists));
-
-		/*
-		 * An unsubmitted request along a virtual engine will
-		 * remain on the active (this) engine until we are able
-		 * to process the context switch away (and so mark the
-		 * context as no longer in flight). That cannot have happened
-		 * yet, otherwise we would not be hanging!
-		 */
-		spin_lock(&ve->base.active.lock);
-		GEM_BUG_ON(intel_context_inflight(rq->context) != engine);
-		GEM_BUG_ON(ve->request != rq);
-		ve->request = NULL;
-		spin_unlock(&ve->base.active.lock);
-		i915_request_put(rq);
-
-		rq->engine = engine;
-	}
-
 	/*
 	 * Transfer this request onto the hold queue to prevent it
 	 * being resumbitted to HW (and potentially completed) before we have
-- 
2.20.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
