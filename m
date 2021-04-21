Return-Path: <SRS0=MVSk=JS=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E38CC433ED
	for <intel-gfx@archiver.kernel.org>; Wed, 21 Apr 2021 10:47:27 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12BD6613F5
	for <intel-gfx@archiver.kernel.org>; Wed, 21 Apr 2021 10:47:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 12BD6613F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D42E86E982;
	Wed, 21 Apr 2021 10:47:18 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34ABC6E982;
 Wed, 21 Apr 2021 10:47:17 +0000 (UTC)
IronPort-SDR: N9xknx45e/6Nca7EiNN2krldEO3Jakp7ulswHxYlB4wUrbvObrdlHP2/RaXqkeZMenZviUcOQs
 Tc/1vQq9CeRw==
X-IronPort-AV: E=McAfee;i="6200,9189,9960"; a="175784352"
X-IronPort-AV: E=Sophos;i="5.82,238,1613462400"; d="scan'208";a="175784352"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2021 03:47:16 -0700
IronPort-SDR: 92QWXgVTIAH/jJ7gDAks2qFCv4GQimLZOk3Rkeoj1UNtpC/QIf3UfK0hfoHT8EkELobMrBOORL
 Wtk5uDysbAAQ==
X-IronPort-AV: E=Sophos;i="5.82,238,1613462400"; d="scan'208";a="427468840"
Received: from ddacost1-mobl1.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.252.9.23])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2021 03:47:15 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Wed, 21 Apr 2021 11:46:58 +0100
Message-Id: <20210421104658.304142-4-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210421104658.304142-1-matthew.auld@intel.com>
References: <20210421104658.304142-1-matthew.auld@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v2 4/4] drm/i915/stolen: actually mark as
 contiguous
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Stolen memory is always allocated as physically contiguous pages, so
mark the object flags as such. It looks like the flags were previously
just ignored so this had no effect. In the future we might to add the
proper plumbing for passing the flags all over the way down from the
caller, but for now we don't have a use for that.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
index b43929da8de8..c5b64b2400e8 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
@@ -637,10 +637,17 @@ static int __i915_gem_object_create_stolen(struct intel_memory_region *mem,
 {
 	static struct lock_class_key lock_class;
 	unsigned int cache_level;
+	unsigned int flags;
 	int err;
 
+	/*
+	 * Stolen objects are always physically contiguous since we just
+	 * allocate one big block underneath using the drm_mm range allocator.
+	 */
+	flags = I915_BO_ALLOC_CONTIGUOUS;
+
 	drm_gem_private_object_init(&mem->i915->drm, &obj->base, stolen->size);
-	i915_gem_object_init(obj, &i915_gem_object_stolen_ops, &lock_class, 0);
+	i915_gem_object_init(obj, &i915_gem_object_stolen_ops, &lock_class, flags);
 
 	obj->stolen = stolen;
 	obj->read_domains = I915_GEM_DOMAIN_CPU | I915_GEM_DOMAIN_GTT;
@@ -699,8 +706,7 @@ struct drm_i915_gem_object *
 i915_gem_object_create_stolen(struct drm_i915_private *i915,
 			      resource_size_t size)
 {
-	return i915_gem_object_create_region(i915->mm.stolen_region,
-					     size, I915_BO_ALLOC_CONTIGUOUS);
+	return i915_gem_object_create_region(i915->mm.stolen_region, size, 0);
 }
 
 static int init_stolen_smem(struct intel_memory_region *mem)
-- 
2.26.3

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
