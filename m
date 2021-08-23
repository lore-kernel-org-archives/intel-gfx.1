Return-Path: <SRS0=iWgT=NO=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3DB7C4338F
	for <intel-gfx@archiver.kernel.org>; Mon, 23 Aug 2021 03:58:38 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A5DC61250
	for <intel-gfx@archiver.kernel.org>; Mon, 23 Aug 2021 03:58:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7A5DC61250
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D76EE89DF9;
	Mon, 23 Aug 2021 03:58:37 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0DB3A89DED;
 Mon, 23 Aug 2021 03:58:37 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 054FCA77A5;
 Mon, 23 Aug 2021 03:58:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vandita Kulkarni" <vandita.kulkarni@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Mon, 23 Aug 2021 03:58:36 -0000
Message-ID: <162969111699.1909.2401237992872884801@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20210823032136.2564-1-vandita.kulkarni@intel.com>
In-Reply-To: <20210823032136.2564-1-vandita.kulkarni@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBF?=
 =?utf-8?q?nable_mipi_dsi_on_XELPD?=
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

Series: Enable mipi dsi on XELPD
URL   : https://patchwork.freedesktop.org/series/93917/
State : failure

== Summary ==

CALL    scripts/checksyscalls.sh
  CALL    scripts/atomic/check-atomics.sh
  DESCEND objtool
  CHK     include/generated/compile.h
  CC [M]  drivers/gpu/drm/i915/display/icl_dsi.o
In file included from drivers/gpu/drm/i915/display/intel_ddi.h:10,
                 from drivers/gpu/drm/i915/display/icl_dsi.c:35:
drivers/gpu/drm/i915/display/icl_dsi.c: In function ‘adlp_set_lp_hs_wakeup_gb’:
./drivers/gpu/drm/i915/i915_reg.h:11623:11: error: ‘_TGL_DSI_CHKN_REG_0’ undeclared (first use in this function); did you mean ‘TGL_DSI_CHKN_REG_0’?
           _TGL_DSI_CHKN_REG_0, \
           ^~~~~~~~~~~~~~~~~~~
./drivers/gpu/drm/i915/i915_reg.h:185:47: note: in definition of macro ‘_MMIO’
 #define _MMIO(r) ((const i915_reg_t){ .reg = (r) })
                                               ^
./drivers/gpu/drm/i915/i915_reg.h:231:28: note: in expansion of macro ‘_PICK_EVEN’
 #define _PORT(port, a, b)  _PICK_EVEN(port, a, b)
                            ^~~~~~~~~~
./drivers/gpu/drm/i915/i915_reg.h:238:39: note: in expansion of macro ‘_PORT’
 #define _MMIO_PORT(port, a, b)  _MMIO(_PORT(port, a, b))
                                       ^~~~~
./drivers/gpu/drm/i915/i915_reg.h:11622:33: note: in expansion of macro ‘_MMIO_PORT’
 #define TGL_DSI_CHKN_REG(port)  _MMIO_PORT(port, \
                                 ^~~~~~~~~~
drivers/gpu/drm/i915/display/icl_dsi.c:1290:27: note: in expansion of macro ‘TGL_DSI_CHKN_REG’
    intel_de_rmw(dev_priv, TGL_DSI_CHKN_REG(port),
                           ^~~~~~~~~~~~~~~~
./drivers/gpu/drm/i915/i915_reg.h:11623:11: note: each undeclared identifier is reported only once for each function it appears in
           _TGL_DSI_CHKN_REG_0, \
           ^~~~~~~~~~~~~~~~~~~
./drivers/gpu/drm/i915/i915_reg.h:185:47: note: in definition of macro ‘_MMIO’
 #define _MMIO(r) ((const i915_reg_t){ .reg = (r) })
                                               ^
./drivers/gpu/drm/i915/i915_reg.h:231:28: note: in expansion of macro ‘_PICK_EVEN’
 #define _PORT(port, a, b)  _PICK_EVEN(port, a, b)
                            ^~~~~~~~~~
./drivers/gpu/drm/i915/i915_reg.h:238:39: note: in expansion of macro ‘_PORT’
 #define _MMIO_PORT(port, a, b)  _MMIO(_PORT(port, a, b))
                                       ^~~~~
./drivers/gpu/drm/i915/i915_reg.h:11622:33: note: in expansion of macro ‘_MMIO_PORT’
 #define TGL_DSI_CHKN_REG(port)  _MMIO_PORT(port, \
                                 ^~~~~~~~~~
drivers/gpu/drm/i915/display/icl_dsi.c:1290:27: note: in expansion of macro ‘TGL_DSI_CHKN_REG’
    intel_de_rmw(dev_priv, TGL_DSI_CHKN_REG(port),
                           ^~~~~~~~~~~~~~~~
./drivers/gpu/drm/i915/i915_reg.h:11624:11: error: ‘_TGL_DSI_CHKN_REG_1’ undeclared (first use in this function); did you mean ‘TGL_DSI_CHKN_REG_1’?
           _TGL_DSI_CHKN_REG_1)
           ^~~~~~~~~~~~~~~~~~~
./drivers/gpu/drm/i915/i915_reg.h:185:47: note: in definition of macro ‘_MMIO’
 #define _MMIO(r) ((const i915_reg_t){ .reg = (r) })
                                               ^
./drivers/gpu/drm/i915/i915_reg.h:231:28: note: in expansion of macro ‘_PICK_EVEN’
 #define _PORT(port, a, b)  _PICK_EVEN(port, a, b)
                            ^~~~~~~~~~
./drivers/gpu/drm/i915/i915_reg.h:238:39: note: in expansion of macro ‘_PORT’
 #define _MMIO_PORT(port, a, b)  _MMIO(_PORT(port, a, b))
                                       ^~~~~
./drivers/gpu/drm/i915/i915_reg.h:11622:33: note: in expansion of macro ‘_MMIO_PORT’
 #define TGL_DSI_CHKN_REG(port)  _MMIO_PORT(port, \
                                 ^~~~~~~~~~
drivers/gpu/drm/i915/display/icl_dsi.c:1290:27: note: in expansion of macro ‘TGL_DSI_CHKN_REG’
    intel_de_rmw(dev_priv, TGL_DSI_CHKN_REG(port),
                           ^~~~~~~~~~~~~~~~
drivers/gpu/drm/i915/display/icl_dsi.c:1288:5: error: suggest explicit braces to avoid ambiguous ‘else’ [-Werror=dangling-else]
  if (DISPLAY_VER(dev_priv) == 13)
     ^
cc1: all warnings being treated as errors
scripts/Makefile.build:271: recipe for target 'drivers/gpu/drm/i915/display/icl_dsi.o' failed
make[4]: *** [drivers/gpu/drm/i915/display/icl_dsi.o] Error 1
scripts/Makefile.build:514: recipe for target 'drivers/gpu/drm/i915' failed
make[3]: *** [drivers/gpu/drm/i915] Error 2
scripts/Makefile.build:514: recipe for target 'drivers/gpu/drm' failed
make[2]: *** [drivers/gpu/drm] Error 2
scripts/Makefile.build:514: recipe for target 'drivers/gpu' failed
make[1]: *** [drivers/gpu] Error 2
Makefile:1851: recipe for target 'drivers' failed
make: *** [drivers] Error 2


