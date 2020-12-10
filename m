Return-Path: <SRS0=CSZM=FO=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6448AC4361B
	for <intel-gfx@archiver.kernel.org>; Thu, 10 Dec 2020 08:02:55 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7E8C23D37
	for <intel-gfx@archiver.kernel.org>; Thu, 10 Dec 2020 08:02:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E7E8C23D37
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB09F6E372;
	Thu, 10 Dec 2020 08:02:52 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 399746E372
 for <intel-gfx@lists.freedesktop.org>; Thu, 10 Dec 2020 08:02:51 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from build.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 23275674-1500050 
 for multiple; Thu, 10 Dec 2020 08:02:44 +0000
From: Chris Wilson <chris@chris-wilson.co.uk>
To: intel-gfx@lists.freedesktop.org
Date: Thu, 10 Dec 2020 08:02:38 +0000
Message-Id: <20201210080240.24529-19-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201210080240.24529-1-chris@chris-wilson.co.uk>
References: <20201210080240.24529-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 19/21] drm/i915/gt: Use indices for writing into
 relative timelines
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

Relative timelines are relative to either the global or per-process
HWSP, and so we can replace the absolute addressing with store-index
variants for position invariance.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c | 98 +++++++++++++++++-------
 drivers/gpu/drm/i915/gt/intel_timeline.h | 12 +++
 2 files changed, 82 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
index ed88dc4de72c..386da26816d0 100644
--- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
@@ -502,7 +502,19 @@ gen8_emit_fini_breadcrumb_tail(struct i915_request *rq, u32 *cs)
 
 static u32 *emit_xcs_breadcrumb(struct i915_request *rq, u32 *cs)
 {
-	return gen8_emit_ggtt_write(cs, rq->fence.seqno, hwsp_offset(rq), 0);
+	struct intel_timeline *tl = rcu_dereference_protected(rq->timeline, 1);
+	unsigned int flags = MI_FLUSH_DW_OP_STOREDW;
+	u32 offset = hwsp_offset(rq);
+
+	if (intel_timeline_is_relative(tl)) {
+		offset = offset_in_page(offset);
+		flags |= MI_FLUSH_DW_STORE_INDEX;
+	}
+	GEM_BUG_ON(offset & 7);
+	if (intel_timeline_is_global(tl))
+		offset |= MI_FLUSH_DW_USE_GTT;
+
+	return __gen8_emit_flush_dw(cs, rq->fence.seqno, offset, flags);
 }
 
 u32 *gen8_emit_fini_breadcrumb_xcs(struct i915_request *rq, u32 *cs)
@@ -512,6 +524,18 @@ u32 *gen8_emit_fini_breadcrumb_xcs(struct i915_request *rq, u32 *cs)
 
 u32 *gen8_emit_fini_breadcrumb_rcs(struct i915_request *rq, u32 *cs)
 {
+	struct intel_timeline *tl = rcu_dereference_protected(rq->timeline, 1);
+	unsigned int flags = PIPE_CONTROL_FLUSH_ENABLE | PIPE_CONTROL_CS_STALL;
+	u32 offset = hwsp_offset(rq);
+
+	if (intel_timeline_is_relative(tl)) {
+		offset = offset_in_page(offset);
+		flags |= PIPE_CONTROL_STORE_DATA_INDEX;
+	}
+	GEM_BUG_ON(offset & 7);
+	if (intel_timeline_is_global(tl))
+		flags |= PIPE_CONTROL_GLOBAL_GTT_IVB;
+
 	cs = gen8_emit_pipe_control(cs,
 				    PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH |
 				    PIPE_CONTROL_DEPTH_CACHE_FLUSH |
@@ -519,26 +543,33 @@ u32 *gen8_emit_fini_breadcrumb_rcs(struct i915_request *rq, u32 *cs)
 				    0);
 
 	/* XXX flush+write+CS_STALL all in one upsets gem_concurrent_blt:kbl */
-	cs = gen8_emit_ggtt_write_rcs(cs,
-				      rq->fence.seqno,
-				      hwsp_offset(rq),
-				      PIPE_CONTROL_FLUSH_ENABLE |
-				      PIPE_CONTROL_CS_STALL);
+	cs = __gen8_emit_write_rcs(cs, rq->fence.seqno, offset, 0, flags);
 
 	return gen8_emit_fini_breadcrumb_tail(rq, cs);
 }
 
 u32 *gen11_emit_fini_breadcrumb_rcs(struct i915_request *rq, u32 *cs)
 {
-	cs = gen8_emit_ggtt_write_rcs(cs,
-				      rq->fence.seqno,
-				      hwsp_offset(rq),
-				      PIPE_CONTROL_CS_STALL |
-				      PIPE_CONTROL_TILE_CACHE_FLUSH |
-				      PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH |
-				      PIPE_CONTROL_DEPTH_CACHE_FLUSH |
-				      PIPE_CONTROL_DC_FLUSH_ENABLE |
-				      PIPE_CONTROL_FLUSH_ENABLE);
+	struct intel_timeline *tl = rcu_dereference_protected(rq->timeline, 1);
+	u32 offset = hwsp_offset(rq);
+	unsigned int flags;
+
+	flags = (PIPE_CONTROL_CS_STALL |
+		 PIPE_CONTROL_TILE_CACHE_FLUSH |
+		 PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH |
+		 PIPE_CONTROL_DEPTH_CACHE_FLUSH |
+		 PIPE_CONTROL_DC_FLUSH_ENABLE |
+		 PIPE_CONTROL_FLUSH_ENABLE);
+
+	if (intel_timeline_is_relative(tl)) {
+		offset = offset_in_page(offset);
+		flags |= PIPE_CONTROL_STORE_DATA_INDEX;
+	}
+	GEM_BUG_ON(offset & 7);
+	if (intel_timeline_is_global(tl))
+		flags |= PIPE_CONTROL_GLOBAL_GTT_IVB;
+
+	cs = __gen8_emit_write_rcs(cs, rq->fence.seqno, offset, 0, flags);
 
 	return gen8_emit_fini_breadcrumb_tail(rq, cs);
 }
