Return-Path: <SRS0=Sdza=PK=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DFCBC433F5
	for <intel-gfx@archiver.kernel.org>; Fri, 22 Oct 2021 16:50:16 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53F536115B
	for <intel-gfx@archiver.kernel.org>; Fri, 22 Oct 2021 16:50:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 53F536115B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F7C26E7EA;
	Fri, 22 Oct 2021 16:50:11 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 541726E7EA;
 Fri, 22 Oct 2021 16:50:10 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10145"; a="226794292"
X-IronPort-AV: E=Sophos;i="5.87,173,1631602800"; d="scan'208";a="226794292"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 09:50:10 -0700
X-IronPort-AV: E=Sophos;i="5.87,173,1631602800"; d="scan'208";a="595602371"
Received: from bkokkula-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.0.159])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 09:50:08 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Ramalingam C <ramalingam.c@intel.com>
Date: Fri, 22 Oct 2021 17:48:47 +0100
Message-Id: <20211022164847.2632366-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20211022164847.2632366-1-matthew.auld@intel.com>
References: <20211022164847.2632366-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 2/2] drm/i915/gtt: stop caching the scratch page
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

Normal users shouldn't be hitting this, likely this would indicate a
userspace bug. So don't bother caching, which should be safe now that we
manually flush the page.

Suggested-by: Chris Wilson <chris@chris-wilson.co.uk>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Ramalingam C <ramalingam.c@intel.com>
---
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
index 8af2f709571c..9966e9dc5218 100644
--- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
+++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
@@ -651,7 +651,7 @@ static int gen8_init_scratch(struct i915_address_space *vm)
 
 	vm->scratch[0]->encode =
 		gen8_pte_encode(px_dma(vm->scratch[0]),
-				I915_CACHE_LLC, pte_flags);
+				I915_CACHE_NONE, pte_flags);
 
 	for (i = 1; i <= vm->top; i++) {
 		struct drm_i915_gem_object *obj;
@@ -667,7 +667,7 @@ static int gen8_init_scratch(struct i915_address_space *vm)
 		}
 
 		fill_px(obj, vm->scratch[i - 1]->encode);
-		obj->encode = gen8_pde_encode(px_dma(obj), I915_CACHE_LLC);
+		obj->encode = gen8_pde_encode(px_dma(obj), I915_CACHE_NONE);
 
 		vm->scratch[i] = obj;
 	}
-- 
2.26.3

