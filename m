Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2E9FC56205
	for <intel-gfx@archiver.kernel.org>; Thu,  6 Aug 2026 14:57:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0281B10F21A;
	Thu,  6 Aug 2026 14:57:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nesvES8B";
	dkim-atps=neutral
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com
 [209.85.128.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 036DA10E31C
 for <intel-gfx@lists.freedesktop.org>; Thu,  6 Aug 2026 11:44:10 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-81ecf499af9so30351367b3.1
 for <intel-gfx@lists.freedesktop.org>; Thu, 06 Aug 2026 04:44:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786016650; cv=none;
 d=google.com; s=arc-20260327;
 b=eu2xCVGuPhgZVBmDNynS26a6dBCA31ICn5fTMGG9LvEBx2x6ILYrEVq8WyYqmQZDM1
 Ab3JGezk7wn9geqL9oPe39VSh0JFhi2L++cME1MC5GUnNh8GWr5WYdKCdr+3AZkbdBb2
 JiEMfnq+EqkyKwi+RkCZy7kt1b7JdqfGuVDIpe97qZN/j0KsS5Ry7CbXFzFTZ6tIbpO6
 /ugfB3NMdHXhxAzCehplu7INHL6f7KhqySdt8JI5rT1LtExEKbjgqTQhYlfERCwkmXqh
 8yH6YUf620jWLelVf/hq7hseVxc0H5M9G/GAW4XQ5w3c4kCCwlmH4I4IszOuQGeAvjrk
 q3Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:reply-to:mime-version
 :dkim-signature;
 bh=AqWZiwXzmw1twDBzjKpSbMG3G4Saz6UhxiOIYxOse7I=;
 fh=OWAw8onC+EhrRgylSl4+MWzE+Y4KXLmJdha07rEUP8U=;
 b=BnM0sWegTyjGK983BFjGw5yXyiP54NItQAtQK4g5Y7Q3Og0pp5s2F57fvN0kwXUThe
 1XgfQajMDUmAgpHJNny1HSTI9R972dzpLc47iRJayM/BT8ROYGBhieNJa+F0+hG6AxFr
 KX/BpyGh+v1VSHvvgQRNq1W01XCi2YHsEXZtOpqopSCguMM07UigB5cdiH6nTI9Fa3H1
 tXvv6h4qvkUVAiCS9pnaqHaEkYkzj7BawabgmTI6blom5xuch7FMOelvXITU0ug1Cq1k
 k92bTYv+gFdo4EmokFhiVlKUMmRKWsKIuk++PS3jzulTd04vVYN0fdIS9f0vueWM1pz/
 AxEA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786016650; x=1786621450; darn=lists.freedesktop.org;
 h=content-type:cc:to:subject:message-id:date:from:reply-to
 :mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=AqWZiwXzmw1twDBzjKpSbMG3G4Saz6UhxiOIYxOse7I=;
 b=nesvES8BEE0pWL5suA+Rc8LiilZPXgw8GmBb4SknSDyRrw2aT0E24TsSj2YMEIfg75
 MyD9j3lOeirFX0SYn9xvI+CObcZXoY+XK9nsZzj1W8MgMy49Mbftnqe3dAmBt+hriwi0
 y+obGQt4WXSpTxqNrjsuTCLfdt4CteGFsATn5XpM/qWhDkRT+NNV24MJmZMZnrVrql4e
 PzRoMBUSNQZpzo65Ic94z8YvqrEciOfO7q5ceUIti7J2lyra0gPWPyXWsncBIKgRh0sn
 ZB0fyoO7HBbjDwlO7VUExZYMmdjKL/uHCG7sJlUF2PZd+iHrR8crCbEXy5PQG6rlqwfx
 URBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786016650; x=1786621450;
 h=content-type:cc:to:subject:message-id:date:from:reply-to
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=AqWZiwXzmw1twDBzjKpSbMG3G4Saz6UhxiOIYxOse7I=;
 b=RJ07U3mFpqh2zG2fhIRYILj/d1aXEXVQqLRfC32QUscXzx4JrDih9HvPQALfbu65DM
 ZguoDSsUW5gQ6dkZUbvckjgz31XW3RVWCVghMD+91wOfKQl2KGhac/XAG9o3OfER442u
 MNSOYVANvU9+2KjEDi1nMaJuoeZHjq99yRLPmJdKkv0WeBDibV/J+CMJUWAJ2+CaaV28
 lU6t+1tnwTvEMeKorkpWPTiY+9nTIjPxKfMeObAnaaS537FtW9WZw5OX2LNrjkxFEw/c
 bFvkBle1ij+pRNts5chAjkKdWR9L3aVZocmFerEAChz4euoAIdwpIWlV3LgHgHZOS0/9
 AA6w==
X-Gm-Message-State: AOJu0YxYGLmxSROdsTklOs1Ny1yt+ExmTQsxazJTzTY/QROWaP5NEKX6
 hxhgPcYmbBsbelv4yugv7RfJAifvA+VBnDgyDqE92qS5dTHoNKxk+PsL8Iu+7XKrMmUhMJ2rxT1
 NbpOOUyCd8IfPFxE1cABQXj8QAEKgvP5aJ03hy2E=
X-Gm-Gg: AR+sD13Toccn/4titV2bOfS22IesVmXiRq399zaSeWclAsDAEgKz7irlJmxAUNP+eXj
 fdsJjf9X7xZhcdhaKGkOR6kXX6f2U3OO0cR7A62onSclHFe89iZZE4a3xIkFV5DyEqBbE+S1BAO
 odxlQdNKpa8xgEXN/ECyvCA9imXuYZH2AcpULMG3IAKqUa3oRnjkIxm/4bHcAwCXOY5+ec+z7zs
 c/oofnzFPtG2Jh0bxQQ34VhGoWmI41KE7qAOX6gSs5I9RkD+KTo148cpoeECWUfILJ9Tpvs1ppw
 xrz08Fqf/lqub6kV3QwsvnbiL+gZ5lNxPItkuznhjopzBI7seRuIeXz9L3n7cy2dfQyYIiFMCr8
 yIXXz0PisRQ==
X-Received: by 2002:a05:690c:31e:b0:7ff:87e1:34d1 with SMTP id
 00721157ae682-8201c48d8fdmr89579497b3.11.1786016649479; Thu, 06 Aug 2026
 04:44:09 -0700 (PDT)
MIME-Version: 1.0
From: "nomorsukses@gmail.com" <nomorsukses@gmail.com>
Date: Thu, 6 Aug 2026 18:43:32 +0700
X-Gm-Features: AUfX_mwsZEXRInbzcO-S_ZSjJ7mprbqxM5-xwbj1XvUBRduqMVwZQthj_jug0lA
Message-ID: <CABHf4aS9Lh6Q-7MykVgvEpsWW08GTo+Md_9U9nn5a=V2X6kTEw@mail.gmail.com>
Subject: [REGRESSION] Dell Latitude 7390 Intel UHD 620 screen becomes
 extremely dim after kernel 7.x upgrade
To: regressions@lists.linux.dev
Cc: intel-gfx@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="000000000000f48ac506585f676a"
X-Mailman-Approved-At: Thu, 06 Aug 2026 14:57:31 +0000
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
Reply-To: nomorsukses@gmail.com
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

--000000000000f48ac506585f676a
Content-Type: text/plain; charset="UTF-8"

Hello Linux kernel and Intel graphics developers,

I would like to report a kernel regression affecting the internal display
brightness on my Dell Latitude 7390 laptop.

After upgrading from Linux kernel 6.14.x to Linux kernel 7.x, the internal
laptop display becomes extremely dim immediately after boot.

The system continues to run normally, but the brightness level becomes
almost unusable.

Booting back into Linux kernel 6.14.x restores normal display brightness.

Hardware information:

Laptop:
Dell Latitude 7390

CPU:
Intel Core i7-8650U

GPU:
Intel UHD Graphics 620
PCI ID: 8086:5917

Graphics driver:
i915

Display:
Chi Mei Innolux 1920x1080 eDP panel

BIOS:
Dell version 1.44.0

Operating systems tested:

   -

   Ubuntu 24.04.4 LTS
   -

   Linux Mint 22.2 (based on Ubuntu 24.04)

The same issue happens on both distributions.

Working kernel:
6.14.0-29-generic

Problematic kernel:
7.x

Steps to reproduce:

   1.

   Install Ubuntu 24.04 or Linux Mint 22.2.
   2.

   Update the system to kernel 7.x.
   3.

   Reboot.
   4.

   The internal display becomes extremely dim.
   5.

   Boot kernel 6.14.x.
   6.

   Display brightness works normally again.

Additional information:

   -

   Secure Boot is disabled.
   -

   The issue is reproducible.
   -

   The system remains usable except for the display brightness problem.
   -

   The regression appears between kernel 6.14 and kernel 7.x.
   -

   The graphics driver in use is Intel i915.

This may be related to Intel i915 backlight handling or eDP panel
initialization.

I can provide dmesg logs and additional debugging information if required.

Thank you for your help.

Best regards,
PoL

--000000000000f48ac506585f676a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:trebuche=
t ms,sans-serif"><p>Hello Linux kernel and Intel graphics developers,</p><p=
>I would like to report a kernel regression affecting the internal display =
brightness on my Dell Latitude 7390 laptop.</p><p>After upgrading from Linu=
x kernel 6.14.x to Linux kernel 7.x, the internal laptop display becomes ex=
tremely dim immediately after boot.</p><p>The system continues to run norma=
lly, but the brightness level becomes almost unusable.</p><p>Booting back i=
nto Linux kernel 6.14.x restores normal display brightness.</p><p>Hardware =
information:</p><p>Laptop:<br>Dell Latitude 7390</p><p>CPU:<br>Intel Core i=
7-8650U</p><p>GPU:<br>Intel UHD Graphics 620<br>PCI ID: 8086:5917</p><p>Gra=
phics driver:<br>i915</p><p>Display:<br>Chi Mei Innolux 1920x1080 eDP panel=
</p><p>BIOS:<br>Dell version 1.44.0</p><p>Operating systems tested:</p><ul>=
<li><p>Ubuntu 24.04.4 LTS</p></li><li><p>Linux Mint 22.2 (based on Ubuntu 2=
4.04)</p></li></ul><p>The same issue happens on both distributions.</p><p>W=
orking kernel:<br>6.14.0-29-generic</p><p>Problematic kernel:<br>7.x</p><p>=
Steps to reproduce:</p><ol><li><p>Install Ubuntu 24.04 or Linux Mint 22.2.<=
/p></li><li><p>Update the system to kernel 7.x.</p></li><li><p>Reboot.</p><=
/li><li><p>The internal display becomes extremely dim.</p></li><li><p>Boot =
kernel 6.14.x.</p></li><li><p>Display brightness works normally again.</p><=
/li></ol><p>Additional information:</p><ul><li><p>Secure Boot is disabled.<=
/p></li><li><p>The issue is reproducible.</p></li><li><p>The system remains=
 usable except for the display brightness problem.</p></li><li><p>The regre=
ssion appears between kernel 6.14 and kernel 7.x.</p></li><li><p>The graphi=
cs driver in use is Intel i915.</p></li></ul><p>This may be related to Inte=
l i915 backlight handling or eDP panel initialization.</p><p>I can provide =
dmesg logs and additional debugging information if required.</p><p>Thank yo=
u for your help.</p><p>Best regards,<br>PoL</p></div></div>

--000000000000f48ac506585f676a--
