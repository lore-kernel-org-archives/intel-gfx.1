Return-Path: <SRS0=c2Tb=MM=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B9AEC07E95
	for <intel-gfx@archiver.kernel.org>; Tue, 20 Jul 2021 13:08:21 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0EB6610D2
	for <intel-gfx@archiver.kernel.org>; Tue, 20 Jul 2021 13:08:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E0EB6610D2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 356266E301;
	Tue, 20 Jul 2021 13:08:16 +0000 (UTC)
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A33116E2D5
 for <intel-gfx@lists.freedesktop.org>; Tue, 20 Jul 2021 13:08:14 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id l7so25926808wrv.7
 for <intel-gfx@lists.freedesktop.org>; Tue, 20 Jul 2021 06:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=uvHTohQOXUo1eNzTbptDnQ980SKchLpYfyQkug8oLsM=;
 b=FZ7B87n7ZKH5WlwYufOcG72EJmbAaUBUE4aFuEpuEsqmjOIyRz6/XyFpVO7exRf5Wb
 dyZrHG+WOrHkEo9owvwnpXCrJcTd7X4Frz4ddtsdLCY2qk9tlFUBWk94lopmcQM3+zt6
 BjfmggyN4mvYvqpXEhBlTfCVoea5a0qDcd/Ss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=uvHTohQOXUo1eNzTbptDnQ980SKchLpYfyQkug8oLsM=;
 b=jrndlTxLDEaKoE4VkzKesCLxiGF6SV6vzUJDsr20qd128jq4gd/wgj6CDyOxDSQdUv
 5r11irwKJNeTRxXa8GrCdSQhG+EgpYFmpAmRDT4tjRStls1u17LBn3SqEFsmsC+++ecr
 071ZVdMgyZKmUCCEcdW869+LdOUSrC/dzDqi+GfkqsD+z+IFlPE0iGgqMdF+7XIdTaG1
 8wZVYfnOEpRDU0QNMigc6Miq5tLJqd46rh6pI9T9Ywvb+sho+2stEgrQxEj2rOt2tFW6
 KwdL2XqfeiwGY4FBnZnar2QFP/y3drO0D9yMe1odfXnp3+CtsqbideEUzVlnAspFwCQF
 le+Q==
X-Gm-Message-State: AOAM530HaMH8RmVHfZ4RJ3jvfBveiAp1nz51cGxcafX5uBd0uKRpiOX4
 InbUr7b23b6StWlKz7ekm/KqZw==
X-Google-Smtp-Source: ABdhPJyUbagFa2jJYY8PhdxQ3iWQEkYXCDmIYQQXB8xNIPSArbgllu0G7MR5Pi9l2jz7RgWOZA4nAw==
X-Received: by 2002:a05:6000:2a1:: with SMTP id
 l1mr35043388wry.128.1626786493358; 
 Tue, 20 Jul 2021 06:08:13 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id r17sm2423906wmq.13.2021.07.20.06.08.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 06:08:12 -0700 (PDT)
Date: Tue, 20 Jul 2021 15:08:10 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jim Cromie <jim.cromie@gmail.com>
Message-ID: <YPbKukQVbHt1Yuin@phenom.ffwll.local>
Mail-Followup-To: Jim Cromie <jim.cromie@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>,
 Zhenyu Wang <zhenyuw@linux.intel.com>,
 Zhi Wang <zhi.a.wang@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, jbaron@akamai.com
References: <20210714175138.319514-1-jim.cromie@gmail.com>
 <20210714175138.319514-2-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210714175138.319514-2-jim.cromie@gmail.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
Subject: Re: [Intel-gfx] [PATCH v3 1/5] drm/print: fixup spelling in a
 comment
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 jbaron@akamai.com, Maxime Ripard <mripard@kernel.org>,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Wed, Jul 14, 2021 at 11:51:34AM -0600, Jim Cromie wrote:
> s/prink/printk/ - no functional changes
> 
> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>

Applied to drm-misc-next, thanks for your patch.
-Daniel

> ---
>  include/drm/drm_print.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
> index 9b66be54dd16..15a089a87c22 100644
> --- a/include/drm/drm_print.h
> +++ b/include/drm/drm_print.h
> @@ -327,7 +327,7 @@ static inline bool drm_debug_enabled(enum drm_debug_category category)
>  /*
>   * struct device based logging
>   *
> - * Prefer drm_device based logging over device or prink based logging.
> + * Prefer drm_device based logging over device or printk based logging.
>   */
>  
>  __printf(3, 4)
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
