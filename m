Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6931A606A32D
	for <intel-gfx@archiver.kernel.org>; Fri, 27 Nov 2026 18:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WKWPSEjK
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F09AF112CD1;
	Fri, 27 Nov 2026 18:00:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65876112CD1
 for <intel-gfx@lists.freedesktop.org>; Fri, 27 Nov 2026 18:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795802401; x=1827338401;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1M+tVUyc0Brm1uaqJgsdXhfajwfr0aeXM+vbgBxURfY=;
 b=WKWPSEjK97Kkmv6+RNrlGyGDpsQa5AbbFkgZ+Z1wyZnIUFUoeHNRURKh
 yE5kXFgtHq90c/jF1SQ7rb8DOlgtNSklYh28iM+KnD0z0aDhtCistvnTX
 DqYaGLGp4G8fimIXybj9iX+fPB8YwUTbl04XGrh+LOX9f6/IeYX0PUa3z
 I2YW3lEwDcV1iZ2IddiJAagdhjAPZxMt/ij+liY0Y66wDMlAkkMDQ+Dlv
 3movcCNol0wXm1JvYYHzHHRBA3cExA2OLYKsjo/8xF7+iyoRmddg4w5Wz
 FjF5Z8p8Tv5SMpgG88PHHOpkZQwblYzimqe3LdML68HmDLFKuNSQS30xD Q==;
X-CSE-ConnectionGUID: PoqHh4K0Q3aywJ+w6xhv6w==
X-CSE-MsgGUID: fG4WkJfaTMunOcacVROMEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4783707"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4783707"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 10:00:01 -0800
X-CSE-ConnectionGUID: 1Ftal4ZBSBGU4icZkzZqBw==
X-CSE-MsgGUID: jGJjMuJxSO+AtrezviIarg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; d="scan'208";a="12734312"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.90])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 10:00:00 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 1/3] drm/i915/gvt: rename display_helpers.h to
 display_registers.h
Date: Fri, 27 Nov 2026 19:59:51 +0200
Message-ID: <d7c20870517a78f9532dd2fab6202ef56ea4f56c.1795802238.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1795802238.git.jani.nikula@intel.com>
References: <cover.1795802238.git.jani.nikula@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Content-Type: text/plain; charset=UTF-8
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

We'll be turning the include into a central place to include the display
register headers. Name accordingly.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/gvt/cmd_parser.c                       | 2 +-
 drivers/gpu/drm/i915/gvt/display.c                          | 2 +-
 .../drm/i915/gvt/{display_helpers.h => display_registers.h} | 6 +++---
 drivers/gpu/drm/i915/gvt/fb_decoder.c                       | 2 +-
 drivers/gpu/drm/i915/gvt/handlers.c                         | 2 +-
 drivers/gpu/drm/i915/intel_gvt_mmio_table.c                 | 2 +-
 6 files changed, 8 insertions(+), 8 deletions(-)
 rename drivers/gpu/drm/i915/gvt/{display_helpers.h => display_registers.h} (91%)

diff --git a/drivers/gpu/drm/i915/gvt/cmd_parser.c b/drivers/gpu/drm/i915/gvt/cmd_parser.c
index e4ed47ffd2d8..cdcd9156082c 100644
--- a/drivers/gpu/drm/i915/gvt/cmd_parser.c
+++ b/drivers/gpu/drm/i915/gvt/cmd_parser.c
@@ -55,7 +55,7 @@
 #include "gt/intel_ring.h"
 #include "gt/shmem_utils.h"
 
-#include "display_helpers.h"
+#include "display_registers.h"
 #include "gvt.h"
 #include "i915_drv.h"
 #include "i915_pvinfo.h"
diff --git a/drivers/gpu/drm/i915/gvt/display.c b/drivers/gpu/drm/i915/gvt/display.c
index 00451fcb1005..e9ea7914ca97 100644
--- a/drivers/gpu/drm/i915/gvt/display.c
+++ b/drivers/gpu/drm/i915/gvt/display.c
@@ -44,7 +44,7 @@
 #include "display/intel_dpll_mgr.h"
 #include "display/intel_sprite_regs.h"
 
-#include "display_helpers.h"
+#include "display_registers.h"
 #include "gvt.h"
 #include "i915_drv.h"
 #include "i915_reg.h"
diff --git a/drivers/gpu/drm/i915/gvt/display_helpers.h b/drivers/gpu/drm/i915/gvt/display_registers.h
similarity index 91%
rename from drivers/gpu/drm/i915/gvt/display_helpers.h
rename to drivers/gpu/drm/i915/gvt/display_registers.h
index 0418397c09c4..b096f0904f23 100644
--- a/drivers/gpu/drm/i915/gvt/display_helpers.h
+++ b/drivers/gpu/drm/i915/gvt/display_registers.h
@@ -3,8 +3,8 @@
  * Copyright © 2025 Intel Corporation
  */
 
-#ifndef __DISPLAY_HELPERS_H__
-#define __DISPLAY_HELPERS_H__
+#ifndef __DISPLAY_REGISTERS_H__
+#define __DISPLAY_REGISTERS_H__
 
 #include "display/intel_gvt_api.h"
 
@@ -34,4 +34,4 @@
 	for ((__p) = PIPE_A; (__p) < I915_MAX_PIPES; (__p)++) \
 		for_each_if(intel_display_device_pipe_valid((display), (__p)))
 
-#endif /* __DISPLAY_HELPERS_H__ */
+#endif /* __DISPLAY_REGISTERS_H__ */
diff --git a/drivers/gpu/drm/i915/gvt/fb_decoder.c b/drivers/gpu/drm/i915/gvt/fb_decoder.c
index d7abf38df532..f597ba0bee31 100644
--- a/drivers/gpu/drm/i915/gvt/fb_decoder.c
+++ b/drivers/gpu/drm/i915/gvt/fb_decoder.c
@@ -41,7 +41,7 @@
 #include "display/intel_sprite_regs.h"
 #include "display/skl_universal_plane_regs.h"
 
-#include "display_helpers.h"
+#include "display_registers.h"
 #include "gvt.h"
 #include "i915_drv.h"
 #include "i915_pvinfo.h"
diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
index 22dd0179863e..47210297bab4 100644
--- a/drivers/gpu/drm/i915/gvt/handlers.c
+++ b/drivers/gpu/drm/i915/gvt/handlers.c
@@ -66,7 +66,7 @@
 #include "gt/intel_engine_regs.h"
 #include "gt/intel_gt_regs.h"
 
-#include "display_helpers.h"
+#include "display_registers.h"
 #include "gvt.h"
 #include "i915_drv.h"
 #include "i915_pvinfo.h"
diff --git a/drivers/gpu/drm/i915/intel_gvt_mmio_table.c b/drivers/gpu/drm/i915/intel_gvt_mmio_table.c
index 25b72b20e709..61d3e7b5a02e 100644
--- a/drivers/gpu/drm/i915/intel_gvt_mmio_table.c
+++ b/drivers/gpu/drm/i915/intel_gvt_mmio_table.c
@@ -38,7 +38,7 @@
 #include "gt/intel_engine_regs.h"
 #include "gt/intel_gt_regs.h"
 
-#include "gvt/display_helpers.h"
+#include "gvt/display_registers.h"
 #include "gvt/reg.h"
 
 #include "i915_drv.h"
-- 
2.47.3

