Return-Path: <SRS0=1k+4=QF=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6938C433EF
	for <intel-gfx@archiver.kernel.org>; Thu, 18 Nov 2021 08:55:17 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92269619BB
	for <intel-gfx@archiver.kernel.org>; Thu, 18 Nov 2021 08:55:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 92269619BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A6236EB73;
	Thu, 18 Nov 2021 08:55:16 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C92396EB6D
 for <intel-gfx@lists.freedesktop.org>; Thu, 18 Nov 2021 08:55:09 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10171"; a="221025319"
X-IronPort-AV: E=Sophos;i="5.87,244,1631602800"; d="scan'208";a="221025319"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2021 00:55:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,244,1631602800"; d="scan'208";a="507341344"
Received: from sorvi2.fi.intel.com ([10.237.72.194])
 by orsmga008.jf.intel.com with ESMTP; 18 Nov 2021 00:55:08 -0800
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Thu, 18 Nov 2021 10:54:22 +0200
Message-Id: <20211118085424.685686-3-mika.kahola@intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211118085424.685686-1-mika.kahola@intel.com>
References: <20211118085424.685686-1-mika.kahola@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 2/4] drm/i915/display/dg2: Read CD clock from
 squasher table
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

To calculate CD clock with squasher unit, we set CD clock ratio to fixed value of 34.
The CD clock value is read from CD clock squasher table.

BSpec: 54034

v2: Read ratio from register (Ville)
    Drop unnecessary local variable (Ville)
    Get CD clock from the given table
v3: Calculate CD clock frequency based on waveform bit pattern (Ville)
[v4: vsyrjala: Actually do a proper blind readout from the hardware]
[v5: vsyrjala: Use has_cdclk_squasher()]

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_cdclk.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
index 7af4cb965060..630a53d4f882 100644
--- a/drivers/gpu/drm/i915/display/intel_cdclk.c
+++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
@@ -1461,6 +1461,7 @@ static void bxt_de_pll_readout(struct drm_i915_private *dev_priv,
 static void bxt_get_cdclk(struct drm_i915_private *dev_priv,
 			  struct intel_cdclk_config *cdclk_config)
 {
+	u32 squash_ctl = 0;
 	u32 divider;
 	int div;
 
@@ -1498,7 +1499,21 @@ static void bxt_get_cdclk(struct drm_i915_private *dev_priv,
 		return;
 	}
 
-	cdclk_config->cdclk = DIV_ROUND_CLOSEST(cdclk_config->vco, div);
+	if (has_cdclk_squasher(dev_priv))
+		squash_ctl = intel_de_read(dev_priv, CDCLK_SQUASH_CTL);
+
+	if (squash_ctl & CDCLK_SQUASH_ENABLE) {
+		u16 waveform;
+		int size;
+
+		size = REG_FIELD_GET(CDCLK_SQUASH_WINDOW_SIZE_MASK, squash_ctl) + 1;
+		waveform = REG_FIELD_GET(CDCLK_SQUASH_WAVEFORM_MASK, squash_ctl) >> (16 - size);
+
+		cdclk_config->cdclk = DIV_ROUND_CLOSEST(hweight16(waveform) *
+							cdclk_config->vco, size * div);
+	} else {
+		cdclk_config->cdclk = DIV_ROUND_CLOSEST(cdclk_config->vco, div);
+	}
 
  out:
 	/*
-- 
2.27.0

