Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39CCBC5B572
	for <intel-gfx@archiver.kernel.org>; Wed, 12 Aug 2026 17:41:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EB6210F0CF;
	Wed, 12 Aug 2026 17:41:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Fokx7XBH";
	dkim-atps=neutral
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E534210F030
 for <intel-gfx@lists.freedesktop.org>; Wed, 12 Aug 2026 14:35:41 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-47f703a9e5dso499737f8f.0
 for <intel-gfx@lists.freedesktop.org>; Wed, 12 Aug 2026 07:35:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786545340; cv=none;
 d=google.com; s=arc-20260327;
 b=gTdWrzTBL2Dboer9GifFbQ0GgZLTEOjEsdRQCGnoeygzJyYfZwPPbu+xnMzLI0x0tF
 o/dOyVdkgd6BoIw4RAyTrqqeV9SHOAO0k8LHdS6Eg/wJzdOT5fQAtUDyM/hszV6TL0vO
 HN11brenRoMVS56IA2fT477UzxJJNO1XRMfo2j6I/bVLxUKndK1QNuGGaXDGcB5Fb3du
 h1/pnt7aiSyx0wsfjfSPhQASxStSAEPFhh53F6oB4O8nuNTIdrMI5iwRZXlicS+cZ2h+
 ijRcEKY2eBrzCBEaAarSUzxzBXw/RhCrDvwWQpju50sHJgN1Wrt0o2HGptOwYHCd8oik
 64ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
 bh=4Cgpz0cWApImlFACTHN8IU5QRwWcDMSez31Kh68z/1U=;
 fh=pYxTZ8j8nXt7nnB8V1gKg87Px6+aFfC4WaZWLQsHSzI=;
 b=fWnPWNQKUzEacfYKEESnvMV2Er6f+u2SOePRpOk4wnVOlIOu5XPDUKTIbC+lctmLNV
 Q0jxZEC8lwOlpOOxKKmiTPuRM+JgxGoANshXCma5nN4gT8Joh81Zvsm8I4wrgHa72XB0
 kn4Q58LN+xJEtV5SbpsscfwQUqv5Z7VZMNDL+A3ew4VrSLd8XYNcgkGI3w1H1ZOcG5aN
 jbLR7jytANRIXc64kbG+8XCx2WCRzUWRo3SbvoIqJnV9VMf8dGNTGZ11w0zp0QykrGgm
 RsAVBJFawBvtg85M/MgvVN9SlffnHhybyAMy1D1HlpCQtqAL9EM6I1C4uxFehtuuFcuh
 Z2JA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786545340; x=1787150140; darn=lists.freedesktop.org;
 h=content-type:cc:to:subject:message-id:date:from:mime-version:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=4Cgpz0cWApImlFACTHN8IU5QRwWcDMSez31Kh68z/1U=;
 b=Fokx7XBH6sHhAkHCU3RNVgQMuhWv2fw2HVF+UDumfi8ZdOCMC0EYiRkKfTWihiTXSD
 yI/04u1hqk//w1gXYQPbOxSKY6pgLlduEznWPu/xRAVTHH+kkx/C+uarQHQyZeGyFv7R
 I9H1K0S1DVZWYnHGSvBzn5fkPfHJXN/uGSXHrj8ybz3SCdWbiz5Ur2cCL+i94a0i2BZE
 7zC62ZETBh4EUsQEbxWVyZBZ/oJvZihF5eyLt03ONJuahjembxcqUPpVTVeTjQWJtSMy
 tDwxL6VOOUgvxKNqXzNozqlkQ7LdT8ecZExiVwyKuyhrxOFywHp/jAPPOsLQsq7aWaJb
 ZprQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786545340; x=1787150140;
 h=content-type:cc:to:subject:message-id:date:from:mime-version
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=4Cgpz0cWApImlFACTHN8IU5QRwWcDMSez31Kh68z/1U=;
 b=GHMDU+1uAj2WnEbY+fbZEiAy5LQgxhi1MnEGkTD2l8FdnF0mgpbe14+ia3d4BX/zel
 XoG+prEzRPobLSKTgmWmhyclpCvQ2gMJUPQhR18qmwTjhMAeDfMQtuZIge+T43gJFl2u
 Y5z//ae5IhImXepNp80EQKLJAZJ5j2/gZJjL5dEUU47ENlqYoqmtIo+QSkidlEMw999u
 hf1XRdvK+uBgPx1yAJc9JeF37nI7DXgREO95byg6xJkhvPcakTrR0ffnk9P8R3zOoG89
 AF/qZu9X76D2/kooCAIiKXso8O0q7g/JDImljda6BE2GrfrmyDpCPcv9noquBIvBUlJx
 Oawg==
