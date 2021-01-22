Return-Path: <SRS0=EOwD=GZ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F80DC433DB
	for <intel-gfx@archiver.kernel.org>; Fri, 22 Jan 2021 15:06:42 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B8CE23A5C
	for <intel-gfx@archiver.kernel.org>; Fri, 22 Jan 2021 15:06:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B8CE23A5C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 785296EA1F;
	Fri, 22 Jan 2021 15:06:39 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D5F76EA12
 for <intel-gfx@lists.freedesktop.org>; Fri, 22 Jan 2021 15:06:34 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from build.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 23672676-1500050 
 for multiple; Fri, 22 Jan 2021 15:06:22 +0000
From: Chris Wilson <chris@chris-wilson.co.uk>
To: intel-gfx@lists.freedesktop.org
Date: Fri, 22 Jan 2021 15:06:15 +0000
Message-Id: <20210122150622.21088-3-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210122150622.21088-1-chris@chris-wilson.co.uk>
References: <20210122150622.21088-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 03/10] drm/i915/gt: Remove repeated words from
 comments
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

Checkpatch spotted a few repeated words in the comment, genuine
mistakes.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 drivers/gpu/drm/i915/gt/intel_execlists_submission.c | 2 +-
 drivers/gpu/drm/i915/gt/intel_ggtt.c                 | 2 +-
 drivers/gpu/drm/i915/gt/intel_reset_types.h          | 2 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c          | 2 +-
 drivers/gpu/drm/i915/gt/selftest_execlists.c         | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index 3e680bfa9d13..304d4b8e08e1 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -3108,7 +3108,7 @@ static void execlists_release(struct intel_engine_cs *engine)
 static void
 logical_ring_default_vfuncs(struct intel_engine_cs *engine)
 {
-	/* Default vfuncs which can be overriden by each engine. */
+	/* Default vfuncs which can be overridden by each engine. */
 
 	engine->resume = execlists_resume;
 
diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
index eece0844fbe9..dac07d66f658 100644
--- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
@@ -92,7 +92,7 @@ int i915_ggtt_init_hw(struct drm_i915_private *i915)
 }
 
 /*
- * Certain Gen5 chipsets require require idling the GPU before
+ * Certain Gen5 chipsets require idling the GPU before
  * unmapping anything from the GTT when VT-d is enabled.
  */
 static bool needs_idle_maps(struct drm_i915_private *i915)
diff --git a/drivers/gpu/drm/i915/gt/intel_reset_types.h b/drivers/gpu/drm/i915/gt/intel_reset_types.h
index add6b86d9d03..9312b29f5a97 100644
--- a/drivers/gpu/drm/i915/gt/intel_reset_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_reset_types.h
@@ -32,7 +32,7 @@ struct intel_reset {
 	 *
 	 * #I915_WEDGED_ON_INIT - If we fail to initialize the GPU we can no
 	 * longer use the GPU - similar to #I915_WEDGED bit. The difference in
-	 * in the way we're handling "forced" unwedged (e.g. through debugfs),
+	 * the way we're handling "forced" unwedged (e.g. through debugfs),
 	 * which is not allowed in case we failed to initialize.
 	 *
 	 * #I915_WEDGED_ON_FINI - Similar to #I915_WEDGED_ON_INIT, except we
diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index e51e6977016a..8abfd6ad9718 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -280,7 +280,7 @@ static void gen8_ctx_workarounds_init(struct intel_engine_cs *engine,
 		     PARTIAL_INSTRUCTION_SHOOTDOWN_DISABLE);
 
 	/* Use Force Non-Coherent whenever executing a 3D context. This is a
-	 * workaround for for a possible hang in the unlikely event a TLB
+	 * workaround for a possible hang in the unlikely event a TLB
 	 * invalidation occurs during a PSD flush.
 	 */
 	/* WaForceEnableNonCoherent:bdw,chv */
diff --git a/drivers/gpu/drm/i915/gt/selftest_execlists.c b/drivers/gpu/drm/i915/gt/selftest_execlists.c
index 4f2853a83075..6cfa9a89d891 100644
--- a/drivers/gpu/drm/i915/gt/selftest_execlists.c
+++ b/drivers/gpu/drm/i915/gt/selftest_execlists.c
@@ -2864,7 +2864,7 @@ static int __live_preempt_ring(struct intel_engine_cs *engine,
 	err = wait_for_submit(engine, rq, HZ / 2);
 	i915_request_put(rq);
 	if (err) {
-		pr_err("%s: preemption request was not submited\n",
+		pr_err("%s: preemption request was not submitted\n",
 		       engine->name);
 		err = -ETIME;
 	}
-- 
2.20.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
