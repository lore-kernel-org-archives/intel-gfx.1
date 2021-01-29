Return-Path: <SRS0=0PWK=HA=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35542C433E0
	for <intel-gfx@archiver.kernel.org>; Fri, 29 Jan 2021 00:49:46 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B274864DEB
	for <intel-gfx@archiver.kernel.org>; Fri, 29 Jan 2021 00:49:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B274864DEB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9FD56EA64;
	Fri, 29 Jan 2021 00:49:44 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0F516EA64
 for <intel-gfx@lists.freedesktop.org>; Fri, 29 Jan 2021 00:49:42 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from build.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 23731782-1500050 
 for multiple; Fri, 29 Jan 2021 00:49:35 +0000
From: Chris Wilson <chris@chris-wilson.co.uk>
To: intel-gfx@lists.freedesktop.org
Date: Fri, 29 Jan 2021 00:49:33 +0000
Message-Id: <20210129004933.29755-2-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210129004933.29755-1-chris@chris-wilson.co.uk>
References: <20210129004933.29755-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 2/2] drm/i915/gvt: Purge dev_priv->gt
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

Use the right intel_gt stored as a backpointer in intel_vgpu.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 drivers/gpu/drm/i915/gvt/execlist.c  | 8 +++-----
 drivers/gpu/drm/i915/gvt/scheduler.c | 3 +--
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/execlist.c b/drivers/gpu/drm/i915/gvt/execlist.c
index 158873f269b1..c8dcda6d4f0d 100644
--- a/drivers/gpu/drm/i915/gvt/execlist.c
+++ b/drivers/gpu/drm/i915/gvt/execlist.c
@@ -522,12 +522,11 @@ static void init_vgpu_execlist(struct intel_vgpu *vgpu,
 static void clean_execlist(struct intel_vgpu *vgpu,
 			   intel_engine_mask_t engine_mask)
 {
-	struct drm_i915_private *dev_priv = vgpu->gvt->gt->i915;
-	struct intel_engine_cs *engine;
 	struct intel_vgpu_submission *s = &vgpu->submission;
+	struct intel_engine_cs *engine;
 	intel_engine_mask_t tmp;
 
-	for_each_engine_masked(engine, &dev_priv->gt, engine_mask, tmp) {
+	for_each_engine_masked(engine, vgpu->gvt->gt, engine_mask, tmp) {
 		kfree(s->ring_scan_buffer[engine->id]);
 		s->ring_scan_buffer[engine->id] = NULL;
 		s->ring_scan_buffer_size[engine->id] = 0;
@@ -537,11 +536,10 @@ static void clean_execlist(struct intel_vgpu *vgpu,
 static void reset_execlist(struct intel_vgpu *vgpu,
 			   intel_engine_mask_t engine_mask)
 {
-	struct drm_i915_private *dev_priv = vgpu->gvt->gt->i915;
 	struct intel_engine_cs *engine;
 	intel_engine_mask_t tmp;
 
-	for_each_engine_masked(engine, &dev_priv->gt, engine_mask, tmp)
+	for_each_engine_masked(engine, vgpu->gvt->gt, engine_mask, tmp)
 		init_vgpu_execlist(vgpu, engine);
 }
 
diff --git a/drivers/gpu/drm/i915/gvt/scheduler.c b/drivers/gpu/drm/i915/gvt/scheduler.c
index 43f31c2eab14..a55ae50dbbe1 100644
--- a/drivers/gpu/drm/i915/gvt/scheduler.c
+++ b/drivers/gpu/drm/i915/gvt/scheduler.c
@@ -1015,13 +1015,12 @@ void intel_vgpu_clean_workloads(struct intel_vgpu *vgpu,
 				intel_engine_mask_t engine_mask)
 {
 	struct intel_vgpu_submission *s = &vgpu->submission;
-	struct drm_i915_private *dev_priv = vgpu->gvt->gt->i915;
 	struct intel_engine_cs *engine;
 	struct intel_vgpu_workload *pos, *n;
 	intel_engine_mask_t tmp;
 
 	/* free the unsubmited workloads in the queues. */
-	for_each_engine_masked(engine, &dev_priv->gt, engine_mask, tmp) {
+	for_each_engine_masked(engine, vgpu->gvt->gt, engine_mask, tmp) {
 		list_for_each_entry_safe(pos, n,
 			&s->workload_q_head[engine->id], list) {
 			list_del_init(&pos->list);
-- 
2.20.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
