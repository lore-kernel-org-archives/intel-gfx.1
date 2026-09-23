Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7CF2C98302
	for <intel-gfx@archiver.kernel.org>; Wed, 23 Sep 2026 13:45:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46BEB10E8D1;
	Wed, 23 Sep 2026 13:45:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ze9qvFjP";
	dkim-atps=neutral
Received: from mail-dl2-f12.google.com (mail-dl2-f12.google.com
 [74.125.229.140])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3788F10F054
 for <intel-gfx@lists.freedesktop.org>; Wed, 23 Sep 2026 13:45:51 +0000 (UTC)
Received: by mail-dl2-f12.google.com with SMTP id
 a92af1059eb24-1431a73fa1eso26706c88.0
 for <intel-gfx@lists.freedesktop.org>; Wed, 23 Sep 2026 06:45:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790171150; cv=none;
 d=google.com; s=arc-20260327;
 b=YWHjaTfVA0pajJf9ezG1cV8j+7MmR5sJS4KtZu3T7g/fysucwVDBdsJ6akAD/kklz6
 aq928kxzMHWY4fB1l3PmU8nS5bPKq10ggw6kZDLmq1e8EKFJ379O66d4S8upnrXWO7PC
 Z8GMirF3rNKdUL9X/J7eFwWE208U5DVLtP5wynoJctJjXsAZg9IueAGiMYM58FcOncWG
 XuCTrF/hX7gCnhVP5aI0uIcOZXqCZV7q14fp+cYBmazLM94S1zbX5yw3c8HXO5iXY23D
 U/MnvVYu4OxiTNa+QMgTuqyg1Y0Hi+8TILcNyc22df27t915lTw172/guQ1R8hklqYoN
 7b3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=HctvDPTtuOL5MhTLFfz6tCI4gTGEFCKNG8C5WWR9dmo=;
 fh=DMvCAbbnLtPfBGbDD32kWDq9GtH/EIbeJ96c9DRQFk0=;
 b=qg5MGXEg3/Sguz4ImUzSf5mdwiJucroQ44u4IV7b68A7pHP7ii7rh2IS4eQQeRXVHS
 TVQpiisKHy8ISKRit9vdG3CZtx07DlFN0HyYQYjM8F4arszmjA1KWqMHdTiVDut7F/JC
 BjHh+3QXKDce8an/wyvNeMQC1C1yiYA5gJ+c+yO28GSZgHll9X/RqqOh5RwNcdm7jmjA
 0vspZ84Jmx6lAsXx4ceiAEhc+5wUYozeREK+MIRgsZMX/+AmKf8YgzuiiRnoNkDgQy5p
 xEEgBGFoKgc/MynCmFfBSu+tnCqbOvESguPzn0RxvKop/glKtF2BbiGWKQoYfBAW4bbV
 eSpw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790171150; x=1790775950; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=HctvDPTtuOL5MhTLFfz6tCI4gTGEFCKNG8C5WWR9dmo=;
 b=Ze9qvFjPX8AFrmjTqT5lVF6NPpPq/sl5Kx0ZvG8JZeLHEvWA7UVgE1RZ9qVfNkCVN3
 TWk/lRcd34d+ldRxwQON1nO2hmVcuBl7hWXSGks/pepDNXihhltta6CwEt0mF6oqnmX1
 qRp5/3kISq8Z5+igKxWfmpyLXHCrDar5NLCaJpePNFL4vS0WOWoaicfW7Idzln/p63Lh
 gftKMRfumhsX+byd7n0aj+5TkFnqSYo3HCVuNqXb2IxQB5W/5+ULBt0ulK1E7MIqhS5V
 eGQ0g/AAwE4VZxdHND+Wf4h7Ru9dEd4tEMleInyC6SlKrls3+YoyQdLKCrNJZN21XmqU
 3YIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790171150; x=1790775950;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=HctvDPTtuOL5MhTLFfz6tCI4gTGEFCKNG8C5WWR9dmo=;
 b=Fq7Jy8/fWRWQ7mjf21Zjdcnv4J0KEtntyJE8iixxd+2hcVPij1X3hMYv03iWgYMxrn
 n3JpQuqAMiJhbHPFDbFrD6eX2o6WwSZwxiVNll37iNZhbI5Kjm0IFtZK7Dgivf+Ek+yz
 on3maCrZzauTyecuSJ+hmxS/ZbwDm1+x87pCGMA9BSip4eJQH+Q8adjv+GYOq5j/0rTj
 vw5HMhMMmcAzCA/Bi2WMSqn50Xs9HL/UUoaHq1tKZGXuLzl2gGflkBku/x+XnxYCSRdB
 gFql9Jn8lgUjYqz6FrU/QrTmeofuJEJK3g+sbVu0b+coKJaIPRcWGncPWGVUaSoJVREu
 zwqA==
