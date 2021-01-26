Return-Path: <SRS0=J6ZK=G5=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A782AC433DB
	for <intel-gfx@archiver.kernel.org>; Tue, 26 Jan 2021 09:40:28 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B30B22242
	for <intel-gfx@archiver.kernel.org>; Tue, 26 Jan 2021 09:40:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B30B22242
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F85589F27;
	Tue, 26 Jan 2021 09:40:27 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF82089F27
 for <intel-gfx@lists.freedesktop.org>; Tue, 26 Jan 2021 09:40:25 +0000 (UTC)
IronPort-SDR: TLwG1L5ltXxhRgOUMluFqMM/An+yXGw/YLuy6aO7PTJkPqV2TDd21+lQbAUSeWTop4wSKZKSXN
 p5y6wiDJjLZQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9875"; a="198661348"
X-IronPort-AV: E=Sophos;i="5.79,375,1602572400"; d="scan'208";a="198661348"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2021 01:40:23 -0800
IronPort-SDR: WYPIvZRjJQeJbM968tM4dBxSqUK/ldyo9pC5yCTKa+08lketiFPaMWtCdPFZGJUJYlcWmfk9yr
 1KObJ6Wk0oLA==
X-IronPort-AV: E=Sophos;i="5.79,375,1602572400"; d="scan'208";a="361923931"
Received: from jackedwa-mobl.ger.corp.intel.com (HELO [10.214.230.137])
 ([10.214.230.137])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2021 01:40:19 -0800
To: Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org
References: <20210125140136.10494-1-chris@chris-wilson.co.uk>
 <20210125140136.10494-4-chris@chris-wilson.co.uk>
 <9b91423b-ad4f-7381-824f-a47d6758ae4a@linux.intel.com>
 <161161066105.29150.1732962919103079139@build.alporthouse.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <c7c36611-1b66-193e-0139-db7ac283d978@linux.intel.com>
Date: Tue, 26 Jan 2021 09:40:17 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <161161066105.29150.1732962919103079139@build.alporthouse.com>
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH 04/41] drm/i915: Teach the i915_dependency
 to use a double-lock
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
Cc: thomas.hellstrom@intel.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>


On 25/01/2021 21:37, Chris Wilson wrote:
> Quoting Tvrtko Ursulin (2021-01-25 15:34:53)
>>
>> On 25/01/2021 14:00, Chris Wilson wrote:
>>> @@ -390,24 +410,27 @@ bool __i915_sched_node_add_dependency(struct i915_sched_node *node,
>>>    {
>>>        bool ret = false;
>>>    
>>> -     spin_lock_irq(&schedule_lock);
>>> +     /* The signal->lock is always the outer lock in this double-lock. */
>>> +     spin_lock(&signal->lock);
>>>    
>>>        if (!node_signaled(signal)) {
>>>                INIT_LIST_HEAD(&dep->dfs_link);
>>>                dep->signaler = signal;
>>> -             dep->waiter = node;
>>> +             dep->waiter = node_get(node);
>>>                dep->flags = flags;
>>>    
>>>                /* All set, now publish. Beware the lockless walkers. */
>>> +             spin_lock_nested(&node->lock, SINGLE_DEPTH_NESTING);
>>>                list_add_rcu(&dep->signal_link, &node->signalers_list);
>>>                list_add_rcu(&dep->wait_link, &signal->waiters_list);
>>> +             spin_unlock(&node->lock);
>>>    
>>>                /* Propagate the chains */
>>>                node->flags |= signal->flags;
>>>                ret = true;
>>>        }
>>>    
>>> -     spin_unlock_irq(&schedule_lock);
>>> +     spin_unlock(&signal->lock);
>>
>> So we have to be sure another entry point cannot try to lock the same
>> nodes in reverse, that is with reversed roles. Situation where nodes are
>> simultaneously both each other waiters and signalers does indeed sound
>> impossible so I think this is fine.
>>
>> Only if some entry point would lock something which is a waiter, and
>> then went to boost the priority of a signaler. That is still one with a
>> global lock. So the benefit of this patch is just to reduce contention
>> between adding and re-scheduling?
> 
> We remove the global schedule_lock in the next patch. This patch tackles
> the "simpler" list management by noting that the chains can always be
> taken in order of (signaler, waiter) so we have strict nesting for a
> local double lock.
> 
>> And __i915_schedule does walk the list of signalers without holding this
>> new lock. What is the safety net there? RCU? Do we need
>> list_for_each_entry_rcu and explicit rcu_read_(un)lock in there then?
> 
> Yes, we are already supposedly RCU safe for the list of signalers, as
> we've been depending on that for a while.
> 
> #define for_each_signaler(p__, rq__) \
>          list_for_each_entry_rcu(p__, \
>                                  &(rq__)->sched.signalers_list, \
>                                  signal_link)

Yeah its fine, I wasn't seeing it's for_each_signaler but for some 
reason confused it with list_for_each_entry elsewhere in the function.

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
