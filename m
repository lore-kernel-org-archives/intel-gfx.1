Return-Path: <SRS0=beGZ=OK=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EC19C433FE
	for <intel-gfx@archiver.kernel.org>; Mon, 20 Sep 2021 15:59:40 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0995A60F6B
	for <intel-gfx@archiver.kernel.org>; Mon, 20 Sep 2021 15:59:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0995A60F6B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 650F56E550;
	Mon, 20 Sep 2021 15:59:29 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1705C6E546;
 Mon, 20 Sep 2021 15:59:28 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10113"; a="203318388"
X-IronPort-AV: E=Sophos;i="5.85,308,1624345200"; d="scan'208";a="203318388"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2021 08:59:27 -0700
X-IronPort-AV: E=Sophos;i="5.85,308,1624345200"; d="scan'208";a="701106635"
Received: from kjeldbeg-mobl2.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.165])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2021 08:59:26 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com, matthew.auld@intel.com,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Mon, 20 Sep 2021 17:59:10 +0200
Message-Id: <20210920155914.707984-3-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210920155914.707984-1-thomas.hellstrom@linux.intel.com>
References: <20210920155914.707984-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH v4 2/6] drm/i915/gem: Implement a function to
 process all gem objects of a region
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

An upcoming common pattern is to traverse the region object list and
perform certain actions on all objects in a region. It's a little tricky
to get the list locking right, in particular since a gem object may
change region unless it's pinned or the object lock is held.

Define a function that does this for us and that takes an argument that
defines the action to be performed on each object.

v3:
- Improve structure documentation a bit (Matthew Auld)

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_region.c | 70 ++++++++++++++++++++++
 drivers/gpu/drm/i915/gem/i915_gem_region.h | 37 ++++++++++++
 2 files changed, 107 insertions(+)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_region.c b/drivers/gpu/drm/i915/gem/i915_gem_region.c
index 1f557b2178ed..a016ccec36f3 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_region.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_region.c
@@ -80,3 +80,73 @@ i915_gem_object_create_region(struct intel_memory_region *mem,
 	i915_gem_object_free(obj);
 	return ERR_PTR(err);
 }
+
+/**
+ * i915_gem_process_region - Iterate over all objects of a region using ops
+ * to process and optionally skip objects
+ * @mr: The memory region
+ * @apply: ops and private data
+ *
+ * This function can be used to iterate over the regions object list,
+ * checking whether to skip objects, and, if not, lock the objects and
+ * process them using the supplied ops. Note that this function temporarily
+ * removes objects from the region list while iterating, so that if run
+ * concurrently with itself may not iterate over all objects.
+ *
+ * Return: 0 if successful, negative error code on failure.
+ */
+int i915_gem_process_region(struct intel_memory_region *mr,
+			    struct i915_gem_apply_to_region *apply)
+{
+	const struct i915_gem_apply_to_region_ops *ops = apply->ops;
+	struct drm_i915_gem_object *obj;
+	struct list_head still_in_list;
+	int ret = 0;
+
+	/*
+	 * In the future, a non-NULL apply->ww could mean the caller is
+	 * already in a locking transaction and provides its own context.
+	 */
+	GEM_WARN_ON(apply->ww);
+
+	INIT_LIST_HEAD(&still_in_list);
+	mutex_lock(&mr->objects.lock);
+	for (;;) {
+		struct i915_gem_ww_ctx ww;
+
+		obj = list_first_entry_or_null(&mr->objects.list, typeof(*obj),
+					       mm.region_link);
+		if (!obj)
+			break;
+
+		list_move_tail(&obj->mm.region_link, &still_in_list);
+		if (!kref_get_unless_zero(&obj->base.refcount))
+			continue;
+
+		/*
+		 * Note: Someone else might be migrating the object at this
+		 * point. The object's region is not stable until we lock
+		 * the object.
+		 */
+		mutex_unlock(&mr->objects.lock);
+		apply->ww = &ww;
+		for_i915_gem_ww(&ww, ret, apply->interruptible) {
+			ret = i915_gem_object_lock(obj, apply->ww);
+			if (ret)
+				continue;
+
+			if (obj->mm.region == mr)
+				ret = ops->process_obj(apply, obj);
+			/* Implicit object unlock */
+		}
+
+		i915_gem_object_put(obj);
+		mutex_lock(&mr->objects.lock);
+		if (ret)
+			break;
+	}
+	list_splice_tail(&still_in_list, &mr->objects.list);
+	mutex_unlock(&mr->objects.lock);
+
+	return ret;
+}
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_region.h b/drivers/gpu/drm/i915/gem/i915_gem_region.h
index 1008e580a89a..fcaa12d657d4 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_region.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_region.h
@@ -12,6 +12,41 @@ struct intel_memory_region;
 struct drm_i915_gem_object;
 struct sg_table;
 
+struct i915_gem_apply_to_region;
+
+/**
+ * struct i915_gem_apply_to_region_ops - ops to use when iterating over all
+ * region objects.
+ */
+struct i915_gem_apply_to_region_ops {
+	/**
+	 * process_obj - Process the current object
+	 * @apply: Embed this for private data.
+	 * @obj: The current object.
+	 *
+	 * Note that if this function is part of a ww transaction, and
+	 * if returns -EDEADLK for one of the objects, it may be
+	 * rerun for that same object in the same pass.
+	 */
+	int (*process_obj)(struct i915_gem_apply_to_region *apply,
+			   struct drm_i915_gem_object *obj);
+};
+
+/**
+ * struct i915_gem_apply_to_region - Argument to the struct
+ * i915_gem_apply_to_region_ops functions.
+ * @ops: The ops for the operation.
+ * @ww: Locking context used for the transaction.
+ * @interruptible: Whether to perform object locking interruptible.
+ *
+ * This structure is intended to be embedded in a private struct if needed
+ */
+struct i915_gem_apply_to_region {
+	const struct i915_gem_apply_to_region_ops *ops;
+	struct i915_gem_ww_ctx *ww;
+	u32 interruptible:1;
+};
+
 void i915_gem_object_init_memory_region(struct drm_i915_gem_object *obj,
 					struct intel_memory_region *mem);
 void i915_gem_object_release_memory_region(struct drm_i915_gem_object *obj);
@@ -22,4 +57,6 @@ i915_gem_object_create_region(struct intel_memory_region *mem,
 			      resource_size_t page_size,
 			      unsigned int flags);
 
+int i915_gem_process_region(struct intel_memory_region *mr,
+			    struct i915_gem_apply_to_region *apply);
 #endif
-- 
2.31.1

