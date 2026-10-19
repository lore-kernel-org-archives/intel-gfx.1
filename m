Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6651D606A319
	for <intel-gfx@archiver.kernel.org>; Mon, 19 Oct 2026 17:48:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5C0B10EA96;
	Mon, 19 Oct 2026 17:48:19 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB1BB10E192;
 Mon, 19 Oct 2026 17:48:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_drm=3A_Move_drawing_to_pi?=
 =?utf-8?q?xel-helper_module?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Thomas Zimmermann" <tzimmermann@suse.de>
Cc: intel-gfx@lists.freedesktop.org
Date: Mon, 19 Oct 2026 17:48:18 -0000
Message-ID: <179243209895.42646.2410191204330948463@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261019154612.777074-1-tzimmermann@suse.de>
In-Reply-To: <20261019154612.777074-1-tzimmermann@suse.de>
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

Series: drm: Move drawing to pixel-helper module
URL   : https://patchwork.freedesktop.org/series/176408/
State : failure

== Summary ==

Error: make failed
  DESCEND objtool
  HDRTEST drivers/gpu/drm/xe/generated/xe_wa_oob.h
  HDRTEST drivers/gpu/drm/xe/generated/xe_device_wa_oob.h
  MODPOST Module.symvers
ERROR: modpost: drivers/gpu/drm/tests/drm_panic_helper_test.ko: symbol 'drm_panic_helper_clear_description' undefined!
ERROR: modpost: drivers/gpu/drm/tests/drm_panic_helper_test.ko: symbol 'drm_panic_helper_set_description' undefined!
ERROR: modpost: drivers/gpu/drm/tests/drm_panic_helper_test.ko: symbol 'drm_panic_helper_draw_screen_kmsg' undefined!
ERROR: modpost: drivers/gpu/drm/tests/drm_panic_helper_test.ko: symbol 'drm_panic_helper_draw_screen_user' undefined!
make[2]: *** [scripts/Makefile.modpost:147: Module.symvers] Error 1
make[1]: *** [/home/kbuild2/kernel/Makefile:2179: modpost] Error 2
make: *** [Makefile:248: __sub-make] Error 2
Build failed, no error log produced


