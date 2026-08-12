Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E6D4C5CFC1
	for <intel-gfx@archiver.kernel.org>; Wed, 12 Aug 2026 03:07:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60AFC10E2E5;
	Wed, 12 Aug 2026 03:07:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OZzD8QVa";
	dkim-atps=neutral
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F16910E2E5
 for <intel-gfx@lists.freedesktop.org>; Wed, 12 Aug 2026 03:07:10 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-2cab973140bso10572745ad.3
 for <intel-gfx@lists.freedesktop.org>; Tue, 11 Aug 2026 20:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786504030; x=1787108830; darn=lists.freedesktop.org;
 h=mime-version:user-agent:content-transfer-encoding:content-type
 :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=tW05vuUN0QDLV81erlXyT4SqrvSYh+Z7l0E4pHZdxj0=;
 b=OZzD8QVae1EDrn/o9JfOrs+BNOsiuiS78VWc4VQDegLk8XHGQtK4aGNENcDqOh/OCk
 jzM+7XlrKev702YCaHaZfFs2/ERBLi3w8QeS8ARuEYYS4vJyGxmEqiIRhLY6f1Ue9Ga4
 abWyO9FCoNDYgOJ8tw2XaeV+E6j1uwOeJQ9Xs7wqXx3C2+SO0ZjsVcg4vR2UVjK08U9a
 OUQRtEBIQlB4in561LxzET+1MNqsLVU+OLgus8Y6l9Om1y+DGxOdKxIVfF95dEmHhJP7
 zIEkGti1rNxygRbzec6cV6PO0WBnieCdjbm4pv4fxUZetxruMZmFwGhnDgFCP9UN4Tw8
 0M7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786504030; x=1787108830;
 h=mime-version:user-agent:content-transfer-encoding:content-type
 :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=tW05vuUN0QDLV81erlXyT4SqrvSYh+Z7l0E4pHZdxj0=;
 b=Y7Ag/FNX9tSgT5IYLsumd6cCb0YcOCkfaF9ZMMVKImF0YS24PGzhokubhs/XNHOFGn
 o+OpBq7aTspAcoHKudk34whxe8SQE2YjWEMXNRheIitHdGrDjCR3bCN1xobGqgVWpFNS
 f9JX+pySZxCWwizJfV2tiV8GxTZeoReieWqrkwSEo31U5ZimuPAgExILAbnXy38GfDny
 KVP+Sk36SZjSvVh6u2orlk3eDhC5BwEbY9hnGcDcx+S9DwvSyN/LdJzj/lEum+cmsmXp
 YXb3oT0zQXIZ9GVGPfi81vpqhlw4T3RGSb1w+hLF7bkysGQesoAoajgysxeCXYySTblf
 40xA==
X-Gm-Message-State: AOJu0YzGvEKzEYWmIKLJTOMmoQ3Ws2N/4eFpz5ey1J+WhX9Vz4gLUwyG
 kc05Ot/r2hc12BjlXI3X1uQaVOaB2W107eNtM5QCmGcPFH0eN+6NpmC69lp3LtFSXNTcMA==
X-Gm-Gg: AR+sD10mdmREZtaXWnZNg+2SJyImjI6DE4gWrbyIavQW4f3s4LcdkWUiRQl+DiBNvhG
 XsBi09fnNWXKD8SnHekVZ9VNFP5FgkfR/8gJezrF7Dm3Fk4TvunjPqOrIyLlgf/rr9U8wEKpU3F
 Tnv0uXKzKHfj547G0JoPF9LBUoR/wPCXfkKyB6/9DNiktpxwgS19lfUT+nchCAnBX1a73EkW81R
 DA37o/Oki/11Gj/nIimgr4dhaA85oIIi77IoVlA9I0EuaBSwIpEJZsqT6cDAVLx6mDGS9koAGhg
 MnDx2CcY8BperbDIlGALf11+Qf79hOA8oNc+iyQlN4o9IJooPqNqMwoL+pGCx6cTYt+ZCT5E4xm
 41ZMngEfYQvF6JP6CItW9U9r5a0mmPEf31BT0iG3tWuj4FZtiI9hBdo0spdSJkF7oH0H9ZzmdyQ
 fgpu/oFUbSXpK8r9YAhy74QNQiCI5guD+YylqPfu9NzVENQVNsuir8sQAfNAps7ix+Oam39w==
X-Received: by 2002:a17:903:b45:b0:2ca:20b1:3e0a with SMTP id
 d9443c01a7336-2d345356ffcmr25195715ad.3.1786504029789; 
 Tue, 11 Aug 2026 20:07:09 -0700 (PDT)
