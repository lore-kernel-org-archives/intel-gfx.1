Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FBA6ECD6EA
	for <intel-gfx@archiver.kernel.org>; Thu, 12 Feb 2026 12:57:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5F0C10E73B;
	Thu, 12 Feb 2026 12:56:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RN5EQSye";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2D5F10E734
 for <intel-gfx@lists.freedesktop.org>; Thu, 12 Feb 2026 12:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770901018; x=1802437018;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=9QcZ/R4m3S/Tyn1XQbYvYtyCzj2owFhra56Dq2jvsz0=;
 b=RN5EQSye8Y65F2kPdQbC5ODq6ZCZOlIAvBbSkJYti+b/uhFo0JSoXQ3L
 zYnFxksbIg0RE+PJWcK8aPlWHipRiwXDf8bJscfSx0WuUuhWxcXyyJCj6
 GZDGIUVUxAkAFbbmgMLLx5tM9nTW96j2SQuhJ5EPcfyvPm2bMPbYq7SjZ
 SaeLVI37AbvoHOgi2G3I5lGKtDWYqflqg5pk1aoe6LjayrB/LK9exacBU
 NinApIw7FnDDhmr6SizjBWuOW3htrS3fHs0m8bfKJHZ4mv8FR0M2ce/nk
 egnPLGZ4kwq5ymvXBtY0OHt8P+X9pCSdlko2s2+XKU6coa+Ik0RuMgFfL g==;
X-CSE-ConnectionGUID: al19q/3KRJuTJsYKPhwG3g==
X-CSE-MsgGUID: wdaLDcw3TYStsWBDNGQrFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="72116756"
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; d="scan'208";a="72116756"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 04:56:58 -0800
X-CSE-ConnectionGUID: 9tUxqzZESdGB4xgid7LTbw==
X-CSE-MsgGUID: 1BVhnFS9SiOhi8s9hxvG9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; d="scan'208";a="212698626"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO hazy.intel.com)
 ([10.245.245.167])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 04:56:57 -0800
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 06/16] drm/i915/display: convert W/As in intel_display.c to
 new framework
Date: Thu, 12 Feb 2026 14:51:55 +0200
Message-ID: <20260212125526.344401-7-luciano.coelho@intel.com>
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
 drivers/gpu/drm/i915/display/intel_display.c    | 4 ++--
 drivers/gpu/drm/i915/display/intel_display_wa.c | 2 ++
 drivers/gpu/drm/i915/display/intel_display_wa.h | 1 +
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index bd93add5101b..36312e8444bf 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -454,7 +454,7 @@ void intel_enable_transcoder(const struct intel_crtc_state *new_crtc_state)
 	}
 
 	/* Wa_22012358565:adl-p */
-	if (DISPLAY_VER(display) == 13)
+	if (intel_display_wa(display, 22012358565))
 		intel_de_rmw(display, PIPE_ARB_CTL(display, pipe),
 			     0, PIPE_ARB_USE_PROG_SLOTS);
 
@@ -708,7 +708,7 @@ static void icl_set_pipe_chicken(const struct intel_crtc_state *crtc_state)
 		tmp |= UNDERRUN_RECOVERY_DISABLE_ADLP;
 
 	/* Wa_14010547955:dg2 */
-	if (display->platform.dg2)
+	if (intel_display_wa(display, 14010547955))
 		tmp |= DG2_RENDER_CCSTAG_4_3_EN;
 
 	intel_de_write(display, PIPE_CHICKEN(pipe), tmp);
diff --git a/drivers/gpu/drm/i915/display/intel_display_wa.c b/drivers/gpu/drm/i915/display/intel_display_wa.c
index e2bbc3a90eca..744ca7828f06 100644
--- a/drivers/gpu/drm/i915/display/intel_display_wa.c
+++ b/drivers/gpu/drm/i915/display/intel_display_wa.c
@@ -77,6 +77,8 @@ bool __intel_display_wa(struct intel_display *display, enum intel_display_wa wa,
 	case INTEL_DISPLAY_WA_13012396614:
 		return DISPLAY_VERx100(display) == 3000 ||
 			DISPLAY_VERx100(display) == 3500;
+	case INTEL_DISPLAY_WA_14010547955:
+		return display->platform.dg2;
 	case INTEL_DISPLAY_WA_14010685332:
 		return INTEL_PCH_TYPE(display) >= PCH_CNP &&
 			INTEL_PCH_TYPE(display) < PCH_DG1;
diff --git a/drivers/gpu/drm/i915/display/intel_display_wa.h b/drivers/gpu/drm/i915/display/intel_display_wa.h
index b9c088025fd7..4fab1b27087a 100644
--- a/drivers/gpu/drm/i915/display/intel_display_wa.h
+++ b/drivers/gpu/drm/i915/display/intel_display_wa.h
@@ -29,6 +29,7 @@ bool intel_display_needs_wa_16023588340(struct intel_display *display);
 enum intel_display_wa {
 	INTEL_DISPLAY_WA_1409767108,
 	INTEL_DISPLAY_WA_13012396614,
+	INTEL_DISPLAY_WA_14010547955,
 	INTEL_DISPLAY_WA_14010685332,
 	INTEL_DISPLAY_WA_14011294188,
 	INTEL_DISPLAY_WA_14011503030,
-- 
2.51.0

