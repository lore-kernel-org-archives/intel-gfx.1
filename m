Return-Path: <SRS0=x+Hj=G4=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A22CC433E6
	for <intel-gfx@archiver.kernel.org>; Mon, 25 Jan 2021 14:18:16 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64EB322C9E
	for <intel-gfx@archiver.kernel.org>; Mon, 25 Jan 2021 14:18:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64EB322C9E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17CCD6E1BA;
	Mon, 25 Jan 2021 14:18:14 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F31146E1A7
 for <intel-gfx@lists.freedesktop.org>; Mon, 25 Jan 2021 14:18:12 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from build.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 23693937-1500050 
 for multiple; Mon, 25 Jan 2021 14:18:02 +0000
From: Chris Wilson <chris@chris-wilson.co.uk>
To: intel-gfx@lists.freedesktop.org
Date: Mon, 25 Jan 2021 14:17:56 +0000
Message-Id: <20210125141803.14378-1-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 1/8] drm/i915/selftests: Set cache status for
 huge_gem_object
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

Set the cache coherency and status using the set-coherency helper.
Otherwise, we forget to mark the new pages as cache dirty.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 drivers/gpu/drm/i915/gem/selftests/huge_pages.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
index aacf4856ccb4..f6329e462cfc 100644
--- a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
+++ b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
@@ -171,10 +171,8 @@ huge_pages_object(struct drm_i915_private *i915,
 	i915_gem_object_init(obj, &huge_page_ops, &lock_class);
 
 	i915_gem_object_set_volatile(obj);
-
-	obj->write_domain = I915_GEM_DOMAIN_CPU;
-	obj->read_domains = I915_GEM_DOMAIN_CPU;
-	obj->cache_level = I915_CACHE_NONE;
+	i915_gem_object_set_cache_coherency(obj, I915_CACHE_NONE);
+	__start_cpu_write(obj);
 
 	obj->mm.page_mask = page_mask;
 
@@ -324,10 +322,8 @@ fake_huge_pages_object(struct drm_i915_private *i915, u64 size, bool single)
 		i915_gem_object_init(obj, &fake_ops, &lock_class);
 
 	i915_gem_object_set_volatile(obj);
-
-	obj->write_domain = I915_GEM_DOMAIN_CPU;
-	obj->read_domains = I915_GEM_DOMAIN_CPU;
-	obj->cache_level = I915_CACHE_NONE;
+	i915_gem_object_set_cache_coherency(obj, I915_CACHE_NONE);
+	__start_cpu_write(obj);
 
 	return obj;
 }
@@ -994,7 +990,7 @@ __cpu_check_shmem(struct drm_i915_gem_object *obj, u32 dword, u32 val)
 		u32 *ptr = kmap_atomic(i915_gem_object_get_page(obj, n));
 
 		if (needs_flush & CLFLUSH_BEFORE)
-			drm_clflush_virt_range(ptr, PAGE_SIZE);
+			drm_clflush_virt_range(&ptr[dword], sizeof(val));
 
 		if (ptr[dword] != val) {
 			pr_err("n=%lu ptr[%u]=%u, val=%u\n",
-- 
2.20.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
