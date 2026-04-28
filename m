Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78F7EFF8868
	for <intel-gfx@archiver.kernel.org>; Tue, 28 Apr 2026 09:25:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1073610E31D;
	Tue, 28 Apr 2026 09:25:28 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F34210E31D
 for <intel-gfx@lists.freedesktop.org>; Tue, 28 Apr 2026 09:25:26 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-67389cf78b0so19497007a12.2
 for <intel-gfx@lists.freedesktop.org>; Tue, 28 Apr 2026 02:25:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777368325; x=1777973125;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Al22kA6RCf7FSEzj29cZLSkjdM9EgXxihmBX7/SeSVI=;
 b=ZEJhHVQ9iGfwUcf62vD+yhXFpJejVnI1J4rqN4Nf7Q5/Yz4/AVfOR4T4oB6UKDBdjG
 QjVZWYq7VUvA4lfw9WPGmeeparsp0XVVeMM4MMd19f+Wps0hzJZI7UtEaQbEVwCZO08K
 2twJqB7iYPn4794YzOuNWwudqrJM67nx6g2GcacVYUXui2njqQVt2V4x27xoeTzvKsgl
 re40oWZl+XB1LyOq9Kcx2KW3kr+pHdElVXf8UCf4gyYN1/EVCOgqQmFKiYsi8JClJcf0
 nuuAvWcYBAyeIfoCncQ0nRCYSe1KDwOgTCKmBfrcCN7rHEQllO3bNEiek9gDW+zka8vH
 g/oA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/t1rnkL5IzPgjDoTQjPXaUEY/ueqniNmPDnYTL6yohg5FtcqyxLOH+OvJbwzKAhtg0NsHTiCHf4+A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx551TwMZzylTXNfP+8LWD6bzxWDqnXGhRbsXzWVlxNVoZ7XhNz
 UgRw18es5G09LfPClzmtzYuz98zH3/V17wKO5mwmzPmcaXQdxuWRMc/cZeHk7xl5YlI=
X-Gm-Gg: AeBDieu/bzI/kjNW86a41mTYWt/x0iwGTMBrU1NBnKhicJYnGspwYC5CW83gcTsO7uF
 c96yldITEerMjwdBmUjJzOcWqBq6fprK1DqePXC47za+wIycK45BSi09sF/WLYLeY3rQLsFNZPd
 8+Q/OncD8bRYKcZ/6Iz1oP6SiLDuOauDbJLcvfROXUBswtovxTv/9AoWo4FOI06dtIpJ+HXK6pW
 dGw/fibv+j0QHKtZHYTN90QF/3feskNZmX9vha0LRGuWOjYezt1ACmOWa1psCCVF4YnM2tFDZZ/
 NrFysjhHZBlXIkBZD/QoNZYTcyzxmZ462AJ9VQzk1Ybj1xAb4P72i97GurDo2d4CYMT5Am7DowT
 MT63OWhuIXc3T1UrGKK7DI1L0fNiWd6kzE+mmM5bDqYWG0CmS524Q47hXLOrtMRHmqx56YreeKh
 LmrmdK1uWDjkqhvQMcQoINfLG1HzV7mzOt/VIxfl0mS9LkpLcLS+d/rks9mhxSn8+k0l0dj9Y=
X-Received: by 2002:a05:6402:5108:b0:678:93eb:c9fa with SMTP id
 4fb4d7f45d1cf-679bb08f23cmr1082878a12.15.1777368324930; 
 Tue, 28 Apr 2026 02:25:24 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com.
 [209.85.208.53]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-679b67d5c88sm544802a12.7.2026.04.28.02.25.24
 for <intel-gfx@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Apr 2026 02:25:24 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-678a526f374so7365035a12.0
 for <intel-gfx@lists.freedesktop.org>; Tue, 28 Apr 2026 02:25:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AFNElJ9LzSzoaKw3S4/bwbj2HC9H+Zf3oRg0oiqgOx/IakmMQHuPJrwIXcE4rCx7HK2YRVrG47Debzffj2g=@lists.freedesktop.org
X-Received: by 2002:a05:6402:5056:b0:676:d8a1:7a04 with SMTP id
 4fb4d7f45d1cf-679bb09a4admr915149a12.23.1777368324094; Tue, 28 Apr 2026
 02:25:24 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1777306795.git.chleroy@kernel.org>
 <c73b90236f2810edd47c84edd2a8d8e8e0c816da.1777306795.git.chleroy@kernel.org>
In-Reply-To: <c73b90236f2810edd47c84edd2a8d8e8e0c816da.1777306795.git.chleroy@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Apr 2026 11:25:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUvTBWoDN_wUo2n8-gkoheJ+-rbwew53OvoAwo8G5n1qg@mail.gmail.com>
X-Gm-Features: AVHnY4JEWBVPw4tSjHgbQTia8gZd2WGJ1sv6qLdKJbtvs4hms1blpvc35yb0VWw
Message-ID: <CAMuHMdUvTBWoDN_wUo2n8-gkoheJ+-rbwew53OvoAwo8G5n1qg@mail.gmail.com>
Subject: Re: [RFC PATCH v1 4/9] uaccess: Introduce
 copy_{to/from}_user_partial()
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Yury Norov <ynorov@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, 
 Linus Torvalds <torvalds@linux-foundation.org>,
 David Laight <david.laight.linux@gmail.com>, 
 Thomas Gleixner <tglx@linutronix.de>, linux-alpha@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
 sparclinux@vger.kernel.org, linux-um@lists.infradead.org, 
 dmaengine@vger.kernel.org, linux-efi@vger.kernel.org, 
 linux-fsi@lists.ozlabs.org, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 linux-wpan@vger.kernel.org, netdev@vger.kernel.org, 
 linux-wireless@vger.kernel.org, linux-spi@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
 linux-serial@vger.kernel.org, linux-usb@vger.kernel.org, 
 xen-devel@lists.xenproject.org, linux-fsdevel@vger.kernel.org, 
 ocfs2-devel@lists.linux.dev, bpf@vger.kernel.org, kasan-dev@googlegroups.com, 
 linux-mm@kvack.org, linux-x25@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-sound@vger.kernel.org, sound-open-firmware@alsa-project.org, 
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
 linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
 linux-sh@vger.kernel.org, linux-arch@vger.kernel.org
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

Hi Christophe,

Thanks for your patch!

On Mon, 27 Apr 2026 at 19:18, Christophe Leroy (CS GROUP)
<chleroy@kernel.org> wrote:
> Today there are approximately 3000 calls for copy_to_user() and
> 3000 calls to copy_from_user().
>
> The majority of callers of copy_{to/from}_user() don't care about the
> return value, they only check whether it is 0 or not, and when it is
> not 0 they handle it as a -EACCES.

I think the "a" can be dropped.

> In order to allow better optimisation of copy_{to/from}_user() when
> the size of the copy is known at build time, create new fonctions

functions

> named copy_{to/from}_user_partial() to be used by the few callers
> that are interested in partial copies and need to now how many

know

> bytes remain at the end of the copy.
>
> For the time being it is just the same as copy_{to/from}_user().
>
> Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