@@ -601,19 +632,30 @@ u32 *gen12_emit_fini_breadcrumb_xcs(struct i915_request *rq, u32 *cs)
 
 u32 *gen12_emit_fini_breadcrumb_rcs(struct i915_request *rq, u32 *cs)
 {
-	cs = gen12_emit_ggtt_write_rcs(cs,
-				       rq->fence.seqno,
-				       hwsp_offset(rq),
-				       PIPE_CONTROL0_HDC_PIPELINE_FLUSH,
-				       PIPE_CONTROL_CS_STALL |
-				       PIPE_CONTROL_TILE_CACHE_FLUSH |
-				       PIPE_CONTROL_FLUSH_L3 |
-				       PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH |
-				       PIPE_CONTROL_DEPTH_CACHE_FLUSH |
-				       /* Wa_1409600907:tgl */
-				       PIPE_CONTROL_DEPTH_STALL |
-				       PIPE_CONTROL_DC_FLUSH_ENABLE |
-				       PIPE_CONTROL_FLUSH_ENABLE);
+	struct intel_timeline *tl = rcu_dereference_protected(rq->timeline, 1);
+	u32 offset = hwsp_offset(rq);
+	unsigned int flags;
+
+	flags = (PIPE_CONTROL_CS_STALL |
+		 PIPE_CONTROL_TILE_CACHE_FLUSH |
+		 PIPE_CONTROL_FLUSH_L3 |
+		 PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH |
+		 PIPE_CONTROL_DEPTH_CACHE_FLUSH |
+		 /* Wa_1409600907:tgl */
+		 PIPE_CONTROL_DEPTH_STALL |
+		 PIPE_CONTROL_DC_FLUSH_ENABLE |
+		 PIPE_CONTROL_FLUSH_ENABLE);
+
+	if (intel_timeline_is_relative(tl)) {
+		offset = offset_in_page(offset);
+		flags |= PIPE_CONTROL_STORE_DATA_INDEX;
+	}
+	GEM_BUG_ON(offset & 7);
+	if (intel_timeline_is_global(tl))
+		flags |= PIPE_CONTROL_GLOBAL_GTT_IVB;
+
+	cs = __gen8_emit_write_rcs(cs, rq->fence.seqno, offset,
+				   PIPE_CONTROL0_HDC_PIPELINE_FLUSH, flags);
 
 	return gen12_emit_fini_breadcrumb_tail(rq, cs);
 }
diff --git a/drivers/gpu/drm/i915/gt/intel_timeline.h b/drivers/gpu/drm/i915/gt/intel_timeline.h
index 69250de3a814..a3bdbff62e96 100644
--- a/drivers/gpu/drm/i915/gt/intel_timeline.h
+++ b/drivers/gpu/drm/i915/gt/intel_timeline.h
@@ -79,6 +79,18 @@ intel_timeline_has_initial_breadcrumb(const struct intel_timeline *tl)
 	return tl->mode == INTEL_TIMELINE_ABSOLUTE;
 }
 
+static inline bool
+intel_timeline_is_relative(const struct intel_timeline *tl)
+{
+	return tl->mode != INTEL_TIMELINE_ABSOLUTE;
+}
+
+static inline bool
+intel_timeline_is_global(const struct intel_timeline *tl)
+{
+	return tl->mode != INTEL_TIMELINE_CONTEXT;
+}
+
 static inline int __intel_timeline_sync_set(struct intel_timeline *tl,
 					    u64 context, u32 seqno)
 {
-- 
2.20.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
