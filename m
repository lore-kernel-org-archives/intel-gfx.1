Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C8C0C79FA1
	for <intel-gfx@archiver.kernel.org>; Tue,  8 Sep 2026 23:39:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C779C10E1E7;
	Tue,  8 Sep 2026 23:39:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DHDshnxs";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0F2C10E1E7
 for <intel-gfx@lists.freedesktop.org>; Tue,  8 Sep 2026 23:39:35 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id A040A4143D;
 Tue,  8 Sep 2026 23:39:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 684681F00A3A;
 Tue,  8 Sep 2026 23:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788910775;
 bh=5YLj4hd0QFtYoC7wYvJxeAgQLtxZP22OnYFvBsYx0+U=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=DHDshnxsh5MsyVlZyr+ydZjVhjt2Trms0uIxxxC/Yoc27BFHbgRgyPwWY7iw8eBeE
 UwqbX/YrLBpktZIz+0ZuvsPngg3dj1naR1XETzWAjdPqECHdOAoXEUtkAP57tZ4BxU
 1sqqROgJWnl/ZC2pEaFpQoi4SwP6lvxBcXwzpjI04q8rnDuGqU5bED7xG1PnAeruAv
 n1s8aXgEIgfIQRQnK9ASnXrlSQ3m35e8TWuvWAMaoEL/Y1Ob1gfE82GjMNbQwqD3rg
 brjz1/p52Aa927F3ou5rv8vOvLHCtjT3Xhg7l8u6MgcSm2KoHfKAqM6LljJ3zPVX7G
 Wv8DQVr69frjg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] drm/i915/guc: Reject unsolicited deregister-done G2H
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>
Cc: intel-gfx@lists.freedesktop.org
In-Reply-To: <20260908232323.1220407-6-umesh.nerlige.ramappa@intel.com>
References: <20260908232323.1220407-4-umesh.nerlige.ramappa@intel.com>
 <20260908232323.1220407-6-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 23:39:35 +0000
Message-Id: <20260908233935.684681F00A3A@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] g2h_context_lookup() returns a context pointer without holding a r=
eference or RCU lock, making it vulnerable to concurrent destruction and us=
e-after-free for unsolicited messages.
- [High] Race condition between setting `context_destroyed` and sending the=
 deregister message allows a compromised GuC to trigger a logical Use-After=
-Free.
--

commit cb6dcb7e78a9d3169d35435ce55f5ecfc640397c
Author: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

drm/i915/guc: Reject unsolicited deregister-done G2H

intel_guc_deregister_done_process_msg() takes the ctx_id straight out of
the G2H payload, resolves it via g2h_context_lookup() and then calls
decr_outstanding_submission_g2h() unconditionally. Ensure that we are
expecting a DEREGISTER_DONE G2H for that context before changing
outstanding_submission state. Return EPROTO on error.

> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/=
gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 9d3bd16adf406..85fbef30dbecb 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -5065,6 +5065,18 @@ int intel_guc_deregister_done_process_msg(struct i=
ntel_guc *guc,
>  	if (unlikely(!ce))
>  		return -EPROTO;
> =20
> +	/*
> +	 * A deregister H2G is only ever sent for a context that has been put in
> +	 * one of these two states first, so anything else means this G2H does
> +	 * not correspond to an outstanding request of ours.
> +	 */
> +	if (unlikely(!context_wait_for_deregister_to_register(ce) &&

[Severity: High]
This is a pre-existing issue, but this patch adds new logic directly on the
vulnerable path. Can this lead to a use-after-free if the context is
concurrently destroyed?

Earlier in intel_guc_deregister_done_process_msg() in
drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c, g2h_context_lookup()
returns a context pointer ce without holding a reference or an RCU lock.
If submission_disabled(guc) becomes true concurrently, another thread
dropping the final reference to ce might immediately call
__guc_context_destroy(ce), freeing the memory.

Will checking ce->guc_state.sched_state in the newly added check
dereference a potentially freed pointer?

> +		     !context_destroyed(ce))) {

[Severity: High]
This isn't a bug introduced by this patch, but the newly introduced check
fails to protect against a race condition that can cause a use-after-free.

In guc_lrc_desc_unpin() in drivers/gpu/drm/i915/gt/uc/intel_guc_submission.=
c,
a context is marked as destroyed before the deregister message is sent:

	if (likely(!disabled)) {
		__intel_gt_pm_get(gt);
		set_context_destroyed(ce);
		clr_context_registered(ce);
	}
	spin_unlock_irqrestore(&ce->guc_state.lock, flags);

	if (unlikely(disabled)) {
		...
	}

	ret =3D deregister_context(ce, ce->guc_id.id);

If a spurious DEREGISTER_DONE G2H message is processed by the CT worker
thread in the window between unlocking the spinlock and calling
deregister_context(), the new check context_destroyed(ce) will evaluate to
true, allowing the message to be processed.

Will this cause the CT thread to proceed and call __guc_context_destroy(ce)
to free the memory, resulting in a use-after-free when deregister_context()
is subsequently called?

> +		guc_err(guc, "Unexpected deregister done, ctx_id %u sched_state 0x%x\n=
",
> +			ctx_id, ce->guc_state.sched_state);
> +		return -EPROTO;
> +	}
> +
>  	trace_intel_context_deregister_done(ce);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908232323.1220=
407-4-umesh.nerlige.ramappa@intel.com?part=3D2
