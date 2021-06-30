Return-Path: <SRS0=djoz=LY=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28CE3C11F65
	for <intel-gfx@archiver.kernel.org>; Wed, 30 Jun 2021 12:21:51 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EBAD0613ED
	for <intel-gfx@archiver.kernel.org>; Wed, 30 Jun 2021 12:21:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EBAD0613ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 382566E9B1;
	Wed, 30 Jun 2021 12:21:47 +0000 (UTC)
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A2C06E9AF
 for <intel-gfx@lists.freedesktop.org>; Wed, 30 Jun 2021 12:21:45 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id j1so3362784wrn.9
 for <intel-gfx@lists.freedesktop.org>; Wed, 30 Jun 2021 05:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=dcp/g6dyhUeuTReYVWOc8ONTvF5yUF04EmWd+WlqrQ4=;
 b=HVcIQumvIDzAtjUv1hdlJazfKBq1TjZE1hQKGGvdS1ln0S5q5j33LRG7LAwWQu/4c2
 L58mjA9vNgh6M+WKh+BwJToqdYLx6U9T9SzKiRzGps4wRWc2ES6Xu2xYYmeH3KyoXWkB
 ahaFE0BdcllBwuCOFI6NbJCFKk5UtT1xAGAnw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dcp/g6dyhUeuTReYVWOc8ONTvF5yUF04EmWd+WlqrQ4=;
 b=WeD58qXxN6/yQUchqrEqAJD2ZyFmTkrF620s+jFQLm6XAa9pqIPqOAtsgloiWR81FB
 kf4QrOC0XU6TKAxODkw7eVrhAx/kMd3zwG3F8hwFqSAhaVc11mHvGgbM1S4PCRmzxQ6N
 REfA4PGxnLWgv1YR8DcpiJmIb4TNDQtSjahq9NiwoT9pKQGDY8pEUy2cPtU5TNL9fQII
 BJ88Jrw9eM/r2VhdoKkdUXKnl9+qKov1XnzXA6/Fu+SFcM3BhmAapPaf32TxXfWV0RcA
 qDrBR77RxJE/P17Epdo6vfBE6VmxdYb+ifaMSaxxIToZczF/FSPlZAEiZ3Rlaal4ClIN
 iOiw==
X-Gm-Message-State: AOAM532Quh+SnL/1Sgo7b5UqNsIdiXWNX2P/uGpevDJXx7c36osyqGNI
 5xfOC0zNa99ZeEouw/dPwjhn5C/W0G6ggg==
X-Google-Smtp-Source: ABdhPJxbyWUqtgnxYBEVMuknmEXQku5ghpPgb/IzFmjFIsDzReHLXIhx7bE4WPsgD7PfKUwZ56mNaQ==
X-Received: by 2002:adf:ff8e:: with SMTP id j14mr38981091wrr.374.1625055703800; 
 Wed, 30 Jun 2021 05:21:43 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id x7sm21743182wre.8.2021.06.30.05.21.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 05:21:43 -0700 (PDT)
Date: Wed, 30 Jun 2021 14:21:41 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
Message-ID: <YNxh1UZew73jE0vb@phenom.ffwll.local>
References: <20210630120215.930829-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210630120215.930829-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
Subject: Re: [Intel-gfx] [PATCH] drm/vgem: Use 256B aligned pitch
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Wed, Jun 30, 2021 at 05:32:15PM +0530, Tejas Upadhyay wrote:
> Having different alignment requirement by different drivers,
> 256B aligned should work for all drm drivers.

What.

Like yes vgem abuses dumb_create, but it's not a kms driver. Pitch is
meaningless, and that's why we align it minimally to 1 byte (bpp = bits
per pixel here).

Maybe start with explaining what you're trying to do here.
-Daniel
> 
> Signed-off-by: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/vgem/vgem_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/vgem/vgem_drv.c b/drivers/gpu/drm/vgem/vgem_drv.c
> index bf38a7e319d1..1da6df5e256a 100644
> --- a/drivers/gpu/drm/vgem/vgem_drv.c
> +++ b/drivers/gpu/drm/vgem/vgem_drv.c
> @@ -215,7 +215,7 @@ static int vgem_gem_dumb_create(struct drm_file *file, struct drm_device *dev,
>  	struct drm_gem_object *gem_object;
>  	u64 pitch, size;
>  
> -	pitch = args->width * DIV_ROUND_UP(args->bpp, 8);
> +	pitch = ALIGN(args->width * DIV_ROUND_UP(args->bpp, 8), 256);
>  	size = args->height * pitch;
>  	if (size == 0)
>  		return -EINVAL;
> -- 
> 2.31.1
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