Received: from [10.239.152.184] ([134.134.137.72])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2d352217334sm596245ad.71.2026.08.11.20.07.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Aug 2026 20:07:09 -0700 (PDT)
Message-ID: <ee7f26285f8ca8a8993f8cb62b4d893e4106b10c.camel@gmail.com>
Subject: Re: [PATCH] drm/i915: Make suspend idle wait uninterruptible
From: Weifeng Liu <weifeng.liu.z@gmail.com>
To: intel-gfx@lists.freedesktop.org
Cc: matthew.brost@intel.com, jani.nikula@linux.intel.com, 
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 tursulin@ursulin.net, 	dri-devel@lists.freedesktop.org,
 weifeng.liu@intel.com
Date: Wed, 12 Aug 2026 11:07:04 +0800
In-Reply-To: <20260805064539.1034880-1-weifeng.liu.z@gmail.com>
References: <20260805064539.1034880-1-weifeng.liu.z@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
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

Gentle ping. I would like to provide some additional context about the
issue this patch is trying to fix.

A customer observed a shutdown hang in an automated S3 resume and
power-off test. This issue occurs after resuming from S3 and later
starting the power-off sequence. During process teardown, i915 reports
GuC CT errors such as:

  i915 0000:00:02.0: [drm] *ERROR* GT0: GUC: CT: Unsolicited response
message: len 1, data 0xe0000100 (fence 2941, last 2945)
  i915 0000:00:02.0: [drm] *ERROR* GT0: GUC: CT: Failed to handle HXG
message (-ENOKEY) 00 01 00 e0
  i915 0000:00:02.0: [drm] *ERROR* GT0: GUC: CT: Failed to process CT
message (-ENOKEY) 01 00 7d 0b 00 01 00 e0

No rendering or display failure was observed before shutdown. The GuC
error appears to be related to inconsistent context state after S3, but
this patch does not attempt to fix that underlying issue; I focused on
fixing the shutdown hang issue currently.

With initcall_debug enabled, the last device shutdown message is:

  i915 0000:00:02.0: shutdown

and device_shutdown() does not make further progress.

While investigating this hang, I found that wait_for_suspend() assumes
that intel_gt_wait_for_idle() either succeeds or returns -ETIME.
However, the request retirement and GuC pending-message waits are
interruptible and may return -EINTR or -ERESTARTSYS when the shutdown
task has a pending signal. These errors bypass the existing wedge and
cleanup path, after which wait_for_suspend() may block waiting for a GT
wakeref that cannot be released.

As a diagnostic experiment, adding a timeout to
intel_wakeref_wait_for_idle() allowed the power-off sequence to
complete consistently. I did not propose that approach upstream because
continuing suspend with an active GT would weaken the existing suspend
invariant.

Instead, this patch makes only GT idle wait used by wait_for_suspend()
uninterruptible. It retains the existing timeout and wedges the GT only
if that timeout expires. All other intel_gt_wait_for_idle() callers
remain interruptible.

Does this approach look reasonable, or would you prefer a different way
to prevent signals from bypassing the existing timeout recovery path?

And I'll be very grateful if you can provide some hints about the root
cause of the GuC error.

Best regards,
Weifeng

