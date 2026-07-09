Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27947C44501
	for <intel-gfx@archiver.kernel.org>; Thu,  9 Jul 2026 07:36:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6E8A10E053;
	Thu,  9 Jul 2026 07:36:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="l9cpXVCT";
	dkim-atps=neutral
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40B5210E053
 for <intel-gfx@lists.freedesktop.org>; Thu,  9 Jul 2026 07:36:39 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-493b7612475so12973635e9.3
 for <intel-gfx@lists.freedesktop.org>; Thu, 09 Jul 2026 00:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1783582597; x=1784187397; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :references:cc:to:from:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=ykv1Gg8TEg7oJaJLPkBJ3p4DRQzUQ1x6/Z28sb6CbPs=;
 b=l9cpXVCThRMJY2SJQszfzfDbFiM+b3+L8IyT2GifDx+jhgJLuBYlb4KekADP6rrFq5
 1mMQXUx4Kp3PH3wFCpTd1an2LFQ5xCXU2icToDzEvKa5xIwePL6sHq5JpSdfMIomRM7o
 qvoteT6aLHIPH6FprbifcXVEUW/2mgBi8tFds77NdK1HhZZH6AyfQW/eiy5VfJqihYmw
 C1B4bBpE2E/+U2oOWKfpmAcg9t/PFUagTVgPQ3kbikD1tWVL9kdmKDprdOw4u8erCJNX
 A0jOVvz+IuIJFzGX63Jlw4fHZnBkmCzGYJxI/kr3pSwC3vA8O9Aa3b0qq2nfYMpSB8Nf
 1A+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783582597; x=1784187397;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :references:cc:to:from:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ykv1Gg8TEg7oJaJLPkBJ3p4DRQzUQ1x6/Z28sb6CbPs=;
 b=bkUpc4TnNsMEUvK7XpepTfjcAPI//nlF1Z0fFZV1bppMh4hfCFlY27FGylgNtvhx6u
 aaixntliulS7VQ9QmK7bdhFf8RvmUdNIQFkN/4exOY2F8taPjW96wubNzKGsoqQ1/4zO
 59sx2RhQ7lQY8nxHr6pKp+1id+8Vmg6bUl0tE6SuqO44xtYlwCLOcOF2y9Tezsez3Qjw
 fMTx29KzapeVNlWnCwWrJXBJLwjD3AafBjhRgPckdi/e4zzmCm65xInXAoTNsYLhc0Ek
 /5LBn+Pbo5rDDBocDwjzKOs5+t/y4y4D9S1MbPowmuSsDnLDy9oVTTAhh8ng8ztu2aTP
 l/DA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp5itp7eY/D2z5KUv51SXyvSXMfClDyGtRg3SCMAjP4Vpd9Gpw2/L6+cDXEgXYXhyUJ/ORENIigIFk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw/4PTb7uOlLmjjLRea/TL9eREBg9FPPo83nxZaIbuOCzciWYqw
 YqiemjQuttze5GUvAnF/7Rvc8pODrwdGyV8NVA4+EkesT5pe4YAOhN/atAEx1x1M3ow=
X-Gm-Gg: AfdE7cmxTUzmw8SODlql4WWfdxSJ637DNojKZe7UiiFgpSdBS7yzRpAtRtQNZsyZVPz
 W4htSJPVRqLhUok3/61UfwHqzRXqpivlMrTxwRcF5DgKR5Gvf1uZWLcgHyotNvkBoNHTND+zT23
 kioAZRxPANUTvkFBr6/639zvtyNc6IGwUdoFKs/4MuPHz7kWUaecXqktpb+fhws/KzDnngv4s/y
 JdT58EttvbGyhY59dBL/GPnK4WlbNaCsSkJzrIKLPN+4+V5/JkeUEDwr+e2gMHv6AQ/Z7njSr4F
 B9+8jh63yNwIgnrliPPDekj4ou7GJly1HW89IElQw3dYst5ExxRui/HMIKYESWXkQncpXWKU/H2
 CUaa1Wskzb5mVuM00IEbMnT/tR9pDXxtjVRT+xP/HBkg770NAzP6J6KUsej5vivNF0Ytd5NUW2c
 3gC540NPz3itudCDZVm17XmZiWBK98TgmsHQ==
X-Received: by 2002:a05:600c:3516:b0:492:3e66:6c84 with SMTP id
 5b1f17b1804b1-493e68782cdmr58719135e9.30.1783582596744; 
 Thu, 09 Jul 2026 00:36:36 -0700 (PDT)
Received: from [192.168.0.116] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493eb6e0e5asm41503265e9.9.2026.07.09.00.36.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jul 2026 00:36:36 -0700 (PDT)
Message-ID: <27702403-4ecb-4f83-ac02-080a689d94a9@ursulin.net>
Date: Thu, 9 Jul 2026 08:36:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/gt: use correct selftest config symbol
From: Tvrtko Ursulin <tursulin@ursulin.net>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260705080225.436-1-pengpeng@iscas.ac.cn>
 <6b551a44-96fe-4429-a337-9e6a32ac5156@ursulin.net>
Content-Language: en-GB
In-Reply-To: <6b551a44-96fe-4429-a337-9e6a32ac5156@ursulin.net>
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


On 08/07/2026 09:41, Tvrtko Ursulin wrote:
> 
> On 05/07/2026 09:02, Pengpeng Hou wrote:
>> intel_engine_user.c checks CONFIG_DRM_I915_SELFTESTS before running
>> the engine UABI isolation check. Kconfig defines DRM_I915_SELFTEST,
>> without the trailing "S", and the rest of i915 uses
>> CONFIG_DRM_I915_SELFTEST.
>>
>> Because CONFIG_DRM_I915_SELFTESTS is not backed by any Kconfig symbol,
>> the IS_ENABLED() test is always false. Use the existing selftest symbol
>> so the debug/selftest guarded path can be reached when selftests are
>> enabled.
>>
>> This is a source-level fix. It does not claim dynamic hardware
>> reproduction; the evidence is the Kconfig definition and the inconsistent
>> guard in intel_engine_user.c.
>>
>> Fixes: 750e76b4f9f6 ("drm/i915/gt: Move the [class][inst] lookup for 
>> engines onto the GT")
>> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
>> ---
>>   drivers/gpu/drm/i915/gt/intel_engine_user.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_user.c b/drivers/ 
>> gpu/drm/i915/gt/intel_engine_user.c
>> index be4bbff1a57c..d5190e11b270 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_engine_user.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_engine_user.c
>> @@ -259,7 +259,7 @@
>>           p = &prev->rb_right;
>>       }
>> -    if (IS_ENABLED(CONFIG_DRM_I915_SELFTESTS) &&
>> +    if (IS_ENABLED(CONFIG_DRM_I915_SELFTEST) &&
>>           IS_ENABLED(CONFIG_DRM_I915_DEBUG_GEM)) {
>>           struct intel_engine_cs *engine;
>>           unsigned int isolation;
> 
> Looks correct but we need to have a test run done to see that the checks 
> this guards actually pass. Please stay tuned for results and please do 
> ping us in a week or so if we forget.

CI was all green. Pushed to drm-intel-gt-next.

Thanks,

Tvrtko

