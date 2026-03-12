Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3294CFED2DF
	for <intel-gfx@archiver.kernel.org>; Thu, 12 Mar 2026 07:30:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF5DA10E41E;
	Thu, 12 Mar 2026 07:30:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="U58yeWuu";
	dkim=pass (2048-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="V0uaV0qF";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBE8D10E418
 for <intel-gfx@lists.freedesktop.org>; Thu, 12 Mar 2026 07:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1773300639;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=xlPKSryrzvi8BHSgXKZhjuzXWnH1dXyf86fgSkP5rRE=;
 b=U58yeWuuZqqWzQLOpBV1vXZZHdDCRNdjjLCayjuaq+hxyZQFiGw0lzvXWHXs0azBfviVE+
 DU5mZMY76gdm4s2n5DPTgnWpQLShe1r14HVx5K+E3nuvGcZN5DJVGHUsNhTG8TwF/ylmD+
 c+A0WoWEy++FK5Hzim+1aMmtGD0D8wY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-454-v83T7I9kPGen-sPz3ff0AQ-1; Thu, 12 Mar 2026 03:30:35 -0400
X-MC-Unique: v83T7I9kPGen-sPz3ff0AQ-1
X-Mimecast-MFC-AGG-ID: v83T7I9kPGen-sPz3ff0AQ_1773300634
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4853b0af42aso8330505e9.0
 for <intel-gfx@lists.freedesktop.org>; Thu, 12 Mar 2026 00:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; s=google; t=1773300634; x=1773905434; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xlPKSryrzvi8BHSgXKZhjuzXWnH1dXyf86fgSkP5rRE=;
 b=V0uaV0qF13u1lbXlBeHPeibb5Cm6rGQCQeG8Bryeq/eam5m05OF9JmZxaxulnlym8I
 rgwrEfzJHnEn4NZpxM+FUjP6goE3DsvaA5CJuyEAegHaVFrPUU8XFnYFxSTFv8/we3Fo
 5n9lWS65fsXohNtvu7KDR8MQxwudSXtywjTgPGZEXhk2adVtCzYdieqbuxXL63PU2Hhs
 7AZxuHRvNxq/7lk9j6hUO6rrYXBzAxq6QqTgZl9PbflOiV76/cetCOseNN0M2TiuifEX
 5rvIkQTV5kiIEvOiDAGNnWxVDmS/OmbVTPfDjVCu7ej16AFLUNkzZ0i9DJhO6HDMjGnO
 tA5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773300634; x=1773905434;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xlPKSryrzvi8BHSgXKZhjuzXWnH1dXyf86fgSkP5rRE=;
 b=Pd+EMKoXu38vyqz7435uYrMbYGvCVEsmWR5JeMC7kZ4groCkHp4lXFiMcbONM+c+uP
 W1sk9bcNMHihklf2czPKdUXsX2RQ5b2cKEPMw2+ZGGR4IF7vW3WJMv2ny0r9HHLK0ZFD
 EuR/oEazYfbhLxayc+10SSKtTlSDNr0TK8e8lE1qYKdIX5DX+DXukvlEq4WqQmPJiP5u
 XDq3ZyGDwMLTWBJO4OVINiqw2bI5Qib3W5jZaLDBSUDZbwgkc2YEJ9f+2/iTdMnCCC/r
 ntp9vKURQ8YGyBNouasrpcYChx2xyGYv8Xrk3KMmM4CDad53Kf8UShfZkPtD2+jbY0tL
 HQGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZCyD7WMMNdyVEt6CUDKCPWi721mN/QLkPWIJMgJS3TvrFeQftPe0jas8aL57/p+G6pkxu88m1QMo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwvGieNUsTOL4nn0vYtzUEXWTk3cWb/Oj2ztChtxu41pDlFA4a3
 EFX/GKdnkdsSCk5FGxSUok4kYm1aJ4OpWHIRu8gF5FSpQT2T6HvFRDn62BJHzHBvNsWdAV6jY5T
 TCysVatZ79fugXo3amVckGzut78ryAEvFbewyEKz1/1Eo4UoeoAVtouyRbmO8vy2uNmvDNw==
X-Gm-Gg: ATEYQzzHDOdlqpQ67I9tSBBvUILl6v0/B+e/CJpUVNstFIv+B6NjRJgFqQ2e3XbTER8
 mYYild3ff8TL7v1zB7olgExEPJcil76/OmvdXAFxVT/564fXI0GQVkW3wbKhHFpNSoJrgSUk8ql
 lxgaAdYvXc8Odt080+Zt/G6nW1KYJe8qjVgenxy1ATFrJ/+HNjJgFedXMfbLtMCD6z27F01MsE1
 NOkG42bWw5L8QG9XyB9RC5JpXtgjRT0CWV5vyjW28dJIkM/f7ASiZwoiUWmDr3zhXQVfiytOyxP
 ET1Up86B+F7135h9UvG2hcJBAEtmlO5rFNE66ZnjNDQIXia1P6EWV/M3UBIRJlsPPaMs8yhdZA=
 =
X-Received: by 2002:a05:600c:3b16:b0:485:4533:9c47 with SMTP id
 5b1f17b1804b1-4854b100c42mr90613575e9.22.1773300634237; 
 Thu, 12 Mar 2026 00:30:34 -0700 (PDT)
X-Received: by 2002:a05:600c:3b16:b0:485:4533:9c47 with SMTP id
 5b1f17b1804b1-4854b100c42mr90613255e9.22.1773300633693; 
 Thu, 12 Mar 2026 00:30:33 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4854b5e912fsm279581235e9.2.2026.03.12.00.30.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Mar 2026 00:30:32 -0700 (PDT)
Date: Thu, 12 Mar 2026 08:30:32 +0100
From: Maxime Ripard <mripard@redhat.com>
To: Dave Airlie <airlied@gmail.com>, 
	Simona Vetter <simona.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Matthew Brost <matthew.brost@intel.com>, 
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, 
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: [PULL] drm-misc-fixes
Message-ID: <20260312-accurate-ambrosial-trout-bfabf8@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="kaiblbioitow5veg"
Content-Disposition: inline
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


--kaiblbioitow5veg
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: [PULL] drm-misc-fixes
MIME-Version: 1.0

Hi,

Here's this week drm-misc-fixes PR.

Maxime

drm-misc-fixes-2026-03-12:
A pixel byte swap fix for st7586, a null pointer dereference fix for
gud, two timings fixes for ti-sn65dsi83, an initialization fix for ivpu,
and a runtime suspend deadlock fix for amdxdna.
The following changes since commit 021f1b77f70d62351bba67b050b8d784641d817f:

  accel: ethosu: Handle possible underflow in IFM size calculations (2026-03-05 15:21:17 -0600)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-fixes-2026-03-12

for you to fetch changes up to 49973e2a4156a88e46ba1c1c484b7c214199a181:

  drm/loongson: Mark driver as orphaned (2026-03-11 10:15:36 +0100)

----------------------------------------------------------------
A pixel byte swap fix for st7586, a null pointer dereference fix for
gud, two timings fixes for ti-sn65dsi83, an initialization fix for ivpu,
and a runtime suspend deadlock fix for amdxdna.

----------------------------------------------------------------
Andrzej Kacprowski (1):
      accel/ivpu: Remove boot params address setting via MMIO register

David Lechner (1):
      drm/sitronix/st7586: fix bad pixel data due to byte swap

Lizhi Hou (1):
      accel/amdxdna: Fix runtime suspend deadlock when there is pending job

Luca Ceresoli (2):
      drm/bridge: ti-sn65dsi83: fix CHA_DSI_CLK_RANGE rounding
      drm/bridge: ti-sn65dsi83: halve horizontal syncs for dual LVDS output

Shenghao Yang (1):
      drm/gud: fix NULL crtc dereference on display disable

Thomas Zimmermann (1):
      drm/loongson: Mark driver as orphaned

 MAINTAINERS                           |  3 +-
 drivers/accel/amdxdna/aie2_ctx.c      | 14 ++-------
 drivers/accel/amdxdna/amdxdna_ctx.c   | 10 +++++++
 drivers/accel/ivpu/ivpu_hw_40xx_reg.h |  6 ----
 drivers/accel/ivpu/ivpu_hw_ip.c       |  1 -
 drivers/gpu/drm/bridge/ti-sn65dsi83.c | 13 +++++----
 drivers/gpu/drm/gud/gud_drv.c         |  9 +++++-
 drivers/gpu/drm/gud/gud_internal.h    |  4 +++
 drivers/gpu/drm/gud/gud_pipe.c        | 54 +++++++++++++++++++++++------------
 drivers/gpu/drm/sitronix/st7586.c     | 15 ++++------
 10 files changed, 74 insertions(+), 55 deletions(-)

--kaiblbioitow5veg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCabJrlwAKCRAnX84Zoj2+
dlVcAX9JZOTRM6KU1AeZ8RDOEXJlVrBO1VgMAXBuNbLB65I8RBl85dGtmZJp7SCr
fKcEtHkBfipC/z2/0NA2byRFUKZcQkfjcqKfsy327URg8aqGCd4RTlRGJZmmasdl
MwBdHQN42g==
=XC+m
-----END PGP SIGNATURE-----

--kaiblbioitow5veg--

