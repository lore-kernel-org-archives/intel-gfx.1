Return-Path: <SRS0=beGZ=OK=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DCF8C433FE
	for <intel-gfx@archiver.kernel.org>; Mon, 20 Sep 2021 10:33:25 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE1B060F3A
	for <intel-gfx@archiver.kernel.org>; Mon, 20 Sep 2021 10:33:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CE1B060F3A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57DE96E491;
	Mon, 20 Sep 2021 10:33:24 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B1046E499;
 Mon, 20 Sep 2021 10:33:23 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10112"; a="308647502"
X-IronPort-AV: E=Sophos;i="5.85,308,1624345200"; d="scan'208";a="308647502"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2021 03:33:22 -0700
X-IronPort-AV: E=Sophos;i="5.85,308,1624345200"; d="scan'208";a="473549879"
Received: from gbradyx-mobl2.ger.corp.intel.com (HELO [10.213.235.119])
 ([10.213.235.119])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2021 03:33:20 -0700
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch
References: <20210917123513.1106-1-christian.koenig@amd.com>
 <20210917123513.1106-14-christian.koenig@amd.com>
 <6fbaca09-ec51-c44e-708c-334ef8be8595@linux.intel.com>
 <368e8495-f4de-cbb2-3584-e022a5937885@gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <563bb7c3-f956-212d-6085-b1b88292887c@linux.intel.com>
Date: Mon, 20 Sep 2021 11:33:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <368e8495-f4de-cbb2-3584-e022a5937885@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-gfx] [PATCH 13/26] drm/i915: use the new iterator in
 i915_gem_busy_ioctl
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


On 20/09/2021 11:13, Christian König wrote:
> Am 20.09.21 um 10:45 schrieb Tvrtko Ursulin:
>>
>> On 17/09/2021 13:35, Christian König wrote:
>>> This makes the function much simpler since the complex
>>> retry logic is now handled else where.
>>>
>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>> ---
>>>   drivers/gpu/drm/i915/gem/i915_gem_busy.c | 32 ++++++++----------------
>>>   1 file changed, 11 insertions(+), 21 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_busy.c 
>>> b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
>>> index 6234e17259c1..b1cb7ba688da 100644
>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_busy.c
>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
>>> @@ -82,8 +82,8 @@ i915_gem_busy_ioctl(struct drm_device *dev, void 
>>> *data,
>>>   {
>>>       struct drm_i915_gem_busy *args = data;
>>>       struct drm_i915_gem_object *obj;
>>> -    struct dma_resv_list *list;
>>> -    unsigned int seq;
>>> +    struct dma_resv_iter cursor;
>>> +    struct dma_fence *fence;
>>>       int err;
>>>         err = -ENOENT;
>>> @@ -109,27 +109,17 @@ i915_gem_busy_ioctl(struct drm_device *dev, 
>>> void *data,
>>>        * to report the overall busyness. This is what the wait-ioctl 
>>> does.
>>>        *
>>>        */
>>> -retry:
>>> -    seq = raw_read_seqcount(&obj->base.resv->seq);
>>> -
>>> -    /* Translate the exclusive fence to the READ *and* WRITE engine */
>>> -    args->busy = 
>>> busy_check_writer(dma_resv_excl_fence(obj->base.resv));
>>> -
>>> -    /* Translate shared fences to READ set of engines */
>>> -    list = dma_resv_shared_list(obj->base.resv);
>>> -    if (list) {
>>> -        unsigned int shared_count = list->shared_count, i;
>>> -
>>> -        for (i = 0; i < shared_count; ++i) {
>>> -            struct dma_fence *fence =
>>> -                rcu_dereference(list->shared[i]);
>>> -
>>> +    args->busy = false;
>>> +    dma_resv_iter_begin(&cursor, obj->base.resv, true);
>>> +    dma_resv_for_each_fence_unlocked(&cursor, fence) {
>>
>> You did not agree with my suggestion to reset args->busy on restart 
>> and so preserve current behaviour?
> 
> No, I want to keep the restart behavior internally to the dma_resv 
> object and as far as I can see it should not make a difference here.

To be clear, on paper difference between old and new implementation is 
if the restart happens while processing the shared fences.

Old implementation unconditionally goes to "args->busy =
 >>> busy_check_writer(dma_resv_excl_fence(obj->base.resv));" and so 
overwrites the set of flags returned to userspace.

New implementation can merge new read flags to the old set of flags and 
so return a composition of past and current fences.

Maybe it does not matter hugely in this case, depends if userspace 
typically just restarts until flags are clear. But I am not sure.

On the higher level - what do you mean with wanting to keep the restart 
behaviour internal? Not providing iterators users means of detecting it? 
I think it has to be provided.

Regards,

Tvrtko

> Regards,
> Christian.
> 
>>
>> Regards,
>>
>> Tvrtko
>>
>>> +        if (dma_resv_iter_is_exclusive(&cursor))
>>> +            /* Translate the exclusive fence to the READ *and* WRITE 
>>> engine */
>>> +            args->busy = busy_check_writer(fence);
>>> +        else
>>> +            /* Translate shared fences to READ set of engines */
>>>               args->busy |= busy_check_reader(fence);
>>> -        }
>>>       }
>>> -
>>> -    if (args->busy && read_seqcount_retry(&obj->base.resv->seq, seq))
>>> -        goto retry;
>>> +    dma_resv_iter_end(&cursor);
>>>         err = 0;
>>>   out:
>>>
> 
