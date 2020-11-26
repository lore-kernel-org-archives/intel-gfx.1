Return-Path: <SRS0=GkMm=FA=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 454BBC56202
	for <intel-gfx@archiver.kernel.org>; Thu, 26 Nov 2020 19:12:37 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 860BB2087C
	for <intel-gfx@archiver.kernel.org>; Thu, 26 Nov 2020 19:12:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 860BB2087C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92E656E9D8;
	Thu, 26 Nov 2020 19:12:35 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2BC16E9D8
 for <Intel-gfx@lists.freedesktop.org>; Thu, 26 Nov 2020 19:12:33 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 23121507-1500050 for multiple; Thu, 26 Nov 2020 19:12:25 +0000
MIME-Version: 1.0
In-Reply-To: <3cce1f1c-4867-c478-0045-6af5864eb85d@linux.intel.com>
References: <20201126164703.1578226-1-tvrtko.ursulin@linux.intel.com>
 <160640980713.31673.2813856466109565459@build.alporthouse.com>
 <3cce1f1c-4867-c478-0045-6af5864eb85d@linux.intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Intel-gfx@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Date: Thu, 26 Nov 2020 19:12:24 +0000
Message-ID: <160641794490.19860.7293732904816766661@build.alporthouse.com>
User-Agent: alot/0.9
Subject: Re: [Intel-gfx] [PATCH] drm/i915/pmu: Deprecate I915_PMU_LAST and
 optimize state tracking
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

Quoting Tvrtko Ursulin (2020-11-26 18:58:20)
> 
> On 26/11/2020 16:56, Chris Wilson wrote:
> > Quoting Tvrtko Ursulin (2020-11-26 16:47:03)
> >> -static unsigned int config_enabled_bit(u64 config)
> >> +static unsigned int is_tracked_config(const u64 config)
> >>   {
> >> -       if (is_engine_config(config))
> >> +       unsigned int val;
> > 
> >> +/**
> >> + * Non-engine events that we need to track enabled-disabled transition and
> >> + * current state.
> >> + */
> > 
> > I'm not understanding what is_tracked_config() actually means and how
> > that becomes config_enabled_bit().
> > 
> > These look like the non-engine ones where we interact with HW during the
> > sample.
> > 
> > How do the events we define a bit for here differ from the "untracked"
> > events?
> 
> Tracked means i915 pmu needs to track enabled/disabled transitions and 
> state.
> 
> So far frequency and rc6 needs that, due sampling timer decisions and 
> park/unpark handling respectively.
> 
> Interrupts on the contrary don't need to do any of that. We can just 
> read the count at any given time.
> 
> Is_tracked_config() for convenience returns a "bit + 1", so 0 means 
> untracked.
> 
> Every tracked event needs a slot in pmu->enabled and pmu->enable_count. 
> The rest don't. Before this patch I had too many bits/array elements 
> reserved there.

So my confusion boils down to 'enabled' in config_enabled_bit.
To me that makes it seem like it is a state, as opposed to the bit to be
used to track that state. (I feel enabled <-> tracked is quite clunky.)

config_enable_bit() is better, but I think you can just drop the
'enabled' altogether to leave

static unsigned int config_bit(u64 config)
{
	if (is_engine_config(config))
		return engine_config_bit(config);

	if (is_tracked_config(config))
		return tracked_config_bit(config);

	return -1;
}

static u64 config_mask(u64 config)
{
        return BIT_ULL(config_bit(config));
}

static unsigned int event_bit(struct perf_event *event)
{
        return config_bit(event->attr.config);
}

unsigned int bit = event_bit(event);

Or if that is too much,
	config_sample_bit()
	config_sample_mask()
	event_sample_bit()
?
-Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
