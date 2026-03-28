Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 055B310F3DCE
	for <intel-gfx@archiver.kernel.org>; Sat, 28 Mar 2026 14:33:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3616310E11F;
	Sat, 28 Mar 2026 14:33:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JkOKuoVB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FFFD10E3EC
 for <intel-gfx@lists.freedesktop.org>; Sat, 28 Mar 2026 14:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774708394; x=1806244394;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mimqalLtl6ZPffVdIvEXsjXel9q8kjv/BYAYNr377D4=;
 b=JkOKuoVB1goNz6mW+evhamN1QaygPM4FR0S7NFrAWk7YVggfQVz5XrwV
 rQZPFSabtgf+whK6u51yI4zHajDLz7kxWY12uljSMY8O1pPtu7KKj8nbK
 +CrIC+XsEyO+pTJV6nxGrXmQIawOeUf5FpNU7HZBsvpVCjLfzU4N3Ro+H
 Lla5y4Rcm9vuW7pCqhfxwJHbY1g/eKTQ5Kymw1Yt6dXaoPtFxuPzYOITu
 LRwjodu7yKaVMG7hTWQOtd8DlIsuW5mtaqYB384xXNplsfm/9TQvLLXpk
 /hbt3Q9ugdSlScRl16/sed/UPjDjnnNDTV0FsThk5coEFo2KMaQt/+eb8 g==;
X-CSE-ConnectionGUID: kgH0W2tRQQSoJfJZTlTyPw==
X-CSE-MsgGUID: cO1dRSN6RSWoEgZmqW5a9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="86839488"
X-IronPort-AV: E=Sophos;i="6.23,146,1770624000"; d="scan'208";a="86839488"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2026 07:33:13 -0700
X-CSE-ConnectionGUID: wKzAO7uqTGSf+SHtF2SUaA==
X-CSE-MsgGUID: WhwpxMABSLCXfr0COQkopQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,146,1770624000"; d="scan'208";a="224621069"
Received: from administrator-system-product-name.igk.intel.com (HELO
 dev-417.igk.intel.com) ([10.91.214.181])
 by orviesa006.jf.intel.com with ESMTP; 28 Mar 2026 07:33:13 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH v1 02/10] drm/i915/casf: rename convert_sharpness_coef_binary()
Date: Sat, 28 Mar 2026 15:32:04 +0100
Message-ID: <20260328143212.601656-3-michal.grzelak@intel.com>
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

Stick to the notion of already used *_coeff_*() instead of *_coef_*().

Cc: Nemesa Garg <nemesa.garg@intel.com>
Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_casf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_casf.c b/drivers/gpu/drm/i915/display/intel_casf.c
index 7231ddb4b36c..13682de697be 100644
--- a/drivers/gpu/drm/i915/display/intel_casf.c
+++ b/drivers/gpu/drm/i915/display/intel_casf.c
@@ -222,7 +222,7 @@ static void intel_casf_write_coeff(struct intel_crtc_state *crtc_state)
 	}
 }
 
-static void convert_sharpness_coef_binary(struct scaler_filter_coeff *coeff,
+static void convert_sharpness_coeff_binary(struct scaler_filter_coeff *coeff,
 					  u16 coefficient)
 {
 	if (coefficient < 25) {
@@ -259,7 +259,7 @@ void intel_casf_scaler_compute_config(struct intel_crtc_state *crtc_state)
 
 	for (i = 0; i < SCALER_FILTER_NUM_TAPS; i++) {
 		filter_coeff[i] = (*(filtercoeff + i) * 100 / sumcoeff);
-		convert_sharpness_coef_binary(&crtc_state->hw.casf_params.coeff[i],
+		convert_sharpness_coeff_binary(&crtc_state->hw.casf_params.coeff[i],
 					      filter_coeff[i]);
 	}
 }
-- 
2.45.2

