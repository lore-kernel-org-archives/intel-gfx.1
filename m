Return-Path: <SRS0=Rx2D=HK=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81098C433E6
	for <intel-gfx@archiver.kernel.org>; Mon,  8 Feb 2021 10:52:58 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8F9E64E7A
	for <intel-gfx@archiver.kernel.org>; Mon,  8 Feb 2021 10:52:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E8F9E64E7A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 208886E239;
	Mon,  8 Feb 2021 10:52:56 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A7326E864
 for <intel-gfx@lists.freedesktop.org>; Mon,  8 Feb 2021 10:52:54 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.69.177; 
Received: from build.alporthouse.com (unverified [78.156.69.177]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 23809227-1500050 
 for multiple; Mon, 08 Feb 2021 10:52:44 +0000
From: Chris Wilson <chris@chris-wilson.co.uk>
To: intel-gfx@lists.freedesktop.org
Date: Mon,  8 Feb 2021 10:52:25 +0000
Message-Id: <20210208105236.28498-20-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210208105236.28498-1-chris@chris-wilson.co.uk>
References: <20210208105236.28498-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 20/31] drm/i915/gt: Add timeline "mode"
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
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Explicitly differentiate between the absolute and relative timelines,
and the global HWSP and ppHWSP relative offsets. When using a timeline
that is relative to a known status page, we can replace the absolute
addressing in the commands with indexed variants.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_timeline.c      | 21 ++++++++++++++++---
 drivers/gpu/drm/i915/gt/intel_timeline.h      |  2 +-
 .../gpu/drm/i915/gt/intel_timeline_types.h    | 10 +++++++--
 3 files changed, 27 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_timeline.c b/drivers/gpu/drm/i915/gt/intel_timeline.c
index b684322c879c..69052495c64a 100644
--- a/drivers/gpu/drm/i915/gt/intel_timeline.c
+++ b/drivers/gpu/drm/i915/gt/intel_timeline.c
@@ -226,7 +226,6 @@ static int intel_timeline_init(struct intel_timeline *timeline,
 
 	timeline->gt = gt;
 
-	timeline->has_initial_breadcrumb = !hwsp;
 	timeline->hwsp_cacheline = NULL;
 
 	if (!hwsp) {
@@ -243,13 +242,29 @@ static int intel_timeline_init(struct intel_timeline *timeline,
 			return PTR_ERR(cl);
 		}
 
+		timeline->mode = INTEL_TIMELINE_ABSOLUTE;
 		timeline->hwsp_cacheline = cl;
 		timeline->hwsp_offset = cacheline * CACHELINE_BYTES;
 
 		vaddr = page_mask_bits(cl->vaddr);
 	} else {
-		timeline->hwsp_offset = offset;
-		vaddr = i915_gem_object_pin_map(hwsp->obj, I915_MAP_WB);
+		int preferred;
+
+		if (offset & INTEL_TIMELINE_RELATIVE_CONTEXT) {
+			timeline->mode = INTEL_TIMELINE_RELATIVE_CONTEXT;
+			timeline->hwsp_offset =
+				offset & ~INTEL_TIMELINE_RELATIVE_CONTEXT;
+			preferred = i915_coherent_map_type(gt->i915);
+		} else {
+			timeline->mode = INTEL_TIMELINE_RELATIVE_ENGINE;
+			timeline->hwsp_offset = offset;
+			preferred = I915_MAP_WB;
+		}
+
+		vaddr = i915_gem_object_pin_map(hwsp->obj,
+						preferred | I915_MAP_OVERRIDE);
+		if (IS_ERR(vaddr))
+			vaddr = i915_gem_object_pin_map(hwsp->obj, I915_MAP_WC);
 		if (IS_ERR(vaddr))
 			return PTR_ERR(vaddr);
 	}
diff --git a/drivers/gpu/drm/i915/gt/intel_timeline.h b/drivers/gpu/drm/i915/gt/intel_timeline.h
index 7d6218b55df6..e1d522329757 100644
--- a/drivers/gpu/drm/i915/gt/intel_timeline.h
+++ b/drivers/gpu/drm/i915/gt/intel_timeline.h
@@ -45,7 +45,7 @@ static inline void intel_timeline_put(struct intel_timeline *timeline)
 static inline bool
 intel_timeline_has_initial_breadcrumb(const struct intel_timeline *tl)
 {
-	return tl->has_initial_breadcrumb;
+	return tl->mode == INTEL_TIMELINE_ABSOLUTE;
 }
 
 static inline int __intel_timeline_sync_set(struct intel_timeline *tl,
diff --git a/drivers/gpu/drm/i915/gt/intel_timeline_types.h b/drivers/gpu/drm/i915/gt/intel_timeline_types.h
index c5995cc290a0..61938d103a13 100644
--- a/drivers/gpu/drm/i915/gt/intel_timeline_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_timeline_types.h
@@ -19,6 +19,12 @@ struct i915_syncmap;
 struct intel_gt;
 struct intel_timeline_hwsp;
 
+enum intel_timeline_mode {
+	INTEL_TIMELINE_ABSOLUTE = 0,
+	INTEL_TIMELINE_RELATIVE_CONTEXT = BIT(0),
+	INTEL_TIMELINE_RELATIVE_ENGINE  = BIT(1),
+};
+
 struct intel_timeline {
 	u64 fence_context;
 	u32 seqno;
@@ -44,6 +50,8 @@ struct intel_timeline {
 	atomic_t pin_count;
 	atomic_t active_count;
 
+	enum intel_timeline_mode mode;
+
 	const u32 *hwsp_seqno;
 	struct i915_vma *hwsp_ggtt;
 	u32 hwsp_offset;
@@ -51,8 +59,6 @@ struct intel_timeline {
 
 	struct intel_timeline_cacheline *hwsp_cacheline;
 
-	bool has_initial_breadcrumb;
-
 	/**
 	 * List of breadcrumbs associated with GPU requests currently
 	 * outstanding.
-- 
2.20.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
