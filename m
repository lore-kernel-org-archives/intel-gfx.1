Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25332C4332F
	for <intel-gfx@archiver.kernel.org>; Fri, 23 Dec 2022 09:20:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CC2B10E62E;
	Fri, 23 Dec 2022 09:20:36 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AA3E10E62E
 for <intel-gfx@lists.freedesktop.org>; Fri, 23 Dec 2022 09:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671787233; x=1703323233;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+h1sCSNoAQNhdXWbsCKC7aibxnmNVUPcZ68D20wHyJY=;
 b=mfUJwbLrNrMCyMRT/evQJQi7dTNNICMLRhVrXAe2GvWMl5UKKLRI0sqE
 13CjIifRsBr1tPsk5lo3vBOXI0tToTShl35lZRo2iz94skZdJLAsuvMiS
 8BAc8mjyimRFVq5BxU7UbdOYuObWXuyi3ut4mWO80fIlCXNyA8dL81lez
 gNwt5dmxJvQKruDDXkHkDHCdU62Z4FfCMbxSTdlhG3xD4MXNi+tOnd70Y
 mbdJA8+FiEbgoc8VaQHOK3sFlEk/zLIquDVvf1e/RxzczaQh5JDX86bxm
 jGBuBuRZXPTbhnEi8ZmZnvjeCfL2v0q8/z96STAZ7y1CORx3eV6IbTlKX A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10569"; a="303776507"
X-IronPort-AV: E=Sophos;i="5.96,268,1665471600"; d="scan'208";a="303776507"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2022 01:20:30 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10569"; a="602151440"
X-IronPort-AV: E=Sophos;i="5.96,268,1665471600"; d="scan'208";a="602151440"
Received: from nirmoyda-desk.igk.intel.com ([10.102.13.19])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2022 01:20:28 -0800
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Fri, 23 Dec 2022 10:20:11 +0100
Message-Id: <20221223092011.11657-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH] drm/i915: Reserve enough fence slot for
 i915_vma_unbind_async
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
 Nirmoy Das <nirmoy.das@intel.com>, --cc=matthew.auld@intel.com,
 jianshui.yu@intel.com
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

A nested dma_resv_reserve_fences(1) will not reserve slot from the
2nd call onwards and folowing dma_resv_add_fence() might hit the
"BUG_ON(fobj->num_fences >= fobj->max_fences)" check.

I915 hit above nested dma_resv case in ttm_bo_handle_move_mem() with
async unbind:

dma_resv_reserve_fences() from --> ttm_bo_handle_move_mem()
        dma_resv_reserve_fences() from --> i915_vma_unbind_async()
        dma_resv_add_fence() from --> i915_vma_unbind_async()
dma_resv_add_fence() from -->ttm_bo_move_accel_cleanup()

Resolve this by adding an extra fence in i915_vma_unbind_async().

Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/i915/i915_vma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index 7d044888ac33..5ac4c1c2403c 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -2149,7 +2149,7 @@ int i915_vma_unbind_async(struct i915_vma *vma, bool trylock_vm)
 	if (!obj->mm.rsgt)
 		return -EBUSY;
 
-	err = dma_resv_reserve_fences(obj->base.resv, 1);
+	err = dma_resv_reserve_fences(obj->base.resv, 2);
 	if (err)
 		return -EBUSY;
 
-- 
2.38.0

