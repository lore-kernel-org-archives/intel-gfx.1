Return-Path: <SRS0=RgPZ=DW=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B8C3C43457
	for <intel-gfx@archiver.kernel.org>; Thu, 15 Oct 2020 11:26:44 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1FA820878
	for <intel-gfx@archiver.kernel.org>; Thu, 15 Oct 2020 11:26:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B1FA820878
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D937B6EC7D;
	Thu, 15 Oct 2020 11:26:36 +0000 (UTC)
Received: from mblankhorst.nl (mblankhorst.nl [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 526D36EC69
 for <intel-gfx@lists.freedesktop.org>; Thu, 15 Oct 2020 11:26:33 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Thu, 15 Oct 2020 13:25:32 +0200
Message-Id: <20201015112627.1142745-9-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201015112627.1142745-1-maarten.lankhorst@linux.intel.com>
References: <20201015112627.1142745-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v3 08/63] drm/i915: Rework struct phys
 attachment handling
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

Instead of creating a separate object type, we make changes to
the shmem type, to clear struct page backing. This will allow us to
ensure we never run into a race when we exchange obj->ops with other
function pointers.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_object.h    |  3 +
 drivers/gpu/drm/i915/gem/i915_gem_phys.c      | 91 ++++++++++---------
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c     |  8 +-
 .../drm/i915/gem/selftests/i915_gem_phys.c    |  6 --
 4 files changed, 56 insertions(+), 52 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
index 04c29ed93632..e0c1e2817bee 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -38,6 +38,9 @@ void __i915_gem_object_release_shmem(struct drm_i915_gem_object *obj,
 				     bool needs_clflush);
 
 int i915_gem_object_attach_phys(struct drm_i915_gem_object *obj, int align);
+void i915_gem_object_put_pages_phys(struct drm_i915_gem_object *obj,
+				    struct sg_table *pages);
+
 
 void i915_gem_flush_free_objects(struct drm_i915_private *i915);
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_phys.c b/drivers/gpu/drm/i915/gem/i915_gem_phys.c
index 3b92156b494d..3960c1d9d415 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_phys.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_phys.c
@@ -76,6 +76,8 @@ static int i915_gem_object_get_pages_phys(struct drm_i915_gem_object *obj)
 
 	intel_gt_chipset_flush(&to_i915(obj->base.dev)->gt);
 
+	/* We're no longer struct page backed */
+	obj->flags &= ~I915_BO_ALLOC_STRUCT_PAGE;
 	__i915_gem_object_set_pages(obj, st, sg->length);
 
 	return 0;
@@ -89,7 +91,7 @@ static int i915_gem_object_get_pages_phys(struct drm_i915_gem_object *obj)
 	return -ENOMEM;
 }
 
-static void
+void
 i915_gem_object_put_pages_phys(struct drm_i915_gem_object *obj,
 			       struct sg_table *pages)
 {
@@ -134,83 +136,82 @@ i915_gem_object_put_pages_phys(struct drm_i915_gem_object *obj,
 			  vaddr, dma);
 }
 
-static void phys_release(struct drm_i915_gem_object *obj)
+static int i915_gem_object_shmem_to_phys(struct drm_i915_gem_object *obj)
 {
-	fput(obj->base.filp);
-}
+	struct sg_table *pages;
+	int err;
+
+	pages = __i915_gem_object_unset_pages(obj);
+
+	err = i915_gem_object_get_pages_phys(obj);
+	if (err)
+		goto err_xfer;
+
+	/* Perma-pin (until release) the physical set of pages */
+	__i915_gem_object_pin_pages(obj);
+
+	if (!IS_ERR_OR_NULL(pages))
+		i915_gem_shmem_ops.put_pages(obj, pages);
+
+	i915_gem_object_release_memory_region(obj);
+	return 0;
 
