Return-Path: <SRS0=TzMs=BR=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56B82C433DF
	for <intel-gfx@archiver.kernel.org>; Fri,  7 Aug 2020 11:14:34 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C824B2177B
	for <intel-gfx@archiver.kernel.org>; Fri,  7 Aug 2020 11:14:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C824B2177B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BB626E0AC;
	Fri,  7 Aug 2020 11:14:33 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9313B6E0AC
 for <intel-gfx@lists.freedesktop.org>; Fri,  7 Aug 2020 11:14:32 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 22060005-1500050 for multiple; Fri, 07 Aug 2020 12:14:29 +0100
MIME-Version: 1.0
In-Reply-To: <fd6dc765-1bba-fab4-4b6a-021bf1237dac@linux.intel.com>
References: <20200807083256.32761-1-chris@chris-wilson.co.uk>
 <20200807083256.32761-2-chris@chris-wilson.co.uk>
 <fd6dc765-1bba-fab4-4b6a-021bf1237dac@linux.intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Date: Fri, 07 Aug 2020 12:14:28 +0100
Message-ID: <159679886876.9674.7609264645683877304@build.alporthouse.com>
User-Agent: alot/0.9
Subject: Re: [Intel-gfx] [PATCH 2/7] drm/i915/gt: Protect context lifetime
 with RCU
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

Quoting Tvrtko Ursulin (2020-08-07 11:08:59)
> 
> On 07/08/2020 09:32, Chris Wilson wrote:
> > +static void __intel_context_ctor(void *arg)
> > +{
> > +     struct intel_context *ce = arg;
> > +
> > +     INIT_LIST_HEAD(&ce->signal_link);
> > +     INIT_LIST_HEAD(&ce->signals);
> > +
> > +     atomic_set(&ce->pin_count, 0);
> > +     mutex_init(&ce->pin_mutex);
> > +
> > +     ce->active_count = 0;
> > +     i915_active_init(&ce->active,
> > +                      __intel_context_active, __intel_context_retire);
> > +
> > +     ce->inflight = NULL;
> > +     ce->lrc_reg_state = NULL;
> > +     ce->lrc.desc = 0;
> > +}
> > +
> > +static void
> > +__intel_context_init(struct intel_context *ce, struct intel_engine_cs *engine)
> > +{
> > +     GEM_BUG_ON(!engine->cops);
> > +     GEM_BUG_ON(!engine->gt->vm);
> > +
> > +     kref_init(&ce->ref);
> > +     i915_active_reinit(&ce->active);
> > +
> > +     ce->engine = engine;
> > +     ce->ops = engine->cops;
> > +     ce->sseu = engine->sseu;
> > +
> > +     ce->wa_bb_page = 0;
> > +     ce->flags = 0;
> > +     ce->tag = 0;
> > +
> > +     memset(&ce->runtime, 0, sizeof(ce->runtime));
> > +
> > +     ce->vm = i915_vm_get(engine->gt->vm);
> > +     ce->gem_context = NULL;
> > +
> > +     ce->ring = __intel_context_ring_size(SZ_4K);
> > +     ce->timeline = NULL;
> > +     ce->state = NULL;
> > +
> > +     GEM_BUG_ON(atomic_read(&ce->pin_count));
> > +     GEM_BUG_ON(ce->active_count);
> > +     GEM_BUG_ON(ce->inflight);
> > +}
> > +
> > +void
> > +intel_context_init(struct intel_context *ce, struct intel_engine_cs *engine)
> > +{
> > +     __intel_context_ctor(ce);
> > +     __intel_context_init(ce, engine);
> 
> Which bits are accessed from outside context free (inside the RCU 
> period) and based on which ones is the decision taken in the caller that 
> the context is free so should be skipped?
> 
> And arent' both _ctor and _init fields re-initialized in the same go 
> with this approach (no RCU period between them) - that is - object can 
> get recycled instantly so what is the point in this case between the 
> _ctor and _init split?

ctor is once per slab-page allocation, init is once per object
allocation. Once upon a time it was said that "DESTROY_BY_RCU without ctor is
inherently wrong" (which was immediately contradicted by others), but
the point still resonates in that since the object may be reused within
an rcu grace period, one should consider what access may still be
inflight at that time. Here, I was just going through the motions of
minimising the amount we reset during init.

We don't have to use TYPESAFE_BY_RCU, it has some nice properties in
freelist management (at least without measuring they sound nice on
paper), we could just use add a manual call_rcu() to defer the
kmem_cache_free. Or we could just ignore the _ctor since we don't
yet have a conflicting access pattern.
-Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
