Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 639DE606A31C
	for <intel-gfx@archiver.kernel.org>; Fri, 27 Nov 2026 18:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AGcmsvCx
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED884112CC1;
	Fri, 27 Nov 2026 18:00:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DE8A112CC4
 for <intel-gfx@lists.freedesktop.org>; Fri, 27 Nov 2026 18:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795802406; x=1827338406;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Nnb1Jpg6hY9BlxPYUVuxEYrsiFpiz9AC9jxSSPEy+Ag=;
 b=AGcmsvCxy89EOUBckgLutUt/lQ44vlEXjHcNI+Dx+IICLGQRzJkyg8sJ
 qSBQyCjHQs6Qp7+2vqQo/EsVUI/A7hFD5aCtsqoPWyWdaiPBw9GO736oA
 ftdq/Gjrgz5jN8osqyH2v0ChJ2NVQHGbfGMa08gOHW+NxngVO2enqDZOg
 uWHr7Rd0zaxybgUPHBLvtDPYSsytB18v67XeStoK8vrSRW0U4syyaMv5B
 9MgrDeJIb2ySgslP8FXNKyp7BCRqFZlJBxdLXQef2aOxW0IwKUZOekr+f
 VWvhY6cWjuysDY4Yfpc93PdbEqCIhC09UMImNYXjVWx32e/rg2XZO/CXd w==;
X-CSE-ConnectionGUID: USj/4mzRSZSYKBh1oPsLng==
X-CSE-MsgGUID: bC0nztIhQJylGNsUQMr5ZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4623133"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4623133"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 10:00:05 -0800
X-CSE-ConnectionGUID: 0TH3CqJqTeOsmpjIEU0GgA==
X-CSE-MsgGUID: yiYnT36zSiGrpwyBK3S6/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; d="scan'208";a="12793287"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.90])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 10:00:04 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 2/3] drm/i915/gvt: group all display includes in one header
Date: Fri, 27 Nov 2026 19:59:52 +0200
Message-ID: <26a899d797b3d3b5216f0ebc0a756e3e0556f26d.1795802238.git.jani.nikula@intel.com>
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

Usually having centralized headers for includes is a bad idea that
messes with dependencies and causes unnecessary rebuilds. However, the
display register definitions will be a special case. We'll want to have
a different definition of _MMIO for i915 core and display. Underneath,
this will mean using either i915_reg_t or intel_reg_t, respectively.

To make this happen, we'll have to ensure the i915 _MMIO is defined
before including display headers from GVT. Having this scattered all
over the place is error prone, so prefer centralizing this hack in one
place.

This is just preparation, making the actual hack easier later.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/gvt/cmd_parser.c        |  4 ---
 drivers/gpu/drm/i915/gvt/display.c           |  6 -----
 drivers/gpu/drm/i915/gvt/display_registers.h | 26 ++++++++++++++++++++
 drivers/gpu/drm/i915/gvt/dmabuf.c            |  4 +--
 drivers/gpu/drm/i915/gvt/edid.c              |  3 +--
 drivers/gpu/drm/i915/gvt/fb_decoder.c        |  6 -----
 drivers/gpu/drm/i915/gvt/handlers.c          | 16 ------------
 drivers/gpu/drm/i915/gvt/interrupt.c         |  3 +--
 drivers/gpu/drm/i915/gvt/mmio.c              |  3 +--
 drivers/gpu/drm/i915/intel_gvt_mmio_table.c  | 22 -----------------
 10 files changed, 30 insertions(+), 63 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/cmd_parser.c b/drivers/gpu/drm/i915/gvt/cmd_parser.c
index cdcd9156082c..b4d89710723c 100644
--- a/drivers/gpu/drm/i915/gvt/cmd_parser.c
+++ b/drivers/gpu/drm/i915/gvt/cmd_parser.c
@@ -39,10 +39,6 @@
 #include <drm/drm_print.h>
 #include <drm/intel/intel_gmd_misc_regs.h>
 
-#include "display/i9xx_plane_regs.h"
-#include "display/intel_display_regs.h"
-#include "display/intel_sprite_regs.h"
-
 #include "gem/i915_gem_context.h"
 #include "gem/i915_gem_pm.h"
 
diff --git a/drivers/gpu/drm/i915/gvt/display.c b/drivers/gpu/drm/i915/gvt/display.c
index e9ea7914ca97..419069fd0823 100644
--- a/drivers/gpu/drm/i915/gvt/display.c
+++ b/drivers/gpu/drm/i915/gvt/display.c
@@ -35,14 +35,8 @@
 #include <drm/display/drm_dp.h>
 #include <drm/drm_print.h>
 
