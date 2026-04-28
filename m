Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EA14FF885A
	for <intel-gfx@archiver.kernel.org>; Tue, 28 Apr 2026 14:38:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E257710EC73;
	Tue, 28 Apr 2026 14:38:13 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C80E10EBE1;
 Tue, 28 Apr 2026 14:38:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_drm/i915/dp=5Flink=3A_Ref?=
 =?utf-8?q?actor_DP_link_capability_logic?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Tue, 28 Apr 2026 14:38:13 -0000
Message-ID: <177738709325.21511.4923050972948809797@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260428125233.1664668-1-imre.deak@intel.com>
In-Reply-To: <20260428125233.1664668-1-imre.deak@intel.com>
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

Series: drm/i915/dp_link: Refactor DP link capability logic
URL   : https://patchwork.freedesktop.org/series/165632/
State : failure

== Summary ==

Error: make failed
  DESCEND objtool
  INSTALL libsubcmd_headers
  HDRTEST drivers/gpu/drm/xe/generated/xe_wa_oob.h
  HDRTEST drivers/gpu/drm/xe/generated/xe_device_wa_oob.h
  MODPOST Module.symvers
ERROR: modpost: missing MODULE_LICENSE() in drivers/gpu/drm/xe/display/tests/xe_display_test.o
make[2]: *** [scripts/Makefile.modpost:147: Module.symvers] Error 1
make[1]: *** [/home/kbuild2/kernel/Makefile:2091: modpost] Error 2
make: *** [Makefile:248: __sub-make] Error 2
Build failed, no error log produced


