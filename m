Return-Path: <SRS0=emkq=FB=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 799FCC5519F
	for <intel-gfx@archiver.kernel.org>; Fri, 27 Nov 2020 19:53:50 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1C56208B3
	for <intel-gfx@archiver.kernel.org>; Fri, 27 Nov 2020 19:53:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F1C56208B3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 672046F3A6;
	Fri, 27 Nov 2020 19:53:49 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1B6B6F3A6
 for <intel-gfx@lists.freedesktop.org>; Fri, 27 Nov 2020 19:53:47 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from build.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 23138765-1500050 
 for multiple; Fri, 27 Nov 2020 19:53:35 +0000
From: Chris Wilson <chris@chris-wilson.co.uk>
To: intel-gfx@lists.freedesktop.org
Date: Fri, 27 Nov 2020 19:53:34 +0000
Message-Id: <20201127195334.13134-1-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH] drm/i915/gem: Differentiate oom failures from
 invalid map types
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
Cc: Matthew Auld <matthew.auld@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

After a cursory check on the parameters to i915_gem_object_pin_map(),
where we return a precise error, if the backend rejects the mapping we
always return PTR_ERR(-ENOMEM). Let us also return a more precise error
here so we can differentiate between running out of memory and
programming errors (or situations where we may be trying different paths
and looking for an error from an unsupported map).

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_pages.c | 26 +++++++++++------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pages.c b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
index e2c7b2a7895f..6dad9ea8eaa3 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_pages.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
@@ -238,7 +238,7 @@ int __i915_gem_object_put_pages(struct drm_i915_gem_object *obj)
 
 /* The 'mapping' part of i915_gem_object_pin_map() below */
 static void *i915_gem_object_map_page(struct drm_i915_gem_object *obj,
-		enum i915_map_type type)
+				      enum i915_map_type type)
 {
 	unsigned long n_pages = obj->base.size >> PAGE_SHIFT, i;
 	struct page *stack[32], **pages = stack, *page;
@@ -281,7 +281,7 @@ static void *i915_gem_object_map_page(struct drm_i915_gem_object *obj,
 		/* Too big for stack -- allocate temporary array instead */
 		pages = kvmalloc_array(n_pages, sizeof(*pages), GFP_KERNEL);
 		if (!pages)
-			return NULL;
+			return ERR_PTR(-ENOMEM);
 	}
 
 	i = 0;
@@ -294,7 +294,7 @@ static void *i915_gem_object_map_page(struct drm_i915_gem_object *obj,
 }
 
 static void *i915_gem_object_map_pfn(struct drm_i915_gem_object *obj,
-		enum i915_map_type type)
+				     enum i915_map_type type)
 {
 	resource_size_t iomap = obj->mm.region->iomap.base -
 		obj->mm.region->region.start;
@@ -305,13 +305,13 @@ static void *i915_gem_object_map_pfn(struct drm_i915_gem_object *obj,
 	void *vaddr;
 
 	if (type != I915_MAP_WC)
-		return NULL;
+		return ERR_PTR(-ENODEV);
 
 	if (n_pfn > ARRAY_SIZE(stack)) {
 		/* Too big for stack -- allocate temporary array instead */
 		pfns = kvmalloc_array(n_pfn, sizeof(*pfns), GFP_KERNEL);
 		if (!pfns)
-			return NULL;
+			return ERR_PTR(-ENOMEM);
 	}
 
 	i = 0;
@@ -349,8 +349,10 @@ void *i915_gem_object_pin_map(struct drm_i915_gem_object *obj,
 			GEM_BUG_ON(i915_gem_object_has_pinned_pages(obj));
 
 			err = ____i915_gem_object_get_pages(obj);
-			if (err)
-				goto err_unlock;
+			if (err) {
+				ptr = ERR_PTR(err);
+				goto out_unlock;
+			}
 
 			smp_mb__before_atomic();
 		}
@@ -362,7 +364,7 @@ void *i915_gem_object_pin_map(struct drm_i915_gem_object *obj,
 	ptr = page_unpack_bits(obj->mm.mapping, &has_type);
 	if (ptr && has_type != type) {
 		if (pinned) {
-			err = -EBUSY;
+			ptr = ERR_PTR(-EBUSY);
 			goto err_unpin;
 		}
 
@@ -374,15 +376,13 @@ void *i915_gem_object_pin_map(struct drm_i915_gem_object *obj,
 	if (!ptr) {
 		if (GEM_WARN_ON(type == I915_MAP_WC &&
 				!static_cpu_has(X86_FEATURE_PAT)))
-			ptr = NULL;
+			ptr = ERR_PTR(-ENODEV);
 		else if (i915_gem_object_has_struct_page(obj))
 			ptr = i915_gem_object_map_page(obj, type);
 		else
 			ptr = i915_gem_object_map_pfn(obj, type);
-		if (!ptr) {
-			err = -ENOMEM;
+		if (IS_ERR(ptr))
 			goto err_unpin;
-		}
 
 		obj->mm.mapping = page_pack_bits(ptr, type);
 	}
@@ -393,8 +393,6 @@ void *i915_gem_object_pin_map(struct drm_i915_gem_object *obj,
 
 err_unpin:
 	atomic_dec(&obj->mm.pages_pin_count);
-err_unlock:
-	ptr = ERR_PTR(err);
 	goto out_unlock;
 }
 
-- 
2.20.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
