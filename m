Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B909606A69E
	for <intel-gfx@archiver.kernel.org>; Tue, 24 Nov 2026 17:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Gspn7UF4
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15F9510E1A2;
	Tue, 24 Nov 2026 17:09:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A61410E328
 for <intel-gfx@lists.freedesktop.org>; Tue, 24 Nov 2026 17:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795540161; x=1827076161;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HqwbBSI2b29+CPgVQJ8fMLB4twAoaPiPS8Q4PXZMEfw=;
 b=Gspn7UF4jjr9fMeyonQO8IWh0ZSYe2nvlk+qr6Gyt5rdQSxdme8whYBO
 zzum0O8LhS0e0Iowv2/4lN+v1N0v5as1Ws7AYQd1KnJBYPlUZlTBxbP1S
 dZJSm9CNFOm+Zvqv1sVbs4JTte6qbE2gzcDD+CZrgaS4qv7oEl5atyMDF
 6ANP4q9UG4Ne75WTiL/Znw9j1grN/5dXn7wzlKg2yqA9OVWwnOrG76Stq
 SGrMEJBv/TRLzE7WwM07Y2GnUt9m1/MK2mGl1bHC+UgNAYRJJMFgxCx7Z
 uNVn91LMdu5HzH8k68S8VlPLYiagkR7jMk6r1jMoLs7sZNHy8sLF1V1TZ A==;
X-CSE-ConnectionGUID: wujpq96AQHmpofO62H/o9w==
X-CSE-MsgGUID: 31LiMFDoRIKy3S9E9phIJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4306261"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4306261"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 09:04:48 -0800
X-CSE-ConnectionGUID: 3DG0YV81QiOQAMhprRm1lA==
X-CSE-MsgGUID: lIfCSMI7StSAjJEowpZS0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; d="scan'208";a="13629021"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.215])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 09:04:46 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH] drm/i915/sbi: add and use intel_sbi_rmw()
Date: Tue, 24 Nov 2026 19:04:41 +0200
Message-ID: <20261124170441.1600907-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
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

Almost all of SBI access is read-modify-write with separate reads and
writes. Add intel_sbi_rmw() modeled after intel_de_rwm(), and use it to
make the code more concise and easier to read.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 .../gpu/drm/i915/display/intel_pch_refclk.c   | 144 +++++-------------
 drivers/gpu/drm/i915/display/intel_sbi.c      |  12 ++
 drivers/gpu/drm/i915/display/intel_sbi.h      |   2 +
 3 files changed, 49 insertions(+), 109 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_pch_refclk.c b/drivers/gpu/drm/i915/display/intel_pch_refclk.c
