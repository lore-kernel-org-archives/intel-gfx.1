Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD6D3CA5FE3
	for <intel-gfx@archiver.kernel.org>; Sat,  3 Oct 2026 11:03:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 466F410E05B;
	Sat,  3 Oct 2026 11:03:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="WdHajL1f";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E5EE10E0A1
 for <intel-gfx@lists.freedesktop.org>; Sat,  3 Oct 2026 11:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1791025397;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7CGE6fSevJn03ZxUp3hLxD+nUmt71trIKNdG07R2pFc=;
 b=WdHajL1feBd/YrIuv9WlPvxtr0VDEDrK7+VeumKdDBtWB07YsE12+iPa/3p61Es+MBraby
 eOA0Vz5xmHBVVbzZ+SKYHxOrbTged7wtkBgfeVrFFrzFQsxO4mU7juY1rs2ZB93j0NTNZf
 k8t+px4d7mcW405+ZEUHfPPao6j7tq8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-505-M5mDKpE4OayEg9gqNvJa8g-1; Sat, 03 Oct 2026 07:03:16 -0400
X-MC-Unique: M5mDKpE4OayEg9gqNvJa8g-1
X-Mimecast-MFC-AGG-ID: M5mDKpE4OayEg9gqNvJa8g_1791025395
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-486e8fb7d75so138451f8f.0
 for <intel-gfx@lists.freedesktop.org>; Sat, 03 Oct 2026 04:03:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791025395; x=1791630195;
 h=content-type:mime-version:message-id:date:references:in-reply-to
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=7CGE6fSevJn03ZxUp3hLxD+nUmt71trIKNdG07R2pFc=;
 b=PbBoUIzLSXe2VPe2UskJ4FYDPuJbSWCSr6W3yEMaD9BkxP4KXxYZH+bBkLoBXAhsMI
 4aRnnYf1zieD5Y9Cy5Mnrb67nyImLkle0OB3bPVL4UtRWiGzCCqTZB0ZyMhwtsecAu+j
 EX5k5iR+51x9wZ7k9Sd9JbMVlbpQ/uH82Ws3LGtIhffUTBgczOcQ2yYkpBmiv2PI9K8b
 x/ooQdTmqnBa8QfwHbjPE8Kp/ccuDWjxQd0Mb6w9ZIZcP0nOHI35BSUZdVHR7f74ODO3
 JdBQtFihf5ztBS4/fscv+o3xkD9GaJCaXt3GXTcQ6tzq08Sfru8/ytXC37QuEqMQ+x8z
 D0XA==
X-Forwarded-Encrypted: i=1;
 AKwUvByCiyWu/qehKXLkUUBITRVW5NTpqyn3vEQjqNuzFHyK7MZJTaP/VYiCz6WUyss3hxBO/LsQMnd9B2Y=@lists.freedesktop.org
X-Gm-Message-State: AFq9FYJTSfavJ0h0yCY0u6ZImcFKFGx9aVjidEzNFUoGsHTeU4r/d0Ly
 d+YKYi449U1wLABl+aA/hYs6Ot54yu639J5D0tdz/tduolFNnHH8hbYPAqwoP618PGIRCU0yDkx
 qk1quNIwn1+D33rS/wFjyKj0ugrV9CaHohouxQ9rB2Wxy4DI/cz/K0bD9rPH5GE+u4uAREA==
X-Gm-Gg: AYBFou0tMIaSsfdsWjh1EF78wvixfoEKffNllyYvtOUvjyJ2rGtaetAi5kJCBzWgqfx
 CQ3IKj97AcjUZpT70rC1++RHNE4JQQmkhccXSBJPMz+ILPv/puc/GFvH+gGaZ5pQnK+BUI6jD3a
 IX/s8xX88Cy4L3v4NpwfJQbnPYWrAGRd+xws8fj3HgDKSJm4afKp2ttx+lxWuT0zDQneCkt4GbA
 J2OosRw1G0iZJ+P4g4/yxEYxuJUVdWiHQnCCozUCHzgM+pbm5EFN8PQTcU1q8DkpcW7uaDSVTgG
 Cx1xIY5Kf4IQ6qPGnbnqcGs6Da2xt87ej816ufzQQD5AYttXTg3f0UYi1raAFIXcEDPGMEGYlXy
 Q1yPwL5x5p1KG5fJPSxKvbeRQmBn6a3TTwimdclSEPKGZdqiquqjfx1hvCFJVOIC5/w==
X-Received: by 2002:a5d:6f01:0:b0:48a:fdde:5241 with SMTP id
 ffacd0b85a97d-48c47fdf4c3mr3224384f8f.31.1791025394968; 
 Sat, 03 Oct 2026 04:03:14 -0700 (PDT)
X-Received: by 2002:a5d:6f01:0:b0:48a:fdde:5241 with SMTP id
 ffacd0b85a97d-48c47fdf4c3mr3224335f8f.31.1791025394453; 
 Sat, 03 Oct 2026 04:03:14 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48b82253dc9sm11935413f8f.3.2026.10.03.04.03.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2026 04:03:12 -0700 (PDT)
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
Subject: Re: [PATCH v9 08/21] drm/mipi-dbi: add connector luminance helpers
In-Reply-To: <20261002190030.211356-9-mario.limonciello@amd.com>
References: <20261002190030.211356-1-mario.limonciello@amd.com>
 <20261002190030.211356-9-mario.limonciello@amd.com>
Date: Sat, 03 Oct 2026 13:03:11 +0200
Message-ID: <xlv1ld8fgi6o.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: t9wfCQnIVbh_JTbsMCQymU4fSyp3n6BwTY7XndI7_oA_1791025395
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

> Add common helpers for MIPI DBI drivers to attach the connector LUMINANCE
> property and forward updates to their backlight backend when
> CONFIG_DRM_LUMINANCE is enabled.
>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---

[...]

> +int drm_mipi_dbi_connector_attach_luminance_property(struct drm_connector *connector)
> +{
> +	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(connector->dev);
> +	struct backlight_device *backlight = dbidev->backlight;
> +
> +	if (!IS_ENABLED(CONFIG_DRM_LUMINANCE) || !backlight)
> +		return 0;
> +
> +	return drm_connector_attach_luminance_property(connector, 0,
> +					backlight->props.max_brightness,
> +					backlight->props.brightness);
> +}
> +EXPORT_SYMBOL(drm_mipi_dbi_connector_attach_luminance_property);
> +

Drivers that call drm_connector_attach_luminance_property(), make it
conditional with if IS_ENABLED(CONFIG_DRM_LUMINANCE). I wonder if
should be the same for drivers calling this helper.

That is, instead of bailing out due !IS_ENABLED(CONFIG_DRM_LUMINANCE),
to make drivers do:

        if (!IS_ENABLED(CONFIG_DRM_LUMINANCE) {
               ret = drm_mipi_dbi_connector_attach_luminance_property(connector);
        ...
        }

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

