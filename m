Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 434CEC4167B
	for <intel-gfx@archiver.kernel.org>; Fri, 15 Dec 2023 11:00:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C184610E9E3;
	Fri, 15 Dec 2023 11:00:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C892E10E9E1
 for <intel-gfx@lists.freedesktop.org>; Fri, 15 Dec 2023 11:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702638007; x=1734174007;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1MWc0JE/ZS6G8t2219KTOEKaQiawbZmlftxoY5yfIpY=;
 b=BQDhSd5C1wSIs9thxYMldxripdp46LHj0ZNwGm+MlGi7PuZMNDbnyOYN
 +Tb9c/dUGEmEz6HIrCqzzdzXwu2UhavQiMQ9gE7ivKNg7XNwVgXFC+yir
 zG/86WZfvrC5dByOSFyR2uPNtJMoRI0XeLvzkdr6wEqoyPHTSFbgfIkKi
 qaIiVtubkliR6sJ0vwvzhDOh9suNM4do6YaYPNef3qxNsiIRowFPhbmqW
 2R0ehoIw+ZXi6n6piWqJi/uAO+GvhPBnFw+7BtBrvHDumxSnbcgL5gw/P
 pfjrbHbXY81IAcmPblsxQcrzsFvGZ866MXzP0zKk3yDkbCjMC0Gbw2l2r g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="394136872"
X-IronPort-AV: E=Sophos;i="6.04,278,1695711600"; d="scan'208";a="394136872"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 03:00:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="767935272"
X-IronPort-AV: E=Sophos;i="6.04,278,1695711600"; d="scan'208";a="767935272"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga007.jf.intel.com with SMTP; 15 Dec 2023 03:00:05 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 15 Dec 2023 13:00:04 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 10/15] drm/i915: s/phys_base/dma_addr/
Date: Fri, 15 Dec 2023 12:59:24 +0200
Message-ID: <20231215105929.29568-11-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231215105929.29568-1-ville.syrjala@linux.intel.com>
References: <20231215105929.29568-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

The address we read from the PTE is a dma address, not a physical
address. Rename the variable to say so.

Cc: Paz Zcharya <pazz@chromium.org>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 .../gpu/drm/i915/display/intel_plane_initial.c    | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_plane_initial.c b/drivers/gpu/drm/i915/display/intel_plane_initial.c
index c72d4cacf631..48b74319f45c 100644
--- a/drivers/gpu/drm/i915/display/intel_plane_initial.c
+++ b/drivers/gpu/drm/i915/display/intel_plane_initial.c
@@ -61,6 +61,7 @@ initial_plane_vma(struct drm_i915_private *i915,
 	base = round_down(plane_config->base, I915_GTT_MIN_ALIGNMENT);
 	if (IS_DGFX(i915) || HAS_LMEMBAR_SMEM_STOLEN(i915)) {
 		gen8_pte_t __iomem *gte = to_gt(i915)->ggtt->gsm;
+		dma_addr_t dma_addr;
 		gen8_pte_t pte;
 
 		gte += base / I915_GTT_PAGE_SIZE;
@@ -72,7 +73,7 @@ initial_plane_vma(struct drm_i915_private *i915,
 			return NULL;
 		}
 
-		phys_base = pte & GEN12_GGTT_PTE_ADDR_MASK;
+		dma_addr = pte & GEN12_GGTT_PTE_ADDR_MASK;
 
 		if (IS_DGFX(i915))
 			mem = i915->mm.regions[INTEL_REGION_LMEM_0];
@@ -88,18 +89,18 @@ initial_plane_vma(struct drm_i915_private *i915,
 		 * On lmem we don't currently expect this to
 		 * ever be placed in the stolen portion.
 		 */
-		if (phys_base < mem->region.start || phys_base > mem->region.end) {
+		if (dma_addr < mem->region.start || dma_addr > mem->region.end) {
 			drm_err(&i915->drm,
-				"Initial plane programming using invalid range, phys_base=%pa (%s [%pa-%pa])\n",
-				&phys_base, mem->region.name, &mem->region.start, &mem->region.end);
+				"Initial plane programming using invalid range, dma_addr=%pa (%s [%pa-%pa])\n",
+				&dma_addr, mem->region.name, &mem->region.start, &mem->region.end);
 			return NULL;
 		}
 
 		drm_dbg(&i915->drm,
-			"Using phys_base=%pa, based on initial plane programming\n",
-			&phys_base);
+			"Using dma_addr=%pa, based on initial plane programming\n",
+			&dma_addr);
 
-		phys_base -= mem->region.start;
+		phys_base = dma_addr - mem->region.start;
 	} else {
 		phys_base = base;
 		mem = i915->mm.stolen_region;
-- 
2.41.0

