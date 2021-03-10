Return-Path: <SRS0=3135=II=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56E79C433DB
	for <intel-gfx@archiver.kernel.org>; Wed, 10 Mar 2021 22:18:07 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23E5164FC3
	for <intel-gfx@archiver.kernel.org>; Wed, 10 Mar 2021 22:18:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 23E5164FC3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A17DD6EA8A;
	Wed, 10 Mar 2021 22:18:06 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDF4A6EA7F
 for <intel-gfx@lists.freedesktop.org>; Wed, 10 Mar 2021 22:17:58 +0000 (UTC)
IronPort-SDR: eLH4kcMH7oJuspo6UmNgvnMbC2KbYb8NW20j/R0rqNGyQKCLFB4gk26oSpcIFK97DwvKgIlhtj
 l03INEtxS/JQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9919"; a="252592101"
X-IronPort-AV: E=Sophos;i="5.81,238,1610438400"; d="scan'208";a="252592101"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2021 14:17:58 -0800
IronPort-SDR: FHcLtUCOZineJbaq5fWKki3q7MdnRrbsCRq9SeXx8xPQOuCqAp1HSs7XrbTSmj9sbQApc6pb9a
 yrFTnka6cCOQ==
X-IronPort-AV: E=Sophos;i="5.81,238,1610438400"; d="scan'208";a="403852292"
Received: from ideak-desk.fi.intel.com ([10.237.68.141])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2021 14:17:57 -0800
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Thu, 11 Mar 2021 00:17:32 +0200
Message-Id: <20210310221736.2963264-20-imre.deak@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210310221736.2963264-1-imre.deak@intel.com>
References: <20210310221736.2963264-1-imre.deak@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 19/23] drm/i915/selftest: Unify use of
 intel_remapped_plane_info in igt_vma_rotate_remap()
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

Always use the modified copy of the intel_remapped_plane_info variables.
An upcoming patch updates the dst_stride field in these copies after
which we can't use the original versions.

Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/i915/selftests/i915_vma.c | 61 ++++++++++++-----------
 1 file changed, 33 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/i915/selftests/i915_vma.c b/drivers/gpu/drm/i915/selftests/i915_vma.c
