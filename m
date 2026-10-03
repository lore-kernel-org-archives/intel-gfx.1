Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1493ACA5FE4
	for <intel-gfx@archiver.kernel.org>; Sat,  3 Oct 2026 11:23:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F49D10E876;
	Sat,  3 Oct 2026 11:23:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="UkPX7Dqs";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE9B410E0A1
 for <intel-gfx@lists.freedesktop.org>; Sat,  3 Oct 2026 11:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1791026578;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=n6DEk79+AjGFUJq3XsqFxT4woiJPH49kvRHU0q9Llf8=;
 b=UkPX7Dqsfwyoyavy9ZcxENIhMCgDpz6J4oHbqugbL1xZbLjvqFBRdes3S7q4F8OYmPxowy
 T6cV/7LYtK5E+DHKcErb7AM8PyUN/MX61wDG09aqqbOFT7EkjSt08DVhKdxQ+h2UjGBBK4
 I+3pE3YFnoBwOlC39t8aPWqOsX2tBDo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-86-0sJZTA-_O7C2aD_ViQ16LA-1; Sat, 03 Oct 2026 07:22:57 -0400
X-MC-Unique: 0sJZTA-_O7C2aD_ViQ16LA-1
X-Mimecast-MFC-AGG-ID: 0sJZTA-_O7C2aD_ViQ16LA_1791026576
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-486f9d150c3so192535f8f.3
 for <intel-gfx@lists.freedesktop.org>; Sat, 03 Oct 2026 04:22:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791026576; x=1791631376;
 h=content-type:mime-version:message-id:date:references:in-reply-to
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=n6DEk79+AjGFUJq3XsqFxT4woiJPH49kvRHU0q9Llf8=;
 b=Pz/eic60c20cth0AjOiaERawnTBNRRaY1IHnY+s0S+geRnFJjsEEZilkm/GZFDT86t
 rnNPChC0Ns0EJeReuh4JP+K/lBgpAtHleNzBT7cY+nkzkVqV7CVEv64L3LDL0GbD5QXd
 nX/ZQ0aKgWjcnMwmv+nEWVumbJpFc08GvvBXqDw8pleDLsmOdCg2YXoiDTqeSgDWEH7z
 LqgXs0NHBh0RKxNzZ8TyLrsVrXY6wN4fyZLI2q4/sJX9xW/rO4ZerrrLFPtO6CjboDt2
 gvUes1k456q/fly2lFLDS/NHLMfAFYVEiTy4B0nGeOfTdcMTXMba2bSCd9xZ7yJtt3pB
 3pmA==
X-Forwarded-Encrypted: i=1;
 AKwUvBwR23lEdVYIsLhvTy48VBcMQpdu5g58ZtgOundOYdGTY2i158JYGYwUhgCbwVFAOklOob9eULorA2M=@lists.freedesktop.org
X-Gm-Message-State: AFq9FYLFClKvIG/B093WN0Fyf9Ssv0CmvzOZoMbnoV5s5GTfXpsQo5WE
 NCgvFBFwpXhtuRb10BQL8xApuo7lIkNj1KGkk8XRY2fEXsV51edxLCIyzgmM7djiz+HsaZ78Cyq
 0/5A7/ugvzWdNJIR9mcPGn1gBzCJHutCKseTglcu5d90gSYYpSbJW3qd3MuMjtJqVqXzk5A==
X-Gm-Gg: AYBFou0nGD+pKAQx9yoasnjrdkMcsGwMNuVI/qKj7KuQThYNddSXbTBUpVz61S2XPLU
 JvRQUaONa2GljdvwGCtkNJMBRnerZI4WljdLysu9vCnhDtiOWkvrfw4ABEATsKjZOx8IP2ejhqJ
 h+xdQzBTUg9MYWTvGJXeuHEKZTT4Z9h150p63gG0+QuoYfM0J7yg5UJ9dH2y+X/LdYhJn2v0YLD
 nFSIK6u4HwdiH82JHxsFqURprF0bWY5YDtifwFIehUWgOjsNkK93jIgdC+JyxBFi4Yi+hGi4+WP
 UeqIgrQUtuO7fz/OcIXKx2WTgpMcG4QEB1oSj1hewI8cmBXJfZE/UmrDjpcRAUlpnIFef5M4d4W
 CUsG9PWoAUspCTF7ltfHzX7QFyDyRbUBWTnmC4vc/AKzzOSK8/2aI3RVvlIZyGGfqtA==
X-Received: by 2002:a05:6000:18aa:b0:48b:1b1:af12 with SMTP id
 ffacd0b85a97d-48b127623bamr8872512f8f.56.1791026576006; 
 Sat, 03 Oct 2026 04:22:56 -0700 (PDT)