X-Forwarded-Encrypted: i=1;
 AHgh+RocPeoJ3KEeKo4xLZ94vQOLoJBqFwWx4xzYwdRrGu/SkH3OVoHJXFO1nyWfGcmByZFo+T3Q+UacPco=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yybpp+7tV8Lon5w5AtAA5o2bMu+Eq0uF0vQJpsi87ORwQWcJxar
 hDQwAPOrItbs9bdHVT4oSzuUXAiPPAmOrv+I7m+3XRxf8C+z3Cr/DFLPmH/f/7MkmulE7P3DxAW
 qFS4gCWKZ5lb2ph/d7g/SzcJ9uIDSEk3h8e60CEZ7Hw==
X-Gm-Gg: AR+sD12ICwH166DK3Tp9L+hjVR674sqJcFJgsOvCpyNPIXjWkWmz3hEyVbn2kLC8Vvf
 hyqMRu+CjklnsP8458dGQRf1ajE8NmGOXtpTNb7levpG3cwdaYgESuBnd9X2FSM2+yXCZ0SAIyN
 3M8kC12YPkGYd1FY1hZqA3yCw1Lv6NVwGnhorD4q1do9L0pIt6xiE1KVR0mCf96dS3pQPFSHPWK
 7dXKp+fCdJstGPXXJKUulUgb+G4U8De9LwfbJLL6WfAzc/RR61R2xovX3+E11J06r4jVRe1S5F3
 ZevxLntRnZiGu7BsCgE/NE7ULKZyO55vseq8nFq/T1eW
X-Received: by 2002:a05:6000:4281:b0:47f:96e6:70a with SMTP id
 ffacd0b85a97d-481528bf608mr7525297f8f.0.1786545340144; Wed, 12 Aug 2026
 07:35:40 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?5ZC05rab?= <rpwtsama@gmail.com>
Date: Wed, 12 Aug 2026 22:35:26 +0800
X-Gm-Features: AUfX_mxbmGloEkTFNTD0VElyswP7v1uUnHrZug9G_iEZ1UTNZ_MSc8ZGrW36qSM
Message-ID: <CAF38RzLJihCvga6UgkPPR+A1jY33bf1T083CfDy+pfBuzYcdjg@mail.gmail.com>
Subject: [REGRESSION] Panther Lake 8086:b082 internal eDP black after xe
 takeover since 7.1.6, still present in 7.1.8
To: stable@vger.kernel.org
Cc: regressions@lists.linux.dev, intel-xe@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="0000000000005fe1230658da807b"
X-Mailman-Approved-At: Wed, 12 Aug 2026 17:41:47 +0000
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

--0000000000005fe1230658da807b
Content-Type: text/plain; charset="UTF-8"

Hello,

I am reporting an Intel xe display regression on a Panther Lake laptop. The
problem started with Linux 7.1.6 and is still reproducible with Linux 7.1.8.

System:

   - Laptop: Lenovo ThinkPad T14p Gen 4 (2026)
   - CPU: Intel Core Ultra 9 388H, Panther Lake
   - GPU: Intel integrated graphics, PCI ID 8086
   - Driver: xe
   - Display: internal eDP panel
   - Distribution: Arch Linux x86_64
   - Desktop: KDE Plasma on Wayland

Regression status:

   - Known good: 7.1.5-arch1-2
   - First known bad: 7.1.6-arch1-1
   - Latest tested bad: 7.1.8

The issue is fully reproducible with both 7.1.6 and 7.1.8. Downgrading only
the kernel to 7.1.5-arch1-2 makes the problem disappear.

Steps to reproduce:

   1. Disconnect all external displays.
   2. Cold boot the laptop.
   3. The Lenovo firmware logo and systemd-boot menu are displayed normally.
   4. Select the Arch Linux boot entry.
   5. When the xe driver takes over from the firmware framebuffer, the
   internal panel becomes completely black.
   6. Close and reopen the laptop lid.
   7. The internal panel starts working normally.

The issue occurs on every boot. Connecting an external display changes the
behavior and may allow the internal panel to initialize.

The failure coincides with the following kernel messages:

fbcon: xedrmfb (fb0) is primary device
xe 0000:00:02.0: [drm] *ERROR* CPU pipe A FIFO underrun
xe 0000:00:02.0: [drm] fb0: xedrmfb frame buffer device