On Wed, 2026-08-05 at 14:45 +0800, Weifeng Liu wrote:
> wait_for_suspend() only handles -ETIME from the GT idle wait.
> However,
> the wait can also be interrupted by a pending signal while retiring
> requests or waiting for GuC messages, e.g., during the reboot process
> invoked by init. This skips the wedge and cleanup path and may leave
> suspend waiting indefinitely for a leaked wakeref.
>=20
> Make only the suspend idle wait uninterruptible while preserving its
> existing timeout. Other callers remain interruptible, and the GT is
> still wedged only when the timeout expires.
>=20
> Cc: Matthew Brost <matthew.brost@intel.com>
> Assisted-by: OpenCode:GPT-5.6-Sol
> Signed-off-by: Weifeng Liu <weifeng.liu.z@gmail.com>
> ---
> =C2=A0drivers/gpu/drm/i915/gt/intel_gt.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 24 +++++++++++++++--
> --
> =C2=A0drivers/gpu/drm/i915/gt/intel_gt.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> =C2=A0drivers/gpu/drm/i915/gt/intel_gt_pm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 3 ++-
> =C2=A0drivers/gpu/drm/i915/gt/intel_gt_requests.c=C2=A0=C2=A0 |=C2=A0 8 +=
+++---
> =C2=A0drivers/gpu/drm/i915/gt/intel_gt_requests.h=C2=A0=C2=A0 | 13 ++++++=
++--
> =C2=A0drivers/gpu/drm/i915/gt/uc/intel_guc.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 3 ++-
> =C2=A0.../gpu/drm/i915/gt/uc/intel_guc_submission.c |=C2=A0 5 ++--
> =C2=A0drivers/gpu/drm/i915/gt/uc/intel_uc.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 6 +++--
> =C2=A08 files changed, 47 insertions(+), 16 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c
> b/drivers/gpu/drm/i915/gt/intel_gt.c
> index 5c7f862f7100..5eaa52f535d4 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> @@ -659,7 +659,9 @@ static void __intel_gt_disable(struct intel_gt
> *gt)
> =C2=A0	GEM_BUG_ON(intel_gt_pm_is_awake(gt));
> =C2=A0}
> =C2=A0
> -int intel_gt_wait_for_idle(struct intel_gt *gt, long timeout)
> +static int __intel_gt_wait_for_idle(struct intel_gt *gt,
> +				=C2=A0=C2=A0=C2=A0 bool interruptible,
> +				=C2=A0=C2=A0=C2=A0 long timeout)
> =C2=A0{
> =C2=A0	long remaining_timeout;
> =C2=A0
> @@ -667,10 +669,11 @@ int intel_gt_wait_for_idle(struct intel_gt *gt,
> long timeout)
> =C2=A0	if (!intel_gt_pm_is_awake(gt))
> =C2=A0		return 0;
> =C2=A0
> -	while ((timeout =3D intel_gt_retire_requests_timeout(gt,
> timeout,
> -							=C2=A0=C2=A0
> &remaining_timeout)) > 0) {
> +	while ((timeout =3D __intel_gt_retire_requests_timeout(gt,
> interruptible,
> +							=C2=A0=C2=A0=C2=A0=C2=A0
> timeout,
> +							=C2=A0=C2=A0=C2=A0=C2=A0
> &remaining_timeout)) > 0) {
> =C2=A0		cond_resched();
> -		if (signal_pending(current))
> +		if (interruptible && signal_pending(current))
> =C2=A0			return -EINTR;
> =C2=A0	}
> =C2=A0
> @@ -680,7 +683,18 @@ int intel_gt_wait_for_idle(struct intel_gt *gt,
> long timeout)
> =C2=A0	if (remaining_timeout < 0)
> =C2=A0		remaining_timeout =3D 0;
> =C2=A0
> -	return intel_uc_wait_for_idle(&gt->uc, remaining_timeout);
> +	return intel_uc_wait_for_idle(&gt->uc, interruptible,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 remaining_timeout);
> +}
> +
> +int intel_gt_wait_for_idle(struct intel_gt *gt, long timeout)
> +{
> +	return __intel_gt_wait_for_idle(gt, true, timeout);
> +}
> +
> +int intel_gt_wait_for_idle_uninterruptible(struct intel_gt *gt, long
> timeout)
> +{
> +	return __intel_gt_wait_for_idle(gt, false, timeout);
> =C2=A0}
> =C2=A0
> =C2=A0int intel_gt_init(struct intel_gt *gt)
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.h
> b/drivers/gpu/drm/i915/gt/intel_gt.h
> index 998ca029b73a..6c7e5415f1dc 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.h
> @@ -143,6 +143,7 @@ void intel_gt_driver_release(struct intel_gt
> *gt);
> =C2=A0void intel_gt_driver_late_release_all(struct drm_i915_private
> *i915);
> =C2=A0
> =C2=A0int intel_gt_wait_for_idle(struct intel_gt *gt, long timeout);
> +int intel_gt_wait_for_idle_uninterruptible(struct intel_gt *gt, long
> timeout);
> =C2=A0
> =C2=A0void intel_gt_check_and_clear_faults(struct intel_gt *gt);
> =C2=A0i915_reg_t intel_gt_perf_limit_reasons_reg(struct intel_gt *gt);
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> index c7f59d60fac6..9fe31aa07ae8 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> @@ -315,7 +315,8 @@ static void wait_for_suspend(struct intel_gt *gt)
> =C2=A0	if (!intel_gt_pm_is_awake(gt))
> =C2=A0		return;
> =C2=A0
> -	if (intel_gt_wait_for_idle(gt, I915_GT_SUSPEND_IDLE_TIMEOUT)
> =3D=3D -ETIME) {
> +	if (intel_gt_wait_for_idle_uninterruptible(gt,
> +						=C2=A0=C2=A0
> I915_GT_SUSPEND_IDLE_TIMEOUT) =3D=3D -ETIME) {
> =C2=A0		/*
> =C2=A0		 * Forcibly cancel outstanding work and leave
> =C2=A0		 * the gpu quiet.
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_requests.c
> b/drivers/gpu/drm/i915/gt/intel_gt_requests.c
> index 93298820bee2..b37e8f1d0b5c 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_requests.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_requests.c
> @@ -130,8 +130,10 @@ void intel_engine_fini_retire(struct
> intel_engine_cs *engine)
> =C2=A0	GEM_BUG_ON(engine->retire);
> =C2=A0}
> =C2=A0
> -long intel_gt_retire_requests_timeout(struct intel_gt *gt, long
> timeout,
> -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 long *remaining_timeout)
> +long __intel_gt_retire_requests_timeout(struct intel_gt *gt,
> +					bool interruptible,
> +					long timeout,
> +					long *remaining_timeout)
> =C2=A0{
> =C2=A0	struct intel_gt_timelines *timelines =3D &gt->timelines;
> =C2=A0	struct intel_timeline *tl, *tn;
> @@ -159,7 +161,7 @@ long intel_gt_retire_requests_timeout(struct
> intel_gt *gt, long timeout,
> =C2=A0				mutex_unlock(&tl->mutex);
> =C2=A0
> =C2=A0				timeout =3D
> dma_fence_wait_timeout(fence,
> -							=09
> true,
> +							=09
> interruptible,
> =C2=A0							=09
> timeout);
> =C2=A0				dma_fence_put(fence);
> =C2=A0
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_requests.h
> b/drivers/gpu/drm/i915/gt/intel_gt_requests.h
> index d2969f68dd64..9242f85f4040 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_requests.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_requests.h
> @@ -12,8 +12,17 @@ struct intel_engine_cs;
> =C2=A0struct intel_gt;
> =C2=A0struct intel_timeline;
> =C2=A0
> -long intel_gt_retire_requests_timeout(struct intel_gt *gt, long
> timeout,
> -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 long *remaining_timeout);
> +long __intel_gt_retire_requests_timeout(struct intel_gt *gt,
> +					bool interruptible,
> +					long timeout,
> +					long *remaining_timeout);
> +static inline long
> +intel_gt_retire_requests_timeout(struct intel_gt *gt, long timeout,
> +				 long *remaining_timeout)
> +{
> +	return __intel_gt_retire_requests_timeout(gt, true, timeout,
> +						=C2=A0=C2=A0=C2=A0
> remaining_timeout);
> +}
> =C2=A0static inline void intel_gt_retire_requests(struct intel_gt *gt)
> =C2=A0{
> =C2=A0	intel_gt_retire_requests_timeout(gt, 0, NULL);
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> index 053780f562c1..b5f4fddf5c1d 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> @@ -509,7 +509,8 @@ static inline void intel_guc_disable_msg(struct
> intel_guc *guc, u32 mask)
> =C2=A0	spin_unlock_irq(&guc->irq_lock);
> =C2=A0}
> =C2=A0
> -int intel_guc_wait_for_idle(struct intel_guc *guc, long timeout);
> +int intel_guc_wait_for_idle(struct intel_guc *guc, bool
> interruptible,
> +			=C2=A0=C2=A0=C2=A0 long timeout);
> =C2=A0
> =C2=A0int intel_guc_deregister_done_process_msg(struct intel_guc *guc,
> =C2=A0					=C2=A0 const u32 *msg, u32 len);
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 788e59cdfac9..aa74208c2b4e 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -680,14 +680,15 @@ int intel_guc_wait_for_pending_msg(struct
> intel_guc *guc,
> =C2=A0	return (timeout < 0) ? timeout : 0;
> =C2=A0}
> =C2=A0
> -int intel_guc_wait_for_idle(struct intel_guc *guc, long timeout)
> +int intel_guc_wait_for_idle(struct intel_guc *guc, bool
> interruptible,
> +			=C2=A0=C2=A0=C2=A0 long timeout)
> =C2=A0{
> =C2=A0	if (!intel_uc_uses_guc_submission(&guc_to_gt(guc)->uc))
> =C2=A0		return 0;
> =C2=A0
> =C2=A0	return intel_guc_wait_for_pending_msg(guc,
> =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &guc-
> >outstanding_submission_g2h,
> -					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 true, timeout);
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 interruptible,
> timeout);
> =C2=A0}
> =C2=A0
> =C2=A0static int guc_context_policy_init_v70(struct intel_context *ce,
> bool loop);
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.h
> b/drivers/gpu/drm/i915/gt/uc/intel_uc.h
> index 014bb7d83689..b62fe3b96b64 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.h
> @@ -96,9 +96,11 @@ uc_state_checkers(gsc, gsc_uc);
> =C2=A0#undef uc_state_checkers
> =C2=A0#undef __uc_state_checker
> =C2=A0
> -static inline int intel_uc_wait_for_idle(struct intel_uc *uc, long
> timeout)
> +static inline int intel_uc_wait_for_idle(struct intel_uc *uc,
> +					 bool interruptible,
> +					 long timeout)
> =C2=A0{
> -	return intel_guc_wait_for_idle(&uc->guc, timeout);
> +	return intel_guc_wait_for_idle(&uc->guc, interruptible,
> timeout);
> =C2=A0}
> =C2=A0
> =C2=A0#define intel_uc_ops_function(_NAME, _OPS, _TYPE, _RET) \
