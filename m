Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15A23C5DF97
	for <intel-gfx@archiver.kernel.org>; Wed, 26 Aug 2026 16:32:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C14110E285;
	Wed, 26 Aug 2026 16:32:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Gi7uRfJ0";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6656810E248
 for <intel-gfx@lists.freedesktop.org>; Wed, 26 Aug 2026 16:32:41 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 1A9F6436AA;
 Wed, 26 Aug 2026 16:32:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE91F1F000E9;
 Wed, 26 Aug 2026 16:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787761961;
 bh=s76ivAoBdjVSDYddiPV8sZFWCcivh9KaAfs9oibIbXg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=Gi7uRfJ0XRuA5WPfg+k6nN+rRK2hY4xk9oFwFoHRjYdYKuxqbbh00tyZ7sPN1wMYp
 bEx60bAHg45fehxbzJhfXadM86iCRPoACOzh0cMVhGFNpFaXnJ2PwXJ0GTXcr57uBM
 5GU2lyGVB7G6aLLtuepmMAvs0+Eklvn3vdPgDhrh2Yw/2v43WPpY76LawuWi+xfHu9
 vVItkoWCpzRjgKwYKA/4vzVtPCUh3Qq4Oo4jXAfJJn2lEjWzL2rMtKmyT+jFZMTKCo
 HT9GJ0xqeQ2PV9TUMOQ5KK/UsudQ5a3JlxoVccyjwbMFvxe6mHtGDHX+My17M5EKEO
 tcN4yOMJkdohA==
Date: Wed, 26 Aug 2026 18:32:36 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Maarten Lankhorst <dev@lankhorst.se>
Cc: intel-gfx@lists.freedesktop.org, 
 Shuangpeng Bai <shuangpeng.kernel@gmail.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 stable@vger.kernel.org, Chris Wilson <chris.p.wilson@linux.intel.com>
Subject: Re: [PATCH] drm/i915/gt: Use signalers_lock to prevent starvation of
 irq_work.
Message-ID: <ao733YCoP3HSiSdq@zenone.zhora.eu>
References: <20260821114508.25669-1-dev@lankhorst.se>
 <aohKIjZZ6Qjy8qGQ@zenone.zhora.eu>
 <5d715d3e-5b50-4d4f-a313-d79e243d9bce@lankhorst.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5d715d3e-5b50-4d4f-a313-d79e243d9bce@lankhorst.se>
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

Hi Maarten,

...

> >> @@ -427,30 +424,87 @@ bool i915_request_enable_breadcrumb(struct i915_request *rq)
> >>  		return true;
> >>  
> >>  	spin_lock(&ce->signal_lock);
> >> +	b = READ_ONCE(rq->engine)->breadcrumbs;
> >> +
> >>  	if (test_bit(I915_FENCE_FLAG_ACTIVE, &rq->fence.flags))
> >> -		insert_breadcrumb(rq);
> >> +		add_context = insert_breadcrumb(rq, b);
> >> +
> >> +	if (add_context && spin_trylock(&b->signalers_lock)) {
> >> +		add_signaling_context(b, ce);
> >> +		spin_unlock(&b->signalers_lock);
> >> +		add_context = false;
> >> +	}
> >>  	spin_unlock(&ce->signal_lock);
> >>  
> >> +	if (add_context) {
> >> +		/*
> >> +		 * Fast trylock didn't work, use slow locking.
> >> +		 *
> >> +		 * Dropping the lock to solve the inversion is safe, since
> >> +		 * no race is possible against remove_signaling_context()
> >> +		 * without being added as signaling context.
> >> +		 */
> >> +		spin_lock(&b->signalers_lock);
> >> +		spin_lock(&ce->signal_lock);
> >> +		add_signaling_context(b, ce);
> >> +		spin_unlock(&ce->signal_lock);
> >> +		spin_unlock(&b->signalers_lock);
> > 
> > If I want to be a bit paranoic, a new request can be added in
> > between the two locking blocks and "add_context" is not valid
> > anymore.
> 
> It's completely fine if another request is added as well.
> The check we really care about is about ce->signals being empty.
> 
> add_context is still valid, since we jumped from 0 to 1 or more requests,
> and the context needs to be added to the list of active contexts.
> 
> Whether we add the context with a single, or 2 or more requests will not introduce a race.
> 
> > add_signaling_context() already checks for ce->signals, but it
> > does not check whether ce->signal_link is already linked. Should
> > we also check !list_empty(&ce->signal_link)?
> 
> I do not think this can happen, since until the context is added to the list
> of signaling contexts, no request can be removed from the context's signal list.

I didn't read sashiko when I replied here, but I see that it
brought up the same concern; the thread A/B/C scenario makes
sense to me as it looks that you are not accounting for the
cancellation between the two locking section.

Am I missing anything here?

Andi
