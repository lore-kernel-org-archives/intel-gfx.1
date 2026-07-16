Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EBE8C44511
	for <intel-gfx@archiver.kernel.org>; Thu, 16 Jul 2026 07:40:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 847FB10E729;
	Thu, 16 Jul 2026 07:40:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="KLcPrcEO";
	dkim=pass (2048-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="hqNkAaIe";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C26E710E729
 for <intel-gfx@lists.freedesktop.org>; Thu, 16 Jul 2026 07:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1784187609;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=cXLXS6MpfQQz5wlKDJUyL4Gpupar2PP12LAqPDcnxkQ=;
 b=KLcPrcEO4x/yi5KPde0o21yEYQUFEMJXJDSyi06bn6DzMdB8xW4w3oJLfhe31jxNor/U5e
 SBIfwtBpN8jUaEswAiPZAjrPRaLg46TXy7YgeSvSkk+Go6b62pDsRg9i5RZRw1x5lb4Nhb
 QfXlf0aQ6YN+ONInnmUNp1H6mPtcd9M=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-480-nyLb9hg3PfWexB7qdQQMFg-1; Thu, 16 Jul 2026 03:40:05 -0400
X-MC-Unique: nyLb9hg3PfWexB7qdQQMFg-1
X-Mimecast-MFC-AGG-ID: nyLb9hg3PfWexB7qdQQMFg_1784187604
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-4629f312a67so5269717f8f.2
 for <intel-gfx@lists.freedesktop.org>; Thu, 16 Jul 2026 00:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; s=google; t=1784187604; x=1784792404; darn=lists.freedesktop.org;
 h=content-disposition:content-type:mime-version:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=cXLXS6MpfQQz5wlKDJUyL4Gpupar2PP12LAqPDcnxkQ=;
 b=hqNkAaIeqIveHXZMFtDUVnzSKmWc1jGd7UgMFbpt4VDFlcoV8ySaRqh5sQaUPDoJIk
 pVlueIU1xyHkNVqO1bq4iLkHqpIhT+x274X7amh3cRlHVCP5LkfLGsjaV3jy28H/MsVY
 lTB9p1WU3pipx4pv71LndqVTdJ4mmNOYHHmgAd0ecw3KWiaVog3Biqe9sqvQvTOGFBu3
 l6YdG24PYiUFhl4L8qh5dz/NhRvyDJL7q8Ijm852D9ry0ZXlQgGddEXDBrEEOKwB4oaX
 VSgbEuBVe0EraNfvJEkGjX/450XFlFgJnizpxlCXNKabII9Iue7tMGdrnmKylGqFVrwU
 FprQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784187604; x=1784792404;
 h=content-disposition:content-type:mime-version:message-id:subject:cc
 :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=cXLXS6MpfQQz5wlKDJUyL4Gpupar2PP12LAqPDcnxkQ=;
 b=R2A/2htkr4fELPgQVdiu3d3kh0GZwcNQHRj6/0vSmITYiUdr6U+lEA3hp6LBhN3ar5
 i4iycsmXNUQDayOAzyppclPDSoY0dfuWs/Va82mNq+6mUhP3PJ/5eA9yxYfT0likmHVg
 YDuw/zThabejvS930VqpBO6kyohqhho8LyB7ERFoyoDucqeteYaINc/s91G4B8G1E9Qo
 Wb+mX+hucHp5mwVFsG/AxCpq+DpJXt2gtk7vwUNrzfVFEUDV3w7DjY7aJHrqphX43SXg
 JF3TYqaaOjephYk8h2NqAUGr1lasixdk+ImqeusQxjj6ogKAwFXYVzJcJ9Ix6QQEF3Kh
 zBww==
X-Forwarded-Encrypted: i=1;
 AHgh+Rr1Ui57/MuLH1Y5sr1nNiWwQwcmplVXdsXqvoj/rCO/2DMjWDZACLbho27rOtpF03ViWalPh2YDdD0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxi/1MGvjxT+zx6rxEtSw27OwHVuns+tQcqxEb1Ehl85pKdC5ij
 Tp4ffdyZmHPs4iMRJz6jNYDskT3ZSIM3c1sLbHIrv7kHQaz42BRc+GiCLxucTWYizxU5WOiBQaO
 ALu8Q4zGpLSDW2+RNrAUbGcIHl5/nOUzueg59+HZLVXyAaLqAOY+56Nt1UveqgN3L7vo5wQ==
X-Gm-Gg: AfdE7clQ3hEVSbeVonZkkrT13kEXiU7bWlDgp0qKHlh9h1IutL/wKtipvZZ/lZVdoNJ
 OCyK18D9SOkfh9TX4kadk11NNdrN45AXis01nv5vmRsi9rkv/aaYu/JAA7GeGSSo8SyZohgBvif
 eHvxuQfurYHlJhF58dO5o8WCR4zxdFi7LtALm/tUvYTPqVQHEhK/trUQynaBnkWulbxoD1vfxcc
 FoBIZpzjoZIB++IWDfdx2bVDFr1ZYxJMtI7QyxXiL8TMxZEhmINTdn585/pRNnLL9tBzIlqknYd
 MpSKJKE4AFJZUoeQ9C6TGlbtr2U/HBf/XQu4nqpIJhqU6qlpvzAvzEpdyO33kweo//zjcCLNfg=
 =
X-Received: by 2002:a05:600c:8483:b0:493:d078:796 with SMTP id
 5b1f17b1804b1-4953c16a713mr67061765e9.17.1784187603517; 
 Thu, 16 Jul 2026 00:40:03 -0700 (PDT)
X-Received: by 2002:a05:600c:8483:b0:493:d078:796 with SMTP id
 5b1f17b1804b1-4953c16a713mr67061355e9.17.1784187602961; 
 Thu, 16 Jul 2026 00:40:02 -0700 (PDT)
Received: from localhost ([2a01:e0a:a99:9822:ca7f:54ff:fe01:374c])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49541e9ee07sm42127855e9.15.2026.07.16.00.40.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2026 00:40:02 -0700 (PDT)
Date: Thu, 16 Jul 2026 09:40:01 +0200
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
Subject: [PULL] drm-misc-next
Message-ID: <20260716-famous-pastel-ostrich-a1aaef@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="xgbvgquebhi7dsp5"
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


--xgbvgquebhi7dsp5
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: [PULL] drm-misc-next
MIME-Version: 1.0

Hi Sima, Dave,

Here's this week drm-misc-next PR.

Thanks!
Maxime

drm-misc-next-2026-07-16:
drm-misc-next for 7.3:

UAPI Changes:

Cross-subsystem Changes:

Core Changes:
- blend: allow blend mode property without PREMULTI
- bridges:
  - Rename drm_for_each_bridge_in_chain_scoped to
    drm_for_each_bridge_in_chain
  - Drop legacy bridges support

- gpusvm: Code reorganization to give drivers more flexibility

Driver Changes:
- etnaviv: Check if a reset has been successful
- nouveau: Create instmem iomapping at first use
- panthor: Remove redundant cleanup
- qxl: Convert to a simple encoder to a regular one

- bridges:
  - Convert all remaining legacy bridges to atomic
  - tc358767: clamp the reported AUX read size to the request

- panels:
  - novatek-nt37801: Use mipi_dsi_*_multi() functions
  - samsung-s6d16d0: Fix prepare error handling
The following changes since commit 671b7825dbfe9ea6e3ad3001003aeee0df48d1b5:

  drm/v3d: bound CPU-job query writes to their destination BO (2026-07-08 0=
9:15:42 -0300)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-next-202=
6-07-16

for you to fetch changes up to ec6444a00c49e6c2b5e9a507272a28126677f9ee:

  drm/bridge: tc358767: clamp the reported AUX read size to the request (20=
26-07-15 11:38:01 -0700)

----------------------------------------------------------------
drm-misc-next for 7.3:

UAPI Changes:

Cross-subsystem Changes:

Core Changes:
- blend: allow blend mode property without PREMULTI
- bridges:
  - Rename drm_for_each_bridge_in_chain_scoped to
    drm_for_each_bridge_in_chain
  - Drop legacy bridges support

- gpusvm: Code reorganization to give drivers more flexibility

Driver Changes:
- etnaviv: Check if a reset has been successful
- nouveau: Create instmem iomapping at first use
- panthor: Remove redundant cleanup
- qxl: Convert to a simple encoder to a regular one

- bridges:
  - Convert all remaining legacy bridges to atomic
  - tc358767: clamp the reported AUX read size to the request

- panels:
  - novatek-nt37801: Use mipi_dsi_*_multi() functions
  - samsung-s6d16d0: Fix prepare error handling

----------------------------------------------------------------
Ben Dooks (1):
      drm/panfrost: include panfrost_drv.h for panfrost_transparent_hugepage

Dave Airlie (1):
      nouveau/instmem: use iomapping interface for instmem handling

Diogo Silva (1):
      drm/qxl: remove dependency on DRM simple helpers

Henrik Grimler (2):
      drm/bridge: sii9234: fix some typos in comments and messages
      drm/bridge: sii9234: use dev_err_probe where applicable

Honglei Huang (5):
      drm/gpusvm: split MM state flags out of drm_gpusvm_pages_flags
      drm/gpusvm: embed struct drm_device into drm_gpusvm_pages
      drm/xe: have xe_svm_range embed one drm_gpusvm_pages
      drm/gpusvm: move struct drm_gpusvm_pages out of struct drm_gpusvm_ran=
ge
      drm/gpusvm: let the drm_gpusvm core context purely MM level

Jiri Slaby (SUSE) (2):
      drm/imx: Switch to irq_domain_create_linear()
      drm/imx: include dc-drv.h to avoid sparse warning

Laxman Acharya Padhya (1):
      drm/panel: samsung-s6d16d0: Power off on prepare failure

Leandro Ribeiro (2):
      drm/drm_blend: allow blend mode property without PREMULTI
      drm: ensure blend mode supported if pixel format with alpha exposed

Luca Ceresoli (4):
      drm: of: fix wording in comment
      drm/bridge: samsung-dsim: fix wording in comment
      drm/bridge: fix wording in comment
      drm/bridge: rename drm_for_each_bridge_in_chain_scoped() to drm_for_e=
ach_bridge_in_chain()

Lucas Stach (2):
      drm/etnaviv: check all modules for idle after reset
      drm/etnaviv: check MMUv2 status after reset

Maoyi Xie (1):
      drm/bridge: tc358767: clamp the reported AUX read size to the request

Maxime Ripard (37):
      drm/adp: mipi: Add atomic bridge state handlers
      drm/bridge: analogix-anx6345: Switch to atomic bridge callbacks
      drm/bridge: analogix-anx78xx: Switch to atomic bridge callbacks
      drm/bridge: aux-bridge: Add atomic bridge state handlers
      drm/bridge: aux-hpd-bridge: Add atomic bridge state handlers
      drm/bridge: chrontel-ch7033: Switch to atomic bridge callbacks
      drm/bridge: cros-ec-anx7688: Add atomic bridge state handlers
      drm/bridge: lontium-lt8713sx: Add atomic bridge state handlers
      drm/bridge: lontium-lt8912b: Switch to atomic bridge callbacks
      drm/bridge: lontium-lt9611uxc: Add atomic bridge state handlers
      drm/bridge: lvds-codec: Switch to atomic bridge callbacks
      drm/bridge: megachips-stdpxxxx-ge-b850v3-fw: Add atomic bridge state =
handlers
      drm/bridge: microchip-lvds: Add atomic bridge state handlers
      drm/bridge: nxp-ptn3460: Switch to atomic bridge callbacks
      drm/bridge: of-display-mode-bridge: Add atomic bridge state handlers
      drm/bridge: parade-ps8622: Switch to atomic bridge callbacks
      drm/bridge: sii9234: Add atomic bridge state handlers
      drm/bridge: sil-sii8620: Add atomic bridge state handlers
      drm/bridge: simple-bridge: Switch to atomic bridge callbacks
      drm/bridge: tc358764: Switch to atomic bridge callbacks
      drm/bridge: tda998x: Switch to atomic bridge callbacks
      drm/bridge: ti-tfp410: Switch to atomic bridge callbacks
      drm/bridge: ti-tpd12s015: Add atomic bridge state handlers
      drm/bridge: thc63lvd1024: Switch to atomic bridge callbacks
      drm/bridge: waveshare-dsi: Switch to atomic bridge callbacks
      drm/exynos: mic: Switch to atomic bridge callbacks
      drm/mcde: dsi: Add atomic bridge state handlers
      drm/mediatek: dpi: Switch to atomic bridge callbacks
      drm/msm: dsi: Switch to atomic bridge callbacks
      drm/omap: dpi: Switch to atomic bridge callbacks
      drm/omap: dsi: Switch to atomic bridge callbacks
      drm/omap: sdi: Switch to atomic bridge callbacks
      drm/omap: venc: Switch to atomic bridge callbacks
      drm/sti: dvo: Switch to atomic bridge callbacks
      drm/sti: hda: Switch to atomic bridge callbacks
      drm/sti: hdmi: Switch to atomic bridge callbacks
      drm/bridge: Remove legacy bridge callback support

Nicol=E1s Antinori (1):
      drm/panel: novatek-nt37801: Use mipi_dsi_*_multi() functions

Tvrtko Ursulin (1):
      drm/panthor: Remove redundant drm_sched_job_cleanup() from the .free_=
job callback

 .clang-format                                      |   2 +-
 drivers/gpu/drm/adp/adp-mipi.c                     |   4 +
 drivers/gpu/drm/bridge/analogix/analogix-anx6345.c |  13 +-
 drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c |  13 +-
 drivers/gpu/drm/bridge/aux-bridge.c                |   4 +
 drivers/gpu/drm/bridge/aux-hpd-bridge.c            |   4 +
 drivers/gpu/drm/bridge/chrontel-ch7033.c           |  13 +-
 drivers/gpu/drm/bridge/cros-ec-anx7688.c           |   4 +
 drivers/gpu/drm/bridge/lontium-lt8713sx.c          |   4 +
 drivers/gpu/drm/bridge/lontium-lt8912b.c           |   8 +-
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c         |   3 +
 drivers/gpu/drm/bridge/lvds-codec.c                |  10 +-
 .../drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c   |   3 +
 drivers/gpu/drm/bridge/microchip-lvds.c            |   3 +
 drivers/gpu/drm/bridge/nxp-ptn3460.c               |  17 +-
 drivers/gpu/drm/bridge/of-display-mode-bridge.c    |   4 +
 drivers/gpu/drm/bridge/parade-ps8622.c             |  18 +-
 drivers/gpu/drm/bridge/samsung-dsim.c              |   2 +-
 drivers/gpu/drm/bridge/sii9234.c                   |  39 ++--
 drivers/gpu/drm/bridge/sil-sii8620.c               |   4 +
 drivers/gpu/drm/bridge/simple-bridge.c             |  13 +-
 drivers/gpu/drm/bridge/tc358764.c                  |  13 +-
 drivers/gpu/drm/bridge/tc358767.c                  |   2 +-
 drivers/gpu/drm/bridge/tda998x_drv.c               |  13 +-
 drivers/gpu/drm/bridge/thc63lvd1024.c              |  14 +-
 drivers/gpu/drm/bridge/ti-tfp410.c                 |  10 +-
 drivers/gpu/drm/bridge/ti-tpd12s015.c              |   4 +
 drivers/gpu/drm/bridge/waveshare-dsi.c             |  14 +-
 drivers/gpu/drm/display/drm_bridge_connector.c     |   4 +-
 drivers/gpu/drm/drm_atomic.c                       |   2 +-
 drivers/gpu/drm/drm_blend.c                        |  20 +-
 drivers/gpu/drm/drm_bridge.c                       |  65 ++----
 drivers/gpu/drm/drm_gpusvm.c                       | 243 ++++++++++++-----=
----
 drivers/gpu/drm/drm_mode_config.c                  |  21 ++
 drivers/gpu/drm/drm_of.c                           |   2 +-
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c              |  23 +-
 drivers/gpu/drm/exynos/exynos_drm_mic.c            |  14 +-
 drivers/gpu/drm/imx/dc/dc-ic.c                     |   6 +-
 drivers/gpu/drm/mcde/mcde_dsi.c                    |   3 +
 drivers/gpu/drm/mediatek/mtk_dpi.c                 |  10 +-
 drivers/gpu/drm/msm/dsi/dsi_manager.c              |  13 +-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fbsr.c |   1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c |  39 +++-
 drivers/gpu/drm/nouveau/nvkm/subdev/instmem/priv.h |   1 +
 drivers/gpu/drm/omapdrm/dss/dpi.c                  |  14 +-
 drivers/gpu/drm/omapdrm/dss/dsi.c                  |  14 +-
 drivers/gpu/drm/omapdrm/dss/sdi.c                  |  14 +-
 drivers/gpu/drm/omapdrm/dss/venc.c                 |  14 +-
 drivers/gpu/drm/panel/panel-novatek-nt37801.c      | 106 ++++-----
 drivers/gpu/drm/panel/panel-samsung-s6d16d0.c      |  10 +-
 drivers/gpu/drm/panfrost/panfrost_drv.c            |   1 +
 drivers/gpu/drm/panthor/panthor_sched.c            |   1 -
 drivers/gpu/drm/qxl/qxl_display.c                  |  12 +-
 drivers/gpu/drm/sti/sti_dvo.c                      |  20 +-
 drivers/gpu/drm/sti/sti_hda.c                      |  20 +-
 drivers/gpu/drm/sti/sti_hdmi.c                     |  20 +-
 drivers/gpu/drm/tests/drm_bridge_test.c            | 106 +--------
 drivers/gpu/drm/xe/xe_pt.c                         |   2 +-
 drivers/gpu/drm/xe/xe_svm.c                        |  66 ++++--
 drivers/gpu/drm/xe/xe_svm.h                        |  14 +-
 drivers/gpu/drm/xe/xe_userptr.c                    |   5 +-
 include/drm/drm_bridge.h                           | 114 +---------
 include/drm/drm_gpusvm.h                           |  67 ++++--
 63 files changed, 726 insertions(+), 616 deletions(-)

--xgbvgquebhi7dsp5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaliK0AAKCRAnX84Zoj2+
dlGlAYCxmbUnS1ujvf+N9Fh5uxx5vSyItFNKCRvR5C1vabfMYHox6Ry5ay66iTVk
8rqH5ccBgJHZii5DHfyyWdM/IPUefYaNx0wJmsgUha8lax/h+VWJqmF0kU4EI7Bm
j2BZpgXaFw==
=eEnH
-----END PGP SIGNATURE-----

--xgbvgquebhi7dsp5--

