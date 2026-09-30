Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 518E7CA5FB1
	for <intel-gfx@archiver.kernel.org>; Wed, 30 Sep 2026 08:02:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1B8D10F218;
	Wed, 30 Sep 2026 08:02:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="n6CTPiPh";
	dkim-atps=neutral
Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com
 [74.125.228.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF06310F218
 for <intel-gfx@lists.freedesktop.org>; Wed, 30 Sep 2026 08:02:17 +0000 (UTC)
Received: by mail-ej2-f43.google.com with SMTP id
 a640c23a62f3a-c2e17363b97so92668366b.0
 for <intel-gfx@lists.freedesktop.org>; Wed, 30 Sep 2026 01:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1790755336; x=1791360136; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=UqC6UJWhxlrqGPM5iVHDPkS4jSyFCqeT0mQAjktJVfE=;
 b=n6CTPiPhlq9ZY38Z8q7Q8ADKhxvEuCmSxxAL2dtaKcwcRqkSKW19w6iB4mkU90UsKy
 akST1cw3DU3VojCftvCXNZCi2z95oJOiu7Ebhf0FMFo5MZG2XhlDq/lm4aJzj9/ebArp
 0rMFgubcrbqNmm8/1aVdW+PZiPOxOBrvcdNhx4ZNK7tz5lMGhhoZsM2jGn76dxxsBU0O
 /wUNMYdkDrInBmCmiz3jK7cKZBER+nZeKmP1AhkgKLsOWB1c7wzR9iifPn+L+izkPiVs
 kWDJw9vVllN5vRdCejYaMRg0j7NgiMSxssw7F18e/zqPg6yp88tvLHUbLiW7LZzQcehk
 bjng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790755336; x=1791360136;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=UqC6UJWhxlrqGPM5iVHDPkS4jSyFCqeT0mQAjktJVfE=;
 b=u4Pk9ypIoGaThWv5/keknxGhBAUv1PnIvVf62sHK7rVEYY0OLwebcOKLLPH3cg71tE
 8dgLcrArMDdcVC5X/54p3sdmp8slsvSmt20adI+KnFkF3YN1/A3umYXpZlEeOas0/1r3
 tWRTI1DwP0PPRE7rHxw7/ikbAcvrGEBJiv5Wu/Qe5qJuks1NSNwp2og6RfQCcPAP3rW8
 lQIeBgxJ7VC+pegl73Hoffxnp3NCYVsfXfpcGqwuCOE1LMv6mJNaJKOGFZnrRpt50f8F
 b4h5s7e7MJl4kDmH8O3Nx9V5CGnE7v6rFBcOI79KJ3VxdKWPQjHEI/TErt+PnGrBcNiA
 MR1Q==
X-Forwarded-Encrypted: i=1;
 AKwUvBw8gPvEzeZR8nHEmqKaUHSrSdBcIoyoKA68wD29jQuCFaLjihWdWZFeGKvbfNrp54Na2VM2Y/GNbZQ=@lists.freedesktop.org
X-Gm-Message-State: AFuF++lViFKZhWWpZjZxol9K/wsJvO8R7qQhyH/9hZl0vY1Y717tkD0h
 nGqms2t2nlIE4sClk25yc7e40FFbkVANjiffAd4cHgfMJD68CraU0pxoEGb+n0O+xI4=
X-Gm-Gg: AYBFou2LpH0XCyKadwt1Xx4GpX2RRe95j9oFcI/53wENvSsUReEjoJb9Cs8NewrLLix
 O/Nd9UTF20mILgTmLQA8wKRevXnDNigW2b3zDk3OY3q4u4CsnQ9vDvkAIbmOQsiPj2vWSp5Dhj+
 D4gDwTzbBWPH5sLsoPbDeQsPzYh74f4ifnYLOghCWKNbZbmPqXlNw1IAw5HweYqwuXOB4w07PxP
 B0vZttns+0E/vwDghHCNHBOogMFlIGJmF8Ui+NLLgFEHPvuiYSG18q+V/lf7X7Msawpl8ItWfSE
 RdYLXRRcKMiiXpFGeQhu52l+vzEEx5aG0IkNz4Uj+OcoZhGY56HoqxE1SEFrls+Bup65lRNCzzc
 gQRlPr+RxWQfdNMdoWzqT4rKFeWYh+JkV0hDhB9ixitwcmWlN5S5XK3HBIH7nUPLPmVi+UVDufH
 uZscroj3Yrl7Oa70hEiOhY/PVJOBYIpjNvYA026BdUOJua78H8XX0c4WQAdOKhVwgTJxx2GIrjp
 o8Y0weiq90LWw==
X-Received: by 2002:a17:907:6ea4:b0:c2d:c7df:50ad with SMTP id
 a640c23a62f3a-c2e23e14586mr44108466b.38.1790755336013; 
 Wed, 30 Sep 2026 01:02:16 -0700 (PDT)
Received: from [192.168.0.116] ([81.79.79.1]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c2e274e3473sm4417066b.34.2026.09.30.01.02.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Sep 2026 01:02:15 -0700 (PDT)
Message-ID: <83bc37f9-e5b5-41de-a03b-6de01966ffe6@ursulin.net>
Date: Wed, 30 Sep 2026 09:02:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/i915/pmu: Disable on PREEMPT_RT
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 intel-gfx@lists.freedesktop.org, vinay.belgaumkar@intel.com
Cc: dev@lankhorst.se
References: <20260929190147.2886670-5-umesh.nerlige.ramappa@intel.com>
 <20260929190147.2886670-6-umesh.nerlige.ramappa@intel.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20260929190147.2886670-6-umesh.nerlige.ramappa@intel.com>
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


On 29/09/2026 20:01, Umesh Nerlige Ramappa wrote:
> From: Maarten Lankhorst <dev@lankhorst.se>
> 
> I tried to come up with alternative and lockless approaches
> to make pmu work, but since the perf events are run in
> atomic context on PREEMPT_RT, ordinary spinlocks no longer
> work and forcewake and register accesses become problematic.

If it is only those events put the checks into config_status and 
engine_event_status respectively. That will allow the non-problematic 
events to work.

> Disable perf events on PREEMPT_RT for now, without affecting
> !PREEMPT_RT users.
> 
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> ---
> v2: s/reeturn/return/
> ---
>   drivers/gpu/drm/i915/i915_pmu.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
> index 1c3bafda9c70..9ea5626399e5 100644
> --- a/drivers/gpu/drm/i915/i915_pmu.c
> +++ b/drivers/gpu/drm/i915/i915_pmu.c
> @@ -1156,6 +1156,16 @@ void i915_pmu_register(struct drm_i915_private *i915)
>   	};
>   	int ret = -ENOMEM;
>   
> +	/*
> +	 * PREEMPT_RT has problems with forcewake. Forcewake is used by the
> +	 * engine 'busy' event when guc submission is enabled, and to measure
> +	 * rc6 residency.
> +	 *
> +	 * Disable pmu events on PREEMPT_RT entirely to prevent deadlocks.
> +	 */
> +	if (IS_ENABLED(CONFIG_PREEMPT_RT))
> +		return;

It would be nice to emit a suitable drm_notice here, equivalent to how 
the existing error path does if the registration unexpectedly fails.

Regards,

Tvrtko

> +
>   	spin_lock_init(&pmu->lock);
>   	hrtimer_setup(&pmu->timer, i915_sample, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
>   	init_rc6(pmu);

