Return-Path: <SRS0=RgPZ=DW=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00C88C433DF
	for <intel-gfx@archiver.kernel.org>; Thu, 15 Oct 2020 11:27:12 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A795920878
	for <intel-gfx@archiver.kernel.org>; Thu, 15 Oct 2020 11:27:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A795920878
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B5F86EC9D;
	Thu, 15 Oct 2020 11:27:06 +0000 (UTC)
Received: from mblankhorst.nl (mblankhorst.nl [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 997DA6EC97
 for <intel-gfx@lists.freedesktop.org>; Thu, 15 Oct 2020 11:26:39 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Thu, 15 Oct 2020 13:26:15 +0200
Message-Id: <20201015112627.1142745-52-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201015112627.1142745-1-maarten.lankhorst@linux.intel.com>
References: <20201015112627.1142745-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v3 51/63] drm/i915/selftests: Prepare hangcheck
 for obj->mm.lock removal
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

Convert a few calls to use the unlocked versions.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/selftest_hangcheck.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
index fb5ebf930ab2..e3027cebab5b 100644
--- a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
+++ b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
@@ -80,15 +80,15 @@ static int hang_init(struct hang *h, struct intel_gt *gt)
 	}
 
 	i915_gem_object_set_cache_coherency(h->hws, I915_CACHE_LLC);
-	vaddr = i915_gem_object_pin_map(h->hws, I915_MAP_WB);
+	vaddr = i915_gem_object_pin_map_unlocked(h->hws, I915_MAP_WB);
 	if (IS_ERR(vaddr)) {
 		err = PTR_ERR(vaddr);
 		goto err_obj;
 	}
 	h->seqno = memset(vaddr, 0xff, PAGE_SIZE);
 
-	vaddr = i915_gem_object_pin_map(h->obj,
-					i915_coherent_map_type(gt->i915));
+	vaddr = i915_gem_object_pin_map_unlocked(h->obj,
+						 i915_coherent_map_type(gt->i915));
 	if (IS_ERR(vaddr)) {
 		err = PTR_ERR(vaddr);
 		goto err_unpin_hws;
@@ -149,7 +149,7 @@ hang_create_request(struct hang *h, struct intel_engine_cs *engine)
 		return ERR_CAST(obj);
 	}
 
-	vaddr = i915_gem_object_pin_map(obj, i915_coherent_map_type(gt->i915));
+	vaddr = i915_gem_object_pin_map_unlocked(obj, i915_coherent_map_type(gt->i915));
 	if (IS_ERR(vaddr)) {
 		i915_gem_object_put(obj);
 		i915_vm_put(vm);
-- 
2.28.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
