Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78AA010F3DE7
	for <intel-gfx@archiver.kernel.org>; Sat, 28 Mar 2026 14:33:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4675B10E3D3;
	Sat, 28 Mar 2026 14:33:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PHH2rV0C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1336310E3EC
 for <intel-gfx@lists.freedesktop.org>; Sat, 28 Mar 2026 14:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774708403; x=1806244403;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/sFLnZfUf4SpMftOYMMKK/zXf+FcusZTwLekc6DwUeo=;
 b=PHH2rV0CvoBNrouOXR7dP3t4XkGLR68QTOXHWw/UYLZ7IYtYwu3S/DLi
 g2fcJDp+v7ZqIgyRsJ1Bu6lgv/AqyDjD1Cd5WWnl3rFszqeRgs6g5L42h
 mGQfa38haxC/TwZoyC5s9r+fZkROs/7TO5RnOX3rg9rjT4e/IEil6ea2N
 LChWuhY/ojuXMO6f9YUEzVmaYSM61PtFWILt+xFkNM4tetmT9R0M2MhO0
 KMSSnNxyjVhYfXs295L4PPWvtlRCnwtQOBSDDqzd/1UwXJjGv5FZ4UNI8
 gYjKFxCqZgJzJTUMODZqXuhxFcWbNpMd1hkT2QH5f12k1PQ0e6i/n7Bs4 A==;
X-CSE-ConnectionGUID: Y6dQozWISP6U1IVIBloFrQ==
X-CSE-MsgGUID: MhbtDdAIRKuyvAzq8B62EA==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="86839495"
X-IronPort-AV: E=Sophos;i="6.23,146,1770624000"; d="scan'208";a="86839495"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2026 07:33:23 -0700
X-CSE-ConnectionGUID: 52yVYDVYS3ayG4t2Xq/gOA==
X-CSE-MsgGUID: 4PbXc5mTTOOPq7QIDR2L2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,146,1770624000"; d="scan'208";a="224621097"
Received: from administrator-system-product-name.igk.intel.com (HELO
 dev-417.igk.intel.com) ([10.91.214.181])
 by orviesa006.jf.intel.com with ESMTP; 28 Mar 2026 07:33:22 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH v1 09/10] drm/i915/casf: abstract scaler searching loop
Date: Sat, 28 Mar 2026 15:32:11 +0100
Message-ID: <20260328143212.601656-10-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260328143212.601656-1-michal.grzelak@intel.com>
References: <20260328143212.601656-1-michal.grzelak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

Add a helper function hiding the search for scaler_id.

Cc: Nemesa Garg <nemesa.garg@intel.com>
Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 drivers/gpu/drm/i915/display/skl_scaler.c | 28 +++++++++++++++--------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/skl_scaler.c b/drivers/gpu/drm/i915/display/skl_scaler.c
index 9318fd1bcc45..1bd42ef36d07 100644
--- a/drivers/gpu/drm/i915/display/skl_scaler.c
+++ b/drivers/gpu/drm/i915/display/skl_scaler.c
@@ -858,6 +858,21 @@ void skl_pfit_enable(const struct intel_crtc_state *crtc_state)
 			  PS_WIN_XSIZE(width) | PS_WIN_YSIZE(height));
 }
 
+static int skl_pipe_scaler_get_hw_state(struct intel_crtc_state *crtc_state)
+{
+	struct intel_display *display = to_intel_display(crtc_state);
+	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
+	u32 ctl;
+
+	for (int scaler_id = 0; scaler_id < crtc->num_scalers; scaler_id++) {
+		ctl = intel_de_read(display, SKL_PS_CTRL(crtc->pipe, scaler_id));
+		if ((ctl & (PS_SCALER_EN | PS_BINDING_MASK)) == (PS_SCALER_EN | PS_BINDING_PIPE))
+			return scaler_id;
+	}
+
+	return -1;
+}
+
 void
 skl_program_plane_scaler(struct intel_dsb *dsb,
 			 struct intel_plane *plane,
@@ -969,17 +984,12 @@ void skl_scaler_get_config(struct intel_crtc_state *crtc_state)
 	struct intel_display *display = to_intel_display(crtc_state);
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	struct intel_crtc_scaler_state *scaler_state = &crtc_state->scaler_state;
-	int scaler_id;
-	u32 pos, size;
-
 	/* find scaler attached to this pipe */
-	for (scaler_id = 0; scaler_id < crtc->num_scalers; scaler_id++) {
-		u32 ctl;
+	int scaler_id = skl_pipe_scaler_get_hw_state(crtc_state);
+	u32 pos, size;
 
-		ctl = intel_de_read(display, SKL_PS_CTRL(crtc->pipe, scaler_id));
-		if ((ctl & (PS_SCALER_EN | PS_BINDING_MASK)) == (PS_SCALER_EN | PS_BINDING_PIPE))
-			break;
-	}
+	if (scaler_id < 0)
+		return;
 
 	/* Read CASF regs for second scaler */
 	if (HAS_CASF(display) && scaler_id == 1)
-- 
2.45.2

