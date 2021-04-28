Return-Path: <SRS0=ja9S=JZ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 780AFC43460
	for <intel-gfx@archiver.kernel.org>; Wed, 28 Apr 2021 10:42:41 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1115061423
	for <intel-gfx@archiver.kernel.org>; Wed, 28 Apr 2021 10:42:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1115061423
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 882F16E0B9;
	Wed, 28 Apr 2021 10:42:36 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D19A86E0A2;
 Wed, 28 Apr 2021 10:42:34 +0000 (UTC)
IronPort-SDR: ex5zH9muTUsp0XJ1EX97KN55T0l+mfj8uS1rQyode7BVBEYb1sGHN1vkrkq0mEE/luHyvrb/xj
 bEJEJBKrbM6Q==
X-IronPort-AV: E=McAfee;i="6200,9189,9967"; a="176823857"
X-IronPort-AV: E=Sophos;i="5.82,258,1613462400"; d="scan'208";a="176823857"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2021 03:42:34 -0700
IronPort-SDR: ewTi18WEfAYlFRQ4Gw6gOtoBDvh7iA/lO4P6I9dRTaykyZdvk9Cc3pXVMeZ+jla2/bRcTTwTxy
 HLfH6doTS+pQ==
X-IronPort-AV: E=Sophos;i="5.82,258,1613462400"; d="scan'208";a="430241852"
Received: from akuligox-mobl.ger.corp.intel.com (HELO [10.213.207.221])
 ([10.213.207.221])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2021 03:42:33 -0700
To: Daniel Vetter <daniel@ffwll.ch>, Jason Ekstrand <jason@jlekstrand.net>
References: <20210423223131.879208-1-jason@jlekstrand.net>
 <20210423223131.879208-10-jason@jlekstrand.net>
 <YIk14zVfa8Mw4rUF@phenom.ffwll.local>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <6b388d4d-1d50-94f3-344a-5b6b3639e8ad@linux.intel.com>
Date: Wed, 28 Apr 2021 11:42:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YIk14zVfa8Mw4rUF@phenom.ffwll.local>
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH 09/21] drm/i915/gem: Disallow creating
 contexts with too many engines
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>


On 28/04/2021 11:16, Daniel Vetter wrote:
> On Fri, Apr 23, 2021 at 05:31:19PM -0500, Jason Ekstrand wrote:
>> There's no sense in allowing userspace to create more engines than it
>> can possibly access via execbuf.
>>
>> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
>> ---
>>   drivers/gpu/drm/i915/gem/i915_gem_context.c | 7 +++----
>>   1 file changed, 3 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
>> index 5f8d0faf783aa..ecb3bf5369857 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
>> @@ -1640,11 +1640,10 @@ set_engines(struct i915_gem_context *ctx,
>>   		return -EINVAL;
>>   	}
>>   
>> -	/*
>> -	 * Note that I915_EXEC_RING_MASK limits execbuf to only using the
>> -	 * first 64 engines defined here.
>> -	 */
>>   	num_engines = (args->size - sizeof(*user)) / sizeof(*user->engines);
> 
> Maybe add a comment like /* RING_MASK has not shift, so can be used
> directly here */ since I had to check that :-)
> 
> Same story about igt testcases needed, just to be sure.
> 
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

I am not sure about the churn vs benefit ratio here. There are also 
patches which extend the engine selection field in execbuf2 over the 
unused constants bits (with an explicit flag). So churn upstream and 
churn in internal (if interesting) for not much benefit.

Regards,

Tvrtko

>> +	if (num_engines > I915_EXEC_RING_MASK + 1)
>> +		return -EINVAL;
>> +
>>   	set.engines = alloc_engines(num_engines);
>>   	if (!set.engines)
>>   		return -ENOMEM;
>> -- 
>> 2.31.1
>>
>> _______________________________________________
>> Intel-gfx mailing list
>> Intel-gfx@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
> 
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
