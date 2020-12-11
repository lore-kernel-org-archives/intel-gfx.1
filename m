Return-Path: <SRS0=6ulK=FP=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04901C4361B
	for <intel-gfx@archiver.kernel.org>; Fri, 11 Dec 2020 11:21:53 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46B0523EF4
	for <intel-gfx@archiver.kernel.org>; Fri, 11 Dec 2020 11:21:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46B0523EF4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1C4C6ED9F;
	Fri, 11 Dec 2020 11:21:51 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A0FE6ED9F
 for <intel-gfx@lists.freedesktop.org>; Fri, 11 Dec 2020 11:21:49 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 23291792-1500050 for multiple; Fri, 11 Dec 2020 11:21:41 +0000
MIME-Version: 1.0
In-Reply-To: <20201210173713.GA25527@sdutt-i7>
References: <20201207193824.18114-1-chris@chris-wilson.co.uk>
 <20201207193824.18114-7-chris@chris-wilson.co.uk>
 <20201210173713.GA25527@sdutt-i7>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Matthew Brost <matthew.brost@intel.com>
Date: Fri, 11 Dec 2020 11:21:41 +0000
Message-ID: <160768570162.21588.18303745346966551428@build.alporthouse.com>
User-Agent: alot/0.9
Subject: Re: [Intel-gfx] [PATCH 07/20] drm/i915/gt: Shrink the critical
 section for irq signaling
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
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Quoting Matthew Brost (2020-12-10 17:37:13)
> On Mon, Dec 07, 2020 at 07:38:11PM +0000, Chris Wilson wrote:
> > Let's only wait for the list iterator when decoupling the virtual
> > breadcrumb, as the signaling of all the requests may take a long time,
> > during which we do not want to keep the tasklet spinning.
> > 
> > Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> > ---
> >  drivers/gpu/drm/i915/gt/intel_breadcrumbs.c       | 2 ++
> >  drivers/gpu/drm/i915/gt/intel_breadcrumbs_types.h | 1 +
> >  drivers/gpu/drm/i915/gt/intel_lrc.c               | 3 ++-
> >  3 files changed, 5 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c b/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c
> > index 63900edbde88..ac1e5f6c3c2c 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c
> > @@ -239,6 +239,7 @@ static void signal_irq_work(struct irq_work *work)
> >               intel_breadcrumbs_disarm_irq(b);
> >  
> >       rcu_read_lock();
> > +     atomic_inc(&b->signaler_active);
> >       list_for_each_entry_rcu(ce, &b->signalers, signal_link) {
> >               struct i915_request *rq;
> >  
> > @@ -274,6 +275,7 @@ static void signal_irq_work(struct irq_work *work)
> >                       }
> >               }
> >       }
> > +     atomic_dec(&b->signaler_active);
> >       rcu_read_unlock();
> >  
> >       llist_for_each_safe(signal, sn, signal) {
> > diff --git a/drivers/gpu/drm/i915/gt/intel_breadcrumbs_types.h b/drivers/gpu/drm/i915/gt/intel_breadcrumbs_types.h
> > index a74bb3062bd8..f672053d694d 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_breadcrumbs_types.h
> > +++ b/drivers/gpu/drm/i915/gt/intel_breadcrumbs_types.h
> > @@ -35,6 +35,7 @@ struct intel_breadcrumbs {
> >       spinlock_t signalers_lock; /* protects the list of signalers */
> >       struct list_head signalers;
> >       struct llist_head signaled_requests;
> > +     atomic_t signaler_active;
> >  
> >       spinlock_t irq_lock; /* protects the interrupt from hardirq context */
> >       struct irq_work irq_work; /* for use from inside irq_lock */
> > diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
> > index b3db16b2a5a4..35cded25c6c1 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_lrc.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
> > @@ -1401,7 +1401,8 @@ static void kick_siblings(struct i915_request *rq, struct intel_context *ce)
> >                * ce->signal_link.
> >                */
> >               i915_request_cancel_breadcrumb(rq);
> > -             irq_work_sync(&engine->breadcrumbs->irq_work);
> > +             while (atomic_read(&engine->breadcrumbs->signaler_active))
> > +                     cpu_relax();
> 
> Would a 'cond_resched' be better here? I trust your opinion on which to
> use but thought I'd mention it.

While by this point we've removed the spinlock from around us, we are
still inside a softirq bh. That will disallow sleeping. Fortunately,
we only have to busy wait on the list iteration.
-Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