X-Forwarded-Encrypted: i=1;
 AKwUvByoHaw6ZhrhbWXjIgLbZGxbAZHstZHLfhzVOOSiHQ+QqARVeuZi9tyNFJRr2jQ7CXPG7HaEMv5ZR6w=@lists.freedesktop.org
X-Gm-Message-State: AFuF++nUfzqKnMdwpAj//TwYGF3ZAjP9DyWZDvDRT+eEdw2yPpDdc+LJ
 PvRbmmGSGZJmxarK7WzVNRhIZB1ERwzR8+dqoWBpa4o7ilRoUnyU50bFVqA6yP4HFpH3J42E9bs
 1+FGfMjXbNpfGA0VPDZYnBV/R1deezfc=
X-Gm-Gg: AYBFou1PRcOXtelrDCXNWg0C8wpKal8rZZ6dGlsoYbi1jAAEOueeMUNPv/L0QDeJAyE
 wEp9hfQKEI0/kgFEj3uD9R1VpbSfBtgz2bHhTZMI20U3kpjGlE21znIkwmK5PD75VJz72SoBVYP
 aujLHMdGb0gMIWYn3vwHdd080lb738binOYQcOoycoYzhx8nPTEU6Kee5hkzl0FBJLvODNOyuBj
 SYM2hxWcBWKDSqILOoKU389uJN/w1cfihHPi/Cylo4h+pTcrBW0+EfO7sSk0iOwpFgwEBKtgDgP
 kJPxZesPsUi7pU7qIo3oL4KK9keh+0DGNqqJqp8PWSdN7mTyNOnsPho4JANZcknjm09wqiVE454
 0VJ5r9+E4Dp1qBYJvW5sh+xn2VI0ZUtE8obUNim3tkg==
X-Received: by 2002:a05:701b:4517:10b0:143:5c2a:e45f with SMTP id
 a92af1059eb24-144f8fcc55emr4442748c88.0.1790171150250; Wed, 23 Sep 2026
 06:45:50 -0700 (PDT)
MIME-Version: 1.0
References: <arPTRF4qS6o1Q3vD@sirena.co.uk>
In-Reply-To: <arPTRF4qS6o1Q3vD@sirena.co.uk>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 23 Sep 2026 09:45:38 -0400
X-Gm-Features: AcwNN1VvuVKZ728jo-o9478RCdxxAm4oEfsFVGIbnAnLjFz4EvjQl-J3APv6aG0
Message-ID: <CADnq5_NUH1MBU15Vs287by4P37YV+6F1Q3J1e4Q4KuOvPwK9Fw@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
To: Mark Brown <broonie@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@redhat.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>, 
 DRI <dri-devel@lists.freedesktop.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, Sep 23, 2026 at 9:25=E2=80=AFAM Mark Brown <broonie@kernel.org> wro=
te:
>
> Hi all,
>
> After merging the drm-misc tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> /tmp/next/build/drivers/gpu/drm/amd/amdgpu/../display/dc/dc_memory_pool.c=
:87:37: error: stack frame size (8264) exceeds limit (2048) in 'dc_memory_p=
ool_create' [-Werror,-Wframe-larger-than]
>    87 | __must_check struct dc_memory_pool *dc_memory_pool_create(size_t =
size,
>       |
>
> which I am exceptionally frustrated to see was caused by commit
>
>   bc3f07516a992 (Merge drm/drm-next into drm-misc-next)
>
> which merged the bug I originally reported in the amdgpu tree:
>
>   https://lore.kernel.org/r/aq0vYhZXtMqA41wZ@sirena.org.uk
>
> and then in the drm tree when that was sent upstream without the report
> having been addressed in any way:
>
>   https://lore.kernel.org/r/arJoCiRM1hRbgRb5@sirena.co.uk
>
> neither of which have had any response at all.  It really seems like
> there is some room for improvement in your processes here, currently
> that's three drm trees all held out of -next with the same fairly simple
> build issue.  Can I suggest at least check to see if the code you are
> trying to merge is in -next, the drm merge was done after amdgpu had
> been held out of -next for several days.

I sent the PR out on Thursday and you reported the issue on Friday,
then the weekend happened.  It was investigated and fixed, however
Dave reported a different stack frame warning yesterday so we are
trying to make sure that is resolved as well.  In addition we've been
trying to figure out why our clang builds did not catch it in the
first place.  All the patches should be available momentarily.

Alex