index 3d557b8a2098..86c590b4522c 100644
--- a/drivers/gpu/drm/i915/selftests/i915_vma.c
+++ b/drivers/gpu/drm/i915/selftests/i915_vma.c
@@ -516,21 +516,23 @@ static int igt_vma_rotate_remap(void *arg)
 	for (a = planes; a->width; a++) {
 		for (b = planes + ARRAY_SIZE(planes); b-- != planes; ) {
 			struct i915_ggtt_view view = { };
+			struct intel_remapped_plane_info *plane_info = view.rotated.plane;
 			unsigned int n, max_offset;
 
-			max_offset = max(a->stride * a->height,
-					 b->stride * b->height);
+			view.type = *t;
+			plane_info[0] = *a;
+			plane_info[1] = *b;
+
+			max_offset = max(plane_info[0].stride * plane_info[0].height,
+					 plane_info[1].stride * plane_info[1].height);
 			GEM_BUG_ON(max_offset > max_pages);
 			max_offset = max_pages - max_offset;
 
-			view.type = *t;
-			view.rotated.plane[0] = *a;
-			view.rotated.plane[1] = *b;
-
-			for_each_prime_number_from(view.rotated.plane[0].offset, 0, max_offset) {
-				for_each_prime_number_from(view.rotated.plane[1].offset, 0, max_offset) {
+			for_each_prime_number_from(plane_info[0].offset, 0, max_offset) {
+				for_each_prime_number_from(plane_info[1].offset, 0, max_offset) {
 					struct scatterlist *sg;
 					struct i915_vma *vma;
+					unsigned int expected_pages;
 
 					vma = checked_vma_instance(obj, vm, &view);
 					if (IS_ERR(vma)) {
@@ -544,25 +546,27 @@ static int igt_vma_rotate_remap(void *arg)
 						goto out_object;
 					}
 
+					expected_pages = rotated_size(&plane_info[0], &plane_info[1]);
+
 					if (view.type == I915_GGTT_VIEW_ROTATED &&
-					    vma->size != rotated_size(a, b) * PAGE_SIZE) {
+					    vma->size != expected_pages * PAGE_SIZE) {
 						pr_err("VMA is wrong size, expected %lu, found %llu\n",
-						       PAGE_SIZE * rotated_size(a, b), vma->size);
+						       PAGE_SIZE * expected_pages, vma->size);
 						err = -EINVAL;
 						goto out_object;
 					}
 
 					if (view.type == I915_GGTT_VIEW_REMAPPED &&
-					    vma->size > rotated_size(a, b) * PAGE_SIZE) {
+					    vma->size > expected_pages * PAGE_SIZE) {
 						pr_err("VMA is wrong size, expected %lu, found %llu\n",
-						       PAGE_SIZE * rotated_size(a, b), vma->size);
+						       PAGE_SIZE * expected_pages, vma->size);
 						err = -EINVAL;
 						goto out_object;
 					}
 
-					if (vma->pages->nents > rotated_size(a, b)) {
+					if (vma->pages->nents > expected_pages) {
 						pr_err("sg table is wrong sizeo, expected %u, found %u nents\n",
-						       rotated_size(a, b), vma->pages->nents);
+						       expected_pages, vma->pages->nents);
 						err = -EINVAL;
 						goto out_object;
 					}
@@ -590,14 +594,14 @@ static int igt_vma_rotate_remap(void *arg)
 							pr_err("Inconsistent %s VMA pages for plane %d: [(%d, %d, %d, %d), (%d, %d, %d, %d)]\n",
 							       view.type == I915_GGTT_VIEW_ROTATED ?
 							       "rotated" : "remapped", n,
-							       view.rotated.plane[0].width,
-							       view.rotated.plane[0].height,
-							       view.rotated.plane[0].stride,
-							       view.rotated.plane[0].offset,
-							       view.rotated.plane[1].width,
-							       view.rotated.plane[1].height,
-							       view.rotated.plane[1].stride,
-							       view.rotated.plane[1].offset);
+							       plane_info[0].width,
+							       plane_info[0].height,
+							       plane_info[0].stride,
+							       plane_info[0].offset,
+							       plane_info[1].width,
+							       plane_info[1].height,
+							       plane_info[1].stride,
+							       plane_info[1].offset);
 							err = -EINVAL;
 							goto out_object;
 						}
@@ -887,6 +891,7 @@ static int igt_vma_remapped_gtt(void *arg)
 				.type = *t,
 				.rotated.plane[0] = *p,
 			};
+			struct intel_remapped_plane_info *plane_info = view.rotated.plane;
 			struct i915_vma *vma;
 			u32 __iomem *map;
 			unsigned int x, y;
@@ -906,15 +911,15 @@ static int igt_vma_remapped_gtt(void *arg)
 				goto out;
 			}
 
-			for (y = 0 ; y < p->height; y++) {
-				for (x = 0 ; x < p->width; x++) {
+			for (y = 0 ; y < plane_info[0].height; y++) {
+				for (x = 0 ; x < plane_info[0].width; x++) {
 					unsigned int offset;
 					u32 val = y << 16 | x;
 
 					if (*t == I915_GGTT_VIEW_ROTATED)
-						offset = (x * p->height + y) * PAGE_SIZE;
+						offset = (x * plane_info[0].height + y) * PAGE_SIZE;
 					else
-						offset = (y * p->width + x) * PAGE_SIZE;
+						offset = (y * plane_info[0].width + x) * PAGE_SIZE;
 
 					iowrite32(val, &map[offset / sizeof(*map)]);
 				}
@@ -937,8 +942,8 @@ static int igt_vma_remapped_gtt(void *arg)
 				goto out;
 			}
 
-			for (y = 0 ; y < p->height; y++) {
-				for (x = 0 ; x < p->width; x++) {
+			for (y = 0 ; y < plane_info[0].height; y++) {
+				for (x = 0 ; x < plane_info[0].width; x++) {
 					unsigned int offset, src_idx;
 					u32 exp = y << 16 | x;
 					u32 val;
-- 
2.25.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
