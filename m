Return-Path: <SRS0=kgP7=MU=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD96EC43214
	for <intel-gfx@archiver.kernel.org>; Wed, 28 Jul 2021 22:01:01 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 986AA60E94
	for <intel-gfx@archiver.kernel.org>; Wed, 28 Jul 2021 22:01:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 986AA60E94
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0D546EB54;
	Wed, 28 Jul 2021 22:00:59 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DAEB6EA16
 for <intel-gfx@lists.freedesktop.org>; Wed, 28 Jul 2021 22:00:09 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10059"; a="193035291"
X-IronPort-AV: E=Sophos;i="5.84,276,1620716400"; d="scan'208";a="193035291"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2021 15:00:06 -0700
X-IronPort-AV: E=Sophos;i="5.84,276,1620716400"; d="scan'208";a="663663272"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2021 15:00:05 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Wed, 28 Jul 2021 14:59:40 -0700
Message-Id: <20210728215946.1573015-20-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210728215946.1573015-1-lucas.demarchi@intel.com>
References: <20210728215946.1573015-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 19/25] drm/i915: remove explicit CNL handling
 from intel_wopcm.c
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

Consider the new WOPCM size as starting in ICL rather than CNL since the
latter is being removed from the driver.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/i915/intel_wopcm.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/intel_wopcm.c b/drivers/gpu/drm/i915/intel_wopcm.c
index 8309455f13ea..5e511bb891f9 100644
--- a/drivers/gpu/drm/i915/intel_wopcm.c
+++ b/drivers/gpu/drm/i915/intel_wopcm.c
@@ -56,8 +56,8 @@
 
 /* 24KB at the end of WOPCM is reserved for RC6 CTX on BXT. */
 #define BXT_WOPCM_RC6_CTX_RESERVED	(SZ_16K + SZ_8K)
-/* 36KB WOPCM reserved at the end of WOPCM on CNL. */
-#define CNL_WOPCM_HW_CTX_RESERVED	(SZ_32K + SZ_4K)
+/* 36KB WOPCM reserved at the end of WOPCM on ICL. */
+#define ICL_WOPCM_HW_CTX_RESERVED	(SZ_32K + SZ_4K)
 
 /* 128KB from GUC_WOPCM_RESERVED is reserved for FW on Gen9. */
 #define GEN9_GUC_FW_RESERVED	SZ_128K
@@ -93,8 +93,8 @@ static u32 context_reserved_size(struct drm_i915_private *i915)
 {
 	if (IS_GEN9_LP(i915))
 		return BXT_WOPCM_RC6_CTX_RESERVED;
-	else if (GRAPHICS_VER(i915) >= 10)
-		return CNL_WOPCM_HW_CTX_RESERVED;
+	else if (GRAPHICS_VER(i915) >= 11)
+		return ICL_WOPCM_HW_CTX_RESERVED;
 	else
 		return 0;
 }
@@ -126,7 +126,7 @@ static bool gen9_check_huc_fw_fits(struct drm_i915_private *i915,
 				   u32 guc_wopcm_size, u32 huc_fw_size)
 {
 	/*
-	 * On Gen9 & CNL A0, hardware requires the total available GuC WOPCM
+	 * On Gen9, hardware requires the total available GuC WOPCM
 	 * size to be larger than or equal to HuC firmware size. Otherwise,
 	 * firmware uploading would fail.
 	 */
-- 
2.31.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
