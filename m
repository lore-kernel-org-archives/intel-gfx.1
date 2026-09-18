Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCA6FC982DA
	for <intel-gfx@archiver.kernel.org>; Fri, 18 Sep 2026 10:01:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2708110ED4F;
	Fri, 18 Sep 2026 10:01:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="SzozsgZh";
	dkim-atps=neutral
Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com
 [74.125.228.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61E3910ED4F
 for <intel-gfx@lists.freedesktop.org>; Fri, 18 Sep 2026 10:01:38 +0000 (UTC)
Received: by mail-ej2-f43.google.com with SMTP id
 a640c23a62f3a-c254f55efe5so80774366b.2
 for <intel-gfx@lists.freedesktop.org>; Fri, 18 Sep 2026 03:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1789725697; x=1790330497; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=iEbsTjofMtHgpcEzx6X97K948OuXV1PVOXo0ZagJ2m0=;
 b=SzozsgZh1UOcu0jkOdowrupJPS5y4U2bic3x6hEQJYJXI+MT20OvHirAR8lHp1rjdQ
 BABiUZlFvA2jIbi+L15u7SQ5Bpa5T0vux6JkTsXHZPZNVqrbNC/RiFlh9Na1t760eUsw
 qZ7IZ+ww6EmQXuALMRHa32t6JxFAUNhQTK5B8jYhkctqIb/RLCO9eZTbpJ5blNFqcz2l
 oOtez4FtUkFm/d91TjJ5F8m4HCfGeh5TJUp80jl9UHpQTPf87FvRe6fkZ5nz+tVRspcY
 2ke6slq9VH4IC/LEOswluvm3MwLsMBCHjKLpkf5nqDhTToGUJWagDAbRzoXGdzIApUr5
 m+zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789725697; x=1790330497;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=iEbsTjofMtHgpcEzx6X97K948OuXV1PVOXo0ZagJ2m0=;
 b=dr6dx4tWZDXjdioOY5n6K0OR9c23igABA1NODL7MMGywxzN45EOnSAWpqUnHu1IqHU
 KCrYSPmnmoONI6uKDbMiLMqirpT0e8VDinPilrd2yykeR7pG0TQbKCZhzDqR59N6eJ38
 lwkf8MqY8AnUbexsoIh8u4Oyn2tGA3J/2gcshs81P3wAwiIGarAq3ScH8YMZpcaWh1yZ
 hI9Fj2n6gEzA51Byk16SWUo6zFZVJ7BwRGyqnTSlTxC3Hk05H3qhvJtaVWH3RnTJR39i
 5DzcrqlW4noYxcm7NPa4doXhrDSV0MtncgEhB5iOxtDa10Ups67np5W+qXlKrB84oJQB
 yFWg==
X-Forwarded-Encrypted: i=1;
 AKwUvByiaC9xnzr7xuA3u4DT9BLId0nEdFh1etbRJzyOoGtEIRsKY9H3mCcwiUl1elxl8q5uazS/XjPl4uY=@lists.freedesktop.org
X-Gm-Message-State: AFuF++l1gbT2GhOmZvQFXJkgnfX+YymSww1iAvQaR2Rpk59JLC4YDdeM
 Sep7kyHejsNlPdoapmcS/1qHUoWFEc0hoyNyQEigx7ybEzuXcU7/xbSVJUDWaWCoSl4=
X-Gm-Gg: AYBFou3HqSUPLS36ASPyCdTQTyvpwtlfiZwP6r/FlEwqfHmXytNdjzopaGjNTIc7/u/
 06RapFSHUFnS60x1mwgNd+MT59lEy8GZI8D5z28viuSPr+h09pkFzPVZv8yXhp7v/TkBoaqHtt2
 jCO/qRKv/4XovxwuHdf4U8bN9d8LLF143dhJLplntLFKXWQ5jrANjVPbDV8vxr78V2mmxIwK9ER
 LlsQq3Xvru0OyR/A0aE+MVzbEJRMt1CXlKDXTy5Gm+1V6XVofa+4AnqMQ972jU6oYwGbCOzFkvj
 6SYyb82n3aQwYUhQdZXxRIqdMsfBPiaLCGETg25Dc5vEEJojwsk84fJA6nTMUJ/nL7cVvK/yhNm
 o4oyK6+WI6Hy0DWEHGTe8GI7M5O8x9jTgpFF8tSDfphVWWOPeaU7br933GxhiW1GTDCpgNPHxU+
 sUkSG1pSu1m2haoTPsyF2YeWbxezAYHZ0POoqdrxs5ItiNKV1dhDHkGmayoyMqTt404qMsF0equ
 D+k1kT0w0ea+8E=
X-Received: by 2002:a17:907:d644:b0:c26:2f5e:29c7 with SMTP id
 a640c23a62f3a-c2a156590acmr195801266b.7.1789725696554; 
 Fri, 18 Sep 2026 03:01:36 -0700 (PDT)
Received: from [192.168.0.116] ([81.79.79.1]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c2a1bb46f17sm39115966b.31.2026.09.18.03.01.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Sep 2026 03:01:33 -0700 (PDT)
Message-ID: <f4e72135-2a8f-4099-9245-4d8c36c30713@ursulin.net>
Date: Fri, 18 Sep 2026 11:01:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/7] drm/i915/gt: Fix selftests on PREEMPT_RT
To: Maarten Lankhorst <dev@lankhorst.se>, intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
References: <20260706114823.752313-1-dev@lankhorst.se>
 <20260706114823.752313-5-dev@lankhorst.se>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20260706114823.752313-5-dev@lankhorst.se>
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


Commit message where are thou? :D

Regards,

Tvrtko

On 06/07/2026 12:48, Maarten Lankhorst wrote:
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> ---
>   drivers/gpu/drm/i915/gt/selftest_engine_pm.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/selftest_engine_pm.c b/drivers/gpu/drm/i915/gt/selftest_engine_pm.c
> index 10e556a7eac45..c1eff9edd8a5e 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_engine_pm.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_engine_pm.c
> @@ -277,11 +277,11 @@ static int live_engine_busy_stats(void *arg)
>   		st_engine_heartbeat_disable(engine);
>   
>   		ENGINE_TRACE(engine, "measuring idle time\n");
> -		preempt_disable();
> +		migrate_disable();
>   		de = intel_engine_get_busy_time(engine, &t[0]);
>   		udelay(100);
>   		de = ktime_sub(intel_engine_get_busy_time(engine, &t[1]), de);
> -		preempt_enable();
> +		migrate_enable();
>   		dt = ktime_sub(t[1], t[0]);
>   		if (de < 0 || de > 10) {
>   			pr_err("%s: reported %lldns [%d%%] busyness while sleeping [for %lldns]\n",
> @@ -316,11 +316,11 @@ static int live_engine_busy_stats(void *arg)
>   		}
>   
>   		ENGINE_TRACE(engine, "measuring busy time\n");
> -		preempt_disable();
> +		migrate_disable();
>   		de = intel_engine_get_busy_time(engine, &t[0]);
>   		mdelay(100);
>   		de = ktime_sub(intel_engine_get_busy_time(engine, &t[1]), de);
> -		preempt_enable();
> +		migrate_enable();
>   		dt = ktime_sub(t[1], t[0]);
>   		if (100 * de < 95 * dt || 95 * de > 100 * dt) {
>   			pr_err("%s: reported %lldns [%d%%] busyness while spinning [for %lldns]\n",

