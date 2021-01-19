Return-Path: <SRS0=gs28=GW=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50406C433E0
	for <intel-gfx@archiver.kernel.org>; Tue, 19 Jan 2021 15:37:33 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE41123133
	for <intel-gfx@archiver.kernel.org>; Tue, 19 Jan 2021 15:37:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE41123133
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 588B389A8B;
	Tue, 19 Jan 2021 15:37:32 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0B7489A8B
 for <intel-gfx@lists.freedesktop.org>; Tue, 19 Jan 2021 15:37:30 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 23640686-1500050 for multiple; Tue, 19 Jan 2021 15:37:25 +0000
MIME-Version: 1.0
In-Reply-To: <CAM0jSHPcQVc7SEVBhkAd2aVa=g-EAeKZ-5LeMK=tSGriBB8vkw@mail.gmail.com>
References: <20210119144912.12653-1-chris@chris-wilson.co.uk>
 <CAM0jSHPcQVc7SEVBhkAd2aVa=g-EAeKZ-5LeMK=tSGriBB8vkw@mail.gmail.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Matthew Auld <matthew.william.auld@gmail.com>
Date: Tue, 19 Jan 2021 15:37:24 +0000
Message-ID: <161107064499.7548.17224327530136141903@build.alporthouse.com>
User-Agent: alot/0.9
Subject: Re: [Intel-gfx] [PATCH 1/6] drm/i915/gem: Almagamate clflushes on
 suspend
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Quoting Matthew Auld (2021-01-19 15:30:41)
> On Tue, 19 Jan 2021 at 14:49, Chris Wilson <chris@chris-wilson.co.uk> wrote:
> >
> > When flushing objects larger than the CPU cache it is preferrable to use
> > a single wbinvd() rather than overlapping clflush(). At runtime, we
> > avoid wbinvd() due to its system-wide latencies, but during
> > singlethreaded suspend, no one will observe the imposed latency and we
> > can opt for the faster wbinvd to clear all objects in a single hit.
> >
> > Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> > ---
> >  drivers/gpu/drm/i915/gem/i915_gem_pm.c | 40 +++++++++-----------------
> >  1 file changed, 13 insertions(+), 27 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pm.c b/drivers/gpu/drm/i915/gem/i915_gem_pm.c
> > index 40d3e40500fa..38c1298cb14b 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_pm.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_pm.c
> > @@ -11,6 +11,12 @@
> >
> >  #include "i915_drv.h"
> >
> > +#if defined(CONFIG_X86)
> > +#include <asm/smp.h>
> > +#else
> > +#define wbinvd_on_all_cpus()
> > +#endif
> > +
> >  void i915_gem_suspend(struct drm_i915_private *i915)
> >  {
> >         GEM_TRACE("%s\n", dev_name(i915->drm.dev));
> > @@ -32,13 +38,6 @@ void i915_gem_suspend(struct drm_i915_private *i915)
> >         i915_gem_drain_freed_objects(i915);
> >  }
> >
> > -static struct drm_i915_gem_object *first_mm_object(struct list_head *list)
> > -{
> > -       return list_first_entry_or_null(list,
> > -                                       struct drm_i915_gem_object,
> > -                                       mm.link);
> > -}
> > -
> >  void i915_gem_suspend_late(struct drm_i915_private *i915)
> >  {
> >         struct drm_i915_gem_object *obj;
> > @@ -48,6 +47,7 @@ void i915_gem_suspend_late(struct drm_i915_private *i915)
> >                 NULL
> >         }, **phase;
> >         unsigned long flags;
> > +       bool flush = false;
> >
> >         /*
> >          * Neither the BIOS, ourselves or any other kernel
> > @@ -73,29 +73,15 @@ void i915_gem_suspend_late(struct drm_i915_private *i915)
> >
> >         spin_lock_irqsave(&i915->mm.obj_lock, flags);
> >         for (phase = phases; *phase; phase++) {
> > -               LIST_HEAD(keep);
> > -
> > -               while ((obj = first_mm_object(*phase))) {
> > -                       list_move_tail(&obj->mm.link, &keep);
> > -
> > -                       /* Beware the background _i915_gem_free_objects */
> > -                       if (!kref_get_unless_zero(&obj->base.refcount))
> > -                               continue;
> > -
> > -                       spin_unlock_irqrestore(&i915->mm.obj_lock, flags);
> > -
> > -                       i915_gem_object_lock(obj, NULL);
> > -                       drm_WARN_ON(&i915->drm,
> > -                           i915_gem_object_set_to_gtt_domain(obj, false));
> > -                       i915_gem_object_unlock(obj);
> > -                       i915_gem_object_put(obj);
> > -
> > -                       spin_lock_irqsave(&i915->mm.obj_lock, flags);
> > +               list_for_each_entry(obj, *phase, mm.link) {
> > +                       if (!(obj->cache_coherent & I915_BO_CACHE_COHERENT_FOR_READ))
> > +                               flush |= (obj->read_domains & I915_GEM_DOMAIN_CPU) == 0;
> > +                       __start_cpu_write(obj); /* presume auto-hibernate */
> >                 }
> > -
> > -               list_splice_tail(&keep, *phase);
> >         }
> >         spin_unlock_irqrestore(&i915->mm.obj_lock, flags);
> > +       if (flush)
> > +               wbinvd_on_all_cpus();
> 
> Hmmm, this builds on !CONFIG_X86?

It builds; but does it do anything? The answer is no, but finding the
answer to that is a bridge I can cross later -- it's probably something
like flush_dcache_range(0, HUGEVAL) / __flush_dcache_all() I expect it to
be a solved probably, just not sure what the solution is.

Maybe dev_warn() instead of a quiet macro.
-Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
