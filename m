Return-Path: <SRS0=J6ZK=G5=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8F30C433E0
	for <intel-gfx@archiver.kernel.org>; Tue, 26 Jan 2021 21:17:13 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21304221EF
	for <intel-gfx@archiver.kernel.org>; Tue, 26 Jan 2021 21:17:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 21304221EF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A026389709;
	Tue, 26 Jan 2021 21:17:12 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C473989709
 for <intel-gfx@lists.freedesktop.org>; Tue, 26 Jan 2021 21:17:10 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 23708122-1500050 for multiple; Tue, 26 Jan 2021 21:16:54 +0000
MIME-Version: 1.0
In-Reply-To: <YBBZ8lbpS4QW49UX@jack.zhora.eu>
References: <20210120122205.2808-1-chris@chris-wilson.co.uk>
 <20210120122205.2808-8-chris@chris-wilson.co.uk>
 <YBBZ8lbpS4QW49UX@jack.zhora.eu>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Andi Shyti <andi@etezian.org>
Date: Tue, 26 Jan 2021 21:16:56 +0000
Message-ID: <161169581611.2943.4607460589670027944@build.alporthouse.com>
User-Agent: alot/0.9
Subject: Re: [Intel-gfx] [PATCH 08/10] drm/i915/selftests: Measure
 set-priority duration
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

Quoting Andi Shyti (2021-01-26 18:05:38)
> On Wed, Jan 20, 2021 at 12:22:03PM +0000, Chris Wilson wrote:
> > As a topological sort, we expect it to run in linear graph time,
> > O(V+E). In removing the recursion, it is no longer a DFS but rather a
> > BFS, and performs as O(VE). Let's demonstrate how bad this is with a few
> > examples, and build a few test cases to verify a potential fix.
> 
> very noble purpose, but...
> 
> [...]
> 
> > +static int sparse(struct drm_i915_private *i915,
> > +               bool (*fn)(struct i915_request *rq,
> > +                          unsigned long v, unsigned long e))
> > +{
> > +     return chains(i915, sparse_chain, fn);
> > +}
> 
> ... this is quite an intricate web of functions calling each
> other.
> 
> Is there any simplier way to do this? This is that kind of code
> that if you go on holiday for a few days you forget what you
> wrote.

This was to remove duplication, and there's more tests to come in this
group that use the same framework and only differ in the final step.

> I do need three drawing boards and 24 fingers for keeping track
> of what's happening here. :)
> 
> > +
> > +static void report(const char *what, unsigned long v, unsigned long e, u64 dt)
> > +{
> > +     pr_info("(%4lu, %7lu), %s:%10lluns\n", v, e, what, dt);
> > +}
> > +
> > +static u64 __set_priority(struct i915_request *rq, int prio)
> > +{
> > +     u64 dt;
> > +
> > +     preempt_disable();
> > +     dt = ktime_get_raw_fast_ns();
> > +     i915_request_set_priority(rq, prio);
> > +     dt = ktime_get_raw_fast_ns() - dt;
> > +     preempt_enable();
> > +
> > +     return dt;
> > +}
> > +
> > +static bool set_priority(struct i915_request *rq,
> > +                      unsigned long v, unsigned long e)
> > +{
> > +     report("set-priority", v, e, __set_priority(rq, I915_PRIORITY_BARRIER));
> 
> can't we pr_info directly here and spare a function?

It will be reused later.

> > +     return true;
> > +}
> > +
> > +static int single_priority(void *arg)
> > +{
> > +     return single(arg, set_priority);
> > +}
> > +
> > +static int wide_priority(void *arg)
> > +{
> > +     return wide(arg, set_priority);
> > +}
> > +
> > +static int inv_priority(void *arg)
> > +{
> > +     return inv(arg, set_priority);
> > +}
> > +
> > +static int sparse_priority(void *arg)
> > +{
> > +     return sparse(arg, set_priority);
> > +}
> > +
> > +int i915_scheduler_perf_selftests(struct drm_i915_private *i915)
> > +{
> > +     static const struct i915_subtest tests[] = {
> > +             SUBTEST(single_priority),
> > +             SUBTEST(wide_priority),
> > +             SUBTEST(inv_priority),
> > +             SUBTEST(sparse_priority),
> > +     };
> > +     static const struct {
> > +             const char *name;
> > +             size_t sz;
> > +     } types[] = {
> > +#define T(t) { #t, sizeof(struct t) }
> > +             T(i915_priolist),
> > +             T(i915_sched_attr),
> > +             T(i915_sched_node),
> > +#undef T
> 
> is this really making the code better? Is it a big deal to
> clearly use
> 
>                 { i915_priolist, sizeof(i915_priolist) },
>                 { i915_sched_attr, sizeof(i915_sched_attr) },
>                 { i915_sched_node, sizeof(i915_sched_node) },

Duplication and more typing, you even left out the struct in
sizeof(struct T) :)

Did this save me more time to add stuff than it took to write #define T?
-Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
