Return-Path: <SRS0=j43y=EM=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81BEDC2D0A3
	for <intel-gfx@archiver.kernel.org>; Fri,  6 Nov 2020 22:55:55 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00A7F206D4
	for <intel-gfx@archiver.kernel.org>; Fri,  6 Nov 2020 22:55:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 00A7F206D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CF046EB40;
	Fri,  6 Nov 2020 22:55:54 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC3EA6EB40
 for <intel-gfx@lists.freedesktop.org>; Fri,  6 Nov 2020 22:55:53 +0000 (UTC)
IronPort-SDR: NDvmuZFY7HAmxLXuX4xY5G2yJ5Qa/zHV0GbJYnuadwEaiCQWE6D61TexPJNPCQSgflIjKvMwkg
 NLuiEWSOuPNA==
X-IronPort-AV: E=McAfee;i="6000,8403,9797"; a="167022947"
X-IronPort-AV: E=Sophos;i="5.77,457,1596524400"; d="scan'208";a="167022947"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2020 14:55:53 -0800
IronPort-SDR: uCGfYxAFYTe9JyW1klJzuyXpHnh7ZfkZ//kLjwF3gWulC8aaSa1/ms3qkLWXAikB42zSC8Cnl2
 0+iA5l2PiqRg==
X-IronPort-AV: E=Sophos;i="5.77,457,1596524400"; d="scan'208";a="540022750"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2020 14:55:52 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Fri,  6 Nov 2020 14:55:29 -0800
Message-Id: <20201106225531.920641-6-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201106225531.920641-1-lucas.demarchi@intel.com>
References: <20201106225531.920641-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 6/8] drm/i915: re-order if/else ladder for
 hpd_irq_setup
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

Use the convention of new platforms first. No need to special case
HAS_GMCH() since that stopped being true at the lattest on gen8 (for
cherryview).

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/i915_irq.c | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
index e0eb32bd9607..2ab4edf7f25c 100644
--- a/drivers/gpu/drm/i915/i915_irq.c
+++ b/drivers/gpu/drm/i915/i915_irq.c
@@ -4237,21 +4237,18 @@ void intel_irq_init(struct drm_i915_private *dev_priv)
 	 */
 	dev_priv->hotplug.hpd_short_storm_enabled = !HAS_DP_MST(dev_priv);
 
-	if (HAS_GMCH(dev_priv)) {
-		if (I915_HAS_HOTPLUG(dev_priv))
-			dev_priv->display.hpd_irq_setup = i915_hpd_irq_setup;
-	} else {
-		if (HAS_PCH_DG1(dev_priv))
-			dev_priv->display.hpd_irq_setup = dg1_hpd_irq_setup;
-		else if (INTEL_GEN(dev_priv) >= 11)
-			dev_priv->display.hpd_irq_setup = gen11_hpd_irq_setup;
-		else if (IS_GEN9_LP(dev_priv))
-			dev_priv->display.hpd_irq_setup = bxt_hpd_irq_setup;
-		else if (INTEL_PCH_TYPE(dev_priv) >= PCH_SPT)
-			dev_priv->display.hpd_irq_setup = spt_hpd_irq_setup;
-		else
-			dev_priv->display.hpd_irq_setup = ilk_hpd_irq_setup;
-	}
+	if (HAS_PCH_DG1(dev_priv))
+		dev_priv->display.hpd_irq_setup = dg1_hpd_irq_setup;
+	else if (INTEL_GEN(dev_priv) >= 11)
+		dev_priv->display.hpd_irq_setup = gen11_hpd_irq_setup;
+	else if (IS_GEN9_LP(dev_priv))
+		dev_priv->display.hpd_irq_setup = bxt_hpd_irq_setup;
+	else if (INTEL_PCH_TYPE(dev_priv) >= PCH_SPT)
+		dev_priv->display.hpd_irq_setup = spt_hpd_irq_setup;
+	else if (HAS_GMCH(dev_priv) && I915_HAS_HOTPLUG(dev_priv))
+		dev_priv->display.hpd_irq_setup = i915_hpd_irq_setup;
+	else
+		dev_priv->display.hpd_irq_setup = ilk_hpd_irq_setup;
 }
 
 /**
-- 
2.29.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
