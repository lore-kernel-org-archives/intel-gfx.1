Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE173C433EF
	for <intel-gfx@archiver.kernel.org>; Mon, 29 Nov 2021 13:58:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C1A66EDB0;
	Mon, 29 Nov 2021 13:57:24 +0000 (UTC)
Received: from mblankhorst.nl (mblankhorst.nl [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8904B6ECBC;
 Mon, 29 Nov 2021 13:57:18 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Mon, 29 Nov 2021 14:47:29 +0100
Message-Id: <20211129134735.628712-11-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211129134735.628712-1-maarten.lankhorst@linux.intel.com>
References: <20211129134735.628712-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH v2 10/16] drm/i915: Make i915_gem_evict_vm work
 correctly for already locked objects
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
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

i915_gem_execbuf will call i915_gem_evict_vm() after failing to pin
all objects in the first round. We are about to remove those short-term
pins, but even without those the objects are still locked. Add a special
case to allow i915_gem_evict_vm to evict locked objects as well.

This might also allow multiple objects sharing the same resv to be evicted.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/i915/i915_gem_evict.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_gem_evict.c b/drivers/gpu/drm/i915/i915_gem_evict.c
index 24f5e3345e43..f502a617b35c 100644
--- a/drivers/gpu/drm/i915/i915_gem_evict.c
+++ b/drivers/gpu/drm/i915/i915_gem_evict.c
@@ -410,21 +410,42 @@ int i915_gem_evict_vm(struct i915_address_space *vm, struct i915_gem_ww_ctx *ww)
 	do {
 		struct i915_vma *vma, *vn;
 		LIST_HEAD(eviction_list);
+		LIST_HEAD(locked_eviction_list);
 
 		list_for_each_entry(vma, &vm->bound_list, vm_link) {
 			if (i915_vma_is_pinned(vma))
 				continue;
 
+			/*
+			 * If we already own the lock, trylock fails. In case the resv
+			 * is shared among multiple objects, we still need the object ref.
+			 */
+			if (ww && (dma_resv_locking_ctx(vma->obj->base.resv) == &ww->ctx)) {
+				__i915_vma_pin(vma);
+				list_add(&vma->evict_link, &locked_eviction_list);
+				continue;
+			}
+
 			if (!i915_gem_object_trylock(vma->obj, ww))
 				continue;
 
 			__i915_vma_pin(vma);
 			list_add(&vma->evict_link, &eviction_list);
 		}
-		if (list_empty(&eviction_list))
+		if (list_empty(&eviction_list) && list_empty(&locked_eviction_list))
 			break;
 
 		ret = 0;
+		/* Unbind locked objects first, before unlocking the eviction_list */
+		list_for_each_entry_safe(vma, vn, &locked_eviction_list, evict_link) {
+			__i915_vma_unpin(vma);
+
+			if (ret == 0)
+				ret = __i915_vma_unbind(vma);
+			if (ret != -EINTR) /* "Get me out of here!" */
+				ret = 0;
+		}
+
 		list_for_each_entry_safe(vma, vn, &eviction_list, evict_link) {
 			__i915_vma_unpin(vma);
 			if (ret == 0)
-- 
2.34.0

