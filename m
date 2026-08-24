Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79C59C5DF81
	for <intel-gfx@archiver.kernel.org>; Mon, 24 Aug 2026 08:42:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F394510E0D6;
	Mon, 24 Aug 2026 08:42:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="IyL3MbZw";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B4AA10E0D6
 for <intel-gfx@lists.freedesktop.org>; Mon, 24 Aug 2026 08:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1787560956;
 bh=vEhnwv/38vYxFyL0JNlZziQ8IisSZnrRiTuYI3n5knc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=IyL3MbZwRqkcS5vYKckCZwdsEhmc3zISdh+zWDUh+5NR0H4NXCPqdQ4R7/ueTJpJC
 kPsb5+VQzPmicPkuZ/wJGZC3vU8Fbof9aa7v1ojDZz9iN50oCf9OJgdNxAc+PcRaNo
 AhWuGJLc23abeH7HMpn+tEhtkwNddcGknLoVVjYJttNyA7jM758A/2lpi9zoJFfybn
 s7vdpd8LTUU8wKy6aIqE1keVmRp/Kyv9rBH8ZFeeFRPmt29qYe3RiMlgnofdAq3tVh
 zTfCaC1PYum0QtUsBPXeeKs3T2v1dsmvSqlJiw08lfTLukSiGm27tTqvZhr11nExm8
 uPOJ3Y4rOTMZA==
Message-ID: <5d715d3e-5b50-4d4f-a313-d79e243d9bce@lankhorst.se>
Date: Mon, 24 Aug 2026 10:44:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/gt: Use signalers_lock to prevent starvation of
 irq_work.
To: Andi Shyti <andi.shyti@kernel.org>
Cc: intel-gfx@lists.freedesktop.org,
 Shuangpeng Bai <shuangpeng.kernel@gmail.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, stable@vger.kernel.org,
 Chris Wilson <chris.p.wilson@linux.intel.com>
References: <20260821114508.25669-1-dev@lankhorst.se>
 <aohKIjZZ6Qjy8qGQ@zenone.zhora.eu>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <aohKIjZZ6Qjy8qGQ@zenone.zhora.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Hello Andi,

On 8/21/26 16:52, Andi Shyti wrote:
> Hi Maarten,
> 
> ...
> 
>> @@ -208,13 +209,13 @@ static void signal_irq_work(struct irq_work *work)
>>  	if (!signal && READ_ONCE(b->irq_armed) && list_empty(&b->signalers))
>>  		intel_breadcrumbs_disarm_irq(b);
>>  
>> -	rcu_read_lock();
>> -	atomic_inc(&b->signaler_active);
>> -	list_for_each_entry_rcu(ce, &b->signalers, signal_link) {
>> +	spin_lock(&b->signalers_lock);
>> +	list_for_each_entry_safe(ce, next, &b->signalers, signal_link) {
> 
> without converting rcu lists to normal lists, can't we simply use
> spinlocks around this for_each to avoid PREEMPT_RT starvation?
> 
>>  		struct i915_request *rq;
>> +		bool release;
>>  
>> -		list_for_each_entry_rcu(rq, &ce->signals, signal_link) {
>> -			bool release;
>> +		spin_lock(&ce->signal_lock);
>> +		while ((rq = list_first_entry_or_null(&ce->signals, typeof(*rq), signal_link))) {
>>  
>>  			if (!__i915_request_is_complete(rq))
>>  				break;
> 
> ...
> 
>> @@ -427,30 +424,87 @@ bool i915_request_enable_breadcrumb(struct i915_request *rq)
>>  		return true;
>>  
>>  	spin_lock(&ce->signal_lock);
>> +	b = READ_ONCE(rq->engine)->breadcrumbs;
>> +
>>  	if (test_bit(I915_FENCE_FLAG_ACTIVE, &rq->fence.flags))
>> -		insert_breadcrumb(rq);
>> +		add_context = insert_breadcrumb(rq, b);
>> +
>> +	if (add_context && spin_trylock(&b->signalers_lock)) {
>> +		add_signaling_context(b, ce);
>> +		spin_unlock(&b->signalers_lock);
>> +		add_context = false;
>> +	}
>>  	spin_unlock(&ce->signal_lock);
>>  
>> +	if (add_context) {
>> +		/*
>> +		 * Fast trylock didn't work, use slow locking.
>> +		 *
>> +		 * Dropping the lock to solve the inversion is safe, since
>> +		 * no race is possible against remove_signaling_context()
>> +		 * without being added as signaling context.
>> +		 */
>> +		spin_lock(&b->signalers_lock);
>> +		spin_lock(&ce->signal_lock);
>> +		add_signaling_context(b, ce);
>> +		spin_unlock(&ce->signal_lock);
>> +		spin_unlock(&b->signalers_lock);
> 
> If I want to be a bit paranoic, a new request can be added in
> between the two locking blocks and "add_context" is not valid
> anymore.

It's completely fine if another request is added as well.
The check we really care about is about ce->signals being empty.

add_context is still valid, since we jumped from 0 to 1 or more requests,
and the context needs to be added to the list of active contexts.

Whether we add the context with a single, or 2 or more requests will not introduce a race.

> add_signaling_context() already checks for ce->signals, but it
> does not check whether ce->signal_link is already linked. Should
> we also check !list_empty(&ce->signal_link)?

I do not think this can happen, since until the context is added to the list
of signaling contexts, no request can be removed from the context's signal list.

Kind regards,
~Maarten Lankhorst

