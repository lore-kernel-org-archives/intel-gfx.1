Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78F78CD342C
	for <intel-gfx@archiver.kernel.org>; Wed,  6 May 2026 16:46:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0840410EE1A;
	Wed,  6 May 2026 16:46:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="qRc7v0++";
	dkim-atps=neutral
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9474A10EE1C
 for <intel-gfx@lists.freedesktop.org>; Wed,  6 May 2026 16:46:17 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-8383fb7143aso1722182b3a.3
 for <intel-gfx@lists.freedesktop.org>; Wed, 06 May 2026 09:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778085977; x=1778690777; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2iHyzzY7IE/rC7HEhQGg/8O8s6YqqNQ0FIxXhZwCh7k=;
 b=qRc7v0++C41UpN8IQyvNl0d6Z6SOMBeDmFKCGNPoDjNJpTwkj9n4C9MhYY4ESqQ1cp
 Gz6eCKJ3Ncdzf/4SZAN0sqyeO0AtCuFLXxPbM/Jzn3n/7ZrWTNrZgomB3QZ8XIF4AIzy
 FtiHpbPs67qOQSaGXFUcQupkNXzv3bJwg7S/Ck3bE68lwQ9cH8TOlxwu3a7FdaVRhGUA
 B/k3Co7/+OvZtd/3NfkHcaXmEcZh1TVJdD7O8puo4pZN42Kq7j2Xq67sKKCash8wb0Qa
 8c4a+TF5YOG+ws+8dZD7vuXRGehte4dqoewcyIyNREBDowQk4jB4We4bDUMllKZ35+Qi
 URAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778085977; x=1778690777;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2iHyzzY7IE/rC7HEhQGg/8O8s6YqqNQ0FIxXhZwCh7k=;
 b=V8Q2hJc5AwcHNCORGCkGTgH+vngtoW3c1bUrcUr5HOHYtC3ned1mxbXAo5EoIjBZAv
 8QhK4Mx3tQYnKJhxdTVTlI8RDgPq2HRv4LKDpBONsiB52qwpSO0smZrph4b+J45SwgcQ
 KQeuuVGQFJsWT00ey+lrhCh1i7MNKor4tBgGj72Kw+9XiJpGRuhiN4gW5kQHBysHNxcd
 GlYukhFcd8B6M3MCUdtzmTJhBv8sqNymRULRtgJWTO5kceC6FuoV94MNLd8BVQ3Lf+jt
 ZHj1FqeCLRfg5IuK00jlC504PVsi9yZ+inTeXn+Drtrq11BnpqDkrFhxLmzbbsdkNMjt
 chdQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+JE5tmO6NPflRS1ZTuMKRIBdE3dw2Ys7wfIs1lGfiSXSq6I+hR/zQTNCkatlTWlm/1z6qCs3lKIgM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yymkx462Myz7PUluXjkwyEq6NSZ9DQaji9d8heQRfxFEWvds+VV
 V01GhMZcnZP7EPgwE4/3NHu2j4gft+BW66sGRZ65XseFcR1R4OZjFFl6
X-Gm-Gg: AeBDieuzAuFdUSuHh3/IIdSypRSAbRh804RfckXUAkI0cmuSG2Qh5U4VlH3AOMFzWLP
 4qT0ySW8ur9r2x6Ongv8pdqFuv9AW7Ulng1uFV8CsP/nRVOHxsJ1HXvpAGvDGu/0wjE8/vv0lfA
 gji7MYQnp4RRhJgBqaA5oFBMOhCaK3MElcjeRzytDklKqLkeBadB4JTvEU9B2nEz6VW8uL1AZv2
 EGQNMJ8l2653k3tRRJVlQZUljWC5taGl3EDgmFrUAkz94xG/odV2q+bKCiPgeRd82A6ZbJx8vUK
 2avHkEEa+zL54PraXLB4gaoeqsg7sRWl9TcOMKHOnizr7uGRAJZTzl/0oGT2AqEYliSdwT5DFO1
 yaisTLomcEzgMeeksF41/p4s8jlTgwU19m2r+GC46soAwkqeCV13k3qF92Rqp8s+RBx75UTGlfN
 cfVRvRhaFaKyyXe+y1Oc3oS7Q1U9rvgAv9jPbiuBoZavydGsS6oex8k+gEnRq+4KRfptHNaHvIT
 UzhwOvWKQ==
X-Received: by 2002:a05:6a00:2990:b0:837:40f6:cb88 with SMTP id
 d2e1a72fcca58-83a5dc5df44mr4141131b3a.26.1778085976962; 
 Wed, 06 May 2026 09:46:16 -0700 (PDT)
Received: from [134.134.139.77] ([134.134.139.77])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-839679c8c1bsm7388946b3a.34.2026.05.06.09.46.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 May 2026 09:46:16 -0700 (PDT)
Message-ID: <c4081d03-c47e-42e0-87b4-0a517c0748f5@gmail.com>
Date: Wed, 6 May 2026 19:46:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe: Respect pin_params.alignment for GGTT
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
References: <20260430154602.11393-1-ville.syrjala@linux.intel.com>
 <20260430154602.11393-2-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Juha-Pekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
In-Reply-To: <20260430154602.11393-2-ville.syrjala@linux.intel.com>
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

look all ok.

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On 30/04/2026 18.46, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Fix __xe_pin_fb_vma_ggtt() to actually respect the GGTT alignment
> specified by the display code. Misalignment can cause GTT faults
> etc.
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   drivers/gpu/drm/xe/display/xe_fb_pin.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> index 3e8114fbfbaa..8d0067f908c5 100644
> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> @@ -286,7 +286,7 @@ static int __xe_pin_fb_vma_ggtt(struct drm_gem_object *obj,
>   	 */
>   	guard(xe_pm_runtime_noresume)(xe);
>   
> -	align = XE_PAGE_SIZE;
> +	align = max(XE_PAGE_SIZE, pin_params->alignment);
>   	if (xe_bo_is_vram(bo) && xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)
>   		align = max(align, SZ_64K);
>   

