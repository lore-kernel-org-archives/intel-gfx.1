Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BAAD606A325
	for <intel-gfx@archiver.kernel.org>; Thu, 19 Nov 2026 23:49:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2928A1127CC;
	Thu, 19 Nov 2026 23:49:56 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DFDA1127CC;
 Thu, 19 Nov 2026 23:49:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_Add_support_for_a_DRM_bac?=
 =?utf-8?q?klight_capability_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mario Limonciello" <mario.limonciello@amd.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Thu, 19 Nov 2026 23:49:54 -0000
Message-ID: <179513219437.55409.13114840802001806432@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261119-superm1-backlight-property-v12-0-89d5217d3618@amd.com>
In-Reply-To: <20261119-superm1-backlight-property-v12-0-89d5217d3618@amd.com>
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-gfx@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

== Series Details ==

Series: Add support for a DRM backlight capability (rev7)
URL   : https://patchwork.freedesktop.org/series/169109/
State : failure

== Summary ==

Error: make failed
  DESCEND objtool
  AR      drivers/gpu/drm/renesas/rcar-du/built-in.a
  AR      drivers/gpu/drm/renesas/rz-du/built-in.a
  AR      drivers/gpu/drm/renesas/built-in.a
  AR      drivers/gpu/drm/omapdrm/built-in.a
  AR      drivers/gpu/drm/tilcdc/built-in.a
  AR      drivers/gpu/drm/imx/built-in.a
  AR      drivers/gpu/drm/panel/built-in.a
  CC [M]  drivers/gpu/drm/panel/panel-auo-a030jtn01.o
  CC [M]  drivers/gpu/drm/panel/panel-ilitek-ili9341.o
  CC [M]  drivers/gpu/drm/panel/panel-orisetech-ota5601a.o
  CC [M]  drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.o
  CC [M]  drivers/gpu/drm/panel/panel-widechips-ws2401.o
  AR      drivers/gpu/drm/bridge/analogix/built-in.a
  AR      drivers/gpu/drm/bridge/cadence/built-in.a
  AR      drivers/gpu/drm/bridge/imx/built-in.a
  AR      drivers/gpu/drm/bridge/synopsys/built-in.a
  AR      drivers/gpu/drm/bridge/built-in.a
  CC [M]  drivers/gpu/drm/bridge/tda998x_drv.o
  LD [M]  drivers/gpu/drm/bridge/tda998x.o
  AR      drivers/gpu/drm/hisilicon/built-in.a
  AR      drivers/gpu/drm/mxsfb/built-in.a
  CC      drivers/gpu/drm/sysfb/drm_sysfb.o
  CC      drivers/gpu/drm/sysfb/drm_sysfb_modeset.o
  CC      drivers/gpu/drm/sysfb/drm_sysfb_screen_info.o
  CC      drivers/gpu/drm/sysfb/simpledrm.o
  AR      drivers/gpu/drm/sysfb/built-in.a
  AR      drivers/gpu/drm/tiny/built-in.a
  CC [M]  drivers/gpu/drm/tiny/bochs.o
  CC [M]  drivers/gpu/drm/tiny/cirrus-qemu.o
  CC [M]  drivers/gpu/drm/tiny/gm12u320.o
  CC [M]  drivers/gpu/drm/tiny/panel-mipi-dbi.o
  CC [M]  drivers/gpu/drm/tiny/hx8357d.o
  CC [M]  drivers/gpu/drm/tiny/ili9163.o
  CC [M]  drivers/gpu/drm/tiny/ili9225.o
  CC [M]  drivers/gpu/drm/tiny/ili9341.o
  CC [M]  drivers/gpu/drm/tiny/ili9486.o
  CC [M]  drivers/gpu/drm/tiny/mi0283qt.o
  CC [M]  drivers/gpu/drm/tiny/repaper.o
  AR      drivers/gpu/drm/xen/built-in.a
  CC [M]  drivers/gpu/drm/xen/xen_drm_front.o
  CC [M]  drivers/gpu/drm/xen/xen_drm_front_kms.o
  CC [M]  drivers/gpu/drm/xen/xen_drm_front_conn.o
  CC [M]  drivers/gpu/drm/xen/xen_drm_front_evtchnl.o
  CC [M]  drivers/gpu/drm/xen/xen_drm_front_cfg.o
  CC [M]  drivers/gpu/drm/xen/xen_drm_front_gem.o
  LD [M]  drivers/gpu/drm/xen/drm_xen_front.o
  AR      drivers/gpu/drm/xlnx/built-in.a
  AR      drivers/gpu/drm/gud/built-in.a
  CC [M]  drivers/gpu/drm/gud/gud_drv.o
  CC [M]  drivers/gpu/drm/gud/gud_pipe.o
  CC [M]  drivers/gpu/drm/gud/gud_connector.o
  LD [M]  drivers/gpu/drm/gud/gud.o
  AR      drivers/gpu/drm/sitronix/built-in.a
  AR      drivers/gpu/drm/solomon/built-in.a
  CC [M]  drivers/gpu/drm/solomon/ssd130x.o
  CC [M]  drivers/gpu/drm/solomon/ssd130x-i2c.o
  CC [M]  drivers/gpu/drm/solomon/ssd130x-spi.o
  CC [M]  drivers/gpu/drm/tests/drm_connector_test.o
drivers/gpu/drm/tests/drm_connector_test.c: In function ‘drm_test_connector_attach_luminance_property’:
drivers/gpu/drm/tests/drm_connector_test.c:162:9: error: implicit declaration of function ‘drm_atomic_helper_connector_reset’; did you mean ‘drm_atomic_helper_connector_tv_check’? [-Werror=implicit-function-declaration]
  162 |         drm_atomic_helper_connector_reset(connector);
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |         drm_atomic_helper_connector_tv_check
cc1: some warnings being treated as errors
make[6]: *** [scripts/Makefile.build:290: drivers/gpu/drm/tests/drm_connector_test.o] Error 1
make[5]: *** [scripts/Makefile.build:572: drivers/gpu/drm/tests] Error 2
make[4]: *** [scripts/Makefile.build:572: drivers/gpu/drm] Error 2
make[3]: *** [scripts/Makefile.build:572: drivers/gpu] Error 2
make[2]: *** [scripts/Makefile.build:572: drivers] Error 2
make[1]: *** [/home/kbuild2/kernel/Makefile:2244: .] Error 2
make: *** [Makefile:248: __sub-make] Error 2
Build failed, no error log produced


