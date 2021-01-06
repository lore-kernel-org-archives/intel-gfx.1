Return-Path: <SRS0=HSM9=GJ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9FA1C433E6
	for <intel-gfx@archiver.kernel.org>; Wed,  6 Jan 2021 13:40:22 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76B9F2226A
	for <intel-gfx@archiver.kernel.org>; Wed,  6 Jan 2021 13:40:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 76B9F2226A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 341E589C37;
	Wed,  6 Jan 2021 13:40:17 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CEDB89BF8
 for <intel-gfx@lists.freedesktop.org>; Wed,  6 Jan 2021 13:40:16 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from build.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 23518187-1500050 
 for multiple; Wed, 06 Jan 2021 13:40:07 +0000
From: Chris Wilson <chris@chris-wilson.co.uk>
To: intel-gfx@lists.freedesktop.org
Date: Wed,  6 Jan 2021 13:39:58 +0000
Message-Id: <20210106134005.10279-1-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 1/8] drm/i915/gt: Rearrange vlv workarounds
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

Some rcs0 workarounds were being incorrectly applied to the GT, and so
we failed to restore the expected register settings after a reset.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 drivers/gpu/drm/i915/gt/intel_workarounds.c | 95 +++++++++++----------
 1 file changed, 51 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index c21a9726326a..3d5122301f64 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -889,53 +889,9 @@ ivb_gt_workarounds_init(struct drm_i915_private *i915, struct i915_wa_list *wal)
 static void
 vlv_gt_workarounds_init(struct drm_i915_private *i915, struct i915_wa_list *wal)
 {
-	/* WaDisableEarlyCull:vlv */
-	wa_masked_en(wal, _3D_CHICKEN3, _3D_CHICKEN_SF_DISABLE_OBJEND_CULL);
-
-	/* WaPsdDispatchEnable:vlv */
-	/* WaDisablePSDDualDispatchEnable:vlv */
-	wa_masked_en(wal,
-		     GEN7_HALF_SLICE_CHICKEN1,
-		     GEN7_MAX_PS_THREAD_DEP |
-		     GEN7_PSD_SINGLE_PORT_DISPATCH_ENABLE);
-
-	/* WaDisable_RenderCache_OperationalFlush:vlv */
-	wa_masked_dis(wal, CACHE_MODE_0_GEN7, RC_OP_FLUSH_ENABLE);
-
 	/* WaForceL3Serialization:vlv */
 	wa_write_clr(wal, GEN7_L3SQCREG4, L3SQ_URB_READ_CAM_MATCH_DISABLE);
 
-	/*
-	 * WaVSThreadDispatchOverride:ivb,vlv
-	 *
-	 * This actually overrides the dispatch
-	 * mode for all thread types.
-	 */
-	wa_write_clr_set(wal,
-			 GEN7_FF_THREAD_MODE,
-			 GEN7_FF_SCHED_MASK,
-			 GEN7_FF_TS_SCHED_HW |
-			 GEN7_FF_VS_SCHED_HW |
-			 GEN7_FF_DS_SCHED_HW);
-
-	/*
-	 * BSpec says this must be set, even though
-	 * WaDisable4x2SubspanOptimization isn't listed for VLV.
-	 */
-	wa_masked_en(wal, CACHE_MODE_1, PIXEL_SUBSPAN_COLLECT_OPT_DISABLE);
-
-	/*
-	 * BSpec recommends 8x4 when MSAA is used,
-	 * however in practice 16x4 seems fastest.
-	 *
-	 * Note that PS/WM thread counts depend on the WIZ hashing
-	 * disable bit, which we don't touch here, but it's good
-	 * to keep in mind (see 3DSTATE_PS and 3DSTATE_WM).
-	 */
-	wa_add(wal, GEN7_GT_MODE, 0,
-	       _MASKED_FIELD(GEN6_WIZ_HASHING_MASK, GEN6_WIZ_HASHING_16x4),
-	       GEN6_WIZ_HASHING_16x4);
-
 	/*
 	 * WaIncreaseL3CreditsForVLVB0:vlv
 	 * This is the hardware default actually.
@@ -1952,6 +1908,57 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
 		       GEN6_WIZ_HASHING_16x4);
 	}
 
+	if (IS_VALLEYVIEW(i915)) {
+		/* WaDisableEarlyCull:vlv */
+		wa_masked_en(wal,
+			     _3D_CHICKEN3,
+			     _3D_CHICKEN_SF_DISABLE_OBJEND_CULL);
+
+		/*
+		 * WaVSThreadDispatchOverride:ivb,vlv
+		 *
+		 * This actually overrides the dispatch
+		 * mode for all thread types.
+		 */
+		wa_write_clr_set(wal,
+				 GEN7_FF_THREAD_MODE,
+				 GEN7_FF_SCHED_MASK,
+				 GEN7_FF_TS_SCHED_HW |
+				 GEN7_FF_VS_SCHED_HW |
+				 GEN7_FF_DS_SCHED_HW);
+
+		/* WaDisable_RenderCache_OperationalFlush:vlv */
+		wa_masked_dis(wal, CACHE_MODE_0_GEN7, RC_OP_FLUSH_ENABLE);
+
+		/*
+		 * BSpec says this must be set, even though
+		 * WaDisable4x2SubspanOptimization isn't listed for VLV.
+		 */
+		wa_masked_en(wal,
+			     CACHE_MODE_1,
+			     PIXEL_SUBSPAN_COLLECT_OPT_DISABLE);
+
+		/*
+		 * BSpec recommends 8x4 when MSAA is used,
+		 * however in practice 16x4 seems fastest.
+		 *
+		 * Note that PS/WM thread counts depend on the WIZ hashing
+		 * disable bit, which we don't touch here, but it's good
+		 * to keep in mind (see 3DSTATE_PS and 3DSTATE_WM).
+		 */
+		wa_add(wal, GEN7_GT_MODE, 0,
+		       _MASKED_FIELD(GEN6_WIZ_HASHING_MASK,
+				     GEN6_WIZ_HASHING_16x4),
+		       GEN6_WIZ_HASHING_16x4);
+
+		/* WaPsdDispatchEnable:vlv */
+		/* WaDisablePSDDualDispatchEnable:vlv */
+		wa_masked_en(wal,
+			     GEN7_HALF_SLICE_CHICKEN1,
+			     GEN7_MAX_PS_THREAD_DEP |
+			     GEN7_PSD_SINGLE_PORT_DISPATCH_ENABLE);
+	}
+
 	if (IS_GEN(i915, 7))
 		/* WaBCSVCSTlbInvalidationMode:ivb,vlv,hsw */
 		wa_masked_en(wal,
-- 
2.20.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
