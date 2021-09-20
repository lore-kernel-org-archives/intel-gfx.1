Return-Path: <SRS0=beGZ=OK=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B844C433F5
	for <intel-gfx@archiver.kernel.org>; Mon, 20 Sep 2021 13:28:42 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E03816109E
	for <intel-gfx@archiver.kernel.org>; Mon, 20 Sep 2021 13:28:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E03816109E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D13266E4F4;
	Mon, 20 Sep 2021 13:28:36 +0000 (UTC)
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00BCD6E3E5;
 Mon, 20 Sep 2021 07:23:15 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 192-20020a1c04c9000000b002f7a4ab0a49so10809782wme.0; 
 Mon, 20 Sep 2021 00:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=0M+kSw4lGcuEpkngLdEE2aUmmhCoCvNuYWVNUrrpaN8=;
 b=Y+tYcuGrVLiqvrZMolyepjQd20o6WKAck4ITrk2efyspM1rbEMBgH5InWQwkOhxrV9
 FGpUFJ492K0i4fsYk500qKzG/ru7qw6nBUe4vcOVY2j6lCR3nSdmu/VkoJu2hBvpTCz6
 JhFRv/k4lUqHUWUUzMVC9gGAoO2dJkXj9xNhMUXD9qcTxNg8zcZnwc4xreH4SNo/ziff
 /n0HRLUnY32+5LB3K1laH+iPzuLa44u0cB3Ig0XTMVbPdX43ccWOMges6Vg09G0sGNJG
 ErFzb/zIYd39lVTFRGcPRYDeZnRrPsdejCrgfbF2HMOM71+HH0T5nPzEkf4gRHCigszu
 sj6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=0M+kSw4lGcuEpkngLdEE2aUmmhCoCvNuYWVNUrrpaN8=;
 b=ffvCgYk/GKKCuwnLG4SSNQFgedVOH66QIjkmTK+oqyYw2ai9yOIYmqVtfGkhdB1Zve
 JND+HpsMZIWPRFq3vJfCxZxmwAQESYJ7VUWiNaAR6lmtguNd2jXFCBkBf/f833UzlU6l
 ePEZf7Ov31U4vTtbYfyRi8ifMJ8nbFAJ34d5uXAFEyfGZOBpJvNJOuLROPytZd+dYp+m
 MW1JaeUkXZfIBYihuZreN0NCrblK7oecMZRyKVIzCHS5EAgIOIJHLUCz55GJu7/IuogG
 n4Sk7W3gDkLuRm8GJK0DCyHyc+r/aNv/XtljdSRx4U5HshYayvRyZKK9rwerfD25sygv
 LfhA==
X-Gm-Message-State: AOAM532I/ckQwFZzHZYc3GtG+cVZvlzBdAetECe0sZTMYyhjNn1bJUPc
 MK2sdRYPJAo+J9PlYZMaX8V99wGG8hA=
X-Google-Smtp-Source: ABdhPJwZtfUC9F+9WQXGaFkX9XQ2onZ9sbJUuGe3PpumfGeONn0tOhWXjuYUb0VVgAXXufQyWYhQmw==
X-Received: by 2002:a05:600c:2109:: with SMTP id
 u9mr7813185wml.6.1632122594458; 
 Mon, 20 Sep 2021 00:23:14 -0700 (PDT)
