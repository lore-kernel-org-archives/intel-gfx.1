Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5F94C433F5
	for <intel-gfx@archiver.kernel.org>; Thu,  7 Apr 2022 07:48:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48D9B10E5C2;
	Thu,  7 Apr 2022 07:48:58 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 57CBF10E5BB;
 Thu,  7 Apr 2022 07:48:57 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 50997AADD7;
 Thu,  7 Apr 2022 07:48:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Zhi Wang" <zhi.wang.linux@gmail.com>
Date: Thu, 07 Apr 2022 07:48:57 -0000
Message-ID: <164931773729.14670.12197685567906750759@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20220407071945.72148-1-zhi.a.wang@intel.com>
In-Reply-To: <20220407071945.72148-1-zhi.a.wang@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBS?=
 =?utf-8?q?efactor_GVT-g_MMIO_tracking_table_and_handlers_=28rev2=29?=
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
Cc: intel-gfx@lists.freedesktop.org
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

== Series Details ==

Series: Refactor GVT-g MMIO tracking table and handlers (rev2)
URL   : https://patchwork.freedesktop.org/series/102073/
State : failure

== Summary ==

CALL    scripts/checksyscalls.sh
  CALL    scripts/atomic/check-atomics.sh
  DESCEND objtool
  CHK     include/generated/compile.h
  CC [M]  drivers/gpu/drm/i915/intel_gvt_mmio_table.o
drivers/gpu/drm/i915/intel_gvt_mmio_table.c: In function ‘iterate_skl_plus_mmio’:
drivers/gpu/drm/i915/intel_gvt_mmio_table.c:1021:9: error: ‘DMC_SSP_BASE’ undeclared (first use in this function); did you mean ‘FBC_CFB_BASE’?
  MMIO_D(DMC_SSP_BASE);
         ^~~~~~~~~~~~
drivers/gpu/drm/i915/intel_gvt_mmio_table.c:17:56: note: in definition of macro ‘MMIO_F’
  ret = iter->handle_mmio_cb(iter, i915_mmio_reg_offset(reg), s); \
                                                        ^~~
drivers/gpu/drm/i915/intel_gvt_mmio_table.c:1021:2: note: in expansion of macro ‘MMIO_D’
  MMIO_D(DMC_SSP_BASE);
  ^~~~~~
drivers/gpu/drm/i915/intel_gvt_mmio_table.c:1021:9: note: each undeclared identifier is reported only once for each function it appears in
  MMIO_D(DMC_SSP_BASE);
         ^~~~~~~~~~~~
drivers/gpu/drm/i915/intel_gvt_mmio_table.c:17:56: note: in definition of macro ‘MMIO_F’
  ret = iter->handle_mmio_cb(iter, i915_mmio_reg_offset(reg), s); \
                                                        ^~~
drivers/gpu/drm/i915/intel_gvt_mmio_table.c:1021:2: note: in expansion of macro ‘MMIO_D’
  MMIO_D(DMC_SSP_BASE);
  ^~~~~~
drivers/gpu/drm/i915/intel_gvt_mmio_table.c:1022:9: error: ‘DMC_HTP_SKL’ undeclared (first use in this function); did you mean ‘D_PRE_SKL’?
  MMIO_D(DMC_HTP_SKL);
         ^~~~~~~~~~~
drivers/gpu/drm/i915/intel_gvt_mmio_table.c:17:56: note: in definition of macro ‘MMIO_F’
  ret = iter->handle_mmio_cb(iter, i915_mmio_reg_offset(reg), s); \
                                                        ^~~
drivers/gpu/drm/i915/intel_gvt_mmio_table.c:1022:2: note: in expansion of macro ‘MMIO_D’
  MMIO_D(DMC_HTP_SKL);
  ^~~~~~
drivers/gpu/drm/i915/intel_gvt_mmio_table.c:1023:9: error: ‘DMC_LAST_WRITE’ undeclared (first use in this function); did you mean ‘DRM_LIST_WAIT’?
  MMIO_D(DMC_LAST_WRITE);
         ^~~~~~~~~~~~~~
drivers/gpu/drm/i915/intel_gvt_mmio_table.c:17:56: note: in definition of macro ‘MMIO_F’
  ret = iter->handle_mmio_cb(iter, i915_mmio_reg_offset(reg), s); \
                                                        ^~~
drivers/gpu/drm/i915/intel_gvt_mmio_table.c:1023:2: note: in expansion of macro ‘MMIO_D’
  MMIO_D(DMC_LAST_WRITE);
  ^~~~~~
drivers/gpu/drm/i915/intel_gvt_mmio_table.c:1080:15: error: ‘DMC_MMIO_START_RANGE’ undeclared (first use in this function); did you mean ‘DRM_MM_INSERT_ONCE’?
  MMIO_F(_MMIO(DMC_MMIO_START_RANGE), 0x3000);
               ^~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/i915/intel_gvt_mmio_table.c:17:56: note: in definition of macro ‘MMIO_F’
  ret = iter->handle_mmio_cb(iter, i915_mmio_reg_offset(reg), s); \
                                                        ^~~
drivers/gpu/drm/i915/intel_gvt_mmio_table.c:1080:9: note: in expansion of macro ‘_MMIO’
  MMIO_F(_MMIO(DMC_MMIO_START_RANGE), 0x3000);
         ^~~~~
scripts/Makefile.build:288: recipe for target 'drivers/gpu/drm/i915/intel_gvt_mmio_table.o' failed
make[4]: *** [drivers/gpu/drm/i915/intel_gvt_mmio_table.o] Error 1
scripts/Makefile.build:550: recipe for target 'drivers/gpu/drm/i915' failed
make[3]: *** [drivers/gpu/drm/i915] Error 2
scripts/Makefile.build:550: recipe for target 'drivers/gpu/drm' failed
make[2]: *** [drivers/gpu/drm] Error 2
scripts/Makefile.build:550: recipe for target 'drivers/gpu' failed
make[1]: *** [drivers/gpu] Error 2
Makefile:1834: recipe for target 'drivers' failed
make: *** [drivers] Error 2


