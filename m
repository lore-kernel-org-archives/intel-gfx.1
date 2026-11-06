Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016A3606A31B
	for <intel-gfx@archiver.kernel.org>; Fri,  6 Nov 2026 04:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PNO9/+S+
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A68D10E164;
	Fri,  6 Nov 2026 04:17:05 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com
 [209.85.219.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B01C10E0BC
 for <intel-gfx@lists.freedesktop.org>; Fri,  6 Nov 2026 04:16:58 +0000 (UTC)
Received: by mail-qv1-f53.google.com with SMTP id
 6a1803df08f44-91c19fc50abso1990556d6.1
 for <intel-gfx@lists.freedesktop.org>; Thu, 05 Nov 2026 20:16:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793938617; cv=none;
 d=google.com; s=arc-20260327;
 b=H2Ns358yRntiFaBwQ3bDZYc3sSTYjRlbmx+TUiijth1yn3Ued+zxI6McSo9Kp8bRU+
 zEq1zDf3ahBFp28ku2LzwQgdpNCXraUlYaVsARJmc0mPRFAC66id3p4p4sFsPzD+42Eq
 IZVvU34tOXZftfwd7zrY46UsTS++rYxACHSy/UTolIA97Y8GzQTWsBEeShnUd1cQuTkU
 FkQQtwTgOuUA0zBsX/sPK04Wk7TuZgDhF9Klr/xd2ddveHDWd89dboxDh4H6NtSWtw2M
 ZsVED3bP9YWKt71V0TBf6Qy4mIgbwGXkmp2vlKdZAbjW/Qv1YU8QPIHcums/DHwg+ofd
 a/QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=YAf7ONLuccQ4q1QaxEgb694d9s8wkHRNm7XCVYSS7qc=;
 fh=GUsH7ydTyq7h2dfVtZ0rce2IB72Z6ixK4JYmo7LOznA=;
 b=nqJDLTDuUffInKfyrHvDQqp/w4XB9qeX8yEgvs1Vqh8StQS8cb0ixjs+sECZAaUACz
 0hh+mzO4gvTdg4JgSb/bsZQYWRVi4fqjJVme9KIZct81K5VICQCB2yANQr5uOVS+dDSK
 2THXNw9liJ5vrtUcLIxGbybKHqZ+RL45FsmhGV1D8E0n7fcG/WyJHyPqRFakDMr/zEHj
 jp1Yedxe5qBAMCRVnbiIX8gcwrXVogZXNeMhsEGGkVDIGwabrDe08mMOCWn6SKYpcAUP
 dhPTon9LGY2gU3thTGFyo7IIfolrcbpUOfElZKgoo6bXXwbgOP6pQ4j/MiNAf++ThDGY
 +VNA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793938617; x=1794543417; darn=lists.freedesktop.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=YAf7ONLuccQ4q1QaxEgb694d9s8wkHRNm7XCVYSS7qc=;
 b=PNO9/+S+W5J8vjWjh/QYG7cDT1y4gzLc2hYUEtX3dml1r+p34MqzG1mLT14+UOUDH6
 RI/cyg+KUp4jMWSxOOlsPU9hap+o4YQX/wtsx1XeDljQ/W5ZNNNRpBx7EtP0T/d81IE2
 eU35PDzycPdGu3YG4VOwBhTguC+iPr/jfXQXo2Y207Co49Zhsne9cQVUt1lsQ52dS9w9
 k/mpmjFnoaEzkUkSxSIfFjs++ChQnO5yl3mwITGFk7XsFMwW/J1HyxOyFIe23u2+zPbu
 bSoEPKyswwpOSFWHVoymXkWXr65mEBfKqv7DjqyZkCB4ADBZGOeLM0h/ahs4gx3IK0fQ
 XqbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793938617; x=1794543417;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=YAf7ONLuccQ4q1QaxEgb694d9s8wkHRNm7XCVYSS7qc=;
 b=YsdgX8okL/Xzd0nqgNDmOTY83WiuX2uGoQjQKBDHjL4JtK6uqdSpUS/D15kZSWOAdn
 1umCEg7CQVEl3u3nf5hIVj1x6qRoEmmn/dDBRfs35Ys51ZFWMNZ2yz3HyZaRFfcxtfie
 KPnOwSnLgi4zv8c2TnU920Tbci6gUZBaQVAt6G9E+rGnlsj5P5TfWCVqH/vFKUN3YJkT
 n/Wwc+EjYoXy8T1sivNg/TKpYm/J9lTm2XBaNVR/eb6ey0Gah8olt81WcBluNyG+Q+sg
 dMmkC9VGAssKSPXGqiovFZDrK7s29aDBzZ/olcPGoF6XEuaGhUDY/NchoiMf4Q1Dc0bB
 KkUA==
X-Forwarded-Encrypted: i=1;
 AKwUvBxLemI7rzRz1nprEc86tF8rSzUbfujbVEoiSoBsizh1hh7Eh+sWsqI0ZB/Vq37SMHaataU/RFBH1sA=@lists.freedesktop.org
X-Gm-Message-State: APuU4Z+woDIK2LPawZCJqbZA4eQ1YXnZ6t6OZPdEeRPKFvGgF0KYcxIZ
 NqN4DNDoeb/QUFiRY4Zr7rx2+sxW1f26DbzbJO4a7uTY+5T676eNv9S4/3NwgTgoLmuWOFQOub5
 Sdk20QSIenv8UouSHP/QiUz9bZGh9yHg=
X-Gm-Gg: AYBFou2bJ9vy794Zo0Anljbyy/j35Z51YHmhHdnVOBGXytGZX5BtndgNeJURwpCOLRk
 01B4/AWe7xcZFNgij1IGDYIlSkFadNBpWNAjLjdWcSKBcINu6a+T4st+JaK5XDFQuiYY9pxy/Xh
 1Zkaw6SULrcV4eiYYb8nwxjM8NqoFjJiGKikqdW/XBzrDOrsPdi0vTzSdR5Q822FgqmEL1K4y2n
 00YraN9AeEWx9oLuPRd/3y8xrICgukK7zu6wykN2qluygQtMfead1qSiq/3X8yLEE3Oh433Srj7
 hG8qhnT4bS9yWbvITwsU870myp1GgbyMkSHfZBlx1AVWlhZDUsw0QUtbfvvb0SzSHq8rVaOwitG
 5DmIix8Qq0+O5TxMW0SH1XvkhZMQQVvfMk+7QtvABkDrKuuNB3x6kFKuAULo5WdoiOoMMXwAKws
 EROzOreqg+QYqV21cJGPYHiNSbNcaCmv686pNMVqctBAw=
X-Received: by 2002:a05:620a:29c2:b0:945:f099:8776 with SMTP id
 af79cd13be357-945f335489dmr188413185a.4.1793938617395; Thu, 05 Nov 2026
 20:16:57 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <5e79d3c0-5b2c-4e6c-ba38-3b723daf7109@intel.com>
 <atDXDlI-EhrA791a@intel.com> <d4d5302f-9768-4122-bbab-4384ef7aa9fe@intel.com>
 <atD66da36wMZ0gie@intel.com> <3dc05c1e-fe02-475b-a525-7c53081e816a@intel.com>
In-Reply-To: <3dc05c1e-fe02-475b-a525-7c53081e816a@intel.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 6 Nov 2026 14:16:45 +1000
X-Gm-Features: AclHuK_qVk_mk86S6JfIT1gnFSXBmrgpYGJ58tw6bXoxtZb1T0y3DgnX0AzFe1M
Message-ID: <CAPM=9tzc6QxVvz+QBYGGtkp=2Mo7W27Mm0togp_LfKspgtoL3w@mail.gmail.com>
Subject: Re: Nasty console and xe driver interactions
To: Dave Hansen <dave.hansen@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, Zack Rusin <zack.rusin@broadcom.com>,
 dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>, 
 intel-gfx <intel-gfx@lists.freedesktop.org>, intel-xe@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 6 Nov 2026 at 10:16, Dave Hansen <dave.hansen@intel.com> wrote:
>
> On 10/15/26 09:10, Rodrigo Vivi wrote:
> >> BTW, "xe.force_probe=!*" on the command-line also gets the output back
> >> to normal.
> > the force probe proves that we can still probe safely, but apparently
> > on my first attempt I missed the fact that pcim_enable_device will
> > touch the device and register a pci_disable_device that might
> > clear stuff and mess with the VGA fb...
> >
> > Perhaps if we move just one step over:
> >
> > https://github.com/rodrigovivi/linux/
> > commit/616cd8c1b4d4414cd1f7ad56fa5d8abd36d7968d
>
> So I gave this exact commit a go. It still seems to have the same basic
> problems. I put the missing "ptl_guc_70.bin" file in place, but it just
> moved over to needing the "huc" and went back to the no console
> behavior. I added the "huc" and the "gsc", which seems to make the
> driver happier, but the screen has garbage. Looks like I may be missing
> one of those MEI drivers.
>
> But, still, the driver seems to be rather aggressive about killing the
> console even before it is working itself:
>
> > [    0.672748] xe 0000:00:02.0: vgaarb: deactivate vga console
> > [    0.673227] xe 0000:00:02.0: [drm] Running in SR-IOV PF mode
> > [    0.676750] xe 0000:00:02.0: [drm] Tile0: GT0: Using GuC firmware from xe/ptl_guc_70.bin version 70.72.1
> > [    0.914206] xe 0000:00:02.0: [drm] Tile0: GT0: ccs1 fused off
> > [    0.914213] xe 0000:00:02.0: [drm] Tile0: GT0: ccs2 fused off
> > [    0.914214] xe 0000:00:02.0: [drm] Tile0: GT0: ccs3 fused off
> > [    0.935645] xe 0000:00:02.0: [drm] Tile0: GT1: Using GuC firmware from xe/ptl_guc_70.bin version 70.72.1
> > [    0.937939] xe 0000:00:02.0: [drm] Tile0: GT1: Using HuC firmware from xe/ptl_huc.bin version 10.3.3
> > [    0.938382] xe 0000:00:02.0: [drm] Tile0: GT1: Using GSC firmware from xe/ptl_gsc_1.bin version 105.0.2.1397
> > [    0.938855] xe 0000:00:02.0: [drm] Tile0: GT1: can't init GSC proxy due to missing mei component
> > [    0.959120] xe 0000:00:02.0: [drm] Tile0: GT1: vcs1 fused off
> > [    0.959139] xe 0000:00:02.0: [drm] Tile0: GT1: vcs2 fused off
> > [    0.959150] xe 0000:00:02.0: [drm] Tile0: GT1: vcs3 fused off
> > [    0.959159] xe 0000:00:02.0: [drm] Tile0: GT1: vcs4 fused off
> > [    0.959168] xe 0000:00:02.0: [drm] Tile0: GT1: vcs5 fused off
> > [    0.959177] xe 0000:00:02.0: [drm] Tile0: GT1: vcs6 fused off
> > [    0.959186] xe 0000:00:02.0: [drm] Tile0: GT1: vcs7 fused off
> > [    0.959195] xe 0000:00:02.0: [drm] Tile0: GT1: vecs1 fused off
> > [    0.959205] xe 0000:00:02.0: [drm] Tile0: GT1: vecs2 fused off
> > [    0.959214] xe 0000:00:02.0: [drm] Tile0: GT1: vecs3 fused off
> > [    1.024100] [drm] Initialized xe 1.1.0 for 0000:00:02.0 on minor 0
>
> BTW, I am building the "xe" driver in. It's causing all kinds of fun
> problems, like needing to manually add xe firmware to my initrd.
>
> Maybe the:
>
>         config DRM_XE_DISPLAY
>                 bool "Enable display support"
>                 depends on DRM_XE && DRM_XE=m && HAS_IOPORT
>
> DRM_XE=m dependency is biting me. Is it stealing the console before it
> knows it can actually display something?

It's chicken and egg, you can't init the GPU properly until you steal
the console, you can't unsteal the console once you fail to init the
GPU properly.

Restoring text or efifb is quite difficult depending on how far into
init you get before you have to. You unfortunately don't have a kick
off efifb now option.

Though we could probably do better, it's hard to validate.

Dave.
