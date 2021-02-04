Return-Path: <SRS0=bw6s=HG=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F391C433E0
	for <intel-gfx@archiver.kernel.org>; Thu,  4 Feb 2021 16:11:43 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B38164F46
	for <intel-gfx@archiver.kernel.org>; Thu,  4 Feb 2021 16:11:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B38164F46
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E7CC6E0AF;
	Thu,  4 Feb 2021 16:11:41 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D49A56E0AF
 for <intel-gfx@lists.freedesktop.org>; Thu,  4 Feb 2021 16:11:39 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.69.177; 
Received: from localhost (unverified [78.156.69.177]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 23788772-1500050 for multiple; Thu, 04 Feb 2021 16:11:37 +0000
MIME-Version: 1.0
In-Reply-To: <f46141bd-5ec2-5b7a-5ab0-e6ce0b5baec8@linux.intel.com>
References: <20210201085715.27435-1-chris@chris-wilson.co.uk>
 <20210201085715.27435-30-chris@chris-wilson.co.uk>
 <f46141bd-5ec2-5b7a-5ab0-e6ce0b5baec8@linux.intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Date: Thu, 04 Feb 2021 16:11:35 +0000
Message-ID: <161245509589.3075.11559724927083884362@build.alporthouse.com>
User-Agent: alot/0.9
Subject: Re: [Intel-gfx] [PATCH 30/57] drm/i915: Move timeslicing flag to
 scheduler
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

Quoting Tvrtko Ursulin (2021-02-04 15:18:31)
> 
> On 01/02/2021 08:56, Chris Wilson wrote:
> > Whether a scheduler chooses to implement timeslicing is up to it, and
> > not an underlying property of the HW engine. The scheduler does depend
> > on the HW supporting preemption.
> 
> Therefore, continuing on the comment I made in the previous patch, if we 
> had a helper with which engine would request scheduling (setting the 
> tasklet), if it passed in a pointer to itself, scheduler would then be 
> able to inspect if the engine supports preemption and so set its own 
> internal flag. Makes sense? It would require something like:

Actually not keen on pushing the inspection into the core scheduler and
would rather have the backend turn it on for itself. Because it's not
just about the engine supporting preemption, it's about whether or not
the backend wants to bother implement timeslicing itself.

If we skip to the end, it looks like this for execlists:

        i915_sched_init(&el->sched, i915->drm.dev,
                        engine->name, engine->mask,
                        &execlists_ops, engine);

        if (IS_ACTIVE(CONFIG_DRM_I915_TIMESLICE_DURATION) &&
            intel_engine_has_preemption(engine))
                __set_bit(I915_SCHED_TIMESLICE_BIT, &el->sched.flags);

        if (intel_engine_has_preemption(engine)) {
                __set_bit(I915_SCHED_BUSYWAIT_BIT, &el->sched.flags);
                __set_bit(I915_SCHED_PREEMPT_RESET_BIT, &el->sched.flags);
        }

with the virtual scheduler:

        ve->base.sched =
                i915_sched_create(ve->base.i915->drm.dev,
                                  ve->base.name,
                                  ve->base.mask,
                                  &virtual_ops, ve);
        if (!ve->base.sched) {
                err = -ENOMEM;
                goto err_put;
        }

        ve->base.sched->flags |= sched; /* override submission method */

I think the virtual scheduler suggests that we can't rely on the
scheduler core to dtrt by itself. And if you are still awake by the time
we get to this point, how to avoid ve->base.sched->flags |= sched are
welcome.
-Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
