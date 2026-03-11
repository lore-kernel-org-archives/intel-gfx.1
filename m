Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DE7B106289F
	for <intel-gfx@archiver.kernel.org>; Wed, 11 Mar 2026 13:16:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DDE710E1EC;
	Wed, 11 Mar 2026 13:16:10 +0000 (UTC)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com
 [209.85.221.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 151BB10E1EC
 for <intel-gfx@lists.freedesktop.org>; Wed, 11 Mar 2026 13:16:09 +0000 (UTC)
Received: by mail-vk1-f180.google.com with SMTP id
 71dfb90a1353d-56ae58f3fc6so6631461e0c.3
 for <intel-gfx@lists.freedesktop.org>; Wed, 11 Mar 2026 06:16:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773234968; x=1773839768;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=34DR94e/1PAvLLEaib58vFA4GW0m5SGe6jvxchEhMek=;
 b=WUTjMoCVabzlWddOvTvR+wxpFmmd4LWZ4QSrB0Spca2xillyTUudC+vvvzazWZvUKV
 mM2vDUC786FnXpOKUoOOF7miJbiasFR2MWJtPVW7sYmKofBT7G5pFqkn3s3d7orV9LlO
 Bm3IBMtnd3z3VAuIk2zvGjYbf5//vkjCOQ7htrMp1yucW/osxz1ihjYgkSCQFuf3NX8w
 RVubI4/4jhFEwugsehMZ5jCO1bQCbt2HKtMuTvW99+ufT49DQsr3LQYz5fnLiJ21qvPq
 Zt3AgOIwK0VrTJ7MF6eb2TjENuh0SpSLi9xhtAlpyoH7D2hxzJ8DhNq3AVFdfdtHlf2X
 LJiw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2eYyC91Dt6m4NhhlqfweQ78ZCasqDy7D70NYRjZvXjbpf3wes3Ebwr/Sp0lYB++VCYQnmoCsAiik=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyFPrl/Lp39Qo6AiFBxWUlIeuQpgka8tkX1IBbq2kMgLLvJmJe5
 Uh4ftaxVMnPFXmZnVhX9Ss4oKjRv4liW7ir8io8Bnd44Sx26qAIvCZ8KUGYFYL61050=
X-Gm-Gg: ATEYQzyOCmCrLMgAB4AoIsn9GK2UeOAbEFc1YY72Cet/kqT08vsdAIPTFR0XDvbHDnG
 mnbyAzLgVnYpdNBZhK6fE93CktVjU0BA/3fM9Eaw5nE9RzXRICggK1GV66Qa2DxVLr9+qYSNnRu
 IvPrTq8gb/GsxecNWERxvkzKlfZARed6HXp1v0w1ldDERZuRoyN+JeWegNNV8bx0HQDY0Tupp65
 B7jF7NzThM8JqCVR9tExk/2zCNqwnUDttoEKD0ZOCUyFnm1J5FquDx7NauGIzrRtwZ9JmID/j8U
 uvTb7+uY4u5m3EZ0oDxcc3P6iK3xcT762POuhdxlACC6OwfdpWkFBJzn13xdpaYq10X6P25RJPC
 LxF6UjS0Ppi+PAXgTDCPzKSxijPry3k82xVvTCApi0cbFuruugsEH4ROw7mUZjO8sY1o+cJ/P4m
 kraqoz9Bg+1pur0rBbnrJ3qd80KVrvI4ljdVvKvxXFNhMfjSCVLizs28CLEPn9t/jA
X-Received: by 2002:a05:6123:147:b0:56a:fb7b:7537 with SMTP id
 71dfb90a1353d-56b4769d7fbmr866148e0c.19.1773234967879; 
 Wed, 11 Mar 2026 06:16:07 -0700 (PDT)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com.
 [209.85.221.171]) by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-94ecfc4dd70sm515890241.2.2026.03.11.06.16.07
 for <intel-gfx@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Mar 2026 06:16:07 -0700 (PDT)
Received: by mail-vk1-f171.google.com with SMTP id
 71dfb90a1353d-5675d609621so11786880e0c.2
 for <intel-gfx@lists.freedesktop.org>; Wed, 11 Mar 2026 06:16:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVDQyHgLG7BohwlVntEMkswBSRqDGyrExuD93zdQuNtSVK9g1K21iL4HuLydVtm9qP4dvtAwaqJzew=@lists.freedesktop.org
X-Received: by 2002:a05:6122:1d05:b0:55b:7494:177b with SMTP id
 71dfb90a1353d-56b4752d806mr922396e0c.10.1773234967338; Wed, 11 Mar 2026
 06:16:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de>
 <20260310-b4-is_err_or_null-v1-36-bd63b656022d@avm.de>
In-Reply-To: <20260310-b4-is_err_or_null-v1-36-bd63b656022d@avm.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 11 Mar 2026 14:15:56 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXQ8Q4jvkgFRJYhghz2BZRDC-9Mk6DbXxuaOc6C9DFHZQ@mail.gmail.com>
X-Gm-Features: AaiRm52J84H77ROK64ZWWtJfaiCpnFeKyoSRmPbi-NC8CN6Ju1TJEFxJU9gZQQ8
Message-ID: <CAMuHMdXQ8Q4jvkgFRJYhghz2BZRDC-9Mk6DbXxuaOc6C9DFHZQ@mail.gmail.com>
Subject: Re: [PATCH 36/61] arch/sh: Prefer IS_ERR_OR_NULL over manual NULL
 check
To: Philipp Hahn <phahn-oss@avm.de>
Cc: amd-gfx@lists.freedesktop.org, apparmor@lists.ubuntu.com, 
 bpf@vger.kernel.org, ceph-devel@vger.kernel.org, cocci@inria.fr, 
 dm-devel@lists.linux.dev, dri-devel@lists.freedesktop.org, 
 gfs2@lists.linux.dev, intel-gfx@lists.freedesktop.org, 
 intel-wired-lan@lists.osuosl.org, iommu@lists.linux.dev, kvm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-block@vger.kernel.org, 
 linux-bluetooth@vger.kernel.org, linux-btrfs@vger.kernel.org, 
 linux-cifs@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-hyperv@vger.kernel.org, linux-input@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-mips@vger.kernel.org, linux-mm@kvack.org, 
 linux-modules@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-nfs@vger.kernel.org, linux-omap@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-pm@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org, 
 linux-scsi@vger.kernel.org, linux-sctp@vger.kernel.org, 
 linux-security-module@vger.kernel.org, linux-sh@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-trace-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org, ntfs3@lists.linux.dev, 
 samba-technical@lists.samba.org, sched-ext@lists.linux.dev, 
 target-devel@vger.kernel.org, tipc-discussion@lists.sourceforge.net, 
 v9fs@lists.linux.dev, Yoshinori Sato <ysato@users.sourceforge.jp>, 
 Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
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

On Tue, 10 Mar 2026 at 12:56, Philipp Hahn <phahn-oss@avm.de> wrote:
> Prefer using IS_ERR_OR_NULL() over using IS_ERR() and a manual NULL
> check.
>
> Change generated with coccinelle.
>
> To: Yoshinori Sato <ysato@users.sourceforge.jp>
> To: Rich Felker <dalias@libc.org>
> To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> Cc: linux-sh@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Philipp Hahn <phahn-oss@avm.de>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
