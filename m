Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D892CC433F5
	for <intel-gfx@archiver.kernel.org>; Mon,  3 Oct 2022 08:17:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C950310E264;
	Mon,  3 Oct 2022 08:17:34 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C12A10E262;
 Mon,  3 Oct 2022 08:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664785049; x=1696321049;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eWklP90iywxRJRhjzQbhq9/9/9nHfnEv7QZ000lTFwA=;
 b=cb0eIYoPKvmtZoTCFqAYX617gRBG2N+Lp7aQDf/MBzN7saqfGGp4C1Xt
 NTYoP2K/fQUguWWibL97D65LMIhv25sd+BrzF4ubs9O2EeBLzsJ1B0+IT
 +58z66hG+4QR9LLdsvOxDIWjbsQLLnbw2axZdtWMFlHhJCOxvmZpFxo2y
 EbtvrcbtLVTTzExXSEAm/ihvdR7GVRPBR1t+qSn8EE4BFbe1PX1y9lpIh
 1mavXmmaY5IdO4MwAEYn9ArpxCt/4TiDeaZ2vZfSFQKbYUURi8dyUXL/K
 1U/+kU9Z+FLL/WDapVCLZ3+gdwb7oHrbSUfpWGe5s9M0LRNEX9RYqFjBG Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10488"; a="301298104"
X-IronPort-AV: E=Sophos;i="5.93,364,1654585200"; d="scan'208";a="301298104"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2022 01:17:28 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10488"; a="952253379"
X-IronPort-AV: E=Sophos;i="5.93,364,1654585200"; d="scan'208";a="952253379"
Received: from adejeanb-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.6.198])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2022 01:17:27 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Mon,  3 Oct 2022 09:17:15 +0100
Message-Id: <20221003081715.20649-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH] drm/ttm: fix bo->resource check in vm_access
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Touching bo->resource looks like it should require first locking the
object, since this state is dynamic and could potentially change from
under us. It looks we can just use obj->base.size here, which avoids any
issues with locking, since this is immutable state.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Christian König <christian.koenig@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo_vm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
index 38119311284d..e0f73f0ac086 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
@@ -412,7 +412,7 @@ int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
 		 << PAGE_SHIFT);
 	int ret;
 
-	if (len < 1 || (offset + len) >> PAGE_SHIFT > bo->resource->num_pages)
+	if (len < 1 || (offset + len) > bo->base.size)
 		return -EIO;
 
 	ret = ttm_bo_reserve(bo, true, false, NULL);
-- 
2.37.3

