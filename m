Return-Path: <SRS0=C8BW=P6=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6494AC433F5
	for <intel-gfx@archiver.kernel.org>; Thu, 11 Nov 2021 00:45:57 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DF6761361
	for <intel-gfx@archiver.kernel.org>; Thu, 11 Nov 2021 00:45:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2DF6761361
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 784416E80B;
	Thu, 11 Nov 2021 00:45:56 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3A346E81A
 for <intel-gfx@lists.freedesktop.org>; Thu, 11 Nov 2021 00:45:54 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10164"; a="212853095"
X-IronPort-AV: E=Sophos;i="5.87,225,1631602800"; d="scan'208";a="212853095"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2021 16:45:54 -0800
X-IronPort-AV: E=Sophos;i="5.87,225,1631602800"; d="scan'208";a="501715579"
Received: from menghsia-mobl.amr.corp.intel.com (HELO mvcheng-desk2.intel.com)
 ([10.209.91.138])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2021 16:45:54 -0800
From: Michael Cheng <michael.cheng@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Wed, 10 Nov 2021 16:45:49 -0800
Message-Id: <20211111004549.144706-4-michael.cheng@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211111004549.144706-1-michael.cheng@intel.com>
References: <20211111004549.144706-1-michael.cheng@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH v4 3/3] drm/i915: Clean up BYT_PTE_WRITEABLE
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
Cc: michael.cheng@intel.com, wayne.boyer@intel.com, jani.nikula@intel.com,
 lucas.demarchi@intel.com, siva.mullati@intel.com
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Removes BYT_PTE_WRITEABLE and replace it with
I915_PAGE_RW.

Signed-off-by: Michael Cheng <michael.cheng@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_ggtt.c | 2 +-
 drivers/gpu/drm/i915/gt/intel_gtt.h  | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
index 995a1c47cd35..ac4ad82fdcdd 100644
--- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
@@ -1026,7 +1026,7 @@ static u64 byt_pte_encode(dma_addr_t addr,
 	gen6_pte_t pte = GEN6_PTE_ADDR_ENCODE(addr) | I915_PAGE_PRESENT;
 
 	if (!(flags & PTE_READ_ONLY))
-		pte |= BYT_PTE_WRITEABLE;
+		pte |= I915_PAGE_RW;
 
 	if (level != I915_CACHE_NONE)
 		pte |= BYT_PTE_SNOOPED_BY_CPU_CACHES;
diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel_gtt.h
index 884bc250260c..0eb77e2fb45f 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.h
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
@@ -84,7 +84,6 @@ typedef u64 gen8_pte_t;
 #define GEN7_PTE_CACHE_L3_LLC		(3 << 1)
 
 #define BYT_PTE_SNOOPED_BY_CPU_CACHES	REG_BIT(2)
-#define BYT_PTE_WRITEABLE		REG_BIT(1)
 
 #define GEN12_PPGTT_PTE_LM	BIT_ULL(11)
 
-- 
2.25.1

