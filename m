Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2B86E7717D
	for <intel-gfx@archiver.kernel.org>; Fri, 13 Dec 2024 14:25:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E71E10F035;
	Fri, 13 Dec 2024 14:25:27 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2562410F029;
 Fri, 13 Dec 2024 14:25:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_drm/amdgpu=3A_Use_device_?=
 =?utf-8?q?wedged_event?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Fri, 13 Dec 2024 14:25:27 -0000
Message-ID: <173409992714.2161794.15889801641658245081@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241212190909.28559-1-andrealmeid@igalia.com>
In-Reply-To: <20241212190909.28559-1-andrealmeid@igalia.com>
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
Reply-To: intel-gfx@lists.freedesktop.org
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/amdgpu: Use device wedged event
URL   : https://patchwork.freedesktop.org/series/142564/
State : failure

== Summary ==

Error: make failed
  CALL    scripts/checksyscalls.sh
  DESCEND objtool
  INSTALL libsubcmd_headers
  CC [M]  drivers/gpu/drm/amd/amdgpu/amdgpu_device.o
drivers/gpu/drm/amd/amdgpu/amdgpu_device.c: In function ‘amdgpu_device_gpu_recover’:
drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:6061:9: error: implicit declaration of function ‘drm_dev_wedged_event’ [-Werror=implicit-function-declaration]
 6061 |         drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE_RECOVERY_NONE);
      |         ^~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:6061:49: error: ‘DRM_WEDGE_RECOVERY_NONE’ undeclared (first use in this function); did you mean ‘DRM_MODE_ENCODER_NONE’?
 6061 |         drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE_RECOVERY_NONE);
      |                                                 ^~~~~~~~~~~~~~~~~~~~~~~
      |                                                 DRM_MODE_ENCODER_NONE
drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:6061:49: note: each undeclared identifier is reported only once for each function it appears in
cc1: some warnings being treated as errors
make[6]: *** [scripts/Makefile.build:194: drivers/gpu/drm/amd/amdgpu/amdgpu_device.o] Error 1
make[5]: *** [scripts/Makefile.build:440: drivers/gpu/drm/amd/amdgpu] Error 2
make[4]: *** [scripts/Makefile.build:440: drivers/gpu/drm] Error 2
make[3]: *** [scripts/Makefile.build:440: drivers/gpu] Error 2
make[2]: *** [scripts/Makefile.build:440: drivers] Error 2
make[1]: *** [/home/kbuild/kernel/Makefile:1989: .] Error 2
make: *** [Makefile:251: __sub-make] Error 2
Build failed, no error log produced


