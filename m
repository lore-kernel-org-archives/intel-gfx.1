Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D833EF4ED4
	for <intel-gfx@archiver.kernel.org>; Mon,  6 Apr 2026 12:57:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6DF810E23E;
	Mon,  6 Apr 2026 12:57:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="c+W3rEBS";
	dkim-atps=neutral
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
 [209.85.210.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3081C10E0C8
 for <intel-gfx@lists.freedesktop.org>; Fri,  3 Apr 2026 22:38:22 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id
 46e09a7af769-7d8b2703f37so2050668a34.1
 for <intel-gfx@lists.freedesktop.org>; Fri, 03 Apr 2026 15:38:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775255901; cv=none;
 d=google.com; s=arc-20240605;
 b=Nv7qc9R6HOSecExnJWOoiADtzI1TWgunI7s8wj/pTf50to+9aEIdMmCT67TmvmaWLl
 i8iL0UOE08oLTzyz4Fm+9LvXlb5rAlk0Njdr42VZPWal0S03XpawpCgYEXTkdZLkV6WC
 301T9U8g8EmGL3NLwnRw+nY9/Ish5xCJjWezxkosUkeY5sCbIeQKuOvGSw8JBK7tIDHm
 hDbTae9aeuAj2op/FM3SYkEPXV3bieLaIPQ/EtYMs360WWYded+b75yVME6VAgoRU21j
 iQWKE/B3EROEQbfRYFJ4+dcv1vRPPzDLaTbmCD9eLwmI2AXIEneWgJXVTrqPfEvz/WWe
 am7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=pPx0+7dkDZDi33AkgM20x+ySrkd+SIBRxGtn7NuJN0w=;
 fh=0BJrjFPC9YPEdcWKycKCKaEbIu4yG10GY72cHN1NPVo=;
 b=OvvWVO5C+35zQW50y8YRhxm6lMKrbCybAvUEn0dVvpJUDYzxsKqU7/L3bkC8uzqqlT
 DlH8YDBpWpgj6jNBH9cFSZC0f1KNjj4dyxCfdinky8o40kg0GR57lFk0IbaXcmUuNDOh
 AMx35EVyUExjvRnP6FPhOi5aQblXM6sasghYmPAtas3vAeRgHjn0eZfxaEpgIXGD5NqB
 Fc0XqZBSIP6urR6GMWSMs48n5/zWjM8XSLA3/suL2HH8VM4480fLeNXsMo7RSAqIKcSC
 cf9l90aGRni0x3N5XaQDkar2/4z0DXl4uwLOmBcW8hwtVkkNf2mOSOOb78Mm7maJ+FNK
 HWTA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1775255901; x=1775860701; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pPx0+7dkDZDi33AkgM20x+ySrkd+SIBRxGtn7NuJN0w=;
 b=c+W3rEBSa1/9MsjeZNDDc4FP8z/kBBRpEexOmR01dSojCvJ1VTctHqggyJlueagVFH
 18phZ0MHjW90xOpVLOYdWWci+3qhb82qu5jMANb7GQStLxrpTrediZTsreGJZuUJeolr
 iEiC+QGkR/ItwE2ppCw9YD2hUW5yWVhlk1cok1/u4P94bbGuJnES4GEgz7KjI4ouNj+7
 icuZtel766fy0SLdfUB4tTCZFo+c0DXrWbCnqx+JjaTF3Up7TL844Sts/Zvuzvi25OFy
 mexJ53Q9wr5T6xFhAo5X141mp7EG4vwBVR8XPXmaT0y56FjPPLJ+eZF1c8ZSBwZa39rC
 R/kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775255901; x=1775860701;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=pPx0+7dkDZDi33AkgM20x+ySrkd+SIBRxGtn7NuJN0w=;
 b=J8wJ7VFIqvdvYc5fpaS3QXNrn30uSQTfOerkBNHkChVaGKfFb/sLDemADOkpAwxtJi
 c1X7enh4QytL353oEmcKlYuLH8oDUKHjhlHDilQ68FcGYQHT0KoDVFpqOuJaLLrNhOzV
 L02d3iqWHzMsbOzo+urllR0qTfz1CrHQLOHEefa5t2WmpXiyPyEsBZC85W83daP6bjXz
 FGJh64pVNF2uY1P3xtUkvdzT6v4aRTJU/B0lwx0vPNVmM/TtmKPSjO4okyNaqxHfb6mq
 rwvKwsVy0Te+dxjhTJhiZxuUQjhv+VYeSWOvpUsVT/p8t3J7e+s1hZSSJrr2wuKlYZyA
 iOOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUiAHcF4ZmkPP+2snV+TNhKvFIfcyNj0L3Dp7+PhLDNawY4IG5GpZgw186kZjedUHoUkxa3d2VrWaA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyT+Lz3+yV+U1UfsMskiSM+ZCuXAm/4/GitN/s9r9CFY/+/SmV7
 E35IwdqlH//l0z+zN/9GyxkzAX7s8hewHG3wIc83gL2SSigjrfgFJNKTfAEtPa317ldE0ehSRXC
 t23bI89sf/Bfl9BCtdhPTu4UQ72kvIAg=
X-Gm-Gg: ATEYQzwx180YIijffLqdwmln+ieLHH774K8x/2c2SIj8Ui+n7LKvkPMzS5HJIUSkMnC
 xaG05+CD+81uSk1uTnmpVdQRVfoMh2iWKFOybvFCpJ2G+ujvceUUAEUF63oJ+rVia2Bc2NU0Gvp
 kyxcHk9OaCLRuq7mSSYqEGc2445Sp2sxPnpvYkMsrcwR+FteMSiTsdB8fYh7b3XsDdE4UCcyI2A
 n+vuV+yyLCHAtIoZyMCIHbw6KeXb0xclGiB/cBNtNORxYROtChAkGUWrpP8NnMFhz4pMH7XVOGV
 kOYYQC4=
X-Received: by 2002:a05:6830:4117:b0:7d9:ae76:de25 with SMTP id
 46e09a7af769-7dbb72f3516mr3416995a34.28.1775255901281; Fri, 03 Apr 2026
 15:38:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260324151741.29338-1-sosohero200@gmail.com>
 <acUnQkniqECI0QVY@intel.com>
 <CAHk-=wj=h9z-Qp+xm1oSURRGHO3wexzG7MyLqU8gSQbastwgdw@mail.gmail.com>
In-Reply-To: <CAHk-=wj=h9z-Qp+xm1oSURRGHO3wexzG7MyLqU8gSQbastwgdw@mail.gmail.com>
From: Yassine Mounir <sosohero200@gmail.com>
Date: Fri, 3 Apr 2026 18:38:08 -0400
X-Gm-Features: AQROBzBLI8pipnxN1YWiXD6T-qM4BgeCaCvyq_7c3lRqShfwYeaF5RqWxy_zrMs
Message-ID: <CANq=4mB=O9-P5AJi9yFYQ2EX8zuMNTOOuSwCS2=msL=9_wvufg@mail.gmail.com>
Subject: Re: [PATCH v2] [PATCH v2] drm/i915/gem: Fix UAF race in
 eb_relocate_vma
To: Linus Torvalds <torvalds@linuxfoundation.org>
Cc: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
 Dave Airlie <airlied@gmail.com>, g@web.codeaurora.org,
 gregkh@linuxfoundation.org, 
 intel-gfx@lists.freedesktop.org, joonas.lahtinen@linux.intel.com, 
 security@kernel.org, rodrigo.vivi@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 06 Apr 2026 12:57:50 +0000
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

Hi Linus,

Thank you for the follow-up. I'm more than happy to provide the
sign-off for proper authorship. It is an honor to contribute.

Here is the patch with the official sign-off:

Signed-off-by: Yassine Mounir sosohero200@gmail.com

________________________________

drivers/gpu/drm/i915/i915_gem_execbuffer.c | 2 ++ 1 file changed, 2
insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_gem_execbuffer.c
b/drivers/gpu/drm/i915/i915_gem_execbuffer.c index 1234567..890abc
100644 --- a/drivers/gpu/drm/i915/i915_gem_execbuffer.c +++
b/drivers/gpu/drm/i915/i915_gem_execbuffer.c @@ -865,6 +865,8 @@
eb_lookup_vma(...) vma =3D radix_tree_lookup(&vm->va, handle); if
(likely(vma && vma->vm =3D=3D vm)) vma =3D i915_vma_tryget(vma);

else

vma =3D NULL;

rcu_read_unlock();

if (likely(vma))

Best regards, Yassine (Toji1)


On Fri, 3 Apr 2026 at 18:12, Linus Torvalds
<torvalds@linuxfoundation.org> wrote:
>
> On Thu, 26 Mar 2026 at 05:32, Ville Syrj=C3=A4l=C3=A4
> <ville.syrjala@linux.intel.com> wrote:
> >
> > Ignoring the AI slop aspect, I did have a quick look at the code a bit
> > and noticed this:
> >
> > eb_lookup_vma() {
> >         ...
> >         rcu_read_lock();
> >         vma =3D radix_tree_lookup(...);
> >         if (likely(vma && vma->vm =3D=3D vm))
> >                 vma =3D i915_vma_tryget(vma);
> >         rcu_read_unlock();
> >         if (likely(vma))
> >                 return vma;
> >         ...
> > }
> >
> > So if we somehow get a vma with the wrong vm there then we
> > return the vma without grabbing a reference to it.
>
> The fix for this seems to have gotten lost and wasn't in the recent
> drm pull request.
>
> I can just fix it up by myself, but it would be good to have proper
> authorship and sign-off. Please?
>
>              Linus
