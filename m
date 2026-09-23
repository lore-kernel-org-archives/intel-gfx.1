Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78515C98304
	for <intel-gfx@archiver.kernel.org>; Wed, 23 Sep 2026 14:26:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0948B10F09D;
	Wed, 23 Sep 2026 14:26:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.b="sVRb4b3n";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="oxRiy1Yg";
	dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C13FE10F09D
 for <intel-gfx@lists.freedesktop.org>; Wed, 23 Sep 2026 14:26:42 +0000 (UTC)
Date: Wed, 23 Sep 2026 16:26:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1790173600;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZZNVhOEl9A7EmfA7SSU4oqWXKKn395lkA03bvJOWhGY=;
 b=sVRb4b3nUF2610hd9XHuqlmFHV7/5xvK/zgyn6niQ81SU/fQPlz3AxXSk0gE45FgcuETT3
 oo4dPtXFFt8UR8Jmae+PtcPxtFYFiVi1F+drIG6pkpGNnIxiyaKrpjXIUZCG6iksEW+xLs
 QByqbhYXcnvppggPIrYbk57WZkWSOytIzIMKRJBsQQ4foNf5v+l+Z1+h9keYKOEOZRqSc7
 IjzAlB4bsXpjaql7hCaqNPWEZXYgUhL1pSRIcLio7rUe1WSZsgC6V6+vdbJc9fjrGyLkQW
 XSY1/UE9qMVj1uSWo0cC7YklX9ubigD8o+SErRgWWuN2x08C+YRFhVSUdjPcOw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1790173600;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZZNVhOEl9A7EmfA7SSU4oqWXKKn395lkA03bvJOWhGY=;
 b=oxRiy1YglYfLmX0ZvS5PSTK81oVoKJu8a8U2c9t9pJbvgbLqF0N9W+bglwBSpiFjNSzKhY
 u9GzB94Roa2PCMAQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Maarten Lankhorst <dev@lankhorst.se>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v5 4/6] drm/i915/gt: Fix selftests on PREEMPT_RT
Message-ID: <20260923142639.66gE6Fyw@linutronix.de>
References: <20260923111518.310430-8-dev@lankhorst.se>
 <20260923111518.310430-12-dev@lankhorst.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260923111518.310430-12-dev@lankhorst.se>
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

On 2026-09-23 13:15:23 [+0200], Maarten Lankhorst wrote:
> The engine->busyness() callbacks called from the selftests are on PREEMPT_RT
> not safe with preemption disabled, because all spinlock_t locks
> becomes sleeping locks on PREEMPT_RT and must not be acquired with disabled
> preemption.
> 
> This is also a problem for perf events, where we disable the busyness events
> on PREEMPT_RT, as they're run from hardirq context.
> 
> Previous attempts to fix this failed, so convert the selftest code to read
> engine->busyness()  with migrate_disable() instead of preempt_disable() to
> prevent selftest failures on PREEMPT_RT.
> 
> By disabling migration, we prevent moving the selftests between cores,
> and should decrease the jitter in both the idle cases and busy cases,
> compared to no prevention at all.
> 
> Since interrupts were not disabled, some jitter may still occur, but it
> should hopefully be less with migration disabled.
> 
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>

Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Sebastian
