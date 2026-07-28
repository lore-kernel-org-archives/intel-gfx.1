Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C812C53219
	for <intel-gfx@archiver.kernel.org>; Tue, 28 Jul 2026 16:54:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D76E010E118;
	Tue, 28 Jul 2026 16:54:10 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B009210E118;
 Tue, 28 Jul 2026 16:54:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_drm/=7Bi915=2C_xe=7D/disp?=
 =?utf-8?q?lay=3A_add_core_workaround_query_to_display_parent_interface?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Tue, 28 Jul 2026 16:54:09 -0000
Message-ID: <178525764971.232246.11056154540362831979@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260728162514.594285-1-jani.nikula@intel.com>
In-Reply-To: <20260728162514.594285-1-jani.nikula@intel.com>
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

Series: drm/{i915, xe}/display: add core workaround query to display parent interface
URL   : https://patchwork.freedesktop.org/series/171200/
State : failure

== Summary ==

Error: make failed
  DESCEND objtool
  CC [M]  drivers/gpu/drm/xe/display/xe_display.o
drivers/gpu/drm/xe/display/xe_display.c:40:10: fatal error: xe_display_wa.h: No such file or directory
   40 | #include "xe_display_wa.h"
      |          ^~~~~~~~~~~~~~~~~
compilation terminated.
make[6]: *** [scripts/Makefile.build:289: drivers/gpu/drm/xe/display/xe_display.o] Error 1
make[5]: *** [scripts/Makefile.build:549: drivers/gpu/drm/xe] Error 2
make[4]: *** [scripts/Makefile.build:549: drivers/gpu/drm] Error 2
make[3]: *** [scripts/Makefile.build:549: drivers/gpu] Error 2
make[2]: *** [scripts/Makefile.build:549: drivers] Error 2
make[1]: *** [/home/kbuild/kernel/Makefile:2189: .] Error 2
make: *** [Makefile:248: __sub-make] Error 2
Build failed, no error log produced


