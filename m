Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1203CC5DF85
	for <intel-gfx@archiver.kernel.org>; Thu, 20 Aug 2026 17:49:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5F3810F159;
	Thu, 20 Aug 2026 17:49:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="W7Q+5i6t";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E03C510F161
 for <intel-gfx@lists.freedesktop.org>; Thu, 20 Aug 2026 17:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1787248189;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6+qiRA0Rr68w6luARuut3h/5z5IL9+5qPOnuZ1Bth1E=;
 b=W7Q+5i6t9I5hEa6HgC7mnRVc54ZPY8ZOA9Z+qYtAWbKFlyuqNGTmuXLgJr6pfP0+Zvw4Hu
 +MX74cV+Uhn1f7BRlAFU2GXSOHhF+V8Ee1HuBPuFGq40qemE71311pbx0y13k7g7IjZnHY
 WpcfmdabFN+rVc6mpxr12M/6YUocRwY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-141-t-mnn-e-O2-wOq4pgmiXkg-1; Thu, 20 Aug 2026 13:49:41 -0400
X-MC-Unique: t-mnn-e-O2-wOq4pgmiXkg-1
X-Mimecast-MFC-AGG-ID: t-mnn-e-O2-wOq4pgmiXkg_1787248181
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-47f81362fb1so99836f8f.1
 for <intel-gfx@lists.freedesktop.org>; Thu, 20 Aug 2026 10:49:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787248180; x=1787852980;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=6+qiRA0Rr68w6luARuut3h/5z5IL9+5qPOnuZ1Bth1E=;
 b=oaNg9/PylIZJhbWMUxaen/WLiaYWfFfuPERHhKKA7M+5Ls23IkRtnSNJQDeCzOdfJs
 qR/GzwNtMbEP0U6VCZU1Z8NPwCTr40Togh3+CLKCgAEFfAf0Rs3pvHyPlubG7CsOwg+F
 OlEM1EvoGz+nxMoscQQ8WpnKEWEzJXbyxqtg5+Fm+sItbJq+XOG9DZPBXNt4Ni1SnWN4
 toVGgL3rIBdhPoyjFRwx64/ZeHBLA1Zm8OzSrCZ5dqUiHnGsqrnnm42nTy+xwMwEq+3D
 2FZvln1qNg/YuxlcgJFnAERMj4tqw+wYfDteaJzMLSPiqc7U3E/GolGH2SVMcPGIm2Vh
 4IXg==
X-Forwarded-Encrypted: i=1;
 AHgh+RrZ4loNMyKxg7U1htsQzpP225MAoHeUl/ceQHqgkDzJyofuXKhGG5LrwZX58AxKqsGk2GFe20SQjBk=@lists.freedesktop.org
X-Gm-Message-State: AFuF++ngm9/rKq581io3xFv14vaIqPumr/I7/VLq2Cju6V95Qqb/SM//
 xWgRuN66ZXERiRmo1gdxHnpD1TjPoTRRaI5bO5GLMvfcWy5ESoC8tYgStlyfDQVGkA6KnWg+KOB
 jeJUsdMg82G2vHi72BEUqOraXbfuXfB8gQt+za9sZ1hz1+F9jL29qD/SkWSlFcExrtixJpQ==
X-Gm-Gg: AR+sD12z/S/V0GyUyCfCxQzJBdRMlOGGE0xA5Lpr9L2fXnmRnBCbq/E1XqWG+nh0XBX
 TaIbDna5Bwb+T/QJ5uDFZg3dYH22FAxQewiUDp22kfO7jZ7xi+Uq+4xuzNdBToGPLXlEukiX2UH
 8j3BwOO+CcNJgIJMBntLn4XL42Hkjc3Onhyr4/mKKcOEzOX3JzSRb7ZNbEMS4wvLPRhN6+buX25
 xh7pdv0QMhGML5z0HkhvDCz+FQKEpkVV2Pash1qDIHYnEX6OzZ8VkrBy9VR1BcK/hDW28/ZpssY
 z8MCD3IhE8t1/22GLZGAfCLGdmHErRX9qsUeSjkM1UCEW5pXP7vQlu30u3Ccgt+EaPfaEfcbrKu
 AIXbP+0hSjGrZ16bXIrzdoqg4mmrCSQle7c0F6+f+sXlxeg==
