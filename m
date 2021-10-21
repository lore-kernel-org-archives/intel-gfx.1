Return-Path: <SRS0=NhnI=PJ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8A7DC4332F
	for <intel-gfx@archiver.kernel.org>; Thu, 21 Oct 2021 10:37:24 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D07060F6E
	for <intel-gfx@archiver.kernel.org>; Thu, 21 Oct 2021 10:37:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8D07060F6E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F312D6EC61;
	Thu, 21 Oct 2021 10:36:28 +0000 (UTC)
Received: from mblankhorst.nl (mblankhorst.nl
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 688576EC35;
 Thu, 21 Oct 2021 10:36:11 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date: Thu, 21 Oct 2021 12:35:51 +0200
Message-Id: <20211021103605.735002-14-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211021103605.735002-1-maarten.lankhorst@linux.intel.com>
References: <20211021103605.735002-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 14/28] drm/i915: Take object lock in
 i915_ggtt_pin if ww is not set
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

i915_vma_wait_for_bind needs the vma lock held, fix the caller.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/i915/i915_vma.c | 40 +++++++++++++++++++++++----------
 1 file changed, 28 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index bacc8d68e495..2877dcd62acb 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -1348,23 +1348,15 @@ static void flush_idle_contexts(struct intel_gt *gt)
 	intel_gt_wait_for_idle(gt, MAX_SCHEDULE_TIMEOUT);
 }
 
-int i915_ggtt_pin(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
-		  u32 align, unsigned int flags)
+static int __i915_ggtt_pin(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
+			   u32 align, unsigned int flags)
 {
 	struct i915_address_space *vm = vma->vm;
 	int err;
 
-	GEM_BUG_ON(!i915_vma_is_ggtt(vma));
-
-#ifdef CONFIG_LOCKDEP
-	WARN_ON(!ww && dma_resv_held(vma->obj->base.resv));
-#endif
-
 	do {
-		if (ww)
-			err = i915_vma_pin_ww(vma, ww, 0, align, flags | PIN_GLOBAL);
-		else
-			err = i915_vma_pin(vma, 0, align, flags | PIN_GLOBAL);
+		err = i915_vma_pin_ww(vma, ww, 0, align, flags | PIN_GLOBAL);
+
 		if (err != -ENOSPC) {
 			if (!err) {
 				err = i915_vma_wait_for_bind(vma);
@@ -1383,6 +1375,30 @@ int i915_ggtt_pin(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
 	} while (1);
 }
 
+int i915_ggtt_pin(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
+		  u32 align, unsigned int flags)
+{
+	struct i915_gem_ww_ctx _ww;
+	int err;
+
+	GEM_BUG_ON(!i915_vma_is_ggtt(vma));
+
+	if (ww)
+		return __i915_ggtt_pin(vma, ww, align, flags);
+
+#ifdef CONFIG_LOCKDEP
+	WARN_ON(dma_resv_held(vma->obj->base.resv));
+#endif
+
+	for_i915_gem_ww(&_ww, err, true) {
+		err = i915_gem_object_lock(vma->obj, &_ww);
+		if (!err)
+			err = __i915_ggtt_pin(vma, &_ww, align, flags);
+	}
+
+	return err;
+}
+
 static void __vma_close(struct i915_vma *vma, struct intel_gt *gt)
 {
 	/*
-- 
2.33.0

