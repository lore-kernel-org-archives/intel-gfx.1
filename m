Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96C8ACD4851
	for <intel-gfx@archiver.kernel.org>; Tue, 19 May 2026 05:14:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37E9B10EA41;
	Tue, 19 May 2026 05:14:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HePhLspe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C08F610EA3D
 for <intel-gfx@lists.freedesktop.org>; Tue, 19 May 2026 05:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779167665; x=1810703665;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vTXTAjzSDXMGATVLguwO2i8Mw4mD4phUIrW5NWJigqw=;
 b=HePhLspek7ZfrNpYRydRGdec6dwkU431lABOCXxwgbYDskyjshJgafC6
 MHtBmBOEiKVGG+2Jm5Vh/kCDxeXo44MIMe8rG8ioboTT62cGHVDBh87h1
 WTf7eN/g/LY9ILQA3bgH2ZybR9zorNXwGSgwHYD4mOI/lAmJVD/vi4ZXM
 tpJ7flDvtgRHcj7XP5BfgMjjDldQsmHQFMufPnA9E8/3c1o9V6Wdxxq8y
 kdtT2XhFVF4XbpXk6MpZv1hAIgO0uEnFeI4kEX2yl6I4UqQvDX4Y+4Lfg
 B66lqLk0Sm2jqLHcPIBmbNRUlocxF6MYK+G+gTK3g16S95dj1/j35REgL A==;
X-CSE-ConnectionGUID: lRKI8tFlRVKITUoFStFqyg==
X-CSE-MsgGUID: 8+8FhKRlT9i5UUirAzjOfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="97603540"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="97603540"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 22:14:25 -0700
X-CSE-ConnectionGUID: WryesQmXTMCJkiZY+Ox5zg==
X-CSE-MsgGUID: GuJeJrX8SeaSqk7SZH+EBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="243635802"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by orviesa003.jf.intel.com with ESMTP; 18 May 2026 22:14:23 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: mitulkumar.ajitkumar.golani@intel.com, ankit.k.nautiyal@intel.com,
 ville.syrjala@linux.intel.com
Subject: [PATCH v1 3/8] drm/i915/display: Introduce CMRR fraction level to vrr
 crtc state
Date: Tue, 19 May 2026 10:33:17 +0530
Message-ID: <20260519050322.3677451-4-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260519050322.3677451-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20260519050322.3677451-1-mitulkumar.ajitkumar.golani@intel.com>
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

CMRR (Content Match Refresh Rate) requires fractional multipliers
applied to vtotal to precisely match the target refresh rate. Introduce
enum cmrr_level to encode three distinct fraction cases:

  CMRR_DEFAULT: No fractional adjustment; use the fixed refresh rate
                timings as-is.

  CMRR_HIGH:    Apply a 1001/1000 multiplier to vtotal, targeting a
                slightly higher effective refresh rate (e.g. 60.06 Hz
                for a 60 Hz mode). Used for video content playback.

  CMRR_LOW:     Apply a 1000/1001 multiplier to vtotal, targeting a
                slightly lower effective refresh rate. Used when the
                pixel clock needs to be pulled down to match content.

Add the level field to the vrr.cmrr crtc state and state dump so it
can be tracked.

Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_types.h |  7 +++++++
 drivers/gpu/drm/i915/display/intel_vrr.c           | 12 ++++++++++++
 drivers/gpu/drm/i915/display/intel_vrr.h           |  2 ++
 3 files changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index ce280349622b..1d5aee13afb1 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -999,6 +999,12 @@ struct intel_casf {
 	bool enable;
 };
 
+enum cmrr_level {
+	CMRR_DEFAULT,
+	CMRR_LOW,
+	CMRR_HIGH,
+};
+
 struct intel_crtc_state {
 	/*
 	 * uapi (drm) state. This is the software state shown to userspace.
@@ -1400,6 +1406,7 @@ struct intel_crtc_state {
 		struct {
 			bool enable;
 			u64 cmrr_n, cmrr_m;
+			enum cmrr_level level;
 		} cmrr;
 	} vrr;
 
diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index 87d52b206bdb..8d79d289378b 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -1228,3 +1228,15 @@ int intel_vrr_dcb_vmax_vblank_start_final(const struct intel_crtc_state *crtc_st
 
 	return intel_vrr_vblank_start(crtc_state, VRR_DCB_VMAX(tmp) + 1);
 }
+
+char *intel_vrr_cmrr_level_to_string(enum cmrr_level level)
+{
+	switch (level) {
+	case CMRR_LOW:
+		return "Low";
+	case CMRR_HIGH:
+		return "High";
+	default:
+		return "Default";
+	}
+}
diff --git a/drivers/gpu/drm/i915/display/intel_vrr.h b/drivers/gpu/drm/i915/display/intel_vrr.h
index 4f16ca4af91f..86707b8af2e3 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.h
+++ b/drivers/gpu/drm/i915/display/intel_vrr.h
@@ -7,6 +7,7 @@
 #define __INTEL_VRR_H__
 
 #include <linux/types.h>
+#include "intel_display_types.h"
 
 struct drm_connector_state;
 struct intel_atomic_state;
@@ -53,5 +54,6 @@ int intel_vrr_dcb_vmin_vblank_start_next(const struct intel_crtc_state *crtc_sta
 int intel_vrr_dcb_vmax_vblank_start_next(const struct intel_crtc_state *crtc_state);
 int intel_vrr_dcb_vmin_vblank_start_final(const struct intel_crtc_state *crtc_state);
 int intel_vrr_dcb_vmax_vblank_start_final(const struct intel_crtc_state *crtc_state);
+char *intel_vrr_cmrr_level_to_string(enum cmrr_level level);
 
 #endif /* __INTEL_VRR_H__ */
-- 
2.48.1

