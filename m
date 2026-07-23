Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F92DC531CB
	for <intel-gfx@archiver.kernel.org>; Thu, 23 Jul 2026 10:44:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F6AF10E57B;
	Thu, 23 Jul 2026 10:44:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GWKniaEc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9130410E57B
 for <intel-gfx@lists.freedesktop.org>; Thu, 23 Jul 2026 10:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784803474; x=1816339474;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=28Gtg6JTnH2b0T1tdwgQaH8gIFmBqWIUJhMCOFexAFk=;
 b=GWKniaEcys7HrOfHeqqVTGJjig+aDG5Yty577nb8dZud7U6nOExu/NmH
 skg7+UINnZg/+0EZ9zMuQCUxhStOvQZ8fPPDbAZOKjyWaFZlyproCPWn4
 E5lguCt2pK9DoC26SUssz9oe3JvrQugQ/CXt6q6/lGwgqmjhaKeuSbVZ2
 RL9xUsoWqO/bTLa+U8+qs9LC72j3z4JtOKJdU/o1bihw510g2UbHSDRTv
 EZNp3I5LrICrQ7uRPJVhxIoRM84NTYkGhxDWJtONywa2H8xC87P6fForZ
 vLx33cKsNr4C9koXkHhHv0R2VqyNxgVl98ivUuPXfikUyZGKcbey1R20o Q==;
X-CSE-ConnectionGUID: poCKvWqxR1q9KIePk0+uwA==
X-CSE-MsgGUID: QbgLA6yJSkivSeFeU7Hd5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="87996885"
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="87996885"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 03:44:33 -0700
X-CSE-ConnectionGUID: IxWAgUmzTimXIL6GvG8zEA==
X-CSE-MsgGUID: +gFBPlTVQgiSIPKV+iK7ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="296592790"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.244.89])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 03:44:30 -0700
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Subject: [RFC] drm/i915: Scope-based resource management test run
Date: Thu, 23 Jul 2026 12:36:17 +0200
Message-ID: <20260723103616.52732-2-krzysztof.niemiec@intel.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

[1] introduced a set of interesting macros abusing the __cleanup__
compiler attribute, effectively serving as mini-RAII in the kernel.
[2] is a good introduction to the features, the TLDR is that by using
the __cleanup__ attribute (which calls a function when a variable goes
out of scope) Peter Zijlstra made a bunch of macros for declaring what
are basically destructors for automatic variables (and the series
extends the concept even further to include constructors, see the CLASS
macros).

The main advantage of these are robustness against bugs and making the
code more concise. The "init me with X now and clean me up with Y when I
go out of scope" pattern is very common in general, but can be tricky
without RAII mechanisms because the "when I go out of scope" part can be
complex if there's a lot of error handling, or a function can return early,
things like that. I don't think there's much doubt at this point that RAII
is generally a good idea in programming, and these new macros allow it to
happen in kernel C. The goal of this RFC is introduce (or rather,
consider introducing) the new macros for i915.

In some cases using the new macros completely eliminates the use of goto
to implement early exits (see patches in [1] and
set_proto_ctx_engines_parallel_submit() in this patch). In other cases
it might simplify locking a bit - there are specific macros to handle
locking-type scenarios; the lock is automatically released by end of
scope so in complex error paths you don't have to think about missing
the unlock. There's no complex cases in this patch but [3], [4], [5]
might be interesting examples.

However, there are legitimate reasons for not embracing this for i915:

1) C is by nature a very transparent language. Things *generally*
   happen whenever theyre explicitly told to happen (well, up to
   compiler optimization, out of order execution, branch prediction,
   etc etc) The new mechanism is opaque, the deferred calls are implicit.
   This might not sit well with some people.
2) i915 is definitely a mature driver. There are a lot of benefits of
   using the new mechanism for new code, which is very "living"; using
   scope-based management reduces the mental overhead of keeping up
   with refactoring gotos (or writing them correctly in the first
   place). However, our code has been running for a long time on a lot
   of hardware. I suspect, most bugs that would have been prevented by
   using the new macros are not there anymore anyway. Adding them would
   be a purely refactoring change.
3) The new macros are also a bit limited, for example DEFINE_FREE() only
   allows to define single-argument destructors. I already bumped into
   a situation where I could have used it, but the releasing function
   took two arguments: the object to release and a pointer to
   drm_i915_private. I think this is a very common pattern in our
   driver as these pointers are passed around to most functions
   everywhere. So, destructors for these are incompatible with the
   macros. This means that unless the macros get extended, introducing
   them will lead to a lot of mixed-style code, which might not sit well
   with some people.