X-Received: by 2002:a05:6000:184e:b0:47f:f339:556c with SMTP id
 ffacd0b85a97d-482c0b4a40dmr705162f8f.2.1787248180694; 
 Thu, 20 Aug 2026 10:49:40 -0700 (PDT)
X-Received: by 2002:a05:6000:184e:b0:47f:f339:556c with SMTP id
 ffacd0b85a97d-482c0b4a40dmr705081f8f.2.1787248180291; 
 Thu, 20 Aug 2026 10:49:40 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:11aa:87f0:935:4f8e:b423:64eb?
 ([2a01:e0a:11aa:87f0:935:4f8e:b423:64eb])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482b145d31bsm13853815f8f.16.2026.08.20.10.49.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Aug 2026 10:49:39 -0700 (PDT)
Message-ID: <e4da5ba4-9a02-4080-9a83-19d401017910@redhat.com>
Date: Thu, 20 Aug 2026 19:49:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/12] drm/panic: Split into core and helpers
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-hyperv@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, nouveau@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, virtualization@lists.linux.dev,
 sashiko-reviews@lists.linux.dev
References: <20260818125012.468092-1-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20260818125012.468092-1-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cxbuPcXYM-lrW05NuaaKVfGxy0sSjlkH3DIaeJtubkU_1787248181
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 18/08/2026 14:27, Thomas Zimmermann wrote:
> Split DRM's current panic handling into a core and a helper module.
> The core is still part of DRM's core library. The panic helpers are
> part of DRM's KMS helper module (for now).
> 
> The motivation behind this series is to get panic handling's drawing
> code out of the DRM core. At some point it should share a single
> module with DRM's other drawing and format conversion.
> 
> With the series applied, panic hanlding follows DRM's established
> design pattern of having a DRM core interface with an dedicated
> implementation in each driver. Drivers share common code in helper
> modules. For panic handling, the DRM core still contains the panic
> entry points, the parameters and the debugfs interface. All drawing
> is now located in the panic helpers.
> 
> Patches 1 to 4 improve several issues in the current panic code. It
> makes sense to fix them before moving the core around.
> 
> Patches 5 to 8 put handling of all panic state and locking into a
> single place, drm_panic_display_panic_screen(). It is maintained by
> panic handling's DRM core code. This also enables the test cases to
> work more independently from the kernel's configuration.
> 
> Patches 9 to 11 split the panic-handling code into the core and panic
> helpers. The former maintain all state, locking and public interfaces.
> The latter handles drawing and details of the involved framebuffers.
> 
> DRM devices that offer panic handling provide a single callback, struct
> drm_plane_funcs.display_panic_screen. A new initializer macro makes it
> point to the existing panic-drawing implementation. Hence there's no
> change in features or functionality. If panic handling is configured
> off, it all clears out to NULL.
> 
> Patch 12 reworks the test cases slighly, so that they can be build as
> a separate module. Do 'modprobe drm_panic_helper_test' to run them.
> 
> Tested under bochs with debugfs and test cases.

Overall the series looks good to me, and I like the split between the 
helper and the core.
I would just drop the first two patches, as I don't see much difference 
between static allocation or kmalloc() at init, and I think that 
memset() the buffers to 0 is not useful in this case.

Best regards,

-- 

