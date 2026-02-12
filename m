Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5F1AECD6FA
	for <intel-gfx@archiver.kernel.org>; Thu, 12 Feb 2026 12:57:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2738810E73A;
	Thu, 12 Feb 2026 12:57:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DOUkANJP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C53F10E739
 for <intel-gfx@lists.freedesktop.org>; Thu, 12 Feb 2026 12:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770901024; x=1802437024;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=NCst58u24Ug6l2/NMRBmYNiwhnnrLL/uj8RdmphkvOo=;
 b=DOUkANJPruZGb3ngedHl86W2z2rjQDQDua4H6vY9jNqvaDY53aSCjl0H
 0bxOZ3MMHub1OUS+1ibZZeO2I3uPYrD9gSyESfRhi16PF6D5Z1Qfb1av5
 0cMvmuykZVOT4jbw4VAeDdMvygUsbz6UGlFIVt2XRFR3NBC/dQkyuoTpc
 NJ4RkdbfZQk1LjVIfFtOmagQl31IXwL9tXGQz0Z32xK1gzgX9kyT1qaBQ
 P1ctxMpPEWbWU67rfzY7aQciqxPNzEciBuwBmxaTYUIJJed3iTPhxZaXo
 Z8YhLcbLPemNE4P9YJtj9TmiHOU92qbMw0ZRkw+3efz4JcJUEJASycfCT A==;
X-CSE-ConnectionGUID: KreB+cblQEagPfAr0K9npw==
X-CSE-MsgGUID: MuJQ+oPbRpiV4H0it7csCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="72116763"
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; d="scan'208";a="72116763"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 04:57:03 -0800
X-CSE-ConnectionGUID: zLVwFENSSSWEJJMdN8Wc+Q==
X-CSE-MsgGUID: c9ib2YxvQbeR6+oGWttNLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; d="scan'208";a="212698637"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO hazy.intel.com)
 ([10.245.245.167])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 04:57:02 -0800
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 11/16] drm/i915/display: convert W/As in intel_modeset_setup.c
 to new framework
Date: Thu, 12 Feb 2026 14:52:00 +0200
Message-ID: <20260212125526.344401-12-luciano.coelho@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260212125526.344401-1-luciano.coelho@intel.com>
References: <20260212125526.344401-1-luciano.coelho@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Convert the low-hanging fruits of workaround checks to the workaround
framework.  Instead of having display structure checks for the
workarounds all over, concentrate the checks in intel_wa.c.

Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_wa.c    | 2 ++
 drivers/gpu/drm/i915/display/intel_display_wa.h    | 1 +
 drivers/gpu/drm/i915/display/intel_modeset_setup.c | 3 ++-
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_wa.c b/drivers/gpu/drm/i915/display/intel_display_wa.c
index 3aa79e607bf8..72f645686efd 100644
--- a/drivers/gpu/drm/i915/display/intel_display_wa.c
+++ b/drivers/gpu/drm/i915/display/intel_display_wa.c
@@ -79,6 +79,8 @@ bool __intel_display_wa(struct intel_display *display, enum intel_display_wa wa,
 	case INTEL_DISPLAY_WA_13012396614:
 		return DISPLAY_VERx100(display) == 3000 ||
 			DISPLAY_VERx100(display) == 3500;
+	case INTEL_DISPLAY_WA_14010480278:
+		return (IS_DISPLAY_VER(display, 10, 12));
 	case INTEL_DISPLAY_WA_14010547955:
 		return display->platform.dg2;
 	case INTEL_DISPLAY_WA_14010685332:
diff --git a/drivers/gpu/drm/i915/display/intel_display_wa.h b/drivers/gpu/drm/i915/display/intel_display_wa.h
index 57345d0abe1c..d8359f88de29 100644
--- a/drivers/gpu/drm/i915/display/intel_display_wa.h
+++ b/drivers/gpu/drm/i915/display/intel_display_wa.h
@@ -30,6 +30,7 @@ enum intel_display_wa {
 	INTEL_DISPLAY_WA_1409120013,
 	INTEL_DISPLAY_WA_1409767108,
 	INTEL_DISPLAY_WA_13012396614,
+	INTEL_DISPLAY_WA_14010480278,
 	INTEL_DISPLAY_WA_14010547955,
 	INTEL_DISPLAY_WA_14010685332,
 	INTEL_DISPLAY_WA_14011294188,
diff --git a/drivers/gpu/drm/i915/display/intel_modeset_setup.c b/drivers/gpu/drm/i915/display/intel_modeset_setup.c
index 9b0becee221c..7ee1494a67af 100644
--- a/drivers/gpu/drm/i915/display/intel_modeset_setup.c
+++ b/drivers/gpu/drm/i915/display/intel_modeset_setup.c
@@ -25,6 +25,7 @@
 #include "intel_display_power.h"
 #include "intel_display_regs.h"
 #include "intel_display_types.h"
+#include "intel_display_wa.h"
 #include "intel_dmc.h"
 #include "intel_fifo_underrun.h"
 #include "intel_modeset_setup.h"
@@ -913,7 +914,7 @@ static void intel_early_display_was(struct intel_display *display)
 	 * Display WA #1185 WaDisableDARBFClkGating:glk,icl,ehl,tgl
 	 * Also known as Wa_14010480278.
 	 */
-	if (IS_DISPLAY_VER(display, 10, 12))
+	if (intel_display_wa(display, 14010480278))
 		intel_de_rmw(display, GEN9_CLKGATE_DIS_0, 0, DARBF_GATING_DIS);
 
 	/*
-- 
2.51.0

