Return-Path: <SRS0=0xFZ=N4=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2305DC433F5
	for <intel-gfx@archiver.kernel.org>; Mon,  6 Sep 2021 09:17:49 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E55F860C3E
	for <intel-gfx@archiver.kernel.org>; Mon,  6 Sep 2021 09:17:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E55F860C3E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F7BF89B22;
	Mon,  6 Sep 2021 09:17:46 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65A3789AEE;
 Mon,  6 Sep 2021 09:17:44 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10098"; a="305485837"
X-IronPort-AV: E=Sophos;i="5.85,271,1624345200"; d="scan'208";a="305485837"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2021 02:17:43 -0700
X-IronPort-AV: E=Sophos;i="5.85,271,1624345200"; d="scan'208";a="536681514"
Received: from rcburbid-mobl2.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.213.240.115])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2021 02:17:42 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Mon,  6 Sep 2021 10:17:29 +0100
Message-Id: <20210906091729.2093312-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH] drm/i915/selftests: fixup igt_shrink_thp
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

Since the object might still be active here, the shrink_all will simply
ignore it, which blows up in the test, since the pages will still be
there. Currently THP is disabled which should result in the test being
skipped, but if we ever re-enable THP we might start seeing the failure.
Fix this by forcing I915_SHRINK_ACTIVE.

v2: Some machine in the shard runs doesn't seem to have any available
swap when running this test. Try to handle this.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com> #v1
---
 .../gpu/drm/i915/gem/selftests/huge_pages.c   | 31 ++++++++++++++-----
 1 file changed, 24 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
index a094f3ce1a90..46ea1997c114 100644
--- a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
+++ b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
@@ -1519,6 +1519,7 @@ static int igt_shrink_thp(void *arg)
 	struct i915_vma *vma;
 	unsigned int flags = PIN_USER;
 	unsigned int n;
+	bool should_swap;
 	int err = 0;
 
 	/*
@@ -1567,23 +1568,39 @@ static int igt_shrink_thp(void *arg)
 			break;
 	}
 	i915_gem_context_unlock_engines(ctx);
+	/*
+	 * Nuke everything *before* we unpin the pages so we can be reasonably
+	 * sure that when later checking get_nr_swap_pages() that some random
+	 * leftover object doesn't steal the remaining swap space.
+	 */
+	i915_gem_shrink(NULL, i915, -1UL, NULL,
+			I915_SHRINK_BOUND |
+			I915_SHRINK_UNBOUND |
+			I915_SHRINK_ACTIVE);
 	i915_vma_unpin(vma);
 	if (err)
 		goto out_put;
 
+
 	/*
-	 * Now that the pages are *unpinned* shrink-all should invoke
-	 * shmem to truncate our pages.
+	 * Now that the pages are *unpinned* shrinking should invoke
+	 * shmem to truncate our pages, if we have available swap.
 	 */
-	i915_gem_shrink_all(i915);
-	if (i915_gem_object_has_pages(obj)) {
-		pr_err("shrink-all didn't truncate the pages\n");
+	should_swap = get_nr_swap_pages() > 0;
+	i915_gem_shrink(NULL, i915, -1UL, NULL,
+			I915_SHRINK_BOUND |
+			I915_SHRINK_UNBOUND |
+			I915_SHRINK_ACTIVE);
+	if (should_swap == i915_gem_object_has_pages(obj)) {
+		pr_err("unexpected pages mismatch, should_swap=%s\n",
+		       yesno(should_swap));
 		err = -EINVAL;
 		goto out_put;
 	}
 
-	if (obj->mm.page_sizes.sg || obj->mm.page_sizes.phys) {
-		pr_err("residual page-size bits left\n");
+	if (should_swap == (obj->mm.page_sizes.sg || obj->mm.page_sizes.phys)) {
+		pr_err("unexpected residual page-size bits, should_swap=%s\n",
+		       yesno(should_swap));
 		err = -EINVAL;
 		goto out_put;
 	}
-- 
2.26.3