On the other hand, introducing this might come in handy later if we do
end up writing larger chunks of new code. Also, I think it'd be an
interesting case study of how to use the new macros in a big driver,
their limitations, and possible improvements.

This pseudo-patch (which shouldn't go in, it's really not tested)
changes only one file as a "demo" of what the new mechanism would look
like in practice. We have like 400k lines of code in our driver, so I'd
much prefer to hear the others' opinion before sinking any more
time into this.

Thanks
Krzysztof

[1] https://lore.kernel.org/lkml/20230612090713.652690195@infradead.org/
[2] https://lwn.net/Articles/934679/
[3] https://lore.kernel.org/lkml/20230612093538.307089780@infradead.org/
[4] https://lore.kernel.org/lkml/20230612093539.895253662@infradead.org/
[5] https://lore.kernel.org/lkml/20230612093541.524967360@infradead.org/

Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c | 129 +++++++-------------
 1 file changed, 47 insertions(+), 82 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index c58ffa5a8fa6..5fc823dbf45a 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -66,6 +66,7 @@
 #include <linux/highmem.h>
 #include <linux/log2.h>
 #include <linux/nospec.h>
+#include <linux/cleanup.h>
 
 #include <drm/drm_cache.h>
 #include <drm/drm_print.h>
@@ -106,7 +107,7 @@ static void lut_close(struct i915_gem_context *ctx)
 	struct radix_tree_iter iter;
 	void __rcu **slot;
 
-	mutex_lock(&ctx->lut_mutex);
+	guard(mutex)(&ctx->lut_mutex);
 	rcu_read_lock();
 	radix_tree_for_each_slot(slot, &ctx->handles_vma, &iter, 0) {
 		struct i915_vma *vma = rcu_dereference_raw(*slot);
@@ -139,7 +140,6 @@ static void lut_close(struct i915_gem_context *ctx)
 		i915_gem_object_put(obj);
 	}
 	rcu_read_unlock();
-	mutex_unlock(&ctx->lut_mutex);
 }
 
 static struct intel_context *
@@ -340,13 +340,8 @@ static int proto_context_register(struct drm_i915_file_private *fpriv,
 				  struct i915_gem_proto_context *pc,
 				  u32 *id)
 {
-	int ret;
-
-	mutex_lock(&fpriv->proto_context_lock);
-	ret = proto_context_register_locked(fpriv, pc, id);
-	mutex_unlock(&fpriv->proto_context_lock);
-
-	return ret;
+	guard(mutex)(&fpriv->proto_context_lock);
+	return proto_context_register_locked(fpriv, pc, id);
 }
 
 static struct i915_address_space *
