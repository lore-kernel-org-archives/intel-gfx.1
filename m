Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BDB6C98321
	for <intel-gfx@archiver.kernel.org>; Thu, 24 Sep 2026 17:01:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3147210E649;
	Thu, 24 Sep 2026 17:01:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CvedTLqg";
	dkim-atps=neutral
Received: from mail-vs2-f23.google.com (mail-vs2-f23.google.com
 [74.125.227.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 783CA10E6D1
 for <intel-gfx@lists.freedesktop.org>; Thu, 24 Sep 2026 17:01:29 +0000 (UTC)
Received: by mail-vs2-f23.google.com with SMTP id
 ada2fe7eead31-79de8079842so3614137.3
 for <intel-gfx@lists.freedesktop.org>; Thu, 24 Sep 2026 10:01:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790269288; cv=none;
 d=google.com; s=arc-20260327;
 b=HEwy88lxkxMeoDe8VXn3M8+fWzq1bGTSg6Dk+s6V34jJ5ZKeW0VJ3iusqWO+3Eb3Mu
 3XeKEdU/7bCL1/F0yg9SegOJh3EGNHYvwDl2wv/X0Na99N3SinB1RuqIFF6ZmPNJkv5L
 rq0H9ZbvbglmSPW5NZ1kOq4giFAxFtXgdB/xxeobA/csMWkCKtvCynPgTAadEdeWIOsw
 WwV1VmPW6DGn5JXx61qd3FxX5um8qFWDIqF7SBwN2AqxHREU463klwp4z8p/nlNND0rt
 Oml4LCO6cDPT/EPxYRj24SPvsRANHYNzkX4UST9OI08Ory/vAISDWyuTsCyjTP4h76Le
 Qoqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=D5ljw2mEpVXr9ieEEvEb5LWcwn4WHLTgoxmgT17xzL0=;
 fh=QB7+oKCTVSvymrGF2cky7cdYlMERRCM4D18JHIXMMro=;
 b=awAM8ZBh0rOsbpU71bOfU+iaek43YbBdIiHY/0W+HSO7P1k1S3779x5rPIXRkfe9bj
 gdidXICpxqwyv+JKJip26UJMa31xd1jbXuxep3Vd42uMGVqXtQhn0++53YRVM4/eMzri
 dFsK5W5Z+KxOb1XsJv6SarKQC22En+2O7O6Wa3vHtI1hmi9ReaSIE2fEqrbUtFL37Kg3
 4c1pzH5coMp7RdmH4jsA8sYeBEhHuSnUy8jBt64ol6zHnrcPFzIWkgPnCHeYQwGNjnWu
 dZBcVEOw1nvhoHkbSvR6sxl1Z2SsCUcp9dEWg9o3kxiPdCN6g6B0fMnZoD4fyP6QAaBq
 Jgcg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790269288; x=1790874088; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=D5ljw2mEpVXr9ieEEvEb5LWcwn4WHLTgoxmgT17xzL0=;
 b=CvedTLqgHgIUYrjcNhQms/UY6104bz4RY6YzuJOSpnU/j71Sr+3rt+oh6I92D+ATJx
 yN108X3FGQDZ5gTARM/QUfYsB4WtQjv/Cdp0mtciBWly/nPAXPiPSmpVZ9fsQkEve+NP
 7dQ4tCZqfJYbh+2cLXOi6qDT8gk76t3aIQ79ktuDcuDHEDZ3ga+uqVXRAbUQea+55rWJ
 lXHgnFD0WT4h7lHtugIZOQR8blzU1dfRPbDu8Iu++x1xL5jUgHQ2sG6pfW+mRJEBhpj7
 zCIXCGhYKrTN1Noqw441skQY2lZTdvvN6giqwloQ4bOxB8l3agfNlSraDRoyfa+Z55oe
 h3fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790269288; x=1790874088;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=D5ljw2mEpVXr9ieEEvEb5LWcwn4WHLTgoxmgT17xzL0=;
 b=KtY1y4O9uqu//MC/tbvBcGDp08r0ckosfy7+2qlRDWP6y5U6yva0LyX8tYB7xKzK3G
 PZ+A4Qk3lD8JGRrMPYm/Q0dwyRCu5/8DDnoYrdEdLwvhAZNAPXJqW3U6xavHzXhWBv6+
 R3Kh2FSE3AL1SnZTjV+du8mMjsyw7vsmpZ8uJb8xIDK73q5bou4GFj3zSfVCEy3eMJZd
 XhAlb1CBaw3vybhL7bYNSU4uzGbloxDUxPiYcKsPT742iyHGZnkrHdenBi29tMTeMfrC
 RuBOKKcC8wE24NwEiGopiFaF0nntAIHWkGAGLrCegGPS39uarIX6DIGbM2RlFqIRzH4m
 7nLw==
X-Forwarded-Encrypted: i=1;
 AKwUvBw2XRaaYCOR8mGjg6wQLL/hfE9RDeAzEYscUB+4GZOel2zfAGAlOgrDkD6uJS9rL8uDG+zXIpTZwjc=@lists.freedesktop.org
X-Gm-Message-State: AFuF++nIA47FgvEZ6OE0MVlKGpfrUf7i4INPBj7dtnuE31kLgD8UhVa4
 C+7kUwhe0iaQSemtZ62S8tDbHZwC0LXe6BEvkwPtVMTzs3yW+YBO7ZQgxvIxK/ndUUZxzZ0TU2C
 1WOj8gkcSp7n9fwKI3Qchmk3b4esCZ58=
X-Gm-Gg: AYBFou2AGgIOrn2sdALMYpZBdRbLEk3/ZF05Z4jUDchE9Ca0FhXDl8AvlZV0GRote6a
 67uqyz15bB0cuS9dYKPwXI2geco2buNU/s7sR5Yw7VrCaD7a8tk0YNaTmIqiBaxKkSSW9Ia4uXO
 zBboMlS8LfzUoksu37memjec4E3eSRu9xNxUm0yAHIPIu1iv003vom6akvd57mLt7iT3XY5777c
 TNuPqIj9CitZC5orH+h0o5gttkawOf16FqlqqlYdf0petVGSY/4sQLLCMFBASlJ+R3AYuLzp9Cr
 wdgeUHjbqVe6KLq9iAzNmr5WCE1pUOjVEI75KydSfQ1Z1XjdgAbTPbeT9aIidjqFbNzkvxFJs86
 wxqnKfSsRWTR16VP6DUDrPR63m/RCijsP1SMQVqNlCKQ=
X-Received: by 2002:a05:6102:41a6:b0:7af:8089:2732 with SMTP id
 ada2fe7eead31-7b081f90cc0mr199413137.1.1790269288232; Thu, 24 Sep 2026
 10:01:28 -0700 (PDT)
MIME-Version: 1.0
References: <arPTRF4qS6o1Q3vD@sirena.co.uk>
 <CADnq5_NUH1MBU15Vs287by4P37YV+6F1Q3J1e4Q4KuOvPwK9Fw@mail.gmail.com>
 <arPhsTaiqXPgCqAU@sirena.co.uk>
 <CADnq5_OJ=kP+0=iXbpcjsWbTx8=sNfov0wLSW53qLcFU0fmVVg@mail.gmail.com>
 <4ddbd29e-3524-4f4c-b6d7-1e2e677641b5@sirena.org.uk>
In-Reply-To: <4ddbd29e-3524-4f4c-b6d7-1e2e677641b5@sirena.org.uk>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 24 Sep 2026 13:01:15 -0400
X-Gm-Features: AclHuK8HFMIivaONWoB38lW5QaLLooQ-XLkF8rwfu_UiMAlST0T85q6tMsApcAo
Message-ID: <CADnq5_OPPnSs9Bv8LxRp104Cejf3H3JFkBE4XSfiTYgkdmjbHg@mail.gmail.com>
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

On Thu, Sep 24, 2026 at 12:54=E2=80=AFPM Mark Brown <broonie@kernel.org> wr=
ote:
>
> On Wed, Sep 23, 2026 at 05:57:24PM -0400, Alex Deucher wrote:
>
> > Your reports are valuable and we always take them seriously even if I
> > don't reply as quickly as I should.  For the issues at hand they
> > should all be fixed with the following patches:
>
> > https://patchwork.freedesktop.org/patch/755725/?series=3D174828&rev=3D1
> > https://patchwork.freedesktop.org/patch/755741/?series=3D174834&rev=3D1
> > https://patchwork.freedesktop.org/patch/755769/?series=3D172614&rev=3D2
>
> > I'll push a new -next branch with those fixes later today.
>
> I'm still seeing at least:
>
> /home/broonie/git/next/sfr/next/drivers/gpu/drm/amd/amdgpu/../display/dc/=
dml/dcn30/display_mode_vba_30.c: In function =E2=80=98UseMinimumDCFCLK=E2=
=80=99:
> /home/broonie/git/next/sfr/next/drivers/gpu/drm/amd/amdgpu/../display/dc/=
dml/dcn30/display_mode_vba_30.c:6666:1: error: the frame size of 2064 bytes=
 is larger than 2048 bytes [-Werror=3Dframe-larger-than=3D]
>  6666 | }
>       | ^
> /home/broonie/git/next/sfr/next/drivers/gpu/drm/amd/amdgpu/../display/dc/=
dml/dcn31/display_mode_vba_31.c: In function =E2=80=98UseMinimumDCFCLK=E2=
=80=99:
> /home/broonie/git/next/sfr/next/drivers/gpu/drm/amd/amdgpu/../display/dc/=
dml/dcn31/display_mode_vba_31.c:7460:1: error: the frame size of 2128 bytes=
 is larger than 2048 bytes [-Werror=3Dframe-larger-than=3D]
>  7460 | }
>       | ^
> /home/broonie/git/next/sfr/next/drivers/gpu/drm/amd/amdgpu/../display/dc/=
dml/dcn32/display_mode_vba_util_32.c: In function =E2=80=98dml32_UseMinimum=
DCFCLK=E2=80=99:
> /home/broonie/git/next/sfr/next/drivers/gpu/drm/amd/amdgpu/../display/dc/=
dml/dcn32/display_mode_vba_util_32.c:3278:1: error: the frame size of 2176 =
bytes is larger than 2048 bytes [-Werror=3Dframe-larger-than=3D]
>  3278 | }
>       | ^
> /home/broonie/git/next/sfr/next/drivers/gpu/drm/amd/amdgpu/../display/dc/=
dml/dcn314/display_mode_vba_314.c: In function =E2=80=98UseMinimumDCFCLK=E2=
=80=99:
> /home/broonie/git/next/sfr/next/drivers/gpu/drm/amd/amdgpu/../display/dc/=
dml/dcn314/display_mode_vba_314.c:7546:1: error: the frame size of 2128 byt=
es is larger than 2048 bytes [-Werror=3Dframe-larger-than=3D]
>  7546 | }
>       | ^
> cc1: all warnings being treated as errors
> make[7]: *** [/home/broonie/git/next/sfr/next/scripts/Makefile.build:290:=
 drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_util_3=
2.o] Error 1
> make[7]: *** Waiting for unfinished jobs....
> /home/broonie/git/next/sfr/next/drivers/gpu/drm/amd/amdgpu/../display/dc/=
dml2_0/display_mode_core.c: In function =E2=80=98dml_prefetch_check=E2=80=
=99:
> /home/broonie/git/next/sfr/next/drivers/gpu/drm/amd/amdgpu/../display/dc/=
dml2_0/display_mode_core.c:6821:1: error: the frame size of 2160 bytes is l=
arger than 2056 bytes [-Werror=3Dframe-larger-than=3D]
>  6821 | }
>       | ^

Does this patch fix it?
https://patchwork.freedesktop.org/patch/755883/?series=3D174861&rev=3D1

Alex

>
> after merging amdgpu today, note that this is in the -next merge and not
> just the amdgpu tree in isolation.  I am currently holding drm and
> drm-misc at next-20260921, there is a conflict with the old version of
> them though that was just comments but they'll be in the history at the
> point I'm building so possibly whatever git did with the merge is
> causing issues.
>
> Any fixes will also need to propagate into drm and drm-misc.>
> I'm also still carrying a build fix marking the display KUnit tests as
> BROKEN due to the issues with the conflicting changes with drm-misc
> which several people have noticed, for example there's this from Arnd
> last week:
>
>    https://lore.kernel.org/r/20260915201006.3526945-1-arnd@kernel.org
>
> None of the mails I saw about that or the issues resulting from my
> mismerge got any response either.
