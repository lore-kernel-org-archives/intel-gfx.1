Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 375E6C5DF6D
	for <intel-gfx@archiver.kernel.org>; Wed, 19 Aug 2026 09:45:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B890610E102;
	Wed, 19 Aug 2026 09:45:01 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com
 [209.85.128.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46FCB10E102
 for <intel-gfx@lists.freedesktop.org>; Wed, 19 Aug 2026 09:45:01 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-836ce5d6e85so14267087b3.1
 for <intel-gfx@lists.freedesktop.org>; Wed, 19 Aug 2026 02:45:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787132700; x=1787737500;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=dIMgKn9ssmwMdJVgg9MfbDylpozJGdyvq0xNOf3CW1Q=;
 b=T8T1a5+jzIj+eotgv3Z2FfKfGsyaX+th06S2xOLTaAXLvYOgMCtqnROLf7y8pva63/
 SrMr5KpJu9xVrz5Pl52Cfe1d+nTNKpyKPJULxP9CEYOP5JuORKaXQzixdmh24oas1Rt/
 9yzt08Stz1JNf5y2W22gb6kioaMtvjFlvAGhUVPlTjmRHOXghaOBYn5X1yjOEuoiRdP9
 PSWils8YMdOnu29XoIexQ8Lc3g4Lgjl+8YrWS0gDSW+U97I5oIy9xUk7ul00Rnqhqead
 1s91c+wa3/RCvD3lM7CcM/XqzVCg0krp575nu0asOtfZvadLbisqw/A7cYJiazB1ch5S
 e/Yw==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp6ZAnEnpVYaZuiqyno3Wp1emQTIB2UU3cQvQT/SYHV6krSlPfvtpvZY2uzq5KqpLvNvxBBLUIpG0g=@lists.freedesktop.org
X-Gm-Message-State: AFuF++lvHD3PrsNSad1tyIKwmbaEPTik1BvkhjUJXsP/uuLQHHNnY3SB
 jY+HT903/wBsHuYxX8bRZ3RuSohZci8M6mKD8MX7dLrGLLUoNBcPFAsbIAZG9diERMk=
X-Gm-Gg: AR+sD13yxInVI2vMjJtpfLdLW5EOQJ3LoliOWMbFAK/CExVOFh25S/R5o7chJhMouVo
 vy9IbjHw0Oc8mIh7ljSjLUbOxyoJ1CPXelGwYHPziWjtlvFCRKEpPhl3lQR8WW/g65gLdOMQb7a
 SsvsmAI4Cf0QKDAqqth3FStj1gKXoKdGByDnyfrQBjLVaVMO0KVFijXi1zMekPGXJda8c7wf5te
 RapUySA3eWW54IM0k59DSqmNQk+Lx34stnJRMIqht/XLCZ+x0AbhpKLNmH6WIlPAA+7TDTU2s8w
 n43O+28tRpCmt4pPddUQ++7nZpTSszbJUmxmlSwLQ8okLzblH6oEag2sGf0X9Rw3xtCh6yj324d
 A69v1dIw/dpHencmoun5P1tCUjhLQFLQEpnpwe7S0veO/U7M+Ql4C4KdkkC+7KU/MMaMY6GDmM4
 Vtnfbq21XcS70MDnd7xeuoGaWFi2LdYUhYIGIfsMf6GfdfLh5CDDsOtEfbuR7nX5BthT00rufjj
 5SFHtyAuWvYRwlEBgDwYfywVk6SOQ==
X-Received: by 2002:a05:690c:46ca:b0:826:8d7f:f498 with SMTP id
 00721157ae682-844de4be0fbmr17477017b3.2.1787132700212; 
 Wed, 19 Aug 2026 02:45:00 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com.
 [209.85.128.172]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-84511abc117sm5746947b3.3.2026.08.19.02.44.59
 for <intel-gfx@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Aug 2026 02:45:00 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-836ce5d6e85so14266997b3.1
 for <intel-gfx@lists.freedesktop.org>; Wed, 19 Aug 2026 02:44:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AHgh+RrmfF+ZyZwzSSD3stjiqVjSsjC74c/UBvI35wE7EKNuMby+TnOS+vyYukABG8p5zZpRpnrSGpGJBRI=@lists.freedesktop.org
X-Received: by 2002:a67:e04e:0:b0:777:ffe0:a10b with SMTP id
 ada2fe7eead31-777ffe0a6b7mr539021137.4.1787132346344; Wed, 19 Aug 2026
 02:39:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260818125012.468092-1-tzimmermann@suse.de>
 <20260818125012.468092-2-tzimmermann@suse.de>
In-Reply-To: <20260818125012.468092-2-tzimmermann@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 19 Aug 2026 11:38:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWYVjvGM2pOzWoDq8LUSrkFtzOQwdmosHYQuBLnSn3D-Q@mail.gmail.com>
X-Gm-Features: AcwNN1Uwr-MWNK1wEAyEr8Z9JNVhxk4jrnSNE7dazUpWIvLo30uHHQJP967oerw
Message-ID: <CAMuHMdWYVjvGM2pOzWoDq8LUSrkFtzOQwdmosHYQuBLnSn3D-Q@mail.gmail.com>
Subject: Re: [PATCH 01/12] drm/panic: Allocate QR-code buffers statically
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: jfalempe@redhat.com, javierm@redhat.com, airlied@gmail.com, 
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 amd-gfx@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 linux-hyperv@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, nouveau@lists.freedesktop.org, 
 linux-renesas-soc@vger.kernel.org, virtualization@lists.linux.dev, 
 sashiko-reviews@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
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

Hi Thomas,

On Tue, 18 Aug 2026 at 15:00, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Declare qrbuf1 and qrbuf2 as static arrays so that the module loader
> allocates them for us. Avoids the kmalloc later on. Also allows for
> using sizeof() to get the number of bytes in each array. Access the
> arrays once with memset, so that the physical pages are available on
> a panic.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks for your patch!

> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -628,24 +628,23 @@ MODULE_PARM_DESC(panic_qr_version, "maximum version (size) of the QR code");
>  #define WINDOW_BITS 12
>  #define MEM_LEVEL 4
>
> -static char *qrbuf1;
> -static char *qrbuf2;
> +static u8 qrbuf1[QR_BUFFER1_SIZE];
> +static u8 qrbuf2[QR_BUFFER2_SIZE];

I am not a big fan of increasing kernel size like this.
You may run (faster) into boot loader limitations.

>  static struct z_stream_s stream;
>
>  static void __init drm_panic_qr_init(void)
>  {
> -       qrbuf1 = kmalloc(QR_BUFFER1_SIZE, GFP_KERNEL);
> -       qrbuf2 = kmalloc(QR_BUFFER2_SIZE, GFP_KERNEL);
> +       /* best-effort allocation; can be NULL */
>         stream.workspace = kmalloc(zlib_deflate_workspacesize(WINDOW_BITS, MEM_LEVEL),
>                                    GFP_KERNEL);

<ironic>Why not use a static array for this, too?</ironic>

> +
> +       /* touch memory so that pages are there in the case of a panic */
> +       memset(qrbuf1, 0, sizeof(qrbuf1));
> +       memset(qrbuf2, 0, sizeof(qrbuf2));

Please clarify "there"?
In cache? Not all systems have sufficient data cache, so it may be
evicted at any time.
In RAM? AFAIK kernel and module memory is not demand-paged.
In TLB? Like cache, it may be evicted at any time.

So IMHO this is futile.

>  }

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
