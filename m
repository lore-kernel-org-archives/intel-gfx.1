Return-Path: <SRS0=J6ZK=G5=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFC84C433E0
	for <intel-gfx@archiver.kernel.org>; Tue, 26 Jan 2021 19:03:28 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42C07206CC
	for <intel-gfx@archiver.kernel.org>; Tue, 26 Jan 2021 19:03:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42C07206CC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D03C96E087;
	Tue, 26 Jan 2021 19:03:27 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E3E56E087
 for <intel-gfx@lists.freedesktop.org>; Tue, 26 Jan 2021 19:03:26 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 23707322-1500050 for multiple; Tue, 26 Jan 2021 19:03:11 +0000
MIME-Version: 1.0
In-Reply-To: <YBBO3uRy6802cL1A@jack.zhora.eu>
References: <20210120122205.2808-1-chris@chris-wilson.co.uk>
 <20210120122205.2808-7-chris@chris-wilson.co.uk>
 <YBBO3uRy6802cL1A@jack.zhora.eu>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Andi Shyti <andi@etezian.org>
Date: Tue, 26 Jan 2021 19:03:13 +0000
Message-ID: <161168779343.2943.11774194682935004005@build.alporthouse.com>
User-Agent: alot/0.9
Subject: Re: [Intel-gfx] [PATCH 07/10] drm/i915: Restructure priority
 inheritance
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

Quoting Andi Shyti (2021-01-26 17:18:22)
> Hi Chris,
> 
> > +             local_bh_disable();
> > +             i915_request_set_priority(rq, prio);
> > +             local_bh_enable();
> > +
> > +             i915_request_put(rq);
> > +             rq = ptr_mask_bits(rn, 1);
> 
> why are you using ptr_mask_bits here?
> 
> > +     } while (rq);
> > +}
> > +
> > +void i915_sched_init_ipi(struct i915_sched_ipi *ipi)
> > +{
> > +     INIT_WORK(&ipi->work, ipi_schedule);
> > +     ipi->list = NULL;
> > +}
> > +
> > +static void __ipi_add(struct i915_request *rq)
> > +{
> > +#define STUB ((struct i915_request *)1)
> > +     struct intel_engine_cs *engine = READ_ONCE(rq->engine);
> > +     struct i915_request *first;
> > +
> > +     if (!i915_request_get_rcu(rq))
> > +             return;
> > +
> > +     if (__i915_request_is_complete(rq) ||
> > +         cmpxchg(&rq->sched.ipi_link, NULL, STUB)) { /* already queued */
> > +             i915_request_put(rq);
> > +             return;
> > +     }
> > +
> > +     first = READ_ONCE(engine->execlists.ipi.list);
> > +     do
> > +             rq->sched.ipi_link = ptr_pack_bits(first, 1, 1);
> 
> ... and why ptr_pack_bits here?
> 
> do they make any difference?

We are using bit0 to differentiate against NULL. So we use the special
value of (void*)1 to mark when the elements is active, but pointing to
nothing.
-Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
