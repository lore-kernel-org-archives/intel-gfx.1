Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F0CACA5FAC
	for <intel-gfx@archiver.kernel.org>; Wed, 30 Sep 2026 13:25:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9E9E10E275;
	Wed, 30 Sep 2026 13:25:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="V8qv7d0g";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7425010E275
 for <intel-gfx@lists.freedesktop.org>; Wed, 30 Sep 2026 13:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1790774729;
 bh=tm8nZCYmlpcSpBlXYnPflWccQ/uby0BfqKhS5g2WKHo=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=V8qv7d0gdFeAdSs5H2eQ9LFR+EVgEDH0PWPulOkiqfNYss1snD/z01DOvvUsQKoXQ
 tDpUh+HMOQAjndwONkYMDavW6KKcp9HucXy8fqMOWh08YBL7Fi7HrFd/YBB5/I3+sh
 4/o5+vHPhIb06OaqqOuuXuca/M/uOeLoPYMOUjGJXAUsbyZN4RTwTyr/G40a6MRAPx
 UkUgGHIrc6JWxl1S0bZHpM7IZpYZDbDSUB/IMkID/6BT5m1EEW/m3e2a6ryGtPGo5U
 bOWWje/hqzlL6cY2ZygudBTB2UR3074eigwCtTep5iVE4aRn9VKvK2QPuE+KdXu0H/
 U2lD8F0Qpiffg==
Message-ID: <65bdb585-a155-468f-ba49-26387373f83b@lankhorst.se>
Date: Wed, 30 Sep 2026 15:25:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/i915/pmu: Disable on PREEMPT_RT
To: Tvrtko Ursulin <tursulin@ursulin.net>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 intel-gfx@lists.freedesktop.org, vinay.belgaumkar@intel.com
References: <20260929190147.2886670-5-umesh.nerlige.ramappa@intel.com>
 <20260929190147.2886670-6-umesh.nerlige.ramappa@intel.com>
 <83bc37f9-e5b5-41de-a03b-6de01966ffe6@ursulin.net>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <83bc37f9-e5b5-41de-a03b-6de01966ffe6@ursulin.net>
Content-Type: text/plain; charset=UTF-8
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

Hello,

On 9/30/26 10:02, Tvrtko Ursulin wrote:
> 
> On 29/09/2026 20:01, Umesh Nerlige Ramappa wrote:
>> From: Maarten Lankhorst <dev@lankhorst.se>
>>
>> I tried to come up with alternative and lockless approaches
>> to make pmu work, but since the perf events are run in
>> atomic context on PREEMPT_RT, ordinary spinlocks no longer
>> work and forcewake and register accesses become problematic.
> 
> If it is only those events put the checks into config_status and engine_event_status respectively. That will allow the non-problematic events to work.

Unfortunately all review happens long long long after I originally wrote the patch.
This means that I have to dig up the things from memory, and CI logs from previous
runs are no longer available. My next comment might thus not be completely accurate

I believe it was most visible there, but it affected all other paths as well.
But when I started an attempt at fixing  it I came across one that couldn't
be fixed, so I gave up on the partial attempts and disabled PMU events altogether.

>> Disable perf events on PREEMPT_RT for now, without affecting
>> !PREEMPT_RT users.
>>
>> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
>> ---
>> v2: s/reeturn/return/
>> ---
>>   drivers/gpu/drm/i915/i915_pmu.c | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
>> index 1c3bafda9c70..9ea5626399e5 100644
>> --- a/drivers/gpu/drm/i915/i915_pmu.c
>> +++ b/drivers/gpu/drm/i915/i915_pmu.c
>> @@ -1156,6 +1156,16 @@ void i915_pmu_register(struct drm_i915_private *i915)
>>       };
>>       int ret = -ENOMEM;
>>   +    /*
>> +     * PREEMPT_RT has problems with forcewake. Forcewake is used by the
>> +     * engine 'busy' event when guc submission is enabled, and to measure
>> +     * rc6 residency.
>> +     *
>> +     * Disable pmu events on PREEMPT_RT entirely to prevent deadlocks.
>> +     */
>> +    if (IS_ENABLED(CONFIG_PREEMPT_RT))
>> +        return;
> 
> It would be nice to emit a suitable drm_notice here, equivalent to how the existing error path does if the registration unexpectedly fails.
> 
> Regards,
> 
> Tvrtko
> 
>> +
>>       spin_lock_init(&pmu->lock);
>>       hrtimer_setup(&pmu->timer, i915_sample, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
>>       init_rc6(pmu);
> 

