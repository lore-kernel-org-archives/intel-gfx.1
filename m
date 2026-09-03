Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 341BEC61DD3
	for <intel-gfx@archiver.kernel.org>; Thu,  3 Sep 2026 09:27:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F400B10F492;
	Thu,  3 Sep 2026 09:27:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="fC8K1UXn";
	dkim=pass (2048-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="oww1589W";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4DA910F492
 for <intel-gfx@lists.freedesktop.org>; Thu,  3 Sep 2026 09:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1788427644;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=8u3TQg2cJAtoRCxT2xuz7Ezo38KqT0GhTI8HzDj8NjM=;
 b=fC8K1UXngxo5r9Apg5I0dXuK2zDsL8Ezet0WS/wJkhpXrczoAFizhZIGovnyFc9RkmxHkM
 LvxJWwmr6nvqYPDIpa4R3ULOP14tAgbHeFJ2mlPQoD+t+0oVn7gq+03UIKwWbRz4Chf/jw
 qwaa34yAWT6hAWTjsXM7mUBqyKWNqdM=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-190-hzbGehh7OzG2Yacwr7O7Hw-1; Thu, 03 Sep 2026 05:27:22 -0400
X-MC-Unique: hzbGehh7OzG2Yacwr7O7Hw-1
X-Mimecast-MFC-AGG-ID: hzbGehh7OzG2Yacwr7O7Hw_1788427642
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-52ffe24490bso51903691cf.1
 for <intel-gfx@lists.freedesktop.org>; Thu, 03 Sep 2026 02:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; s=google; t=1788427642; x=1789032442; darn=lists.freedesktop.org;
 h=content-disposition:content-type:mime-version:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=8u3TQg2cJAtoRCxT2xuz7Ezo38KqT0GhTI8HzDj8NjM=;
 b=oww1589WvJFWBdKqPWaPVhtSC/JwvbMRdkUnG5E51QmjT9byRtYhZYLftUBy4TudvD
 1PbecLlhVCN4XO8AjK5Og0P/gAOl1Wfe6/j1Oi4xtXKx7BUZd1pMggnTzcMW0RotZqZE
 DX4Vm+LSEGVLRJHkR/NOvmr0TE1XVSBhGHeQ37F3jAjZ47b+MN5j4q/+k0mVD68DZmAX
 /kzF/7zx5ssGjLMi16zMkKMriIOWIrdumLCdCkoE+rxqHshSuphkD9s/QRTv1fDwApri
 /ilqdpRgjJSW+LBCSvF126hSmrBVAjLcid2UH6CiHrimpzYtRTcqCvuIlI677IExEzm6
 pkZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788427642; x=1789032442;
 h=content-disposition:content-type:mime-version:message-id:subject:cc
 :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=8u3TQg2cJAtoRCxT2xuz7Ezo38KqT0GhTI8HzDj8NjM=;
 b=HA/1rv/5WoiaiQPjaGUJN0JxXrT6ODSHDimTUYKTaUQ25yiOlfTFxaUicmcgdQAb/8
 02TrtHHhKPaX9AF+BIpmJmiI87MQ60WBwMsO42F+iF8zx+p1hI7XSI6cz/4a/fxKrpwr
 48DOYrahasbE3bCNUwP4N53Rf50CQOTP0md0cwqAVEQ3Mg4BNiGe1rDWyZSXhSQX0jvl
 xRxYUrxLN2M+IaPmZFDtkOWYok60c/rHUYBffZNS5SVhhso//oniowiMZC4prbeYhisP
 X2whmBcRUOalZ3O/qqyWbBQm2g77KbFUoBdEn4aCNvlwakrMZWbXcXjs3xfTRD5UUQLf
 a5LA==
X-Forwarded-Encrypted: i=1;
 AKwUvByrQUhEuXGxudsRKKjqkakv9X0E0f3ehSWzGA267cn5WDmRfiYe0Fc71RNWGYGlD8aOneGO18GlEbw=@lists.freedesktop.org
X-Gm-Message-State: AFuF++kSSwQCP+jKMDvwEegSKpcQ0CPqVNNGNuoUy8uBFZxvDteJcZW3
 +FwDBjVin5hYXIe0ENGMOYpZe2hPN8ZAxBr8EOcb8Wc/BarP9ygqVSpJXXovKM9UXTvvueItAoY
 I88EC7+OKvo3zFrPd13GxOinReVi4skVbnNZ7boLZ9zm8OhkkJTWrItzdd+1ldOCGRfNKFg==
X-Gm-Gg: AYBFou1wG3dqaJaNDuMzx6W+oS0CSxDahXbC/AmUrAZPMM09CGcBgvbEuJ2t/0Cm63/
 1kUX/vWWDkqLQS6O01LnN2gKWz/mX8oK8kViwOpb0KVOebfWbbHS4t24ZvMNXh7r359Y1vo+mjQ
 lyHbp86Ak0MpQ6HMSrzcxoMj2qJhaMwptARf0GZPU5+ePOUF8JrPgBu6zAuR0BZlsXbHi6ia0Yz
 wfeIZcuNXTvMqMx0HS447eD7I4+jriI71auLlbKEsxVzqbQtgduinkN1VeX21MVdMUpdEX4UHuk
 ADgKVuPDPew8DdO3XjqunRM8p6RhD0cA/kvucFkDGGOGD4VAHDTC/HM2FbX5n1jdJKjWAndk
X-Received: by 2002:ac8:5e10:0:b0:52f:b0f9:e4f2 with SMTP id
 d75a77b69052e-53036b97d24mr121395121cf.1.1788427641604; 
 Thu, 03 Sep 2026 02:27:21 -0700 (PDT)
X-Received: by 2002:ac8:5e10:0:b0:52f:b0f9:e4f2 with SMTP id
 d75a77b69052e-53036b97d24mr121393341cf.1.1788427638874; 
 Thu, 03 Sep 2026 02:27:18 -0700 (PDT)
Received: from localhost ([193.32.126.212]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-530332453a7sm38051241cf.26.2026.09.03.02.27.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2026 02:27:18 -0700 (PDT)
Date: Thu, 3 Sep 2026 11:27:15 +0200
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
Message-ID: <apk9X5SkRLS9g4RF@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="t7h3iiiww7yymmtc"
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


--t7h3iiiww7yymmtc
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: [PULL] drm-misc-fixes
MIME-Version: 1.0

Hi Dave, Sima,

Here's this week drm-misc-fixes PR

Maxime

drm-misc-fixes-2026-09-03:
A whole bunch of fixes for various drivers

- Fix drm_crtc_commit leak when PAGE_FLIP_EVENT is used,
- amd: plane blend mode fixes
- amdxdna: out-of-bounds access fix, reject commands chains with no
  commands, handle chained mapping BO failures, refuse to flush an
  imported BO
- atomic-state-helpers: set pixel_blend_mode to prop default on reset
- dma-buf: Publish the dma-buf only after copy_to_user succeeds, fix
  some kernel-doc warnings
- ethosu: handle mmio mapping failures, handle storage modes only on
  hardware that supports it, fix job completion fence cleanup
- fastrpc: Publish the dma-buf only after copy_to_user succeeds
- gud: Improve TV modes and rotation handling
- nouveau: use-after-free fixes, add scanline position support, HDMI
  and DP fixes, null pointer dereference fix, dmem accounting fixes for
  large folios, use write-combined maps for coherent
- pagemap: Prevent double migration of device pages, Reset migration
  page count on eviction retry, dma-unmap pages before handling
  migration errors, use after free fixes
- prime: fix prime exports tracing
- qaic: out-of-bounds access fix
- sysfb: Fix integer overflow, fix constant comparison bug
- tegra: Add blend mode properties
- virtio: exit path and error handling fixes
The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-fixes-2026-09-03

for you to fetch changes up to d3609b540838945ab2ca5b65f32a2eb67bb284c8:

  MAINTAINERS, mailmap: use Aditya Garg's linux.dev account (2026-09-03 09:44:40 +0200)

----------------------------------------------------------------
A whole bunch of fixes for various drivers

- Fix drm_crtc_commit leak when PAGE_FLIP_EVENT is used,
- amd: plane blend mode fixes
- amdxdna: out-of-bounds access fix, reject commands chains with no
  commands, handle chained mapping BO failures, refuse to flush an
  imported BO
- atomic-state-helpers: set pixel_blend_mode to prop default on reset
- dma-buf: Publish the dma-buf only after copy_to_user succeeds, fix
  some kernel-doc warnings
- ethosu: handle mmio mapping failures, handle storage modes only on
  hardware that supports it, fix job completion fence cleanup
- fastrpc: Publish the dma-buf only after copy_to_user succeeds
- gud: Improve TV modes and rotation handling
- nouveau: use-after-free fixes, add scanline position support, HDMI
  and DP fixes, null pointer dereference fix, dmem accounting fixes for
  large folios, use write-combined maps for coherent
- pagemap: Prevent double migration of device pages, Reset migration
  page count on eviction retry, dma-unmap pages before handling
  migration errors, use after free fixes
- prime: fix prime exports tracing
- qaic: out-of-bounds access fix
- sysfb: Fix integer overflow, fix constant comparison bug
- tegra: Add blend mode properties
- virtio: exit path and error handling fixes

----------------------------------------------------------------
Aditya Garg (1):
      MAINTAINERS, mailmap: use Aditya Garg's linux.dev account

Anuj Bolewar (1):
      drm/virtio: reclaim pending vbufs before tearing down vqs

Arvind Yadav (2):
      drm/pagemap: Prevent double migration of device pages
      drm/pagemap: Reset migration page count on eviction retry

Baineng Shou (4):
      dma-buf: dma-heap: don't publish fd before copy_to_user() succeeds
      misc: fastrpc: don't publish fd before copy_to_user() succeeds
      drm/prime: use dma_buf_fd_install() to preserve export tracing
      selftests: dmabuf-heaps: add fd-leak-on-EFAULT regression test

Benjamin Leggett (1):
      drm/virtio: use the DMA API for resource backing on Xen

Dan Carpenter (1):
      drm/virtio: Fix a NULL vs ERR_PTR() bug in virtio_gpu_user_framebuffer_create()

Dave Airlie (1):
      nouveau/instmem: handle iomapping already existing

Deepanshu Kartikey (1):
      drm/gud: NUL-terminate TV mode names read from the device

Faith Ekstrand (1):
      drm/nouveau: Use write-combined maps for coherent

GuoHan Zhao (2):
      accel/ethosu: check MMIO mapping errors in probe
      accel/ethosu: fix job completion fence cleanup

Lizhi Hou (1):
      accel/amdxdna: Remove __counted_by from struct amdxdna_cmd_chain

Lyude Paul (1):
      drm/nouveau/disp/r535: Add scanline position support + head state support

Marek Czernohous (1):
      drm/nouveau: unsubscribe the channel-kill event before the fence context

Matthew Brost (2):
      drm/pagemap: dma-unmap pages before handling migration errors
      drm/pagemap: Fix folio allocation fallback and use-after-put

Maxime Ripard (1):
      Merge drm/drm-fixes into drm-misc-fixes

Melissa Wen (4):
      drm/atomic-state-helper: set pixel_blend_mode to prop default on reset
      drm/amd/display: fix missing blend-mode-prop warning for DCN
      drm/amd/display: advertise PIXEL_NONE and PREMULTI blend mode for DCE
      drm/amd/display: use plane color_mgmt_changed to track colorop changes

Mohamed Ahmed (8):
      drm/nouveau/disp: move GSP head-timing ISR and vblank helpers to tu102.c
      drm/nouveau/disp: move the GSP HDMI GCP AVMute write to engine/disp
      drm/nouveau/disp: route GSP-RM display MMIO through nvkm_disp_func hooks
      drm/nouveau/disp: fix HDMI vendor infoframes on GB20x
      drm/nouveau/disp: fix HDMI GCP AVMute register offsets on GB20x
      drm/nouveau/gsp: use per-version DP_CONFIG_STREAM params on r570 firmware
      drm/nouveau/disp: fix head state readback on GB20x
      drm/nouveau/gsp: fix vblank interrupts on GB20x

Randy Dunlap (1):
      dma-buf: fix some kernel-doc warnings

Sajal Gupta (1):
      drm/gud: validate GUD_ROTATION_0 is present in supported rotations

Shixiong Ou (2):
      drm/sysfb: ofdrm: Fix integer overflow in fb_size calculation
      drm/sysfb: ofdrm: Fix is_avivo() constant comparison bug

Slawomir Stepien (1):
      drm/cirrus-qemu: Validate BAR0 size during probe

Taimuraz Kaitmazov (4):
      accel/amdxdna: return early from a zero-length flush
      accel/amdxdna: reject a command chain that carries no commands
      accel/amdxdna: put the chained BO when its mapping fails
      accel/amdxdna: refuse to flush an imported BO

Tao Yu (1):
      drm/gud: validate TV mode names before creating enum property

Thadeu Lima de Souza Cascardo (2):
      drm/atomic: remove bogus check for file_priv
      drm: Fix drm_crtc_commit leak if signaled when PAGE_FLIP_EVENT is used

Thierry Reding (1):
      drm/tegra: Add blend mode properties

Thomas Zimmermann (1):
      Merge drm/drm-fixes into drm-misc-fixes

Tomeu Vizoso (1):
      accel: ethosu: Don't read the U65 rounding mode as a storage mode

Youssef Samir (1):
      accel/qaic: Address potential out-of-bounds read in resp_worker()

Zhenhao Wan (5):
      drm/nouveau/uvmm: fix NULL deref unwinding an OP_MAP_SPARSE op
      drm/nouveau/uvmm: fix premature region free on failed OP_UNMAP_SPARSE
      drm/nouveau/uvmm: clear the dirty flag when unwinding an OP_UNMAP_SPARSE
      drm/nouveau/dmem: fix mismatched DMA unmap size for large folios
      drm/nouveau/dmem: fix callocated underflow on large folio split

shechenglong (1):
      drm/virtio: check return value of vgdev_output_init()

 .mailmap                                           |   3 +-
 MAINTAINERS                                        |   2 +-
 drivers/accel/amdxdna/aie2_message.c               |   2 +-
 drivers/accel/amdxdna/amdxdna_ctx.c                |   4 +-
 drivers/accel/amdxdna/amdxdna_ctx.h                |   2 +-
 drivers/accel/amdxdna/amdxdna_gem.c                |  10 +-
 drivers/accel/ethosu/ethosu_drv.c                  |   2 +
 drivers/accel/ethosu/ethosu_gem.c                  |   2 +-
 drivers/accel/ethosu/ethosu_job.c                  |  10 +-
 drivers/accel/qaic/qaic_control.c                  |  46 ++--
 drivers/dma-buf/dma-buf.c                          |  20 ++
 drivers/dma-buf/dma-heap.c                         |  80 +++---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   6 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    |  31 ++-
 drivers/gpu/drm/drm_atomic_state_helper.c          |   7 +
 drivers/gpu/drm/drm_atomic_uapi.c                  |   5 +-
 drivers/gpu/drm/drm_pagemap.c                      | 270 ++++++++++++++++++---
 drivers/gpu/drm/drm_prime.c                        |   2 +-
 drivers/gpu/drm/gud/gud_connector.c                |  12 +-
 drivers/gpu/drm/gud/gud_drv.c                      |   2 +
 drivers/gpu/drm/nouveau/include/nvkm/engine/disp.h |   1 +
 drivers/gpu/drm/nouveau/nouveau_chan.c             |   9 +-
 drivers/gpu/drm/nouveau/nouveau_dmem.c             |  18 +-
 drivers/gpu/drm/nouveau/nouveau_sgdma.c            |   4 +-
 drivers/gpu/drm/nouveau/nouveau_uvmm.c             |   6 +-
 drivers/gpu/drm/nouveau/nvkm/engine/device/base.c  |  10 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/Kbuild    |   1 +
 drivers/gpu/drm/nouveau/nvkm/engine/disp/ga102.c   |  13 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/gb202.c   | 191 +++++++++++++++
 drivers/gpu/drm/nouveau/nvkm/engine/disp/head.h    |   2 +
 drivers/gpu/drm/nouveau/nvkm/engine/disp/ior.h     |   1 +
 drivers/gpu/drm/nouveau/nvkm/engine/disp/priv.h    |  17 ++
 drivers/gpu/drm/nouveau/nvkm/engine/disp/tu102.c   |  86 ++++++-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c | 125 ++++------
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/disp.c |  64 +++++
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c  |   9 +
 .../nouveau/nvkm/subdev/gsp/rm/r570/nvrm/disp.h    |   2 +
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h    |   5 +
 drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c |   3 +
 drivers/gpu/drm/sysfb/ofdrm.c                      |   8 +-
 drivers/gpu/drm/tegra/dc.c                         |   6 +
 drivers/gpu/drm/tegra/hub.c                        |   2 +
 drivers/gpu/drm/tiny/cirrus-qemu.c                 |   3 +
 drivers/gpu/drm/virtio/virtgpu_display.c           |   9 +-
 drivers/gpu/drm/virtio/virtgpu_drv.h               |  21 ++
 drivers/gpu/drm/virtio/virtgpu_kms.c               |   1 +
 drivers/gpu/drm/virtio/virtgpu_object.c            |   2 +-
 drivers/gpu/drm/virtio/virtgpu_vq.c                |  21 +-
 drivers/misc/fastrpc.c                             |  16 +-
 include/drm/drm_pagemap.h                          |   8 +-
 include/linux/dma-buf.h                            |   1 +
 include/linux/dma-fence-array.h                    |   1 -
 include/linux/dma-fence-chain.h                    |   9 +-
 tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c | 113 ++++++++-
 54 files changed, 1072 insertions(+), 234 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/gb202.c

--t7h3iiiww7yymmtc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCapk9cgAKCRAnX84Zoj2+
dqexAYDzmTqjyMwqtU8o1XlH+Q45NuZ27Sfm2VE95amPbBXMqRuHmvnvM31DyVyn
hXNopr8Bfj4lbBiaRN6/o6JkNJFW6HqZMmgcyRLZheOevYzZ4qmaBVWvs2jp5ImN
23ETeCuIHg==
=KIe9
-----END PGP SIGNATURE-----

--t7h3iiiww7yymmtc--

