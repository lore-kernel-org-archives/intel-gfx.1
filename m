Return-Path: <SRS0=bte8=MW=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 455DCC4338F
	for <intel-gfx@archiver.kernel.org>; Fri, 30 Jul 2021 18:06:15 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 016B260295
	for <intel-gfx@archiver.kernel.org>; Fri, 30 Jul 2021 18:06:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 016B260295
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34DBF6E437;
	Fri, 30 Jul 2021 18:06:14 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB3B16E431;
 Fri, 30 Jul 2021 18:06:12 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10061"; a="210030346"
X-IronPort-AV: E=Sophos;i="5.84,282,1620716400"; d="scan'208";a="210030346"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2021 11:06:11 -0700
X-IronPort-AV: E=Sophos;i="5.84,282,1620716400"; d="scan'208";a="439120557"
Received: from dut151-iclu.fm.intel.com ([10.105.23.43])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2021 11:06:10 -0700
Date: Fri, 30 Jul 2021 18:06:09 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Message-ID: <20210730180609.GA60763@DUT151-ICLU.fm.intel.com>
References: <20210727182057.78409-1-matthew.brost@intel.com>
 <20210727182057.78409-2-matthew.brost@intel.com>
 <9095b26a-975b-9180-045f-7231d63fe9ff@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9095b26a-975b-9180-045f-7231d63fe9ff@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH i-g-t 1/1] i915/gem_scheduler: Ensure
 submission order in manycontexts
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
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Fri, Jul 30, 2021 at 10:58:38AM +0100, Tvrtko Ursulin wrote:
> 
> On 27/07/2021 19:20, Matthew Brost wrote:
> > With GuC submission contexts can get reordered (compared to submission
> > order), if contexts get reordered the sequential nature of the batches
> > releasing the next batch's semaphore in function timesliceN() get broken
> > resulting in the test taking much longer than if should. e.g. Every
> > contexts needs to be timesliced to release the next batch. Corking the
> > first submission until all the batches have been submitted should ensure
> > submission order.
> 
> The explanation sounds suspect.
> 
> Consider this comment from the test itself:
> 
> 	/*
> 	 * Create a pair of interlocking batches, that ping pong
> 	 * between each other, and only advance one step at a time.
> 	 * We require the kernel to preempt at each semaphore and
> 	 * switch to the other batch in order to advance.
> 	 */
> 
> I'd say the test does not rely on no re-ordering at all, but relies on
> context switch on an unsatisfied semaphore.
>

Yes, let do a simple example with 5 batches. Batch 0 releases batch's
semaphore 1, batch 1 releases batch's 2 semaphore, etc... If the batches
are seen in order the test should take 40 timeslices (8 semaphores in
each batch have to be released).

If the batches are in the below order:
0 2 1 3 4

Now we have 72 timeslices. Now imagine with 67 batches completely out of
order, the number timeslices can explode.

> In the commit you seem to acknowledge GuC does not do that but instead ends
> up waiting for the timeslice to expire, did I get that right? If so, why

I think GuC waits for the timeslice to expire if a semaphore is
unsatisfied, I have to double check on that. I thought that was what
execlists were doing too but I now see it has a convoluted algorithm to
yield the timeslice if subsequent request comes in and the ring is
waiting on a timeslice. Let me check with GuC team and see if they can
/ are doing something similiar. I was thinking the only to switch a
sempahore was clear CTX_CTRL_INHIBIT_SYN_CTX_SWITCH but that appears to
be incorrect.

For what is worth, after this change the run times of test are pretty
similar for execlists & GuC on TGL.

Matt

> does the GuC does not do that and can we fix it?
> 
> Regards,
> 
> Tvrtko
> 
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   tests/i915/gem_exec_schedule.c | 16 +++++++++++++++-
> >   1 file changed, 15 insertions(+), 1 deletion(-)
> > 
> > diff --git a/tests/i915/gem_exec_schedule.c b/tests/i915/gem_exec_schedule.c
> > index f03842478..41f2591a5 100644
> > --- a/tests/i915/gem_exec_schedule.c
> > +++ b/tests/i915/gem_exec_schedule.c
> > @@ -597,12 +597,13 @@ static void timesliceN(int i915, const intel_ctx_cfg_t *cfg,
> >   	struct drm_i915_gem_execbuffer2 execbuf  = {
> >   		.buffers_ptr = to_user_pointer(&obj),
> >   		.buffer_count = 1,
> > -		.flags = engine | I915_EXEC_FENCE_OUT,
> > +		.flags = engine | I915_EXEC_FENCE_OUT | I915_EXEC_FENCE_SUBMIT,
> >   	};
> >   	uint32_t *result =
> >   		gem_mmap__device_coherent(i915, obj.handle, 0, sz, PROT_READ);
> >   	const intel_ctx_t *ctx;
> >   	int fence[count];
> > +	IGT_CORK_FENCE(cork);
> >   	/*
> >   	 * Create a pair of interlocking batches, that ping pong
> > @@ -614,6 +615,17 @@ static void timesliceN(int i915, const intel_ctx_cfg_t *cfg,
> >   	igt_require(gem_scheduler_has_timeslicing(i915));
> >   	igt_require(intel_gen(intel_get_drm_devid(i915)) >= 8);
> > +	/*
> > +	 * With GuC submission contexts can get reordered (compared to
> > +	 * submission order), if contexts get reordered the sequential
> > +	 * nature of the batches releasing the next batch's semaphore gets
> > +	 * broken resulting in the test taking much longer than it should (e.g.
> > +	 * every context needs to be timesliced to release the next batch).
> > +	 * Corking the first submission until all batches have been
> > +	 * submitted should ensure submission order.
> > +	 */
> > +	execbuf.rsvd2 = igt_cork_plug(&cork, i915);
> > +
> >   	/* No coupling between requests; free to timeslice */
> >   	for (int i = 0; i < count; i++) {
> > @@ -624,8 +636,10 @@ static void timesliceN(int i915, const intel_ctx_cfg_t *cfg,
> >   		intel_ctx_destroy(i915, ctx);
> >   		fence[i] = execbuf.rsvd2 >> 32;
> > +		execbuf.rsvd2 >>= 32;
> >   	}
> > +	igt_cork_unplug(&cork);
> >   	gem_sync(i915, obj.handle);
> >   	gem_close(i915, obj.handle);
> > 
