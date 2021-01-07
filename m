Return-Path: <SRS0=BkXb=GK=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68033C433E0
	for <intel-gfx@archiver.kernel.org>; Thu,  7 Jan 2021 12:53:03 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1ABB52336D
	for <intel-gfx@archiver.kernel.org>; Thu,  7 Jan 2021 12:53:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1ABB52336D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ECD96E47E;
	Thu,  7 Jan 2021 12:53:02 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0165A6E479
 for <intel-gfx@lists.freedesktop.org>; Thu,  7 Jan 2021 12:53:00 +0000 (UTC)
IronPort-SDR: IK7EPQDznEQJKWRVseCR6xkTynd2yWpFfIi4yhFXH65+BqMxOhJbUkjUzn2a19IaKvFBmNDDZw
 3JEYJlmnr+ag==
X-IronPort-AV: E=McAfee;i="6000,8403,9856"; a="241494244"
X-IronPort-AV: E=Sophos;i="5.79,329,1602572400"; d="scan'208";a="241494244"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2021 04:52:59 -0800
IronPort-SDR: 16OemYmr7ixIRzyL3ApI2pjHNmULdxmJuFls+kCMcKCATe/obrejysmEr4KmJVZwVXYaJmygQs
 cvOq+j/hie/A==
X-IronPort-AV: E=Sophos;i="5.79,329,1602572400"; d="scan'208";a="379705051"
Received: from obenha-mobl2.ger.corp.intel.com (HELO [10.252.62.192])
 ([10.252.62.192])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2021 04:52:59 -0800
To: Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org
References: <20210106123939.18435-1-chris@chris-wilson.co.uk>
 <20210106123939.18435-4-chris@chris-wilson.co.uk>
 <0ed63aeb-d58e-5ec6-2072-65d17be612dc@linux.intel.com>
 <160994932055.14894.15675793524963876311@build.alporthouse.com>
 <cf61d2c2-c0c0-5eca-94b5-33cbd8e4ab26@linux.intel.com>
 <161001527216.839.6103658487962243749@build.alporthouse.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <36631db0-fb45-12b2-e20f-8531939821e6@linux.intel.com>
Date: Thu, 7 Jan 2021 12:52:55 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <161001527216.839.6103658487962243749@build.alporthouse.com>
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH 4/4] drm/i915/gt: Remove timeslice
 suppression
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>


On 07/01/2021 10:27, Chris Wilson wrote:
> Quoting Tvrtko Ursulin (2021-01-07 10:16:57)
>>
>> On 06/01/2021 16:08, Chris Wilson wrote:
>>> Quoting Tvrtko Ursulin (2021-01-06 15:57:49)
>>
>> [snip]
>>
>>>>> @@ -1363,16 +1336,16 @@ static void execlists_dequeue(struct intel_engine_cs *engine)
>>>>>                         __unwind_incomplete_requests(engine);
>>>>>     
>>>>>                         last = NULL;
>>>>> -             } else if (need_timeslice(engine, last) &&
>>>>> -                        timeslice_expired(execlists, last)) {
>>>>> +             } else if (timeslice_expired(engine, last)) {
>>>>>                         ENGINE_TRACE(engine,
>>>>> -                                  "expired last=%llx:%lld, prio=%d, hint=%d, yield?=%s\n",
>>>>> -                                  last->fence.context,
>>>>> -                                  last->fence.seqno,
>>>>> -                                  last->sched.attr.priority,
>>>>> +                                  "expired:%s last=%llx:%lld, prio=%d, hint=%d, yield?=%s\n",
>>>>> +                                  yesno(timer_expired(&execlists->timer)),
>>>>> +                                  last->fence.context, last->fence.seqno,
>>>>> +                                  rq_prio(last),
>>>>>                                      execlists->queue_priority_hint,
>>>>>                                      yesno(timeslice_yield(execlists, last)));
>>>>>     
>>>>> +                     cancel_timer(&execlists->timer);
>>>>
>>>> What is this cancel for?
>>>
>>> This branch is taken upon yielding the timeslice, but we may not submit
>>> a new pair of contexts, leaving the timer active (and marked as
>>> expired). Since the timer remains expired, we will continuously looped
>>> until a context switch, or some other preemption event.
>>
>> Sorry I was looking at the cancel_timer in process_csb and ended up
>> replying at the wrong spot. The situation there seems to be removing the
>> single timeslice related call (set_timeslice) and adding a cancel_timer
>> which is also not obvious to me what it is about.
> 
> Yes, there the cancel_timer() is equivalent to the old set_timeslice().
> 
> After processing an event, we assume it is a change in context meriting
> a new timeslice. To start a new timeslice rather than continue the old
> one, we remove an existing timer and readd it for the end of the
> timeslice.

I was looking what is the resulting symmetry of start/cancel call sites. 
We end up with a single start_timeslice call from the tasklet, but 
guarded with !pending. That looked confusing at first until I remembered 
you mentioned (or a comment somewhere already says) that the idea is to 
only start the timeslice after the csb ack.

That explains the transition from timer disabled to timer enabled.

Then as long as there are contexts queued code relies on timeslice 
expiry, or re-submission with change, to temporarily suspend the timer.

It looks okay as far as I can see. Will tag the latest.

Regards,

Tvrtko

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
