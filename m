Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D63606A31C
	for <intel-gfx@archiver.kernel.org>; Mon,  9 Nov 2026 12:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Q2IhuEI4
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0705610F23D;
	Mon,  9 Nov 2026 12:30:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C3C010F255
 for <intel-gfx@lists.freedesktop.org>; Mon,  9 Nov 2026 12:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794227421; x=1825763421;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=bvY2KST8LlSXyJYTxk3ixpgu/5xeOS1+ONCDa3yYZ+k=;
 b=Q2IhuEI4CF/gkk9RCzsM9+Ilf89mrAivLgQ378N4e78399HwW7w9JIJJ
 oZZBRIlSEIrsnK1RoTYNF9uUdhvH4aO3Uca9Pz6wbP0RK2Wek9On0519/
 WfmWojCjgBmB1+s/mrZQniPl0MRlcXnaxCaUaCh53UU/nj+qOFEdhCxOo
 6cRdA2l5GUbbz5l+gyXnTn3Ek44SiSPQI2LKCpfNxnry5l+KSkwSYKAcG
 35eyvNHdhdzWrrS5mL2OqVB5z/RZYTUXmjqpfyB6bAUKYVdxYRMIRXXMi
 wPSFAK5NB1EyZqP6Ku8zqL3F2IqYACGrzKnXffOnrCJw3lDOFu58EiHHh w==;
X-CSE-ConnectionGUID: dZ4MZ+cbR6q91SSuw4H3XA==
X-CSE-MsgGUID: 7DiMXFpZTY6zx6NXf/I1eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2863607"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="2863607"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 04:30:21 -0800
X-CSE-ConnectionGUID: r/1bbXE1Thurc1dPxyeV0Q==
X-CSE-MsgGUID: VrDZsJS+RHq7ArsKDsyLtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="8013238"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.135])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 04:30:20 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/3] drm/i915/irq: Don't call gen8_gt_irq_handler() needlessly
Date: Mon,  9 Nov 2026 14:30:10 +0200
Message-ID: <20261109123012.8110-2-ville.syrjala@linux.intel.com>
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

We already have GEN8_GT_IRQS to teel whether any of the GT
interrupts need processing. If none of the relevant bits are
set skip the whole gen8_gt_irq_handler(), as a micro optimization.
We already do the equivalent for the display irqs, so why not
do it for GT irqs as well.

Originally gen8_gt_irq_handler() was a static inline, so this
probably wouldn't have made sense. But these days it's a proper
function call every time.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/i915_irq.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
index 0762017d9089..448c4730d178 100644
--- a/drivers/gpu/drm/i915/i915_irq.c
+++ b/drivers/gpu/drm/i915/i915_irq.c
@@ -455,7 +455,8 @@ static irqreturn_t gen8_irq_handler(int irq, void *arg)
 	}
 
 	/* Find, queue (onto bottom-halves), then clear each source */
-	gen8_gt_irq_handler(to_gt(dev_priv), master_ctl);
+	if (master_ctl & GEN8_GT_IRQS)
+		gen8_gt_irq_handler(to_gt(dev_priv), master_ctl);
 
 	/* IRQs are synced during runtime_suspend, we don't require a wakeref */
 	if (master_ctl & ~GEN8_GT_IRQS) {
-- 
2.56.0

