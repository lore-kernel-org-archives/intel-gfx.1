Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC354C5CFCF
	for <intel-gfx@archiver.kernel.org>; Tue, 11 Aug 2026 09:54:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C67510E2EC;
	Tue, 11 Aug 2026 09:54:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fw4BYv9N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 349F410E2E8
 for <intel-gfx@lists.freedesktop.org>; Tue, 11 Aug 2026 09:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786442088; x=1817978088;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kmfF1M4RMeFhO2j5ZA9O7WPeNvi5utZonEaUaLfgR0o=;
 b=Fw4BYv9NZCMm/ApMrAdax/jN5SrlDiXALl2tjejX2sBbDkOuJ0/R/btH
 10MyXKTr8Ww0idwVVUJmyP9V52jee7uVXLUa/b+cd+51S4mMkLSBVdsTL
 vDkgf6L4VWcXP8jFb3tyd1fwF/I42P3jKxtAvhN8g9/pkROfFS+0EA0EN
 Y/U9K+QGOpnz3YCMX7VLg6njRWxrdptlBbIWHV3krzE/C5TQUw1QuiX/m
 aE3ekCJwoIl/5PWEsEFmMjUlC5yNzTJfVHkImiKPFLLdJ2MRcHQR8RJWP
 Kqvl6D65foylLJ3OmgemUF/uSKzFprCQzbNimlr+eXOMYI6ACnYiywZ1l w==;
X-CSE-ConnectionGUID: 6GqSnR+kSJWZ2sHFIdhJmQ==
X-CSE-MsgGUID: joND9BuoT4anR2khSAXh9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="104359915"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="104359915"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 02:54:47 -0700
X-CSE-ConnectionGUID: ym5teCv4RSWUei8QEmVQBA==
X-CSE-MsgGUID: TEYYfj4mR6O6BV1tYJ+lCg==
X-ExtLoop1: 1
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO hazy.intel.com)
 ([10.245.245.2])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 02:54:45 -0700
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH v2 4/5] drm/i915/display: add a way to restore only
 display/pch registers in clock_gating
Date: Tue, 11 Aug 2026 12:49:12 +0300
Message-ID: <20260811095427.1147852-5-luciano.coelho@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260811095427.1147852-1-luciano.coelho@intel.com>
References: <20260811095427.1147852-1-luciano.coelho@intel.com>
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

We are currently calling intel_clock_gating_init() when disabling PC8
in the display code.  This adds an unnecessary dependency to the core
i915 code.  Only the display and PCH registers need to be restored
here, so we can do this directly in the display code, removing the
dependency.

Add intel_display_restore_clock_gating() to do this.

Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_clock_gating.c | 7 +++++++
 drivers/gpu/drm/i915/display/intel_display_clock_gating.h | 1 +
 drivers/gpu/drm/i915/display/intel_display_power.c        | 4 ++--
 3 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_clock_gating.c b/drivers/gpu/drm/i915/display/intel_display_clock_gating.c
index ef1ee72494df..6716c377ef93 100644
--- a/drivers/gpu/drm/i915/display/intel_display_clock_gating.c
+++ b/drivers/gpu/drm/i915/display/intel_display_clock_gating.c
@@ -11,6 +11,7 @@
 #include "intel_display_clock_gating.h"
 #include "intel_display_core.h"
 #include "intel_display_regs.h"
+#include "intel_pch.h"
 
 static void intel_display_gen9_init_clock_gating(struct intel_display *display)
 {
@@ -305,3 +306,9 @@ void intel_display_init_clock_gating(struct intel_display *display)
 	else if (display->platform.i965gm)
 		intel_display_i965gm_init_clock_gating(display);
 }
+
+void intel_display_restore_clock_gating(struct intel_display *display)
+{
+	intel_display_init_clock_gating(display);
+	intel_pch_init_clock_gating(display);
+}
diff --git a/drivers/gpu/drm/i915/display/intel_display_clock_gating.h b/drivers/gpu/drm/i915/display/intel_display_clock_gating.h
index dbfa5892cffe..074708a22436 100644
--- a/drivers/gpu/drm/i915/display/intel_display_clock_gating.h
+++ b/drivers/gpu/drm/i915/display/intel_display_clock_gating.h
@@ -9,5 +9,6 @@
 struct intel_display;
 
 void intel_display_init_clock_gating(struct intel_display *display);
+void intel_display_restore_clock_gating(struct intel_display *display);
 
 #endif /* __INTEL_DISPLAY_CLOCK_GATING_H__ */
diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
index 0ebec6e0c240..aab934f43530 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power.c
@@ -12,7 +12,7 @@
 
 #include "intel_backlight_regs.h"
 #include "intel_cdclk.h"
-#include "intel_clock_gating.h"
+#include "intel_display_clock_gating.h"
 #include "intel_combo_phy.h"
 #include "intel_crtc.h"
 #include "intel_de.h"
@@ -1588,7 +1588,7 @@ static void hsw_disable_pc8(struct intel_display *display)
 	intel_init_pch_refclk(display);
 
 	/* Many display registers don't survive PC8+ */
-	intel_clock_gating_init(display->drm);
+	intel_display_restore_clock_gating(display);
 }
 
 static void intel_pch_reset_handshake(struct intel_display *display,
-- 
2.53.0

