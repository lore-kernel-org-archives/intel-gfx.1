Return-Path: <SRS0=EqF4=GR=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2981BC433E0
	for <intel-gfx@archiver.kernel.org>; Thu, 14 Jan 2021 10:14:58 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9797C23A34
	for <intel-gfx@archiver.kernel.org>; Thu, 14 Jan 2021 10:14:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9797C23A34
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0CEA8970E;
	Thu, 14 Jan 2021 10:14:56 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC0D5896E5
 for <intel-gfx@lists.freedesktop.org>; Thu, 14 Jan 2021 10:14:54 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from build.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 23592702-1500050 
 for <intel-gfx@lists.freedesktop.org>; Thu, 14 Jan 2021 10:14:52 +0000
From: Chris Wilson <chris@chris-wilson.co.uk>
To: intel-gfx@lists.freedesktop.org
Date: Thu, 14 Jan 2021 10:14:51 +0000
Message-Id: <20210114101451.24762-1-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Intel-gfx] [CI] drm/i915/gt: Reapply ppgtt enabling after engine
 resets
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

The GFX_MODE is reset along with the engine, turning off ppGTT. We need
to re-enable it upon resume afterwards.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Reviewed-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/gen6_ppgtt.c            |  9 ---------
 drivers/gpu/drm/i915/gt/intel_ring_submission.c | 13 ++++++++++---
 2 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/gen6_ppgtt.c b/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
index 680bd9442eb0..0f02afe7f43a 100644
--- a/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
+++ b/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
@@ -27,8 +27,6 @@ void gen7_ppgtt_enable(struct intel_gt *gt)
 {
 	struct drm_i915_private *i915 = gt->i915;
 	struct intel_uncore *uncore = gt->uncore;
-	struct intel_engine_cs *engine;
-	enum intel_engine_id id;
 	u32 ecochk;
 
 	intel_uncore_rmw(uncore, GAC_ECO_BITS, 0, ECOBITS_PPGTT_CACHE64B);
@@ -41,13 +39,6 @@ void gen7_ppgtt_enable(struct intel_gt *gt)
 		ecochk &= ~ECOCHK_PPGTT_GFDT_IVB;
 	}
 	intel_uncore_write(uncore, GAM_ECOCHK, ecochk);
-
-	for_each_engine(engine, gt, id) {
-		/* GFX_MODE is per-ring on gen7+ */
-		ENGINE_WRITE(engine,
-			     RING_MODE_GEN7,
-			     _MASKED_BIT_ENABLE(GFX_PPGTT_ENABLE));
-	}
 }
 
 void gen6_ppgtt_enable(struct intel_gt *gt)
diff --git a/drivers/gpu/drm/i915/gt/intel_ring_submission.c b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
index 20f42722be8b..01553f029ac1 100644
--- a/drivers/gpu/drm/i915/gt/intel_ring_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
@@ -189,9 +189,16 @@ static void set_pp_dir(struct intel_engine_cs *engine)
 {
 	struct i915_address_space *vm = vm_alias(engine->gt->vm);
 
-	if (vm) {
-		ENGINE_WRITE(engine, RING_PP_DIR_DCLV, PP_DIR_DCLV_2G);
-		ENGINE_WRITE(engine, RING_PP_DIR_BASE, pp_dir(vm));
+	if (!vm)
+		return;
+
+	ENGINE_WRITE(engine, RING_PP_DIR_DCLV, PP_DIR_DCLV_2G);
+	ENGINE_WRITE(engine, RING_PP_DIR_BASE, pp_dir(vm));
+
+	if (INTEL_GEN(engine->i915) >= 7) {
+		ENGINE_WRITE(engine,
+			     RING_MODE_GEN7,
+			     _MASKED_BIT_ENABLE(GFX_PPGTT_ENABLE));
 	}
 }
 
-- 
2.20.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
