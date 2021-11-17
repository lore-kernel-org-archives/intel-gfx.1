Return-Path: <SRS0=4n+h=QE=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8DCEC433EF
	for <intel-gfx@archiver.kernel.org>; Wed, 17 Nov 2021 15:19:46 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E1FB61BE2
	for <intel-gfx@archiver.kernel.org>; Wed, 17 Nov 2021 15:19:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7E1FB61BE2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 043C96E936;
	Wed, 17 Nov 2021 15:19:46 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 983166E935
 for <intel-gfx@lists.freedesktop.org>; Wed, 17 Nov 2021 15:19:44 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10170"; a="320180889"
X-IronPort-AV: E=Sophos;i="5.87,241,1631602800"; d="scan'208";a="320180889"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2021 07:19:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,241,1631602800"; d="scan'208";a="536313459"
Received: from sorvi2.fi.intel.com ([10.237.72.194])
 by orsmga001.jf.intel.com with ESMTP; 17 Nov 2021 07:19:41 -0800
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Wed, 17 Nov 2021 17:19:00 +0200
Message-Id: <20211117151900.627726-1-mika.kahola@intel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH] drm/i915/display/dg2: Sanitize CD clock
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

In case of CD clock squashing the divider is always 1. We don't
need to calculate the divider in use so let's skip that for DG2.

v2: Drop unnecessary local variable (Ville)
v3: Avoid if-else structure (Ville)
[v4: vsyrjala: Fix cd2x divider calculation (Uma),
               Introduce has_cdclk_squasher()]

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_cdclk.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
index 91c19e0a98d7..296dd1fc4289 100644
--- a/drivers/gpu/drm/i915/display/intel_cdclk.c
+++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
@@ -1212,6 +1212,11 @@ static void skl_cdclk_uninit_hw(struct drm_i915_private *dev_priv)
 	skl_set_cdclk(dev_priv, &cdclk_config, INVALID_PIPE);
 }
 
+static bool has_cdclk_squasher(struct drm_i915_private *i915)
+{
+	return IS_DG2(i915);
+}
+
 static const struct intel_cdclk_vals bxt_cdclk_table[] = {
 	{ .refclk = 19200, .cdclk = 144000, .divider = 8, .ratio = 60 },
 	{ .refclk = 19200, .cdclk = 288000, .divider = 4, .ratio = 60 },
@@ -1728,7 +1733,7 @@ static void bxt_set_cdclk(struct drm_i915_private *dev_priv,
 static void bxt_sanitize_cdclk(struct drm_i915_private *dev_priv)
 {
 	u32 cdctl, expected;
-	int cdclk, vco;
+	int cdclk, clock, vco;
 
 	intel_update_cdclk(dev_priv);
 	intel_dump_cdclk_config(&dev_priv->cdclk.hw, "Current CDCLK");
@@ -1764,8 +1769,12 @@ static void bxt_sanitize_cdclk(struct drm_i915_private *dev_priv)
 	expected = skl_cdclk_decimal(cdclk);
 
 	/* Figure out what CD2X divider we should be using for this cdclk */
-	expected |= bxt_cdclk_cd2x_div_sel(dev_priv,
-					   dev_priv->cdclk.hw.cdclk,
+	if (has_cdclk_squasher(dev_priv))
+		clock = dev_priv->cdclk.hw.vco / 2;
+	else
+		clock = dev_priv->cdclk.hw.cdclk;
+
+	expected |= bxt_cdclk_cd2x_div_sel(dev_priv, clock,
 					   dev_priv->cdclk.hw.vco);
 
 	/*
-- 
2.27.0