Tests performed:

   - Adding xe.enable_psr=0 does not help.
   - Disabling my custom xe SR-IOV service and booting without creating any
   VF does not help.
   - Linux 7.1.5-arch1-2 works with the same firmware and userspace.
   - Linux 7.1.6 and Linux 7.1.8 consistently reproduce the problem.
   - I have not bisected the exact offending commit.

Full debug dmesg and system information are available in the linked drm/xe
issue:

https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/8902

#regzbot introduced: v7.1.5..v7.1.6

Regards,
rpwtsama

--0000000000005fe1230658da807b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p class=3D"gmail-isSelectedEnd">Hello,</p><p class=3D"gma=
il-isSelectedEnd">I am reporting an Intel xe display regression on a Panthe=
r Lake laptop. The problem started with Linux 7.1.6 and is still reproducib=
le with Linux 7.1.8.</p><p class=3D"gmail-isSelectedEnd">System:</p><ul><li=
>Laptop: Lenovo ThinkPad T14p Gen 4 (2026)</li><li>CPU: Intel Core Ultra 9 =
388H, Panther Lake</li><li>GPU: Intel integrated graphics, PCI ID 8086</li>=
<li>Driver: xe</li><li>Display: internal eDP panel</li><li>Distribution: Ar=
ch Linux x86_64</li><li>Desktop: KDE Plasma on Wayland</li></ul><p class=3D=
"gmail-isSelectedEnd">Regression status:</p><ul><li>Known good: 7.1.5-arch1=
-2</li><li>First known bad: 7.1.6-arch1-1</li><li>Latest tested bad: 7.1.8<=
/li></ul><p class=3D"gmail-isSelectedEnd">The issue is fully reproducible w=
ith both 7.1.6 and 7.1.8. Downgrading only the kernel to 7.1.5-arch1-2 make=
s the problem disappear.</p><p class=3D"gmail-isSelectedEnd">Steps to repro=
duce:</p><ol start=3D"1"><li>Disconnect all external displays.</li><li>Cold=
 boot the laptop.</li><li>The Lenovo firmware logo and systemd-boot menu ar=
e displayed normally.</li><li>Select the Arch Linux boot entry.</li><li>Whe=
n the xe driver takes over from the firmware framebuffer, the internal pane=
l becomes completely black.</li><li>Close and reopen the laptop lid.</li><l=
i>The internal panel starts working normally.</li></ol><p class=3D"gmail-is=
SelectedEnd">The issue occurs on every boot. Connecting an external display=
 changes the behavior and may allow the internal panel to initialize.</p><p=
 class=3D"gmail-isSelectedEnd">The failure coincides with the following ker=
nel messages:</p><pre dir=3D"ltr"><code dir=3D"ltr">fbcon: xedrmfb (fb0) is=
 primary device
xe 0000:00:02.0: <span class=3D"gmail-text-token-text-primary gmail-cursor-=
text gmail-rounded-sm">[drm]</span> *ERROR* CPU pipe A FIFO underrun
xe 0000:00:02.0: <span class=3D"gmail-text-token-text-primary gmail-cursor-=
text gmail-rounded-sm">[drm]</span> fb0: xedrmfb frame buffer device</code>=
</pre><p class=3D"gmail-isSelectedEnd">Tests performed:</p><ul><li>Adding <=
code dir=3D"ltr">xe.enable_psr=3D0</code> does not help.</li><li>Disabling =
my custom xe SR-IOV service and booting without creating any VF does not he=
lp.</li><li>Linux 7.1.5-arch1-2 works with the same firmware and userspace.=
</li><li>Linux 7.1.6 and Linux 7.1.8 consistently reproduce the problem.</l=
i><li>I have not bisected the exact offending commit.</li></ul><p class=3D"=
gmail-isSelectedEnd">Full debug dmesg and system information are available =
in the linked drm/xe issue:</p><p class=3D"gmail-isSelectedEnd"><a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/8902">https://git=
lab.freedesktop.org/drm/xe/kernel/-/work_items/8902</a></p><p class=3D"gmai=
l-isSelectedEnd">#regzbot introduced: v7.1.5..v7.1.6</p><p>Regards,<br><spa=
n class=3D"gmail-text-token-text-primary gmail-cursor-text gmail-rounded-sm=
">rpwtsama</span></p></div>

--0000000000005fe1230658da807b--
