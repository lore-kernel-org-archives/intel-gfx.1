Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F238606A321
	for <intel-gfx@archiver.kernel.org>; Wed, 11 Nov 2026 14:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=McdigyUi
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B6BF10EA61;
	Wed, 11 Nov 2026 14:40:43 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74E8810EA1C
 for <intel-gfx@lists.freedesktop.org>; Wed, 11 Nov 2026 14:40:36 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 1ECB4403B9;
 Wed, 11 Nov 2026 14:40:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3BDA1F00A05;
 Wed, 11 Nov 2026 14:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794408036;
 bh=HzoaPp4qnnQoFDo8HMKMw4KLEQsKpRSkrubTy7KAB9Q=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=McdigyUiw5Hr2j6BawfOXQ0CtgJamaFh5/tcb0rP0/k5ho/HLmXIDgeskaEiB/wNz
 3sYGMrBST+ybT6XE2ZyJoEYEJuvxVKPFUKBQ7nVgb8bYxNDex5i2gbAq0GSJvewhpn
 XkRD0RyW81zlG4ZzU0zeD07EDoy34pLB8IGVaqLw8Iopqg9j7/bQXdhA0L9+4soMH4
 PDjbOcU1UhzOwkNJ9Pp2tLOofex4UFCvO3KdVAjp0PPKYBhoFmfGNOEkpPO+cEpKaU
 Yahj6t9daTd3/r6GAQujhOAN3KRpB46cQ4ApUoJbWh5T7EkKF8bYFc4DfUlvzx86wG
 9DiNpcMFVSumQ==
Message-ID: <sashiko-outbox-209177@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] drm/i915/guc: Complete all requests of a
 non-schedulable context
To: "Javier MV" <javiermv@gmail.com>, intel-gfx@lists.freedesktop.org
In-Reply-To: <20261111135753.11071-2-javiermv@gmail.com>
References: <20261111135753.11071-1-javiermv@gmail.com>
 <20261111135753.11071-2-javiermv@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 14:40:35 +0000
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] drm/i915/guc: out-of-order request completion in
  __guc_add_request()
--

commit ab2fec244e71c5f1800fda0182eb817d04ef826f
Author: Javier MV <javiermv@duck.com>

drm/i915/guc: Complete all requests of a non-schedulable context

When submitting a request for a non-schedulable context, this commit marks
all requests on ce->guc_state.requests complete with -EIO once the context
is off the hardware.

Link: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15301

> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/=
gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 788e59cdfac9b..b2ffc6b4614e4 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -709,7 +709,25 @@ static int __guc_add_request(struct intel_guc *guc, =
struct i915_request *rq)
>  	 * request resubmitted after the context was banned.
>  	 */
>  	if (unlikely(!intel_context_is_schedulable(ce))) {
> -		i915_request_put(i915_request_mark_eio(rq));
> +		struct i915_request *pos;
> +
> +		/*
> +		 * The dequeue only passes the last of the merged requests, and
> +		 * the context won't run again to write the others' breadcrumbs:
> +		 * complete them all (rq is on the list too), once the context
> +		 * is off the HW. Don't touch rq after the unlock: once complete
> +		 * it can be retired and freed.
> +		 */
> +		spin_lock(&ce->guc_state.lock);
> +		if (!context_enabled(ce) && !context_pending_enable(ce) &&
> +		    !context_pending_disable(ce)) {
> +			list_for_each_entry(pos, &ce->guc_state.requests, sched.link)
> +				i915_request_put(i915_request_mark_eio(pos));
> +		} else {
> +			i915_request_put(i915_request_mark_eio(rq));
> +		}

[Severity: High]
Does the else branch complete rq out of order ahead of earlier requests on
the same timeline?

Before calling __guc_add_request(), guc_dequeue_one_context() and
guc_bypass_tasklet_submit() move every submitted request onto
ce->guc_state.requests via __i915_request_submit() and pass only the final
request as rq.  When the context is still on the hardware or has an enable
or disable in flight, marking only rq complete leaves earlier merged or
in-flight requests on ce->guc_state.requests and tl->requests incomplete.

Because __i915_active_fence_set() moves active tracking callbacks to the
newest request on the timeline, completing rq early retires vma->active and
ce->active while the GPU is still executing earlier requests on the context,
and trips the check in i915_request_retire_upto():

drivers/gpu/drm/i915/i915_request.c:i915_request_retire_upto() {
	do {
		tmp =3D list_first_entry(&tl->requests, typeof(*tmp), link);
		GEM_BUG_ON(!i915_request_completed(tmp));
	} while (i915_request_retire(tmp) && tmp !=3D rq);
}

Also, if context_pending_enable(ce) is set while !context_enabled(ce) &&
!context_pending_disable(ce) (for example after __guc_reset_context() clears
SCHED_STATE_ENABLED while an enable G2H is still in flight),
intel_guc_sched_done_process_msg() only clears SCHED_STATE_PENDING_ENABLE
without calling guc_cancel_context_requests(), so the earlier merged
requests are never completed.

Since rq is already on ce->guc_state.requests, should the else branch leave
rq incomplete so guc_cancel_context_requests() completes the whole list in
order once the context is off the hardware?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111135753.1107=
1-1-javiermv@gmail.com?part=3D1
