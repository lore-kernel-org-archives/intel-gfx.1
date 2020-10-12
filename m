Return-Path: <SRS0=uIVS=DT=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30845C433E7
	for <intel-gfx@archiver.kernel.org>; Mon, 12 Oct 2020 14:47:36 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE07F2067C
	for <intel-gfx@archiver.kernel.org>; Mon, 12 Oct 2020 14:47:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE07F2067C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 180186E4F8;
	Mon, 12 Oct 2020 14:47:15 +0000 (UTC)
Received: from mblankhorst.nl (mblankhorst.nl [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F04C06E49C
 for <intel-gfx@lists.freedesktop.org>; Mon, 12 Oct 2020 14:47:11 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Mon, 12 Oct 2020 16:46:17 +0200
Message-Id: <20201012144706.555345-13-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201012144706.555345-1-maarten.lankhorst@linux.intel.com>
References: <20201012144706.555345-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v2 12/61] drm/i915: Reject more ioctls for
 userptr
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

Allow set_domain to fail silently, waiting for idle should be good enough.
set_tiling and set_caching are rejected with -ENXIO, there's no valid reason
to allow it.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 2 +-
 drivers/gpu/drm/i915/gem/i915_gem_domain.c   | 4 +++-
 drivers/gpu/drm/i915/gem/i915_gem_object.h   | 6 ++++++
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c  | 3 ++-
 4 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index cf1417ff54d7..a7e3f61c5777 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -17357,7 +17357,7 @@ static int intel_user_framebuffer_create_handle(struct drm_framebuffer *fb,
 	struct drm_i915_gem_object *obj = intel_fb_obj(fb);
 	struct drm_i915_private *i915 = to_i915(obj->base.dev);
 
-	if (obj->userptr.mm) {
+	if (i915_gem_object_is_userptr(obj)) {
 		drm_dbg(&i915->drm,
 			"attempting to use a userptr for a framebuffer, denied\n");
 		return -EINVAL;
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_domain.c b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
index 7c90a63c273d..43c22648b074 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_domain.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
@@ -543,7 +543,9 @@ i915_gem_set_domain_ioctl(struct drm_device *dev, void *data,
 	 * considered to be outside of any cache domain.
 	 */
 	if (i915_gem_object_is_proxy(obj)) {
-		err = -ENXIO;
+		/* silently allow userptr to complete */
+		if (!i915_gem_object_is_userptr(obj))
+			err = -ENXIO;
 		goto out;
 	}
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
index e0c1e2817bee..436ff0d4951f 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -528,6 +528,12 @@ void __i915_gem_object_flush_frontbuffer(struct drm_i915_gem_object *obj,
 void __i915_gem_object_invalidate_frontbuffer(struct drm_i915_gem_object *obj,
 					      enum fb_op_origin origin);
 
+static inline bool
+i915_gem_object_is_userptr(struct drm_i915_gem_object *obj)
+{
+	return obj->userptr.mm;
+}
+
 static inline void
 i915_gem_object_flush_frontbuffer(struct drm_i915_gem_object *obj,
 				  enum fb_op_origin origin)
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
index 9c1293c99d88..3fd63fdd7466 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
@@ -721,7 +721,8 @@ static const struct drm_i915_gem_object_ops i915_gem_userptr_ops = {
 	.name = "i915_gem_object_userptr",
 	.flags = I915_GEM_OBJECT_IS_SHRINKABLE |
 		 I915_GEM_OBJECT_NO_MMAP |
-		 I915_GEM_OBJECT_ASYNC_CANCEL,
+		 I915_GEM_OBJECT_ASYNC_CANCEL |
+		 I915_GEM_OBJECT_IS_PROXY,
 	.get_pages = i915_gem_userptr_get_pages,
 	.put_pages = i915_gem_userptr_put_pages,
 	.dmabuf_export = i915_gem_userptr_dmabuf_export,
-- 
2.28.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
