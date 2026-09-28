Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 741B0CA5FA1
	for <intel-gfx@archiver.kernel.org>; Mon, 28 Sep 2026 18:09:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 143D810EB5A;
	Mon, 28 Sep 2026 18:09:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="A6biqNKX";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01AA710EB59
 for <intel-gfx@lists.freedesktop.org>; Mon, 28 Sep 2026 18:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1790618973;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WblzAY3JRV9CtwzNMKeAP2oGeUzXJbmdjxKWRmzPjT0=;
 b=A6biqNKXoIYIsoP4BCSWnzSdE+Qo0qGkMIRW3A9+nQGJh5MzKzkRmpny5t80bfArJOzMbx
 GqsLZHQf4LKot3eng/aUwK4IZGim2JK6l62nU+PoCjFZGsYBE/z4jyWV6CYHbwTfP1djXU
 uKNckHVxNbjD1AvbM3DfrU2XnMIAxwI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-389-SpavVf1AMouE-p0t4VDPew-1; Mon, 28 Sep 2026 14:09:29 -0400
X-MC-Unique: SpavVf1AMouE-p0t4VDPew-1
X-Mimecast-MFC-AGG-ID: SpavVf1AMouE-p0t4VDPew_1790618967
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-49e7631c43aso34555895e9.3
 for <intel-gfx@lists.freedesktop.org>; Mon, 28 Sep 2026 11:09:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790618967; x=1791223767;
 h=content-type:mime-version:message-id:date:references:in-reply-to
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=WblzAY3JRV9CtwzNMKeAP2oGeUzXJbmdjxKWRmzPjT0=;
 b=q8sdvdCrnK4iCg85Q8gim+jcTye9WTfY+cmQtaqaaHBydjcES5Ke9JqqsUayjCCo3b
 yQsMpb26y7g0j5lOZgrdP8f4nFxFfPfRtsWP82VyyDNCoK2PXW95S8q4EI68m7+njHNh
 L5VRalZ7djZOXALLqS3xUQIBKO6LDiVpok7n4lak6MRgnMqb1kRQQcYlswATdIKJ9xYm
 Sn50gC+fNoaqqSJWKUAWW/n10sJXQECZX0NBUYs04Fu2ezsUYMzdDrzOYPs9mOnsKkqT
 IQtkX/rscl/wfzaOwkNbMmV/36Y6GT0GTbHdmOmYFX5E2fLITnEJOj7/zIzO83g87iiP
 T29w==
X-Forwarded-Encrypted: i=1;
 AKwUvByvq00+jUYjol//pN/R0/lLy0oUSNFabXZB8buedBh73gU+B+tHVCmHeQpouFNX0a+i8laEQRGujr4=@lists.freedesktop.org
X-Gm-Message-State: AFuF++lGlAgCSdcv+KumXX1vaa4DHEnt+UxjLRLmBAZ9bo1J0zJ/hLNv
 SoLd+kZrQj/Fp0y3oskKkieZuD1zv27PweXrfr5spcHdvbX//am5uXlO9AL/ydTKco6zolZg9QT
 erm9kq2lFcZwazjNb+u04pMCn3drivnF6GHTXcrlzvJMDipoknjSl931Fx8x/EFS7XxbeLQ==
X-Gm-Gg: AYBFou2OzWzjaaXu5WShffcT9hAd1VqfK3gDGENpmD9NCcCIAW/bDG6aznkxwJMrY4s
 UpABEx+A6YsbN4zLHVWraFIM95cSK2l1X9IPGboTGlLzN+5nw2yph27LOB0VcixCRwzUG9NMzM9
 KWZS+6Uarx1/p07jTws/od7L1dchgLjE/u8zQPz9jVDK7hSpZXCHsj9I8I8EdGQeVh6LowBI64L
 6wOrRJ7nuBJyilX27Dz9VMZNub+v7drFym3aVcsLOy/JTVORxwWOoGnOJRGgOVj0JMai/qFEVQW
 u8W2yNtP53FyDinAr3oQgd1Ft2cecsOzov2DFPjv8+PQiZ5SE0O7np6weJ/Zkdf3K+0/Mnr6bou
 3ArhhDo2UuzYVfmGd2Vzkj4E0J6XVB6rvct1yBuY1tvYJRd+dsfRVg5ZvnufNi6ahFQ==
X-Received: by 2002:a05:600c:1389:b0:49f:dcc8:c735 with SMTP id
 5b1f17b1804b1-49fe66f4c7dmr231739775e9.18.1790618966860; 
 Mon, 28 Sep 2026 11:09:26 -0700 (PDT)
X-Received: by 2002:a05:600c:1389:b0:49f:dcc8:c735 with SMTP id
 5b1f17b1804b1-49fe66f4c7dmr231739375e9.18.1790618966445; 
 Mon, 28 Sep 2026 11:09:26 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a00d10cb7dsm3533065e9.0.2026.09.28.11.09.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2026 11:09:25 -0700 (PDT)
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
 Zimmermann <tzimmermann@suse.de>, Alex Deucher <alexander.deucher@amd.com>
Subject: Re: [PATCH v4 1/2] drm/fbdev: Move fbdev module parameters next to
 module init
In-Reply-To: <20260928080323.23909-2-tzimmermann@suse.de>
References: <20260928080323.23909-1-tzimmermann@suse.de>
 <20260928080323.23909-2-tzimmermann@suse.de>
Date: Mon, 28 Sep 2026 20:09:23 +0200
Message-ID: <xlv133utfdt8.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hy_Os7rmmEwzpYKZlTv40TGHuci4lUR7T6atXrns2Bk_1790618967
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

Hello Thomas,

> Define the parameters for fbdev emulation in the source file with the
> module-initialization and exit code of drm_kms_helper.ko. The parameters
> control some aspects of DRM's fbdev emulation. Common usage looks like
>
>   drm_kms_helper.drm_fbdev_overalloc=200
>
> on the kernel's command line. This has been possible for many years
> and changing it would likely upset users.
>
> The emulation code is supposed to be moved into the module for DRM
> clients. Keeping the parameters in drm_kms_helper.ko avoids breaking
> systems the use them in the way described above.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

