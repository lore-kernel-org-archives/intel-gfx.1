Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE2DFCDB46F
	for <intel-gfx@archiver.kernel.org>; Tue, 23 Jun 2026 13:50:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83CCD10EA98;
	Tue, 23 Jun 2026 13:50:31 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86D9710E24A;
 Tue, 23 Jun 2026 13:50:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_drm/i915=3A_Clean_up_GPIO?=
 =?utf-8?q?_pin_stuff?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Tue, 23 Jun 2026 13:50:30 -0000
Message-ID: <178222263054.106260.15618930660526400244@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260623125111.6632-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20260623125111.6632-1-ville.syrjala@linux.intel.com>
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

Series: drm/i915: Clean up GPIO pin stuff
URL   : https://patchwork.freedesktop.org/series/169024/
State : failure

== Summary ==

Error: make failed
  DESCEND objtool
  INSTALL libsubcmd_headers
  LD [M]  drivers/gpu/drm/i915/i915.o
  CC [M]  drivers/gpu/drm/i915/gvt/edid.o
drivers/gpu/drm/i915/gvt/edid.c: In function ‘cnp_get_port_from_gmbus0’:
drivers/gpu/drm/i915/gvt/edid.c:93:28: error: ‘GMBUS_PIN_1_BXT’ undeclared (first use in this function); did you mean ‘GMBUS_PIN_10_TC2’?
   93 |         if (port_select == GMBUS_PIN_1_BXT)
      |                            ^~~~~~~~~~~~~~~
      |                            GMBUS_PIN_10_TC2
drivers/gpu/drm/i915/gvt/edid.c:93:28: note: each undeclared identifier is reported only once for each function it appears in
drivers/gpu/drm/i915/gvt/edid.c:95:33: error: ‘GMBUS_PIN_2_BXT’ undeclared (first use in this function); did you mean ‘GMBUS_PIN_DPB’?
   95 |         else if (port_select == GMBUS_PIN_2_BXT)
      |                                 ^~~~~~~~~~~~~~~
      |                                 GMBUS_PIN_DPB
drivers/gpu/drm/i915/gvt/edid.c:97:33: error: ‘GMBUS_PIN_3_BXT’ undeclared (first use in this function); did you mean ‘GMBUS_PIN_13_TC5’?
   97 |         else if (port_select == GMBUS_PIN_3_BXT)
      |                                 ^~~~~~~~~~~~~~~
      |                                 GMBUS_PIN_13_TC5
drivers/gpu/drm/i915/gvt/edid.c:99:33: error: ‘GMBUS_PIN_4_CNP’ undeclared (first use in this function); did you mean ‘GMBUS_PIN_DPC’?
   99 |         else if (port_select == GMBUS_PIN_4_CNP)
      |                                 ^~~~~~~~~~~~~~~
      |                                 GMBUS_PIN_DPC
drivers/gpu/drm/i915/gvt/edid.c: In function ‘bxt_get_port_from_gmbus0’:
drivers/gpu/drm/i915/gvt/edid.c:109:28: error: ‘GMBUS_PIN_1_BXT’ undeclared (first use in this function); did you mean ‘GMBUS_PIN_10_TC2’?
  109 |         if (port_select == GMBUS_PIN_1_BXT)
      |                            ^~~~~~~~~~~~~~~
      |                            GMBUS_PIN_10_TC2
drivers/gpu/drm/i915/gvt/edid.c:111:33: error: ‘GMBUS_PIN_2_BXT’ undeclared (first use in this function); did you mean ‘GMBUS_PIN_DPB’?
  111 |         else if (port_select == GMBUS_PIN_2_BXT)
      |                                 ^~~~~~~~~~~~~~~
      |                                 GMBUS_PIN_DPB
drivers/gpu/drm/i915/gvt/edid.c:113:33: error: ‘GMBUS_PIN_3_BXT’ undeclared (first use in this function); did you mean ‘GMBUS_PIN_13_TC5’?
  113 |         else if (port_select == GMBUS_PIN_3_BXT)
      |                                 ^~~~~~~~~~~~~~~
      |                                 GMBUS_PIN_13_TC5
make[6]: *** [scripts/Makefile.build:289: drivers/gpu/drm/i915/gvt/edid.o] Error 1
make[5]: *** [scripts/Makefile.build:548: drivers/gpu/drm/i915] Error 2
make[4]: *** [scripts/Makefile.build:548: drivers/gpu/drm] Error 2
make[3]: *** [scripts/Makefile.build:548: drivers/gpu] Error 2
make[2]: *** [scripts/Makefile.build:548: drivers] Error 2
make[1]: *** [/home/kbuild2/kernel/Makefile:2144: .] Error 2
make: *** [Makefile:248: __sub-make] Error 2
Build failed, no error log produced


