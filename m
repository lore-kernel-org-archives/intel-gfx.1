Return-Path: <SRS0=NnJ0=BU=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 656CEC433E3
	for <intel-gfx@archiver.kernel.org>; Mon, 10 Aug 2020 10:33:47 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4883C206E9
	for <intel-gfx@archiver.kernel.org>; Mon, 10 Aug 2020 10:33:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4883C206E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D44FB6E3F3;
	Mon, 10 Aug 2020 10:33:36 +0000 (UTC)
Received: from mblankhorst.nl (mblankhorst.nl [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21F396E3D0
 for <intel-gfx@lists.freedesktop.org>; Mon, 10 Aug 2020 10:33:28 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Mon, 10 Aug 2020 12:30:49 +0200
Message-Id: <20200810103103.303818-11-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200810103103.303818-1-maarten.lankhorst@linux.intel.com>
References: <20200810103103.303818-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 10/24] drm/i915: Use ww locking in
 intel_renderstate.
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

We want to start using ww locking in intel_context_pin, for this
we need to lock multiple objects, and the single i915_gem_object_lock
is not enough.

Convert to using ww-waiting, and make sure we always pin intel_context_state,
even if we don't have a renderstate object.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt.c          | 21 +++---
 drivers/gpu/drm/i915/gt/intel_renderstate.c | 73 +++++++++++++++------
 drivers/gpu/drm/i915/gt/intel_renderstate.h |  9 ++-
 3 files changed, 71 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index e0755f1a904b..8694ddbdac4c 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -406,21 +406,20 @@ static int __engines_record_defaults(struct intel_gt *gt)
 		/* We must be able to switch to something! */
 		GEM_BUG_ON(!engine->kernel_context);
 
-		err = intel_renderstate_init(&so, engine);
-		if (err)
-			goto out;
-
 		ce = intel_context_create(engine);
 		if (IS_ERR(ce)) {
 			err = PTR_ERR(ce);
 			goto out;
 		}
 
-		rq = intel_context_create_request(ce);
+		err = intel_renderstate_init(&so, ce);
+		if (err)
+			goto err;
+
+		rq = i915_request_create(ce);
 		if (IS_ERR(rq)) {
 			err = PTR_ERR(rq);
-			intel_context_put(ce);
-			goto out;
+			goto err_fini;
 		}
 
 		err = intel_engine_emit_ctx_wa(rq);
@@ -434,9 +433,13 @@ static int __engines_record_defaults(struct intel_gt *gt)
 err_rq:
 		requests[id] = i915_request_get(rq);
 		i915_request_add(rq);
-		intel_renderstate_fini(&so);
-		if (err)
+err_fini:
+		intel_renderstate_fini(&so, ce);
+err:
+		if (err) {
+			intel_context_put(ce);
 			goto out;
+		}
 	}
 
 	/* Flush the default context image to memory, and enable powersaving. */
diff --git a/drivers/gpu/drm/i915/gt/intel_renderstate.c b/drivers/gpu/drm/i915/gt/intel_renderstate.c
index 1bfad589c63b..5164de04049d 100644
--- a/drivers/gpu/drm/i915/gt/intel_renderstate.c
+++ b/drivers/gpu/drm/i915/gt/intel_renderstate.c
@@ -27,6 +27,7 @@
 
 #include "i915_drv.h"
 #include "intel_renderstate.h"
+#include "gt/intel_context.h"
 #include "intel_ring.h"
 
 static const struct intel_renderstate_rodata *
