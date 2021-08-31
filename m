Return-Path: <SRS0=BQmx=NW=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5F89C432BE
	for <intel-gfx@archiver.kernel.org>; Tue, 31 Aug 2021 07:15:57 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 525F5601FF
	for <intel-gfx@archiver.kernel.org>; Tue, 31 Aug 2021 07:15:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 525F5601FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D639389B30;
	Tue, 31 Aug 2021 07:15:56 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5C1589B30;
 Tue, 31 Aug 2021 07:15:55 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10092"; a="240667277"
X-IronPort-AV: E=Sophos;i="5.84,365,1620716400"; d="scan'208";a="240667277"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 00:15:55 -0700
X-IronPort-AV: E=Sophos;i="5.84,365,1620716400"; d="scan'208";a="577033490"
Received: from eanderse-mobl.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.201])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 00:15:52 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Ben Skeggs <skeggsb@gmail.com>, Dave Airlie <airlied@gmail.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>
Date: Tue, 31 Aug 2021 09:15:36 +0200
Message-Id: <20210831071536.80636-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH v2] drm/ttm: Fix ttm_bo_move_memcpy() for
 subclassed struct ttm_resource
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

The code was making a copy of a struct ttm_resource. However,
recently the struct ttm_resources were allowed to be subclassed and
also were allowed to be malloced, hence the driver could end up assuming
the copy we handed it was subclassed and worse, the original could have
been freed at this point.

Fix this by using the original struct ttm_resource before it is
potentially freed in ttm_bo_move_sync_cleanup()

v2: Base on drm-misc-next-fixes rather than drm-tip.

Reported-by: Ben Skeggs <skeggsb@gmail.com>
Reported-by: Dave Airlie <airlied@gmail.com>
Cc: Christian König <christian.koenig@amd.com>
Fixes: 3bf3710e3718 ("drm/ttm: Add a generic TTM memcpy move for page-based iomem")
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Ben Skeggs <bskeggs@redhat.com>
---
 drivers/gpu/drm/ttm/ttm_bo_util.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 763fa6f4e07d..1c5ffe2935af 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -143,7 +143,6 @@ int ttm_bo_move_memcpy(struct ttm_buffer_object *bo,
 	struct ttm_resource *src_mem = bo->resource;
 	struct ttm_resource_manager *src_man =
 		ttm_manager_type(bdev, src_mem->mem_type);
-	struct ttm_resource src_copy = *src_mem;
 	union {
 		struct ttm_kmap_iter_tt tt;
 		struct ttm_kmap_iter_linear_io io;
@@ -173,11 +172,11 @@ int ttm_bo_move_memcpy(struct ttm_buffer_object *bo,
 	}
 
 	ttm_move_memcpy(bo, dst_mem->num_pages, dst_iter, src_iter);
-	src_copy = *src_mem;
-	ttm_bo_move_sync_cleanup(bo, dst_mem);
 
 	if (!src_iter->ops->maps_tt)
-		ttm_kmap_iter_linear_io_fini(&_src_iter.io, bdev, &src_copy);
+		ttm_kmap_iter_linear_io_fini(&_src_iter.io, bdev, src_mem);
+	ttm_bo_move_sync_cleanup(bo, dst_mem);
+
 out_src_iter:
 	if (!dst_iter->ops->maps_tt)
 		ttm_kmap_iter_linear_io_fini(&_dst_iter.io, bdev, dst_mem);
-- 
2.31.1