Received: from [192.168.178.21] (p5b0ea1b5.dip0.t-ipconnect.de.
 [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id 135sm10197632wma.32.2021.09.20.00.23.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 00:23:14 -0700 (PDT)
To: Daniel Vetter <daniel@ffwll.ch>
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
References: <20210917123513.1106-1-christian.koenig@amd.com>
 <20210917123513.1106-4-christian.koenig@amd.com>
 <YUSnqqsMjXOPNB6W@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <49eb0395-5446-62b8-da06-9c4c23eda843@gmail.com>
Date: Mon, 20 Sep 2021 09:23:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YUSnqqsMjXOPNB6W@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Mailman-Approved-At: Mon, 20 Sep 2021 13:28:35 +0000
Subject: Re: [Intel-gfx] [PATCH 03/26] dma-buf: use new iterator in
 dma_resv_copy_fences
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

Am 17.09.21 um 16:35 schrieb Daniel Vetter:
> On Fri, Sep 17, 2021 at 02:34:50PM +0200, Christian König wrote:
>> This makes the function much simpler since the complex
>> retry logic is now handled else where.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/dma-buf/dma-resv.c | 86 ++++++++++++++++----------------------
>>   1 file changed, 35 insertions(+), 51 deletions(-)
>>
>> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
>> index a3c79a99fb44..406150dea5e4 100644
>> --- a/drivers/dma-buf/dma-resv.c
>> +++ b/drivers/dma-buf/dma-resv.c
>> @@ -426,74 +426,58 @@ EXPORT_SYMBOL_GPL(dma_resv_iter_walk);
>>    */
>>   int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src)
>>   {
>> -	struct dma_resv_list *src_list, *dst_list;
>> -	struct dma_fence *old, *new;
>> -	unsigned int i;
>> +	struct dma_resv_iter cursor;
>> +	struct dma_resv_list *list;
>> +	struct dma_fence *f, *excl;
>>   
>>   	dma_resv_assert_held(dst);
>>   
>> -	rcu_read_lock();
>> -	src_list = dma_resv_shared_list(src);
>> -
>> -retry:
>> -	if (src_list) {
>> -		unsigned int shared_count = src_list->shared_count;
>> -
>> -		rcu_read_unlock();
>> +	list = NULL;
>> +	excl = NULL;
>>   
>> -		dst_list = dma_resv_list_alloc(shared_count);
>> -		if (!dst_list)
>> -			return -ENOMEM;
>> +	rcu_read_lock();
>> +	dma_resv_iter_begin(&cursor, src, true);
>> +	dma_resv_for_each_fence_unlocked(&cursor, f) {
>>   
>> -		rcu_read_lock();
>> -		src_list = dma_resv_shared_list(src);
>> -		if (!src_list || src_list->shared_count > shared_count) {
>> -			kfree(dst_list);
>> -			goto retry;
>> -		}
>> +		if (cursor.is_first) {
> Maybe have a wrapper for this, like dma_resv_iter_is_reset or is_first or
> is_restart (my preference) with some nice docs that this returns true
> everytime we had to restart the sequence?

Exactly that's what I wanted to avoid since the is_first (or whatever) 
function should only be used inside of the dma_resv.c code.

On the other hand I can just make that static here and document that it 
should never be exported.

Christian.

>
> Otherwise I fully agree, this is so much better with all the hairy
> restarting and get_rcu and test_bit shovelled away somewhere.
>
> Either way (but I much prefer a wrapper for is_first):
>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>
>> +			dma_resv_list_free(list);
>> +			dma_fence_put(excl);
>>   
>> -		dst_list->shared_count = 0;
>> -		for (i = 0; i < src_list->shared_count; ++i) {
>> -			struct dma_fence __rcu **dst;
>> -			struct dma_fence *fence;
>> +			if (cursor.fences) {
>> +				unsigned int cnt = cursor.fences->shared_count;
>>   
>> -			fence = rcu_dereference(src_list->shared[i]);
>> -			if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
>> -				     &fence->flags))
>> -				continue;
>> +				rcu_read_unlock();
>> +				list = dma_resv_list_alloc(cnt);
>> +				if (!list) {
>> +					dma_resv_iter_end(&cursor);
>> +					return -ENOMEM;
>> +				}
>>   
>> -			if (!dma_fence_get_rcu(fence)) {
>> -				dma_resv_list_free(dst_list);
>> -				src_list = dma_resv_shared_list(src);
>> -				goto retry;
>> -			}
>> +				list->shared_count = 0;
>> +				rcu_read_lock();
>>   
>> -			if (dma_fence_is_signaled(fence)) {
>> -				dma_fence_put(fence);
>> -				continue;
>> +			} else {
>> +				list = NULL;
>>   			}
>> -
>> -			dst = &dst_list->shared[dst_list->shared_count++];
>> -			rcu_assign_pointer(*dst, fence);
>> +			excl = NULL;
>>   		}
>> -	} else {
>> -		dst_list = NULL;
>> -	}
>>   
>> -	new = dma_fence_get_rcu_safe(&src->fence_excl);
>> +		dma_fence_get(f);
>> +		if (dma_resv_iter_is_exclusive(&cursor))
>> +			excl = f;
>> +		else
>> +			RCU_INIT_POINTER(list->shared[list->shared_count++], f);
>> +	}
>> +	dma_resv_iter_end(&cursor);
>>   	rcu_read_unlock();
>>   
>> -	src_list = dma_resv_shared_list(dst);
>> -	old = dma_resv_excl_fence(dst);
>> -
>>   	write_seqcount_begin(&dst->seq);
>> -	/* write_seqcount_begin provides the necessary memory barrier */
>> -	RCU_INIT_POINTER(dst->fence_excl, new);
>> -	RCU_INIT_POINTER(dst->fence, dst_list);
>> +	excl = rcu_replace_pointer(dst->fence_excl, excl, dma_resv_held(dst));
>> +	list = rcu_replace_pointer(dst->fence, list, dma_resv_held(dst));
>>   	write_seqcount_end(&dst->seq);
>>   
>> -	dma_resv_list_free(src_list);
>> -	dma_fence_put(old);
>> +	dma_resv_list_free(list);
>> +	dma_fence_put(excl);
>>   
>>   	return 0;
>>   }
>> -- 
>> 2.25.1
>>

