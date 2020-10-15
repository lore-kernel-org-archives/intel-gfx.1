Return-Path: <SRS0=RgPZ=DW=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECED4C04EBE
	for <intel-gfx@archiver.kernel.org>; Thu, 15 Oct 2020 11:26:44 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7170E20878
	for <intel-gfx@archiver.kernel.org>; Thu, 15 Oct 2020 11:26:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7170E20878
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1CAF6EC8A;
	Thu, 15 Oct 2020 11:26:37 +0000 (UTC)
Received: from mblankhorst.nl (mblankhorst.nl [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7CFE6EC67
 for <intel-gfx@lists.freedesktop.org>; Thu, 15 Oct 2020 11:26:35 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Thu, 15 Oct 2020 13:25:49 +0200
Message-Id: <20201015112627.1142745-26-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201015112627.1142745-1-maarten.lankhorst@linux.intel.com>
References: <20201015112627.1142745-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v3 25/63] drm/i915: Make
 intel_init_workaround_bb more compatible with ww locking.
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

Make creation separate from pinning, in order to take the lock only
once, and pin the mapping with the lock held.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/intel_lrc.c | 43 ++++++++++++++++++++++-------
 1 file changed, 33 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
index 39cb45ccb506..b6892b405829 100644
--- a/drivers/gpu/drm/i915/gt/intel_lrc.c
+++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
@@ -3972,7 +3972,7 @@ gen10_init_indirectctx_bb(struct intel_engine_cs *engine, u32 *batch)
 
 #define CTX_WA_BB_OBJ_SIZE (PAGE_SIZE)
 
-static int lrc_setup_wa_ctx(struct intel_engine_cs *engine)
+static int lrc_init_wa_ctx(struct intel_engine_cs *engine)
 {
 	struct drm_i915_gem_object *obj;
 	struct i915_vma *vma;
@@ -3988,10 +3988,6 @@ static int lrc_setup_wa_ctx(struct intel_engine_cs *engine)
 		goto err;
 	}
 
-	err = i915_ggtt_pin(vma, NULL, 0, PIN_HIGH);
-	if (err)
-		goto err;
-
 	engine->wa_ctx.vma = vma;
 	return 0;
 
@@ -4000,9 +3996,16 @@ static int lrc_setup_wa_ctx(struct intel_engine_cs *engine)
 	return err;
 }
 
-static void lrc_destroy_wa_ctx(struct intel_engine_cs *engine)
+static void lrc_destroy_wa_ctx(struct intel_engine_cs *engine, bool unpin)
 {
-	i915_vma_unpin_and_release(&engine->wa_ctx.vma, 0);
+	if (!engine->wa_ctx.vma)
+		return;
+
+	if (unpin)
+		i915_vma_unpin(engine->wa_ctx.vma);
+
+	i915_vma_put(engine->wa_ctx.vma);
+	engine->wa_ctx.vma = NULL;
 }
 
 typedef u32 *(*wa_bb_func_t)(struct intel_engine_cs *engine, u32 *batch);
@@ -4014,6 +4017,7 @@ static int intel_init_workaround_bb(struct intel_engine_cs *engine)
 					    &wa_ctx->per_ctx };
 	wa_bb_func_t wa_bb_fn[2];
 	void *batch, *batch_ptr;
+	struct i915_gem_ww_ctx ww;
 	unsigned int i;
 	int ret;
 
@@ -4041,13 +4045,21 @@ static int intel_init_workaround_bb(struct intel_engine_cs *engine)
 		return 0;
 	}
 
-	ret = lrc_setup_wa_ctx(engine);
+	ret = lrc_init_wa_ctx(engine);
 	if (ret) {
 		drm_dbg(&engine->i915->drm,
 			"Failed to setup context WA page: %d\n", ret);
 		return ret;
 	}
 
+	i915_gem_ww_ctx_init(&ww, true);
+retry:
+	ret = i915_gem_object_lock(wa_ctx->vma->obj, &ww);
+	if (!ret)
+		ret = i915_ggtt_pin(wa_ctx->vma, &ww, 0, PIN_HIGH);
+	if (ret)
+		goto err;
+
 	batch = i915_gem_object_pin_map(wa_ctx->vma->obj, I915_MAP_WB);
 
 	/*
@@ -4071,8 +4083,19 @@ static int intel_init_workaround_bb(struct intel_engine_cs *engine)
 
 	__i915_gem_object_flush_map(wa_ctx->vma->obj, 0, batch_ptr - batch);
 	__i915_gem_object_release_map(wa_ctx->vma->obj);
+
+	if (ret)
+		i915_vma_unpin(wa_ctx->vma);
+
+err:
+	if (ret == -EDEADLK) {
+		ret = i915_gem_ww_ctx_backoff(&ww);
+		if (!ret)
+			goto retry;
+	}
+	i915_gem_ww_ctx_fini(&ww);
 	if (ret)
-		lrc_destroy_wa_ctx(engine);
+		lrc_destroy_wa_ctx(engine, false);
 
 	return ret;
 }
@@ -5147,7 +5170,7 @@ static void execlists_release(struct intel_engine_cs *engine)
 	execlists_shutdown(engine);
 
 	intel_engine_cleanup_common(engine);
-	lrc_destroy_wa_ctx(engine);
+	lrc_destroy_wa_ctx(engine, true);
 }
 
 static void
-- 
2.28.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