@@ -157,33 +158,47 @@ static int render_state_setup(struct intel_renderstate *so,
 #undef OUT_BATCH
 
 int intel_renderstate_init(struct intel_renderstate *so,
-			   struct intel_engine_cs *engine)
+			   struct intel_context *ce)
 {
-	struct drm_i915_gem_object *obj;
+	struct intel_engine_cs *engine = ce->engine;
+	struct drm_i915_gem_object *obj = NULL;
 	int err;
 
 	memset(so, 0, sizeof(*so));
 
 	so->rodata = render_state_get_rodata(engine);
-	if (!so->rodata)
-		return 0;
+	if (so->rodata) {
+		if (so->rodata->batch_items * 4 > PAGE_SIZE)
+			return -EINVAL;
+
+		obj = i915_gem_object_create_internal(engine->i915, PAGE_SIZE);
+		if (IS_ERR(obj))
+			return PTR_ERR(obj);
+
+		so->vma = i915_vma_instance(obj, &engine->gt->ggtt->vm, NULL);
+		if (IS_ERR(so->vma)) {
+			err = PTR_ERR(so->vma);
+			goto err_obj;
+		}
+	}
 
-	if (so->rodata->batch_items * 4 > PAGE_SIZE)
-		return -EINVAL;
+	i915_gem_ww_ctx_init(&so->ww, true);
+retry:
+	err = intel_context_pin(ce);
+	if (err)
+		goto err_fini;
 
-	obj = i915_gem_object_create_internal(engine->i915, PAGE_SIZE);
-	if (IS_ERR(obj))
-		return PTR_ERR(obj);
+	/* return early if there's nothing to setup */
+	if (!err && !so->rodata)
+		return 0;
 
-	so->vma = i915_vma_instance(obj, &engine->gt->ggtt->vm, NULL);
-	if (IS_ERR(so->vma)) {
-		err = PTR_ERR(so->vma);
-		goto err_obj;
-	}
+	err = i915_gem_object_lock(so->vma->obj, &so->ww);
+	if (err)
+		goto err_context;
 
 	err = i915_vma_pin(so->vma, 0, 0, PIN_GLOBAL | PIN_HIGH);
 	if (err)
-		goto err_obj;
+		goto err_context;
 
 	err = render_state_setup(so, engine->i915);
 	if (err)
@@ -193,8 +208,18 @@ int intel_renderstate_init(struct intel_renderstate *so,
 
 err_unpin:
 	i915_vma_unpin(so->vma);
+err_context:
+	intel_context_unpin(ce);
+err_fini:
+	if (err == -EDEADLK) {
+		err = i915_gem_ww_ctx_backoff(&so->ww);
+		if (!err)
+			goto retry;
+	}
+	i915_gem_ww_ctx_fini(&so->ww);
 err_obj:
-	i915_gem_object_put(obj);
+	if (obj)
+		i915_gem_object_put(obj);
 	so->vma = NULL;
 	return err;
 }
@@ -208,11 +233,9 @@ int intel_renderstate_emit(struct intel_renderstate *so,
 	if (!so->vma)
 		return 0;
 
-	i915_vma_lock(so->vma);
 	err = i915_request_await_object(rq, so->vma->obj, false);
 	if (err == 0)
 		err = i915_vma_move_to_active(so->vma, rq, 0);
-	i915_vma_unlock(so->vma);
 	if (err)
 		return err;
 
@@ -233,7 +256,17 @@ int intel_renderstate_emit(struct intel_renderstate *so,
 	return 0;
 }
 
-void intel_renderstate_fini(struct intel_renderstate *so)
+void intel_renderstate_fini(struct intel_renderstate *so,
+			    struct intel_context *ce)
 {
-	i915_vma_unpin_and_release(&so->vma, 0);
+	if (so->vma) {
+		i915_vma_unpin(so->vma);
+		i915_vma_close(so->vma);
+	}
+
+	intel_context_unpin(ce);
+	i915_gem_ww_ctx_fini(&so->ww);
+
+	if (so->vma)
+		i915_gem_object_put(so->vma->obj);
 }
diff --git a/drivers/gpu/drm/i915/gt/intel_renderstate.h b/drivers/gpu/drm/i915/gt/intel_renderstate.h
index 5700be69a05a..713aa1e86c80 100644
--- a/drivers/gpu/drm/i915/gt/intel_renderstate.h
+++ b/drivers/gpu/drm/i915/gt/intel_renderstate.h
@@ -25,9 +25,10 @@
 #define _INTEL_RENDERSTATE_H_
 
 #include <linux/types.h>
+#include "i915_gem.h"
 
 struct i915_request;
-struct intel_engine_cs;
+struct intel_context;
 struct i915_vma;
 
 struct intel_renderstate_rodata {
@@ -49,6 +50,7 @@ extern const struct intel_renderstate_rodata gen8_null_state;
 extern const struct intel_renderstate_rodata gen9_null_state;
 
 struct intel_renderstate {
+	struct i915_gem_ww_ctx ww;
 	const struct intel_renderstate_rodata *rodata;
 	struct i915_vma *vma;
 	u32 batch_offset;
@@ -58,9 +60,10 @@ struct intel_renderstate {
 };
 
 int intel_renderstate_init(struct intel_renderstate *so,
-			   struct intel_engine_cs *engine);
+			   struct intel_context *ce);
 int intel_renderstate_emit(struct intel_renderstate *so,
 			   struct i915_request *rq);
-void intel_renderstate_fini(struct intel_renderstate *so);
+void intel_renderstate_fini(struct intel_renderstate *so,
+			    struct intel_context *ce);
 
 #endif /* _INTEL_RENDERSTATE_H_ */
-- 
2.28.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
