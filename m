Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34BF3C5DF7D
	for <intel-gfx@archiver.kernel.org>; Tue, 18 Aug 2026 13:28:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C148710EB72;
	Tue, 18 Aug 2026 13:28:06 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A12410EB71;
 Tue, 18 Aug 2026 13:28:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_drm/panic=3A_Split_into_c?=
 =?utf-8?q?ore_and_helpers?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Thomas Zimmermann" <tzimmermann@suse.de>
Cc: intel-gfx@lists.freedesktop.org
Date: Tue, 18 Aug 2026 13:28:06 -0000
Message-ID: <178705968603.63368.3304861395736323933@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260818125012.468092-1-tzimmermann@suse.de>
In-Reply-To: <20260818125012.468092-1-tzimmermann@suse.de>
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

Series: drm/panic: Split into core and helpers
URL   : https://patchwork.freedesktop.org/series/172395/
State : failure

== Summary ==

Error: make failed
  DESCEND objtool
  HDRTEST drivers/gpu/drm/xe/generated/xe_wa_oob.h
  HDRTEST drivers/gpu/drm/xe/generated/xe_device_wa_oob.h
  UPD     include/generated/utsversion.h
  CC      init/version-timestamp.o
  KSYMS   .tmp_vmlinux0.kallsyms.S
  AS      .tmp_vmlinux0.kallsyms.o
  LD      .tmp_vmlinux1
ld: vmlinux.o: in function `drm_panic_helper_fill':
/home/kbuild/kernel/drivers/gpu/drm/drm_panic_helper.c:347:(.text+0xf7d499): undefined reference to `drm_draw_fill16'
ld: /home/kbuild/kernel/drivers/gpu/drm/drm_panic_helper.c:355:(.text+0xf7d561): undefined reference to `drm_draw_fill32'
ld: /home/kbuild/kernel/drivers/gpu/drm/drm_panic_helper.c:351:(.text+0xf7d582): undefined reference to `drm_draw_fill24'
ld: vmlinux.o: in function `drm_panic_helper_blit':
/home/kbuild/kernel/drivers/gpu/drm/drm_panic_helper.c:258:(.text+0xf7da6c): undefined reference to `drm_draw_blit16'
ld: /home/kbuild/kernel/drivers/gpu/drm/drm_panic_helper.c:266:(.text+0xf7dae6): undefined reference to `drm_draw_blit32'
ld: /home/kbuild/kernel/drivers/gpu/drm/drm_panic_helper.c:262:(.text+0xf7db0a): undefined reference to `drm_draw_blit24'
ld: vmlinux.o: in function `drm_panic_helper_draw_screen_user':
/home/kbuild/kernel/drivers/gpu/drm/drm_panic_helper.c:446:(.text+0xf7dbc1): undefined reference to `drm_draw_color_from_xrgb8888'
ld: /home/kbuild/kernel/drivers/gpu/drm/drm_panic_helper.c:447:(.text+0xf7dbd3): undefined reference to `drm_draw_color_from_xrgb8888'
ld: vmlinux.o: in function `drm_panic_helper_draw_screen_kmsg':
/home/kbuild/kernel/drivers/gpu/drm/drm_panic_helper.c:522:(.text+0xf7de3e): undefined reference to `drm_draw_color_from_xrgb8888'
ld: /home/kbuild/kernel/drivers/gpu/drm/drm_panic_helper.c:523:(.text+0xf7de50): undefined reference to `drm_draw_color_from_xrgb8888'
ld: vmlinux.o: in function `drm_panic_helper_format_is_supported':
/home/kbuild/kernel/drivers/gpu/drm/drm_panic_helper.c:791:(.text+0xf7e1d2): undefined reference to `drm_draw_can_convert_from_xrgb8888'
make[2]: *** [scripts/Makefile.vmlinux:72: vmlinux.unstripped] Error 1
make[1]: *** [/home/kbuild/kernel/Makefile:1370: vmlinux] Error 2
make: *** [Makefile:248: __sub-make] Error 2
Build failed, no error log produced


