Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2058FC56205
	for <intel-gfx@archiver.kernel.org>; Thu,  6 Aug 2026 14:57:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4A8010F1FA;
	Thu,  6 Aug 2026 14:57:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KNvoZ6ak";
	dkim-atps=neutral
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D16910EE29
 for <intel-gfx@lists.freedesktop.org>; Wed,  5 Aug 2026 12:11:31 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id
 d75a77b69052e-51c0cea8883so7603521cf.1
 for <intel-gfx@lists.freedesktop.org>; Wed, 05 Aug 2026 05:11:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785931890; cv=none;
 d=google.com; s=arc-20260327;
 b=dDPH/CVBebLqQpJHHTYYxdKaWLa2bKeUQsIwkEV36XlopSzToDLFZbsHlWzi4ENmkf
 OyrdRRiVmyiB8rbOQxaapiqc0vAvI6i6YsGal7zx7kwbH8Gc44tcYv0FvDye7zgyKaJd
 I5dZxHaJedVw6E/yn50i/14OsFGcKzrOpa5BsIOljM5QOyC8O3c/2/kvdvCdCLUdlrX3
 fkWpwqLmflF7kK4F7dSwmXzq68/MET6t4nwNo8/n1T1mdD1RJ02uPqlzqCXgw7He4uDS
 Sp4Nu4FWmzZfpaJC+bFaotm0qpLVS84rTTopliZfhErk0iMIQ7cN0k/7VQQt6gpepHEJ
 J5Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:dkim-signature;
 bh=Yh8Y1BiTgmyGQ7eJlQNoWIHTHPxj/tNmLoeAhpI9wOw=;
 fh=avOwZXF5YIh4j8lZcRZwLE6lrkzQTR2TjG5aqdnn2SY=;
 b=eMq0Z+9hHGAPzMfxdzhfkfIiJMDvbdFc8szbc9D7g9WRQFodEA+ELW6y8wR8HMIHZM
 uwdYqBOyeE+VAlv60ZW2YTc8XbCuLVA+QXX+zBWslJ9DniUGWCRpJjvltv7D5IJp9Edh
 DgOaxOF2J4A7tOZn2p19PNPtqqXijjnhyYkqN2ysihRcBfn2AxDd55wCCCJb0mo9dvYb
 3FpLXG2t1+WEcXv53IbYt9g/vWc5roVMlGXu3MX4HoddckwJKRscZq61M2VL7DkLYmyM
 30CfJ9V83hhzF1FPgsdIps/PEODWquHo29+3iJ8laWHuTXbEUzt7pZthL3M4SDhAqPPx
 0Dtg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785931890; x=1786536690; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=Yh8Y1BiTgmyGQ7eJlQNoWIHTHPxj/tNmLoeAhpI9wOw=;
 b=KNvoZ6akR7XNWW50AH28GPdbqi88kPB0xDP2lOkr0/zqmZsfEqxqasyF3+JMxLro2n
 Qjufgax6qmkfaoDwVTtInfbqQx/bL92RMoZQUOx+dQuEGgp7KmMFLMWMo/XE0Gzr8qFT
 ojxiUVz4hzjiUl0YZJ1kCOmJ5m+D9xye/NFw0KMAdG/H68ZNl/d0dJxKvcwjWGcVhR7d
 z8x8HNfRxkf8l7wYNr4/7YeUi86EdivYVmoOETluI6Mkeh4uYXUCyZgDGfxQzHlYiW+x
 RwX8IMrhW/2VnC1c0CKMjXSWAOZxltweYI2NGQgmIDEb2RAy6jVeKNRVckerjsZcyRDh
 N3yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785931890; x=1786536690;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=Yh8Y1BiTgmyGQ7eJlQNoWIHTHPxj/tNmLoeAhpI9wOw=;
 b=tQBA7u+2tkvIkUAg3uPdRKesbOz0X1W9ognVHRCWn14INOG9hDy3TUGT7IIkDmrYMb
 XV/DTyayJDIA2gBJVuOpAodfA1oggAZGw7FrHc1GcCNrN8GcrEgPNNW3hOpMZpkI1KZm
 Glddt6WDkNIeCDGIkIQMwevuAWVHYMGn048lf23kayvAKhJUxeLK2PTvqkHsehhqTx2U
 g9NtvE/pDxLv1ct7q4Kx4eUhBQ+EuezA9kE02doKxZ2SX/2ma8FVbz/ZajoxjFUU2Gih
 1OeBTvq9Wf2hwhx/ZWOdDvfHBfRPtdaqpnJJ7XObh/ZcTadpBsYx7qnEV6ySOeiYAcn8
 Rp8g==
X-Gm-Message-State: AOJu0Ywx02YzIqe+L39BHQrfcrZtoudut8n4QnjDm4/pwfVHROxsCuAN
 YBG8dGOUCzZgu8Q0naxZOwC+oBXno2yAguu26FL+PnnwDSkbOx3KD5rEymSPiX+G37/mfnObECH
 9ImbG8z/eovuN9pwTpqklMd1WxKCywm26zMJI
