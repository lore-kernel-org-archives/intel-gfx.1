Return-Path: <SRS0=K74T=CT=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76811C433E2
	for <intel-gfx@archiver.kernel.org>; Thu, 10 Sep 2020 09:52:37 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2712221582
	for <intel-gfx@archiver.kernel.org>; Thu, 10 Sep 2020 09:52:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2712221582
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D4AD6E8E1;
	Thu, 10 Sep 2020 09:52:36 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24B4D6E8E1
 for <intel-gfx@lists.freedesktop.org>; Thu, 10 Sep 2020 09:52:35 +0000 (UTC)
IronPort-SDR: 6kwPmNiN2Pc3+Qvq/is/y0UgiMPOFJ8QemyPGhuEmW1A2bXI8vpMFsTJdqxol9ovqxtO6UHrMM
 QEWAFg62RulQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9739"; a="155961988"
X-IronPort-AV: E=Sophos;i="5.76,412,1592895600"; d="scan'208";a="155961988"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2020 02:52:34 -0700
IronPort-SDR: fOAnxK0MjJp7fETaYC/Ri2ZMoUUzGPYoLGXCuJ7eOUX00o7RdTcjHXRGTl177f4F+hpzuyYN5J
 26yYTmQ9Y5dQ==
X-IronPort-AV: E=Sophos;i="5.76,412,1592895600"; d="scan'208";a="480827463"
Received: from nfhickey-mobl.ger.corp.intel.com (HELO localhost)
 ([10.251.81.64])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2020 02:52:33 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Thu, 10 Sep 2020 12:52:26 +0300
Message-Id: <20200910095227.9466-2-jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200910095227.9466-1-jani.nikula@intel.com>
References: <20200910095227.9466-1-jani.nikula@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 2/3] drm/i915: move gen4 GCDGMBUS save/restore
 to display save/restore
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
Cc: jani.nikula@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Logically part of the display save/restore. No functional changes.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/i915_suspend.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_suspend.c b/drivers/gpu/drm/i915/i915_suspend.c
index ed2be3489f8e..4a93247942b7 100644
--- a/drivers/gpu/drm/i915/i915_suspend.c
+++ b/drivers/gpu/drm/i915/i915_suspend.c
@@ -34,6 +34,8 @@
 
 static void i915_save_display(struct drm_i915_private *dev_priv)
 {
+	struct pci_dev *pdev = dev_priv->drm.pdev;
+
 	/* Display arbitration control */
 	if (INTEL_GEN(dev_priv) <= 4)
 		dev_priv->regfile.saveDSPARB = I915_READ(DSPARB);
@@ -41,10 +43,20 @@ static void i915_save_display(struct drm_i915_private *dev_priv)
 	/* save FBC interval */
 	if (HAS_FBC(dev_priv) && INTEL_GEN(dev_priv) <= 4 && !IS_G4X(dev_priv))
 		dev_priv->regfile.saveFBC_CONTROL = I915_READ(FBC_CONTROL);
+
+	if (IS_GEN(dev_priv, 4))
+		pci_read_config_word(pdev, GCDGMBUS,
+				     &dev_priv->regfile.saveGCDGMBUS);
 }
 
 static void i915_restore_display(struct drm_i915_private *dev_priv)
 {
+	struct pci_dev *pdev = dev_priv->drm.pdev;
+
+	if (IS_GEN(dev_priv, 4))
+		pci_write_config_word(pdev, GCDGMBUS,
+				      dev_priv->regfile.saveGCDGMBUS);
+
 	/* Display arbitration */
 	if (INTEL_GEN(dev_priv) <= 4)
 		I915_WRITE(DSPARB, dev_priv->regfile.saveDSPARB);
@@ -61,15 +73,10 @@ static void i915_restore_display(struct drm_i915_private *dev_priv)
 
 int i915_save_state(struct drm_i915_private *dev_priv)
 {
-	struct pci_dev *pdev = dev_priv->drm.pdev;
 	int i;
 
 	i915_save_display(dev_priv);
 
-	if (IS_GEN(dev_priv, 4))
-		pci_read_config_word(pdev, GCDGMBUS,
-				     &dev_priv->regfile.saveGCDGMBUS);
-
 	/* Cache mode state */
 	if (INTEL_GEN(dev_priv) < 7)
 		dev_priv->regfile.saveCACHE_MODE_0 = I915_READ(CACHE_MODE_0);
@@ -102,12 +109,8 @@ int i915_save_state(struct drm_i915_private *dev_priv)
 
 int i915_restore_state(struct drm_i915_private *dev_priv)
 {
-	struct pci_dev *pdev = dev_priv->drm.pdev;
 	int i;
 
-	if (IS_GEN(dev_priv, 4))
-		pci_write_config_word(pdev, GCDGMBUS,
-				      dev_priv->regfile.saveGCDGMBUS);
 	i915_restore_display(dev_priv);
 
 	/* Cache mode state */
-- 
2.20.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
