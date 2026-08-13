Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F692C5B572
	for <intel-gfx@archiver.kernel.org>; Thu, 13 Aug 2026 13:37:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20CEB10F34F;
	Thu, 13 Aug 2026 13:37:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BvH+6PSF";
	dkim-atps=neutral
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF0F710E487
 for <intel-gfx@lists.freedesktop.org>; Thu, 13 Aug 2026 01:46:23 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4980fe6b3beso2897215e9.0
 for <intel-gfx@lists.freedesktop.org>; Wed, 12 Aug 2026 18:46:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786585582; cv=none;
 d=google.com; s=arc-20260327;
 b=noVz6sMND4nW1VKhEsMeFgvSWhVNV1vDMXGCr8Vm2ppZCiMFP711gRbvqiiruK4dKd
 t5qgglCzIin+v58VVdP0cZutrh4UbYwWQYHVXUbpEqzdvT3jaCdingjJcB8K+utc+hV5
 ppr1E7CEK9C0tQJlwhgW9kqwfVJW9Gd/QnRtbW5KiItWO0ym5q/kTt7hkbqDYFOAOdyA
 RU2HY05SGrqGN1ch4SXENz7SCpSJ6SIolQQMA5UVZJ1qJVQdQb5CoMSjpTegdTQeRSOb
 eM1XuGChBYBS3fAk73zx50vofZvM2h4fWFZ/+cmgRm1uH1QAnmlyZMwJvONT67qfhU3F
 GIqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
 bh=8zsVKbd7rZ4kyHv3ec1MwsHX32ckqjo3g74aZna+Cbo=;
 fh=bB4GA8fQ4Lmni+LufLzfpaeyFcQDb4+6UcXVbDE9Cu4=;
 b=Di722WHTDqhxANoH20nPntQWEzVuoDwpPw8Gx6H47QCCHv8mTrjoPlplWz4xMpkv3Y
 rzKtcVt4b8mLLcFDHPtQ8B6tY9AfNaEDMOkyCV5xYjqrRkGz8nbIEJtgmkhEV8YhGj/w
 becr8ZzDnhZCyA7b3q6MijD8xZqiSa6EPJZAZcubaVEnWph32Epi5LRJRZ2OO16DJxoB
 p1LdD1OSU8gZqrmMsxhiFxOxgGyYXwE+V24tk/rSohLudTutR5jgBylau5NpRNs3/Lpn
 WTxFIWLUxMF/NVBWKaDVj4HDC7FefknNRKgypdu70CL2lTBtdu+kHIi96cSXxmZSZ5QU
 Loaw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786585582; x=1787190382; darn=lists.freedesktop.org;
 h=content-type:cc:to:subject:message-id:date:from:mime-version:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=8zsVKbd7rZ4kyHv3ec1MwsHX32ckqjo3g74aZna+Cbo=;
 b=BvH+6PSFi1oKCpfaztIcLAhielaCp3GIo1i1LhWOaxXREEQzvCmqqUw1HhDbsDALw0
 FcUHSDEd4mmwfV8X0TMcjOrdovHN8YQRAu2ROgi9xm37ehwkKx0Nvkz3DwAlTocdxsMu
 xczwdoJBvoNGUwZbx4/U1J+uFM2BeEGbzj1965VTQQibXNyUJvb763p/UkP4xc1+XGVz
 IvdFf4HMfzlsM03jSQpf1//K7TbeC5zUaX4rXu1OXpN/0GJ2muDEA2BQeBhXj2OQxVNq
 Ngir+fIwjeY+gFjuN5IDvdgM3fBeIHj+y2wHESG7BEIaVv0uEbnLG9j9NpmXyZ01YgDh
 Qnzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786585582; x=1787190382;
 h=content-type:cc:to:subject:message-id:date:from:mime-version
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=8zsVKbd7rZ4kyHv3ec1MwsHX32ckqjo3g74aZna+Cbo=;
 b=fJHOxXdrBhD+ZW4+z2sbASRUVbci+r0sWKM68qM/XzEPiKtIOcTYL4gHRKiiwZXhTn
 dUlsUX3LoalUByXM+nF+mlMwUWTRrTgEjbRs9g3pCB3cVb5mM7+ruuWWcqW99Ucu9fDW
 IJ/Mwpy/E4flfdFCPKoW4NjE0vXChiONUu43xpwHn/HqBpXNOy1cdYeSss74HWRnGuzK
 3iKHHfhl7hXidcaxaazkq5KdLLc5aEm2aHRnhQ+8xpqD/3Z9uhc1asLu+tCCCDP8Cqdm
 Dkf0IrgQe13eRt3JmNysiCRNXLe3veH9seO+apHFqXTbQH6mRrO3bdFYXEHDmCZbilAr
 XtnQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RpAD5yvCgUUKD50ds4o4ywhotRTS9llQefUNs+ExlhhzdwaqyCJ2e4Cw5YTuV1HTF1vHl0PLiq4tY8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzu5QUy9qrsU93Ub3AS/OX6RB/WiZbbXMJg6mVw0WOFkXqxzd15
 hcHCu/qx61aTJj/u3kTD9bKZGTAqmc+hJbCY5IzsIWP8LrYSAuBc7hYrKX5RMkVkAS2Y8kWDwL/
 5Eeopl6tt4bxRLwwBN9NTPelOXO0yuwc=
