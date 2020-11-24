Return-Path: <SRS0=tBxe=E6=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3F9DC63777
	for <intel-gfx@archiver.kernel.org>; Tue, 24 Nov 2020 17:38:51 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69B48206C0
	for <intel-gfx@archiver.kernel.org>; Tue, 24 Nov 2020 17:38:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 69B48206C0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8EC56E4E8;
	Tue, 24 Nov 2020 17:38:50 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 563B16E4E8
 for <intel-gfx@lists.freedesktop.org>; Tue, 24 Nov 2020 17:38:49 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 23094997-1500050 for multiple; Tue, 24 Nov 2020 17:38:46 +0000
MIME-Version: 1.0
In-Reply-To: <fce64eec-7910-85c8-7300-6736552eafc4@linux.intel.com>
References: <20201124114219.29020-1-chris@chris-wilson.co.uk>
 <20201124114219.29020-7-chris@chris-wilson.co.uk>
 <fce64eec-7910-85c8-7300-6736552eafc4@linux.intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Date: Tue, 24 Nov 2020 17:38:45 +0000
Message-ID: <160623952536.28476.8865484942445187968@build.alporthouse.com>
User-Agent: alot/0.9
Subject: Re: [Intel-gfx] [PATCH 07/16] drm/i915/gt: Check for a completed
 last request once
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

Quoting Tvrtko Ursulin (2020-11-24 17:19:23)
> 
> On 24/11/2020 11:42, Chris Wilson wrote:
> > Pull the repeated check for the last active request being completed to a
> > single spot, when deciding whether or not execlist preemption is
> > required.
> > 
> > Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> > ---
> >   drivers/gpu/drm/i915/gt/intel_lrc.c | 15 ++++-----------
> >   1 file changed, 4 insertions(+), 11 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
> > index cf11cbac241b..43703efb36d1 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_lrc.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
> > @@ -2141,12 +2141,9 @@ static void execlists_dequeue(struct intel_engine_cs *engine)
> >        */
> >   
> >       if ((last = *active)) {
> > -             if (need_preempt(engine, last, rb)) {
> > -                     if (i915_request_completed(last)) {
> > -                             tasklet_hi_schedule(&execlists->tasklet);
> > -                             return;
> > -                     }
> > -
> > +             if (i915_request_completed(last)) {
> > +                     goto check_secondary;
> > +             } else if (need_preempt(engine, last, rb)) {
> >                       ENGINE_TRACE(engine,
> >                                    "preempting last=%llx:%lld, prio=%d, hint=%d\n",
> >                                    last->fence.context,
> > @@ -2174,11 +2171,6 @@ static void execlists_dequeue(struct intel_engine_cs *engine)
> >                       last = NULL;
> >               } else if (need_timeslice(engine, last, rb) &&
> >                          timeslice_expired(execlists, last)) {
> > -                     if (i915_request_completed(last)) {
> > -                             tasklet_hi_schedule(&execlists->tasklet);
> > -                             return;
> > -                     }
> > -
> >                       ENGINE_TRACE(engine,
> >                                    "expired last=%llx:%lld, prio=%d, hint=%d, yield?=%s\n",
> >                                    last->fence.context,
> > @@ -2214,6 +2206,7 @@ static void execlists_dequeue(struct intel_engine_cs *engine)
> >                        * we hopefully coalesce several updates into a single
> >                        * submission.
> >                        */
> > +check_secondary:
> >                       if (!list_is_last(&last->sched.link,
> >                                         &engine->active.requests)) {
> 
> Is there a tasklet_hi_schedule in here? I see set_timeslice in my checkout.

That tasklet_hi_schedule() was a mistake. It just devolves into a
busy-spinner as we wait for HW to send the next event, which turns out
not to be as instantaneous as hoped.

I recall leaving the imprint of my palm on my face when I figured out
what was causing the spike in the profile.
-Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
