Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2737EDF024
	for <intel-gfx@archiver.kernel.org>; Thu, 12 Feb 2026 12:57:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F56810E744;
	Thu, 12 Feb 2026 12:57:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MQ0UEiFy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B10FA10E741
 for <intel-gfx@lists.freedesktop.org>; Thu, 12 Feb 2026 12:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770901026; x=1802437026;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=90g2RreCoX4DsDY+s4+xuzTzdBeqzmjgDr3h9yO+Rfc=;
 b=MQ0UEiFyDIZNcZgzmA1TOBGOo4zOc0Vs8LbPC6f/hlVlsA0ewFR7d+T4
 tLCeNgtQ/F+yy6E0nU56lVGRhHijcE5RrrYTv+Es16GOyZ0pU+QJrepnp
 iquOL6KTOEh8D9jZGzYPjNE+IcOg/zEugcG5vzht5vk1/GzEngO7itMHD
 sZutsWS+2tQaHV4WECHowwRkhP/X935iWDiyij2rJrWkpYCC9Wszxnu61
 5qPtOMtxBU4j2Hhacu2Wa35r4MpQf9y48Ic9UhOeVAnEb2W+aLzgl3qSs
 1DjK9ZYSNYpd56VrxlWZy/y+JkjO+1/UHkmFKy1AzaqqFGtnAkkelHb4Q A==;
X-CSE-ConnectionGUID: Qxr7QWIbQYuHKGfzkbvFdg==
X-CSE-MsgGUID: P5dVLFQ8RgGtvCGjb5NoAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="72116771"
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; d="scan'208";a="72116771"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 04:57:06 -0800
X-CSE-ConnectionGUID: nhAPxjcsTzW6kaihnEPXmg==
X-CSE-MsgGUID: YA9ohXtES0OpoeKe/dBZLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; d="scan'208";a="212698644"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO hazy.intel.com)
 ([10.245.245.167])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 04:57:04 -0800
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 13/16] drm/i915/display: convert W/As in intel_pmdemand.c to
 new framework
Date: Thu, 12 Feb 2026 14:52:02 +0200
Message-ID: <20260212125526.344401-14-luciano.coelho@intel.com>
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
 drivers/gpu/drm/i915/display/intel_display_wa.c | 2 ++
 drivers/gpu/drm/i915/display/intel_display_wa.h | 1 +
 drivers/gpu/drm/i915/display/intel_pmdemand.c   | 8 +++++---
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_wa.c b/drivers/gpu/drm/i915/display/intel_display_wa.c
index 65ad82c67301..7bfa8216f1d7 100644
--- a/drivers/gpu/drm/i915/display/intel_display_wa.c
+++ b/drivers/gpu/drm/i915/display/intel_display_wa.c
@@ -100,6 +100,8 @@ bool __intel_display_wa(struct intel_display *display, enum intel_display_wa wa,
 			IS_DISPLAY_STEP(display, STEP_A0, STEP_A2);
 	case INTEL_DISPLAY_WA_14014143976:
 		return IS_DISPLAY_STEP(display, STEP_E0, STEP_FOREVER);
+	case INTEL_DISPLAY_WA_14016740474:
+		return IS_DISPLAY_VERx100_STEP(display, 1400, STEP_A0, STEP_C0);
 	case INTEL_DISPLAY_WA_14020863754:
 		return DISPLAY_VERx100(display) == 3000 ||
 			DISPLAY_VERx100(display) == 2000 ||
diff --git a/drivers/gpu/drm/i915/display/intel_display_wa.h b/drivers/gpu/drm/i915/display/intel_display_wa.h
index 44d06b074b0f..2589b53139b1 100644
--- a/drivers/gpu/drm/i915/display/intel_display_wa.h
+++ b/drivers/gpu/drm/i915/display/intel_display_wa.h
@@ -39,6 +39,7 @@ enum intel_display_wa {
 	INTEL_DISPLAY_WA_14011508470,
 	INTEL_DISPLAY_WA_14011765242,
 	INTEL_DISPLAY_WA_14014143976,
+	INTEL_DISPLAY_WA_14016740474,
 	INTEL_DISPLAY_WA_14020863754,
 	INTEL_DISPLAY_WA_14025769978,
 	INTEL_DISPLAY_WA_15013987218,
diff --git a/drivers/gpu/drm/i915/display/intel_pmdemand.c b/drivers/gpu/drm/i915/display/intel_pmdemand.c
index dc44a7a169c1..3b7471df6287 100644
--- a/drivers/gpu/drm/i915/display/intel_pmdemand.c
+++ b/drivers/gpu/drm/i915/display/intel_pmdemand.c
@@ -15,6 +15,7 @@
 #include "intel_display_regs.h"
 #include "intel_display_trace.h"
 #include "intel_display_utils.h"
+#include "intel_display_wa.h"
 #include "intel_pmdemand.h"
 #include "intel_step.h"
 #include "skl_watermark.h"
@@ -129,9 +130,10 @@ int intel_pmdemand_init(struct intel_display *display)
 				     &pmdemand_state->base,
 				     &intel_pmdemand_funcs);
 
-	if (IS_DISPLAY_VERx100_STEP(display, 1400, STEP_A0, STEP_C0))
-		/* Wa_14016740474 */
-		intel_de_rmw(display, XELPD_CHICKEN_DCPR_3, 0, DMD_RSP_TIMEOUT_DISABLE);
+	/* Wa_14016740474 */
+	if (intel_display_wa(display, 14016740474))
+		intel_de_rmw(display, XELPD_CHICKEN_DCPR_3, 0,
+			     DMD_RSP_TIMEOUT_DISABLE);
 
 	return 0;
 }
-- 
2.51.0

