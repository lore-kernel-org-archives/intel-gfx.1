Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D33BC79F80
	for <intel-gfx@archiver.kernel.org>; Fri,  4 Sep 2026 09:20:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94A2110E147;
	Fri,  4 Sep 2026 09:20:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AHJfHp+l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A03110E147
 for <intel-gfx@lists.freedesktop.org>; Fri,  4 Sep 2026 09:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788513618; x=1820049618;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=HxwP5wTPGBL64wO+hYm+Zi9XjNlmahP/ohAKrIp49nc=;
 b=AHJfHp+lxXZchbNuZjhO9Rpxey/0GZ+1xqPMPS0UPIleh6YxeBklnLVd
 SdmY5yMxVwMTRysV9MEb3foA278uz8XUn9dv/ci681J9iHRN5oFYSZwGe
 oXoShi9SE4H1sBnNZHB961jGB9QhT9Cpp4uwQ0K57m0OO5o+LtuZmDQjq
 iDEJoS+fRUPuZ4rk8//ciMCJiXEFEMOqOw208WQxaXkzcNunfmjU2W+/w
 FJA+I2scM+L5eQ/XsTemgb4iAO8pi7vwMrB+OzU0Wu5jL7wuupwPzoGJQ
 4zv3eY1rPERkFxgwLRIL2E0CBgybaG6L8bIHdOewIDjRZzmbt+n5oNtnF w==;
