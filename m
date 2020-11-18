Return-Path: <SRS0=edJA=EY=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E62E7C63777
	for <intel-gfx@archiver.kernel.org>; Wed, 18 Nov 2020 11:38:49 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8486D20B80
	for <intel-gfx@archiver.kernel.org>; Wed, 18 Nov 2020 11:38:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8486D20B80
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B66C46E3F5;
	Wed, 18 Nov 2020 11:38:48 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E27966E3F5
 for <intel-gfx@lists.freedesktop.org>; Wed, 18 Nov 2020 11:38:46 +0000 (UTC)
IronPort-SDR: ragpwL9kGxpDF87EabKX92BnPPqQKFyUqxOe99NhFsJM5kBSj+wgzsmqWW3jkl0uMJsBsbAlNz
 sL519uVfLCvw==
X-IronPort-AV: E=McAfee;i="6000,8403,9808"; a="150948398"
X-IronPort-AV: E=Sophos;i="5.77,486,1596524400"; d="scan'208";a="150948398"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2020 03:38:46 -0800
IronPort-SDR: 7fk/PxkLE+D9XPpvQ6a+43cslaMgL3mlVkxbUpkBO5+T8WTgSK8NgyxLbVojFd5xQDP8Y7TOAd
 Op8bbFUJrphw==
X-IronPort-AV: E=Sophos;i="5.77,486,1596524400"; d="scan'208";a="544481569"
Received: from shaid-mobl.ger.corp.intel.com (HELO [10.255.202.56])
 ([10.255.202.56])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2020 03:38:45 -0800
To: Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org
References: <20201117113103.21480-1-chris@chris-wilson.co.uk>
 <20201117113103.21480-14-chris@chris-wilson.co.uk>
 <86cb67d0-ac39-7f83-8ff8-eed3ef7c5943@linux.intel.com>
 <160569868396.3553.1145860250763004021@build.alporthouse.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <ea07e30a-8972-d06b-8d97-f5e7e4228eae@linux.intel.com>
Date: Wed, 18 Nov 2020 11:38:43 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <160569868396.3553.1145860250763004021@build.alporthouse.com>
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH 14/28] drm/i915/gt: Free stale request on
 destroying the virtual engine
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


On 18/11/2020 11:24, Chris Wilson wrote:
> Quoting Tvrtko Ursulin (2020-11-18 11:05:24)
>>
>> On 17/11/2020 11:30, Chris Wilson wrote:
>>> Since preempt-to-busy, we may unsubmit a request while it is still on
>>> the HW and completes asynchronously. That means it may be retired and in
>>> the process destroy the virtual engine (as the user has closed their
>>> context), but that engine may still be holding onto the unsubmitted
>>> compelted request. Therefore we need to potentially cleanup the old
>>> request on destroying the virtual engine. We also have to keep the
>>> virtual_engine alive until after the sibling's execlists_dequeue() have
>>> finished peeking into the virtual engines, for which we serialise with
>>> RCU.
>>>
>>> v2: Be paranoid and flush the tasklet as well.
>>> v3: And flush the tasklet before the engines, as the tasklet may
>>> re-attach an rb_node after our removal from the siblings.
>>>
>>> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
>>> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>> ---
>>>    drivers/gpu/drm/i915/gt/intel_lrc.c | 61 +++++++++++++++++++++++++----
>>>    1 file changed, 54 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
>>> index 17cb7060eb29..c11433884cf6 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_lrc.c
>>> +++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
>>> @@ -182,6 +182,7 @@
>>>    struct virtual_engine {
>>>        struct intel_engine_cs base;
>>>        struct intel_context context;
>>> +     struct rcu_work rcu;
>>>    
>>>        /*
>>>         * We allow only a single request through the virtual engine at a time
>>> @@ -5470,44 +5471,90 @@ static struct list_head *virtual_queue(struct virtual_engine *ve)
>>>        return &ve->base.execlists.default_priolist.requests[0];
>>>    }
>>>    
>>> -static void virtual_context_destroy(struct kref *kref)
>>> +static void rcu_virtual_context_destroy(struct work_struct *wrk)
>>>    {
>>>        struct virtual_engine *ve =
>>> -             container_of(kref, typeof(*ve), context.ref);
>>> +             container_of(wrk, typeof(*ve), rcu.work);
>>>        unsigned int n;
>>>    
>>> -     GEM_BUG_ON(!list_empty(virtual_queue(ve)));
>>> -     GEM_BUG_ON(ve->request);
>>>        GEM_BUG_ON(ve->context.inflight);
>>>    
>>> +     /* Preempt-to-busy may leave a stale request behind. */
>>> +     if (unlikely(ve->request)) {
>>> +             struct i915_request *old;
>>> +
>>> +             spin_lock_irq(&ve->base.active.lock);
>>> +
>>> +             old = fetch_and_zero(&ve->request);
>>> +             if (old) {
>>> +                     GEM_BUG_ON(!i915_request_completed(old));
>>> +                     __i915_request_submit(old);
>>> +                     i915_request_put(old);
>>> +             }
>>> +
>>> +             spin_unlock_irq(&ve->base.active.lock);
>>> +     }
>>> +
>>> +     /*
>>> +      * Flush the tasklet in case it is still running on another core.
>>> +      *
>>> +      * This needs to be done before we remove ourselves from the siblings'
>>> +      * rbtrees as in the case it is running in parallel, it may reinsert
>>> +      * the rb_node into a sibling.
>>> +      */
>>> +     tasklet_kill(&ve->base.execlists.tasklet);
>>
>> Can it still be running after an RCU period?
> 
> I think there is a window between checking to see if the request is
> completed and kicking the tasklet, that is not under the rcu lock and
> opportunity for the request to be retired, and barrier flushed to drop
> the context references.

 From where would that check come?

> I observed the leaked ve->request, but the tasklet_kill, iirc, is
> speculation about possible windows. Admittedly all long test runs have
> been with this patch in place for most of the last year.
> 
>>> +     /* Decouple ourselves from the siblings, no more access allowed. */
>>>        for (n = 0; n < ve->num_siblings; n++) {
>>>                struct intel_engine_cs *sibling = ve->siblings[n];
>>>                struct rb_node *node = &ve->nodes[sibling->id].rb;
>>> -             unsigned long flags;
>>>    
>>>                if (RB_EMPTY_NODE(node))
>>>                        continue;
>>>    
>>> -             spin_lock_irqsave(&sibling->active.lock, flags);
>>> +             spin_lock_irq(&sibling->active.lock);
>>>    
>>>                /* Detachment is lazily performed in the execlists tasklet */
>>>                if (!RB_EMPTY_NODE(node))
>>>                        rb_erase_cached(node, &sibling->execlists.virtual);
>>>    
>>> -             spin_unlock_irqrestore(&sibling->active.lock, flags);
>>> +             spin_unlock_irq(&sibling->active.lock);
>>>        }
>>>        GEM_BUG_ON(__tasklet_is_scheduled(&ve->base.execlists.tasklet));
>>> +     GEM_BUG_ON(!list_empty(virtual_queue(ve)));
>>>    
>>>        if (ve->context.state)
>>>                __execlists_context_fini(&ve->context);
>>>        intel_context_fini(&ve->context);
>>>    
>>>        intel_engine_free_request_pool(&ve->base);
>>> +     intel_breadcrumbs_free(ve->base.breadcrumbs);
>>
>> This looks to belong to some other patch.
> 
> Some might say I was fixing up an earlier oversight.

Separate patch would be good, with Fixes: probably since it is a memory 
leak and one liner.

Regards,

Tvrtko
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