@@ -404,7 +399,6 @@ set_proto_ctx_engines_balance(struct i915_user_extension __user *base,
 		container_of_user(base, typeof(*ext), base);
 	const struct set_proto_ctx_engines *set = data;
 	struct drm_i915_private *i915 = set->i915;
-	struct intel_engine_cs **siblings;
 	u16 num_siblings, idx;
 	unsigned int n;
 	int err;
@@ -442,17 +436,17 @@ set_proto_ctx_engines_balance(struct i915_user_extension __user *base,
 	if (num_siblings == 0)
 		return 0;
 
-	siblings = kmalloc_objs(*siblings, num_siblings);
+	struct intel_engine_cs **siblings __free(kfree) =
+		kmalloc_objs(*siblings, num_siblings);
+
 	if (!siblings)
 		return -ENOMEM;
 
 	for (n = 0; n < num_siblings; n++) {
 		struct i915_engine_class_instance ci;
 
-		if (copy_from_user(&ci, &ext->engines[n], sizeof(ci))) {
-			err = -EFAULT;
-			goto err_siblings;
-		}
+		if (copy_from_user(&ci, &ext->engines[n], sizeof(ci)))
+			return -EFAULT;
 
 		siblings[n] = intel_engine_lookup_user(i915,
 						       ci.engine_class,
@@ -461,27 +455,20 @@ set_proto_ctx_engines_balance(struct i915_user_extension __user *base,
 			drm_dbg(&i915->drm,
 				"Invalid sibling[%d]: { class:%d, inst:%d }\n",
 				n, ci.engine_class, ci.engine_instance);
-			err = -EINVAL;
-			goto err_siblings;
+			return -EINVAL;
 		}
 	}
 
 	if (num_siblings == 1) {
 		set->engines[idx].type = I915_GEM_ENGINE_TYPE_PHYSICAL;
 		set->engines[idx].engine = siblings[0];
-		kfree(siblings);
 	} else {
 		set->engines[idx].type = I915_GEM_ENGINE_TYPE_BALANCED;
 		set->engines[idx].num_siblings = num_siblings;
-		set->engines[idx].siblings = siblings;
+		set->engines[idx].siblings = no_free_ptr(siblings);
 	}
 
 	return 0;
-
-err_siblings:
-	kfree(siblings);
-
-	return err;
 }
 
 static int
@@ -588,7 +575,6 @@ set_proto_ctx_engines_parallel_submit(struct i915_user_extension __user *base,
 	u64 flags;
 	int err = 0, n, i, j;
 	u16 slot, width, num_siblings;
-	struct intel_engine_cs **siblings = NULL;
 	intel_engine_mask_t prev_mask;
 
 	if (get_user(slot, &ext->engine_index))
@@ -645,7 +631,8 @@ set_proto_ctx_engines_parallel_submit(struct i915_user_extension __user *base,
 		return -EINVAL;
 	}
 
-	siblings = kmalloc_objs(*siblings, num_siblings * width);
+	struct intel_engine_cs **siblings __free(kfree) =
+		kmalloc_objs(*siblings, num_siblings * width);
 	if (!siblings)
 		return -ENOMEM;
 
@@ -657,10 +644,8 @@ set_proto_ctx_engines_parallel_submit(struct i915_user_extension __user *base,
 			struct i915_engine_class_instance ci;
 
 			n = i * num_siblings + j;
-			if (copy_from_user(&ci, &ext->engines[n], sizeof(ci))) {
-				err = -EFAULT;
-				goto out_err;
-			}
+			if (copy_from_user(&ci, &ext->engines[n], sizeof(ci)))
+				return -EINVAL;
 
 			siblings[n] =
 				intel_engine_lookup_user(i915, ci.engine_class,
@@ -669,8 +654,7 @@ set_proto_ctx_engines_parallel_submit(struct i915_user_extension __user *base,
 				drm_dbg(&i915->drm,
 					"Invalid sibling[%d]: { class:%d, inst:%d }\n",
 					n, ci.engine_class, ci.engine_instance);
-				err = -EINVAL;
-				goto out_err;
+				return -EINVAL;
 			}
 
 			/*
@@ -678,10 +662,8 @@ set_proto_ctx_engines_parallel_submit(struct i915_user_extension __user *base,
 			 * classes
 			 */
 			if (siblings[n]->class == RENDER_CLASS ||
-			    siblings[n]->class == COMPUTE_CLASS) {
-				err = -EINVAL;
-				goto out_err;
-			}
+			    siblings[n]->class == COMPUTE_CLASS)
+				return -EINVAL;
 
 			if (n) {
 				if (prev_engine.engine_class !=
@@ -690,8 +672,7 @@ set_proto_ctx_engines_parallel_submit(struct i915_user_extension __user *base,
 						"Mismatched class %d, %d\n",
 						prev_engine.engine_class,
 						ci.engine_class);
-					err = -EINVAL;
-					goto out_err;
+					return -EINVAL;
 				}
 			}
 
@@ -704,8 +685,7 @@ set_proto_ctx_engines_parallel_submit(struct i915_user_extension __user *base,
 				drm_dbg(&i915->drm,
 					"Non contiguous logical mask 0x%x, 0x%x\n",
 					prev_mask, current_mask);
-				err = -EINVAL;
-				goto out_err;
+				return -EINVAL;
 			}
 		}
 		prev_mask = current_mask;
@@ -714,14 +694,9 @@ set_proto_ctx_engines_parallel_submit(struct i915_user_extension __user *base,
 	set->engines[slot].type = I915_GEM_ENGINE_TYPE_PARALLEL;
 	set->engines[slot].num_siblings = num_siblings;
 	set->engines[slot].width = width;
-	set->engines[slot].siblings = siblings;
+	set->engines[slot].siblings = no_free_ptr(siblings);
 
 	return 0;
-
-out_err:
-	kfree(siblings);
-
-	return err;
 }
 
 static const i915_user_extension_fn set_proto_ctx_engines_extensions[] = {
@@ -1047,6 +1022,7 @@ static void free_engines(struct i915_gem_engines *e)
 {
 	__free_engines(e, e->num_engines);
 }
+DEFINE_FREE(free_engines, struct i915_gem_engines *, if (_T) free_engines(_T))
 
 static void free_engines_rcu(struct rcu_head *rcu)
 {
@@ -1123,9 +1099,8 @@ static struct i915_gem_engines *default_engines(struct i915_gem_context *ctx,
 {
 	const unsigned int max = I915_NUM_ENGINES;
 	struct intel_engine_cs *engine;
-	struct i915_gem_engines *e, *err;
 
-	e = alloc_engines(max);
+	struct i915_gem_engines *e __free(free_engines) = alloc_engines(max);
 	if (!e)
 		return ERR_PTR(-ENOMEM);
 
@@ -1141,10 +1116,8 @@ static struct i915_gem_engines *default_engines(struct i915_gem_context *ctx,
 		GEM_BUG_ON(e->engines[engine->legacy_idx]);
 
 		ce = intel_context_create(engine);
-		if (IS_ERR(ce)) {
-			err = ERR_CAST(ce);
-			goto free_engines;
-		}
+		if (IS_ERR(ce))
+			return ERR_CAST(ce);
 
 		e->engines[engine->legacy_idx] = ce;
 		e->num_engines = max(e->num_engines, engine->legacy_idx + 1);
@@ -1153,18 +1126,11 @@ static struct i915_gem_engines *default_engines(struct i915_gem_context *ctx,
 			sseu = rcs_sseu;
 
 		ret = intel_context_set_gem(ce, ctx, sseu);
-		if (ret) {
-			err = ERR_PTR(ret);
-			goto free_engines;
-		}
-
+		if (ret)
+			return ERR_PTR(ret);
 	}
 
-	return e;
-
-free_engines:
-	free_engines(e);
-	return err;
+	return_ptr(e);
 }
 
 static int perma_pin_contexts(struct intel_context *ce)
@@ -2353,7 +2319,7 @@ i915_gem_context_lookup(struct drm_i915_file_private *file_priv, u32 id)
 	if (ctx)
 		return ctx;
 
-	mutex_lock(&file_priv->proto_context_lock);
+	guard(mutex)(&file_priv->proto_context_lock);
 	/* Try one more time under the lock */
 	ctx = __context_lookup(file_priv, id);
 	if (!ctx) {
@@ -2363,7 +2329,6 @@ i915_gem_context_lookup(struct drm_i915_file_private *file_priv, u32 id)
 		else
 			ctx = finalize_create_context_locked(file_priv, pc, id);
 	}
-	mutex_unlock(&file_priv->proto_context_lock);
 
 	return ctx;
 }
@@ -2458,10 +2423,10 @@ int i915_gem_context_destroy_ioctl(struct drm_device *dev, void *data,
 	/* We need to hold the proto-context lock here to prevent races
 	 * with finalize_create_context_locked().
 	 */
-	mutex_lock(&file_priv->proto_context_lock);
-	ctx = xa_erase(&file_priv->context_xa, args->ctx_id);
-	pc = xa_erase(&file_priv->proto_context_xa, args->ctx_id);
-	mutex_unlock(&file_priv->proto_context_lock);
+	scoped_guard (mutex, &file_priv->proto_context_lock) {
+		ctx = xa_erase(&file_priv->context_xa, args->ctx_id);
+		pc = xa_erase(&file_priv->proto_context_xa, args->ctx_id);
+	}
 
 	if (!ctx && !pc)
 		return -ENOENT;
@@ -2613,22 +2578,22 @@ int i915_gem_context_setparam_ioctl(struct drm_device *dev, void *data,
 	struct i915_gem_context *ctx;
 	int ret = 0;
 
-	mutex_lock(&file_priv->proto_context_lock);
-	ctx = __context_lookup(file_priv, args->ctx_id);
-	if (!ctx) {
-		pc = xa_load(&file_priv->proto_context_xa, args->ctx_id);
-		if (pc) {
-			/* Contexts should be finalized inside
-			 * GEM_CONTEXT_CREATE starting with graphics
-			 * version 13.
-			 */
-			WARN_ON(GRAPHICS_VER(file_priv->i915) > 12);
-			ret = set_proto_ctx_param(file_priv, pc, args);
-		} else {
-			ret = -ENOENT;
+	scoped_guard (mutex, &file_priv->proto_context_lock) {
+		ctx = __context_lookup(file_priv, args->ctx_id);
+		if (!ctx) {
+			pc = xa_load(&file_priv->proto_context_xa, args->ctx_id);
+			if (pc) {
+				/* Contexts should be finalized inside
+				 * GEM_CONTEXT_CREATE starting with graphics
+				 * version 13.
+				 */
+				WARN_ON(GRAPHICS_VER(file_priv->i915) > 12);
+				ret = set_proto_ctx_param(file_priv, pc, args);
+			} else {
+				ret = -ENOENT;
+			}
 		}
 	}
-	mutex_unlock(&file_priv->proto_context_lock);
 
 	if (ctx) {
 		ret = ctx_setparam(file_priv, ctx, args);
-- 
2.55.0

