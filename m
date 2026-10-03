Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E87CCA5FE6
	for <intel-gfx@archiver.kernel.org>; Sat,  3 Oct 2026 10:31:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 200A010E931;
	Sat,  3 Oct 2026 10:31:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="UReXiafg";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F359310E92F
 for <intel-gfx@lists.freedesktop.org>; Sat,  3 Oct 2026 10:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1791023458;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=x3OlQPuKLle/RWQyCvYbmxpN1t4vBLUkyyPtEqihZM4=;
 b=UReXiafghX64kpKGImsxTTKlDlI3P7ZvzxZc//n7Evfe82nc3yPdUOTGKjX2HrfCxdDlAW
 oXW2JwwrQ6I6QCCAr4ECDY9kicU8bmXgEJ2AinnMFWINqE+6WP3CHIMc0Oju3ZvFc472x9
 vaHydr8BpNTpO9Zf8p4vO1HTU1ktw6U=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-615-icrPnPdxMFyx2MjuduVziw-1; Sat, 03 Oct 2026 06:30:57 -0400
X-MC-Unique: icrPnPdxMFyx2MjuduVziw-1
X-Mimecast-MFC-AGG-ID: icrPnPdxMFyx2MjuduVziw_1791023456
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4a01eb045feso4046765e9.1
 for <intel-gfx@lists.freedesktop.org>; Sat, 03 Oct 2026 03:30:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791023456; x=1791628256;
 h=content-type:mime-version:message-id:date:references:in-reply-to
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=x3OlQPuKLle/RWQyCvYbmxpN1t4vBLUkyyPtEqihZM4=;
 b=tmEsGYcU6og8iwVrbZThqBErseRYaUuwAhNVWFwttBATRZtoObC+k3OaJ1TlhhhpVU
 isakdO93KjA2Szwf+RBwhVN7i7PoIbMKO9PKD9u7B8pE7FmrIKWfZEwMH2ihNL8NAvQt
 EGC46lHWxuzXcWl4Pmm+3as2vQ1HPmklTHlhdMSJc+kepn6CeElkjC2u8oWu1hKnYDMe
 LrJbGmJA37TUZppJkLR6PgumLTv4VTdkVD5n+yLVminUSosjJ0nh1nkjUlwjFRz24rZy
 KeJThmwdr2q5Xx6stxvkfdn8KkhoBQttx9RPdioncu4MvZy9XlSXbOAuETsaefJY96tn
 nH/w==
X-Forwarded-Encrypted: i=1;
 AKwUvBySG1mmifO/f8TboR7KfK+ZORpqKJh0raKU//0roHAEuKGaJeLsYvJJzjKZ2JMLhubHkwKnpfLt3Sk=@lists.freedesktop.org
X-Gm-Message-State: AFuF++me1LM545Nw3AHSVfyAdhpIYuyHWMieZTrmVah63OLhR5PMhY4g
 E262R0ApvWwrx1fIlZGLSH9P2VrV5VGIfkAsYtLy6yW1lb8ZxujFJOrxg19c4GBlgnHovxXHV8t
 zu2WdY4IYB2wMripx1f9ZFrfpvV9Pu6fkQ5TjYSPzi9SZ/tcoUL7zwVBXi0yIM7hsJ8lToA==
X-Gm-Gg: AYBFou2MrvHnJ6kBMnKr54jUM9ON2MtTISvGCMLai8XKc0oD9AnEP8jVAakF040pC0g
 D1HzUJZKjAJV9mtD/OupApqj9c4LwUk5Irza0UzOQJ6p+BRsEFmeobDnwesQ4twy3/qjTpV2wB8
 urtItSw0kogZ4VmQTx7BZeTRsdrMZLi0EEI9TkwefrhRjXPeFZ3KGqk8s2io8YTZzFv59z1AYry
 OHS4z9Q8Zby8F3fJX+EHUBiSeclIjYtEdXvIB7YRD5DkMcxNhfgHdOm7Ta3GNpVgv3GkHhRB79q
 MGA4bvuMPpL0idxIwOGU3T3lYmgnDlfraZWC9yxwjR5ueSPJo62Sl+65jpBRfbAwg5tgxnLpvSM
 XaLGUqssISJ2F2ohgaI2MqL8nC3Fq2yPyZmCEPkQZhBkfbBopM9VRwiwn4yYcdzGtWg==
X-Received: by 2002:a05:600c:3115:b0:49f:cac3:c68a with SMTP id
 5b1f17b1804b1-4a168105ddfmr30256055e9.31.1791023456062; 
 Sat, 03 Oct 2026 03:30:56 -0700 (PDT)
X-Received: by 2002:a05:600c:3115:b0:49f:cac3:c68a with SMTP id
 5b1f17b1804b1-4a168105ddfmr30255685e9.31.1791023455648; 
 Sat, 03 Oct 2026 03:30:55 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a03ff20831sm97747375e9.4.2026.10.03.03.30.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2026 03:30:55 -0700 (PDT)
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
Subject: Re: [PATCH v9 21/21] drm/solomon: add SSD130x connector luminance
 support
In-Reply-To: <20261002190030.211356-22-mario.limonciello@amd.com>
References: <20261002190030.211356-1-mario.limonciello@amd.com>
 <20261002190030.211356-22-mario.limonciello@amd.com>
Date: Sat, 03 Oct 2026 12:30:53 +0200
Message-ID: <xlv1zewv5b4y.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kMrATHnXkPFLJtGQY2nYLmaLBma-ONOIqOVkydH9-VA_1791023456
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

Hello Mario,

> Expose SSD130x contrast through the connector LUMINANCE property when
> DRM_LUMINANCE is enabled. Program contrast directly and retain the
> backlight class interface otherwise.
>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---

[...]

>  struct ssd130x_device *ssd130x_probe(struct device *dev, struct regmap *regmap)
>  {
>  	struct ssd130x_device *ssd130x;
> +#ifndef CONFIG_DRM_LUMINANCE
>  	struct backlight_device *bl;
> +#endif

[...]

> +#ifndef CONFIG_DRM_LUMINANCE
>  	bl = devm_backlight_device_register(dev, dev_name(dev), dev, ssd130x,
>  					    &ssd130xfb_bl_ops[ssd130x->device_info->family_id],
>  					    NULL);
> @@ -2258,6 +2298,7 @@ struct ssd130x_device *ssd130x_probe(struct device *dev, struct regmap *regmap)
>  	bl->props.brightness = ssd130x->contrast;
>  	bl->props.max_brightness = MAX_CONTRAST;
>  	ssd130x->bl_dev = bl;
> +#endif

I think that IS_ENABLED(CONFIG_BACKLIGHT_CLASS_DEVICE) makes more sense?

Other than that, the patch looks good to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

