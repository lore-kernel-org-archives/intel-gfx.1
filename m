Return-Path: <SRS0=AGhj=HO=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D544EC433E0
	for <intel-gfx@archiver.kernel.org>; Fri, 12 Feb 2021 18:51:50 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C2DB64DFF
	for <intel-gfx@archiver.kernel.org>; Fri, 12 Feb 2021 18:51:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C2DB64DFF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 068996E221;
	Fri, 12 Feb 2021 18:51:50 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88B7B6E0D0
 for <intel-gfx@lists.freedesktop.org>; Fri, 12 Feb 2021 18:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613155907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=da6s7P7IlSNAeSqqosARqkvFvXSTPR626wK9BcIsjkc=;
 b=g5gp11Xe5c3qCU10JL/Shp1tejUEPB5AJmKiyYZjgzz+91P82DOQi36xgVHovyYnJYgsuS
 caImf3zD4nIPMtzX4GVmUch2Ps8dh4k3Rk8etDOrG6YGuDW5YDwkOH3Xn4SKupi0sHeRc5
 5Gn0NFqVsN9Ch+hstbarOtZDoKKcjKc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-477-GbPTAnNnMvyBcXdH5bgGQw-1; Fri, 12 Feb 2021 13:51:45 -0500
X-MC-Unique: GbPTAnNnMvyBcXdH5bgGQw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 148956EE20;
 Fri, 12 Feb 2021 18:51:43 +0000 (UTC)
Received: from Whitewolf.redhat.com (ovpn-114-167.rdu2.redhat.com
 [10.10.114.167])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3FDD75C3E0;
 Fri, 12 Feb 2021 18:51:41 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: intel-gfx@lists.freedesktop.org
Date: Fri, 12 Feb 2021 13:50:53 -0500
Message-Id: <20210212185053.1689716-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Subject: [Intel-gfx] [PATCH v2] drm/i915/gen9bc: Handle TGP PCH during
 suspend/resume
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

From: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>

For Legacy S3 suspend/resume GEN9 BC needs to enable and
setup TGP PCH.

v2:
* Move Wa_14010685332 into it's own function - vsyrjala
* Add TODO comment about figuring out if we can move this workaround - imre

Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/i915/i915_irq.c | 53 ++++++++++++++++++++++-----------
 1 file changed, 36 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
index 98145a7f28a4..7d912aa950ee 100644
--- a/drivers/gpu/drm/i915/i915_irq.c
+++ b/drivers/gpu/drm/i915/i915_irq.c
@@ -3040,6 +3040,19 @@ static void valleyview_irq_reset(struct drm_i915_private *dev_priv)
 	spin_unlock_irq(&dev_priv->irq_lock);
 }
 
+static void cnp_irq_post_reset(struct drm_i915_private *dev_priv)
+{
+	struct intel_uncore *uncore = &dev_priv->uncore;
+
+	/*
+	 * Wa_14010685332:cnp/cmp,tgp,adp
+	 * TODO: Figure out if this workaround can be applied in the s0ix suspend/resume handlers as
+	 * on earlier platforms and whether the workaround is also needed for runtime suspend/resume
+	 */
+	intel_uncore_rmw(uncore, SOUTH_CHICKEN1, SBCLK_RUN_REFCLK_DIS, SBCLK_RUN_REFCLK_DIS);
+	intel_uncore_rmw(uncore, SOUTH_CHICKEN1, SBCLK_RUN_REFCLK_DIS, 0);
+}
+
 static void gen8_irq_reset(struct drm_i915_private *dev_priv)
 {
 	struct intel_uncore *uncore = &dev_priv->uncore;
@@ -3061,8 +3074,14 @@ static void gen8_irq_reset(struct drm_i915_private *dev_priv)
 	GEN3_IRQ_RESET(uncore, GEN8_DE_MISC_);
 	GEN3_IRQ_RESET(uncore, GEN8_PCU_);
 
-	if (HAS_PCH_SPLIT(dev_priv))
+	if (INTEL_PCH_TYPE(dev_priv) >= PCH_ICP)
+		GEN3_IRQ_RESET(uncore, SDE);
+	else if (HAS_PCH_SPLIT(dev_priv))
 		ibx_irq_reset(dev_priv);
+
+	if (INTEL_PCH_TYPE(dev_priv) == PCH_CNP ||
+	    (INTEL_PCH_TYPE(dev_priv) >= PCH_TGP && INTEL_PCH_TYPE(dev_priv) < PCH_DG1))
+		cnp_irq_post_reset(dev_priv);
 }
 
 static void gen11_display_irq_reset(struct drm_i915_private *dev_priv)
