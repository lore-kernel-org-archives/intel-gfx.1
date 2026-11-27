Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75508606A31E
	for <intel-gfx@archiver.kernel.org>; Fri, 27 Nov 2026 18:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=R0WRI0pA
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FD98112CC4;
	Fri, 27 Nov 2026 18:00:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B24A2112CC7
 for <intel-gfx@lists.freedesktop.org>; Fri, 27 Nov 2026 18:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795802409; x=1827338409;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=L4v9sUg323jObHQ00rAVdgQhN6m3Ibndtw21JRFUR4I=;
 b=R0WRI0pAfddPru/9Nk/u84Euc1X4UCCMAS9gsHWs735gK6T5u2MPXjxa
 oAYtk2v2P52rnbalu63dyyfCBEqdxAoAxn2nfy0+Ge6Uh4NOAe2lN3S/L
 i8ROvVjOdcXWN4OUTMuZUf2WNRP/8mnrnFREgG5nWvEobpuBwnn10AbqO
 yWaQGQVeSgukCfPKuyXv0P/Cy/xoDpk4e4wO6y0CYh0040Ks9jJG/Ynnd
 2da2/MTC25SPaE2vKbc8535suz+hkMIAxF1NeeEUC+gEpLrjz1posqaZ6
 xXG3+1/hQbGxz34J8Pdsl/2t7j8ahro2X4FiLC5CFl9Kn6wyhV8IJN2ta A==;
X-CSE-ConnectionGUID: d0rieCGuTvqhvUAUvqvmKA==
X-CSE-MsgGUID: iEysFUoiRianfGoMIAnfKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4715503"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4715503"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 10:00:09 -0800
X-CSE-ConnectionGUID: B6iBzM2jTsm6c4pC8UnLtA==
X-CSE-MsgGUID: 1D94WuNNRxGRHPgsdkcBlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; d="scan'208";a="12356173"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.90])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 10:00:07 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 3/3] drm/i915/gvt: reduce some display includes
Date: Fri, 27 Nov 2026 19:59:53 +0200
Message-ID: <11a0a2afacdf720d9da8df2f8bed773edfb80d3d.1795802238.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1795802238.git.jani.nikula@intel.com>
References: <cover.1795802238.git.jani.nikula@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Content-Transfer-Encoding: 8bit
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
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The intel_dpio_phy.h, intel_dpll_mgr.h, and intel_fbc.h headers are
included in GVT only for a handful of definitions and types. Err on the
side of duplicating these definitions rather than including lots of
unnecessary details (and possibly using them).

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/gvt/display.c           |  3 ---
 drivers/gpu/drm/i915/gvt/display_registers.h | 10 ++++++++++
 drivers/gpu/drm/i915/gvt/handlers.c          | 10 +++-------
 drivers/gpu/drm/i915/intel_gvt_mmio_table.c  |  2 --
 4 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/display.c b/drivers/gpu/drm/i915/gvt/display.c
index 419069fd0823..2933da607667 100644
--- a/drivers/gpu/drm/i915/gvt/display.c
+++ b/drivers/gpu/drm/i915/gvt/display.c
@@ -35,9 +35,6 @@
 #include <drm/display/drm_dp.h>
 #include <drm/drm_print.h>
 
-#include "display/intel_dpio_phy.h"
-#include "display/intel_dpll_mgr.h"
-
 #include "display_registers.h"
 #include "gvt.h"
 #include "i915_drv.h"
diff --git a/drivers/gpu/drm/i915/gvt/display_registers.h b/drivers/gpu/drm/i915/gvt/display_registers.h
index 9505da8c43e0..7a18198cc569 100644
--- a/drivers/gpu/drm/i915/gvt/display_registers.h
+++ b/drivers/gpu/drm/i915/gvt/display_registers.h
@@ -34,6 +34,16 @@
 #include "display/skl_watermark_regs.h"
 #include "display/vlv_dsi_pll_regs.h"
 
+/* some duplicate definitions to avoid extra display includes */
+#define DPLL_ID_SKL_DPLL0 0
+#define DPLL_ID_WRPLL1 0
+#define DPLL_ID_WRPLL2 1
+#define INTEL_FBC_A 0
+#define DPIO_CH0 0
+#define DPIO_CH1 1
+#define DPIO_PHY0 0
+#define DPIO_PHY1 1
+
 #define DISPLAY_MMIO_BASE(display) \
 	intel_display_device_mmio_base((display))
 
diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
index 61e29c4af37e..f447cde14b49 100644
--- a/drivers/gpu/drm/i915/gvt/handlers.c
+++ b/drivers/gpu/drm/i915/gvt/handlers.c
@@ -43,10 +43,6 @@
 #include <drm/intel/intel_pcode_regs.h>
 #include <drm/intel/intel_gmd_interrupt_regs.h>
 
-#include "display/intel_dpio_phy.h"
-#include "display/intel_dpll_mgr.h"
-#include "display/intel_fbc.h"
-
 #include "gt/intel_engine_regs.h"
 #include "gt/intel_gt_regs.h"
 
@@ -544,8 +540,8 @@ static u32 bxt_vgpu_get_dp_bitrate(struct intel_vgpu *vgpu, enum port port)
 {
 	u32 dp_br = 0;
 	int refclk = 100000;
-	enum dpio_phy phy = DPIO_PHY0;
-	enum dpio_channel ch = DPIO_CH0;
+	int phy = DPIO_PHY0;
+	int ch = DPIO_CH0;
 	int m1, m2, n, p1, p2, m, p, vco, dot;
 	u32 temp;
 
@@ -602,7 +598,7 @@ static u32 bxt_vgpu_get_dp_bitrate(struct intel_vgpu *vgpu, enum port port)
 static u32 skl_vgpu_get_dp_bitrate(struct intel_vgpu *vgpu, enum port port)
 {
 	u32 dp_br = 0;
-	enum intel_dpll_id dpll_id = DPLL_ID_SKL_DPLL0;
+	int dpll_id = DPLL_ID_SKL_DPLL0;
 
 	/* Find the enabled DPLL for the DDI/PORT */
 	if (!(vgpu_vreg_t(vgpu, DPLL_CTRL2) & DPLL_CTRL2_DDI_CLK_OFF(port)) &&
diff --git a/drivers/gpu/drm/i915/intel_gvt_mmio_table.c b/drivers/gpu/drm/i915/intel_gvt_mmio_table.c
index acc93205f125..80be3d9d3d65 100644
--- a/drivers/gpu/drm/i915/intel_gvt_mmio_table.c
+++ b/drivers/gpu/drm/i915/intel_gvt_mmio_table.c
@@ -10,8 +10,6 @@
 #include <drm/intel/mchbar_regs.h>
 
 #include "display/intel_display_limits.h"
-#include "display/intel_dpio_phy.h"
-#include "display/intel_fbc.h"
 
 #include "gt/intel_engine_regs.h"
 #include "gt/intel_gt_regs.h"
-- 
2.47.3

