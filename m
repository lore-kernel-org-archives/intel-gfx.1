Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C082C44507
	for <intel-gfx@archiver.kernel.org>; Wed, 15 Jul 2026 12:14:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08A8410F01E;
	Wed, 15 Jul 2026 12:14:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="Fvk8vNNk";
	dkim-atps=neutral
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE0E310F01E
 for <intel-gfx@lists.freedesktop.org>; Wed, 15 Jul 2026 12:14:14 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4953ddae026so3583055e9.3
 for <intel-gfx@lists.freedesktop.org>; Wed, 15 Jul 2026 05:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1784117653; x=1784722453; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=7aHFIbRIct4Xy5ZFU/LnjDMqs8nCN3Zn/Gkw/4VvNHs=;
 b=Fvk8vNNk/P85M4DYqh1rlGfXcqImoOkzA8u6bFp3PmHL2e8jg6gGsNZi7Ku2WEiIgo
 /b/tLNbWmNtzdBSrFxyf/UAz2E0SJXJXSPPGav8aM+3jJeg4D6YKjfGL4+RtNiHaGrPN
 KP4cReFQLRl4311n+MomgINQgUPQa7pzgoM7Xnd5KoM8okkvv2MGOSR+INqbaVYzlxRp
 QMxxGmd9+qSjXSi8Mj608qAdDXLmd4H2UkAnRo1rhjWe7SXL8aRPphRoa6NhMMUTw/LH
 24ed8UbIXCA6/qmLqHYagUsBw62vVi8ogh3U4eIYpo4UXcIAjJ8HadGCYO9Zh9R867ju
 ajdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784117653; x=1784722453;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=7aHFIbRIct4Xy5ZFU/LnjDMqs8nCN3Zn/Gkw/4VvNHs=;
 b=KONdeH8WcVpy7rJ+uErMKCeJP2bCR25E/bxC1hWPVviNEfEUMo7PCjo8SrI7ZPUzYd
 VvYKcPvF872mTWfHjSoIcK1+1Rny1C1sTSlgAJ9Hnr/n57zGW8aXp7Om/7/JfpatTRLV
 rXWAbBnQAiLQ2orn/JAYa0R64cjUb+NkcOlzpV1abjcIAjLCIxXTIAFpUz+4HzlEya7a
 /dpyTWGi5IwGskOxStXRr1Su992doSn3n11huncHob3O+XTrGmdfH9eyXZ8fD8iZS18l
 g7Ji/D66q54z+XfDzykSelsZPaiz8dbfGIdsL5gf2vABwB6fMXDPr5m2TMUO7Ro4i/0F
 vusw==
X-Forwarded-Encrypted: i=1;
 AHgh+Rquhbf4005YsiuGk6vCpOGi2+N+QKDPBXVnZRETLOYlHDPFQVNSu2yFYkL/Z2yTjUINLOQw5lGJdjI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw+bHIbQQ8r8LTryYtEq+dUcLoFCMks6qpV+g2n7+3N0pJcp3zV
 puUc42RGWiD3y5rEKIn00jk4sz0FOx+jZTmB8hCfj6OLqojjO8+hpMe0An6VUYWgC8o5pczdGFP
 xtgHdnaQ=
X-Gm-Gg: AfdE7cnLgEV5CfoIqjBGyppK21hAPE8MzcRxekiTKEvQKqmCQqr+YKA1Of0yZThWPgj
 Sg8Z9yvpqxc2XkaUr9J2FCXKX/EcDPMOhvXIYSRVPEwPDo2BLVcjcMrCtlUz1CunL75kM2+Ndou
 Y/id93wBCfA3XpffHRwcMFDREjr6aNaoPdMCP7VbSiaEgelaqlPjLcnsq+tidSkebDamR6g9UAo
 /MZCIXPoaAjif3Z4Txr950oV0o0lROJGKBqs+IqrocOtewfETGWV2p677IuPOKsyLr5tVTtjL36
 ZuxW/N61UANB0RrNJ4CNeJm9vrJWLqipj2aIPpo4mnd+jP8hVGGG/qqLCQYQgC3+z4GSFjpl9Mq
 kVhVpvHQcCfxylRWT3mH3cR1qVZcE5Eidx5Ae3+AR0USzC+2OtbanaAECY3lvud3wTFu7qm48YO
 eIKNaZd0CoIo6A6k5eol+1s5IKDIityoKqaNf0Cpa3FikU
X-Received: by 2002:a05:600c:8718:b0:492:7101:3d88 with SMTP id
 5b1f17b1804b1-493f881d4bfmr163343225e9.24.1784117652978; 
 Wed, 15 Jul 2026 05:14:12 -0700 (PDT)
Received: from [192.168.0.116] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4950a32c65asm147735425e9.14.2026.07.15.05.14.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jul 2026 05:14:12 -0700 (PDT)
Message-ID: <eb96c43d-2dd1-4c45-be68-762c861b90a1@ursulin.net>
Date: Wed, 15 Jul 2026 13:14:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/selftests: Fix GT PM sort comparators
To: Emre Cecanpunar <emreleno@gmail.com>, intel-gfx@lists.freedesktop.org
Cc: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, chris@chris-wilson.co.uk,
 ville.syrjala@linux.intel.com
References: <20260714220430.238433-1-emreleno@gmail.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20260714220430.238433-1-emreleno@gmail.com>
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


On 14/07/2026 23:04, Emre Cecanpunar wrote:
> Compare the sampled clock values instead of their addresses. Comparing
> addresses leaves the samples unsorted, preventing the code from discarding
> the minimum and maximum samples.
> 
> Fixes: 1a5392479207 ("drm/i915/selftests: Measure CS_TIMESTAMP")
> Signed-off-by: Emre Cecanpunar <emreleno@gmail.com>
> ---
>   drivers/gpu/drm/i915/gt/selftest_gt_pm.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/selftest_gt_pm.c b/drivers/gpu/drm/i915/gt/selftest_gt_pm.c
> index 33351deeea4f..07eaf71955c4 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_gt_pm.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_gt_pm.c
> @@ -16,9 +16,9 @@ static int cmp_u64(const void *A, const void *B)
>   {
>   	const u64 *a = A, *b = B;
>   
> -	if (a < b)
> +	if (*a < *b)
>   		return -1;
> -	else if (a > b)
> +	else if (*a > *b)
>   		return 1;
>   	else
>   		return 0;
> @@ -28,9 +28,9 @@ static int cmp_u32(const void *A, const void *B)
>   {
>   	const u32 *a = A, *b = B;
>   
> -	if (a < b)
> +	if (*a < *b)
>   		return -1;
> -	else if (a > b)
> +	else if (*a > *b)
>   		return 1;
>   	else
>   		return 0;

Pushed to drm-intel-gt-next, thank you!

Regards,

Tvrtko

