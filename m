Return-Path: <SRS0=0ugA=J2=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48C80C433ED
	for <intel-gfx@archiver.kernel.org>; Thu, 29 Apr 2021 10:10:45 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A506061453
	for <intel-gfx@archiver.kernel.org>; Thu, 29 Apr 2021 10:10:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A506061453
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE00D6EDD8;
	Thu, 29 Apr 2021 10:10:41 +0000 (UTC)
Received: from mblankhorst.nl (mblankhorst.nl [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A27C66EDDA
 for <intel-gfx@lists.freedesktop.org>; Thu, 29 Apr 2021 10:10:40 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Thu, 29 Apr 2021 12:10:34 +0200
Message-Id: <20210429101036.1086461-3-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210429101036.1086461-1-maarten.lankhorst@linux.intel.com>
References: <20210429101036.1086461-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 2/4] drm/i915: Add ww context to
 prepare_(read/write)
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

This will allow us to explicitly pass the ww to pin_pages, when it starts taking it.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_domain.c              | 2 ++
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c          | 7 ++++---
 drivers/gpu/drm/i915/gem/i915_gem_object.h              | 2 ++
 drivers/gpu/drm/i915/gem/selftests/huge_pages.c         | 2 +-
 drivers/gpu/drm/i915/gem/selftests/i915_gem_coherency.c | 4 ++--
 drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c   | 4 ++--
 drivers/gpu/drm/i915/i915_gem.c                         | 4 ++--
 7 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_domain.c b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
index 073822100da7..6c7d9efb319c 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_domain.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
@@ -598,6 +598,7 @@ i915_gem_set_domain_ioctl(struct drm_device *dev, void *data,
  * flush the object from the CPU cache.
  */
 int i915_gem_object_prepare_read(struct drm_i915_gem_object *obj,
+				 struct i915_gem_ww_ctx *ww,
 				 unsigned int *needs_clflush)
 {
 	int ret;
@@ -648,6 +649,7 @@ int i915_gem_object_prepare_read(struct drm_i915_gem_object *obj,
 }
 
 int i915_gem_object_prepare_write(struct drm_i915_gem_object *obj,
+				  struct i915_gem_ww_ctx *ww,
 				  unsigned int *needs_clflush)
 {
 	int ret;
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index 297143511f99..17a87d176a67 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -1154,9 +1154,10 @@ static void reloc_cache_reset(struct reloc_cache *cache, struct i915_execbuffer
 }
 
 static void *reloc_kmap(struct drm_i915_gem_object *obj,
-			struct reloc_cache *cache,
+			struct i915_execbuffer *eb,
 			unsigned long pageno)
 {
+	struct reloc_cache *cache = &eb->reloc_cache;
 	void *vaddr;
 	struct page *page;
 
@@ -1166,7 +1167,7 @@ static void *reloc_kmap(struct drm_i915_gem_object *obj,
 		unsigned int flushes;
 		int err;
 
-		err = i915_gem_object_prepare_write(obj, &flushes);
+		err = i915_gem_object_prepare_write(obj, &eb->ww, &flushes);
 		if (err)
 			return ERR_PTR(err);
 
@@ -1271,7 +1272,7 @@ static void *reloc_vaddr(struct drm_i915_gem_object *obj,
 		if ((cache->vaddr & KMAP) == 0)
 			vaddr = reloc_iomap(obj, eb, page);
 		if (!vaddr)
-			vaddr = reloc_kmap(obj, cache, page);
+			vaddr = reloc_kmap(obj, eb, page);
 	}
 
 	return vaddr;
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
index 2ebd79537aea..f7a0cf1a8f24 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -480,8 +480,10 @@ static inline void i915_gem_object_unpin_map(struct drm_i915_gem_object *obj)
 void __i915_gem_object_release_map(struct drm_i915_gem_object *obj);
 
 int i915_gem_object_prepare_read(struct drm_i915_gem_object *obj,
+				 struct i915_gem_ww_ctx *ww,
 				 unsigned int *needs_clflush);
 int i915_gem_object_prepare_write(struct drm_i915_gem_object *obj,
+				  struct i915_gem_ww_ctx *ww,
 				  unsigned int *needs_clflush);
 #define CLFLUSH_BEFORE	BIT(0)
 #define CLFLUSH_AFTER	BIT(1)
diff --git a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
index b5b115005bb1..67be3cf77f71 100644
--- a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
+++ b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
@@ -999,7 +999,7 @@ __cpu_check_shmem(struct drm_i915_gem_object *obj, u32 dword, u32 val)
 	int err;
 
 	i915_gem_object_lock(obj, NULL);
-	err = i915_gem_object_prepare_read(obj, &needs_flush);
+	err = i915_gem_object_prepare_read(obj, NULL, &needs_flush);
 	if (err)
 		goto err_unlock;
 
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_coherency.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_coherency.c
index e937b6629019..ced2454cebb0 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_coherency.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_coherency.c
@@ -29,7 +29,7 @@ static int cpu_set(struct context *ctx, unsigned long offset, u32 v)
 	int err;
 
 	i915_gem_object_lock(ctx->obj, NULL);
-	err = i915_gem_object_prepare_write(ctx->obj, &needs_clflush);
+	err = i915_gem_object_prepare_write(ctx->obj, NULL, &needs_clflush);
 	if (err)
 		goto out;
 
@@ -62,7 +62,7 @@ static int cpu_get(struct context *ctx, unsigned long offset, u32 *v)
 	int err;
 
 	i915_gem_object_lock(ctx->obj, NULL);
-	err = i915_gem_object_prepare_read(ctx->obj, &needs_clflush);
+	err = i915_gem_object_prepare_read(ctx->obj, NULL, &needs_clflush);
 	if (err)
 		goto out;
 
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
index ce70d0a3afb2..fa1ae414348b 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
@@ -462,7 +462,7 @@ static int cpu_fill(struct drm_i915_gem_object *obj, u32 value)
 	int err;
 
 	i915_gem_object_lock(obj, NULL);
-	err = i915_gem_object_prepare_write(obj, &need_flush);
+	err = i915_gem_object_prepare_write(obj, NULL, &need_flush);
 	if (err)
 		goto out;
 
@@ -492,7 +492,7 @@ static noinline int cpu_check(struct drm_i915_gem_object *obj,
 	int err;
 
 	i915_gem_object_lock(obj, NULL);
-	err = i915_gem_object_prepare_read(obj, &needs_flush);
+	err = i915_gem_object_prepare_read(obj, NULL, &needs_flush);
 	if (err)
 		goto out_unlock;
 
diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
index 07da6a9342e3..3ab9a79baf34 100644
--- a/drivers/gpu/drm/i915/i915_gem.c
+++ b/drivers/gpu/drm/i915/i915_gem.c
@@ -227,7 +227,7 @@ i915_gem_shmem_pread(struct drm_i915_gem_object *obj,
 	if (ret)
 		goto err_unlock;
 
-	ret = i915_gem_object_prepare_read(obj, &needs_clflush);
+	ret = i915_gem_object_prepare_read(obj, NULL, &needs_clflush);
 	if (ret)
 		goto err_unpin;
 
@@ -658,7 +658,7 @@ i915_gem_shmem_pwrite(struct drm_i915_gem_object *obj,
 	if (ret)
 		goto err_unlock;
 
-	ret = i915_gem_object_prepare_write(obj, &needs_clflush);
+	ret = i915_gem_object_prepare_write(obj, NULL, &needs_clflush);
 	if (ret)
 		goto err_unpin;
 
-- 
2.31.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
