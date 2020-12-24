Return-Path: <SRS0=k0xi=F4=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E40DC433DB
	for <intel-gfx@archiver.kernel.org>; Thu, 24 Dec 2020 14:35:17 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFCEC223DB
	for <intel-gfx@archiver.kernel.org>; Thu, 24 Dec 2020 14:35:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EFCEC223DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B04289650;
	Thu, 24 Dec 2020 14:35:16 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 446998961E
 for <intel-gfx@lists.freedesktop.org>; Thu, 24 Dec 2020 14:35:12 +0000 (UTC)
IronPort-SDR: WBLTF+UmcMZCuGfdWNtXNRbuCN5zDbsUxP6WgGahxJPtXZ8mVmliCHY5z85EfB5aB2y11LWOcZ
 gqzlTnNV1SWg==
X-IronPort-AV: E=McAfee;i="6000,8403,9844"; a="240236012"
X-IronPort-AV: E=Sophos;i="5.78,444,1599548400"; d="scan'208";a="240236012"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Dec 2020 06:35:12 -0800
IronPort-SDR: DROLBkoVBo7I1+ZnQn6AXAZUaUOnNQK5/4W6X/9WiDv8P6GW9jcbhdldtIY6IF0gwBQUYRwDEo
 CA9rXQaMadyw==
X-IronPort-AV: E=Sophos;i="5.78,444,1599548400"; d="scan'208";a="374424889"
Received: from vmangan-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.252.26.220])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Dec 2020 06:35:11 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Thu, 24 Dec 2020 14:34:55 +0000
Message-Id: <20201224143455.387624-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201224143455.387624-1-matthew.auld@intel.com>
References: <20201224143455.387624-1-matthew.auld@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 2/2] drm/i915: clear the gpu reloc batch
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

The reloc batch is short lived but can exist in the user visible ppGTT,
and since it's backed by an internal object, which lacks page clearing,
we should take care to clear it upfront.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index 0cf9e79325a8..a4ecd4b4e874 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -1295,6 +1295,9 @@ static int __reloc_gpu_alloc(struct i915_execbuffer *eb,
 		goto err_pool;
 	}
 
+	memset64((void*)cmd, 0, pool->obj->base.size / sizeof(u64));
+	i915_gem_object_flush_map(pool->obj);
+
 	batch = i915_vma_instance(pool->obj, vma->vm, NULL);
 	if (IS_ERR(batch)) {
 		err = PTR_ERR(batch);
-- 
2.26.2

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
