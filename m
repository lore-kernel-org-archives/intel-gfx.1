Return-Path: <SRS0=FeUR=OL=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABA1CC433EF
	for <intel-gfx@archiver.kernel.org>; Tue, 21 Sep 2021 11:02:29 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C6C860F3A
	for <intel-gfx@archiver.kernel.org>; Tue, 21 Sep 2021 11:02:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7C6C860F3A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 716876E972;
	Tue, 21 Sep 2021 11:02:16 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56FC56E95E;
 Tue, 21 Sep 2021 11:02:10 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10113"; a="284344205"
X-IronPort-AV: E=Sophos;i="5.85,311,1624345200"; d="scan'208";a="284344205"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2021 04:01:49 -0700
X-IronPort-AV: E=Sophos;i="5.85,311,1624345200"; d="scan'208";a="484141834"
Received: from agallagh-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.17.108])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2021 04:01:47 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Date: Tue, 21 Sep 2021 12:01:17 +0100
Message-Id: <20210921110121.3783395-10-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210921110121.3783395-1-matthew.auld@intel.com>
References: <20210921110121.3783395-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH v4 10/14] drm/i915/ttm: hide shmem objects from
 TTM LRU
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

This is probably a NAK. But ideally we need to somehow prevent TTM from
seeing shmem objects when doing its LRU swap walk. Since these are
EXTERNAL they are ignored anyway, but keeping them in the LRU seems
pretty wasteful.  Trying to use bo_pin() for this is all kinds of nasty
since we need to be able to do the bo_unpin() from the unpopulate hook,
but since that can be called from the BO destroy path we will likely go
down in flames.

An alternative is to maybe just add EXTERNAL objects to some
bdev->external LRU in TTM, or just don't add them at all?

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index 174aebe11264..b438ddb52764 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -800,6 +800,22 @@ static unsigned long i915_ttm_io_mem_pfn(struct ttm_buffer_object *bo,
 	return ((base + sg_dma_address(sg)) >> PAGE_SHIFT) + ofs;
 }
 
+static void i915_ttm_del_from_lru_notify(struct ttm_buffer_object *bo)
+{
+	struct i915_ttm_tt *i915_tt =
+		container_of(bo->ttm, typeof(*i915_tt), ttm);
+
+	/* Idealy we need to prevent TTM from seeing shmem objects when doing
+	 * its LRU swap walk. Since these are EXTERNAL they are ignored anyway,
+	 * but keeping them in the LRU is pretty waseful. Trying to use bo_pin()
+	 * for this is very nasty since we need to be able to do the bo_unpin()
+	 * from the unpopulate hook, but since that can be called from the BO
+	 * destroy path we will go down in flames.
+	 */
+	if (bo->ttm && ttm_tt_is_populated(bo->ttm) && i915_tt->is_shmem)
+		list_del_init(&bo->lru);
+}
+
 static struct ttm_device_funcs i915_ttm_bo_driver = {
 	.ttm_tt_create = i915_ttm_tt_create,
 	.ttm_tt_populate = i915_ttm_tt_populate,
@@ -810,6 +826,7 @@ static struct ttm_device_funcs i915_ttm_bo_driver = {
 	.move = i915_ttm_move,
 	.swap_notify = i915_ttm_swap_notify,
 	.delete_mem_notify = i915_ttm_delete_mem_notify,
+	.del_from_lru_notify = i915_ttm_del_from_lru_notify,
 	.io_mem_reserve = i915_ttm_io_mem_reserve,
 	.io_mem_pfn = i915_ttm_io_mem_pfn,
 };
-- 
2.26.3

