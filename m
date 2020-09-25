Return-Path: <SRS0=QgXV=DC=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 704BBC4363D
	for <intel-gfx@archiver.kernel.org>; Fri, 25 Sep 2020 10:05:13 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E025120BED
	for <intel-gfx@archiver.kernel.org>; Fri, 25 Sep 2020 10:05:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E025120BED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 582EB6EC6D;
	Fri, 25 Sep 2020 10:05:12 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99BFD6EC6D
 for <intel-gfx@lists.freedesktop.org>; Fri, 25 Sep 2020 10:05:10 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 22533138-1500050 for multiple; Fri, 25 Sep 2020 11:05:07 +0100
MIME-Version: 1.0
In-Reply-To: <e665fc1d-1b9d-a6ee-1798-df32d1296118@linux.intel.com>
References: <20200916094219.3878-1-chris@chris-wilson.co.uk>
 <20200916094219.3878-4-chris@chris-wilson.co.uk>
 <e665fc1d-1b9d-a6ee-1798-df32d1296118@linux.intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Date: Fri, 25 Sep 2020 11:05:06 +0100
Message-ID: <160102830667.30248.7803662790481339170@build.alporthouse.com>
User-Agent: alot/0.9
Subject: Re: [Intel-gfx] [PATCH 4/4] drm/i915/gem: Always test execution
 status on closing the context
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

Quoting Tvrtko Ursulin (2020-09-24 15:26:56)
> 
> On 16/09/2020 10:42, Chris Wilson wrote:
> > Verify that if a context is active at the time it is closed, that it is
> > either persistent and preemptible (with hangcheck running) or it shall
> > be removed from execution.
> > 
> > Fixes: 9a40bddd47ca ("drm/i915/gt: Expose heartbeat interval via sysfs")
> > Testcase: igt/gem_ctx_persistence/heartbeat-close
> > Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> > Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> > Cc: <stable@vger.kernel.org> # v5.7+
> > ---
> >   drivers/gpu/drm/i915/gem/i915_gem_context.c | 48 +++++----------------
> >   1 file changed, 10 insertions(+), 38 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > index a548626fa8bc..4fd38101bb56 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > @@ -390,24 +390,6 @@ __context_engines_static(const struct i915_gem_context *ctx)
> >       return rcu_dereference_protected(ctx->engines, true);
> >   }
> >   
> > -static bool __reset_engine(struct intel_engine_cs *engine)
> > -{
> > -     struct intel_gt *gt = engine->gt;
> > -     bool success = false;
> > -
> > -     if (!intel_has_reset_engine(gt))
> > -             return false;
> > -
> > -     if (!test_and_set_bit(I915_RESET_ENGINE + engine->id,
> > -                           &gt->reset.flags)) {
> > -             success = intel_engine_reset(engine, NULL) == 0;
> > -             clear_and_wake_up_bit(I915_RESET_ENGINE + engine->id,
> > -                                   &gt->reset.flags);
> > -     }
> > -
> > -     return success;
> > -}
> > -
> >   static void __reset_context(struct i915_gem_context *ctx,
> >                           struct intel_engine_cs *engine)
> >   {
> > @@ -431,12 +413,7 @@ static bool __cancel_engine(struct intel_engine_cs *engine)
> >        * kill the banned context, we fallback to doing a local reset
> >        * instead.
> >        */
> > -     if (IS_ACTIVE(CONFIG_DRM_I915_PREEMPT_TIMEOUT) &&
> > -         !intel_engine_pulse(engine))
> > -             return true;
> > -
> > -     /* If we are unable to send a pulse, try resetting this engine. */
> > -     return __reset_engine(engine);
> > +     return intel_engine_pulse(engine) == 0;
> 
> Where is the path now which actually resets the currently running 
> workload (engine) of a non-persistent context? Pulse will be sent and 
> then rely on hangcheck but otherwise let it run?

If the pulse fails, we just call intel_handle_error() on the engine. On
looking at this code again, I could not justify the open-coding of the
engine reset fragment of the general error handler, especially as we end
up taking that route anyway for device resets. (Unlike inside the
tasklet, there's no atomicity concerns on this engine-reset path.)
-Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
