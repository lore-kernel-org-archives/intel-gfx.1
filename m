Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9574B606A326
	for <intel-gfx@archiver.kernel.org>; Mon,  9 Nov 2026 12:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ut3q8+nr
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2873410F23A;
	Mon,  9 Nov 2026 12:30:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5A8510F23A
 for <intel-gfx@lists.freedesktop.org>; Mon,  9 Nov 2026 12:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794227429; x=1825763429;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=li+dZChY7nWftuvae5D+wl3qScCorLKL2Mxhv3vmY+A=;
 b=Ut3q8+nrmra5qAIIM5G/X2qb/9SAQnXAjBIZec2CAfrtfyCMeFiCd3sP
 ieygmArQMr38o5GTPa8UuKOvnL6RpIkYFbIQAfWlTlYV7tjgDbP/Zy2jl
 o3/4VP/fBO53e8DSFLdConGNdCQFwA9OIQTz1BxCyo3sqIaWzG/IV0x+E
 RaC5KrL4pOug5gjbhlZ8OhYncrpRMUf/5xsfrGBLnsR7imMiQp/SZDVG5
 sn/Q0EdyVHNCWbrBVePEiJZW/Rk6KIe3Zr1jGCpdS8b2qsrN4n6P8R1P/
 0VTOlTQkeX/MdBbj/dUtGQ7+bAkgyzyjIUXOP7dl5eny0brx9K3TAvH0B Q==;
X-CSE-ConnectionGUID: SB2LNIqsSOudp33pmLbpFQ==
X-CSE-MsgGUID: EiEzzVYTTI2fjCilmspOJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2863610"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="2863610"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 04:30:28 -0800
X-CSE-ConnectionGUID: jvq+dd3YRs6vx5LQYcEllw==
X-CSE-MsgGUID: K8W3aHYRSsCwuc2rwt8YRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="8013266"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.135])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 04:30:27 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 3/3] drm/i915/irq: Check the master bit outside
 gen11_gu_misc_irq_ack()
Date: Mon,  9 Nov 2026 14:30:12 +0200
Message-ID: <20261109123012.8110-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109123012.8110-1-ville.syrjala@linux.intel.com>
References: <20261109123012.8110-1-ville.syrjala@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Pull the master GEN11_GU_MISC_IRQ bit check out from
gen11_gu_misc_irq_ack(). This is just to make the code more
consistent, with all the other sub irq handlers already checking
the master bit(s) in the top level irq handlers.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/i915_irq.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
index b3fc3e31a5d4..648d76600c49 100644
--- a/drivers/gpu/drm/i915/i915_irq.c
+++ b/drivers/gpu/drm/i915/i915_irq.c
@@ -493,14 +493,10 @@ static inline void gen11_master_intr_enable(void __iomem * const regs)
 	raw_reg_write(regs, GEN11_GFX_MSTR_IRQ, GEN11_MASTER_IRQ);
 }
 
-static u32 gen11_gu_misc_irq_ack(void __iomem * const regs,
-				 u32 master_ctl)
+static u32 gen11_gu_misc_irq_ack(void __iomem * const regs)
 {
 	u32 iir;
 
-	if (!(master_ctl & GEN11_GU_MISC_IRQ))
-		return 0;
-
 	iir = raw_reg_read(regs, GEN11_GU_MISC_IIR);
 	if (likely(iir))
 		raw_reg_write(regs, GEN11_GU_MISC_IIR, iir);
@@ -514,8 +510,8 @@ static irqreturn_t gen11_irq_handler(int irq, void *arg)
 	struct intel_display *display = i915->display;
 	void __iomem * const regs = intel_uncore_regs(&i915->uncore);
 	struct intel_gt *gt = to_gt(i915);
+	u32 gu_misc_iir = 0;
 	u32 master_ctl;
-	u32 gu_misc_iir;
 
 	if (!intel_irqs_enabled(i915))
 		return IRQ_NONE;
@@ -534,7 +530,8 @@ static irqreturn_t gen11_irq_handler(int irq, void *arg)
 	if (master_ctl & GEN11_DISPLAY_IRQ)
 		intel_display_irq_handler(display, NULL);
 
-	gu_misc_iir = gen11_gu_misc_irq_ack(regs, master_ctl);
+	if (master_ctl & GEN11_GU_MISC_IRQ)
+		gu_misc_iir = gen11_gu_misc_irq_ack(regs);
 
 	gen11_master_intr_enable(regs);
 
@@ -575,7 +572,7 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
 	struct intel_gt *gt = to_gt(i915);
 	void __iomem * const regs = intel_uncore_regs(gt->uncore);
 	u32 master_tile_ctl, master_ctl;
-	u32 gu_misc_iir;
+	u32 gu_misc_iir = 0;
 
 	if (!intel_irqs_enabled(i915))
 		return IRQ_NONE;
@@ -603,7 +600,8 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
 	if (master_ctl & GEN11_DISPLAY_IRQ)
 		intel_display_irq_handler(display, NULL);
 
-	gu_misc_iir = gen11_gu_misc_irq_ack(regs, master_ctl);
+	if (master_ctl & GEN11_GU_MISC_IRQ)
+		gu_misc_iir = gen11_gu_misc_irq_ack(regs);
 
 	dg1_master_intr_enable(regs);
 
-- 
2.56.0

