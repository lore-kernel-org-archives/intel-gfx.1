Return-Path: <SRS0=RgPZ=DW=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62AAEC433E7
	for <intel-gfx@archiver.kernel.org>; Thu, 15 Oct 2020 11:26:57 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0AC5D20878
	for <intel-gfx@archiver.kernel.org>; Thu, 15 Oct 2020 11:26:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0AC5D20878
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B3826EC8D;
	Thu, 15 Oct 2020 11:26:49 +0000 (UTC)
Received: from mblankhorst.nl (mblankhorst.nl [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 707FE6EC6F
 for <intel-gfx@lists.freedesktop.org>; Thu, 15 Oct 2020 11:26:34 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Thu, 15 Oct 2020 13:25:29 +0200
Message-Id: <20201015112627.1142745-6-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201015112627.1142745-1-maarten.lankhorst@linux.intel.com>
References: <20201015112627.1142745-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v3 05/63] drm/i915: Ensure we hold the object
 mutex in pin correctly.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Currently we have a lot of places where we hold the gem object lock,
but haven't yet been converted to the ww dance. Complain loudly about
those places.

i915_vma_pin shouldn't have the obj lock held, so we can do a ww dance,
while i915_vma_pin_ww should.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/intel_renderstate.c |  2 +-
 drivers/gpu/drm/i915/i915_vma.c             | 11 ++++++++++-
 drivers/gpu/drm/i915/i915_vma.h             |  3 +++
 3 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_renderstate.c b/drivers/gpu/drm/i915/gt/intel_renderstate.c
index ea2a77c7b469..a68e5c23a67c 100644
--- a/drivers/gpu/drm/i915/gt/intel_renderstate.c
+++ b/drivers/gpu/drm/i915/gt/intel_renderstate.c
@@ -196,7 +196,7 @@ int intel_renderstate_init(struct intel_renderstate *so,
 	if (err)
 		goto err_context;
 
-	err = i915_vma_pin(so->vma, 0, 0, PIN_GLOBAL | PIN_HIGH);
+	err = i915_vma_pin_ww(so->vma, &so->ww, 0, 0, PIN_GLOBAL | PIN_HIGH);
 	if (err)
 		goto err_context;
 
diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index ffb5287e055a..4ead74c5142b 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -863,6 +863,8 @@ int i915_vma_pin_ww(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
 #ifdef CONFIG_PROVE_LOCKING
 	if (debug_locks && lockdep_is_held(&vma->vm->i915->drm.struct_mutex))
 		WARN_ON(!ww);
+	if (debug_locks && ww && vma->resv)
+		assert_vma_held(vma);
 #endif
 
 	BUILD_BUG_ON(PIN_GLOBAL != I915_VMA_GLOBAL_BIND);
@@ -1018,8 +1020,15 @@ int i915_ggtt_pin(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
 
 	GEM_BUG_ON(!i915_vma_is_ggtt(vma));
 
+#ifdef CONFIG_LOCKDEP
+	WARN_ON(!ww && vma->resv && dma_resv_held(vma->resv));
+#endif
+
 	do {
-		err = i915_vma_pin_ww(vma, ww, 0, align, flags | PIN_GLOBAL);
+		if (ww)
+			err = i915_vma_pin_ww(vma, ww, 0, align, flags | PIN_GLOBAL);
+		else
+			err = i915_vma_pin(vma, 0, align, flags | PIN_GLOBAL);
 		if (err != -ENOSPC) {
 			if (!err) {
 				err = i915_vma_wait_for_bind(vma);
diff --git a/drivers/gpu/drm/i915/i915_vma.h b/drivers/gpu/drm/i915/i915_vma.h
index 5b3a3c653454..838bbbeb11cc 100644
--- a/drivers/gpu/drm/i915/i915_vma.h
+++ b/drivers/gpu/drm/i915/i915_vma.h
@@ -243,6 +243,9 @@ i915_vma_pin_ww(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
 static inline int __must_check
 i915_vma_pin(struct i915_vma *vma, u64 size, u64 alignment, u64 flags)
 {
+#ifdef CONFIG_LOCKDEP
+	WARN_ON_ONCE(vma->resv && dma_resv_held(vma->resv));
+#endif
 	return i915_vma_pin_ww(vma, NULL, size, alignment, flags);
 }
 
-- 
2.28.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
