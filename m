Return-Path: <SRS0=CSZM=FO=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B9B9C4361B
	for <intel-gfx@archiver.kernel.org>; Thu, 10 Dec 2020 08:03:00 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14EA823D37
	for <intel-gfx@archiver.kernel.org>; Thu, 10 Dec 2020 08:02:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 14EA823D37
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F6C36E9E2;
	Thu, 10 Dec 2020 08:02:53 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56A716E2E6
 for <intel-gfx@lists.freedesktop.org>; Thu, 10 Dec 2020 08:02:50 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from build.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 23275677-1500050 
 for multiple; Thu, 10 Dec 2020 08:02:44 +0000
From: Chris Wilson <chris@chris-wilson.co.uk>
To: intel-gfx@lists.freedesktop.org
Date: Thu, 10 Dec 2020 08:02:40 +0000
Message-Id: <20201210080240.24529-21-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201210080240.24529-1-chris@chris-wilson.co.uk>
References: <20201210080240.24529-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 21/21] drm/i915/gt: Use ppHWSP for unshared
 non-semaphore related timelines
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

When we are not using semaphores with a context/engine, we can simply
reuse the same seqno location across wraps, but we still require each
timeline to have its own address. For LRC submission, each context is
prefixed by a per-process HWSP, which provides us with a unique location
for each context-local timeline. A shared timeline that is common to
multiple contexts will continue to use a separate page.

This enables us to create position invariant contexts should we feel the
need to relocate them.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
---
 .../drm/i915/gt/intel_execlists_submission.c  | 37 +++++++++++--------
 1 file changed, 22 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index 8bff0559a6a9..cc1b3509d808 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -4749,6 +4749,14 @@ static struct intel_timeline *pinned_timeline(struct intel_context *ce)
 						 page_unmask_bits(tl));
 }
 
+static struct intel_timeline *pphwsp_timeline(struct intel_context *ce,
+					      struct i915_vma *state)
+{
+	return __intel_timeline_create(ce->engine->gt, state,
+				       I915_GEM_HWS_SEQNO_ADDR |
+				       INTEL_TIMELINE_CONTEXT);
+}
+
 static int __execlists_context_alloc(struct intel_context *ce,
 				     struct intel_engine_cs *engine)
 {
@@ -4779,6 +4787,16 @@ static int __execlists_context_alloc(struct intel_context *ce,
 		goto error_deref_obj;
 	}
 
+	ring = intel_engine_create_ring(engine, (unsigned long)ce->ring);
+	if (IS_ERR(ring)) {
+		ret = PTR_ERR(ring);
+		goto error_deref_obj;
+	}
+
+	ret = populate_lr_context(ce, ctx_obj, engine, ring);
+	if (ret)
+		goto error_ring_free;
+
 	if (!page_mask_bits(ce->timeline)) {
 		struct intel_timeline *tl;
 
@@ -4788,29 +4806,18 @@ static int __execlists_context_alloc(struct intel_context *ce,
 		 */
 		if (unlikely(ce->timeline))
 			tl = pinned_timeline(ce);
-		else
+		else if (intel_engine_has_semaphores(engine))
 			tl = intel_timeline_create(engine->gt);
+		else
+			tl = pphwsp_timeline(ce, vma);
 		if (IS_ERR(tl)) {
 			ret = PTR_ERR(tl);
-			goto error_deref_obj;
+			goto error_ring_free;
 		}
 
 		ce->timeline = tl;
 	}
 
-	ring = intel_engine_create_ring(engine, (unsigned long)ce->ring);
-	if (IS_ERR(ring)) {
-		ret = PTR_ERR(ring);
-		goto error_deref_obj;
-	}
-
-	ret = populate_lr_context(ce, ctx_obj, engine, ring);
-	if (ret) {
-		drm_dbg(&engine->i915->drm,
-			"Failed to populate LRC: %d\n", ret);
-		goto error_ring_free;
-	}
-
 	ce->ring = ring;
 	ce->state = vma;
 
-- 
2.20.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
