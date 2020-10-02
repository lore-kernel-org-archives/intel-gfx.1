Return-Path: <SRS0=5YwX=DJ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43E3CC4742D
	for <intel-gfx@archiver.kernel.org>; Fri,  2 Oct 2020 13:00:23 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07024206DC
	for <intel-gfx@archiver.kernel.org>; Fri,  2 Oct 2020 13:00:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 07024206DC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EFFB6E96E;
	Fri,  2 Oct 2020 12:59:58 +0000 (UTC)
Received: from mblankhorst.nl (mblankhorst.nl [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9124C6E95F
 for <intel-gfx@lists.freedesktop.org>; Fri,  2 Oct 2020 12:59:50 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Fri,  2 Oct 2020 14:59:24 +0200
Message-Id: <20201002125939.50817-47-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201002125939.50817-1-maarten.lankhorst@linux.intel.com>
References: <20201002125939.50817-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 46/61] drm/i915/selftests: Prepare mman
 testcases for obj->mm.lock removal.
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

Ensure we hold the lock around put_pages, and use the unlocked wrappers
for pinning pages and mappings.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
index 3ac7628f3bc4..85fff8bed08c 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
@@ -321,7 +321,7 @@ static int igt_partial_tiling(void *arg)
 	if (IS_ERR(obj))
 		return PTR_ERR(obj);
 
-	err = i915_gem_object_pin_pages(obj);
+	err = i915_gem_object_pin_pages_unlocked(obj);
 	if (err) {
 		pr_err("Failed to allocate %u pages (%lu total), err=%d\n",
 		       nreal, obj->base.size / PAGE_SIZE, err);
@@ -458,7 +458,7 @@ static int igt_smoke_tiling(void *arg)
 	if (IS_ERR(obj))
 		return PTR_ERR(obj);
 
-	err = i915_gem_object_pin_pages(obj);
+	err = i915_gem_object_pin_pages_unlocked(obj);
 	if (err) {
 		pr_err("Failed to allocate %u pages (%lu total), err=%d\n",
 		       nreal, obj->base.size / PAGE_SIZE, err);
@@ -797,7 +797,7 @@ static int wc_set(struct drm_i915_gem_object *obj)
 {
 	void *vaddr;
 
-	vaddr = i915_gem_object_pin_map(obj, I915_MAP_WC);
+	vaddr = i915_gem_object_pin_map_unlocked(obj, I915_MAP_WC);
 	if (IS_ERR(vaddr))
 		return PTR_ERR(vaddr);
 
@@ -813,7 +813,7 @@ static int wc_check(struct drm_i915_gem_object *obj)
 	void *vaddr;
 	int err = 0;
 
-	vaddr = i915_gem_object_pin_map(obj, I915_MAP_WC);
+	vaddr = i915_gem_object_pin_map_unlocked(obj, I915_MAP_WC);
 	if (IS_ERR(vaddr))
 		return PTR_ERR(vaddr);
 
@@ -1315,7 +1315,9 @@ static int __igt_mmap_revoke(struct drm_i915_private *i915,
 	}
 
 	if (type != I915_MMAP_TYPE_GTT) {
+		i915_gem_object_lock(obj, NULL);
 		__i915_gem_object_put_pages(obj);
+		i915_gem_object_unlock(obj);
 		if (i915_gem_object_has_pages(obj)) {
 			pr_err("Failed to put-pages object!\n");
 			err = -EINVAL;
-- 
2.28.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
