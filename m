Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD91BC79F9F
	for <intel-gfx@archiver.kernel.org>; Mon,  7 Sep 2026 09:54:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C4B210E740;
	Mon,  7 Sep 2026 09:54:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="Jf8ZnWNU";
	dkim-atps=neutral
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CDB610E740
 for <intel-gfx@lists.freedesktop.org>; Mon,  7 Sep 2026 09:54:21 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-6a60f0dbeccso4201381a12.0
 for <intel-gfx@lists.freedesktop.org>; Mon, 07 Sep 2026 02:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1788774860; x=1789379660; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=BgnlZVhlCEMT9ZJriynmZJUUk5Ix+RJKVKHSp62UhtI=;
 b=Jf8ZnWNUIXoxdeVWV10AFJcje0r6ZXn0pVLgJorZtVaqLNOIfYUfpSah4gING3BGxI
 nNn2jahPAn+KsATjkLcS5DWWaVpj77KXB4F0MiJy44tyfF5zDffRh+vMFruwRmdf+TrN
 bd/KiLE2PwFKTsd6UJk9Aifzi5EhxRtY678HtEfi7VFFfa3e1zIIYs2T6uRuGjFQ8P9n
 T9Ke9ZNDmpCguQULmyJK5ctRTGxOdWVQn8VhwyX89nxneG1/sfZbmnsCxHIocOIP5x7Y
 HnroqdgfqabbCC4by0nBMFggtvFuHYpNMRHJ6QsUE9qGEZWGPvSNUCttXWLkx65YpQ4b
 CvRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788774860; x=1789379660;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=BgnlZVhlCEMT9ZJriynmZJUUk5Ix+RJKVKHSp62UhtI=;
 b=NABQFFwFvHwqxci0tneHSTixh/cCJxtJH3mrXOHy9+UD0WcVG65SY2nd95yDPoyKrJ
 MfoCr/jmgW7S6Jjz6/oBqyEn4+5wbqnhvnI9C8X4icJSwuLkma74K6GUNo4G2VJQQcXN
 jtseblxzvlgxC2YtPub30RG8gdsM4j92tSroUCVio2QLb4N4AJGYvFjzURTPqvPitcsr
 23PEv8opMqUG6jj48rpum2JCPCSGsjxKOs75MUkw1P2+LYf+3FY/iJiJMXiF8awtIYUa
 ILHzTG/vP1dCULpsCbCjSqGrfVnmB0xwtev4HfpCPtKPn4ZM9gn8qkwFktmNZxweo2Ce
 Vf3g==
X-Gm-Message-State: AFuF++kDsGaV1EHQctDuTNsiQBwZnA7lU9S5keWdfM0GxVJLaLhXRCIK
 bfChhaOjvljIMzANZMgUJIv/wQsIRyrX/gaUe5MHUANGbY2L0ysd7141PKBW/plgbic=
X-Gm-Gg: AYBFou398+0XHIx+Xnb+SU0vGBq4Vt72atoneIi7omaQcCdbeTmpEmf7CslQ03zSsgZ
 FWKC6BG+bQ7Di/uW6kZtvm266TFFIkYkK/+RBd4klWw+2DKLVOWO1Hatx7WxgXDeJc+eI+g5Ezm
 giTffVW0mZMye0cYMDBF7vmx8VX5HF9EPeRISieJQutb5XhSGpb+xG8INadfew26szsDS7TYyWK
 69kGPg5vI3ibeflY/BhHo7kILAoHE91JI86ysJTNySYRGxTU9YuGGFYb4p3MnVuXlJ+i6JGZcRA
 +sF+RuUhUP3YPvYJMdAo0I659ZPrUmlSAiguAPPiz5CReC9U1KuCrtG5+DzGaoR9r34qVEXhiGv
 zAf0rqzH+C1DuVKYqGx7mTee4bOgXFtHa6pghdUgW8CxS6odZQ7yXikXKQyC69vv1pgL4oEQ9Kk
 KpXf2CC5bxOS2wK0oJhQdYwgZomFIQBrto9SG7sIjNKZDh6APT2SDrsS9kTmU4FxKLtBLW7DEat
 SoS
X-Received: by 2002:a17:907:9815:b0:c26:1649:47b2 with SMTP id
 a640c23a62f3a-c2616495665mr666155066b.40.1788774859903; 
 Mon, 07 Sep 2026 02:54:19 -0700 (PDT)
Received: from [192.168.0.116] ([81.79.79.1]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c260d53c37csm434533766b.32.2026.09.07.02.54.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Sep 2026 02:54:19 -0700 (PDT)
Message-ID: <30c0848e-e8f6-4bb7-8505-89316158c49e@ursulin.net>
Date: Mon, 7 Sep 2026 10:54:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915: fix incorrect RCU teardown order
To: christian.koenig@amd.com, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20260903113621.54660-1-christian.koenig@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20260903113621.54660-1-christian.koenig@amd.com>
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


On 03/09/2026 12:36, Christian König wrote:
> i915_gem_busy_ioctl uses dma_resv_for_each_fence_unlocked() to iterate
> over the fences in an GEM object without holding a reference but only
> the RCU read side lock.
> 
> What can happen here is that the GEM object is destroyed concurrently
> while i915_gem_busy_ioctl is still running. This won't free the GEM
> objects memory, but still drops all the dma_fence references.
> 
> Now when dma_resv_for_each_fence_unlocked() sees a destroyed dma_fence it
> assumes that a new fence list was installed and re-starts the loop.
> 
> But in the case of a destroyed GEM object a new fence list is never
> installed, only the old one freed and therefore the iteration never
> finishes resulting in an endless loop.

Only i915_busy can get into this failure mode? None of the other users 
of the iterator?

Also, the reference counting series makes the fix irrelevant?

Regards,

Tvrtko

> 
> The solution is to drop the fence references only after the RCU grace
> period.
> 
> The fixes tag is not necessary the patch introducing the problem, but the
> one making it so worse that we need to address it.
> 
> This problem was pointed out by Sashiko-bot.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Fixes: 912ff2ebd695 ("drm/i915: use the new iterator in i915_gem_busy_ioctl v2")
> CC: stable@vger.kernel.org
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_object.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> index 5172d3982654..9e01f8b2079a 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> @@ -89,6 +89,7 @@ struct drm_i915_gem_object *i915_gem_object_alloc(void)
>   
>   void i915_gem_object_free(struct drm_i915_gem_object *obj)
>   {
> +	dma_resv_fini(&obj->base._resv);
>   	return kmem_cache_free(slab_objects, obj);
>   }
>   
> @@ -144,7 +145,6 @@ void __i915_gem_object_fini(struct drm_i915_gem_object *obj)
>   {
>   	mutex_destroy(&obj->mm.get_page.lock);
>   	mutex_destroy(&obj->mm.get_dma_page.lock);
> -	dma_resv_fini(&obj->base._resv);
>   }
>   
>   /**

