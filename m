Return-Path: <SRS0=HRyj=KW=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06D76C4707F
	for <intel-gfx@archiver.kernel.org>; Thu, 27 May 2021 18:30:20 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCC66611AE
	for <intel-gfx@archiver.kernel.org>; Thu, 27 May 2021 18:30:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DCC66611AE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4231B6E1F8;
	Thu, 27 May 2021 18:30:14 +0000 (UTC)
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01D796E05D
 for <intel-gfx@lists.freedesktop.org>; Thu, 27 May 2021 18:30:12 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id h3so752212wmq.3
 for <intel-gfx@lists.freedesktop.org>; Thu, 27 May 2021 11:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=th4fpjlCF9zEoEEQL6PVdHcI+KOR2e327eVJ2akX43w=;
 b=VgH9yPk+yusgKAEZ3cMdWYs6VDKFj8bpLMYsh7qIXky5daSFv1Uqx5TjP5PNWuZLDw
 1iTePgdTkjV3eocy+FDJhD4vQSqSrTvXhPyANhnUpgWyH4bh6ZbFpt0HA8XUGumImR9B
 DwBZ55UWyW408BbMTj50z3VAaQPvWjJWr/cW4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=th4fpjlCF9zEoEEQL6PVdHcI+KOR2e327eVJ2akX43w=;
 b=OW36Uw2Fxas+TVTn8r8tnUvFQh+9AyR8DFnJ/pWPDDFbmDzN16bb8IaQ/qygKJRX84
 RIu5oy3P1nR3/LZVN6av7jNDjXOVcIeS6LhlkfzE6ryVwcG+yqpcEt7pVUSvR19U5PrK
 L7E/0iRrrdr7L5kxRrI1DA/s1fs6Yvb5PFuzE2wI7KR1UvF4yFOqSfnDMDk4+Hw1zOAa
 O1T9zdmpt5XPAd4sEAdk4yERHW/gXVJETznyawIOvgxGvLZdTWSt91XVDUqunhGk7MX9
 +6MrWw9mK/U6BEn5guW7OHuKUPEivC8M7oo/njrQtW4sbgFaGsutmTde5q1xX0E3TEsw
 6zBg==
X-Gm-Message-State: AOAM5317Ru+O6kiYgmUNoWO4OVagc+Cr8bTu1xpH6JICkA0Db00TX0V0
 gIDeHBJoNwCZvHxoGx8erPZobQ==
X-Google-Smtp-Source: ABdhPJziW9WSdPo0Wi7PQWmG3oT+MzPgwwTUVGa0LlgKpC/KOMiD96QWcEjQAz/giRnJ8iZOiaeMBw==
X-Received: by 2002:a05:600c:214f:: with SMTP id
 v15mr9959420wml.86.1622140211523; 
 Thu, 27 May 2021 11:30:11 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id m7sm4930102wrv.35.2021.05.27.11.30.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 May 2021 11:30:10 -0700 (PDT)
Date: Thu, 27 May 2021 20:30:09 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Ekstrand <jason@jlekstrand.net>
Message-ID: <YK/lMS/h30vd48FF@phenom.ffwll.local>
References: <20210527162650.1182544-1-jason@jlekstrand.net>
 <20210527162650.1182544-20-jason@jlekstrand.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210527162650.1182544-20-jason@jlekstrand.net>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
Subject: Re: [Intel-gfx] [PATCH 19/29] drm/i915: Add an i915_gem_vm_lookup
 helper
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Thu, May 27, 2021 at 11:26:40AM -0500, Jason Ekstrand wrote:
> This is the VM equivalent of i915_gem_context_lookup.  It's only used
> once in this patch but future patches will need to duplicate this lookup
> code so it's better to have it in a helper.
> 
> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/i915/gem/i915_gem_context.c |  6 +-----
>  drivers/gpu/drm/i915/i915_drv.h             | 14 ++++++++++++++
>  2 files changed, 15 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> index d247fb223aac7..12a148ba421b6 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> @@ -1346,11 +1346,7 @@ static int set_ppgtt(struct drm_i915_file_private *file_priv,
>  	if (upper_32_bits(args->value))
>  		return -ENOENT;
>  
> -	rcu_read_lock();
> -	vm = xa_load(&file_priv->vm_xa, args->value);
> -	if (vm && !kref_get_unless_zero(&vm->ref))
> -		vm = NULL;
> -	rcu_read_unlock();
> +	vm = i915_gem_vm_lookup(file_priv, args->value);
>  	if (!vm)
>  		return -ENOENT;
>  
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index 48316d273af66..fee2342219da1 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -1871,6 +1871,20 @@ i915_gem_context_lookup(struct drm_i915_file_private *file_priv, u32 id)
>  	return ctx;
>  }
>  
> +static inline struct i915_address_space *
> +i915_gem_vm_lookup(struct drm_i915_file_private *file_priv, u32 id)
> +{
> +	struct i915_address_space *vm;
> +
> +	rcu_read_lock();
> +	vm = xa_load(&file_priv->vm_xa, id);
> +	if (vm && !kref_get_unless_zero(&vm->ref))
> +		vm = NULL;
> +	rcu_read_unlock();
> +
> +	return vm;
> +}
> +
>  /* i915_gem_evict.c */
>  int __must_check i915_gem_evict_something(struct i915_address_space *vm,
>  					  u64 min_size, u64 alignment,
> -- 
> 2.31.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
