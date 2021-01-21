Return-Path: <SRS0=DGqE=GY=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD836C433DB
	for <intel-gfx@archiver.kernel.org>; Thu, 21 Jan 2021 10:58:13 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E276E23899
	for <intel-gfx@archiver.kernel.org>; Thu, 21 Jan 2021 10:58:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E276E23899
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BEAB6E526;
	Thu, 21 Jan 2021 10:58:12 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3DE66E526
 for <intel-gfx@lists.freedesktop.org>; Thu, 21 Jan 2021 10:58:10 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 23658746-1500050 for multiple; Thu, 21 Jan 2021 10:58:07 +0000
MIME-Version: 1.0
In-Reply-To: <4c24b53a-2db5-39c5-c735-a0f732b7245d@linux.intel.com>
References: <20210121003253.27225-1-chris@chris-wilson.co.uk>
 <4c24b53a-2db5-39c5-c735-a0f732b7245d@linux.intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Date: Thu, 21 Jan 2021 10:58:07 +0000
Message-ID: <161122668704.32666.8919805149951431595@build.alporthouse.com>
User-Agent: alot/0.9
Subject: Re: [Intel-gfx] [PATCH] drm/i915/gt: Move execlists_reset() out of
 line
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Quoting Tvrtko Ursulin (2021-01-21 10:55:49)
> 
> On 21/01/2021 00:32, Chris Wilson wrote:
> > Reduce the bulk of execlists_submission_tasklet by moving the unlikely
> > reset function out of line.
> > 
> > add/remove: 1/0 grow/shrink: 0/1 up/down: 960/-935 (25)
> > Function                                     old     new   delta
> > execlists_reset                                -     960    +960
> > execlists_submission_tasklet                6629    5694    -935
> > 
> > Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> > ---
> >   .../drm/i915/gt/intel_execlists_submission.c  | 36 +++++++++----------
> >   1 file changed, 17 insertions(+), 19 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> > index 740ff05fd692..43cc85241886 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> > @@ -2299,10 +2299,13 @@ static void execlists_capture(struct intel_engine_cs *engine)
> >       kfree(cap);
> >   }
> >   
> > -static void execlists_reset(struct intel_engine_cs *engine, const char *msg)
> > +static noinline void execlists_reset(struct intel_engine_cs *engine)
> >   {
> > +     struct intel_engine_execlists *el = &engine->execlists;
> >       const unsigned int bit = I915_RESET_ENGINE + engine->id;
> >       unsigned long *lock = &engine->gt->reset.flags;
> > +     unsigned long eir = fetch_and_zero(&el->error_interrupt);
> 
> We got the locking wrong for this one. Irq handler side is under 
> gt->irq_lock, but there are unlocked rmw cycles in the tasklet. Not 
> counting this fetch_and_zero which is also unlocked.

It doesn't require locking.
-Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