@@ -3104,15 +3123,9 @@ static void gen11_display_irq_reset(struct drm_i915_private *dev_priv)
 	if (INTEL_PCH_TYPE(dev_priv) >= PCH_ICP)
 		GEN3_IRQ_RESET(uncore, SDE);
 
-	/* Wa_14010685332:cnp/cmp,tgp,adp */
 	if (INTEL_PCH_TYPE(dev_priv) == PCH_CNP ||
-	    (INTEL_PCH_TYPE(dev_priv) >= PCH_TGP &&
-	     INTEL_PCH_TYPE(dev_priv) < PCH_DG1)) {
-		intel_uncore_rmw(uncore, SOUTH_CHICKEN1,
-				 SBCLK_RUN_REFCLK_DIS, SBCLK_RUN_REFCLK_DIS);
-		intel_uncore_rmw(uncore, SOUTH_CHICKEN1,
-				 SBCLK_RUN_REFCLK_DIS, 0);
-	}
+	    (INTEL_PCH_TYPE(dev_priv) >= PCH_TGP && INTEL_PCH_TYPE(dev_priv) < PCH_DG1))
+		cnp_irq_post_reset(dev_priv);
 }
 
 static void gen11_irq_reset(struct drm_i915_private *dev_priv)
@@ -3474,6 +3487,9 @@ static void spt_hpd_irq_setup(struct drm_i915_private *dev_priv)
 	ibx_display_interrupt_update(dev_priv, hotplug_irqs, enabled_irqs);
 
 	spt_hpd_detection_setup(dev_priv);
+
+	if (INTEL_PCH_TYPE(dev_priv) >= PCH_ICP)
+		icp_hpd_irq_setup(dev_priv);
 }
 
 static u32 ilk_hotplug_enables(struct drm_i915_private *i915,
@@ -3764,9 +3780,19 @@ static void gen8_de_irq_postinstall(struct drm_i915_private *dev_priv)
 	}
 }
 
+static void icp_irq_postinstall(struct drm_i915_private *dev_priv)
+{
+	struct intel_uncore *uncore = &dev_priv->uncore;
+	u32 mask = SDE_GMBUS_ICP;
+
+	GEN3_IRQ_INIT(uncore, SDE, ~mask, 0xffffffff);
+}
+
 static void gen8_irq_postinstall(struct drm_i915_private *dev_priv)
 {
-	if (HAS_PCH_SPLIT(dev_priv))
+	if (INTEL_PCH_TYPE(dev_priv) >= PCH_ICP)
+		icp_irq_postinstall(dev_priv);
+	else if (HAS_PCH_SPLIT(dev_priv))
 		ibx_irq_postinstall(dev_priv);
 
 	gen8_gt_irq_postinstall(&dev_priv->gt);
@@ -3775,13 +3801,6 @@ static void gen8_irq_postinstall(struct drm_i915_private *dev_priv)
 	gen8_master_intr_enable(dev_priv->uncore.regs);
 }
 
-static void icp_irq_postinstall(struct drm_i915_private *dev_priv)
-{
-	struct intel_uncore *uncore = &dev_priv->uncore;
-	u32 mask = SDE_GMBUS_ICP;
-
-	GEN3_IRQ_INIT(uncore, SDE, ~mask, 0xffffffff);
-}
 
 static void gen11_irq_postinstall(struct drm_i915_private *dev_priv)
 {
-- 
2.29.2

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
