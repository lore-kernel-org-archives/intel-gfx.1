Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42A6DCCF2E4
	for <intel-gfx@archiver.kernel.org>; Mon, 19 Oct 2026 11:41:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DA3F10EC03;
	Mon, 19 Oct 2026 11:41:51 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 002C110E359
 for <intel-gfx@lists.freedesktop.org>; Fri, 16 Oct 2026 19:05:00 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-3a60cb94b80so2215861fa.2
 for <intel-gfx@lists.freedesktop.org>; Fri, 16 Oct 2026 12:05:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792177499; cv=none;
 d=google.com; s=arc-20260327;
 b=RSobAPyUiDSmLMreJpHThJlem809mA2vGMMhfQPfV5FOZpnYJVVHh+xnqcqva+3S6y
 2mrVii4ftY2TVuwmC+6htNE8fnY3CYqB0pjjGUUYkNYmFys8JGqjowMnK5Jbg8TUbffj
 fntJeTFRk9SW4C6cfgtHEGKMCcowNeHo/cgKEMjbFKq3w6Up1D0O4kyt+8SOb4raC0qo
 C93xc9M+Z1y7dqPVD3S0su3ysi3bBThiVDHsFekY9Z9F3hwjQozGK07QWs7pkHos8OKz
 xIdOPuI/ZhKg8pPtyqJ5FZav/iEV24P0nIOieU4+0T1EgedHulWaDvxj1/4nQahmueTb
 SXlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:references:in-reply-to
 :mime-version:dkim-signature;
 bh=hCVnPtqFe9PPLGclN/Sfiz1pW+NWRfIeY6a06sFRlb0=;
 fh=fwAntDds/aD5i+kCMcyJMgsHqM5hQjOQZ0ECm71K5fA=;
 b=l6wzDITttGivJROQIcGLXKO/hE3NXffjICjYvHQiVWizN4n76G9CpFmgpehZ8dbF/X
 HxwsTGq2FFTaddFbEGp3Dm/QSfW1Mxy4judeWWy52tw2Ksa0lz9NImzMH4mAMlxeyRK1
 KR6w6+zxeHrMp1zERF6UJ3m5uEkGTyfxDllMG3Qm3XnI9Y2tXJNzFNTMi+gSnJyYGFA8
 LuEgwEjq0hNXRzZyvrz9DDJjmIHpriwBXMH5omNfP2W9bQvbQw0xe0jtfugnlKD2i4Tr
 4RVsFUGCmKHQS48SI+vLsKPeBzuCgIUokLZQ8mwRubK4FNVJd8I/a1k2MZ5W4u3H8NsO
 X0Bw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792177499; x=1792782299; darn=lists.freedesktop.org;
 h=content-type:cc:to:subject:message-id:date:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=hCVnPtqFe9PPLGclN/Sfiz1pW+NWRfIeY6a06sFRlb0=;
 b=hoQ4t8bQflssOd7Rr+pcVtFtjgdlheXlPB2W88bqvx2Nf64/JsSDYCUFHj22zFNZIG
 XG7zr5fmmXSdc0Ii3qqDjlJUJg34fsiafBIAdbEUZXqeaAAHXBAEc9S3nc2E+Ai+6APZ
 nQQyCW2YgP8zuQ0IiiEa/u0DYyBdNRe5STjzMdM3dXGrpL7v//zFDZGBMiE8gOWSszJX
 H+aueac/0M8GCdPLcdTAop3buIffJsRrushoFQbMq9Mqp1/KbsrGucRB4uwZ1utrl6zi
 nt6H11z0gvV7gmi5RXRu5wMMCgVRngmv5Ker1KZxbCRUIxTrYbwJs8A/XtTaOXybTS6x
 LLQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792177499; x=1792782299;
 h=content-type:cc:to:subject:message-id:date:from:references
 :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=hCVnPtqFe9PPLGclN/Sfiz1pW+NWRfIeY6a06sFRlb0=;
 b=rWIfxWlDRazMtZV/DKcZqVbDscS8nTgoFKsG/foUiQJLVJNOR1VRDqld35BD8Zi4rx
 lOwFAUoIkqqRdhBAwDMg5oW/u+mJdua/knG9XLUcpMfror0GJhcoqx/gAIUTaQWnm3Yz
 rDmKoBRlhh52TixYDHEO6EMNydHf65oQ6acYZRCkd9YyrxVrsaZPKcaK5xsn7Hr0p3pc
 y7cidmq6dfw053Bo1GjfeT51q+MtolH/kJfCLtBkjpqEAjQfkIjfcN+hOaX9ho64KDNZ
 gObQzvkvjXPV3UY2sbPX71SGW6ML5CZY92xs1rppKgJeKARXOAv0/CW3gAUTrjUvsaN8
 Sxkw==
X-Forwarded-Encrypted: i=1;
 AKwUvByPb2nc4zKo5AZTFl6RCL+T8DlF6vTX09VCqA6cbQNbkMJfC/tjDQKDfbEkt94N8jPkYudCqu6+odI=@lists.freedesktop.org
