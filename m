Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69955C982EA
	for <intel-gfx@archiver.kernel.org>; Wed, 23 Sep 2026 07:19:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2BAC10E812;
	Wed, 23 Sep 2026 07:19:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="bg8ZxXd0";
	dkim-atps=neutral
Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com
 [74.125.228.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10AA410E799
 for <intel-gfx@lists.freedesktop.org>; Wed, 23 Sep 2026 07:19:11 +0000 (UTC)
Received: by mail-ej2-f43.google.com with SMTP id
 a640c23a62f3a-c2a1a631f6aso65438766b.3
 for <intel-gfx@lists.freedesktop.org>; Wed, 23 Sep 2026 00:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1790147949; x=1790752749; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=Ft6XgyJ5wQGlqXKRn4SVkQ1bgRUrF5cWG3Ko+MjzV64=;
 b=bg8ZxXd03rUjsV+hDTpUsj2+NDlQkroO4Q5/wkrNkFxfY5xWlQpaJLVS03DEFp6MCK
 fj+uU5vjARINTfpWNeqOfIfWzHjJYD+nVncmUx93heRofQPkLKH5K28i6Ry07Mo7ECNe
 cqeMxDMoIRsObY0GorUKTMa0yam0Ch7AXgcW4MLhppDTZmmBqVUlKHqi3GAFxpLxdQH2
 Oth6kx372xYS1ljCy3EPGJ1M+2T46Z37wxhubO6bFlFRhAqZ2LUghEG2doqd087pBTKj
 PEqP8UAExw8QMH1gwBahVyNtAqZXMdmOtcYg9hyD6nLfj0cQ7Y2mX3TGKvkUO97JiEvN
 B4Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790147949; x=1790752749;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Ft6XgyJ5wQGlqXKRn4SVkQ1bgRUrF5cWG3Ko+MjzV64=;
 b=SVVIjZnQzjUpAFqieqvOwam5qJqyrlIzLAOsE9O+eFA4Oxs/Jnq5YZ0WBspc++a6/o
 Gg10fi/sVDve7EYoN4KCL8qfDlZ7hiOuUhGyrAUAnsqjxtrAYIAuEaeWEQV0frwvV0Kr
 jiOYeKBVnKTO3crkIuK6yZUx75OCEJ3jqqrVaMC/BENxoVRb+zE3rtjwa7yGWL2l8YjT
 5HWAQ+kBLF8uwtmGWY/OjCAsri54hGX0wv666J7iVO2m0H86XROO2Wm7A1Ntgzpx2YYW
 TUUTDvFW08/Iv2HvxArWPGg+wkInO79Z1r3tffFgZHNCfM3KxbuDoO2Kqlv/dGNyAGrF
 D4PA==
X-Gm-Message-State: AFuF++kcnPLPe78ZPK7SVadn8xgjs9mf2nhvpr4bX9/i6p2KaJ+FBB3b
 pwbsq6e62x7w7UkJP0Wk3+lyTEy2IsRJO0hwrCuNFxLgeeovb98lLGMW7UToGAmuxOw=
X-Gm-Gg: AYBFou2BqGnhfgwJIkCXSYvz2Ops2tBSK8ufCa3NciB0tK2Nq+nFFMcBvXxtYCe0O5o
 G/2ESCM4tnSuWIu1gdeM2fS5jrUrFqclGt9ocebtgvsAMlwLdxflZSZsUNEb0Ys7IQ73HnsutvX
 MOIN7GS8AlLVZM4ZxXc2DTkmRYFx9XeWEzj8IlG/c7U46X3yOu0Ka1X+Jlv/tmhlZHZVcPmjPn5
 2Erc7ix9qHBupeupfYUBm5SMuR/lfPagZvLbniPjv2TTCp34hDkZ+8I2sOQEnzeYQRgzOFuMpPq
 efn/vVc7lwtSUgp4FnEtCJBHSNF55J5XrXxwbBHvTPSBSKxA+ERKKYtM52ZgNEy7fU7pHJj1kR7
 YXv8bWJx6cRLxLYB70cUrwMvAj1fSFCSBj9+0+7ncu4gaEv5/BwhV/gEqb2QfBIzvNyRW5xMPEX
 ntIiOhnXjFTXKgM74qD5ublWjwwsosd9UA4lfjsn5w3vMXc5s0HyWeE1RipezqJqZftW/bbqeUP
 Ifx2Qhlx9XdoA==
X-Received: by 2002:a17:907:c23:b0:c29:f5d5:5aa1 with SMTP id
 a640c23a62f3a-c2aae27ba7dmr122903466b.43.1790147948799; 
 Wed, 23 Sep 2026 00:19:08 -0700 (PDT)
Received: from [192.168.0.116] ([81.79.79.1]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c2aae6e3677sm56238766b.62.2026.09.23.00.19.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Sep 2026 00:19:08 -0700 (PDT)
Message-ID: <32eb2a14-8684-4e61-98a0-882d12dddc16@ursulin.net>
Date: Wed, 23 Sep 2026 08:19:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/7] drm/i915: All fixes to make i915 work well with
 PREEMPT_RT.
To: Maarten Lankhorst <dev@lankhorst.se>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20260706114823.752313-1-dev@lankhorst.se>
 <20260706122026.IJAiyhhw@linutronix.de>
 <c4222f81-72b2-4eea-a900-da327f0df928@lankhorst.se>
 <20260709110200.2_5Eg8xF@linutronix.de>
 <a6c056ba-0847-4d2c-a7bd-39ac27eb15d5@lankhorst.se>
 <20260918083118.POmXtJuv@linutronix.de>
 <4c94abcc-2f0f-4454-999f-38640972dfe2@ursulin.net>
 <0ed50720-3533-4cd7-8579-0dc175a822dd@lankhorst.se>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <0ed50720-3533-4cd7-8579-0dc175a822dd@lankhorst.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
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


On 18/09/2026 12:19, Maarten Lankhorst wrote:
> Hey,
> 
> On 9/18/26 11:44, Tvrtko Ursulin wrote:
>>
>> On 18/09/2026 09:31, Sebastian Andrzej Siewior wrote:
>>> On 2026-07-09 13:36:57 [+0200], Maarten Lankhorst wrote:
>>>> Hey,
>>> Hi Maarten,
>>>
>>>> Yeah the problem was similar, I believe neither check should exist,
>>>> instead the caller should give this information like the comment mentions.
>>>
>>> Any update here? Maybe I have been left out on reposts. Any chance this
>>> gets in before the LTS of this year gets out?
>>
>> Side question, there was a bunch of sashiko issues against v4 - have those been addressed?
>>
>> As today it is the first time I see patch 7/7 which is a bit of a scary one. I have to ask how much does Intel commit to fixing out any potential breakage given the status of i915?
>>
>> + other maintainers FYI
> Patch 7/7 addresses a real issue, it just happened to be more easily found on PREEMPT_RT.

In this case, have you pulled it out from the series and sent standalone?

> I haven't had much time to look at PREEMPT_RT lately, I'll see if I can get some time to look at
> sashiko, but lack of reviews have not been helping.
> 
> Every time I send out revised patches, it takes a few months before I receive a response.
> By that time I have moved on to other projects, and finding time takes a lot of time again.
> If the cycle took only a few days I could finish this quickly and get it merged.

Sounds like Intel is not officially supporting/funding your effort. I am 
also helping out unfunded in my private time so cannot really promise to 
improve things much in terms of promptness of reviews, or even promise 
to review in the short term.

In any case it sounds like the best plan is to send the fix which 
applies to !PREEMPT_RT as standalone and see if anyone bites. Problem 
still be merging such a large change so I expect maintainer acks will be 
needed in any case.

Regards,

Tvrtko