index 5f88663ef5e8..fe9dbc2b21ee 100644
--- a/drivers/gpu/drm/i915/display/intel_pch_refclk.c
+++ b/drivers/gpu/drm/i915/display/intel_pch_refclk.c
@@ -36,91 +36,32 @@ static void lpt_fdi_reset_mphy(struct intel_display *display)
 /* WaMPhyProgramming:hsw */
 static void lpt_fdi_program_mphy(struct intel_display *display)
 {
-	u32 tmp;
-
 	lpt_fdi_reset_mphy(display);
 
-	tmp = intel_sbi_read(display, 0x8008, SBI_MPHY);
-	tmp &= ~(0xFF << 24);
-	tmp |= (0x12 << 24);
-	intel_sbi_write(display, 0x8008, tmp, SBI_MPHY);
-
-	tmp = intel_sbi_read(display, 0x2008, SBI_MPHY);
-	tmp |= (1 << 11);
-	intel_sbi_write(display, 0x2008, tmp, SBI_MPHY);
-
-	tmp = intel_sbi_read(display, 0x2108, SBI_MPHY);
-	tmp |= (1 << 11);
-	intel_sbi_write(display, 0x2108, tmp, SBI_MPHY);
-
-	tmp = intel_sbi_read(display, 0x206C, SBI_MPHY);
-	tmp |= (1 << 24) | (1 << 21) | (1 << 18);
-	intel_sbi_write(display, 0x206C, tmp, SBI_MPHY);
-
-	tmp = intel_sbi_read(display, 0x216C, SBI_MPHY);
-	tmp |= (1 << 24) | (1 << 21) | (1 << 18);
-	intel_sbi_write(display, 0x216C, tmp, SBI_MPHY);
-
-	tmp = intel_sbi_read(display, 0x2080, SBI_MPHY);
-	tmp &= ~(7 << 13);
-	tmp |= (5 << 13);
-	intel_sbi_write(display, 0x2080, tmp, SBI_MPHY);
-
-	tmp = intel_sbi_read(display, 0x2180, SBI_MPHY);
-	tmp &= ~(7 << 13);
-	tmp |= (5 << 13);
-	intel_sbi_write(display, 0x2180, tmp, SBI_MPHY);
-
-	tmp = intel_sbi_read(display, 0x208C, SBI_MPHY);
-	tmp &= ~0xFF;
-	tmp |= 0x1C;
-	intel_sbi_write(display, 0x208C, tmp, SBI_MPHY);
-
-	tmp = intel_sbi_read(display, 0x218C, SBI_MPHY);
-	tmp &= ~0xFF;
-	tmp |= 0x1C;
-	intel_sbi_write(display, 0x218C, tmp, SBI_MPHY);
-
-	tmp = intel_sbi_read(display, 0x2098, SBI_MPHY);
-	tmp &= ~(0xFF << 16);
-	tmp |= (0x1C << 16);
-	intel_sbi_write(display, 0x2098, tmp, SBI_MPHY);
-
-	tmp = intel_sbi_read(display, 0x2198, SBI_MPHY);
-	tmp &= ~(0xFF << 16);
-	tmp |= (0x1C << 16);
-	intel_sbi_write(display, 0x2198, tmp, SBI_MPHY);
-
-	tmp = intel_sbi_read(display, 0x20C4, SBI_MPHY);
-	tmp |= (1 << 27);
-	intel_sbi_write(display, 0x20C4, tmp, SBI_MPHY);
-
-	tmp = intel_sbi_read(display, 0x21C4, SBI_MPHY);
-	tmp |= (1 << 27);
-	intel_sbi_write(display, 0x21C4, tmp, SBI_MPHY);
-
-	tmp = intel_sbi_read(display, 0x20EC, SBI_MPHY);
-	tmp &= ~(0xF << 28);
-	tmp |= (4 << 28);
-	intel_sbi_write(display, 0x20EC, tmp, SBI_MPHY);
-
-	tmp = intel_sbi_read(display, 0x21EC, SBI_MPHY);
-	tmp &= ~(0xF << 28);
-	tmp |= (4 << 28);
-	intel_sbi_write(display, 0x21EC, tmp, SBI_MPHY);
+	intel_sbi_rmw(display, 0x8008, 0xFF << 24, 0x12 << 24, SBI_MPHY);
+	intel_sbi_rmw(display, 0x2008, 0, 1 << 11, SBI_MPHY);
+	intel_sbi_rmw(display, 0x2108, 0, 1 << 11, SBI_MPHY);
+	intel_sbi_rmw(display, 0x206C, 0, (1 << 24) | (1 << 21) | (1 << 18), SBI_MPHY);
+	intel_sbi_rmw(display, 0x216C, 0, (1 << 24) | (1 << 21) | (1 << 18), SBI_MPHY);
+	intel_sbi_rmw(display, 0x2080, 7 << 13, 5 << 13, SBI_MPHY);
+	intel_sbi_rmw(display, 0x2180, 7 << 13, 5 << 13, SBI_MPHY);
+	intel_sbi_rmw(display, 0x208C, 0xFF, 0x1C, SBI_MPHY);
+	intel_sbi_rmw(display, 0x218C, 0xFF, 0x1C, SBI_MPHY);
+	intel_sbi_rmw(display, 0x2098, 0xFF << 16, 0x1C << 16, SBI_MPHY);
+	intel_sbi_rmw(display, 0x2198, 0xFF << 16, 0x1C << 16, SBI_MPHY);
+	intel_sbi_rmw(display, 0x20C4, 0, 1 << 27, SBI_MPHY);
+	intel_sbi_rmw(display, 0x21C4, 0, 1 << 27, SBI_MPHY);
+	intel_sbi_rmw(display, 0x20EC, 0xF << 28, 4 << 28, SBI_MPHY);
+	intel_sbi_rmw(display, 0x21EC, 0xF << 28, 4 << 28, SBI_MPHY);
 }
 
 void lpt_disable_iclkip(struct intel_display *display)
 {
-	u32 temp;
-
 	intel_de_write(display, PIXCLK_GATE, PIXCLK_GATE_GATE);
 
 	intel_sbi_lock(display);
 
-	temp = intel_sbi_read(display, SBI_SSCCTL6, SBI_ICLK);
-	temp |= SBI_SSCCTL_DISABLE;
-	intel_sbi_write(display, SBI_SSCCTL6, temp, SBI_ICLK);
+	intel_sbi_rmw(display, SBI_SSCCTL6, 0, SBI_SSCCTL_DISABLE, SBI_ICLK);
 
 	intel_sbi_unlock(display);
 }
