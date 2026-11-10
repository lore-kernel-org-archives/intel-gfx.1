Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 973E2606A75F
	for <intel-gfx@archiver.kernel.org>; Tue, 10 Nov 2026 12:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NOoWBawC
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 345A910F69C;
	Tue, 10 Nov 2026 12:56:17 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 936B610F662
 for <intel-gfx@lists.freedesktop.org>; Tue, 10 Nov 2026 12:56:10 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 5135647181;
 Tue, 10 Nov 2026 12:56:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A0F01F0089F;
 Tue, 10 Nov 2026 12:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794315370;
 bh=f20IjdRWHeuUiJv4Xf0TWXHBZoR7V2Ncr7lamv9noZs=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=NOoWBawCC5hnmN83L27iCzb8KKf2DaHbCBx6NYl40mbJtaGxr2dN6P85oMci28540
 85UIoFNoLhoYmyrMVnU1MdR6zKEg8Kwh4hV40TSq6ikCtAaxFxwdecQrfxZsLuZbFh
 Dvg6FcTksuVwWT22hXrN9Cj/Bz95ORCqf9/ip/5BXNHqohdEJAc45os13PGtVcXH/c
 4EUby7smNRiWDm3d+fgyKqoMrRjn594h5J7ZNYYH/oVnOg6Gk4olpWhyVaIEZlM0NT
 9X4Tv/6cn0uN4pqUbORbo00Vf7GGzXCHntIqS7mI+63Uz+7Vre7+xFezcYG+uKhr+m
 ECm8d0QPPAI3A==
Message-ID: <sashiko-outbox-207054@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] drm/i915/guc: Complete all requests of a
 non-schedulable context
To: "Javier MV" <javiermv@gmail.com>, intel-gfx@lists.freedesktop.org
In-Reply-To: <20261110122534.12989-2-javiermv@gmail.com>
References: <20261110122534.12989-1-javiermv@gmail.com>
 <20261110122534.12989-2-javiermv@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 12:56:08 +0000
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

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [High] drm/i915/guc: use-after-free in __guc_add_request() on
  completed rq
- [High] drm/i915/guc: out-of-order completion of rq in
  __guc_add_request()
- [Medium] drm/i915/guc: uncompleted requests in __guc_add_request() on
  pending enable
--

commit 75c751fdc5e9421329da29b1d39d5306a72785b3
Author: Javier MV <javiermv@duck.com>

drm/i915/guc: Complete all requests of a non-schedulable context

This commit completes all requests on ce->guc_state.requests with -EIO in
__guc_add_request() when a context is not schedulable and is off the
hardware.

Link: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15301

> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/=
gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 788e59cdfac9b..555ca8fdf64af 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -709,6 +709,20 @@ static int __guc_add_request(struct intel_guc *guc, =
struct i915_request *rq)
>  	 * request resubmitted after the context was banned.
>  	 */
>  	if (unlikely(!intel_context_is_schedulable(ce))) {
> +		struct i915_request *pos;
> +
> +		/*
> +		 * The dequeue only passes the last of the merged requests, and
> +		 * the context won't run again to write the others' breadcrumbs:
> +		 * complete them all, once the context is off the HW.
> +		 */
> +		spin_lock(&ce->guc_state.lock);
> +		if (!context_enabled(ce) && !context_pending_enable(ce) &&
> +		    !context_pending_disable(ce))
> +			list_for_each_entry(pos, &ce->guc_state.requests, sched.link)
> +				i915_request_put(i915_request_mark_eio(pos));

[Severity: Medium]
Can checking !context_pending_enable(ce) leave requests on
ce->guc_state.requests incomplete forever?

When GuC resets a context before an in-flight schedule-enable G2H is
processed, __guc_reset_context() calls clr_context_enabled(ce) while
SCHED_STATE_PENDING_ENABLE remains set and SCHED_STATE_PENDING_DISABLE is
clear.  In that state guc_context_revoke() treats the context as already off
the hardware and does not send a disable H2G:

drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:guc_context_revoke() {
	...
	if (submission_disabled(guc) ||
	    (!context_enabled(ce) && !context_pending_disable(ce))) {
		spin_unlock_irqrestore(&ce->guc_state.lock, flags);

		guc_cancel_context_requests(ce);
		intel_engine_signal_breadcrumbs(ce->engine);
	...
}

When the pending enable G2H later arrives in
intel_guc_sched_done_process_msg(), it only calls clr_context_pending_enabl=
e()
and never calls guc_cancel_context_requests(ce), so any requests skipped he=
re
because of context_pending_enable(ce) will never be completed.

> +		spin_unlock(&ce->guc_state.lock);
> +
> +		i915_request_put(i915_request_mark_eio(rq));
> +		intel_engine_signal_breadcrumbs(ce->engine);

[Severity: High]
Can this trigger a use-after-free on rq (and ce->engine) after dropping
ce->guc_state.lock?

Both callers of guc_add_request() first run __i915_request_submit(rq) ->
add_to_context(rq), which moves rq onto ce->guc_state.requests without taki=
ng
an extra reference beyond the timeline reference on tl->requests.  When the
loop above runs, it visits pos =3D=3D rq and marks rq complete under
ce->guc_state.lock.  In GuC mode, request retirement does not take
sched_engine->lock; it only serializes on tl->mutex and ce->guc_state.lock =
in
remove_from_context():

CPU0                                    CPU1
__guc_add_request(guc, rq)
  spin_lock(&ce->guc_state.lock)
  list_for_each_entry(pos, ...)
    i915_request_mark_eio(rq)
    i915_request_put(rq)
  spin_unlock(&ce->guc_state.lock)
                                        i915_request_retire(rq)
                                          remove_from_context(rq)
                                          intel_context_unpin(ce)
                                          i915_request_put(rq)  <-- frees rq
  i915_request_mark_eio(rq)  <-- use-after-free
  intel_engine_signal_breadcrumbs(ce->engine)

If rq is recycled from the SLAB_TYPESAFE_BY_RCU pool by another context on
CPU1 before CPU0 reaches the second i915_request_mark_eio(rq), CPU0 will ma=
rk
that unrelated request complete with -EIO, or access freed memory if the sl=
ab
or virtual engine context was freed.

[Severity: High]
When the context is still enabled or has a schedule transition in flight,
does marking rq complete outside the if condition complete rq out of order
ahead of earlier requests on the same timeline?

guc_dequeue_one_context() merges all queued requests of a context onto
ce->guc_state.requests and passes only the last request rq to
__guc_add_request().  If context_enabled(ce), context_pending_enable(ce), or
context_pending_disable(ce) is true, the loop is skipped and earlier reques=
ts
on the timeline remain incomplete, but rq at the tail of the timeline is
still marked complete here.

Because __i915_active_fence_set() and dma_resv replace earlier timeline
fences with the newest request's fence, completing rq while earlier requests
are still running on the GPU allows VMAs to be unbound and backing pages
freed during active GPU DMA, and triggers
GEM_BUG_ON(!i915_request_completed(tmp)) in i915_request_retire_upto().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110122534.1298=
9-1-javiermv@gmail.com?part=3D1
