Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30296F3ED5B
	for <intel-gfx@archiver.kernel.org>; Sat, 11 Apr 2026 17:46:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE3E810E214;
	Sat, 11 Apr 2026 17:46:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VKGedmgo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0859110E214
 for <intel-gfx@lists.freedesktop.org>; Sat, 11 Apr 2026 17:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775929579; x=1807465579;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5MWVYL/afAvuk7/me77FAgEnOvBQIXRWn6DJMoMgcb4=;
 b=VKGedmgozJFBVrgqpEfe98+YKDUNTmK0gi+mX+G74RgmiU0HBce3UpYm
 suk6aR0C0Lww0PFRhVxfWP1gGemdEPh3fUaU1/5Vr01r18LbhE7hCOG3g
 xenkEwHMjd+eOUxGfzNrOMAmLrM29xzc+52990jJKuCYwos2fk0DvcEdA
 PhrOfkIMSyL4NmXljG3Rn4YPx4HAhPSaUg+g43w0z4Iny/wh84JRS/pzc
 WPwpzBnWWihKsG3VOXaec9nyVkN5mzo9/r1nyQd7mUSXfde9wiP2dCFvf
 C1jcYG6xXVWJEuxhec6sqgkGzrVAXpcRL3Y0IJ1zR9GYb9GaNlERLGAlN w==;
X-CSE-ConnectionGUID: Nck8KDjgQuqq6HU5g5zm4A==
X-CSE-MsgGUID: reBCqgi+T3aMmi/Sx7Shdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="99564225"
X-IronPort-AV: E=Sophos;i="6.23,173,1770624000"; d="scan'208";a="99564225"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2026 10:46:18 -0700
X-CSE-ConnectionGUID: Ymv5LgwASyWjjbzNatYq4g==
X-CSE-MsgGUID: ga8j7t6PROiRN7mbcxS7rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,173,1770624000"; d="scan'208";a="222899849"
Received: from administrator-system-product-name.igk.intel.com (HELO
 dev-417.igk.intel.com) ([10.91.214.181])
 by fmviesa009.fm.intel.com with ESMTP; 11 Apr 2026 10:46:16 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Nemesa Garg <nemesa.garg@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH v2 04/10] drm/i915/casf: rename sumcoeff into sum_coeff
Date: Sat, 11 Apr 2026 19:45:20 +0200
Message-ID: <20260411174526.2850179-5-michal.grzelak@intel.com>
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

Stick to using snake_case in intel_casf_scaler_compute_coeff() where
it is possible.

Cc: Nemesa Garg <nemesa.garg@intel.com>
Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_casf.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_casf.c b/drivers/gpu/drm/i915/display/intel_casf.c
index b9643548d1822..cafd21a036320 100644
--- a/drivers/gpu/drm/i915/display/intel_casf.c
+++ b/drivers/gpu/drm/i915/display/intel_casf.c
@@ -218,7 +218,7 @@ static void intel_casf_scaler_compute_coeff(struct intel_crtc_state *crtc_state)
 {
 	const u16 *filtercoeff;
 	u16 filter_coeff[SCALER_FILTER_NUM_TAPS];
-	u16 sumcoeff = 0;
+	u16 sum_coeff = 0;
 	int i;
 
 	if (crtc_state->pch_pfit.casf.win_size == 0)
@@ -229,10 +229,10 @@ static void intel_casf_scaler_compute_coeff(struct intel_crtc_state *crtc_state)
 		filtercoeff = filtercoeff_3;
 
 	for (i = 0; i < SCALER_FILTER_NUM_TAPS; i++)
-		sumcoeff += *(filtercoeff + i);
+		sum_coeff += *(filtercoeff + i);
 
 	for (i = 0; i < SCALER_FILTER_NUM_TAPS; i++) {
-		filter_coeff[i] = (*(filtercoeff + i) * 100 / sumcoeff);
+		filter_coeff[i] = (*(filtercoeff + i) * 100 / sum_coeff);
 		convert_sharpness_coeff_binary(&crtc_state->pch_pfit.casf.coeff[i],
 					      filter_coeff[i]);
 	}
-- 
2.45.2

