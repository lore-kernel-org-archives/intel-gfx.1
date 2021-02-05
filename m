Return-Path: <SRS0=PZs0=HH=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D3F1C433E6
	for <intel-gfx@archiver.kernel.org>; Fri,  5 Feb 2021 17:44:06 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFCF764DD9
	for <intel-gfx@archiver.kernel.org>; Fri,  5 Feb 2021 17:44:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EFCF764DD9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FBCF6F4B2;
	Fri,  5 Feb 2021 17:44:05 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 229B76F49F
 for <intel-gfx@lists.freedesktop.org>; Fri,  5 Feb 2021 17:44:02 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.69.177; 
Received: from build.alporthouse.com (unverified [78.156.69.177]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 23801153-1500050 
 for <intel-gfx@lists.freedesktop.org>; Fri, 05 Feb 2021 17:43:59 +0000
From: Chris Wilson <chris@chris-wilson.co.uk>
To: intel-gfx@lists.freedesktop.org
Date: Fri,  5 Feb 2021 17:43:58 +0000
Message-Id: <20210205174358.28465-2-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210205174358.28465-1-chris@chris-wilson.co.uk>
References: <20210205174358.28465-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [Intel-gfx] [CI 2/2] drm/i915/gt: Pull all execlists scheduler
 initialisation together
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

Put all the scheduler initialisation code for execlists into a common
routine. This is to reduce code movement later.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 .../drm/i915/gt/intel_execlists_submission.c  | 26 ++++++++++++-------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index 9d24d91f5ae7..3a01b66939a0 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -2917,7 +2917,7 @@ static void rcs_submission_override(struct intel_engine_cs *engine)
 	}
 }
 
-int intel_execlists_submission_setup(struct intel_engine_cs *engine)
+static void init_execlists(struct intel_engine_cs *engine)
 {
 	struct intel_engine_execlists * const execlists = &engine->execlists;
 	struct drm_i915_private *i915 = engine->i915;
@@ -2925,17 +2925,10 @@ int intel_execlists_submission_setup(struct intel_engine_cs *engine)
 	u32 base = engine->mmio_base;
 
 	tasklet_setup(&engine->execlists.tasklet, execlists_submission_tasklet);
+
 	timer_setup(&engine->execlists.timer, execlists_timeslice, 0);
 	timer_setup(&engine->execlists.preempt, execlists_preempt, 0);
 
-	logical_ring_default_vfuncs(engine);
-	logical_ring_default_irqs(engine);
-
-	if (engine->class == RENDER_CLASS)
-		rcs_submission_override(engine);
-
-	lrc_init_wa_ctx(engine);
-
 	if (HAS_LOGICAL_RING_ELSQ(i915)) {
 		execlists->submit_reg = uncore->regs +
 			i915_mmio_reg_offset(RING_EXECLIST_SQ_CONTENTS(base));
@@ -2958,10 +2951,23 @@ int intel_execlists_submission_setup(struct intel_engine_cs *engine)
 		execlists->csb_size = GEN11_CSB_ENTRIES;
 
 	engine->context_tag = GENMASK(BITS_PER_LONG - 2, 0);
-	if (INTEL_GEN(engine->i915) >= 11) {
+	if (INTEL_GEN(i915) >= 11) {
 		execlists->ccid |= engine->instance << (GEN11_ENGINE_INSTANCE_SHIFT - 32);
 		execlists->ccid |= engine->class << (GEN11_ENGINE_CLASS_SHIFT - 32);
 	}
+}
+
+int intel_execlists_submission_setup(struct intel_engine_cs *engine)
+{
+	logical_ring_default_vfuncs(engine);
+	logical_ring_default_irqs(engine);
+
+	if (engine->class == RENDER_CLASS)
+		rcs_submission_override(engine);
+
+	init_execlists(engine);
+
+	lrc_init_wa_ctx(engine);
 
 	/* Finally, take ownership and responsibility for cleanup! */
 	engine->sanitize = execlists_sanitize;
-- 
2.20.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
