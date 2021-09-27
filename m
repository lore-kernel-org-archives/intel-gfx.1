Return-Path: <SRS0=KOmL=OR=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 137B1C433FE
	for <intel-gfx@archiver.kernel.org>; Mon, 27 Sep 2021 11:42:35 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CBF0960F4B
	for <intel-gfx@archiver.kernel.org>; Mon, 27 Sep 2021 11:42:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CBF0960F4B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 910A789FBC;
	Mon, 27 Sep 2021 11:42:08 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31B1089EAC;
 Mon, 27 Sep 2021 11:42:05 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10119"; a="204610588"
X-IronPort-AV: E=Sophos;i="5.85,326,1624345200"; d="scan'208";a="204610588"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2021 04:42:04 -0700
X-IronPort-AV: E=Sophos;i="5.85,326,1624345200"; d="scan'208";a="553158952"
Received: from ajhome-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.19.222])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2021 04:42:01 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Date: Mon, 27 Sep 2021 12:41:02 +0100
Message-Id: <20210927114114.152310-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH v5 01/13] drm/ttm: stop calling tt_swapin in
 vm_access
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

In commit:

commit 09ac4fcb3f255e9225967c75f5893325c116cdbe
Author: Felix Kuehling <Felix.Kuehling@amd.com>
Date:   Thu Jul 13 17:01:16 2017 -0400

    drm/ttm: Implement vm_operations_struct.access v2

we added the vm_access hook, where we also directly call tt_swapin for
some reason. If something is swapped-out then the ttm_tt must also be
unpopulated, and since access_kmap should also call tt_populate, if
needed, then swapping-in will already be handled there.

If anything, calling tt_swapin directly here would likely always fail
since the tt->pages won't yet be populated, or worse since the tt->pages
array is never actually cleared in unpopulate this might lead to a nasty
uaf.

Fixes: 09ac4fcb3f25 ("drm/ttm: Implement vm_operations_struct.access v2")
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Christian König <christian.koenig@amd.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo_vm.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
index f56be5bc0861..5b9b7fd01a69 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
@@ -519,11 +519,6 @@ int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
 
 	switch (bo->resource->mem_type) {
 	case TTM_PL_SYSTEM:
-		if (unlikely(bo->ttm->page_flags & TTM_PAGE_FLAG_SWAPPED)) {
-			ret = ttm_tt_swapin(bo->ttm);
-			if (unlikely(ret != 0))
-				return ret;
-		}
 		fallthrough;
 	case TTM_PL_TT:
 		ret = ttm_bo_vm_access_kmap(bo, offset, buf, len, write);
-- 
2.26.3

