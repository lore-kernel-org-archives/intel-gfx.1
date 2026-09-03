Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1306C61DD3
	for <intel-gfx@archiver.kernel.org>; Thu,  3 Sep 2026 16:00:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 365A410F676;
	Thu,  3 Sep 2026 16:00:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gnp6tsmu";
	dkim-atps=neutral
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com
 [74.125.224.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29AF110F676
 for <intel-gfx@lists.freedesktop.org>; Thu,  3 Sep 2026 15:12:56 +0000 (UTC)
Received: by mail-yx1-f42.google.com with SMTP id
 956f58d0204a3-66c744a00edso2338522d50.2
 for <intel-gfx@lists.freedesktop.org>; Thu, 03 Sep 2026 08:12:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788448375; cv=none;
 d=google.com; s=arc-20260327;
 b=FUOsHmj4iV3T5VxySPkofqVMqgnKbMj1/b4Q0Q0vej89RXyIUgQ2XxpDvAVsh9KJwz
 0+0CPVKv+MsxaW2QdfDkoYtpNMYa6dVklU2CvTihzN/8v+8oIved0wEfgO8BtpQVghHR
 vC4D4brzmj6xLV8rQS+ujCcJ/lz4rKYsGQQp+yq0etSmwgUXum15TILKscImQsKhVtOR
 gLLmwo/qB8xCKsOpQwGt20n/21RLmsuxu7dVJ7WvMa2SeCeoCCtBSiGS8nEyyKTKc5iJ
 SPG49cdTPDSvw1QuCdkJka0tn6mRNN26tZ9jc58vizGgOZ7Vuj/Qlg3ZMVCHPTrCo6zF
 Tbpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=to:subject:message-id:date:from:mime-version:dkim-signature;
 bh=oQJ3mw2ynpL+ijaY4GejPwOsbNF4RR0zxRbSYbMgjjg=;
 fh=0mq9d1JUrcYsoTTkGHiTtQVhfUtVmM5T3dWmSoFUk5Y=;
 b=MtOtkF11j4s1D1IvOWDkluBF4bQkO7zKrV38aTPFrryOD8Fe9/tQi3HmPCoddPD8WZ
 PqOUQLa2uDG+HLXtnmX15D380pZd+e5nxo575RRJ3G7/CYWcL2EWI5f9grpSEsWjJjGc
 EeOC9MBArMjN0I90BfeAwjB1V9/kx4YzJCePwtPL87sspaRBpLXIe/bGnVKKLPpGpQfC
 t14W/OG+1VcOo8zVNpCMEGTPU0pYJkol2Jk/7xd2G/h4mTrYtCfjxD9cITxTfTmNtRsP
 kZGSWbPO0krdK0bHk4ee6sGdBmcIbnclUGtIoSQNgN95vLQAkLF0lPXd4Gm4pfZ+q28c
 T9Uw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788448375; x=1789053175; darn=lists.freedesktop.org;
 h=content-type:to:subject:message-id:date:from:mime-version:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=oQJ3mw2ynpL+ijaY4GejPwOsbNF4RR0zxRbSYbMgjjg=;
 b=gnp6tsmuFvo6tIVWI1nJPMWPeXQtXwHdwgyD0vAtZoFB9sn/r+AV3BgYzIY5ZbgNw9
 OXUq2/FvdeKOPg1q4NnFghjIK/Yqp86sZOxAkOMdmiIDevMMHFfi3gQ9j5i04VxmjLel
 M02zxQ19nW/U3kGFkvcyPixHJesNLAMp4y8XUDd3hlDVrfy+SqKHPGrktCyBpS5QTtYG
 lCaH7i9+tMzltbmmLcPlt3GpSCkNSLfs3EwU9unTb+MShCxpI10BzmSv0lZkwBeTB5sW
 XPV9iJ5RRbkl87J+n/a4uGcIPk1ZVqTcgNuVmtpHibcKv2AxJdJrUTelx/jRqcCdNs9z
 f29w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788448375; x=1789053175;
 h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=oQJ3mw2ynpL+ijaY4GejPwOsbNF4RR0zxRbSYbMgjjg=;
 b=Da10ZUTRKMTOCdjXmEtZuNBwtYdX5xVjkgg/AkcKb7wCaE4NYtDiFd96bTe2Y+MS2B
 TJEYiUfTki2jDhkqH9WiEdSiqa5v5HVCn5Nd4xTrnlPCNVOd53s898ncD8O3B/qad+sl
 dyqRxga/JKEau80G5d0dp5mQw5g8n9AT0WEpLjtC4w3bS5Y1VPL2TTxV6yiYsDBnZ6yz
 H8vNdWkC9Z6GEX3GTv7Hbba7qJ5BkHyBB3sj7nvhm4Rr4pEwRj3uKT0LgK9k2D75yLoP
 gTVsjHHyHKicPlnvKXn6+i2quGpzlWZcf8VnY4g9/a0fGVFbL3nH0Y/VBn74D84URjHr
 3ZtA==
X-Gm-Message-State: AFuF++nLn4Jd419H+PaR0UVT7y1m9HSFFqL/E0JoSFKmhX6r1sHaEszi
 YbBP+ltLYdh8fWnmKU4LYgOiPXsfP4Zv1faKGxTUAZIvLYw2Wcsjp7FbJC8XDoeWcbOPePZoREF
 AwdAXKlDmwb294kdwZPAKrZxz3atlq5jXeD8L
X-Gm-Gg: AYBFou0I1vFndJjSglOvNgLvQXBCkBuPUxHl1jtXdha8OsysQcZGjGjBrMlwBKqGO+2
 BBGb8tq+031QF/EYnx8sF2BhF1t/fz/Mt4ktniuIkhRUJjVH/2dP4tIFioKljYcVENSuRYJr2KE
 jIrRN+Yh473hFXd7zs73GzZ0x7q6gLKrwGhcM/FE2OcEdJDfkbW+gJmCYWTFyK8udxl+SW83RTW
 V3b3MjTaA8NUHsFGtDre/uiQyI3cv6hBQGQdpVkZ3wRyoqKZTT4GINknv9LhTyeKNUM8zLoMPTY
 Lwn1wMEzIwQeD3E3mHWK/PaoiS+FQyLEVJgkcWdu2+hPrjqy0uyEQ36dxtzLuoTqHjM2UXpeHls
 ciTk=
X-Received: by 2002:a53:cc0e:0:b0:66e:7307:465c with SMTP id
 956f58d0204a3-66fb3eba16bmr216979d50.4.1788448374841; Thu, 03 Sep 2026
 08:12:54 -0700 (PDT)
MIME-Version: 1.0
From: Varun Arora <arorasunan@gmail.com>
Date: Thu, 3 Sep 2026 20:42:42 +0530
X-Gm-Features: AcwNN1VYb6bSiyLR2sSz4sMSLV7uCr6pGvWPgCzUGFJolVIAlMxM0T0ddDJ2H0c
Message-ID: <CAMbcQ41KJqEWOPLETx8sjOoigUj67LukkDktD_CupSxmwJURMg@mail.gmail.com>
Subject: [i915] HP Victus 15-fa1xxx: eDP-1 link training failure after s2idle
 resume, PPS VDD wakeref warning
To: intel-gfx@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="00000000000014e601065a959606"
X-Mailman-Approved-At: Thu, 03 Sep 2026 16:00:12 +0000
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

--00000000000014e601065a959606
Content-Type: text/plain; charset="UTF-8"

Hi,

I'm seeing a reproducible i915 eDP suspend/resume failure on an HP Victus
15-fa1xxx with an Intel Core i5-12450H and NVIDIA RTX 2050.

HARDWARE
--------

Laptop:
HP Victus 15-fa1xxx

CPU:
12th Gen Intel(R) Core(TM) i5-12450H

iGPU:
Intel Alder Lake-P GT1 [UHD Graphics]
PCI ID: 8086:46a3
Driver: i915

dGPU:
NVIDIA GeForce RTX 2050
Driver: nvidia / nvidia-drm

Internal panel:
1920x1080 @ 144Hz
eDP-1
The internal panel is physically connected to the Intel iGPU.

BIOS:
F.23 (03/30/2026)


SOFTWARE
--------

OS:
EndeavourOS / Arch Linux

Desktop:
XFCE

Session:
Wayland

Suspend:
s2idle only

Kernels tested:
7.1.11-arch1-1
6.18.48-1-lts

NVIDIA driver:
610.57.04


PROBLEM
-------

After s2idle suspend/resume, the internal display frequently takes
20-30 seconds to return.

Sometimes it takes several minutes, and sometimes the display does not
recover and continues blinking/going black until I reboot.

The kernel repeatedly reports:

    [drm] *ERROR* [CONNECTOR:...:eDP-1][ENCODER:...:DDI A/PHY A][DPRX]
    Failed to enable link training

The failure can repeat approximately every 12 seconds while the display
is trying to recover.


BOOT-TIME ERRORS
----------------

There is also an eDP-related failure during BOOT, before the desktop:

    [drm] [ENCODER:...:DDI B/PHY B]
    failed to retrieve link info, disabling eDP

Immediately around this I also get:

    drm_WARN_ON(intel_dp->pps.vdd_wakeref)

with a warning in:

    intel_pps_vdd_on_unlocked()

The call path includes:

    intel_pps_vdd_on_unlocked()
    __intel_display_power_get_domain()
    intel_pps_vdd_on()
    intel_dp_detect()
    intel_display_driver_register()
    i915_driver_probe()

After some suspend/resume failures I have also seen:

    i915 raw-wakerefs=1 wakelocks=1 on cleanup

and:

    intel_runtime_pm_driver_release


TESTS ALREADY PERFORMED
-----------------------

1. i915.enable_psr=0

   No fix.

2. i915.enable_dc=0

   No fix for the underlying problem.
   The eDP link-training failure still occurs.

3. 144Hz -> 60Hz

   Did not solve the problem.

4. Tested both:

   7.1.11-arch1-1
   6.18.48-1-lts

   Both reproduce the problem.

5. NVIDIA runtime power management

   The NVIDIA GPU successfully entered runtime suspended state,
   but the internal Intel-connected display still failed to resume
   correctly.

6. Intel Xe driver

   I experimentally tested:

       i915.force_probe=!46a3 xe.force_probe=46a3

   This did not solve the problem.

   Instead it produced PSR AUX errors, severe display corruption,
   and another very long recovery loop.

   I therefore returned to i915.


SUSPEND
-------

The system only exposes s2idle:

    cat /sys/power/mem_sleep

returns:

    [s2idle]

Attempting to use deep suspend gives:

    Invalid argument


IMPORTANT
---------

The internal panel is physically connected to the Intel iGPU.

DRM devices show:

    card0 -> NVIDIA
    card1 -> i915

and the internal connector is:

    card1-eDP-1


QUESTION
--------

Could the combination of:

    failed to retrieve link info, disabling eDP
    drm_WARN_ON(intel_dp->pps.vdd_wakeref)
    intel_pps_vdd_on_unlocked()
    Failed to enable link training

indicate an i915 PPS / panel power sequencing / BIOS handoff problem?

Has this been seen on Alder Lake HP laptops, particularly HP Victus
systems?

Is there a known i915 patch, quirk, or debugging procedure for this
PPS/VDD wakeref + eDP link-training failure?

I would especially appreciate advice from anyone familiar with i915
PPS, eDP AUX/link training, and suspend/resume on Alder Lake.

I am trying to determine whether this is primarily an i915 issue,
an HP firmware issue, or an interaction with the NVIDIA hybrid graphics
configuration.

Thanks.

--00000000000014e601065a959606
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<br><br>I&#39;m seeing a reproducible i915 eDP suspend/=
resume failure on an HP Victus<br>15-fa1xxx with an Intel Core i5-12450H an=
d NVIDIA RTX 2050.<br><br>HARDWARE<br>--------<br><br>Laptop:<br>HP Victus =
15-fa1xxx<br><br>CPU:<br>12th Gen Intel(R) Core(TM) i5-12450H<br><br>iGPU:<=
br>Intel Alder Lake-P GT1 [UHD Graphics]<br>PCI ID: 8086:46a3<br>Driver: i9=
15<br><br>dGPU:<br>NVIDIA GeForce RTX 2050<br>Driver: nvidia / nvidia-drm<b=
r><br>Internal panel:<br>1920x1080 @ 144Hz<br>eDP-1<br>The internal panel i=
s physically connected to the Intel iGPU.<br><br>BIOS:<br>F.23 (03/30/2026)=
<br><br><br>SOFTWARE<br>--------<br><br>OS:<br>EndeavourOS / Arch Linux<br>=
<br>Desktop:<br>XFCE<br><br>Session:<br>Wayland<br><br>Suspend:<br>s2idle o=
nly<br><br>Kernels tested:<br>7.1.11-arch1-1<br>6.18.48-1-lts<br><br>NVIDIA=
 driver:<br>610.57.04<br><br><br>PROBLEM<br>-------<br><br>After s2idle sus=
pend/resume, the internal display frequently takes<br>20-30 seconds to retu=
rn.<br><br>Sometimes it takes several minutes, and sometimes the display do=
es not<br>recover and continues blinking/going black until I reboot.<br><br=
>The kernel repeatedly reports:<br><br>=C2=A0 =C2=A0 [drm] *ERROR* [CONNECT=
OR:...:eDP-1][ENCODER:...:DDI A/PHY A][DPRX]<br>=C2=A0 =C2=A0 Failed to ena=
ble link training<br><br>The failure can repeat approximately every 12 seco=
nds while the display<br>is trying to recover.<br><br><br>BOOT-TIME ERRORS<=
br>----------------<br><br>There is also an eDP-related failure during BOOT=
, before the desktop:<br><br>=C2=A0 =C2=A0 [drm] [ENCODER:...:DDI B/PHY B]<=
br>=C2=A0 =C2=A0 failed to retrieve link info, disabling eDP<br><br>Immedia=
tely around this I also get:<br><br>=C2=A0 =C2=A0 drm_WARN_ON(intel_dp-&gt;=
pps.vdd_wakeref)<br><br>with a warning in:<br><br>=C2=A0 =C2=A0 intel_pps_v=
dd_on_unlocked()<br><br>The call path includes:<br><br>=C2=A0 =C2=A0 intel_=
pps_vdd_on_unlocked()<br>=C2=A0 =C2=A0 __intel_display_power_get_domain()<b=
r>=C2=A0 =C2=A0 intel_pps_vdd_on()<br>=C2=A0 =C2=A0 intel_dp_detect()<br>=
=C2=A0 =C2=A0 intel_display_driver_register()<br>=C2=A0 =C2=A0 i915_driver_=
probe()<br><br>After some suspend/resume failures I have also seen:<br><br>=
=C2=A0 =C2=A0 i915 raw-wakerefs=3D1 wakelocks=3D1 on cleanup<br><br>and:<br=
><br>=C2=A0 =C2=A0 intel_runtime_pm_driver_release<br><br><br>TESTS ALREADY=
 PERFORMED<br>-----------------------<br><br>1. i915.enable_psr=3D0<br><br>=
=C2=A0 =C2=A0No fix.<br><br>2. i915.enable_dc=3D0<br><br>=C2=A0 =C2=A0No fi=
x for the underlying problem.<br>=C2=A0 =C2=A0The eDP link-training failure=
 still occurs.<br><br>3. 144Hz -&gt; 60Hz<br><br>=C2=A0 =C2=A0Did not solve=
 the problem.<br><br>4. Tested both:<br><br>=C2=A0 =C2=A07.1.11-arch1-1<br>=
=C2=A0 =C2=A06.18.48-1-lts<br><br>=C2=A0 =C2=A0Both reproduce the problem.<=
br><br>5. NVIDIA runtime power management<br><br>=C2=A0 =C2=A0The NVIDIA GP=
U successfully entered runtime suspended state,<br>=C2=A0 =C2=A0but the int=
ernal Intel-connected display still failed to resume<br>=C2=A0 =C2=A0correc=
tly.<br><br>6. Intel Xe driver<br><br>=C2=A0 =C2=A0I experimentally tested:=
<br><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0i915.force_probe=3D!46a3 xe.force_probe=
=3D46a3<br><br>=C2=A0 =C2=A0This did not solve the problem.<br><br>=C2=A0 =
=C2=A0Instead it produced PSR AUX errors, severe display corruption,<br>=C2=
=A0 =C2=A0and another very long recovery loop.<br><br>=C2=A0 =C2=A0I theref=
ore returned to i915.<br><br><br>SUSPEND<br>-------<br><br>The system only =
exposes s2idle:<br><br>=C2=A0 =C2=A0 cat /sys/power/mem_sleep<br><br>return=
s:<br><br>=C2=A0 =C2=A0 [s2idle]<br><br>Attempting to use deep suspend give=
s:<br><br>=C2=A0 =C2=A0 Invalid argument<br><br><br>IMPORTANT<br>---------<=
br><br>The internal panel is physically connected to the Intel iGPU.<br><br=
>DRM devices show:<br><br>=C2=A0 =C2=A0 card0 -&gt; NVIDIA<br>=C2=A0 =C2=A0=
 card1 -&gt; i915<br><br>and the internal connector is:<br><br>=C2=A0 =C2=
=A0 card1-eDP-1<br><br><br>QUESTION<br>--------<br><br>Could the combinatio=
n of:<br><br>=C2=A0 =C2=A0 failed to retrieve link info, disabling eDP<br>=
=C2=A0 =C2=A0 drm_WARN_ON(intel_dp-&gt;pps.vdd_wakeref)<br>=C2=A0 =C2=A0 in=
tel_pps_vdd_on_unlocked()<br>=C2=A0 =C2=A0 Failed to enable link training<b=
r><br>indicate an i915 PPS / panel power sequencing / BIOS handoff problem?=
<br><br>Has this been seen on Alder Lake HP laptops, particularly HP Victus=
<br>systems?<br><br>Is there a known i915 patch, quirk, or debugging proced=
ure for this<br>PPS/VDD wakeref + eDP link-training failure?<br><br>I would=
 especially appreciate advice from anyone familiar with i915<br>PPS, eDP AU=
X/link training, and suspend/resume on Alder Lake.<br><br>I am trying to de=
termine whether this is primarily an i915 issue,<br>an HP firmware issue, o=
r an interaction with the NVIDIA hybrid graphics<br>configuration.<br><br>T=
hanks.</div>

--00000000000014e601065a959606--
