Return-Path: <SRS0=0Its=HL=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C560C433DB
	for <intel-gfx@archiver.kernel.org>; Tue,  9 Feb 2021 12:00:49 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A49564E3B
	for <intel-gfx@archiver.kernel.org>; Tue,  9 Feb 2021 12:00:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A49564E3B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B409B6EB0B;
	Tue,  9 Feb 2021 12:00:48 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EB4E6EB0E
 for <intel-gfx@lists.freedesktop.org>; Tue,  9 Feb 2021 12:00:46 +0000 (UTC)
IronPort-SDR: CZL5fj0sNRVj+YBlvaax/bOvSr4D6kKrC1j0/FQwqdpzHvPv/p8AB80C2sOupn2pLk1uZpOgbA
 Fubo0eAt0Z/w==
X-IronPort-AV: E=McAfee;i="6000,8403,9889"; a="161019856"
X-IronPort-AV: E=Sophos;i="5.81,164,1610438400"; d="scan'208";a="161019856"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2021 04:00:46 -0800
IronPort-SDR: FcGmU6itWgkzJKjD2s9KeZOwY/EB/05Yrmbd5gtTUr0N5Lyo4+YWOQNG2ibsv/a4p+PcW9Z1gK
 IZP+6QLMwrlg==
X-IronPort-AV: E=Sophos;i="5.81,164,1610438400"; d="scan'208";a="436069214"
Received: from tpomalle-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.252.21.147])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2021 04:00:44 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue,  9 Feb 2021 12:00:27 +0000
Message-Id: <20210209120027.229700-4-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210209120027.229700-1-matthew.auld@intel.com>
References: <20210209120027.229700-1-matthew.auld@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v2 4/4] drm/i915/stolen: pass the allocation
 flags
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

From: CQ Tang <cq.tang@intel.com>

Stolen memory is always allocated as physically contiguous pages, mark
the object flags as such.

Signed-off-by: CQ Tang <cq.tang@intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
index 320270c35949..7e06636f7f24 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
@@ -632,7 +632,8 @@ static const struct drm_i915_gem_object_ops i915_gem_object_stolen_ops = {
 
 static int __i915_gem_object_create_stolen(struct intel_memory_region *mem,
 					   struct drm_i915_gem_object *obj,
-					   struct drm_mm_node *stolen)
+					   struct drm_mm_node *stolen,
+					   unsigned int flags)
 {
 	static struct lock_class_key lock_class;
 	unsigned int cache_level;
@@ -650,7 +651,7 @@ static int __i915_gem_object_create_stolen(struct intel_memory_region *mem,
 	if (err)
 		return err;
 
-	i915_gem_object_init_memory_region(obj, mem, 0);
+	i915_gem_object_init_memory_region(obj, mem, flags);
 
 	return 0;
 }
@@ -679,7 +680,7 @@ static int _i915_gem_object_stolen_init(struct intel_memory_region *mem,
 	if (ret)
 		goto err_free;
 
-	ret = __i915_gem_object_create_stolen(mem, obj, stolen);
+	ret = __i915_gem_object_create_stolen(mem, obj, stolen, flags);
 	if (ret)
 		goto err_remove;
 
@@ -837,7 +838,8 @@ i915_gem_object_create_stolen_for_preallocated(struct drm_i915_private *i915,
 		goto err_stolen;
 	}
 
-	ret = __i915_gem_object_create_stolen(mem, obj, stolen);
+	ret = __i915_gem_object_create_stolen(mem, obj, stolen,
+					      I915_BO_ALLOC_CONTIGUOUS);
 	if (ret)
 		goto err_object_free;
 
-- 
2.26.2

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