@@ -185,7 +126,6 @@ void lpt_program_iclkip(const struct intel_crtc_state *crtc_state)
 	struct intel_display *display = to_intel_display(crtc_state);
 	int clock = crtc_state->hw.adjusted_mode.crtc_clock;
 	struct iclkip_params p;
-	u32 temp;
 
 	lpt_disable_iclkip(display);
 
@@ -205,25 +145,23 @@ void lpt_program_iclkip(const struct intel_crtc_state *crtc_state)
 	intel_sbi_lock(display);
 
 	/* Program SSCDIVINTPHASE6 */
-	temp = intel_sbi_read(display, SBI_SSCDIVINTPHASE6, SBI_ICLK);
-	temp &= ~SBI_SSCDIVINTPHASE_DIVSEL_MASK;
-	temp |= SBI_SSCDIVINTPHASE_DIVSEL(p.divsel);
-	temp &= ~SBI_SSCDIVINTPHASE_INCVAL_MASK;
-	temp |= SBI_SSCDIVINTPHASE_INCVAL(p.phaseinc);
-	temp |= SBI_SSCDIVINTPHASE_DIR(p.phasedir);
-	temp |= SBI_SSCDIVINTPHASE_PROPAGATE;
-	intel_sbi_write(display, SBI_SSCDIVINTPHASE6, temp, SBI_ICLK);
+	intel_sbi_rmw(display, SBI_SSCDIVINTPHASE6,
+		      SBI_SSCDIVINTPHASE_DIVSEL_MASK |
+		      SBI_SSCDIVINTPHASE_INCVAL_MASK,
+		      SBI_SSCDIVINTPHASE_DIVSEL(p.divsel) |
+		      SBI_SSCDIVINTPHASE_INCVAL(p.phaseinc) |
+		      SBI_SSCDIVINTPHASE_DIR(p.phasedir) |
+		      SBI_SSCDIVINTPHASE_PROPAGATE,
+		      SBI_ICLK);
 
 	/* Program SSCAUXDIV */
-	temp = intel_sbi_read(display, SBI_SSCAUXDIV6, SBI_ICLK);
-	temp &= ~SBI_SSCAUXDIV_FINALDIV2SEL(1);
-	temp |= SBI_SSCAUXDIV_FINALDIV2SEL(p.auxdiv);
-	intel_sbi_write(display, SBI_SSCAUXDIV6, temp, SBI_ICLK);
+	intel_sbi_rmw(display, SBI_SSCAUXDIV6,
+		      SBI_SSCAUXDIV_FINALDIV2SEL(1),
+		      SBI_SSCAUXDIV_FINALDIV2SEL(p.auxdiv),
+		      SBI_ICLK);
 
 	/* Enable modulator and associated divider */
-	temp = intel_sbi_read(display, SBI_SSCCTL6, SBI_ICLK);
-	temp &= ~SBI_SSCCTL_DISABLE;
-	intel_sbi_write(display, SBI_SSCCTL6, temp, SBI_ICLK);
+	intel_sbi_rmw(display, SBI_SSCCTL6, SBI_SSCCTL_DISABLE, 0, SBI_ICLK);
 
 	intel_sbi_unlock(display);
 
