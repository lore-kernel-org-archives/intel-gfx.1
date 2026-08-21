Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D0DDC5DF87
	for <intel-gfx@archiver.kernel.org>; Fri, 21 Aug 2026 12:04:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FCFD10E284;
	Fri, 21 Aug 2026 12:04:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZgLaYNG0";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A0A110E284
 for <intel-gfx@lists.freedesktop.org>; Fri, 21 Aug 2026 12:04:24 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id BFB514193A;
 Fri, 21 Aug 2026 12:04:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 838FC1F000E9;
 Fri, 21 Aug 2026 12:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787313863;
 bh=462JgYohx1w+YQ/QAYOVr9Gt/eUEqYmwKfViwEgpq44=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=ZgLaYNG0DtZg1qF8pRMVIwBf6qff8cvXsdOgS4LTy5PTeMJBdVxgQ1VoLbraWYW58
 e5HtZHg0OSq12kIvoGO4bCIcCFJLGlaAC6EW2NE8hyrkWHfU/wR9QM+Nn6S7tgPyfa
 GCYKabPzXf4wdby3/KvbGJ8XI7zXyO8n51Kz+X++HUaUhE0Ge9d5jrSM7KhfLLG3VX
 s7AbmY/iE6X6WSRcilLIxlQxv3QWJVf4KvAAAGLJvpzFUzs6fv6IYgxfsZVi5TZY5l
 26EcR7hnC1IeecBV6YYH5lrnJPAniIPXLueJ/VxDtrLUSRLaeCYqGq8fXk5iO5jU5i
 uTzTabsNHde9g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] drm/i915/gt: Use signalers_lock to prevent starvation
 of irq_work.
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-gfx@lists.freedesktop.org
In-Reply-To: <20260821114508.25669-1-dev@lankhorst.se>
References: <20260821114508.25669-1-dev@lankhorst.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 12:04:23 +0000
Message-Id: <20260821120423.838FC1F000E9@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Double list_add() on ce->signal_link causing list corruption and a=
 memory leak due to missing state checks during lock reacquisition.
--

--- Patch [1]: [PATCH] drm/i915/gt: Use signalers_lock to prevent starvatio=
n of irq_work. ---
commit c467298effeb39850e67f70de02e5adc9ad9e9fb
Author: Maarten Lankhorst <dev@lankhorst.se>

drm/i915/gt: Use signalers_lock to prevent starvation of irq_work.

This commit introduces a global spinlock (signalers_lock) to prevent irq_wo=
rk
starvation and removes RCU handling to avoid PREEMPT_RT issues and request
lifetime UAFs.

> diff --git a/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c b/drivers/gpu/dr=
m/i915/gt/intel_breadcrumbs.c
> index c10ac0ab3bfa8..0ae7759dc74a3 100644
> --- a/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c
> @@ -88,24 +88,25 @@ static void add_signaling_context(struct intel_breadc=
rumbs *b,
>  				  struct intel_context *ce)
>  {
>  	lockdep_assert_held(&ce->signal_lock);
> +	lockdep_assert_held(&b->signalers_lock);
> =20
> -	spin_lock(&b->signalers_lock);
> -	list_add_rcu(&ce->signal_link, &b->signalers);
> -	spin_unlock(&b->signalers_lock);
> +	if (list_empty(&ce->signals))
> +		return;
> +
> +	intel_context_get(ce);
> +	list_add(&ce->signal_link, &b->signalers);

[Severity: High]
Can this cause a double list_add() on ce->signal_link, leading to list
corruption and a leaked intel_context reference?

If add_signaling_context() is called without verifying if ce->signal_link is
already linked (e.g., by checking !list_empty(&ce->signal_link)), it might =
act
as a nexus for list corruption.

>  }

[ ... ]

> @@ -427,30 +424,87 @@ bool i915_request_enable_breadcrumb(struct i915_req=
uest *rq)
>  		return true;
> =20
>  	spin_lock(&ce->signal_lock);
> +	b =3D READ_ONCE(rq->engine)->breadcrumbs;
> +
>  	if (test_bit(I915_FENCE_FLAG_ACTIVE, &rq->fence.flags))
> -		insert_breadcrumb(rq);
> +		add_context =3D insert_breadcrumb(rq, b);
> +
> +	if (add_context && spin_trylock(&b->signalers_lock)) {
> +		add_signaling_context(b, ce);
> +		spin_unlock(&b->signalers_lock);
> +		add_context =3D false;
> +	}
>  	spin_unlock(&ce->signal_lock);
> =20
> +	if (add_context) {
> +		/*
> +		 * Fast trylock didn't work, use slow locking.
> +		 *
> +		 * Dropping the lock to solve the inversion is safe, since
> +		 * no race is possible against remove_signaling_context()
> +		 * without being added as signaling context.
> +		 */
> +		spin_lock(&b->signalers_lock);
> +		spin_lock(&ce->signal_lock);
> +		add_signaling_context(b, ce);

[Severity: High]
Does dropping ce->signal_lock here open a race window that could lead to the
list corruption mentioned above?

Since the lock is dropped before reacquisition on the slow path, other thre=
ads
can modify ce->signals and add the context before lock reacquisition. For
example:

Thread A enables breadcrumbs on rq1, fails the fast trylock, and drops
ce->signal_lock to retry on the slow path.

Thread B cancels rq1, emptying ce->signals.

Thread C enables breadcrumbs on rq2, sees an empty ce->signals, succeeds wi=
th
the fast trylock, and adds ce->signal_link to b->signalers.

Thread A resumes, reacquires the locks, and unconditionally calls
add_signaling_context(). Since ce->signals now holds rq2, it isn't empty,
causing Thread A to execute a second list_add() on ce->signal_link.

> +		spin_unlock(&ce->signal_lock);
> +		spin_unlock(&b->signalers_lock);
> +	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821114508.2566=
9-1-dev@lankhorst.se?part=3D1