X-Received: by 2002:a05:6000:18aa:b0:48b:1b1:af12 with SMTP id
 ffacd0b85a97d-48b127623bamr8872483f8f.56.1791026575557; 
 Sat, 03 Oct 2026 04:22:55 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48b383065a4sm11069220f8f.44.2026.10.03.04.22.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2026 04:22:53 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Mario Limonciello <mario.limonciello@amd.com>,
 dri-devel@lists.freedesktop.org, harry.wentland@amd.com, Simona Vetter
 <simona@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>
Cc: Xaver Hugl <xaver.hugl@gmail.com>, amd-gfx@lists.freedesktop.org, "open
 list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS"
 <intel-gfx@lists.freedesktop.org>, "open list:INTEL DRM DISPLAY FOR XE AND
 I915 DRIVERS" <intel-xe@lists.freedesktop.org>, Mario Limonciello
 <mario.limonciello@amd.com>
Subject: Re: [PATCH v9 09/21] drm/tiny: migrate panel-mipi-dbi to connector
 luminance
In-Reply-To: <20261002190030.211356-10-mario.limonciello@amd.com>
References: <20261002190030.211356-1-mario.limonciello@amd.com>
 <20261002190030.211356-10-mario.limonciello@amd.com>
Date: Sat, 03 Oct 2026 13:22:51 +0200
Message-ID: <xlv1h5j3gh9w.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 42RQdITNOl3Cb63O_pSsmC6Swml2DDWiXkIZflwPqEY_1791026576
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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

Mario Limonciello <mario.limonciello@amd.com> writes:

> Attach the connector LUMINANCE property for MIPI DBI compatible panels
> and retain the legacy backlight class interface only when DRM_LUMINANCE is
> disabled.
>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>  drivers/gpu/drm/tiny/Kconfig          | 2 +-
>  drivers/gpu/drm/tiny/panel-mipi-dbi.c | 3 +++
>  2 files changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfig
> index f0e72d4b6a470..e61a429538bc0 100644
> --- a/drivers/gpu/drm/tiny/Kconfig
> +++ b/drivers/gpu/drm/tiny/Kconfig
> @@ -73,7 +73,7 @@ config DRM_PANEL_MIPI_DBI
>  	select DRM_KMS_HELPER
>  	select DRM_GEM_DMA_HELPER
>  	select DRM_MIPI_DBI
> -	select BACKLIGHT_CLASS_DEVICE
> +	select BACKLIGHT_CLASS_DEVICE if !DRM_LUMINANCE
>  	select VIDEOMODE_HELPERS
>  	help
>  	  Say Y here if you want to enable support for MIPI DBI compatible
> diff --git a/drivers/gpu/drm/tiny/panel-mipi-dbi.c b/drivers/gpu/drm/tiny/panel-mipi-dbi.c
> index 60cd65cae41d8..730f1b219fdec 100644
> --- a/drivers/gpu/drm/tiny/panel-mipi-dbi.c
> +++ b/drivers/gpu/drm/tiny/panel-mipi-dbi.c
> @@ -485,6 +485,9 @@ static int panel_mipi_dbi_spi_probe(struct spi_device *spi)
>  	if (ret)
>  		return ret;
>  	drm_connector_helper_add(connector, &panel_mipi_dbi_connector_helper_funcs);
> +	ret = drm_mipi_dbi_connector_attach_luminance_property(connector);
> +	if (ret)
> +		return ret;
>

I don't see how this could work...

The drm_mipi_dbi_connector_attach_luminance_property() helper only attaches a
LUMINANCE property to the connector if DRM_LUMINANCE is enabled and backlight
is not NULL.

But if DRM_LUMINANCE is enabled, then backlight will always be NULL given that
the drivers/gpu/drm/tiny/panel-mipi-dbi.c driver does:

        dbidev->backlight = devm_of_find_backlight(dev);

and devm_of_find_backlight() is just a stub that unconditionally return NULL if
BACKLIGHT_CLASS_DEVICE is disabled:

https://elixir.bootlin.com/linux/v7.3-rc5/source/include/linux/backlight.h#L441

I don't think we will be able to add support for the LUMINANCE property to MIPI
DBI drivers unless the drivers DT binding are changed. Or maybe what this shows
is that a backlight backend is really needed.

I would leave these drivers out for now and then later figure out how to make
them work without breaking the backlight sysfs interface.

Maybe what can be done is to add a new CONFIG_BACKLIGHT_SYSFS Kconfig symbol,
that defaults to y but allows the sysfs interface to be disabled. That way,
you could still have CONFIG_BACKLIGHT_CLASS_DEVICE enabled but prevent the
uAPI breakage.

Then in this MIPI DBI drivers you could do:

select DRM_LUMINANCE if !CONFIG_BACKLIGHT_SYSFS, or something like that.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

