Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEFB9C98315
	for <intel-gfx@archiver.kernel.org>; Wed, 23 Sep 2026 21:57:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D14010F1DE;
	Wed, 23 Sep 2026 21:57:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="U6++Ynp/";
	dkim-atps=neutral
Received: from mail-dy2-f23.google.com (mail-dy2-f23.google.com
 [74.125.229.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67DD910E18C
 for <intel-gfx@lists.freedesktop.org>; Wed, 23 Sep 2026 21:57:38 +0000 (UTC)
Received: by mail-dy2-f23.google.com with SMTP id
 5a478bee46e88-32be7127c64so57880eec.2
 for <intel-gfx@lists.freedesktop.org>; Wed, 23 Sep 2026 14:57:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790200657; cv=none;
 d=google.com; s=arc-20260327;
 b=RWkDjZL9nSURje6jWun4dMo3k/Z5zA/bcH7ioUqXow+TqFsqYwLroQTSU0ntO0zb7+
 yX+b4IuR9AHYloYzCRYm3MvAwTB0YNQqYuCjVBOK7hBJ6IxTgcfS3ySyHVLYPQ7CJbXi
 m3Yw1d0v9dd98mG8RIxu/eFQ2WoKJ9Xx7TLYYdBXjA3qyWpZ0bkpaWHcmQi4PvRhOvt4
 3bEdDkm/pa57Yf0l1iyOElvk3l8IhYdpRG4/PnDOwLzcGVnrHC403gFLL8p3YYSR4LW8
 DPbzrNMYOwzllhVwsOL3kjiM0mtgXMNAzLrz1lLsZqyrk4x7PXrZA1g1X+9n4oddm8Kp
 ihZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=T24E2HgBT3Ki1o2tFVN/BRTIkQAmjBNrRpnx59eMnNs=;
 fh=+f1hqfQXhkTSEQiDOz1hI8UGrxmPlefkUdUuq0erwmk=;
 b=VpzPGYGEin1PfTXaATD9QX6629qKKDNjnSFpN5KXCNeviZaVZxlufVd4IOWGBVFo9w
 txEKZYf2bb/p5a2luy/a5HK3CE7E/qQmwz5RY5VYpz3fGEuSur4uGZstQWC8bQwxz/ni
 v9dQBrRsiwlvNLmpQnfYQV+laIwDLKGudxeKDWRTxFtM6YdZVPxatnnmYqqgwOe+lePZ
 y7ay+9No9ieRNSWacnvrxMGfSEo54ZSFQQ40ZV+Z3nYhL278aaSZkv8CYMb+iI+3y62A
 GZhYVSlAT9fkQPQi52nmFi1v2NHtPLmKQ/xOU2BfKIpksUgj7wP226KMCz3xVEBeReFK
 +3EQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790200657; x=1790805457; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=T24E2HgBT3Ki1o2tFVN/BRTIkQAmjBNrRpnx59eMnNs=;
 b=U6++Ynp/jdmHYEMxOIRj0E1d2FeDSiXHd8W0Nvz5F3uYMBMdzaXunQJ+yotetNMP9A
 g3D+DRXqw8B2xg/7O4QJawPBb23pVuyuuAH+AEC5YIgt9Qi+QekmmCM7X5IEKwGkRzZE
 menLcxiS1zqqRLnuSLvpD9cfUdPu3A9n3zfrte995jsyrhSJnwLCztdrVlRXNyfYT1Z6
 AOQuWbnZBMCdXaQ/mXCXxQtr8CocGmBmuULdVU2wnnXw8/Z9d8cV6UueUltUkMM5sUW+
 /rJUuLNOLs40/41tby+z8f+ZQp0A2XkMU70ynfwtsk08EQrz95OeI9qxgsWoYgoR3Apy
 Mtbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790200657; x=1790805457;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=T24E2HgBT3Ki1o2tFVN/BRTIkQAmjBNrRpnx59eMnNs=;
 b=blTOjMDNsDevyXGMikJK+CxUKYXJeFLqAYEUMPXL2HgWC+53TpJ7pzc+5WwFtAf1kU
 hTfRyX6LfKI7E746XsARcHfKgqjcrqE5HKkOYV1YsvcaXo2IZHDDFVh/am5vAX6qegQL
 LDDXc8PSDSOk6nNRQkJYZkeqn6OxfwiP0ko06YTSqy/Idki0KmojG0pQujYTUUEc4wXf
 IwEKRHhEkVRZPvENQ4DPGoOWFoFD4z8qVVesXVGdNLAi3LEXcklwNDEaqmG5hSmXZK9f
 iiT9PzuhEujl2W4Jljs9jcDqHFvLy1YWtjnr6CEu4LLWajwkZWchrr+kKgcjYNmETjXT
 XA0Q==
X-Forwarded-Encrypted: i=1;
 AKwUvByCZDADsUB+jVC45ZXaOmw/u1ko8wSNBs8uytqMS0n62ah7BJJtLJYI8qO1p2QSAyo0CC9zpZ41Sz0=@lists.freedesktop.org
X-Gm-Message-State: AFuF++lDhbgkC31HcYGE8KKlzSDRfuQ1HQpE/6h6R5RhGjpP4txCaN82
 rrTtioXmHt0bLgRBjVPD3odJ49Zk3J6n+GBkwu2GP0kJ8dTfPlr7/ZMLeEv/xiJ3KUWextfamfj
 E2F+mKwR8k99wg/hQSYawIOlv2mhmvio=
X-Gm-Gg: AYBFou3l9fKb5rj3vWAafVLjzz2ECvBPDNvZWAEq/BhpDqx0lcNqMZv/3gUnCPt1kWk
 nA1sP58MNzOstkwUG68ovzoWX7Sz9MoVENZuaQsI8+hWu64wxL82wGdrgD5DnmVbWogCX0bXWjn
 W8UrCSO6OCXj+yeVJBb/wb3IGBRnHs4WJXHvMuSimgpIFTVaXxup1pob5cj2ulZoOFU6VcadHkH
 TvoPYV+mBlAcS+BLipk1vkxUGLmEI284VzJWC4MlENiMxzyoYq2TSZzvm3CAevjAgCvIIsVNWNu
 q/6XzBqe96bp50PCAzlwz1IW2rgxajsPI817Ru1yqvkDCOg2rwgNsYU/AVdre/6OgICbgcmUivr
 axmaD0nI88rEmqZvhR89eqgu5bC6pvfBN72naMMHzhg==
X-Received: by 2002:a05:7300:7f28:b0:33c:68b:c4d2 with SMTP id
 5a478bee46e88-3400657428emr416140eec.2.1790200657406; Wed, 23 Sep 2026
 14:57:37 -0700 (PDT)
MIME-Version: 1.0
References: <arPTRF4qS6o1Q3vD@sirena.co.uk>
 <CADnq5_NUH1MBU15Vs287by4P37YV+6F1Q3J1e4Q4KuOvPwK9Fw@mail.gmail.com>
 <arPhsTaiqXPgCqAU@sirena.co.uk>
In-Reply-To: <arPhsTaiqXPgCqAU@sirena.co.uk>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 23 Sep 2026 17:57:24 -0400
X-Gm-Features: AclHuK_Sy6gy_cFQzs494m9ICFUjGa5KnK2eKmqxNuEJb4IKFn6VLWZL6MmQkaA
Message-ID: <CADnq5_OJ=kP+0=iXbpcjsWbTx8=sNfov0wLSW53qLcFU0fmVVg@mail.gmail.com>
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

On Wed, Sep 23, 2026 at 10:27=E2=80=AFAM Mark Brown <broonie@kernel.org> wr=
ote:
>
> On Wed, Sep 23, 2026 at 09:45:38AM -0400, Alex Deucher wrote:
> > On Wed, Sep 23, 2026 at 9:25=E2=80=AFAM Mark Brown <broonie@kernel.org>=
 wrote:
>
> > > neither of which have had any response at all.  It really seems like
> > > there is some room for improvement in your processes here, currently
> > > that's three drm trees all held out of -next with the same fairly sim=
ple
> > > build issue.  Can I suggest at least check to see if the code you are
> > > trying to merge is in -next, the drm merge was done after amdgpu had
> > > been held out of -next for several days.
>
> > I sent the PR out on Thursday and you reported the issue on Friday,
> > then the weekend happened.  It was investigated and fixed, however
>
> The actual merge still didn't happen until after I'd reported the issue,
> and then as ever things are now starting to propagate through the other
> drm trees.  It seems fairly obvious that there is room for improvement
> here, for example people could check that the code they're merging has
> at least made it into -next.
>
> > Dave reported a different stack frame warning yesterday so we are
> > trying to make sure that is resolved as well.  In addition we've been
> > trying to figure out why our clang builds did not catch it in the
> > first place.  All the patches should be available momentarily.
>
> OK, that sounds more promising than what had been visible to me.  It
> would be helpful if you could be more communicative regarding these
> issues, the drm trees and over the past couple of releases especially
> the amdgpu tree take substantially more of my time than the rest of
> -next.  Between the frequency of the issues, the length of time they
> persist, the way your process will obviously trigger such issues and the
> near total lack of response to my reports it really never feels like
> that time is valued.

Your reports are valuable and we always take them seriously even if I
don't reply as quickly as I should.  For the issues at hand they
should all be fixed with the following patches:
https://patchwork.freedesktop.org/patch/755725/?series=3D174828&rev=3D1
https://patchwork.freedesktop.org/patch/755741/?series=3D174834&rev=3D1
https://patchwork.freedesktop.org/patch/755769/?series=3D172614&rev=3D2
I'll push a new -next branch with those fixes later today.

Alex