-#include "display/bxt_dpio_phy_regs.h"
-#include "display/i9xx_plane_regs.h"
-#include "display/intel_crt_regs.h"
-#include "display/intel_cursor_regs.h"
-#include "display/intel_display_regs.h"
 #include "display/intel_dpio_phy.h"
 #include "display/intel_dpll_mgr.h"
-#include "display/intel_sprite_regs.h"
 
 #include "display_registers.h"
 #include "gvt.h"
diff --git a/drivers/gpu/drm/i915/gvt/display_registers.h b/drivers/gpu/drm/i915/gvt/display_registers.h
index b096f0904f23..9505da8c43e0 100644
--- a/drivers/gpu/drm/i915/gvt/display_registers.h
+++ b/drivers/gpu/drm/i915/gvt/display_registers.h
@@ -8,6 +8,32 @@
 
 #include "display/intel_gvt_api.h"
 
+/* register includes */
+#include "display/bxt_dpio_phy_regs.h"
+#include "display/i9xx_plane_regs.h"
+#include "display/i9xx_wm_regs.h"
+#include "display/intel_audio_regs.h"
+#include "display/intel_backlight_regs.h"
+#include "display/intel_color_regs.h"
+#include "display/intel_crt_regs.h"
+#include "display/intel_cursor_regs.h"
+#include "display/intel_display_regs.h"
+#include "display/intel_dmc_regs.h"
+#include "display/intel_dp_aux_regs.h"
+#include "display/intel_fbc_regs.h"
+#include "display/intel_fdi_regs.h"
+#include "display/intel_gmbus_regs.h"
+#include "display/intel_lvds_regs.h"
+#include "display/intel_pfit_regs.h"
+#include "display/intel_pps_regs.h"
+#include "display/intel_psr_regs.h"
+#include "display/intel_sbi_regs.h"
+#include "display/intel_sprite_regs.h"
+#include "display/intel_vga_regs.h"
+#include "display/skl_universal_plane_regs.h"
+#include "display/skl_watermark_regs.h"
+#include "display/vlv_dsi_pll_regs.h"
+
 #define DISPLAY_MMIO_BASE(display) \
 	intel_display_device_mmio_base((display))
 
diff --git a/drivers/gpu/drm/i915/gvt/dmabuf.c b/drivers/gpu/drm/i915/gvt/dmabuf.c
index 8a1d6c5636c2..4da8a276fef9 100644
--- a/drivers/gpu/drm/i915/gvt/dmabuf.c
+++ b/drivers/gpu/drm/i915/gvt/dmabuf.c
@@ -35,10 +35,8 @@
 #include <drm/drm_plane.h>
 #include <drm/drm_print.h>
 
-#include "display/skl_universal_plane_regs.h"
-
 #include "gem/i915_gem_dmabuf.h"
-
+#include "display_registers.h"
 #include "gvt.h"
 #include "i915_drv.h"
 
diff --git a/drivers/gpu/drm/i915/gvt/edid.c b/drivers/gpu/drm/i915/gvt/edid.c
index dc9ef98ff51b..aa507aa990d4 100644
--- a/drivers/gpu/drm/i915/gvt/edid.c
+++ b/drivers/gpu/drm/i915/gvt/edid.c
@@ -35,10 +35,9 @@
 #include <drm/display/drm_dp.h>
 #include <drm/drm_print.h>
 
-#include "display/intel_dp_aux_regs.h"
 #include "display/intel_gmbus.h"
-#include "display/intel_gmbus_regs.h"
 
+#include "display_registers.h"
 #include "gvt.h"
 #include "i915_drv.h"
 #include "i915_reg.h"
diff --git a/drivers/gpu/drm/i915/gvt/fb_decoder.c b/drivers/gpu/drm/i915/gvt/fb_decoder.c
index f597ba0bee31..c06d6b982159 100644
--- a/drivers/gpu/drm/i915/gvt/fb_decoder.c
+++ b/drivers/gpu/drm/i915/gvt/fb_decoder.c
@@ -35,12 +35,6 @@
 
 #include <uapi/drm/drm_fourcc.h>
 
-#include "display/i9xx_plane_regs.h"
-#include "display/intel_cursor_regs.h"
-#include "display/intel_display_regs.h"
-#include "display/intel_sprite_regs.h"
-#include "display/skl_universal_plane_regs.h"
-
 #include "display_registers.h"
 #include "gvt.h"
 #include "i915_drv.h"
diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
index 47210297bab4..61e29c4af37e 100644
--- a/drivers/gpu/drm/i915/gvt/handlers.c
+++ b/drivers/gpu/drm/i915/gvt/handlers.c
@@ -43,25 +43,9 @@
 #include <drm/intel/intel_pcode_regs.h>
 #include <drm/intel/intel_gmd_interrupt_regs.h>
 
-#include "display/bxt_dpio_phy_regs.h"
-#include "display/i9xx_plane_regs.h"
-#include "display/intel_crt_regs.h"
-#include "display/intel_cursor_regs.h"
-#include "display/intel_display_regs.h"
-#include "display/intel_dmc_regs.h"
-#include "display/intel_dp_aux_regs.h"
 #include "display/intel_dpio_phy.h"
 #include "display/intel_dpll_mgr.h"
 #include "display/intel_fbc.h"
-#include "display/intel_fdi_regs.h"
-#include "display/intel_pps_regs.h"
-#include "display/intel_psr_regs.h"
-#include "display/intel_sbi_regs.h"
-#include "display/intel_sprite_regs.h"
-#include "display/intel_vga_regs.h"
-#include "display/skl_universal_plane_regs.h"
-#include "display/skl_watermark_regs.h"
-#include "display/vlv_dsi_pll_regs.h"
 
 #include "gt/intel_engine_regs.h"
 #include "gt/intel_gt_regs.h"
diff --git a/drivers/gpu/drm/i915/gvt/interrupt.c b/drivers/gpu/drm/i915/gvt/interrupt.c
index f85113218037..962100adefaf 100644
--- a/drivers/gpu/drm/i915/gvt/interrupt.c
+++ b/drivers/gpu/drm/i915/gvt/interrupt.c
@@ -34,8 +34,7 @@
 #include <drm/drm_print.h>
 #include <drm/intel/intel_gmd_interrupt_regs.h>
 
-#include "display/intel_display_regs.h"
-
+#include "display_registers.h"
 #include "gvt.h"
 #include "i915_drv.h"
 #include "i915_reg.h"
diff --git a/drivers/gpu/drm/i915/gvt/mmio.c b/drivers/gpu/drm/i915/gvt/mmio.c
index 9e98db2d4f67..2fdcc4324023 100644
--- a/drivers/gpu/drm/i915/gvt/mmio.c
+++ b/drivers/gpu/drm/i915/gvt/mmio.c
@@ -37,12 +37,11 @@
 
 #include <drm/drm_print.h>
 
-#include "display/bxt_dpio_phy_regs.h"
-#include "display/intel_display_regs.h"
 #include "display/intel_dpio_phy.h"
 
 #include "gt/intel_gt_regs.h"
 
+#include "display_registers.h"
 #include "gvt.h"
 #include "i915_drv.h"
 #include "i915_reg.h"
diff --git a/drivers/gpu/drm/i915/intel_gvt_mmio_table.c b/drivers/gpu/drm/i915/intel_gvt_mmio_table.c
index 61d3e7b5a02e..acc93205f125 100644
--- a/drivers/gpu/drm/i915/intel_gvt_mmio_table.c
+++ b/drivers/gpu/drm/i915/intel_gvt_mmio_table.c
@@ -9,31 +9,9 @@
 #include <drm/intel/intel_gmd_interrupt_regs.h>
 #include <drm/intel/mchbar_regs.h>
 
-#include "display/bxt_dpio_phy_regs.h"
-#include "display/i9xx_plane_regs.h"
-#include "display/i9xx_wm_regs.h"
-#include "display/intel_audio_regs.h"
-#include "display/intel_backlight_regs.h"
-#include "display/intel_color_regs.h"
-#include "display/intel_crt_regs.h"
-#include "display/intel_cursor_regs.h"
 #include "display/intel_display_limits.h"
-#include "display/intel_display_regs.h"
-#include "display/intel_dmc_regs.h"
-#include "display/intel_dp_aux_regs.h"
 #include "display/intel_dpio_phy.h"
 #include "display/intel_fbc.h"
-#include "display/intel_fbc_regs.h"
-#include "display/intel_fdi_regs.h"
-#include "display/intel_lvds_regs.h"
-#include "display/intel_pfit_regs.h"
-#include "display/intel_psr_regs.h"
-#include "display/intel_sbi_regs.h"
-#include "display/intel_sprite_regs.h"
-#include "display/intel_vga_regs.h"
-#include "display/skl_universal_plane_regs.h"
-#include "display/skl_watermark_regs.h"
-#include "display/vlv_dsi_pll_regs.h"
 
 #include "gt/intel_engine_regs.h"
 #include "gt/intel_gt_regs.h"
-- 
2.47.3

