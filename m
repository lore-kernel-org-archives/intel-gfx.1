Return-Path: <SRS0=3waC=P3=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1014DC433EF
	for <intel-gfx@archiver.kernel.org>; Mon,  8 Nov 2021 12:36:54 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF6396125F
	for <intel-gfx@archiver.kernel.org>; Mon,  8 Nov 2021 12:36:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AF6396125F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C10746E04E;
	Mon,  8 Nov 2021 12:36:49 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFDC86E03B;
 Mon,  8 Nov 2021 12:36:47 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10161"; a="232159836"
X-IronPort-AV: E=Sophos;i="5.87,218,1631602800"; d="scan'208";a="232159836"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2021 04:36:47 -0800
X-IronPort-AV: E=Sophos;i="5.87,218,1631602800"; d="scan'208";a="491197590"
Received: from yiwenfan-mobl.ccr.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.199])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2021 04:36:45 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Date: Mon,  8 Nov 2021 13:36:37 +0100
Message-Id: <20211108123637.929617-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH v2] drm/i915/gem: Fix gem_madvise for ttm+shmem
 objects
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

Gem-TTM objects that are backed by shmem might have populated
page-vectors without having the GEM pages set. Those objects
aren't moved to the correct shrinker / purge list by gem_madvise.

For such objects, identified by having the
_SELF_MANAGED_SHRINK_LIST set, make sure they end up on the
correct list.

v2:
- Revert a change that made swapped-out objects inaccessible for
  truncating. (Matthew Auld)

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/i915_gem.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
index d0e642c82064..527228d4da7e 100644
--- a/drivers/gpu/drm/i915/i915_gem.c
+++ b/drivers/gpu/drm/i915/i915_gem.c
@@ -1005,7 +1005,8 @@ i915_gem_madvise_ioctl(struct drm_device *dev, void *data,
 			obj->ops->adjust_lru(obj);
 	}
 
-	if (i915_gem_object_has_pages(obj)) {
+	if (i915_gem_object_has_pages(obj) ||
+	    i915_gem_object_has_self_managed_shrink_list(obj)) {
 		unsigned long flags;
 
 		spin_lock_irqsave(&i915->mm.obj_lock, flags);
-- 
2.31.1

