Return-Path: <SRS0=QgXV=DC=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C66DC4363D
	for <intel-gfx@archiver.kernel.org>; Fri, 25 Sep 2020 10:01:45 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BAC2520BED
	for <intel-gfx@archiver.kernel.org>; Fri, 25 Sep 2020 10:01:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BAC2520BED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDC266EC6B;
	Fri, 25 Sep 2020 10:01:43 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25C136EC6B
 for <intel-gfx@lists.freedesktop.org>; Fri, 25 Sep 2020 10:01:41 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 22533058-1500050 for multiple; Fri, 25 Sep 2020 11:01:38 +0100
MIME-Version: 1.0
In-Reply-To: <6be94225-9d54-0a4b-d1d0-d5b46d8b6fdb@linux.intel.com>
References: <20200916094219.3878-1-chris@chris-wilson.co.uk>
 <20200916094219.3878-3-chris@chris-wilson.co.uk>
 <6be94225-9d54-0a4b-d1d0-d5b46d8b6fdb@linux.intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Date: Fri, 25 Sep 2020 11:01:38 +0100
Message-ID: <160102809807.30248.12041152856672975142@build.alporthouse.com>
User-Agent: alot/0.9
Subject: Re: [Intel-gfx] [PATCH 3/4] drm/i915/gt: Always send a pulse down
 the engine after disabling heartbeat
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
Cc: stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Quoting Tvrtko Ursulin (2020-09-24 14:43:08)
> 
> On 16/09/2020 10:42, Chris Wilson wrote:
> > Currently, we check we can send a pulse prior to disabling the
> > heartbeat to verify that we can change the heartbeat, but since we may
> > re-evaluate execution upon changing the heartbeat interval we need another
> > pulse afterwards to refresh execution.
> > 
> > Fixes: 9a40bddd47ca ("drm/i915/gt: Expose heartbeat interval via sysfs")
> > Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> > Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> > Cc: <stable@vger.kernel.org> # v5.7+
> > ---
> >   drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c | 6 ++++--
> >   1 file changed, 4 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
> > index 8ffdf676c0a0..d09df370f7cd 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
> > @@ -192,10 +192,12 @@ int intel_engine_set_heartbeat(struct intel_engine_cs *engine,
> >       WRITE_ONCE(engine->props.heartbeat_interval_ms, delay);
> >   
> >       if (intel_engine_pm_get_if_awake(engine)) {
> > -             if (delay)
> > +             if (delay) {
> >                       intel_engine_unpark_heartbeat(engine);
> > -             else
> > +             } else {
> >                       intel_engine_park_heartbeat(engine);
> > +                     intel_engine_pulse(engine); /* recheck execution */
> > +             }
> >               intel_engine_pm_put(engine);
> >       }
> >   
> > 
> 
> I did not immediately get this one. Do we really need two pulses or 
> maybe we could re-order the code a bit and just undo the heartbeat park 
> if pulse after parking did not work?

We use the first pulse to determine if it's legal for the parameter to
be changed (checking we support the preemptive pulse to remove
non-persistent contexts). Then the second pulse after changing the
parameter to flush the changes through.

I like checking for support before making the change, although we could
try and fixup after failure, there would still be a window where the
change would be visible to the system. We don't need to use the pulse per
se for that check, that's pure convenience as it performs the checking
already.
-Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
