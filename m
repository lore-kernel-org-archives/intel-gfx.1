Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0373BCCF2D6
	for <intel-gfx@archiver.kernel.org>; Mon, 19 Oct 2026 11:41:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 648AE10EAFE;
	Mon, 19 Oct 2026 11:41:51 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com
 [209.85.128.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 926FC1129BE
 for <intel-gfx@lists.freedesktop.org>; Fri, 16 Oct 2026 20:05:30 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-8ac9d666d4eso2958777b3.3
 for <intel-gfx@lists.freedesktop.org>; Fri, 16 Oct 2026 13:05:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792181129; cv=none;
 d=google.com; s=arc-20260327;
 b=PbX4yLCVno2k5H9BTXNThL3fka0CYGo+uRujwch//rZyYcO2kmbrlVGgWm65MMVOCm
 haUWWxi34pgas2Tdsilpz5j51wx4JU7z8inHtIky+lfkCQmY3k8Elj0v2kNa2nch/vSp
 nDLzlGrF3d19I9BRABOzAlf03/jI8AV8fMqY2ozGdszKz2tmSCksz8Tg1Bo6StxrZNar
 2QZBlrty8u65qupzpEjoTfAMZaSnhm6bALFYGHj9tYq/qn0W7lwl92YSyxjLeXlO2hno
 cr4XgYEHfSvFZ6snWy1+LfKq6sneLqyGU2SfrulJ3GoBClDAHQLOGDlTmQXidSh19zwi
 B1gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
 bh=dmzXdbZR886lKjLoddxX/OH4Op6/cRfq1jDEQiO2KdY=;
 fh=IHsoSAvt4OkvoaCCRefIg6gh3iQHwZhm9GAh93c9k6Y=;
 b=IB4Jz4ESpKVr6WMvV1joE3Isa5KzGSol4C29X6UadaPJrJQZPMyFo2WGyNgziD154c
 ofjuam3uKIj5SntQygMvsnzAatYnjbOz/G6jPseDUrZrdeanmtByu62+MhEeKuq2rP/5
 4foIzDi2BagFt2ZsLibEBqb/tAv6pL1UaRfRuXm18lAWX1TTSlB71OWdcS96nffzcKxT
 1gq2HXD71wRKYOpFLEedWOCGPDWVuL3O5nKkQq+bsv18iW2kxkAHUhcdO69TQQlRIB9r
 0Hus1W8L+F2TgZe40zuLyhSTqT1QEAaofA9l5Sd9foncUv8BGO0RI8IccCPlHVDl53ue
 u7vQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792181129; x=1792785929; darn=lists.freedesktop.org;
 h=content-type:cc:to:subject:message-id:date:from:mime-version:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=dmzXdbZR886lKjLoddxX/OH4Op6/cRfq1jDEQiO2KdY=;
 b=re6M/7bysWlPQv7LB3wkZefn3gwyo1C8slkkXyrpRoM8UIoYvSRFO8YD3ElmVr7LvI
 6msWVNgGkpzVwHEwAz/0rmCyEuWOrgcJA9v12U3i0EU2ECWAJSj4OKmOEM/V0HcNEvrn
 DHtFlzRQ+ao9+tPR3J+EPa0v2q/8onqCZx+nn2T7aaQP8CruDdL871kCZI0sBESIUrwy
 eoydptzVY/Udh0PpHgMBj+XOwD1/bWgNPauQVQOunOYO9w9WrXch6daHNSBo3T5N3s0m
 NqerimRPNtank3rr8CErTCCN1Ohv/TowAkA0d8cdj5s2rPxQh8wtjeoroEHlEOevW21m
 E4Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792181129; x=1792785929;
 h=content-type:cc:to:subject:message-id:date:from:mime-version
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=dmzXdbZR886lKjLoddxX/OH4Op6/cRfq1jDEQiO2KdY=;
 b=KJ8mLSfP4VR0xn+AQWI+jtP/qHV7oHz1CRon/XjZ2H5gDvKHGb4SWYW2SH2wr4n70a
 84N6T3kMrSsCmOZstZOui0atS55e4tQtstC/+xYAYUscun8ccgKqKPha6W7S3cFvUt+/
 jAKf3Dm+MvVZ/5fVnIPRHC95Ugj81zowlajcOPUXkmPNf8SCmWfuozKoueXX80M9pPGX
 cZ6pp48cuiUTUch75j9cZwOnbKtOzuoQ1dBzLAhYs80ovZ4eYQgs80xoxMobfZxiw881
 jdq8peVjbYRR/nwXfkQFoCIQJmM3ea3hPI5xqzHqr87HNyeT3Kh5gGDaQhAkwr2Jdjaa
 0Vtg==
X-Gm-Message-State: AFq9FYLgNvc3crM6i/VV3SIkMr8gyZy2FgVC5CHLFErGICbEoSQrVJ0o
 I9tj2t9AEWoy+eZYZYZfOkR5s6OWoJOlkol9jZLKQh0N1COVabAkYpabZyFRhGYARe8wROMJDaq
 khe3fjy7q9ndvy3oVWW5Vc9uRDpqTBIoK2r13
X-Gm-Gg: AYBFou1haWmYv9SSUNEnKnifZ9+yHE2Jg13M3rChyb7jjjMSaKQ+8LfP+weqy23FYZ3
 6aQDVEWzQeZqpqIDQmdDEyEf+A+JdP1pJ2dRwPlEAg1eStognmsV1Q74nSMkKvjTujr5r4MoGNn
 SsC/r1MP2QI7CdORSRMbhQGcGCRjUiof0Kq5PXj20MBYJ2bx5dK5hSYNuHIFJKCvnSRem6IS8Hb
 Y84WuVN7hq6bo8SBKXniumBbmWLKzGEyjunDuaW068yxtTayz/k1+y3bfXTtN7byE22xWk9SGf6
 YpM3xe+Ymv+ztzBBDl1LOKhghfupqYFfI++KZLyGmkbOd6YvfYdHA3g4jfn+d6UPQbN5Pl+Uy5F
 xvvURkHohjayM6CSO7gIpxfBfiUg1cQxTZXZUZEtEIQTF
X-Received: by 2002:a05:690c:ec8:b0:873:5bb2:6c33 with SMTP id
 00721157ae682-8b0f21aeb9dmr3532647b3.58.1792181129253; Fri, 16 Oct 2026
 13:05:29 -0700 (PDT)
MIME-Version: 1.0
From: Adrien ASESIO <aasesio@gmail.com>
Date: Fri, 16 Oct 2026 16:05:16 -0400
X-Gm-Features: AclHuK8s-jthCSiy0as-Az0HoaccHrEpisuSlOg21FVtJxc7LkRwkSCUd313iQI
Message-ID: <CAK1iddKB9hhhBGPnu6nNg-nn-Tg-GC-31nvEEHKB9qvkMesxLA@mail.gmail.com>
Subject: [RFC] drm/i915: HDMI 3D frame packing on LSPCON (DP-to-HDMI) ports
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
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

Hi,

I would like to ask whether stereo 3D output on i915 ports that drive
an HDMI sink
through an LSPCON (DP branch device in PCON mode, MegaChips MCDP28x0
or Parade PS175)
is something that could be supported, and what you would want a patch
to look like.

Background: the HDMI 2.0 port of many Intel boards from Skylake to
Coffee Lake (Intel
NUC7/NUC8 among them) is an LSPCON, so i915 registers it as a
DisplayPort connector.
stereo_allowed is only set in intel_hdmi_init_connector(), never for DP, so
drm_helper_probe_single_connector_modes() prunes every 3D mode the
EDID advertises,
and lspcon_set_infoframes() only writes the AVI infoframe (and the
DRM/HDR packet),
so there is no path for the HDMI Vendor-Specific InfoFrame that
carries 3D_Structure.
Intel's support article 000030190 documented S3D as unsupported on
LSPCON designs.

Observation: on a NUC8i7BEH (i7-8559U, Coffee Lake; i915_display_info
reports the
branch device as "Type: HDMI, ID: MC2800, HW 2.2, SW 1.73") with
kernel 6.1.74, whose
code paths are unchanged in this respect on current master, I programmed the
frame-packing raster of CTA VIC 32 as a plain progressive mode from userspace:

    1920x2205 @ 24 Hz, clock 148500, htotal 2750, vtotal 2250, +hsync +vsync

The sink (Panasonic TX-P..VT65 plasma, HDMI 1.4a, behind an Onkyo AVR)
switched into
frame-packed 3D by itself and displayed both eyes correctly; page
flips were delivered
at 41.667 ms (sd 0.01 ms) for minutes. So the LSPCON passes the
doubled raster, and at
least this TV detects frame packing from the timing without the VSIF
(or the LSPCON
generates one; I cannot tell without an HDMI analyser). Kodi now does
exactly this on
that machine (patch under review on the maintainer's 3D branch, [1]),
decoding 3D
Blu-ray MVC with FFmpeg's pending H.264 MVC series [2].

Questions:

1. Would a patch that sets connector->stereo_allowed for DP connectors
with an HDMI
   branch device (intel_dp->has_hdmi_sink / lspcon.active) be
acceptable, knowing that
   the VSIF cannot be sent? The modes would only appear for sinks
whose EDID advertises
   3D, and only to clients that set DRM_CLIENT_CAP_STEREO_3D. The risk
I see is clients
   that set the cap but do not understand
DRM_MODE_FLAG_3D_FRAME_PACKING picking a
   2205-line mode by accident.

2. Is there any documentation of an infoframe interface on the
MegaChips or Parade
   LSPCONs beyond the AVI registers i915 knows
(LSPCON_MCA_AVI_IF_WRITE_OFFSET 0x5C0,
   LSPCON_PARADE_AVI_IF_WRITE_OFFSET 0x516)? MegaChips' product page claims
   "stereoscopic 3D forwarding" for the MCDP2800.

3. If neither is wanted in the kernel, is "userspace programs the
doubled raster as a
   2D mode" an approach you consider legitimate, so that compositors
and players can
   do what I did above?

The amdgpu side is getting HDMI 1.4 3D output through Adrian
Betschart's series on
amd-gfx (2026-09), which restricts stereo_allowed to native HDMI
connectors for the
same reason.

Test tool (libdrm; lists stereo modes with the client cap, sets a
frame-packing or
forced raster, measures flip pacing): https://github.com/SilverGhostBS/fp3d-test

[1] https://github.com/popcornmix/xbmc/pull/35
[2] https://code.ffmpeg.org/FFmpeg/FFmpeg/pulls/24303

Thanks,
Adrien Asesio
