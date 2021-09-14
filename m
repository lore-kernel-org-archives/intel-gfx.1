Return-Path: <SRS0=u2GV=OE=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E995C433F5
	for <intel-gfx@archiver.kernel.org>; Tue, 14 Sep 2021 18:27:04 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9AE66109E
	for <intel-gfx@archiver.kernel.org>; Tue, 14 Sep 2021 18:27:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C9AE66109E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D21F6E536;
	Tue, 14 Sep 2021 18:27:03 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5B7C6E530
 for <intel-gfx@lists.freedesktop.org>; Tue, 14 Sep 2021 18:27:01 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10107"; a="221763167"
X-IronPort-AV: E=Sophos;i="5.85,292,1624345200"; d="scan'208";a="221763167"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2021 11:27:01 -0700
X-IronPort-AV: E=Sophos;i="5.85,292,1624345200"; d="scan'208";a="472110443"
Received: from lveltman-mobl.ger.corp.intel.com (HELO localhost)
 ([10.251.216.6])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2021 11:26:59 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: jani.nikula@intel.com, Dave Airlie <airlied@gmail.com>,
 Dave Airlie <airlied@redhat.com>
Date: Tue, 14 Sep 2021 21:25:13 +0300
Message-Id: <7c8bf3091f369c132b3ddd4f087e882a915bdd75.1631643729.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1631643729.git.jani.nikula@intel.com>
References: <cover.1631643729.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 15/24] drm/i915: constify fdi link training
 vtable
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

From: Dave Airlie <airlied@redhat.com>

Put the vtable into ro memory.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Dave Airlie <airlied@redhat.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fdi.c | 20 ++++++++++++++++----
 drivers/gpu/drm/i915/i915_drv.h          |  2 +-
 2 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fdi.c b/drivers/gpu/drm/i915/display/intel_fdi.c
index 94bb7e039fe7..148fb50035ff 100644
--- a/drivers/gpu/drm/i915/display/intel_fdi.c
+++ b/drivers/gpu/drm/i915/display/intel_fdi.c
@@ -15,7 +15,7 @@ void intel_fdi_link_train(struct intel_crtc *crtc,
 {
 	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
 
-	dev_priv->fdi_funcs.fdi_link_train(crtc, crtc_state);
+	dev_priv->fdi_funcs->fdi_link_train(crtc, crtc_state);
 }
 
 /* units of 100MHz */
@@ -1013,15 +1013,27 @@ void lpt_fdi_program_mphy(struct drm_i915_private *dev_priv)
 	intel_sbi_write(dev_priv, 0x21EC, tmp, SBI_MPHY);
 }
 
+static const struct intel_fdi_funcs ilk_funcs = {
+	.fdi_link_train = ilk_fdi_link_train,
+};
+
+static const struct intel_fdi_funcs gen6_funcs = {
+	.fdi_link_train = gen6_fdi_link_train,
+};
+
+static const struct intel_fdi_funcs ivb_funcs = {
+	.fdi_link_train = ivb_manual_fdi_link_train,
+};
+
 void
 intel_fdi_init_hook(struct drm_i915_private *dev_priv)
 {
 	if (IS_IRONLAKE(dev_priv)) {
-		dev_priv->fdi_funcs.fdi_link_train = ilk_fdi_link_train;
+		dev_priv->fdi_funcs = &ilk_funcs;
 	} else if (IS_SANDYBRIDGE(dev_priv)) {
-		dev_priv->fdi_funcs.fdi_link_train = gen6_fdi_link_train;
+		dev_priv->fdi_funcs = &gen6_funcs;
 	} else if (IS_IVYBRIDGE(dev_priv)) {
 		/* FIXME: detect B0+ stepping and use auto training */
-		dev_priv->fdi_funcs.fdi_link_train = ivb_manual_fdi_link_train;
+		dev_priv->fdi_funcs = &ivb_funcs;
 	}
 }
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 51bbff28bb12..4cea7fa274f1 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -991,7 +991,7 @@ struct drm_i915_private {
 	struct intel_hotplug_funcs hotplug_funcs;
 
 	/* fdi display functions */
-	struct intel_fdi_funcs fdi_funcs;
+	const struct intel_fdi_funcs *fdi_funcs;
 
 	/* display pll funcs */
 	struct intel_dpll_funcs dpll_funcs;
-- 
2.30.2