-static const struct drm_i915_gem_object_ops i915_gem_phys_ops = {
-	.name = "i915_gem_object_phys",
-	.get_pages = i915_gem_object_get_pages_phys,
-	.put_pages = i915_gem_object_put_pages_phys,
+err_xfer:
+	if (!IS_ERR_OR_NULL(pages)) {
+		unsigned int sg_page_sizes = i915_sg_page_sizes(pages->sgl);
 
-	.release = phys_release,
-};
+		__i915_gem_object_set_pages(obj, pages, sg_page_sizes);
+	}
+	return err;
+}
 
 int i915_gem_object_attach_phys(struct drm_i915_gem_object *obj, int align)
 {
-	struct sg_table *pages;
 	int err;
 
 	if (align > obj->base.size)
 		return -EINVAL;
 
-	if (obj->ops == &i915_gem_phys_ops)
-		return 0;
-
 	if (obj->ops != &i915_gem_shmem_ops)
 		return -EINVAL;
 
+	if (!i915_gem_object_has_struct_page(obj))
+		return 0;
+
 	err = i915_gem_object_unbind(obj, I915_GEM_OBJECT_UNBIND_ACTIVE);
 	if (err)
 		return err;
 
 	mutex_lock_nested(&obj->mm.lock, I915_MM_GET_PAGES);
 
+	if (unlikely(!i915_gem_object_has_struct_page(obj)))
+		goto out;
+
 	if (obj->mm.madv != I915_MADV_WILLNEED) {
 		err = -EFAULT;
-		goto err_unlock;
+		goto out;
 	}
 
 	if (obj->mm.quirked) {
 		err = -EFAULT;
-		goto err_unlock;
+		goto out;
 	}
 
-	if (obj->mm.mapping) {
+	if (obj->mm.mapping || i915_gem_object_has_pinned_pages(obj)) {
 		err = -EBUSY;
-		goto err_unlock;
+		goto out;
 	}
 
-	pages = __i915_gem_object_unset_pages(obj);
-
-	obj->ops = &i915_gem_phys_ops;
-	obj->flags &= ~I915_BO_ALLOC_STRUCT_PAGE;
-
-	err = ____i915_gem_object_get_pages(obj);
-	if (err)
-		goto err_xfer;
-
-	/* Perma-pin (until release) the physical set of pages */
-	__i915_gem_object_pin_pages(obj);
-
-	if (!IS_ERR_OR_NULL(pages))
-		i915_gem_shmem_ops.put_pages(obj, pages);
-
-	i915_gem_object_release_memory_region(obj);
-
-	mutex_unlock(&obj->mm.lock);
-	return 0;
+	if (unlikely(obj->mm.madv != I915_MADV_WILLNEED)) {
+		drm_dbg(obj->base.dev,
+			"Attempting to obtain a purgeable object\n");
+		err = -EFAULT;
+		goto out;
+	}
 
-err_xfer:
-	obj->ops = &i915_gem_shmem_ops;
-	obj->flags |= I915_BO_ALLOC_STRUCT_PAGE;
-	if (!IS_ERR_OR_NULL(pages)) {
-		unsigned int sg_page_sizes = i915_sg_page_sizes(pages->sgl);
+	err = i915_gem_object_shmem_to_phys(obj);
 
-		__i915_gem_object_set_pages(obj, pages, sg_page_sizes);
-	}
-err_unlock:
+out:
 	mutex_unlock(&obj->mm.lock);
 	return err;
 }
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
index 1ad4713589da..e0778b3cc0c3 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
@@ -303,6 +303,11 @@ shmem_put_pages(struct drm_i915_gem_object *obj, struct sg_table *pages)
 	struct pagevec pvec;
 	struct page *page;
 
+	if (unlikely(!i915_gem_object_has_struct_page(obj))) {
+		i915_gem_object_put_pages_phys(obj, pages);
+		return;
+	}
+
 	__i915_gem_object_release_shmem(obj, pages, true);
 
 	i915_gem_gtt_finish_pages(obj, pages);
@@ -423,7 +428,8 @@ shmem_pwrite(struct drm_i915_gem_object *obj,
 
 static void shmem_release(struct drm_i915_gem_object *obj)
 {
-	i915_gem_object_release_memory_region(obj);
+	if (obj->flags & I915_BO_ALLOC_STRUCT_PAGE)
+		i915_gem_object_release_memory_region(obj);
 
 	fput(obj->base.filp);
 }
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_phys.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_phys.c
index fb6a17701310..0cfa082047fe 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_phys.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_phys.c
@@ -38,12 +38,6 @@ static int mock_phys_object(void *arg)
 	}
 
 	if (i915_gem_object_has_struct_page(obj)) {
-		err = -EINVAL;
-		pr_err("shmem has a struct page\n");
-		goto out_obj;
-	}
-
-	if (obj->ops != &i915_gem_phys_ops) {
 		pr_err("i915_gem_object_attach_phys did not create a phys object\n");
 		err = -EINVAL;
 		goto out_obj;
-- 
2.28.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
