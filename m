Return-Path: <SRS0=NhnI=PJ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D450FC433EF
	for <intel-gfx@archiver.kernel.org>; Thu, 21 Oct 2021 10:37:02 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B23561205
	for <intel-gfx@archiver.kernel.org>; Thu, 21 Oct 2021 10:37:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9B23561205
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2281F6EB55;
	Thu, 21 Oct 2021 10:36:22 +0000 (UTC)
Received: from mblankhorst.nl (mblankhorst.nl
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 861C46EC3E;
 Thu, 21 Oct 2021 10:36:12 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date: Thu, 21 Oct 2021 12:36:00 +0200
Message-Id: <20211021103605.735002-23-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211021103605.735002-1-maarten.lankhorst@linux.intel.com>
References: <20211021103605.735002-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 23/28] drm/i915: Call i915_gem_evict_vm in
 vm_fault_gtt to prevent new ENOSPC errors
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

Now that we cannot unbind kill the currently locked object directly
because we're removing short term pinning, we may have to unbind the
object from gtt manually, using a i915_gem_evict_vm() call.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_mman.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
index 65fc6ff5f59d..6d557bb9926f 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
@@ -357,8 +357,22 @@ static vm_fault_t vm_fault_gtt(struct vm_fault *vmf)
 			vma = i915_gem_object_ggtt_pin_ww(obj, &ww, &view, 0, 0, flags);
 		}
 
-		/* The entire mappable GGTT is pinned? Unexpected! */
-		GEM_BUG_ON(vma == ERR_PTR(-ENOSPC));
+		/*
+		 * The entire mappable GGTT is pinned? Unexpected!
+		 * Try to evict the object we locked too, as normally we skip it
+		 * due to lack of short term pinning inside execbuf.
+		 */
+		if (vma == ERR_PTR(-ENOSPC)) {
+			ret = mutex_lock_interruptible(&ggtt->vm.mutex);
+			if (!ret) {
+				ret = i915_gem_evict_vm(&ggtt->vm, &ww);
+				mutex_unlock(&ggtt->vm.mutex);
+			}
+			if (ret)
+				goto err_reset;
+			vma = i915_gem_object_ggtt_pin_ww(obj, &ww, &view, 0, 0, flags);
+		}
+		GEM_WARN_ON(vma == ERR_PTR(-ENOSPC));
 	}
 	if (IS_ERR(vma)) {
 		ret = PTR_ERR(vma);
-- 
2.33.0

