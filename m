Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C548606A337
	for <intel-gfx@archiver.kernel.org>; Wed, 18 Nov 2026 13:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yLSnr85G
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1CB210FC27;
	Wed, 18 Nov 2026 13:04:07 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DCE810F3B9
 for <intel-gfx@lists.freedesktop.org>; Mon, 16 Nov 2026 18:29:42 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4a1fbd52ab6so30090785e9.0
 for <intel-gfx@lists.freedesktop.org>; Mon, 16 Nov 2026 10:29:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794853780; x=1795458580; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=ohJe8BJBCDffCZ4MuZ0uQ527x40SLHyvNrdc9OJlZqQ=;
 b=yLSnr85G4Y819zUrmY63pK4JuRVM7bzKsBBYekOBnKl9IQgpWHAyvva1DrgDLB5vDa
 6jmnWEqJLEV8ArMo4x6pljeLAav8AsBZhLLbka+Cw8B0g33Ksf+YQrBbv9Cukn0HCICs
 Ufb2E58oFmVT2LtTpg2JgWuDAGpyD4VhtRYAD0me33K4s73WK+kGoHKg910Mptcs4PIx
 T5IgwnZkSOBZX9RicW3gi7BMh3k0lFBPvmapDoZTekMGEOaY70r6ao08xwrZ5MpaBfTQ
 HuOa5OrDVzKgS7lm4EILmb8Ap8rxCRurqBy9Ghl6HGYxIrRByvIEnYXH7Zs6b3clb4/5
 oPUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794853780; x=1795458580;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ohJe8BJBCDffCZ4MuZ0uQ527x40SLHyvNrdc9OJlZqQ=;
 b=t009JREyqmRlhH0yQ67bMdtihXqOkE8hM8QIxBTiIeYQodeUb/KgUFLmg0QVAMIyUW
 VwQSx9TNxT2xo839K+8pc1XgZY0GWFsbIGocWPgxPYWapf5yEtIn1ib9iWZiOnE5Wdki
 nBXFWHD6F/pG7wys4/YLJ725SS2CEcwYoYJqkD/ik/bo/3oMZXDMxifRjLutijZDzcHy
 lLm51Qu1T0OUBU89miX8Jh29xZmqtBdMEOjujGKgI3kGXvOaPxqmPDOSu0C79yrYRhzO
 YMt4/6RVBgSJN5QzaTyVIC1yzWOYdqaVzTXmBNVapqCPfhjeQ+23k6ME4Ftx353fqD26
 CEuA==
X-Gm-Message-State: APuU4Z8cdyf8xS6U+sFOJtXAkZtSXRv7Vn+vaCrmWyrzxjHZAAR9n3Ru
 KOmwmpn/EFH6tEdeApZPRQgbKfZTBBhpJustbWRM6sxcmWbpZuBvh1+F
X-Gm-Gg: AYBFou2dOMddPJKWfZr9wE7HuTciM3x9+PBMffTWq6TSJ0xZZfPc+e/vd/1k+RXg5MH
 R8FU1RDzDVy0/PxZv0u1KuzJXlm2E9y+ipAU5SfpIgtAaeBjUO1mABVGkrP8dslwxJ+fQ+6ltH5
 9Md3kFQOpnJnnm2KiV+mwtgjf5Cm5ef0tUwQHBHKQLExgkWMngzjikbytaupi5AtJcSgYTnMWuq
 C5c2P3m2JNAthCZruUPZUl8bc07ioVAfh9FqHZUIohqK+sT32awLh7lBtkPgVvqbY8WP05iazig
 6W+CchAUiLyd3a6Pcxsnf5FmBqDS8n1QxFuBBSkOaAAECjZK5rs5SpjixxRp5iGe9rG1Hljjpg6
 xBEwADstkBGOmCZWSFNtzA01gKxf3A4qn9hAUfZiOwpFNEiyQojslxuruXAlr9EV5ChQ+/gpGVy
 EW4apw34Cl3eDsIEoPo1cNkgtp7yuUYK33c/YNjC1cydAPkQQ+yIm5n3wYMoA/VA/SEectLtPxv
 NGiN1UxcRBSxDzg/qFzGs+jnqA2SDEPtEi3lF9J5p7RiT3hXS2o4Gv9Qgxow545NRUt8fcJsSUa
 7VcPtFkI7wpZfyNBtlOZeUCcfpDoqiclzyjx1ipt6L5EjJI2uVc=
