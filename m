Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AACBB606A31C
	for <intel-gfx@archiver.kernel.org>; Mon, 16 Nov 2026 12:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LTjM9v9+
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C55710EFE9;
	Mon, 16 Nov 2026 12:40:32 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CFD310F058
 for <intel-gfx@lists.freedesktop.org>; Mon, 16 Nov 2026 12:40:26 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id E732743D83;
 Mon, 16 Nov 2026 12:40:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A40801F000C4;
 Mon, 16 Nov 2026 12:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794832825;
 bh=Whr3/2o2qRox8Z98nKfEgw8Lel6j8GXQ9ZEsnPsRjBA=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=LTjM9v9+B1K12hSixUkShVsxJhCmeLHaB/PiVuLsQA+klsoVJsSki/dAPCEkPWnMg
 IBNB2xRjYklqmU+uM+fX/EV0KRxWy7aP6uE5DL5hgxe8eBOoHgTlQIfaBZi/OAW9x3
 cfZPqGLzQaJKsX2LVm6O/GKjBUXt31/VuCmR1MuLlltLTLJxOcQm7FXgEps/9uL7MN
 zG3emRvf9zyFJTPbyt+vAu+Hnbd8RQtEnH+ToCxIdiGLLk+y6tgk1dVnRgeB0LX0oz
 g8J0cw8s7lJA1NOro7B9vRTZr9XdAq2bOkdoNHiOtkDD1DMAWTUnhp/s6p+at+RN+4
 HPhcsbhzNjeMA==
Message-ID: <sashiko-outbox-217016@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] drm/i915/guc: Complete all requests of a
 non-schedulable context
To: "Javier MV" <javiermv@gmail.com>, intel-gfx@lists.freedesktop.org
In-Reply-To: <20261116115958.9499-2-javiermv@gmail.com>
References: <20261116115958.9499-1-javiermv@gmail.com>
 <20261116115958.9499-2-javiermv@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 12:40:25 +0000
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
- [High] drm/i915/guc: out-of-order completion and missed cancel in
  __guc_add_request()
--

commit 8c211d88b3b41f45abe7f135b95dfbf93ce1feef
Author: Javier MV <javiermv@duck.com>

drm/i915/guc: Complete all requests of a non-schedulable context

This commit completes all queued requests on ce->guc_state.requests in
__guc_add_request() when a non-schedulable context is off the hardware.

Link: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15301

> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/=
gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 788e59cdfac9b..229fa0fd3714b 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -709,7 +709,22 @@ static int __guc_add_request(struct intel_guc *guc, =
struct i915_request *rq)
>  	 * request resubmitted after the context was banned.
>  	 */
>  	if (unlikely(!intel_context_is_schedulable(ce))) {
> -		i915_request_put(i915_request_mark_eio(rq));
> +		struct i915_request *pos;
> +
> +		/*
> +		 * Only the last merged request is passed in. Once the context
> +		 * is off the HW, complete all of them (rq included).
> +		 */
> +		spin_lock(&ce->guc_state.lock);
> +		if (!context_enabled(ce) && !context_pending_enable(ce) &&
> +		    !context_pending_disable(ce)) {
> +			list_for_each_entry(pos, &ce->guc_state.requests, sched.link)
> +				i915_request_put(i915_request_mark_eio(pos));
> +		} else {
> +			i915_request_put(i915_request_mark_eio(rq));
> +		}
> +		spin_unlock(&ce->guc_state.lock);
> +
>  		intel_engine_signal_breadcrumbs(ce->engine);
>  		return 0;
>  	}

[Severity: High]
Does the else branch complete rq out of order while earlier merged or
in-flight requests on the same context are still incomplete?

Both guc_dequeue_one_context() and guc_bypass_tasklet_submit() call
__i915_request_submit() -> add_to_context() on every merged request before
calling guc_add_request(), placing them in sequence order on
ce->guc_state.requests and ce->timeline->requests.  When the context is
still enabled or pending disable, those earlier requests remain incomplete
until the schedule-disable G2H calls guc_cancel_context_requests().
Marking only the tail request rq complete here violates timeline ordering:
i915_request_retire_upto() hits GEM_BUG_ON(!i915_request_completed(tmp)) on
the older requests, and __i915_active_fence_set() retires vma->active and
ce->active callbacks attached to rq while earlier requests are still
running on the GPU.

Checking !context_pending_enable(ce) can also leave the earlier merged
requests uncompleted forever.  If __guc_reset_context() clears
SCHED_STATE_ENABLED while SCHED_STATE_PENDING_ENABLE is still set,
guc_context_revoke() sees !context_enabled(ce) && !context_pending_disable(=
ce)
and does not send a schedule-disable H2G, while intel_guc_sched_done_proces=
s_msg()
only clears SCHED_STATE_PENDING_ENABLE when the pending-enable G2H arrives
without calling guc_cancel_context_requests().

Matching guc_context_revoke() by checking !context_enabled(ce) &&
!context_pending_disable(ce) and dropping the else branch would avoid both
issues, since rq is already on ce->guc_state.requests and will be completed
in order by guc_cancel_context_requests() once the schedule-disable
completes.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116115958.9499=
-1-javiermv@gmail.com?part=3D1
