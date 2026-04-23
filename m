Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C365FDEE29
	for <intel-gfx@archiver.kernel.org>; Thu, 23 Apr 2026 17:25:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 284D210E0C0;
	Thu, 23 Apr 2026 17:25:13 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 012EC10E0C0;
 Thu, 23 Apr 2026 17:25:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_drm/i915=3A_Introduce_=27?=
 =?utf-8?q?fb=5Fpin=27_parent_interface?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Thu, 23 Apr 2026 17:25:11 -0000
Message-ID: <177696511199.4335.10842850524167518315@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260423165346.20884-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20260423165346.20884-1-ville.syrjala@linux.intel.com>
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

Series: drm/i915: Introduce 'fb_pin' parent interface
URL   : https://patchwork.freedesktop.org/series/165376/
State : failure

== Summary ==

Error: make failed
  CALL    scripts/checksyscalls.sh
  DESCEND objtool
  INSTALL libsubcmd_headers
  CC [M]  drivers/gpu/drm/xe/display/xe_fb_pin.o
In file included from ./include/linux/string.h:386,
                 from ./include/linux/bitmap.h:13,
                 from ./include/linux/cpumask.h:11,
                 from ./arch/x86/include/asm/paravirt.h:19,
                 from ./arch/x86/include/asm/irqflags.h:102,
                 from ./include/linux/irqflags.h:18,
                 from ./include/linux/spinlock.h:59,
                 from ./include/linux/kref.h:16,
                 from ./include/drm/drm_gem.h:37,
                 from ./include/drm/ttm/ttm_bo.h:34,
                 from drivers/gpu/drm/xe/display/xe_fb_pin.c:7:
In function ‘memcmp’,
    inlined from ‘xe_fb_pin_reuse_vma’ at drivers/gpu/drm/xe/display/xe_fb_pin.c:484:7:
./include/linux/fortify-string.h:717:25: error: call to ‘__read_overflow’ declared with attribute error: detected read beyond size of object (1st parameter)
  717 |                         __read_overflow();
      |                         ^~~~~~~~~~~~~~~~~
./include/linux/fortify-string.h:719:25: error: call to ‘__read_overflow2’ declared with attribute error: detected read beyond size of object (2nd parameter)
  719 |                         __read_overflow2();
      |                         ^~~~~~~~~~~~~~~~~~
make[6]: *** [scripts/Makefile.build:289: drivers/gpu/drm/xe/display/xe_fb_pin.o] Error 1
make[5]: *** [scripts/Makefile.build:549: drivers/gpu/drm/xe] Error 2
make[4]: *** [scripts/Makefile.build:549: drivers/gpu/drm] Error 2
make[3]: *** [scripts/Makefile.build:549: drivers/gpu] Error 2
make[2]: *** [scripts/Makefile.build:549: drivers] Error 2
make[1]: *** [/home/kbuild2/kernel/Makefile:2105: .] Error 2
make: *** [Makefile:248: __sub-make] Error 2
Build failed, no error log produced


