Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB06BCA5FCB
	for <intel-gfx@archiver.kernel.org>; Thu,  1 Oct 2026 12:15:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79AF710F63F;
	Thu,  1 Oct 2026 12:15:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="EoxkaghQ";
	dkim-atps=neutral
Received: from mail-ej2-f41.google.com (mail-ej2-f41.google.com
 [74.125.228.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB6E510F63F
 for <intel-gfx@lists.freedesktop.org>; Thu,  1 Oct 2026 12:15:15 +0000 (UTC)
Received: by mail-ej2-f41.google.com with SMTP id
 a640c23a62f3a-c2e3f641442so69897366b.0
 for <intel-gfx@lists.freedesktop.org>; Thu, 01 Oct 2026 05:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1790856914; x=1791461714; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Cub+RYGeqgcwVoIVZ0MvGdYX5Fhvas3+q5oj7U0i/v0=;
 b=EoxkaghQc2J37Rd3yO6bmFY35hIX5Xd6RzNBBgKZGGQYXAGi08pAmzAAXpnchWqqd2
 rWf/k6F237keG6puZFK9j76cIeL2GG5XyjCkiEDFahsDbBRjKAG6PqsDKUaPxwnNoNbn
 KpRBJH5UFTwB05g8SAwq+GGiFSVl6G6+mv/5Qgn5lcrwND0BLknH8o3ZBKyKvb9RH0hb
 UVnBnizamU1gTxNRKR41TcVitmt89IDuKLV0esghsCBiWtznMJjCwDtxJ/mrknS44l2r
 N+zA/2zVr4Ufqg4ny7bAHqgEhWszHDl83MAwfiJhHyXTKPNT+VmJ/oiC4hNCKcu8nRfk
 JLKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790856914; x=1791461714;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Cub+RYGeqgcwVoIVZ0MvGdYX5Fhvas3+q5oj7U0i/v0=;
 b=OxOKmq6I5FeQxUjufoX0jzTucSWbpgHurEiV5C80YMP4LDihSW9CUYXN3w5YK/hS3g
 qGL73jyFISnRjLjJUZooTdoynDh48XBVfiJ1zMvWeuvl6CVcFjUwLSqP/2+8UbJxlngG
 S2beTOsogUJv0qDaGgdd4REmz1YQpMgfFOZP/SVeUNWz8nDTtNNohWmPq2NjqDHDCQr0
 gRkFVH4sSd00Byoq2D29WHE5h5MJ2K3GROR9oVdZfQlyvZO2CXLEFlI1YKOshmjJrVmp
 dLn+b1KKhoWZ8BIZZV82tKskDu1OKpP4BPvzYN/SWvgWZoEIYhr/FaV93q+0gUIy1TXD
 VwXA==
X-Forwarded-Encrypted: i=1;
 AKwUvByLHpVV4yc/4KWB5GUzuvBR8OZKZGkyyOKiw9hl9NPiARcUWIuCBdDaeeA6WdKqt9BhG76Jw2YpNDk=@lists.freedesktop.org
X-Gm-Message-State: AFuF++kCgnBJKbHcHT5HfTRE4WTotAH4D1VXHH7JSHi+vEHAIHOzCsJg
 fnVJsXbvZIciAXsORuv6GAC6yiPFmuHaqo98IwLN2cQS/uTRyZCN3pBWZz1UZ+PZyjyEGqVzOcU
 h6B25
X-Gm-Gg: AYBFou2cSytWMcwuDbi2pPRLcQpckXUU32UHhQn8dJfKQcM3Q5Jh4yijx/8dam+i2Ho
 SOo6UpvtObWLAjkwWkbg/SAP15dQtdJoF7fxgUZrKJylISTYj9d7dIXTpFGPy+yZgdfAm7F8kMr
 1OcTU97LECQixCEHJq1G8wrFpD9s2tXvNRKlpfvQHDzDz4wRdrE046mFVLNfhjdg73j1PJH000e
 MybSayX1yvzgl57nNHlE7JiaHE7Jw0cw6O1Y2AoTUCYVryirYhfggd2TI+LmrNZhI8tGmkILF8Q
 l6yy1Up0/Txn1yhd8+D0KOqMXdxPwX5GhPhVWyhjqBYDFe8m/iuSRsOMUuYdqEye9re3dME1lTJ
 EG+5iDWVR+XudBl4S/2bWiDspFehGYNr7gc5SMWYuU5zEI8LuBJgr2kWlRKXB6l2KqS+AfOkUzm
 AXrfSbn92Z74EZjABhVGo6bYeC1XN3tycJN0sDs1mshR0ggiHFgddrETtY0uogiEuLNgmg3jLf5
 R1tmlz5kkafog==
X-Received: by 2002:a17:907:3cca:b0:c29:4cdf:dd70 with SMTP id
 a640c23a62f3a-c2e23e5d1fcmr394979366b.44.1790856914015; 
 Thu, 01 Oct 2026 05:15:14 -0700 (PDT)
Received: from [192.168.0.116] ([81.79.79.1]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c2e473ea02fsm1562066b.3.2026.10.01.05.15.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Oct 2026 05:15:12 -0700 (PDT)
Message-ID: <3938b565-0957-43a8-9f2b-ee8d09fee88e@ursulin.net>
Date: Thu, 1 Oct 2026 13:15:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/i915/pmu: Disable on PREEMPT_RT
To: Maarten Lankhorst <dev@lankhorst.se>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 intel-gfx@lists.freedesktop.org, vinay.belgaumkar@intel.com
References: <20260929190147.2886670-5-umesh.nerlige.ramappa@intel.com>
 <20260929190147.2886670-6-umesh.nerlige.ramappa@intel.com>
 <83bc37f9-e5b5-41de-a03b-6de01966ffe6@ursulin.net>
 <65bdb585-a155-468f-ba49-26387373f83b@lankhorst.se>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <65bdb585-a155-468f-ba49-26387373f83b@lankhorst.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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


On 30/09/2026 14:25, Maarten Lankhorst wrote:
> Hello,
> 
> On 9/30/26 10:02, Tvrtko Ursulin wrote:
>>
>> On 29/09/2026 20:01, Umesh Nerlige Ramappa wrote:
>>> From: Maarten Lankhorst <dev@lankhorst.se>
>>>
>>> I tried to come up with alternative and lockless approaches
>>> to make pmu work, but since the perf events are run in
>>> atomic context on PREEMPT_RT, ordinary spinlocks no longer
>>> work and forcewake and register accesses become problematic.
>>
>> If it is only those events put the checks into config_status and engine_event_status respectively. That will allow the non-problematic events to work.
> 
> Unfortunately all review happens long long long after I originally wrote the patch.

Yeah we talked about this few days ago so it is what it is.

> This means that I have to dig up the things from memory, and CI logs from previous
> runs are no longer available. My next comment might thus not be completely accurate
> 
> I believe it was most visible there, but it affected all other paths as well.
> But when I started an attempt at fixing  it I came across one that couldn't
> be fixed, so I gave up on the partial attempts and disabled PMU events altogether.

In this case lets just improve the comment down below and add a 
drm_notice to make it more user friendly.

Comment should say something like - Events which end up taking the 
uncore lock via the forcewake path are problematic due.. Until someone 
establishes which ones are those and mark them individually unsupported 
in config_status() and engine_event_init(), lets just disable the PMU 
altogether.

Regards,

Tvrtko

>>> Disable perf events on PREEMPT_RT for now, without affecting
>>> !PREEMPT_RT users.
>>>
>>> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
>>> ---
>>> v2: s/reeturn/return/
>>> ---
>>>    drivers/gpu/drm/i915/i915_pmu.c | 10 ++++++++++
>>>    1 file changed, 10 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
>>> index 1c3bafda9c70..9ea5626399e5 100644
>>> --- a/drivers/gpu/drm/i915/i915_pmu.c
>>> +++ b/drivers/gpu/drm/i915/i915_pmu.c
>>> @@ -1156,6 +1156,16 @@ void i915_pmu_register(struct drm_i915_private *i915)
>>>        };
>>>        int ret = -ENOMEM;
>>>    +    /*
>>> +     * PREEMPT_RT has problems with forcewake. Forcewake is used by the
>>> +     * engine 'busy' event when guc submission is enabled, and to measure
>>> +     * rc6 residency.
>>> +     *
>>> +     * Disable pmu events on PREEMPT_RT entirely to prevent deadlocks.
>>> +     */
>>> +    if (IS_ENABLED(CONFIG_PREEMPT_RT))
>>> +        return;
>>
>> It would be nice to emit a suitable drm_notice here, equivalent to how the existing error path does if the registration unexpectedly fails.
>>
>> Regards,
>>
>> Tvrtko
>>
>>> +
>>>        spin_lock_init(&pmu->lock);
>>>        hrtimer_setup(&pmu->timer, i915_sample, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
>>>        init_rc6(pmu);
>>
> 

