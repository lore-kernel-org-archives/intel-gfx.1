Return-Path: <SRS0=FeUR=OL=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A380DC433EF
	for <intel-gfx@archiver.kernel.org>; Tue, 21 Sep 2021 11:01:52 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CE9560F3A
	for <intel-gfx@archiver.kernel.org>; Tue, 21 Sep 2021 11:01:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6CE9560F3A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A944B6E93B;
	Tue, 21 Sep 2021 11:01:41 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78DD26E94C;
 Tue, 21 Sep 2021 11:01:38 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10113"; a="284344127"
X-IronPort-AV: E=Sophos;i="5.85,311,1624345200"; d="scan'208";a="284344127"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2021 04:01:38 -0700
X-IronPort-AV: E=Sophos;i="5.85,311,1624345200"; d="scan'208";a="484141771"
Received: from agallagh-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.17.108])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2021 04:01:36 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Date: Tue, 21 Sep 2021 12:01:10 +0100
Message-Id: <20210921110121.3783395-3-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210921110121.3783395-1-matthew.auld@intel.com>
References: <20210921110121.3783395-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH v4 03/14] drm/ttm: move ttm_tt_{add,
 clear}_mapping into amdgpu
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

Now that setting page->index shouldn't be needed anymore, we are just
left with setting page->mapping, and here it looks like amdgpu is the
only user, where pointing the page->mapping at the dev_mapping is used
to verify that the pages do indeed belong to the device, if userspace
later tries to touch them.

v2(Christian):
  - Drop the functions altogether and just inline modifying
    the page->mapping

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 15 ++++++++++++++-
 drivers/gpu/drm/ttm/ttm_tt.c            | 25 -------------------------
 2 files changed, 14 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 820fcb24231f..438377a89aa3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1119,6 +1119,8 @@ static int amdgpu_ttm_tt_populate(struct ttm_device *bdev,
 {
 	struct amdgpu_device *adev = amdgpu_ttm_adev(bdev);
 	struct amdgpu_ttm_tt *gtt = (void *)ttm;
+	pgoff_t i;
+	int ret;
 
 	/* user pages are bound by amdgpu_ttm_tt_pin_userptr() */
 	if (gtt->userptr) {
@@ -1131,7 +1133,14 @@ static int amdgpu_ttm_tt_populate(struct ttm_device *bdev,
 	if (ttm->page_flags & TTM_PAGE_FLAG_SG)
 		return 0;
 
-	return ttm_pool_alloc(&adev->mman.bdev.pool, ttm, ctx);
+	ret = ttm_pool_alloc(&adev->mman.bdev.pool, ttm, ctx);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < ttm->num_pages; ++i)
+		ttm->pages[i]->mapping = bdev->dev_mapping;
+
+	return 0;
 }
 
 /*
@@ -1145,6 +1154,7 @@ static void amdgpu_ttm_tt_unpopulate(struct ttm_device *bdev,
 {
 	struct amdgpu_ttm_tt *gtt = (void *)ttm;
 	struct amdgpu_device *adev;
+	pgoff_t i;
 
 	amdgpu_ttm_backend_unbind(bdev, ttm);
 
@@ -1158,6 +1168,9 @@ static void amdgpu_ttm_tt_unpopulate(struct ttm_device *bdev,
 	if (ttm->page_flags & TTM_PAGE_FLAG_SG)
 		return;
 
+	for (i = 0; i < ttm->num_pages; ++i)
+		ttm->pages[i]->mapping = NULL;
+
 	adev = amdgpu_ttm_adev(bdev);
 	return ttm_pool_free(&adev->mman.bdev.pool, ttm);
 }
diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index 1cc04c224988..980ecb079b2c 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -289,17 +289,6 @@ int ttm_tt_swapout(struct ttm_device *bdev, struct ttm_tt *ttm,
 	return ret;
 }
 
-static void ttm_tt_add_mapping(struct ttm_device *bdev, struct ttm_tt *ttm)
-{
-	pgoff_t i;
-
-	if (ttm->page_flags & TTM_PAGE_FLAG_SG)
-		return;
-
-	for (i = 0; i < ttm->num_pages; ++i)
-		ttm->pages[i]->mapping = bdev->dev_mapping;
-}
-
 int ttm_tt_populate(struct ttm_device *bdev,
 		    struct ttm_tt *ttm, struct ttm_operation_ctx *ctx)
 {
@@ -336,7 +325,6 @@ int ttm_tt_populate(struct ttm_device *bdev,
 	if (ret)
 		goto error;
 
-	ttm_tt_add_mapping(bdev, ttm);
 	ttm->page_flags |= TTM_PAGE_FLAG_PRIV_POPULATED;
 	if (unlikely(ttm->page_flags & TTM_PAGE_FLAG_SWAPPED)) {
 		ret = ttm_tt_swapin(ttm);
@@ -359,24 +347,11 @@ int ttm_tt_populate(struct ttm_device *bdev,
 }
 EXPORT_SYMBOL(ttm_tt_populate);
 
-static void ttm_tt_clear_mapping(struct ttm_tt *ttm)
-{
-	pgoff_t i;
-	struct page **page = ttm->pages;
-
-	if (ttm->page_flags & TTM_PAGE_FLAG_SG)
-		return;
-
-	for (i = 0; i < ttm->num_pages; ++i)
-		(*page)->mapping = NULL;
-}
-
 void ttm_tt_unpopulate(struct ttm_device *bdev, struct ttm_tt *ttm)
 {
 	if (!ttm_tt_is_populated(ttm))
 		return;
 
-	ttm_tt_clear_mapping(ttm);
 	if (bdev->funcs->ttm_tt_unpopulate)
 		bdev->funcs->ttm_tt_unpopulate(bdev, ttm);
 	else
-- 
2.26.3