Jocelyn
> 
> Future directions:
> 
> - Panic handling shares some drawing code with format conversion and
> clients. There's even more drawing code in vkms. Later series' can
> attempt to unify and harmonize all these implementations in a single
> draw module.
> 
> - The drawing helper drm_plane_helper_display_panic_screen() still
> implements various access schemes (map, set_pixel, memcpy) in a single
> function. It could be split up into specifialized helpers.
> 
> - If we ever need a driver-specific helper, it is now possible to
> implement a custom version of display_panic_screen.
> 
> Thomas Zimmermann (12):
>    drm/panic: Allocate QR-code buffers statically
>    drm/panic: Make allocation of zlib workspace more robust
>    drm/panic: Return -EINVAL if font is not available
>    drm/panic: Return errno codes if panic output fails
>    drm/panic: Pass colors to draw_panic_dispatch()
>    drm/panic: Pass global module parameters to drm_panic_dispatch()
>    drm/panic: Retry in dispatch function if panic output fails
>    drm/panic: Split draw_panic_plane()
>    drm/panic: Display panic screen via per-plane callback
>    drm/panic: Internalize panic locking in DRM core and helpers
>    drm/panic: Move panic display code into helper library
>    drm/panic: Compile KUnit tests as module
> 
>   Documentation/gpu/drm-kms-helpers.rst         |  11 +-
>   Documentation/gpu/drm-kms.rst                 |   3 +
>   MAINTAINERS                                   |  11 +-
>   drivers/gpu/drm/Kconfig                       |   5 +
>   drivers/gpu/drm/Kconfig.debug                 |   1 +
>   drivers/gpu/drm/Makefile                      |   3 +-
>   .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   |   2 +
>   drivers/gpu/drm/ast/ast_mode.c                |   2 +
>   drivers/gpu/drm/drm_atomic_helper.c           |   2 +-
>   drivers/gpu/drm/drm_crtc_internal.h           |   2 -
>   drivers/gpu/drm/drm_drv.c                     |   3 +-
>   drivers/gpu/drm/drm_kms_helper_common.c       |  14 +
>   drivers/gpu/drm/drm_panic.c                   | 914 +----------------
>   drivers/gpu/drm/drm_panic_helper.c            | 915 ++++++++++++++++++
>   ...drm_panic_qr.rs => drm_panic_helper_qr.rs} |   4 +-
>   drivers/gpu/drm/drm_panic_internal.h          |  59 ++
>   drivers/gpu/drm/hyperv/hyperv_drm_modeset.c   |   2 +
>   drivers/gpu/drm/i915/display/i9xx_plane.c     |   3 +
>   .../drm/i915/display/skl_universal_plane.c    |   4 +
>   drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c       |   2 +
>   drivers/gpu/drm/mgag200/mgag200_drv.h         |   4 +-
>   drivers/gpu/drm/nouveau/dispnv50/wndw.c       |   2 +
>   .../gpu/drm/renesas/rcar-du/rcar_du_plane.c   |   2 +
>   .../drm/renesas/shmobile/shmob_drm_plane.c    |   2 +
>   drivers/gpu/drm/sysfb/drm_sysfb_helper.h      |   4 +-
>   drivers/gpu/drm/sysfb/vesadrm.c               |   1 +
>   drivers/gpu/drm/tests/Makefile                |   1 +
>   ...m_panic_test.c => drm_panic_helper_test.c} |  65 +-
>   drivers/gpu/drm/tidss/tidss_plane.c           |   2 +
>   drivers/gpu/drm/tiny/bochs.c                  |   4 +-
>   drivers/gpu/drm/virtio/virtgpu_plane.c        |   2 +
>   include/drm/drm_mode_config.h                 |   4 +-
>   include/drm/drm_modeset_helper_vtables.h      |  11 +-
>   include/drm/drm_panic.h                       | 117 +--
>   include/drm/drm_panic_helper.h                |  40 +
>   include/drm/drm_plane.h                       |  57 ++
>   rust/bindings/bindings_helper.h               |   4 +-
>   37 files changed, 1253 insertions(+), 1031 deletions(-)
>   create mode 100644 drivers/gpu/drm/drm_panic_helper.c
>   rename drivers/gpu/drm/{drm_panic_qr.rs => drm_panic_helper_qr.rs} (99%)
>   create mode 100644 drivers/gpu/drm/drm_panic_internal.h
>   rename drivers/gpu/drm/tests/{drm_panic_test.c => drm_panic_helper_test.c} (80%)
>   create mode 100644 include/drm/drm_panic_helper.h
> 
> 
> base-commit: dc462ab791b686c48545c160ecc81be64f77a846
> prerequisite-patch-id: c67e5d886a47b7d0266d81100837557fda34cb24
> prerequisite-patch-id: a5a973e527c88a5b47053d7a72aefe0b550197cb
> prerequisite-patch-id: b9adc9622920a3e70168e672c2c92795b3e3a106
> prerequisite-patch-id: 5030de433a01c2e99056cadb676a8e2ba35f055a