X-Gm-Message-State: AFq9FYKboAyIITJttRUvd3U/NzgbkCAZkQRwtHLoyyBXL1zfS/tOTBnk
 DRk9H65DGhdQ8lf9eM017crDhE8pjJpfUExZRwQGae/4WIflp59jEQTUgLmKCpupg0j/NiBRO26
 Boqt1ChdqyX0T3uOW9H8KVOHYYVat6eI=
X-Gm-Gg: AYBFou23IBhX2/Abup5bB1u++islvGIEcY943HkOpVbNQseY1fVjqC9/Hvp4us0gjGB
 iz9UMQzF6M/6nx+JHRcNoBDvpzJvgtUU8bM5qfirjpXDHIJ2sN6fCwwe19srdfhafd2yfGaU+Ln
 eGG/ojU1z8cwi+/ZOzEScaV8mh7trcqMaUypRBJwZgxkS3L/vT+O1dVjlQ8upob+DRGqeW9Aa7k
 71ySYDRWsdJTSSURG97TJgx3n7Xcb987+Ky0M9EE24AW3QxTt9gUj9jzxfSa0gig2e8wUQz4789
 qR07gZsVD/RKCEJJrwq6BF/Bkimb/zSAGCfJxYczvihcuHIPDljeeNTXR+sOw5sZzA==
X-Received: by 2002:a05:6512:33c7:b0:5ba:cdbb:41af with SMTP id
 2adb3069b0e04-5be5099764cmr189189e87.0.1792177498937; Fri, 16 Oct 2026
 12:04:58 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST; 
 Fri, 16 Oct 2026 22:04:57 +0300
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST; 
 Fri, 16 Oct 2026 22:04:57 +0300
MIME-Version: 1.0
In-Reply-To: <abc82e7191da4638c75ab87605fbe24e2667391d@intel.com>
References: <CAN52AYstOLqaX_=_HBLEGKvcEmY+VGwKSbRRRyQbG4ytr6FD_A@mail.gmail.com>
 <abc82e7191da4638c75ab87605fbe24e2667391d@intel.com>
From: Jame Jao <jaojame6@gmail.com>
Date: Fri, 16 Oct 2026 22:04:57 +0300
X-Gm-Features: AclHuK9Q9k_W0_l4F3dNiy0XIQ0Kg9TzCTZ1PdBZ584Iuo1XtWhcgL1kK4uJmt4
Message-ID: <CAN52AYvQvbPAjpsq9GJDP0QNKKM=H02AVjp9r9TcKSxfnz5VSw@mail.gmail.com>
Subject: Re: [RESEND PATCH 0/5] platform/x86: bitland-mifs-wmi: MIFS v2
 firmware support, Xiaomi Book Pro 14 2026 - filed as drm/xe #9602
To: jani.nikula@linux.intel.com
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 rodrigo.vivi@intel.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 19 Oct 2026 11:41:45 +0000
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

Hi Jani,

The bug is filed:

  https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/9602

Attachments on the issue:

  vbt.bin.gz            1460 bytes, 7680 bytes after gunzip, first bytes
                        "$VBT PANTHERLAKE", read from
                        /sys/kernel/debug/dri/0/i915_vbt on 2026-10-17,
                        sha256 (vbt.bin) 1a0a08b81c48977efbf3f4ea0cc547d6
                        bdf44569f95d88662c5593f24a5e2e4d
  kernel-boot-log.txt.gz  full kernel journal of that boot, from boot to
                        the moment it was captured, with storage UUIDs, MAC
                        addresses and serial numbers removed and nothing else
                        edited

Worth knowing when you triage it: the kernel in that log is a downstream
Arch linux-zen build carrying one local change that touches only
bitland-mifs-wmi suspend/resume error handling. Graphics and input code are
unmodified, but it is not an upstream kernel, and the journal was collected
without drm.debug=0xe log_buf_len=4M ignore_loglevel. I have not reproduced
this on mainline or drm-tip yet. I will add a mainline/drm-tip run with the
requested debug options to the issue and reply here once it exists.

One limitation on my side: the account is new, so I could not apply labels
to the issue ("BUG", "platform: PTL"). If you want them set, they need to
come from someone with the right permissions on drm/xe/kernel.

Thanks,
Eason


On Wed, 07 Oct 2026 15:19:13 +0300, Jani Nikula
<jani.nikula@linux.intel.com> wrote:
> On Wed, 07 Oct 2026, Jame Jao <jaojame6@gmail.com> wrote:
> > I would like to report a WARNING that appears on every boot on a Panther
> > Lake laptop, and that is also visible on screen (before the desktop comes
> > up) when resuming from hibernation.
>
> Please file a bug as described at [1]. Please include the VBT.
>
> Thanks,
> Jani.
>
> [1] https://drm.pages.freedesktop.org/intel-docs/how-to-file-i915-bugs.html
>
> --
> Jani Nikula, Intel
