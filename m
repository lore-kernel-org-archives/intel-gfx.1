Return-Path: <SRS0=k0xi=F4=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7536C433E0
	for <intel-gfx@archiver.kernel.org>; Thu, 24 Dec 2020 14:48:47 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83BE022288
	for <intel-gfx@archiver.kernel.org>; Thu, 24 Dec 2020 14:48:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83BE022288
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC9C488ECE;
	Thu, 24 Dec 2020 14:48:46 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D54F88ECE
 for <intel-gfx@lists.freedesktop.org>; Thu, 24 Dec 2020 14:48:46 +0000 (UTC)
IronPort-SDR: 5VGWA8/DcJ1K88ntFO0i/yj2mLLSeBeuBGwXYCtMfRmxxoprqJPS3YJHZ7CnNJt78NODwbt5bW
 DrFzjjjmmRXg==
X-IronPort-AV: E=McAfee;i="6000,8403,9844"; a="173578494"
X-IronPort-AV: E=Sophos;i="5.78,444,1599548400"; d="scan'208";a="173578494"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Dec 2020 06:48:43 -0800
IronPort-SDR: XmWoREwNsqKCEfgqkeAVXtDxUc9efzY0U3dES97IjqNXIWn5kDjsyJIN4fzaqa2EwJVCUhL4D+
 VmAAS3jgsGKA==
X-IronPort-AV: E=Sophos;i="5.78,444,1599548400"; d="scan'208";a="374428239"
Received: from vmangan-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.252.26.220])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Dec 2020 06:48:42 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Thu, 24 Dec 2020 14:48:35 +0000
Message-Id: <20201224144835.391775-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201224144835.391775-1-matthew.auld@intel.com>
References: <20201224144835.391775-1-matthew.auld@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v2 2/2] drm/i915: clear the gpu reloc batch
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
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index 0cf9e79325a8..19eeb3f8c5e8 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -1045,7 +1045,7 @@ static void reloc_gpu_flush(struct i915_execbuffer *eb, struct reloc_cache *cach
 	GEM_BUG_ON(cache->rq_size >= obj->base.size / sizeof(u32));
 	cache->rq_cmd[cache->rq_size] = MI_BATCH_BUFFER_END;
 
-	__i915_gem_object_flush_map(obj, 0, sizeof(u32) * (cache->rq_size + 1));
+	i915_gem_object_flush_map(obj);
 	i915_gem_object_unpin_map(obj);
 
 	intel_gt_chipset_flush(cache->rq->engine->gt);
@@ -1295,6 +1295,8 @@ static int __reloc_gpu_alloc(struct i915_execbuffer *eb,
 		goto err_pool;
 	}
 
+	memset32(cmd, 0, pool->obj->base.size / sizeof(u32));
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
