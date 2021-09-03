Return-Path: <SRS0=fLoR=NZ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0545C433EF
	for <intel-gfx@archiver.kernel.org>; Fri,  3 Sep 2021 15:53:41 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AAE766054E
	for <intel-gfx@archiver.kernel.org>; Fri,  3 Sep 2021 15:53:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AAE766054E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40CE46E8AD;
	Fri,  3 Sep 2021 15:53:36 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 621A46E8AB;
 Fri,  3 Sep 2021 15:53:34 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10096"; a="219155150"
X-IronPort-AV: E=Sophos;i="5.85,265,1624345200"; d="scan'208";a="219155150"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2021 08:53:33 -0700
X-IronPort-AV: E=Sophos;i="5.85,265,1624345200"; d="scan'208";a="500498186"
Received: from nheffern-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.25.221])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2021 08:53:32 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Date: Fri,  3 Sep 2021 16:53:17 +0100
Message-Id: <20210903155317.1854012-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH] drm/i915/gtt: add some flushing for the 64K GTT
 path
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

If we need to mark the PDE as operating in 64K GTT mode, we should be
paranoid and flush the extra writes, like we already do for the PTEs. On
some platforms the clflush can apparently add the just the right amount
of magical delay to force the GPU to see the updated entry.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
index 6e0e52eeb87a..6a5af995f5b1 100644
--- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
+++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
@@ -548,6 +548,7 @@ static void gen8_ppgtt_insert_huge(struct i915_vma *vma,
 					      I915_GTT_PAGE_SIZE_2M)))) {
 			vaddr = px_vaddr(pd);
 			vaddr[maybe_64K] |= GEN8_PDE_IPS_64K;
+			clflush_cache_range(vaddr, PAGE_SIZE);
 			page_size = I915_GTT_PAGE_SIZE_64K;
 
 			/*
@@ -568,6 +569,7 @@ static void gen8_ppgtt_insert_huge(struct i915_vma *vma,
 				for (i = 1; i < index; i += 16)
 					memset64(vaddr + i, encode, 15);
 
+				clflush_cache_range(vaddr, PAGE_SIZE);
 			}
 		}
 
-- 
2.26.3

