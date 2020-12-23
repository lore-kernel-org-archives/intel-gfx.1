Return-Path: <SRS0=gLHY=F3=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 331AAC433DB
	for <intel-gfx@archiver.kernel.org>; Wed, 23 Dec 2020 15:45:20 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C4AC206FC
	for <intel-gfx@archiver.kernel.org>; Wed, 23 Dec 2020 15:45:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C4AC206FC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF9186E93E;
	Wed, 23 Dec 2020 15:45:18 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CEC86E93E
 for <intel-gfx@lists.freedesktop.org>; Wed, 23 Dec 2020 15:45:16 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from build.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 23415497-1500050 
 for multiple; Wed, 23 Dec 2020 15:45:10 +0000
From: Chris Wilson <chris@chris-wilson.co.uk>
To: intel-gfx@lists.freedesktop.org
Date: Wed, 23 Dec 2020 15:45:09 +0000
Message-Id: <20201223154509.14155-1-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH] drm/i915/selftests: Remove redundant
 live_context for eviction
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

We just need the context image from the logical state to force eviction
of many contexts, so simplify by avoiding the GEM context container.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 .../gpu/drm/i915/selftests/i915_gem_evict.c    | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/i915/selftests/i915_gem_evict.c b/drivers/gpu/drm/i915/selftests/i915_gem_evict.c
index f88473d396f4..3512bb8433cf 100644
--- a/drivers/gpu/drm/i915/selftests/i915_gem_evict.c
+++ b/drivers/gpu/drm/i915/selftests/i915_gem_evict.c
@@ -442,28 +442,22 @@ static int igt_evict_contexts(void *arg)
 	/* Overfill the GGTT with context objects and so try to evict one. */
 	for_each_engine(engine, gt, id) {
 		struct i915_sw_fence fence;
-		struct file *file;
-
-		file = mock_file(i915);
-		if (IS_ERR(file)) {
-			err = PTR_ERR(file);
-			break;
-		}
 
 		count = 0;
 		onstack_fence_init(&fence);
 		do {
+			struct intel_context *ce;
 			struct i915_request *rq;
-			struct i915_gem_context *ctx;
 
-			ctx = live_context(i915, file);
-			if (IS_ERR(ctx))
+			ce = intel_context_create(engine);
+			if (IS_ERR(ce))
 				break;
 
 			/* We will need some GGTT space for the rq's context */
 			igt_evict_ctl.fail_if_busy = true;
-			rq = igt_request_alloc(ctx, engine);
+			rq = intel_context_create_request(ce);
 			igt_evict_ctl.fail_if_busy = false;
+			intel_context_put(ce);
 
 			if (IS_ERR(rq)) {
 				/* When full, fail_if_busy will trigger EBUSY */
@@ -490,8 +484,6 @@ static int igt_evict_contexts(void *arg)
 		onstack_fence_fini(&fence);
 		pr_info("Submitted %lu contexts/requests on %s\n",
 			count, engine->name);
-
-		fput(file);
 		if (err)
 			break;
 	}
-- 
2.20.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
