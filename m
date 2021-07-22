Return-Path: <SRS0=pd08=MO=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 717A4C6377D
	for <intel-gfx@archiver.kernel.org>; Thu, 22 Jul 2021 10:05:58 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F03A661241
	for <intel-gfx@archiver.kernel.org>; Thu, 22 Jul 2021 10:05:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F03A661241
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1548E6EA2E;
	Thu, 22 Jul 2021 10:05:54 +0000 (UTC)
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25CF96E988
 for <intel-gfx@lists.freedesktop.org>; Thu, 22 Jul 2021 10:05:52 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 o3-20020a05600c5103b029024c0f9e1a5fso952252wms.4
 for <intel-gfx@lists.freedesktop.org>; Thu, 22 Jul 2021 03:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=MKCrubzNw+m5XCWRbANx2rZlu56zV+LIDXTT++NESQM=;
 b=Wy6O1hjTe/a9cJyqEKl9vYGyg14s8SGUxKVW2IiKoYGRNRIzp+mD3aylaNv79++DQn
 f6buNUgUutHExPDHaf//TQ5+IJVRQ1lrtwoL2F+5tI6tiBbrQfUHKvI540GzeDDSpzh9
 R1ir5pbtMLz1mRaAqrNvZSmDg70xayNcoGcFQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=MKCrubzNw+m5XCWRbANx2rZlu56zV+LIDXTT++NESQM=;
 b=h6+qrhopvH+F8QD+c0RuEYjH3O2zupokMUa3X9N2Ymtbk7973fnWZCGRy72oSD92fO
 HTgt+PH+Q3k7R9gY65ZW1xpGq0mZuSyLJ1u0eXs/vYrKtW//xBqoG+jrz6fPreH/DV9c
 JccdON6u2VtgKzO/OIGXbhgUCf6P/VjreMJbUQ788ZY8EhKLRh+ZHx9gOhEmQFR70Vfc
 9JyEXS6eYtyWBZrVlZCKIH8KDWm+US7+LE2dIZgg7s6g2K1+yP3oxTj3cHhdtCqBbYLC
 VbKv/3m0Kipn1IZaNK6Xj664VAg5WJb/Es6ItAHpPKFxVuqKsFih3AVCVKzBdYIeJxIL
 9mlA==
X-Gm-Message-State: AOAM531QeUFNJ/YgVEIOG2SGqhNLF55KuqEuVnXKRPvFxY52cizpNDWr
 QVKt7ogWmaiRjGqMAh8zlX10Ojn5A4KU/w==
X-Google-Smtp-Source: ABdhPJyMwmh9668k66jjJfeAQyN7Nl4NToUgchhmJQXgQZ4rw+D+Q/EaDWNCNuBl5b0Q0tb1Rke28w==
X-Received: by 2002:a7b:c111:: with SMTP id w17mr8353822wmi.163.1626948350810; 
 Thu, 22 Jul 2021 03:05:50 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id i10sm16540576wml.31.2021.07.22.03.05.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 03:05:50 -0700 (PDT)
Date: Thu, 22 Jul 2021 12:05:48 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Ekstrand <jason@jlekstrand.net>
Message-ID: <YPlC/GGI1G9uTiEt@phenom.ffwll.local>
References: <20210721152358.2893314-1-jason@jlekstrand.net>
 <20210721152358.2893314-5-jason@jlekstrand.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210721152358.2893314-5-jason@jlekstrand.net>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
Subject: Re: [Intel-gfx] [PATCH 4/6] drm/ttm: Force re-init if
 ttm_global_init() fails
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
Cc: intel-gfx@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Wed, Jul 21, 2021 at 10:23:56AM -0500, Jason Ekstrand wrote:
> If we have a failure, decrement the reference count so that the next
> call to ttm_global_init() will actually do something instead of assume
> everything is all set up.
> =

> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> Fixes: 62b53b37e4b1 ("drm/ttm: use a static ttm_bo_global instance")
> Reviewed-by: Christian K=F6nig <christian.koenig@amd.com>

This one is already in drm-misc-fixes.
-Daniel

> ---
>  drivers/gpu/drm/ttm/ttm_device.c | 2 ++
>  1 file changed, 2 insertions(+)
> =

> diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_d=
evice.c
> index 5f31acec3ad76..519deea8e39b7 100644
> --- a/drivers/gpu/drm/ttm/ttm_device.c
> +++ b/drivers/gpu/drm/ttm/ttm_device.c
> @@ -100,6 +100,8 @@ static int ttm_global_init(void)
>  	debugfs_create_atomic_t("buffer_objects", 0444, ttm_debugfs_root,
>  				&glob->bo_count);
>  out:
> +	if (ret)
> +		--ttm_glob_use_count;
>  	mutex_unlock(&ttm_global_mutex);
>  	return ret;
>  }
> -- =

> 2.31.1
> =

> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