X-Received: by 2002:a05:600c:46c9:b0:4a3:d327:6ed with SMTP id
 5b1f17b1804b1-4bb55a5fdf6mr254839115e9.17.1794853780298; 
 Mon, 16 Nov 2026 10:29:40 -0800 (PST)
Received: from [10.155.107.148] ([147.88.200.116])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb783965d4sm7171285e9.7.2026.11.16.10.29.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Nov 2026 10:29:39 -0800 (PST)
Message-ID: <1b7a7d94-e349-4f3c-b973-c365041c15f2@gmail.com>
Date: Mon, 16 Nov 2026 18:29:38 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/12] drm/atomic: Try to make atomic+async usable, and
 clear up the "async update" helper confusion
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, =?UTF-8?Q?Andr=C3=A9_Almeida?=
 <andrealmeid@igalia.com>, Boris Brezillon <bbrezillon@kernel.org>,
 Christopher Snowhill <chris@kode54.net>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Dharma Balasubiramani <dharma.b@microchip.com>,
 Dmitry Baryshkov <lumag@kernel.org>, freedreno@lists.freedesktop.org,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Huacai Chen <chenhuacai@kernel.org>, Icenowy Zheng
 <zhengxingda@iscas.ac.cn>, Jianmin Lv <lvjianmin@loongson.cn>,
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
 Liviu Dudau <liviu.dudau@arm.com>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>, Manikandan Muralidharan <manikandan.m@microchip.com>,
 Maxime Ripard <mripard@kernel.org>, Mingcong Bai <jeffbai@aosc.io>,
 nouveau@lists.freedesktop.org, Qianhai Wu <wuqianhai@loongson.cn>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Simon Ser <contact@emersion.fr>, wayland-devel@lists.freedesktop.org,
 Xaver Hugl <xaver.hugl@kde.org>, Xi Ruoyao <xry111@xry111.site>
References: <20261116091130.13950-1-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: Erwin Springer <aot.lerwin@gmail.com>
In-Reply-To: <20261116091130.13950-1-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 18 Nov 2026 13:04:06 +0000
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


Am 16.11.2026 um 10:11 schrieb Ville Syrjala:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>
> The weird uapi semantics of the atomic async flip support make it
> really hard for drivers to implement. Try to fix that by filtering
> out the no-op junk from the commit that userspace likes to put there.
>
> Also a lot of people are apparently confusing the
> .atomic_async_{update,check}() hack with async flips. The two
> are completely orthogonal, so try to clear up that mess by
> renaming the hack to .atomic_bypass_{update,check}().
>
> TODO: atomic+async is in serious need to proper tests, somehow
>        all that seems to have gotten skipped when the feature
>        was added :(

thanks, this fixes the KWin case for me, so my patch is no longer
needed..

tested on Raptor Lake-U (Iris Xe) with unmodified KWin 6.8.2 and a
fullscreen client that requests tearing through wp_tearing_control_v1,
without my patch. I applied the series to the CachyOS 7.3.4 kernel,
the only conflicts were the renames in amdgpu and msm.

Before, none of about 350 frames per run was presented without vsync.
With the series 3330 of 3336 frames tear over four runs (with and
without CCS modifiers), and the "async flip not supported" message is
gone. What is still rejected is the first flip after the modifier or
format changed, once per run, as intended, and in three of the runs
one commit that touches the cursor plane, which can't do async flips:

   [PLANE:146:cursor A] does not support async flips
No warnings and no flip_done timeouts in the log.

If you think it fits, feel free to add:

Reported-by: Erwin Springer <aot.lerwin@gmail.com>
Tested-by: Erwin Springer <aot.lerwin@gmail.com>

