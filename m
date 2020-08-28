Return-Path: <SRS0=+bTq=CG=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 938ABC433E2
	for <intel-gfx@archiver.kernel.org>; Fri, 28 Aug 2020 22:13:06 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B746207DA
	for <intel-gfx@archiver.kernel.org>; Fri, 28 Aug 2020 22:13:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B746207DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB7786E0FF;
	Fri, 28 Aug 2020 22:13:05 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4288A6E0FF
 for <intel-gfx@lists.freedesktop.org>; Fri, 28 Aug 2020 22:13:05 +0000 (UTC)
IronPort-SDR: 6GVaMbecNy8pxo48tjyTPHq7RszdfvAloXsJkU4rlM2rdCsaXkyk7hu8HaakgWjDWVj8QZDjK3
 8N4gLSg5AeWQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9727"; a="157771142"
X-IronPort-AV: E=Sophos;i="5.76,365,1592895600"; d="scan'208";a="157771142"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2020 15:13:04 -0700
IronPort-SDR: HThsipPB6CKnfF7tzp4fSJC12DDBDofcvXZ1ehGN+MUe2iLsEruK2UArMww9xwfrxCTys+ozme
 ubMQa6bP75Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,365,1592895600"; d="scan'208";a="374201203"
Received: from anusha.jf.intel.com ([10.165.21.155])
 by orsmga001.jf.intel.com with ESMTP; 28 Aug 2020 15:13:04 -0700
From: Anusha Srivatsa <anusha.srivatsa@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Fri, 28 Aug 2020 14:58:32 -0700
Message-Id: <20200828215832.11687-1-anusha.srivatsa@intel.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH] drm/i915/pll: Centralize PLL_ENABLE register
 lookup
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

We currenty check for platform at multiple parts in the driver
to grab the correct PLL. Let us begin to centralize it through a
helper function.

Suggested-by: Matt Roper <matthew.d.roper@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c | 27 ++++++++++++-------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
index 81ab975fe4f0..388136618bb7 100644
--- a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
+++ b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
@@ -147,6 +147,20 @@ void assert_shared_dpll(struct drm_i915_private *dev_priv,
 			pll->info->name, onoff(state), onoff(cur_state));
 }
 
+static
+i915_reg_t intel_get_pll_enable_reg(struct drm_i915_private *dev_priv,
+				    struct intel_shared_dpll *pll)
+{
+
+	if (IS_ELKHARTLAKE(dev_priv)) {
+		if (pll->info->id == DPLL_ID_EHL_DPLL4)
+			return MG_PLL_ENABLE(0);
+	}
+
+	return CNL_DPLL_ENABLE(pll->info->id);
+
+
+}
 /**
  * intel_prepare_shared_dpll - call a dpll's prepare hook
  * @crtc_state: CRTC, and its state, which has a shared dpll
@@ -3842,12 +3856,7 @@ static bool combo_pll_get_hw_state(struct drm_i915_private *dev_priv,
 				   struct intel_shared_dpll *pll,
 				   struct intel_dpll_hw_state *hw_state)
 {
-	i915_reg_t enable_reg = CNL_DPLL_ENABLE(pll->info->id);
-
-	if (IS_ELKHARTLAKE(dev_priv) &&
-	    pll->info->id == DPLL_ID_EHL_DPLL4) {
-		enable_reg = MG_PLL_ENABLE(0);
-	}
+	i915_reg_t enable_reg = intel_get_pll_enable_reg(dev_priv, pll);
 
 	return icl_pll_get_hw_state(dev_priv, pll, hw_state, enable_reg);
 }
@@ -4045,11 +4054,10 @@ static void icl_pll_enable(struct drm_i915_private *dev_priv,
 static void combo_pll_enable(struct drm_i915_private *dev_priv,
 			     struct intel_shared_dpll *pll)
 {
-	i915_reg_t enable_reg = CNL_DPLL_ENABLE(pll->info->id);
+	i915_reg_t enable_reg = intel_get_pll_enable_reg(dev_priv, pll);
 
 	if (IS_ELKHARTLAKE(dev_priv) &&
 	    pll->info->id == DPLL_ID_EHL_DPLL4) {
-		enable_reg = MG_PLL_ENABLE(0);
 
 		/*
 		 * We need to disable DC states when this DPLL is enabled.
@@ -4157,11 +4165,10 @@ static void icl_pll_disable(struct drm_i915_private *dev_priv,
 static void combo_pll_disable(struct drm_i915_private *dev_priv,
 			      struct intel_shared_dpll *pll)
 {
-	i915_reg_t enable_reg = CNL_DPLL_ENABLE(pll->info->id);
+	i915_reg_t enable_reg = intel_get_pll_enable_reg(dev_priv, pll);
 
 	if (IS_ELKHARTLAKE(dev_priv) &&
 	    pll->info->id == DPLL_ID_EHL_DPLL4) {
-		enable_reg = MG_PLL_ENABLE(0);
 		icl_pll_disable(dev_priv, pll, enable_reg);
 
 		intel_display_power_put(dev_priv, POWER_DOMAIN_DPLL_DC_OFF,
-- 
2.25.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
