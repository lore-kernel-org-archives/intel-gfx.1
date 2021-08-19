Return-Path: <SRS0=FEgb=NK=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 813AFC4320A
	for <intel-gfx@archiver.kernel.org>; Thu, 19 Aug 2021 09:34:45 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50D3660240
	for <intel-gfx@archiver.kernel.org>; Thu, 19 Aug 2021 09:34:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 50D3660240
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C4BD6E7EF;
	Thu, 19 Aug 2021 09:34:37 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5AE66E7D1;
 Thu, 19 Aug 2021 09:34:33 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10080"; a="216553856"
X-IronPort-AV: E=Sophos;i="5.84,334,1620716400"; d="scan'208";a="216553856"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2021 02:34:33 -0700
X-IronPort-AV: E=Sophos;i="5.84,334,1620716400"; d="scan'208";a="451328522"
Received: from jmfrench-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.213.251.78])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2021 02:34:32 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Thu, 19 Aug 2021 10:34:19 +0100
Message-Id: <20210819093419.295636-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210819093419.295636-1-matthew.auld@intel.com>
References: <20210819093419.295636-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH v2 2/2] drm/i915/debugfs: hook up
 ttm_resource_manager_debug
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

This should give a more complete view of the various bits of internal
resource manager state, for device local-memory.

v2(Thomas):
   - Move the region printing into a nice helper

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/i915_debugfs.c        |  4 ++--
 drivers/gpu/drm/i915/intel_memory_region.c | 12 ++++++++++++
 drivers/gpu/drm/i915/intel_memory_region.h |  4 ++++
 3 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
index eec0d349ea6a..04351a851586 100644
--- a/drivers/gpu/drm/i915/i915_debugfs.c
+++ b/drivers/gpu/drm/i915/i915_debugfs.c
@@ -238,6 +238,7 @@ i915_debugfs_describe_obj(struct seq_file *m, struct drm_i915_gem_object *obj)
 static int i915_gem_object_info(struct seq_file *m, void *data)
 {
 	struct drm_i915_private *i915 = node_to_i915(m->private);
+	struct drm_printer p = drm_seq_file_printer(m);
 	struct intel_memory_region *mr;
 	enum intel_region_id id;
 
@@ -246,8 +247,7 @@ static int i915_gem_object_info(struct seq_file *m, void *data)
 		   atomic_read(&i915->mm.free_count),
 		   i915->mm.shrink_memory);
 	for_each_memory_region(mr, i915, id)
-		seq_printf(m, "%s: total:%pa, available:%pa bytes\n",
-			   mr->name, &mr->total, &mr->avail);
+		intel_memory_region_debug(mr, &p);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/i915/intel_memory_region.c b/drivers/gpu/drm/i915/intel_memory_region.c
index 779eb2fa90b6..e7f7e6627750 100644
--- a/drivers/gpu/drm/i915/intel_memory_region.c
+++ b/drivers/gpu/drm/i915/intel_memory_region.c
@@ -78,6 +78,18 @@ int intel_memory_region_reserve(struct intel_memory_region *mem,
 	return i915_ttm_buddy_man_reserve(man, offset, size);
 }
 
+void intel_memory_region_debug(struct intel_memory_region *mr,
+			       struct drm_printer *printer)
+{
+	drm_printf(printer, "%s: ", mr->name);
+
+	if (mr->region_private)
+		ttm_resource_manager_debug(mr->region_private, printer);
+	else
+		drm_printf(printer, "total:%pa, available:%pa bytes\n",
+			   &mr->total, &mr->avail);
+}
+
 struct intel_memory_region *
 intel_memory_region_create(struct drm_i915_private *i915,
 			   resource_size_t start,
diff --git a/drivers/gpu/drm/i915/intel_memory_region.h b/drivers/gpu/drm/i915/intel_memory_region.h
index 1f2b96efa69d..3feae3353d33 100644
--- a/drivers/gpu/drm/i915/intel_memory_region.h
+++ b/drivers/gpu/drm/i915/intel_memory_region.h
@@ -15,6 +15,7 @@
 
 struct drm_i915_private;
 struct drm_i915_gem_object;
+struct drm_printer;
 struct intel_memory_region;
 struct sg_table;
 struct ttm_resource;
@@ -127,6 +128,9 @@ int intel_memory_region_reserve(struct intel_memory_region *mem,
 				resource_size_t offset,
 				resource_size_t size);
 
+void intel_memory_region_debug(struct intel_memory_region *mr,
+			       struct drm_printer *printer);
+
 struct intel_memory_region *
 i915_gem_ttm_system_setup(struct drm_i915_private *i915,
 			  u16 type, u16 instance);
-- 
2.26.3

