Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5528C624A4
	for <intel-gfx@archiver.kernel.org>; Thu,  3 Sep 2026 13:01:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A8EC10E105;
	Thu,  3 Sep 2026 13:01:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lpk3uwyn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 639ED10E105
 for <intel-gfx@lists.freedesktop.org>; Thu,  3 Sep 2026 13:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788440481; x=1819976481;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3D8CxUvILA47aG03H0QQXedqgzYqzvlpXJ0l594JK98=;
 b=Lpk3uwyn5ou95bpPe0LLjW6SPqySAs49+3WqKpK23GyOb1BEk5hjqjZR
 t+KmoGTNqHQwZZgDD8rwAq6S5kYgTpk20PqGgYHMoRUuSo9wlo/R5avHS
 G7hojK9ZGPYK+552+kNTDhRFlmBJWqj2H7QGuuflRrICg9nwTzDehpM/j
 cWd9a37NblmwJRBb8eXg7FJsRVq+vv4VO5wTLbrdd6fZpvelN1v82Ru04
 Fgl0RYbGsmpGX5CUvJyYlUeXoOzBFGzzm+wI5KNB56roKxMH1vPCUYOeJ
 CPzet1ICymdZfdHPkfC5O4UW6PwahD0lZL2rIHNxQxidr1k9QlMqXe3w7 w==;
X-CSE-ConnectionGUID: yJQuCr9hTWK4pTl4traKFQ==
X-CSE-MsgGUID: K54cAPGYT0aFKE7cJMM/+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="92622276"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="92622276"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 06:01:20 -0700
X-CSE-ConnectionGUID: 9tzS8P/VQRi7buBtx09u4w==
X-CSE-MsgGUID: hMlQlJSQRUG1sJB20FpGKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="263531292"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.101])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 06:01:19 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915: Perform full wedge on display reset
Date: Thu,  3 Sep 2026 16:01:16 +0300
Message-ID: <20260903130116.19089-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

We lost the proper display reset deadlock handling in
commit d59cf7bb73f3 ("drm/i915/display: Use dma_fence interfaces instead of i915_sw_fence").
Currently the only thing that eventually breaks the deadlock is the
10 second fence timeout, which is very slow.

I tried to essentially restore the previous mechanism via a custom
dma_fence in
https://lore.kernel.org/intel-gfx/20260408233458.22666-6-ville.syrjala@linux.intel.com/
but Christian didn't want it.

The ideal solution would be to allow the reset time modesets to proceed
ahead of any already queued atomic commits, but that is quite involved
since we need to be able to track the already committed (to the
hardware) atomic states in addition to the userspace queued atomic states.
Years ago I did implement something like that in
https://lore.kernel.org/intel-gfx/20170629134948.5614-1-ville.syrjala@linux.intel.com/
but Sima didn't want it.