X-Gm-Gg: AR+sD11ldVSWg9x36zNjM2ueatoCDrLiee3NmyvdVdzYTytusS1VfOXmzsTDJNs08JI
 mDN1TqQCHvBlUh+ajBacoDHyrP2xEIpl5IJddz4Cvd7qEBcGy8SH8XaOxQL0aYI36/q/7F+ViEa
 wrGt9LURylILzi6XOJto5TEQaE+sk5ExJwVBrd0GeO3ozZK6jehZ+MqxVR7S1H4wnQKXkWrdtxl
 8Oir0jBuwDoAHNSzMPVvvq+qEHk9Hq9c9MluUN3+s7hYKH4rjFsLScqDtJByio4uX0p1rKW+Lfy
 8ZwT8wotL3YmYT2ub4AR9lyK7ZP1JKQJueeOnVw9ACtQ
X-Received: by 2002:a05:600c:314f:b0:499:59fd:dbfc with SMTP id
 5b1f17b1804b1-499821fafebmr15881525e9.1.1786585581976; Wed, 12 Aug 2026
 18:46:21 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?5ZC05rab?= <rpwtsama@gmail.com>
Date: Thu, 13 Aug 2026 09:46:09 +0800
X-Gm-Features: AUfX_mwjykauUGRd7p0JKAKBT_PY18R1a8DeaIypAi_vxLHJDca3Oj2G0IKRXMo
Message-ID: <CAF38RzLOUW1ZB1f+Q2f9mhnYs+t4R2+UQA1PCihz_FKEu-nSew@mail.gmail.com>
Subject: [REGRESSION] Panther Lake 8086:b082 internal eDP black after xe
 takeover since 7.1.6, still present in 7.1.8
To: stable@vger.kernel.org
Cc: regressions@lists.linux.dev, intel-xe@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 13 Aug 2026 13:37:25 +0000
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

Hello,

I am reporting an Intel xe display regression on a Panther Lake
laptop. The problem started with Linux 7.1.6 and is still reproducible
with Linux 7.1.8.

System:

Laptop: Lenovo ThinkPad T14p Gen 4 (2026)
CPU: Intel Core Ultra 9 388H, Panther Lake
GPU: Intel integrated graphics, PCI ID 8086
Driver: xe
Display: internal eDP panel
Distribution: Arch Linux x86_64
Desktop: KDE Plasma on Wayland
Regression status:

Known good: 7.1.5-arch1-2
First known bad: 7.1.6-arch1-1
Latest tested bad: 7.1.8
The issue is fully reproducible with both 7.1.6 and 7.1.8. Downgrading
only the kernel to 7.1.5-arch1-2 makes the problem disappear.

Steps to reproduce:

Disconnect all external displays.
Cold boot the laptop.
The Lenovo firmware logo and systemd-boot menu are displayed normally.
Select the Arch Linux boot entry.
When the xe driver takes over from the firmware framebuffer, the
internal panel becomes completely black.
Close and reopen the laptop lid.
The internal panel starts working normally.
The issue occurs on every boot. Connecting an external display changes
the behavior and may allow the internal panel to initialize.

The failure coincides with the following kernel messages:

fbcon: xedrmfb (fb0) is primary device
xe 0000:00:02.0: [drm] *ERROR* CPU pipe A FIFO underrun
xe 0000:00:02.0: [drm] fb0: xedrmfb frame buffer device
Tests performed:

Adding xe.enable_psr=0 does not help.
Disabling my custom xe SR-IOV service and booting without creating any
VF does not help.
Linux 7.1.5-arch1-2 works with the same firmware and userspace.
Linux 7.1.6 and Linux 7.1.8 consistently reproduce the problem.
I have not bisected the exact offending commit.
Full debug dmesg and system information are available in the linked
drm/xe issue:

https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/8902

#regzbot introduced: v7.1.5..v7.1.6

Regards,
rpwtsama
