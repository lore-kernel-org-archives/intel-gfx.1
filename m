Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAB4EC982D7
	for <intel-gfx@archiver.kernel.org>; Fri, 18 Sep 2026 23:39:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7DE310E4D5;
	Fri, 18 Sep 2026 23:39:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G7maSf6a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4095210E4A4
 for <intel-gfx@lists.freedesktop.org>; Fri, 18 Sep 2026 23:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789774751; x=1821310751;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bm99g9Vf7j7vW7id3HRQqlvv3FS4mB1JsyRvp3rAOTY=;
 b=G7maSf6avjwixPrBsS4AqaNAlIb6BdgLAzVuZRgr5YziMU5th+Qq4fo5
 leLG33FL9e+JSz/NFuZdr6eSwIsFlGhZNPdBIXVIjNdruG1zcUpK/q3kT
 pgEniPYdVeUskAzYnKxwKzWDUYhmlYFhXSxU6qTtgOvsmV2a0cmIcY82b
 NGkQjM0d9iamGkKhUxbXvV2cMB3lfey4Horo8dFaQ3Oq/RrGTfLCpHwCI
 Jyhegku1gmMQoa9pI+uK+egN1uFMzDuBfnOfe5qZWI7BhRqMmYJB/Zr+v
 PhQKsjnDfyQ/w7Ty6PkLpJ4vmFRHtyFILIrtxMnPfTY2OqLOPNKBpKLyP A==;
X-CSE-ConnectionGUID: t1MACpsoTuOWSeiIBPOL3g==
X-CSE-MsgGUID: nMAiG3m2TN6n0OQIGCLNKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="100978201"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; d="scan'208";a="100978201"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 16:39:11 -0700
X-CSE-ConnectionGUID: V5eLtGshQB63eISmlILpJQ==
X-CSE-MsgGUID: 1IVYC7TMRIO+7KwcbquV7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; d="scan'208";a="298072245"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 16:39:10 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
Subject: [PATCH v3 1/1] drm/i915/display: clean SKL_DSSM register macros
Date: Sat, 19 Sep 2026 01:25:10 +0200
Message-ID: <20260918232510.3583453-2-michal.grzelak@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260918232510.3583453-1-michal.grzelak@linux.intel.com>
References: <20260918232510.3583453-1-michal.grzelak@linux.intel.com>
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

Indent SKL_DSSM register macros. Define mask and register values with
REG_GENMASK() and REG_FIELD_PREP() instead of bit shifts. No functional
change.

v2->v3
- s/fix/clean/ (Jani)

v1->v2
- s/REG_GENMASK/REG_FIELD_PREP/ (Jani)

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Michał Grzelak <michal.grzelak@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_regs.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_regs.h b/drivers/gpu/drm/i915/display/intel_display_regs.h
index 8251ec15190bc..0b3991bc3aef5 100644
--- a/drivers/gpu/drm/i915/display/intel_display_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_display_regs.h
@@ -1779,10 +1779,10 @@
 #define   XE2LPD_DE_CAP_SCALER_SINGLE	1
 
 #define SKL_DSSM				_MMIO(0x51004)
-#define ICL_DSSM_CDCLK_PLL_REFCLK_MASK		(7 << 29)
-#define ICL_DSSM_CDCLK_PLL_REFCLK_24MHz		(0 << 29)
-#define ICL_DSSM_CDCLK_PLL_REFCLK_19_2MHz	(1 << 29)
-#define ICL_DSSM_CDCLK_PLL_REFCLK_38_4MHz	(2 << 29)
+#define   ICL_DSSM_CDCLK_PLL_REFCLK_MASK	REG_GENMASK(31, 29)
+#define   ICL_DSSM_CDCLK_PLL_REFCLK_24MHz	REG_FIELD_PREP(ICL_DSSM_CDCLK_PLL_REFCLK_MASK, 0)
+#define   ICL_DSSM_CDCLK_PLL_REFCLK_19_2MHz	REG_FIELD_PREP(ICL_DSSM_CDCLK_PLL_REFCLK_MASK, 1)
+#define   ICL_DSSM_CDCLK_PLL_REFCLK_38_4MHz	REG_FIELD_PREP(ICL_DSSM_CDCLK_PLL_REFCLK_MASK, 2)
 
 /*GEN11 chicken */
 #define _PIPEA_CHICKEN				0x70038
-- 
2.45.2

