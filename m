Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA55ECD4851
	for <intel-gfx@archiver.kernel.org>; Tue, 12 May 2026 14:24:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84D3B10EB59;
	Tue, 12 May 2026 14:24:16 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C15910EB59;
 Tue, 12 May 2026 14:24:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_CMTG_enablement_=28rev5?=
 =?utf-8?q?=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Animesh Manna" <animesh.manna@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Tue, 12 May 2026 14:24:15 -0000
Message-ID: <177859585550.61707.14237353022468584784@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260512133208.1363116-1-animesh.manna@intel.com>
In-Reply-To: <20260512133208.1363116-1-animesh.manna@intel.com>
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

Series: CMTG enablement (rev5)
URL   : https://patchwork.freedesktop.org/series/157664/
State : failure

== Summary ==

Error: make failed
  DESCEND objtool
  INSTALL libsubcmd_headers
  CC [M]  drivers/gpu/drm/i915/display/intel_cmtg.o
drivers/gpu/drm/i915/display/intel_cmtg.c: In function ‘intel_cmtg_is_allowed’:
drivers/gpu/drm/i915/display/intel_cmtg.c:248:66: error: ‘DC_STATE_EN_UPTO_DC3CO’ undeclared (first use in this function); did you mean ‘DC_STATE_EN_UPTO_DC5’?
  248 |             intel_display_power_get_current_dc_state(display) == DC_STATE_EN_UPTO_DC3CO)
      |                                                                  ^~~~~~~~~~~~~~~~~~~~~~
      |                                                                  DC_STATE_EN_UPTO_DC5
drivers/gpu/drm/i915/display/intel_cmtg.c:248:66: note: each undeclared identifier is reported only once for each function it appears in
make[6]: *** [scripts/Makefile.build:289: drivers/gpu/drm/i915/display/intel_cmtg.o] Error 1
make[5]: *** [scripts/Makefile.build:548: drivers/gpu/drm/i915] Error 2
make[4]: *** [scripts/Makefile.build:548: drivers/gpu/drm] Error 2
make[3]: *** [scripts/Makefile.build:548: drivers/gpu] Error 2
make[2]: *** [scripts/Makefile.build:548: drivers] Error 2
make[1]: *** [/home/kbuild2/kernel/Makefile:2143: .] Error 2
make: *** [Makefile:248: __sub-make] Error 2
Build failed, no error log produced


