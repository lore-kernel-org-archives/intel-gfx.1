Return-Path: <SRS0=lJ7G=P5=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBC67C433F5
	for <intel-gfx@archiver.kernel.org>; Wed, 10 Nov 2021 08:55:44 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6F92610CF
	for <intel-gfx@archiver.kernel.org>; Wed, 10 Nov 2021 08:55:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A6F92610CF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8A566FC5E;
	Wed, 10 Nov 2021 08:55:39 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E61606FC5A;
 Wed, 10 Nov 2021 08:55:37 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10163"; a="231352665"
X-IronPort-AV: E=Sophos;i="5.87,223,1631602800"; d="scan'208";a="231352665"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2021 00:55:37 -0800
X-IronPort-AV: E=Sophos;i="5.87,223,1631602800"; d="scan'208";a="732381438"
Received: from browns-mobl.ger.corp.intel.com (HELO thellstr-mobl1.intel.com)
 ([10.249.254.114])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2021 00:55:35 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Date: Wed, 10 Nov 2021 09:55:27 +0100
Message-Id: <20211110085527.1033475-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH] drm/i915/ttm: Fix illegal addition to shrinker
 list
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 matthew.auld@intel.com
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

There's a small window of opportunity during which the adjust_lru()
function can be called with a GEM refcount of zero from the TTM
eviction code. This results in a kernel BUG().

Ensure that we don't attempt to modify the GEM shrinker lists unless
we have a GEM refcount.

Fixes: ebd4a8ec7799 ("drm/i915/ttm: move shrinker management into adjust_lru")
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 31 +++++++++++++++++--------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index e98503c0830b..68cfe6e9ceab 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -771,18 +771,29 @@ void i915_ttm_adjust_lru(struct drm_i915_gem_object *obj)
 	 *
 	 * TODO: consider maybe also bumping the shrinker list here when we have
 	 * already unpinned it, which should give us something more like an LRU.
+	 *
+	 * TODO: There is a small window of opportunity for this function to
+	 * get called from eviction after we've dropped the last GEM refcount,
+	 * but before the TTM deleted flag is set on the object. Avoid
+	 * adjusting the shrinker list in such cases, since the object is
+	 * not available to the shrinker anyway due to its zero refcount.
+	 * To fix this properly we should move to a TTM shrinker LRU list for
+	 * these objects.
 	 */
-	if (shrinkable != obj->mm.ttm_shrinkable) {
-		if (shrinkable) {
-			if (obj->mm.madv == I915_MADV_WILLNEED)
-				__i915_gem_object_make_shrinkable(obj);
-			else
-				__i915_gem_object_make_purgeable(obj);
-		} else {
-			i915_gem_object_make_unshrinkable(obj);
+	if (kref_get_unless_zero(&obj->base.refcount)) {
+		if (shrinkable != obj->mm.ttm_shrinkable) {
+			if (shrinkable) {
+				if (obj->mm.madv == I915_MADV_WILLNEED)
+					__i915_gem_object_make_shrinkable(obj);
+				else
+					__i915_gem_object_make_purgeable(obj);
+			} else {
+				i915_gem_object_make_unshrinkable(obj);
+			}
+
+			obj->mm.ttm_shrinkable = shrinkable;
 		}
-
-		obj->mm.ttm_shrinkable = shrinkable;
+		i915_gem_object_put(obj);
 	}
 
 	/*
-- 
2.31.1

