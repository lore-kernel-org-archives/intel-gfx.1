Return-Path: <SRS0=oPCP=QD=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 701DAC433F5
	for <intel-gfx@archiver.kernel.org>; Tue, 16 Nov 2021 01:46:34 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D63B61265
	for <intel-gfx@archiver.kernel.org>; Tue, 16 Nov 2021 01:46:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2D63B61265
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87E786E808;
	Tue, 16 Nov 2021 01:46:33 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE0EB6E436
 for <intel-gfx@lists.freedesktop.org>; Tue, 16 Nov 2021 01:46:31 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10169"; a="232321369"
X-IronPort-AV: E=Sophos;i="5.87,237,1631602800"; d="scan'208";a="232321369"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 17:46:31 -0800
X-IronPort-AV: E=Sophos;i="5.87,237,1631602800"; d="scan'208";a="506199440"
Received: from hchegond-ivm1.jf.intel.com ([10.54.81.90])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 17:46:30 -0800
From: Harish Chegondi <harish.chegondi@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Mon, 15 Nov 2021 17:46:23 -0800
Message-Id: <20211116014623.633687-1-harish.chegondi@intel.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH] drm/i915: Add checks to prevent NULL pointer
 dereference
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
Cc: thomas.hellstrom@linux.intel.com, matthew.auld@intel.com
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

__sg_next() returns NULL if the input sg entry is the last entry in the
list. Check the return pointer from __sg_next() to prevent NULL pointer
dereference.

Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
---
 drivers/gpu/drm/i915/i915_scatterlist.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_scatterlist.c b/drivers/gpu/drm/i915/i915_scatterlist.c
index 41f2adb6a583..da9322c5d5f7 100644
--- a/drivers/gpu/drm/i915/i915_scatterlist.c
+++ b/drivers/gpu/drm/i915/i915_scatterlist.c
@@ -112,6 +112,11 @@ struct i915_refct_sgt *i915_rsgt_from_mm_node(const struct drm_mm_node *node,
 			if (st->nents)
 				sg = __sg_next(sg);
 
+			if (!sg) {
+				sg_free_table(st);
+				i915_refct_sgt_put(rsgt);
+				return ERR_PTR(-EFAULT);
+			}
 			sg_dma_address(sg) = region_start + offset;
 			sg_dma_len(sg) = 0;
 			sg->length = 0;
@@ -191,6 +196,11 @@ struct i915_refct_sgt *i915_rsgt_from_buddy_resource(struct ttm_resource *res,
 				if (st->nents)
 					sg = __sg_next(sg);
 
+				if (!sg) {
+					sg_free_table(st);
+					i915_refct_sgt_put(rsgt);
+					return ERR_PTR(-EFAULT);
+				}
 				sg_dma_address(sg) = region_start + offset;
 				sg_dma_len(sg) = 0;
 				sg->length = 0;
-- 
2.31.1

