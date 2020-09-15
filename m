Return-Path: <SRS0=duUN=CY=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A81DC433E2
	for <intel-gfx@archiver.kernel.org>; Tue, 15 Sep 2020 08:39:54 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A80C7206F4
	for <intel-gfx@archiver.kernel.org>; Tue, 15 Sep 2020 08:39:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="4ZO6BoNl";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="8ik3d8qu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A80C7206F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C31FE6E098;
	Tue, 15 Sep 2020 08:39:52 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75DA86E098;
 Tue, 15 Sep 2020 08:39:51 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1600159189;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=a15vj77Xa9KXo3Ek21dMycAwDWIIiMUe5bjhvVzzjCs=;
 b=4ZO6BoNleN8HQgP0z8q+4JbOh4PFsXqPl2O1VMMFsqMl6Je+Vd4svU6GjBOnz4JBLm59ef
 n28q3APVdlSA6QtUBbVtHjAsCDNA9DMNxmpB3Xs8JDO2mhj9om6HKXu9jHt5uTY4drNVe+
 Xi88yb65/jAIcWHRrtrHzz6pJv5CkGBo0rMdCdV0m6UGwcjwsaPqQyFAYyPj9eb+iOpbLb
 OyGnJVFkDuM2Xw/Zd91HZnJtSCpZf4n90+HYVnsyWEI2CIiSdIZikeb1E30oqvvQPgJtwy
 7GKY8eCHlWViBl9/zu9LXs5HqsgBdJJ10OMSGETAETJYeANond9fGhpnX7IhVQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1600159189;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=a15vj77Xa9KXo3Ek21dMycAwDWIIiMUe5bjhvVzzjCs=;
 b=8ik3d8quF/oYipmw+L5R6EnAKiYsBpkerr1Z3ToGRa9dHoJtFKl9KfoiSlZU5EwJHOK7Qp
 VqVAEKjJfZ9P9ICw==
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Ard Biesheuvel <ardb@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>
In-Reply-To: <CAHk-=wj0eUuVQ=hRFZv_nY7g5ZLt7Fy3K7SMJL0ZCzniPtsbbg@mail.gmail.com>
References: <20200914204209.256266093@linutronix.de>
 <CAHk-=win80rdof8Pb=5k6gT9j_v+hz-TQzKPVastZDvBe9RimQ@mail.gmail.com>
 <871rj4owfn.fsf@nanos.tec.linutronix.de>
 <CAHk-=wj0eUuVQ=hRFZv_nY7g5ZLt7Fy3K7SMJL0ZCzniPtsbbg@mail.gmail.com>
Date: Tue, 15 Sep 2020 10:39:48 +0200
Message-ID: <87bli75t7v.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [patch 00/13] preempt: Make preempt count
 unconditional
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
Cc: Juri Lelli <juri.lelli@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Lai Jiangshan <jiangshanlai@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Segall <bsegall@google.com>,
 Linux-MM <linux-mm@kvack.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 linux-hexagon@vger.kernel.org, Will Deacon <will@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 linux-arch <linux-arch@vger.kernel.org>, Brian Cain <bcain@codeaurora.org>,
 Richard Weinberger <richard@nod.at>, Russell King <linux@armlinux.org.uk>,
 David Airlie <airlied@linux.ie>, Ingo Molnar <mingo@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Mel Gorman <mgorman@suse.de>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, Matt Turner <mattst88@gmail.com>,
 Valentin Schneider <valentin.schneider@arm.com>, linux-xtensa@linux-xtensa.org,
 Shuah Khan <shuah@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>,
 Jeff Dike <jdike@addtoit.com>, linux-um <linux-um@lists.infradead.org>,
 Josh Triplett <josh@joshtriplett.org>, Steven Rostedt <rostedt@goodmis.org>,
 rcu@vger.kernel.org, linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Richard Henderson <rth@twiddle.net>, Chris Zankel <chris@zankel.net>,
 Max Filippov <jcmvbkbc@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
 alpha <linux-alpha@vger.kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Daniel Bristot de Oliveira <bristot@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Mon, Sep 14 2020 at 15:24, Linus Torvalds wrote:
> On Mon, Sep 14, 2020 at 2:55 PM Thomas Gleixner <tglx@linutronix.de> wrote:
>>
>> Yes it does generate better code, but I tried hard to spot a difference
>> in various metrics exposed by perf. It's all in the noise and I only
>> can spot a difference when the actual preemption check after the
>> decrement
>
> I'm somewhat more worried about the small-device case.

I just checked on one of my old UP ARM toys which I run at home. The .text
increase is about 2% (75k) and none of the tests I ran showed any
significant difference. Couldn't verify with perf though as the PMU on
that piece of art is unusable.

> That said, the diffstat certainly has its very clear charm, and I do
> agree that it makes things simpler.
>
> I'm just not convinced people should ever EVER do things like that "if
> (preemptible())" garbage. It sounds like somebody is doing seriously
> bad things.

OTOH, having a working 'preemptible()' or maybe better named
'can_schedule()' check makes tons of sense to make decisions about
allocation modes or other things.

We're currently looking through all of in_atomic(), in_interrupt()
etc. usage sites and quite some of them are historic and have the clear
intent of checking whether the code is called from task context or
hard/softirq context. Lots of them are completely broken or just work by
chance.

But there is clearly historic precendence that context checks are
useful, but they only can be useful if we have a consistent mechanism
which works everywhere.

Of course we could mandate that every interface which might be called
from one or the other context has a context argument or provides two
variants of the same thing. But I'm not really convinced whether that's
a win over having a consistent and reliable set of checks.

Thanks,

        tglx




_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
