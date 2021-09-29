Return-Path: <SRS0=4MRd=OT=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B257C433EF
	for <intel-gfx@archiver.kernel.org>; Wed, 29 Sep 2021 08:59:55 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BCB9613A6
	for <intel-gfx@archiver.kernel.org>; Wed, 29 Sep 2021 08:59:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5BCB9613A6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BB5A6E1F4;
	Wed, 29 Sep 2021 08:59:54 +0000 (UTC)
Received: from mblankhorst.nl (mblankhorst.nl [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AFD06E195;
 Wed, 29 Sep 2021 08:59:53 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 kernel test robot <lkp@intel.com>, Julia Lawall <julia.lawall@lip6.fr>
Date: Wed, 29 Sep 2021 10:59:50 +0200
Message-Id: <20210929085950.3063191-1-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH] drm/i915: Add ww context to intel_dpt_pin, v2.
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

Ensure i915_vma_pin_iomap and vma_unpin are done with dpt->obj lock held.

I don't think there's much of a point in merging intel_dpt_pin() with
intel_pin_fb_obj_dpt(), they touch different objects.

Changes since v1:
- Fix using the wrong pointer to retrieve error code (Julia)

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>
---
 drivers/gpu/drm/i915/display/intel_dpt.c | 40 +++++++++++++++---------
 1 file changed, 25 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dpt.c b/drivers/gpu/drm/i915/display/intel_dpt.c
index de62bd77b15e..8f7b1f7534a4 100644
--- a/drivers/gpu/drm/i915/display/intel_dpt.c
+++ b/drivers/gpu/drm/i915/display/intel_dpt.c
@@ -121,32 +121,42 @@ struct i915_vma *intel_dpt_pin(struct i915_address_space *vm)
 	intel_wakeref_t wakeref;
 	struct i915_vma *vma;
 	void __iomem *iomem;
+	struct i915_gem_ww_ctx ww;
+	int err;
 
 	wakeref = intel_runtime_pm_get(&i915->runtime_pm);
 	atomic_inc(&i915->gpu_error.pending_fb_pin);
 
-	vma = i915_gem_object_ggtt_pin(dpt->obj, NULL, 0, 4096,
-				       HAS_LMEM(i915) ? 0 : PIN_MAPPABLE);
-	if (IS_ERR(vma))
-		goto err;
+	for_i915_gem_ww(&ww, err, true) {
+		err = i915_gem_object_lock(dpt->obj, &ww);
+		if (err)
+			continue;
 
-	iomem = i915_vma_pin_iomap(vma);
-	i915_vma_unpin(vma);
-	if (IS_ERR(iomem)) {
-		vma = ERR_CAST(iomem);
-		goto err;
-	}
+		vma = i915_gem_object_ggtt_pin_ww(dpt->obj, &ww, NULL, 0, 4096,
+						  HAS_LMEM(i915) ? 0 : PIN_MAPPABLE);
+		if (IS_ERR(vma)) {
+			err = PTR_ERR(vma);
+			continue;
+		}
+
+		iomem = i915_vma_pin_iomap(vma);
+		i915_vma_unpin(vma);
 
-	dpt->vma = vma;
-	dpt->iomem = iomem;
+		if (IS_ERR(iomem)) {
+			err = PTR_ERR(iomem);
+			continue;
+		}
 
-	i915_vma_get(vma);
+		dpt->vma = vma;
+		dpt->iomem = iomem;
+
+		i915_vma_get(vma);
+	}
 
-err:
 	atomic_dec(&i915->gpu_error.pending_fb_pin);
 	intel_runtime_pm_put(&i915->runtime_pm, wakeref);
 
-	return vma;
+	return err ? ERR_PTR(err) : vma;
 }
 
 void intel_dpt_unpin(struct i915_address_space *vm)
-- 
2.33.0

