Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DBD9C56207
	for <intel-gfx@archiver.kernel.org>; Thu,  6 Aug 2026 14:57:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA52D10F200;
	Thu,  6 Aug 2026 14:57:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=behler.me header.i=@behler.me header.b="iI4BYaEq";
	dkim-atps=neutral
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com
 [74.125.224.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC09910E1F1
 for <intel-gfx@lists.freedesktop.org>; Wed,  5 Aug 2026 07:36:35 +0000 (UTC)
Received: by mail-yx1-f42.google.com with SMTP id
 956f58d0204a3-664a09bc459so981575d50.1
 for <intel-gfx@lists.freedesktop.org>; Wed, 05 Aug 2026 00:36:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785915394; cv=none;
 d=google.com; s=arc-20260327;
 b=OBY8wKU63kEy5i1lBy4OOHdbDTREWFuKlzX5pf9cxfbnZB4o1mHNe3+LLTQvnEoyGq
 pimyitGYSggtZPi7ascS/WiRuFXgvw2PvrSS+iHzejhEAka//BXVTtT+Y9+3A9cm7wfy
 DtKQUILqLvQmHR2HeqtfH59czWWZw/SMjrmpBII7aR2E5ebrU0zzNpgTt4WhT/+imz72
 2PICi58Wv93br7LqzLPxCPltCtganH6H3hpk8PEoO5d+9XFhwDJ8FVJJN13mjeA1o8GN
 RZcoh5/mnhmWuycOAJkRquYRCngHCZpUHj/jo7MrrTX+MVW3GzKTZaxb6DgBXIhMrKt+
 /D1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=pwm+LlowPY9vPcB+T9axyMQcBGk7e5jWR5riOc7h0to=;
 fh=brRgK+Eh+IrKusizVCwZ3aKVK8FYU1VoVSGsXYo66Vg=;
 b=BPdiPgEaTIcvoeg9ttyMc1o+XQVBr/Lp+HbYD3B3QSr0/O6hkCFPieUg+Gb+wP87gM
 y207if1MNqsifkpATlJxjEvJapCheDNwrFWuh29SL0QNi3m5zuXGV/mF06kbrz4o5Md5
 RrLfgAYln1uRRdEY3zgthCV4LHr7LOCvbPUMPp9ExNWqRcVQ80ml8oDxc/A75wm0hvkw
 rkyn5N98ULbetpVwCIfz3XRPLerX9usB7kVEJkMRS4NZuTTZaLEtEvMaNpYTFHR93Mi1
 w/NMY4HGq4sGX4UsVLTY+Kn/JbXo9aAZIzItg9y8fuN6AouXgmpNDEo3sTqU+vfgUVuB
 yeLw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=behler.me; s=google; t=1785915394; x=1786520194; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=pwm+LlowPY9vPcB+T9axyMQcBGk7e5jWR5riOc7h0to=;
 b=iI4BYaEqSVTjHO+/T3ekoZsLkV5kI1b3bHFIukcG8pWQQkOwi1yGjWS0vnKYJq0mE0
 9h6nVt6HzxhGfeWOxQ4qFPYGW/KX7qoJyrXeZNcnVcagqAMRiwXWr2J+x73hZfJ1himB
 JBfjhu671UtWrJn/4Ax5AKQcS4Nse733U2dx6OCJp8mj1nyge7zj5m9kgtmeLMqhXQ/W
 Pum/tIdPTNyWtEePwb2SimrsOjf5Td7EJnXmaKpSFx5M9Zk8coA0He4Rnxdk3GDjHphx
 d2LGtgHjsqPb4gd8nq0+6brrqbron7zQKD7QIolCxw0lBMOyuV8qsSCLDvpOGPpNArus
 G8NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785915394; x=1786520194;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=pwm+LlowPY9vPcB+T9axyMQcBGk7e5jWR5riOc7h0to=;
 b=s2GD1NpkZWYCuZANjwfu4l9Gy6RSY2A3SgBqV02wNFAqWRzA8lyl60NjbEH0B0sXFT
 lq6UBFk+mOVCb81QGRkt0edIXRf/yl5KaY3Qq3etB0nOrSfStu2b35lxpsRayoQ4WS4W
 U0lKWJCVBdot9owd/qOM6OpzmWB2GNvP5D4Tvs9HYMSu4hQOch+oGyfOk26Nbn9vlSZK
 OW/z4crnKtdYOV1Rv/uIeKHsEZrTB0IqvYrRFl1usbgO5PQp+1L2kbid/3+apOfQVcIB
 p0ZqqwQXl+c8MG0JARdOZEcv98usasNsjsPoLiYZsJB3A7K/Xg2kGl7y5c2ezWjOFeKI
 EURg==
X-Forwarded-Encrypted: i=1;
 AHgh+RqM3OB5k3M8x+QKZbVjnkjR5zrz3U15irJxfyYcZXOHoBCooF9au9/4Avu3vO0SbZ3hFSGhMMWxFB0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx6nYf6a40JY1lu1OI5UuKA0IzrOCyVQByj/+0eXN6Sg9rQSwwh
 4N0yf10dHkyR2Pwm5MiOMc+tRg65bcfg5Fj7Iohh+JlNA9zngVVURxohQ85EeKOOvJ+9WVQvbXF
 JFwV0FVTCgK5q6le0UxieRyvtN3vk6TOq7Qepsx3ZYg==
X-Gm-Gg: AR+sD13phu9AXV4GSFxngeFIXHSQntYe+58hK9wf4Tpm6vTuuNXp5TwBPujMQKFS/gs
 MM4ILX3fAi6+O3z6K+WQpyLsDBTEx9/clPgZbVqTIJF8j1PPyaSJpQGPpseEPQPWQsGs3ausBkL
 jk4w7GJN1okj529w9zR2SHQ1b1ZLCKtX3S+B9cernF2wWdK7oxoz5wsUt4uJr2onVGdRxBTurCv
 L622QaYGAAuVIVsVpTBEwxy9AHgML36Mv1iYHZ2OoDT4FNMx3nMrWr23vj7Q0/OInL+C16xUGhu
 Yn8YPxcqU0gx/Z4g/JBhFFO5GooAj9F9iRi6w181K24jjgv9gHt2iWcKQYQ=
X-Received: by 2002:a05:690e:10:b0:668:4ef3:ac41 with SMTP id
 956f58d0204a3-6699aa3787emr2141994d50.31.1785915394368; Wed, 05 Aug 2026
 00:36:34 -0700 (PDT)
MIME-Version: 1.0
References: <CAM=hwCxiJwODObeut=JcCA8jbu4C-XVEKJpR-y2MnDJibBQyOw@mail.gmail.com>
 <20260802064729.GL20844@black.igk.intel.com>
 <CAM=hwCytVxuqfT2d4UNaf2x5FCOpMXaaGyuQ6xEoh_+w8NVJtw@mail.gmail.com>
 <20260804140449.GA235112@black.igk.intel.com>
 <CAM=hwCx7hg7ZubxmGOND02Do_Vp7W-qJRXK+NyN48sO0Zmy0_g@mail.gmail.com>
 <20260805041421.GE235112@black.igk.intel.com>
In-Reply-To: <20260805041421.GE235112@black.igk.intel.com>
From: Bernd Behler <bernd@behler.me>
Date: Wed, 5 Aug 2026 09:36:22 +0200
X-Gm-Features: AUfX_mzBxRe2jIp5uB-0VBqqwxGej1PY2-VEIr7YO7ViUQVX4XXmw03AJuBUgzI
Message-ID: <CAM=hwCwB=eXrDKFLdohPhvPMHCGm_+2qukTa5qiDknkyFVcj=g@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_Apple_Studio_Display_=282026=2C_Thunderbolt_5=29_=E2=80=94_D?=
 =?UTF-8?Q?P_tunnel_torn_down_every_few_minutes_on_Intel_TB4_host?=
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Imre Deak <imre.deak@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Hi Mika,

> This is not expected. What typically happens is that there is another
> hotplug and the DP tunnels get re-established.

You are right and my observation was wrong =E2=80=94 I had queried tbtunnel=
s after
the re-establishment, not during the outage. It goes exactly as you describ=
e,
about a second later:

  16:47:48  acking hot unplug event on 1:11
  16:47:48  1:11: DP OUT resource unavailable: adapter unplug
  16:47:48  0:5 <-> 1:11 (DP): deactivating
  16:47:48  acking hot unplug event on 1:12
  16:47:48  1:12: DP OUT resource unavailable: adapter unplug
  16:47:48  0:6 <-> 1:12 (DP): deactivating
  16:47:48  looking for DP IN <-> DP OUT pairs:
  16:47:48  0:5: no suitable DP OUT adapter available, not tunneling
  16:47:48  0:6: no suitable DP OUT adapter available, not tunneling
  16:47:49  1:11: DP OUT resource available after hotplug
  16:47:49  available bandwidth for new DP tunnel 34650/34650 Mb/s
  16:47:49  0:5 <-> 1:11 (DP): activating
  16:47:49  0:5 <-> 1:11 (DP): DP IN maximum supported bandwidth 8100
Mb/s x4 =3D 25920 Mb/s
  16:47:49  activating Video path from 0:5 to 1:11
  16:47:49  Video path activation complete
  16:47:50  1:12: DP OUT resource available after hotplug

So: unplug on both adapters, teardown, then a fresh hotplug on both and ful=
l
re-establishment roughly one second later. Nothing stale. Sorry for the noi=
se.


Cable and power supply
----------------------

> Also, you connect the monitor with a real TB cable, right?
> The second idea that comes to mind is power supply

Both original Apple parts, and I can answer this better than by description=
,
because of how the desk is arranged: the NUC sits physically on top of a Ma=
c
mini M2 Pro. Same room, same mains outlet, same monitor, same cable.

  cable plugged into the Mac mini underneath  ->  stable
  same cable plugged into the NUC above       ->  teardowns within minutes

Nothing moves except which host the plug goes into. That rules out the cabl=
e,
the monitor's power supply, and anything environmental. Note the Mac mini M=
2
Pro is Thunderbolt 4 as well, not 5, so this is not a TB5-sink-on-TB4-host
problem either.

The cable was additionally swapped for the 2022 unit's Thunderbolt cable
earlier; link still came up at generation 4 and the failure was unchanged.


> Based on your dump it also happens to both DP OUT adapters (11, 12) at th=
e
> same time.

Confirmed, always both, in the same millisecond bracket. The tunnelled USB3
and PCIe stay up throughout =E2=80=94 only DP goes down. The monitor's USB =
hub,
webcam and speakers never disconnect during an event.


Usage pattern
-------------

> You don't see any "usage" pattern there when this happens?

Partly. Scrolling bright web pages full screen raises the rate noticeably a=
nd
is my usual way to provoke it. But it also happens with the machine idle an=
d
nobody in the room, at a lower rate. So load correlates but is not required=
.

I am sorry to say I cannot run any more tests: the monitor goes back
today, so this
hardware is gone as of this afternoon and no further tests are possible on =
it.

What I do still have is everything captured while it was here =E2=80=94 the=
 traces
already sent, matching dmesg with drm.debug=3D0x104 plus thunderbolt dyndbg=
,
and full journals across several sessions. If any of that is worth a closer
look, or if you want a specific window extracted, just ask and I will dig i=
t
out.


Bernd
