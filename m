Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83315F3ED59
	for <intel-gfx@archiver.kernel.org>; Sat, 11 Apr 2026 17:46:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1855110E217;
	Sat, 11 Apr 2026 17:46:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H2x6z5TV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9222C10E217
 for <intel-gfx@lists.freedesktop.org>; Sat, 11 Apr 2026 17:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775929581; x=1807465581;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VftkVrLZQQTev5Y0qV6rlBO9ydiQK7bZnlm+luz9DzI=;
 b=H2x6z5TV/MuDHQ1vbfW3KuJrtGv+n77v72xH7H1ExWJnGqdsUrP8QerH
 R4Kv7QGfURaCEmi9bAlFE9j/DuN12LkmGY7rA6WDN1glhAaGiNQnBA/tV
 2SKELsj9Uw3082suyYrfYnLi0HXD9FayBPP1uNS4OXhHIPH9NnLBKR+4G
 6scqeT9Qi3OMh02haltSFD+uVOV0L+snCQAICyKcXtEVGyOqLRFpCVQXq
 VIkE6Iebm3NyzweZORrrlYOyyl44Z6PpVYtLXKBdyEiSgAGolEzapvuIp
 2UUy3T8BMQ4Iv4Bt/S0Q4wUXYudTnoQH7H9EoC4boivLgofY2xVwu4esB g==;
X-CSE-ConnectionGUID: EJh5keBgT/ON2sOmkngCCA==
X-CSE-MsgGUID: tlBun7RsTe+MiASOM9jihQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="99564230"
X-IronPort-AV: E=Sophos;i="6.23,173,1770624000"; d="scan'208";a="99564230"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2026 10:46:21 -0700
X-CSE-ConnectionGUID: QMzT8VH5QkSzq8L7LQ2fZQ==
X-CSE-MsgGUID: w5Gt/kf8SJuJ04j1WFkPog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,173,1770624000"; d="scan'208";a="222899858"
Received: from administrator-system-product-name.igk.intel.com (HELO
 dev-417.igk.intel.com) ([10.91.214.181])
 by fmviesa009.fm.intel.com with ESMTP; 11 Apr 2026 10:46:19 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Nemesa Garg <nemesa.garg@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH v2 06/10] drm/i915/scaler: remove id in favor of scaler_id
Date: Sat, 11 Apr 2026 19:45:22 +0200
Message-ID: <20260411174526.2850179-7-michal.grzelak@intel.com>
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

id is not really used anywhere in skl_scaler_get_config(). Replace it
with scaler_id.

Return if no scaler was found.

v1->v2
- check if any scaler was found (Ville)

Cc: Nemesa Garg <nemesa.garg@intel.com>
Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 drivers/gpu/drm/i915/display/skl_scaler.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/skl_scaler.c b/drivers/gpu/drm/i915/display/skl_scaler.c
index d15e0194ca107..6d9080ec74ce0 100644
--- a/drivers/gpu/drm/i915/display/skl_scaler.c
+++ b/drivers/gpu/drm/i915/display/skl_scaler.c
@@ -951,7 +951,6 @@ void skl_scaler_get_config(struct intel_crtc_state *crtc_state)
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	struct intel_crtc_scaler_state *scaler_state = &crtc_state->scaler_state;
 	int scaler_id;
-	int id = -1;
 
 	/* find scaler attached to this pipe */
 	for (scaler_id = 0; scaler_id < crtc->num_scalers; scaler_id++) {
@@ -961,8 +960,6 @@ void skl_scaler_get_config(struct intel_crtc_state *crtc_state)
 		if ((ctl & (PS_SCALER_EN | PS_BINDING_MASK)) != (PS_SCALER_EN | PS_BINDING_PIPE))
 			continue;
 
-		id = scaler_id;
-
 		if (scaler_has_casf(display, scaler_id))
 			intel_casf_sharpness_get_config(crtc_state);
 
@@ -981,8 +978,11 @@ void skl_scaler_get_config(struct intel_crtc_state *crtc_state)
 		break;
 	}
 
-	scaler_state->scaler_id = id;
-	if (id >= 0)
+	if (scaler_id == crtc->num_scalers)
+		return;
+
+	scaler_state->scaler_id = scaler_id;
+	if (scaler_id >= 0)
 		scaler_state->scaler_users |= (1 << SKL_CRTC_INDEX);
 	else
 		scaler_state->scaler_users &= ~(1 << SKL_CRTC_INDEX);
-- 
2.45.2