In order to get rid of the dependency on the timeout, and make things
faster, let's just effectively revert the remainders of
commit 9db529aac938 ("drm/i915: More surgically unbreak the modeset vs reset deadlock").
The upside is that the reset is fast again, but the downside is that
we now do a full wedge on all display resets, which will also kill
innocent batches. But perhaps no one really cares since this is
currently only needed for old pre-g4x hardware. But if anyone has plans on
using eg. FLR as a backup GPU reset on new hardware then we probably need
to come up with something better...

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/intel_reset.c | 8 +-------
 drivers/gpu/drm/i915/i915_dpt.c       | 2 --
 drivers/gpu/drm/i915/i915_drv.h       | 2 --
 drivers/gpu/drm/i915/i915_fb_pin.c    | 6 ------
 drivers/gpu/drm/i915/i915_overlay.c   | 5 -----
 5 files changed, 1 insertion(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
index 6053f3e8aa27..bd1f26336ac4 100644
--- a/drivers/gpu/drm/i915/gt/intel_reset.c
+++ b/drivers/gpu/drm/i915/gt/intel_reset.c
@@ -1433,13 +1433,7 @@ static void intel_gt_reset_global(struct intel_gt *gt,
 			need_display_reset;
 
 		if (reset_display) {
-			if (atomic_read(&i915->pending_fb_pin)) {
-				drm_dbg_kms(&i915->drm,
-					    "Modeset potentially stuck, unbreaking through wedging\n");
-
-				intel_gt_set_wedged(gt);
-			}
-
+			intel_gt_set_wedged(gt);
 			intel_display_reset_prepare(display);
 		}
 
diff --git a/drivers/gpu/drm/i915/i915_dpt.c b/drivers/gpu/drm/i915/i915_dpt.c
index e01dc4de1788..85d872c0f387 100644
--- a/drivers/gpu/drm/i915/i915_dpt.c
+++ b/drivers/gpu/drm/i915/i915_dpt.c
@@ -139,7 +139,6 @@ struct i915_vma *i915_dpt_pin_to_ggtt(struct intel_dpt *dpt, unsigned int alignm
 		pin_flags |= PIN_MAPPABLE;
 
 	wakeref = intel_runtime_pm_get(&i915->runtime_pm);
-	atomic_inc(&i915->pending_fb_pin);
 
 	for_i915_gem_ww(&ww, err, true) {
 		err = i915_gem_object_lock(dpt->obj, &ww);
@@ -169,7 +168,6 @@ struct i915_vma *i915_dpt_pin_to_ggtt(struct intel_dpt *dpt, unsigned int alignm
 
 	dpt->obj->mm.dirty = true;
 
-	atomic_dec(&i915->pending_fb_pin);
 	intel_runtime_pm_put(&i915->runtime_pm, wakeref);
 
 	return err ? ERR_PTR(err) : vma;
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 844ed79e7211..dafee3dcd1c5 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -315,8 +315,6 @@ struct drm_i915_private {
 	/* The TTM device structure. */
 	struct ttm_device bdev;
 
-	atomic_t pending_fb_pin;
-
 	I915_SELFTEST_DECLARE(struct i915_selftest_stash selftest;)
 
 	/*
diff --git a/drivers/gpu/drm/i915/i915_fb_pin.c b/drivers/gpu/drm/i915/i915_fb_pin.c
index 1034cb767e9f..63be136f1a05 100644
--- a/drivers/gpu/drm/i915/i915_fb_pin.c
+++ b/drivers/gpu/drm/i915/i915_fb_pin.c
@@ -35,8 +35,6 @@ intel_fb_pin_to_dpt(struct drm_gem_object *_obj, struct intel_dpt *dpt,
 	if (WARN_ON(!i915_gem_object_is_framebuffer(obj)))
 		return ERR_PTR(-EINVAL);
 
-	atomic_inc(&i915->pending_fb_pin);
-
 	for_i915_gem_ww(&ww, ret, true) {
 		ret = i915_gem_object_lock(obj, &ww);
 		if (ret)
@@ -98,7 +96,6 @@ intel_fb_pin_to_dpt(struct drm_gem_object *_obj, struct intel_dpt *dpt,
 	 */
 	drm_WARN_ON(&i915->drm, i915_dpt_offset(vma));
 err:
-	atomic_dec(&i915->pending_fb_pin);
 
 	return vma;
 }
@@ -132,8 +129,6 @@ intel_fb_pin_to_ggtt(struct drm_gem_object *_obj,
 	 */
 	wakeref = intel_runtime_pm_get(&i915->runtime_pm);
 
-	atomic_inc(&i915->pending_fb_pin);
-
 	pinctl = 0;
 	/* PIN_MAPPABLE limits the address to GMADR size */
 	if (pin_params->needs_low_address)
@@ -206,7 +201,6 @@ intel_fb_pin_to_ggtt(struct drm_gem_object *_obj,
 	if (ret)
 		vma = ERR_PTR(ret);
 
-	atomic_dec(&i915->pending_fb_pin);
 	intel_runtime_pm_put(&i915->runtime_pm, wakeref);
 	return vma;
 }
diff --git a/drivers/gpu/drm/i915/i915_overlay.c b/drivers/gpu/drm/i915/i915_overlay.c
index 6de550a17756..c1a7920c6324 100644
--- a/drivers/gpu/drm/i915/i915_overlay.c
+++ b/drivers/gpu/drm/i915/i915_overlay.c
@@ -354,14 +354,11 @@ static struct i915_vma *i915_overlay_pin_fb(struct drm_device *drm,
 					    struct drm_gem_object *obj,
 					    u32 *offset)
 {
-	struct drm_i915_private *i915 = to_i915(drm);
 	struct drm_i915_gem_object *new_bo = to_intel_bo(obj);
 	struct i915_gem_ww_ctx ww;
 	struct i915_vma *vma;
 	int ret;
 
-	atomic_inc(&i915->pending_fb_pin);
-
 	i915_gem_ww_ctx_init(&ww, true);
 retry:
 	ret = i915_gem_object_lock(new_bo, &ww);
@@ -377,8 +374,6 @@ static struct i915_vma *i915_overlay_pin_fb(struct drm_device *drm,
 	}
 	i915_gem_ww_ctx_fini(&ww);
 
-	atomic_dec(&i915->pending_fb_pin);
-
 	if (ret)
 		return ERR_PTR(ret);
 
-- 
2.54.0

