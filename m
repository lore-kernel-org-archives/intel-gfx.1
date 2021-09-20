Return-Path: <SRS0=beGZ=OK=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49940C433F5
	for <intel-gfx@archiver.kernel.org>; Mon, 20 Sep 2021 15:59:55 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 186D06109E
	for <intel-gfx@archiver.kernel.org>; Mon, 20 Sep 2021 15:59:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 186D06109E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C38986E570;
	Mon, 20 Sep 2021 15:59:37 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01F0C6E560;
 Mon, 20 Sep 2021 15:59:33 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10113"; a="203318406"
X-IronPort-AV: E=Sophos;i="5.85,308,1624345200"; d="scan'208";a="203318406"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2021 08:59:33 -0700
X-IronPort-AV: E=Sophos;i="5.85,308,1624345200"; d="scan'208";a="701106675"
Received: from kjeldbeg-mobl2.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.165])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2021 08:59:32 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com, matthew.auld@intel.com,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Mon, 20 Sep 2021 17:59:13 +0200
Message-Id: <20210920155914.707984-6-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210920155914.707984-1-thomas.hellstrom@linux.intel.com>
References: <20210920155914.707984-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH v4 5/6] drm/i915: Don't back up pinned LMEM
 context images and rings during suspend
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

Pinned context images are now reset during resume. Don't back them up,
and assuming that rings can be assumed empty at suspend, don't back them
up either.

Introduce a new object flag, I915_BO_ALLOC_PM_VOLATILE meaning that an
object is allowed to lose its content on suspend.

v3:
- Slight documentation clarification (Matthew Auld)

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 .../gpu/drm/i915/gem/i915_gem_object_types.h    | 17 ++++++++++-------
 drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c      |  3 +++
 drivers/gpu/drm/i915/gt/intel_lrc.c             |  3 ++-
 drivers/gpu/drm/i915/gt/intel_ring.c            |  3 ++-
 4 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
index 734cc8e16481..118691ce81d7 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
@@ -288,16 +288,19 @@ struct drm_i915_gem_object {
 	I915_SELFTEST_DECLARE(struct list_head st_link);
 
 	unsigned long flags;
-#define I915_BO_ALLOC_CONTIGUOUS BIT(0)
-#define I915_BO_ALLOC_VOLATILE   BIT(1)
-#define I915_BO_ALLOC_CPU_CLEAR  BIT(2)
-#define I915_BO_ALLOC_USER       BIT(3)
+#define I915_BO_ALLOC_CONTIGUOUS  BIT(0)
+#define I915_BO_ALLOC_VOLATILE    BIT(1)
+#define I915_BO_ALLOC_CPU_CLEAR   BIT(2)
+#define I915_BO_ALLOC_USER        BIT(3)
+/* Object is allowed to lose its contents on suspend / resume, even if pinned */
+#define I915_BO_ALLOC_PM_VOLATILE BIT(4)
 #define I915_BO_ALLOC_FLAGS (I915_BO_ALLOC_CONTIGUOUS | \
 			     I915_BO_ALLOC_VOLATILE | \
 			     I915_BO_ALLOC_CPU_CLEAR | \
-			     I915_BO_ALLOC_USER)
-#define I915_BO_READONLY         BIT(4)
-#define I915_TILING_QUIRK_BIT    5 /* unknown swizzling; do not release! */
+			     I915_BO_ALLOC_USER | \
+			     I915_BO_ALLOC_PM_VOLATILE)
+#define I915_BO_READONLY          BIT(5)
+#define I915_TILING_QUIRK_BIT     6 /* unknown swizzling; do not release! */
 
 	/**
 	 * @mem_flags - Mutable placement-related flags
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
index cb1c46724f70..03a00d193f40 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
@@ -60,6 +60,9 @@ static int i915_ttm_backup(struct i915_gem_apply_to_region *apply,
 	if (!pm_apply->backup_pinned)
 		return 0;
 
+	if (obj->flags & I915_BO_ALLOC_PM_VOLATILE)
+		return 0;
+
 	backup = i915_gem_object_create_shmem(i915, obj->base.size);
 	if (IS_ERR(backup))
 		return PTR_ERR(backup);
diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
index 6ba8daea2f56..3ef9eaf8c50e 100644
--- a/drivers/gpu/drm/i915/gt/intel_lrc.c
+++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
@@ -942,7 +942,8 @@ __lrc_alloc_state(struct intel_context *ce, struct intel_engine_cs *engine)
 		context_size += PAGE_SIZE;
 	}
 
-	obj = i915_gem_object_create_lmem(engine->i915, context_size, 0);
+	obj = i915_gem_object_create_lmem(engine->i915, context_size,
+					  I915_BO_ALLOC_PM_VOLATILE);
 	if (IS_ERR(obj))
 		obj = i915_gem_object_create_shmem(engine->i915, context_size);
 	if (IS_ERR(obj))
diff --git a/drivers/gpu/drm/i915/gt/intel_ring.c b/drivers/gpu/drm/i915/gt/intel_ring.c
index 7c4d5158e03b..2fdd52b62092 100644
--- a/drivers/gpu/drm/i915/gt/intel_ring.c
+++ b/drivers/gpu/drm/i915/gt/intel_ring.c
@@ -112,7 +112,8 @@ static struct i915_vma *create_ring_vma(struct i915_ggtt *ggtt, int size)
 	struct drm_i915_gem_object *obj;
 	struct i915_vma *vma;
 
-	obj = i915_gem_object_create_lmem(i915, size, I915_BO_ALLOC_VOLATILE);
+	obj = i915_gem_object_create_lmem(i915, size, I915_BO_ALLOC_VOLATILE |
+					  I915_BO_ALLOC_PM_VOLATILE);
 	if (IS_ERR(obj) && i915_ggtt_has_aperture(ggtt))
 		obj = i915_gem_object_create_stolen(i915, size);
 	if (IS_ERR(obj))
-- 
2.31.1