X-Gm-Gg: AR+sD13OjyXcUzaTobiXAexZ+u8qIywOpMH/zt0s7ljPKm9vQEmxD6OUYNbSuqTB/32
 oxeu/NrHpSCWWGUigBnsTOTMKSqKV5odifOcPHHLPFMxN4FDZJ3A/yWrt9KJhHDwSrWEKOBbOpJ
 F920z1nkoqFOkhRoT10OJwwwMhlgcNeleYlkx+sAt4NEedfkR0aJg0QNnfyAntdfH4rIMPd4a5V
 hDiDpswyeSysB1y7fVm8ys+SFGyxdlS7efwkYGeZoeATEtGZb3XiEF25NVDI2C8yjGqXDsfcgOH
 QdYTUluB46Q5I2JlTJPNppaU7PM+Xr4bZ8yM8YpEcsKpF/r/teaNbjMynu/QiDy7TZA2eklGG3Z
 5ahFsWtU=
X-Received: by 2002:a05:622a:1794:b0:527:7756:3ee9 with SMTP id
 d75a77b69052e-52cd31858fbmr134305051cf.0.1785931890551; Wed, 05 Aug 2026
 05:11:30 -0700 (PDT)
MIME-Version: 1.0
From: Kareem Nedzmee-Seid <kareemnedzmeeseid2011@gmail.com>
Date: Wed, 5 Aug 2026 15:11:17 +0300
X-Gm-Features: AUfX_mxqvpaMZ6ykCE7jScFBgGGcwu8ZP52lOrKv0eopPPGutUfCiVgZxwcsTOQ
Message-ID: <CALQngLNwDOaWDdH+ahGZ92-ydOOwq_FgzVFtbuSvRC0U5WmYEg@mail.gmail.com>
Subject: REGRESSION: i915 Haswell 6 bpc dithering broken (watercolor color
 banding)
To: intel-gfx@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, vsyrjala@linux.intel.com
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

i have a severe issue where haswell era graphics render colors
terribly on linux. the i915 driver seems to fail dithering on 6 bit
laptop displays, and colors get super washed out/banded because the
system treats it like an 8 bit panel when it's actually 6 bit. when
watching movies or videos, these jagged lines come out of nowhere and
ruin the image ;-;

i already have the patch file written by ville, but i don't know how
to safely compile a driver myself and i can't risk breaking anything
on this machine since i rely on it daily for schoolwork.

could the dev team please review and merge this patch into mainline
kernel / stable releases so it gets pushed out through official distro
updates? thank you! :)

original issue:
https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16045

here is original patch code as it is:

From f94b29912b124d729caed9e4c6474c480a5f9cc1 Mon Sep 17 00:00:00 2001
From: =3D?UTF-8?q?Ville=3D20Syrj=3DC3=3DA4l=3DC3=3DA4?=3D <ville.syrjala@li=
nux.intel.com>
Date: Thu, 14 May 2026 18:46:54 +0300
Subject: [PATCH] drm/edid: Ignore the "DFP 1.x" bit for non-TMDS outputs
MIME-Version: 1.0
Content-Type: text/plain; charset=3DUTF-8
Content-Transfer-Encoding: 8bit

Limit the "DFP 1.x" EDID bit parsing to connector types
that use a DFP compatible interface, namely DVI and HDMI.

This avoid populating info->bpc for other output types,
allowing for driver specific fallbacks to kick in. In this
particular case we have a 6bpc eDP panel where we need to
rely on the bpc override from the Intel Video BIOS Table (VBT)
to determine the proper color depth. Unfortunately the VBT
override can't be generally trusted because it tends to be
left at the default 6bpc value regardless of the color depth
of the panel. So we only trust it if the EDID doesn't specify
a color depth explicitly.

Cc: Mario Kleiner <mario.kleiner.de@gmail.com>
Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16045
Fixes: 210a021dab63 ("drm/edid: Set 8 bpc color depth for displays
with "DFP 1.x compliant TMDS".")
Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_edid.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 404208bf23a6..ee99f680e8f5 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -5693,6 +5693,19 @@ void drm_edid_cta_sad_set(struct cea_sad
*cta_sad, const u8 *sad)
  cta_sad->byte2 =3D sad[2];
 }

+static bool connector_is_dfp_compatible(struct drm_connector *connector)
+{
+ switch (connector->connector_type) {
+ case DRM_MODE_CONNECTOR_DVII:
+ case DRM_MODE_CONNECTOR_DVID:
+ case DRM_MODE_CONNECTOR_HDMIA:
+ case DRM_MODE_CONNECTOR_HDMIB:
+ return true;
+ default:
+ return false;
+ }
+}
+
 /*
  * drm_edid_to_eld - build ELD from EDID
  * @connector: connector corresponding to the HDMI/DP sink
@@ -6783,6 +6796,7 @@ static void update_display_info(struct
drm_connector *connector,
  * extensions which tell otherwise.
  */
  if (info->bpc =3D=3D 0 && edid->revision =3D=3D 3 &&
+     connector_is_dfp_compatible(connector) &&
      edid->input & DRM_EDID_DIGITAL_DFP_1_X) {
  info->bpc =3D 8;
  drm_dbg_kms(connector->dev,
--=20
2.52.0
