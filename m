Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14686CA5FA2
	for <intel-gfx@archiver.kernel.org>; Mon, 28 Sep 2026 18:10:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9964010EB5F;
	Mon, 28 Sep 2026 18:10:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="hANFZopc";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B351310EB48
 for <intel-gfx@lists.freedesktop.org>; Mon, 28 Sep 2026 18:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1790619032;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OFTht72VGYwnHy4rRuIiS5N5orHNND6LgvZVdS8G2Q0=;
 b=hANFZopcyLedUQhKEQkdBlYiherp/C3nUQ747CxrT374lOZGGIv2QoZiZHPUNYOm+PIToz
 7dnnCCpihtUy32qnGza1WpDmtSh+RO8rPj1CFTfdg80p4y/4/N5n2pTYm2LF4gxQr0eT/D
 mPT76c9OZAGILFsF8fORK692OatNQRw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-688-hvJATTy7OgWgmpIpmCdD2Q-1; Mon, 28 Sep 2026 14:10:31 -0400
X-MC-Unique: hvJATTy7OgWgmpIpmCdD2Q-1
X-Mimecast-MFC-AGG-ID: hvJATTy7OgWgmpIpmCdD2Q_1790619030
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-49ffe48d1dfso23756375e9.3
 for <intel-gfx@lists.freedesktop.org>; Mon, 28 Sep 2026 11:10:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790619030; x=1791223830;
 h=content-type:mime-version:message-id:date:references:in-reply-to
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=OFTht72VGYwnHy4rRuIiS5N5orHNND6LgvZVdS8G2Q0=;
 b=w0Oz3+MMxvAEAeU9N1Lxic39lp1AMkoAwzDJLZjDfGKnB+Pmq6maHp7oeyqtstfdy1
 fNgQorqlJsVKcNHwDHQcEurf2bHg2EJhxKNqAj02NhyeNlFBBT79lBJWqg0HhdaKPvwf
 3IY4DCc2ftX1xMvPXgq9+/4ZvhGSsObifWWHVHu+c5IjxV+RDbaWABEfwn5Uhvzd53/7
 A0Gc0wfKOe+C1neOuDc8KG3cU5QAoLPXgGGPSnRHYF5b3gP9ROKzd8B+H3T9QmlooDNX
 jKlcfkoRxPSKxgZSydzVJ0rZKwaXBwEzgoebODe3HUo3v2H5AQn49GVGt5bI1wC47c7f
 iP0w==
X-Forwarded-Encrypted: i=1;
 AKwUvBzAheKVDq4WMpGqwdnqoFkMpNz5oXyZUM7BCR8BDbcWcex2jusuEn0WBplBii34Sk9mSPEfFtSD2V4=@lists.freedesktop.org
X-Gm-Message-State: AFuF++mi4YVjq6pziiJ+8jWoWbFH60qiPD7kFCgLhDcHfoMfGDFLPnUj
 pi0hnxPyQ7q9W4fbKF0QhluNfKWkhz5i2T4okkiayYCijbZsJ82WsLSAwMw0DG+dzWDw/FfuupR
 CrUlgYOqgJafv/mDQlIJc7cW+QMfXyChpUJ0F9WCz8pLG4RxbTzL18aG4R/uqSJSy90u8+Q==
X-Gm-Gg: AYBFou2gOnntFKDo5Xf7N8ZehCI3i4XYhkZWy1dx+U5Ec89kh4NdYawzD7yeiC14FB/
 y+XOYOWIDq+RUxYn0+mHwWuzswLPdsdGGFxS+vHZ+LhpHH5lTEjCFc1skJxzvv0EHj8WsHGjsS3
 sh6BxaMlnZ86MecXqnvL7gT9Hn7RzLG84Y+t2T1A08FxULrXEG55RmhuDz0f+yigdnqB9l1Ke0R
 4eS9oDhs+I+Zx3x4SJXMc5oMg9bahfmHjHp4VnF/C63N/DuUFLK+lvujp+QyDN1zcOZ1lye2Sdp
 aozNE1M2aLcU+UfFcGKf2skl4D7EGcNU7oHk0i5aYjFUQx/+8meZvYdGwLAx1MXpaXyUHYfUZGZ
 FAvW98xBig+PkdB+npWD36jcVLKyKb8ckXg5ccXk6wLYree2L3Xem4CBQyHXOPE70Zg==
X-Received: by 2002:a05:600c:4f44:b0:4a0:23f:8b0d with SMTP id
 5b1f17b1804b1-4a0023f8d93mr91712495e9.2.1790619030038; 
 Mon, 28 Sep 2026 11:10:30 -0700 (PDT)
X-Received: by 2002:a05:600c:4f44:b0:4a0:23f:8b0d with SMTP id
 5b1f17b1804b1-4a0023f8d93mr91712165e9.2.1790619029624; 
 Mon, 28 Sep 2026 11:10:29 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a00cfe16a2sm9652415e9.4.2026.09.28.11.10.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2026 11:10:28 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, jfalempe@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, jani.nikula@linux.intel.com, Alexander.Deucher@amd.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-tegra@vger.kernel.org, sashiko-reviews@lists.linux.dev, Thomas
 Zimmermann <tzimmermann@suse.de>, Alex Deucher
 <alexander.deucher@amd.com>, Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v4 2/2] drm/fbdev: Move fbdev helpers into client library
In-Reply-To: <20260928080323.23909-3-tzimmermann@suse.de>
References: <20260928080323.23909-1-tzimmermann@suse.de>
 <20260928080323.23909-3-tzimmermann@suse.de>
Date: Mon, 28 Sep 2026 20:10:27 +0200
Message-ID: <xlv1zex1dz70.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: u_Wl5RC3Y8R9dmy8MNTgdig7BHvc5cdpB2MGiuusaH4_1790619030
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

Thomas Zimmermann <tzimmermann@suse.de> writes:

> DRM's fbdev helpers are for the fbdev-emulation clients. Move them
> into the client-library module. Fix include statements throughout
> DRM drivers.
>
> While at it, rename the files from drm_fb_helper to drm_fbdev_helper.
> The old name was too reminiscent of DRM's framebuffer code.
>
> The GEM support code for fbdev remains part of DRM's memory managers.
>
> v4:
> - fix the depedendencies from v3
> v3:
> - remove obsolete dependencies from Kconfig
> v2:
> - update armada und docs
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
> Acked-by: Jani Nikula <jani.nikula@intel.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