@@ -277,7 +215,7 @@ int lpt_get_iclkip(struct intel_display *display)
 static void lpt_enable_clkout_dp(struct intel_display *display,
 				 bool with_spread, bool with_fdi)
 {
-	u32 reg, tmp;
+	u32 reg;
 
 	if (drm_WARN(display->drm, with_fdi && !with_spread,
 		     "FDI requires downspread\n"))
@@ -288,26 +226,19 @@ static void lpt_enable_clkout_dp(struct intel_display *display,
 
 	intel_sbi_lock(display);
 
-	tmp = intel_sbi_read(display, SBI_SSCCTL, SBI_ICLK);
-	tmp &= ~SBI_SSCCTL_DISABLE;
-	tmp |= SBI_SSCCTL_PATHALT;
-	intel_sbi_write(display, SBI_SSCCTL, tmp, SBI_ICLK);
+	intel_sbi_rmw(display, SBI_SSCCTL, SBI_SSCCTL_DISABLE, SBI_SSCCTL_PATHALT, SBI_ICLK);
 
 	udelay(24);
 
 	if (with_spread) {
-		tmp = intel_sbi_read(display, SBI_SSCCTL, SBI_ICLK);
-		tmp &= ~SBI_SSCCTL_PATHALT;
-		intel_sbi_write(display, SBI_SSCCTL, tmp, SBI_ICLK);
+		intel_sbi_rmw(display, SBI_SSCCTL, SBI_SSCCTL_PATHALT, 0, SBI_ICLK);
 
 		if (with_fdi)
 			lpt_fdi_program_mphy(display);
 	}
 
 	reg = HAS_PCH_LPT_LP(display) ? SBI_GEN0 : SBI_DBUFF0;
-	tmp = intel_sbi_read(display, reg, SBI_ICLK);
-	tmp |= SBI_GEN0_CFG_BUFFENABLE_DISABLE;
-	intel_sbi_write(display, reg, tmp, SBI_ICLK);
+	intel_sbi_rmw(display, reg, 0, SBI_GEN0_CFG_BUFFENABLE_DISABLE, SBI_ICLK);
 
 	intel_sbi_unlock(display);
 }
@@ -320,9 +251,7 @@ void lpt_disable_clkout_dp(struct intel_display *display)
 	intel_sbi_lock(display);
 
 	reg = HAS_PCH_LPT_LP(display) ? SBI_GEN0 : SBI_DBUFF0;
-	tmp = intel_sbi_read(display, reg, SBI_ICLK);
-	tmp &= ~SBI_GEN0_CFG_BUFFENABLE_DISABLE;
-	intel_sbi_write(display, reg, tmp, SBI_ICLK);
+	intel_sbi_rmw(display, reg, SBI_GEN0_CFG_BUFFENABLE_DISABLE, 0, SBI_ICLK);
 
 	tmp = intel_sbi_read(display, SBI_SSCCTL, SBI_ICLK);
 	if (!(tmp & SBI_SSCCTL_DISABLE)) {
@@ -389,10 +318,7 @@ static void lpt_bend_clkout_dp(struct intel_display *display, int steps)
 		tmp = 0x00000000;
 	intel_sbi_write(display, SBI_SSCDITHPHASE, tmp, SBI_ICLK);
 
-	tmp = intel_sbi_read(display, SBI_SSCDIVINTPHASE, SBI_ICLK);
-	tmp &= 0xffff0000;
-	tmp |= sscdivintphase[idx];
-	intel_sbi_write(display, SBI_SSCDIVINTPHASE, tmp, SBI_ICLK);
+	intel_sbi_rmw(display, SBI_SSCDIVINTPHASE, 0x0000ffff, sscdivintphase[idx], SBI_ICLK);
 
 	intel_sbi_unlock(display);
 }
diff --git a/drivers/gpu/drm/i915/display/intel_sbi.c b/drivers/gpu/drm/i915/display/intel_sbi.c
index b636a0060d39..e671a8b5f3be 100644
--- a/drivers/gpu/drm/i915/display/intel_sbi.c
+++ b/drivers/gpu/drm/i915/display/intel_sbi.c
@@ -81,6 +81,18 @@ void intel_sbi_write(struct intel_display *display, u16 reg, u32 value,
 	intel_sbi_rw(display, reg, destination, &value, false);
 }
 
+u32 intel_sbi_rmw(struct intel_display *display, u16 reg, u32 clear, u32 set,
+		  enum intel_sbi_destination destination)
+{
+	u32 old, val;
+
+	old = intel_sbi_read(display, reg, destination);
+	val = (old & ~clear) | set;
+	intel_sbi_write(display, reg, val, destination);
+
+	return old;
+}
+
 void intel_sbi_init(struct intel_display *display)
 {
 	mutex_init(&display->sbi.lock);
diff --git a/drivers/gpu/drm/i915/display/intel_sbi.h b/drivers/gpu/drm/i915/display/intel_sbi.h
index 841f77a142a1..5e4afbbf25a6 100644
--- a/drivers/gpu/drm/i915/display/intel_sbi.h
+++ b/drivers/gpu/drm/i915/display/intel_sbi.h
@@ -23,5 +23,7 @@ u32 intel_sbi_read(struct intel_display *display, u16 reg,
 		   enum intel_sbi_destination destination);
 void intel_sbi_write(struct intel_display *display, u16 reg, u32 value,
 		     enum intel_sbi_destination destination);
+u32 intel_sbi_rmw(struct intel_display *display, u16 reg, u32 clear, u32 set,
+		  enum intel_sbi_destination destination);
 
 #endif /* _INTEL_SBI_H_ */
-- 
2.47.3

