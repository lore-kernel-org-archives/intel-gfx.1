Return-Path: <SRS0=HRyj=KW=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2867DC4707F
	for <intel-gfx@archiver.kernel.org>; Thu, 27 May 2021 09:56:08 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0D6A60249
	for <intel-gfx@archiver.kernel.org>; Thu, 27 May 2021 09:56:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E0D6A60249
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E0236E207;
	Thu, 27 May 2021 09:56:07 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA3576E207
 for <intel-gfx@lists.freedesktop.org>; Thu, 27 May 2021 09:56:05 +0000 (UTC)
IronPort-SDR: 2zon+rSAfhE6nDBlE7PyDhbiP03l9Wib0Xros5fN4TOSvV2VjtDlgVrwHS30rCI6aPPWgX2upM
 nkf4GRR6K8YA==
X-IronPort-AV: E=McAfee;i="6200,9189,9996"; a="189814485"
X-IronPort-AV: E=Sophos;i="5.82,334,1613462400"; d="scan'208";a="189814485"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2021 02:56:03 -0700
IronPort-SDR: LAOD+JFUK8rNSxR4ST3obeipb9zeSevdmrwfIQ59kskq8KQXnYdV5WHFtsD0o2x3bF8U+BuD+T
 egSqcSt2mVdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,334,1613462400"; d="scan'208";a="472449453"
Received: from kbommu-nuc8i7beh.iind.intel.com ([10.145.162.97])
 by FMSMGA003.fm.intel.com with ESMTP; 27 May 2021 02:56:01 -0700
From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Thu, 27 May 2021 15:15:35 +0530
Message-Id: <20210527094535.31728-2-krishnaiah.bommu@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210527094535.31728-1-krishnaiah.bommu@intel.com>
References: <20210527094535.31728-1-krishnaiah.bommu@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 1/1] drm: add error message for ENOSPC
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
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 Nayana Venkata Ramana <Venkata.Ramana.Nayana@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

add error message for ENOSPC, this will help developer to understand issue.

Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Cc: Yang Shi <yang.a.shi@intel.com>
Cc: Nayana Venkata Ramana <Venkata.Ramana.Nayana@intel.com>
---
 drivers/gpu/drm/drm_mm.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_mm.c b/drivers/gpu/drm/drm_mm.c
index a4a04d246135..696b59673a84 100644
--- a/drivers/gpu/drm/drm_mm.c
+++ b/drivers/gpu/drm/drm_mm.c
@@ -458,13 +458,18 @@ int drm_mm_reserve_node(struct drm_mm *mm, struct drm_mm_node *node)
 	u64 end;
 
 	end = node->start + node->size;
-	if (unlikely(end <= node->start))
+	if (unlikely(end <= node->start)) {
+		DRM_DEBUG("ENOSPC with incorrect node->size %llx\n", node->size);
 		return -ENOSPC;
+	}
 
 	/* Find the relevant hole to add our node to */
 	hole = find_hole_addr(mm, node->start, 0);
-	if (!hole)
+	if (!hole) {
+		DRM_DEBUG("ENOSPC when not find hole with node->start %llx\n",
+			  node->start);
 		return -ENOSPC;
+	}
 
 	adj_start = hole_start = __drm_mm_hole_node_start(hole);
 	adj_end = hole_end = hole_start + hole->hole_size;
@@ -472,8 +477,11 @@ int drm_mm_reserve_node(struct drm_mm *mm, struct drm_mm_node *node)
 	if (mm->color_adjust)
 		mm->color_adjust(hole, node->color, &adj_start, &adj_end);
 
-	if (adj_start > node->start || adj_end < end)
+	if (adj_start > node->start || adj_end < end) {
+		DRM_DEBUG("ENOSPC after adjust adj_start:%llx adj_end:%llx node->start:%llx end:%llx\n",
+			  adj_start, adj_end, node->start, end);
 		return -ENOSPC;
+	}
 
 	node->mm = mm;
 
-- 
2.25.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
