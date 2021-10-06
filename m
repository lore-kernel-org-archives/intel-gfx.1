Return-Path: <SRS0=FGOe=O2=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09ABCC433F5
	for <intel-gfx@archiver.kernel.org>; Wed,  6 Oct 2021 06:59:04 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFAF9610C9
	for <intel-gfx@archiver.kernel.org>; Wed,  6 Oct 2021 06:59:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BFAF9610C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13AE96ECEF;
	Wed,  6 Oct 2021 06:59:03 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 411246ECEF;
 Wed,  6 Oct 2021 06:59:02 +0000 (UTC)
Date: Wed, 6 Oct 2021 08:58:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1633503539;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ba2hRwTEZXOF3lXWJl+7TEsx8ujSR2pepYAfUtQNjTk=;
 b=kQCWAxQJ8vHl8Qi3bTBc2Tc4jMd/BSjnzfiI9trNsCd/ei3WdVdP+8fRHyOvoXgj1JgXJ9
 xPzyockVvZHhZSNZBCoPfEcJAoXKvSGuH8wBXuxot1Uit9AfqVGEcADYHW6IXZ5U+O0ERq
 UI7ImkXz8A/az8QmqC4mTHlPYcHrpMVMBicR13zoYe3jL4udrnbe00oxb5xXnKTOU9puDk
 FbWc0QBAS2FM6kxGaNxgWozF0U9m7REtHzQhUt/75eXrVt0dtXWTfJDzv7W9qrq6u5BXcc
 zEn1KtbWN0PCe7vwzf7i/K52rwMx02ymhXED5aukazyIHxXelntOE8QT/oHPDQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1633503539;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ba2hRwTEZXOF3lXWJl+7TEsx8ujSR2pepYAfUtQNjTk=;
 b=fttLzOA+fG8yU71L6C5gI9sAhisfbW4zUOeTl16tREKylLLkr9lUnzt9/uMJ073wKPNkH3
 L81CmD6mW01uYyBg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Peter Zijlstra <peterz@infradead.org>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Gleixner <tglx@linutronix.de>
Message-ID: <20211006065857.6hpopr4agp4cjlor@linutronix.de>
References: <20211005150046.1000285-1-bigeasy@linutronix.de>
 <20211005150046.1000285-9-bigeasy@linutronix.de>
 <20211005191617.GA174703@worktop.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211005191617.GA174703@worktop.programming.kicks-ass.net>
Subject: Re: [Intel-gfx] [PATCH 8/8] drm/i915: Don't disable interrupts and
 pretend a lock as been acquired in __timeline_mark_lock().
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

On 2021-10-05 21:16:17 [+0200], Peter Zijlstra wrote:
> > -static inline void intel_context_mark_active(struct intel_context *ce)
> > +static inline void intel_context_mark_active(struct intel_context *ce,
> > +					     bool timeline_mutex_needed)
> >  {
> > -	lockdep_assert_held(&ce->timeline->mutex);
> > +	if (timeline_mutex_needed)
> > +		lockdep_assert_held(&ce->timeline->mutex);
> >  	++ce->active_count;
> >  }
> 
> Chris, might it be possible to write that something like:
> 
> 	lockdep_assert(lockdep_is_held(&ce->timeline->mutex) ||
> 		       engine_is_parked(ce));
> 
> instead?

This looks indeed way better given Torvald's yelling in similar cases.

> Otherwise,
> 
> Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>

Sebastian
