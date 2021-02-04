Return-Path: <SRS0=bw6s=HG=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0214C433DB
	for <intel-gfx@archiver.kernel.org>; Thu,  4 Feb 2021 13:02:54 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C6E664E34
	for <intel-gfx@archiver.kernel.org>; Thu,  4 Feb 2021 13:02:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C6E664E34
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F01C6E071;
	Thu,  4 Feb 2021 13:02:53 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D401F6E071
 for <intel-gfx@lists.freedesktop.org>; Thu,  4 Feb 2021 13:02:51 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.69.177; 
Received: from localhost (unverified [78.156.69.177]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 23786556-1500050 for multiple; Thu, 04 Feb 2021 13:02:49 +0000
MIME-Version: 1.0
In-Reply-To: <87zh0kt2gl.fsf@gaia.fi.intel.com>
References: <20210204110620.32422-1-chris@chris-wilson.co.uk>
 <20210204110620.32422-2-chris@chris-wilson.co.uk>
 <87zh0kt2gl.fsf@gaia.fi.intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Date: Thu, 04 Feb 2021 13:02:48 +0000
Message-ID: <161244376810.3075.13392322799908904944@build.alporthouse.com>
User-Agent: alot/0.9
Subject: Re: [Intel-gfx] [PATCH v3 2/3] drm/i915/gt: Double check heartbeat
 timeout before resetting
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

Quoting Mika Kuoppala (2021-02-04 12:57:46)
> Chris Wilson <chris@chris-wilson.co.uk> writes:
> 
> > Check that we have actually passed the heartbeat interval since last
> > checking the request before resetting the device.
> >
> > Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/2780
> > Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> > ---
> >  drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c | 11 ++++++++++-
> >  1 file changed, 10 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
> > index 48a91c0dbad6..93741a65924a 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
> > @@ -31,7 +31,7 @@ static bool next_heartbeat(struct intel_engine_cs *engine)
> >       delay = msecs_to_jiffies_timeout(delay);
> >       if (delay >= HZ)
> >               delay = round_jiffies_up_relative(delay);
> > -     mod_delayed_work(system_highpri_wq, &engine->heartbeat.work, delay);
> > +     mod_delayed_work(system_highpri_wq, &engine->heartbeat.work, delay + 1);
> >  
> >       return true;
> >  }
> > @@ -103,6 +103,13 @@ static void heartbeat(struct work_struct *wrk)
> >               goto out;
> >  
> >       if (engine->heartbeat.systole) {
> > +             long delay = READ_ONCE(engine->props.heartbeat_interval_ms);
> > +
> > +             /* Safeguard against too-fast worker invocations */
> > +             if (!time_after(jiffies,
> > +                             rq->emitted_jiffies + msecs_to_jiffies(delay)))
> > +                     goto out;
> > +
> >               if (!i915_sw_fence_signaled(&rq->submit)) {
> >                       /*
> >                        * Not yet submitted, system is stalled.
> > @@ -139,6 +146,8 @@ static void heartbeat(struct work_struct *wrk)
> >                                             "stopped heartbeat on %s",
> >                                             engine->name);
> >               }
> > +
> > +             rq->emitted_jiffies = jiffies;
> 
> Would possibly interfere with throttle. But who would get handle to
> internal request.

Indeed. And it changes the meaning of the pretty printing in the debug
message, but I can live with that.
-Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