X-CSE-ConnectionGUID: o3zG/2AmTIStfDwW9VS1cg==
X-CSE-MsgGUID: IJ9RVxHeStOLK1K1gUjdFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="99670641"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="99670641"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 02:20:18 -0700
X-CSE-ConnectionGUID: +3nLqD8pSiG5WLkZsnW6Ng==
X-CSE-MsgGUID: MitXcdLpRG6TpM4InFzYHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="266735678"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.29])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 02:20:16 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915: Perform full wedge on display reset
In-Reply-To: <20260903130116.19089-1-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260903130116.19089-1-ville.syrjala@linux.intel.com>
Date: Fri, 04 Sep 2026 12:20:13 +0300
Message-ID: <ad75b3c6b3c41aaeea11c7b452e2bf9ad451fd18@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Thu, 03 Sep 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> We lost the proper display reset deadlock handling in
> commit d59cf7bb73f3 ("drm/i915/display: Use dma_fence interfaces instead =
of i915_sw_fence").
> Currently the only thing that eventually breaks the deadlock is the
> 10 second fence timeout, which is very slow.
>
> I tried to essentially restore the previous mechanism via a custom
> dma_fence in
> https://lore.kernel.org/intel-gfx/20260408233458.22666-6-ville.syrjala@li=
nux.intel.com/
> but Christian didn't want it.
>
> The ideal solution would be to allow the reset time modesets to proceed
> ahead of any already queued atomic commits, but that is quite involved
> since we need to be able to track the already committed (to the
> hardware) atomic states in addition to the userspace queued atomic states.
> Years ago I did implement something like that in
> https://lore.kernel.org/intel-gfx/20170629134948.5614-1-ville.syrjala@lin=
ux.intel.com/
> but Sima didn't want it.
>
> In order to get rid of the dependency on the timeout, and make things
> faster, let's just effectively revert the remainders of
> commit 9db529aac938 ("drm/i915: More surgically unbreak the modeset vs re=
set deadlock").
> The upside is that the reset is fast again, but the downside is that
> we now do a full wedge on all display resets, which will also kill
> innocent batches. But perhaps no one really cares since this is
> currently only needed for old pre-g4x hardware. But if anyone has plans on
> using eg. FLR as a backup GPU reset on new hardware then we probably need
> to come up with something better...
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Acked-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/intel_reset.c | 8 +-------
>  drivers/gpu/drm/i915/i915_dpt.c       | 2 --
>  drivers/gpu/drm/i915/i915_drv.h       | 2 --
>  drivers/gpu/drm/i915/i915_fb_pin.c    | 6 ------
>  drivers/gpu/drm/i915/i915_overlay.c   | 5 -----
>  5 files changed, 1 insertion(+), 22 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915=
/gt/intel_reset.c
> index 6053f3e8aa27..bd1f26336ac4 100644
> --- a/drivers/gpu/drm/i915/gt/intel_reset.c
> +++ b/drivers/gpu/drm/i915/gt/intel_reset.c
> @@ -1433,13 +1433,7 @@ static void intel_gt_reset_global(struct intel_gt =
*gt,
>  			need_display_reset;
>=20=20
>  		if (reset_display) {
> -			if (atomic_read(&i915->pending_fb_pin)) {
> -				drm_dbg_kms(&i915->drm,
> -					    "Modeset potentially stuck, unbreaking through wedging\n");
> -
> -				intel_gt_set_wedged(gt);
> -			}
> -
> +			intel_gt_set_wedged(gt);
>  			intel_display_reset_prepare(display);
>  		}
>=20=20
> diff --git a/drivers/gpu/drm/i915/i915_dpt.c b/drivers/gpu/drm/i915/i915_=
dpt.c
> index e01dc4de1788..85d872c0f387 100644
> --- a/drivers/gpu/drm/i915/i915_dpt.c
> +++ b/drivers/gpu/drm/i915/i915_dpt.c
> @@ -139,7 +139,6 @@ struct i915_vma *i915_dpt_pin_to_ggtt(struct intel_dp=
t *dpt, unsigned int alignm
>  		pin_flags |=3D PIN_MAPPABLE;
>=20=20
>  	wakeref =3D intel_runtime_pm_get(&i915->runtime_pm);
> -	atomic_inc(&i915->pending_fb_pin);
>=20=20
>  	for_i915_gem_ww(&ww, err, true) {
>  		err =3D i915_gem_object_lock(dpt->obj, &ww);
> @@ -169,7 +168,6 @@ struct i915_vma *i915_dpt_pin_to_ggtt(struct intel_dp=
t *dpt, unsigned int alignm
>=20=20
>  	dpt->obj->mm.dirty =3D true;
>=20=20
> -	atomic_dec(&i915->pending_fb_pin);
>  	intel_runtime_pm_put(&i915->runtime_pm, wakeref);
>=20=20
>  	return err ? ERR_PTR(err) : vma;
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_=
drv.h
> index 844ed79e7211..dafee3dcd1c5 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -315,8 +315,6 @@ struct drm_i915_private {
>  	/* The TTM device structure. */
>  	struct ttm_device bdev;
>=20=20
> -	atomic_t pending_fb_pin;
> -
>  	I915_SELFTEST_DECLARE(struct i915_selftest_stash selftest;)
>=20=20
>  	/*
> diff --git a/drivers/gpu/drm/i915/i915_fb_pin.c b/drivers/gpu/drm/i915/i9=
15_fb_pin.c
> index 1034cb767e9f..63be136f1a05 100644
> --- a/drivers/gpu/drm/i915/i915_fb_pin.c
> +++ b/drivers/gpu/drm/i915/i915_fb_pin.c
> @@ -35,8 +35,6 @@ intel_fb_pin_to_dpt(struct drm_gem_object *_obj, struct=
 intel_dpt *dpt,
>  	if (WARN_ON(!i915_gem_object_is_framebuffer(obj)))
>  		return ERR_PTR(-EINVAL);
>=20=20
> -	atomic_inc(&i915->pending_fb_pin);
> -
>  	for_i915_gem_ww(&ww, ret, true) {
>  		ret =3D i915_gem_object_lock(obj, &ww);
>  		if (ret)
> @@ -98,7 +96,6 @@ intel_fb_pin_to_dpt(struct drm_gem_object *_obj, struct=
 intel_dpt *dpt,
>  	 */
>  	drm_WARN_ON(&i915->drm, i915_dpt_offset(vma));
>  err:
> -	atomic_dec(&i915->pending_fb_pin);
>=20=20
>  	return vma;
>  }
> @@ -132,8 +129,6 @@ intel_fb_pin_to_ggtt(struct drm_gem_object *_obj,
>  	 */
>  	wakeref =3D intel_runtime_pm_get(&i915->runtime_pm);
>=20=20
> -	atomic_inc(&i915->pending_fb_pin);
> -
>  	pinctl =3D 0;
>  	/* PIN_MAPPABLE limits the address to GMADR size */
>  	if (pin_params->needs_low_address)
> @@ -206,7 +201,6 @@ intel_fb_pin_to_ggtt(struct drm_gem_object *_obj,
>  	if (ret)
>  		vma =3D ERR_PTR(ret);
>=20=20
> -	atomic_dec(&i915->pending_fb_pin);
>  	intel_runtime_pm_put(&i915->runtime_pm, wakeref);
>  	return vma;
>  }
> diff --git a/drivers/gpu/drm/i915/i915_overlay.c b/drivers/gpu/drm/i915/i=
915_overlay.c
> index 6de550a17756..c1a7920c6324 100644
> --- a/drivers/gpu/drm/i915/i915_overlay.c
> +++ b/drivers/gpu/drm/i915/i915_overlay.c
> @@ -354,14 +354,11 @@ static struct i915_vma *i915_overlay_pin_fb(struct =
drm_device *drm,
>  					    struct drm_gem_object *obj,
>  					    u32 *offset)
>  {
> -	struct drm_i915_private *i915 =3D to_i915(drm);
>  	struct drm_i915_gem_object *new_bo =3D to_intel_bo(obj);
>  	struct i915_gem_ww_ctx ww;
>  	struct i915_vma *vma;
>  	int ret;
>=20=20
> -	atomic_inc(&i915->pending_fb_pin);
> -
>  	i915_gem_ww_ctx_init(&ww, true);
>  retry:
>  	ret =3D i915_gem_object_lock(new_bo, &ww);
> @@ -377,8 +374,6 @@ static struct i915_vma *i915_overlay_pin_fb(struct dr=
m_device *drm,
>  	}
>  	i915_gem_ww_ctx_fini(&ww);
>=20=20
> -	atomic_dec(&i915->pending_fb_pin);
> -
>  	if (ret)
>  		return ERR_PTR(ret);

--=20
Jani Nikula, Intel
