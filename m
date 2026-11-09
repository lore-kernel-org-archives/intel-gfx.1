Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34540606A321
	for <intel-gfx@archiver.kernel.org>; Mon,  9 Nov 2026 12:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cMIeFTd6
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ED4C10F22B;
	Mon,  9 Nov 2026 12:30:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3161110F22B
 for <intel-gfx@lists.freedesktop.org>; Mon,  9 Nov 2026 12:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794227425; x=1825763425;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=yM7+ZhtUW79Tc0qi47t2v9PdyOOvywP1+naTOTINycs=;
 b=cMIeFTd62LghWALse+N3/yJYSCfV8AItl09nFLh2hf/VXsHhAAhL1nLW
 hQmkpXg0KqLCBOLbQ0HbCEvE5nxw1cAlFIOsGSdMtn1L6D39nBcXX8MdJ
 oxGa+wkMH7KuJkniKppq+4rTVz1PfScNWe6RfsTq27IFOoOirCzWVX5af
 hwsptvIvCGlt1ZoLirHl4FS7wqNyfzf5x9wJgU43DmBwEJ1WZlid+My3L
 4DHopVTFBog8xlOoiTKTsUoRWOS0Yezh/WF1iVH5LFKkOAsv2f8+GNul7
 km2E8hPBeo17usYsp7CD8xSNHjl2/LXztxmwcP3z9uOBcOQba6PfwmqYx g==;
X-CSE-ConnectionGUID: tLF9hjwzTFWLUvvhypHduw==
X-CSE-MsgGUID: d9pW3uenTgWGUHiCx5Z/yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2863609"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="2863609"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 04:30:25 -0800
X-CSE-ConnectionGUID: PXUBHj74SfeaCyFY0IiWLQ==
X-CSE-MsgGUID: YC5dkTLeT5CbQXuoAC2F7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="8013256"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.135])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 04:30:24 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/3] drm/i915/irq: Don't call gen11_gt_irq_handler() needlessly
Date: Mon,  9 Nov 2026 14:30:11 +0200
Message-ID: <20261109123012.8110-3-ville.syrjala@linux.intel.com>
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

Define GEN11_GT_IRQS (we already have the gen8 counterpart
GEN8_GT_IRQS) and use it to skip the entire gen11_gt_irq_handler()
call if none of the relevant bits are set, as a micro
optimization.

In addition to the redundant function call we also now skip
the redundant gt->irq_lock spinlock which is taken unconditionally
in gen11_gt_irq_handler().

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_irq.h | 3 +++
 drivers/gpu/drm/i915/i915_irq.c        | 6 ++++--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_irq.h b/drivers/gpu/drm/i915/gt/intel_gt_irq.h
index 41cad38668c5..c8cc247778f0 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_irq.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_irq.h
@@ -12,6 +12,9 @@
 
 struct intel_gt;
 
+#define GEN11_GT_IRQS (GEN11_GT_DW_IRQ(0) | \
+		       GEN11_GT_DW_IRQ(1))
+
 #define GEN8_GT_IRQS (GEN8_GT_RCS_IRQ | \
 		      GEN8_GT_BCS_IRQ | \
 		      GEN8_GT_VCS0_IRQ | \
diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
index 448c4730d178..b3fc3e31a5d4 100644
--- a/drivers/gpu/drm/i915/i915_irq.c
+++ b/drivers/gpu/drm/i915/i915_irq.c
@@ -527,7 +527,8 @@ static irqreturn_t gen11_irq_handler(int irq, void *arg)
 	}
 
 	/* Find, queue (onto bottom-halves), then clear each source */
-	gen11_gt_irq_handler(gt, master_ctl);
+	if (master_ctl & GEN11_GT_IRQS)
+		gen11_gt_irq_handler(gt, master_ctl);
 
 	/* IRQs are synced during runtime_suspend, we don't require a wakeref */
 	if (master_ctl & GEN11_DISPLAY_IRQ)
@@ -596,7 +597,8 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
 		return IRQ_NONE;
 	}
 
-	gen11_gt_irq_handler(gt, master_ctl);
+	if (master_ctl & GEN11_GT_IRQS)
+		gen11_gt_irq_handler(gt, master_ctl);
 
 	if (master_ctl & GEN11_DISPLAY_IRQ)
 		intel_display_irq_handler(display, NULL);
-- 
2.56.0

