Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5167AF3ED5B
	for <intel-gfx@archiver.kernel.org>; Sat, 11 Apr 2026 17:46:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C734B10E21C;
	Sat, 11 Apr 2026 17:46:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fzNc6O4m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90F8C10E21B
 for <intel-gfx@lists.freedesktop.org>; Sat, 11 Apr 2026 17:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775929580; x=1807465580;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=h1Jlb2hV5BsWAS4YnYmKYe5rkhPNX3xme/81Gj3SVWo=;
 b=fzNc6O4mnq+h41I8m0NCcYYsFQarijkFW5waVSU9SXr9VOK8+lv3p5Zz
 2RzMm4rnPjgf8XRhZDuUJq/xP4AoZkns3iVXAvh7RHt8hB7xsthFSoyQz
 +kUNAsP1F/EFLz6TxP098hBA6bCtKYK+BvfO/ikJYK4gKMtfKzD0Uplrt
 TiwB6ZSVFOFq5PAzpkorlc7VrjEy0jCE2ukRkGPUYJXreGg4jSw0PLpxx
 2dkkRf2r0NneaQtZhoRnGQV2E0dZpU9N0z/VJA+UIT6TqQDmj1YBei562
 fCLk6b+dyBoyndvWilvjCsNr0Sum2vxMGsK9G3nmLi2wNWRzjlDGBIESH w==;
X-CSE-ConnectionGUID: cXQj0YoyTLSCaKZlyHSTNw==
X-CSE-MsgGUID: AsVXSCF/SAGTdqj/vEnwhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="99564227"
X-IronPort-AV: E=Sophos;i="6.23,173,1770624000"; d="scan'208";a="99564227"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2026 10:46:20 -0700
X-CSE-ConnectionGUID: XhFr6gwLRYSXkep3yPQ/EQ==
X-CSE-MsgGUID: S7XvDcWURcaMj313EOkbdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,173,1770624000"; d="scan'208";a="222899853"
Received: from administrator-system-product-name.igk.intel.com (HELO
 dev-417.igk.intel.com) ([10.91.214.181])
 by fmviesa009.fm.intel.com with ESMTP; 11 Apr 2026 10:46:18 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Nemesa Garg <nemesa.garg@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH v2 05/10] drm/i915/scaler: s/i/scaler_id where appropriate
Date: Sat, 11 Apr 2026 19:45:21 +0200
Message-ID: <20260411174526.2850179-6-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260411174526.2850179-1-michal.grzelak@intel.com>
References: <20260411174526.2850179-1-michal.grzelak@intel.com>
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

Switch from generic iterator naming into more specific scaler_id where
it is possible.

Cc: Nemesa Garg <nemesa.garg@intel.com>
Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 drivers/gpu/drm/i915/display/skl_scaler.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/skl_scaler.c b/drivers/gpu/drm/i915/display/skl_scaler.c
index eceda1a909ccd..d15e0194ca107 100644
--- a/drivers/gpu/drm/i915/display/skl_scaler.c
+++ b/drivers/gpu/drm/i915/display/skl_scaler.c
@@ -950,26 +950,26 @@ void skl_scaler_get_config(struct intel_crtc_state *crtc_state)
 	struct intel_display *display = to_intel_display(crtc_state);
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	struct intel_crtc_scaler_state *scaler_state = &crtc_state->scaler_state;
+	int scaler_id;
 	int id = -1;
-	int i;
 
 	/* find scaler attached to this pipe */
-	for (i = 0; i < crtc->num_scalers; i++) {
+	for (scaler_id = 0; scaler_id < crtc->num_scalers; scaler_id++) {
 		u32 ctl, pos, size;
 
-		ctl = intel_de_read(display, SKL_PS_CTRL(crtc->pipe, i));
+		ctl = intel_de_read(display, SKL_PS_CTRL(crtc->pipe, scaler_id));
 		if ((ctl & (PS_SCALER_EN | PS_BINDING_MASK)) != (PS_SCALER_EN | PS_BINDING_PIPE))
 			continue;
 
-		id = i;
+		id = scaler_id;
 
-		if (scaler_has_casf(display, i))
+		if (scaler_has_casf(display, scaler_id))
 			intel_casf_sharpness_get_config(crtc_state);
 
 		crtc_state->pch_pfit.enabled = true;
 
-		pos = intel_de_read(display, SKL_PS_WIN_POS(crtc->pipe, i));
-		size = intel_de_read(display, SKL_PS_WIN_SZ(crtc->pipe, i));
+		pos = intel_de_read(display, SKL_PS_WIN_POS(crtc->pipe, scaler_id));
+		size = intel_de_read(display, SKL_PS_WIN_SZ(crtc->pipe, scaler_id));
 
 		drm_rect_init(&crtc_state->pch_pfit.dst,
 			      REG_FIELD_GET(PS_WIN_XPOS_MASK, pos),
@@ -977,7 +977,7 @@ void skl_scaler_get_config(struct intel_crtc_state *crtc_state)
 			      REG_FIELD_GET(PS_WIN_XSIZE_MASK, size),
 			      REG_FIELD_GET(PS_WIN_YSIZE_MASK, size));
 
-		scaler_state->scalers[i].in_use = true;
+		scaler_state->scalers[scaler_id].in_use = true;
 		break;
 	}
 
-- 
2.45.2

