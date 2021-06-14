Return-Path: <SRS0=Eks7=LI=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D197C2B9F4
	for <intel-gfx@archiver.kernel.org>; Mon, 14 Jun 2021 14:20:07 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23F8361241
	for <intel-gfx@archiver.kernel.org>; Mon, 14 Jun 2021 14:20:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 23F8361241
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B29F893D0;
	Mon, 14 Jun 2021 14:20:05 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC4AD893D0
 for <intel-gfx@lists.freedesktop.org>; Mon, 14 Jun 2021 14:20:04 +0000 (UTC)
IronPort-SDR: fdZpX7+DEKo+gZW08kH0ezpSxM9pDhpxjLXQDEF3m+Rvj9xA7ZADlfeKrQMMN9PmjEW9D90MMR
 mSWnhIowTWeg==
X-IronPort-AV: E=McAfee;i="6200,9189,10015"; a="205847912"
X-IronPort-AV: E=Sophos;i="5.83,273,1616482800"; d="scan'208";a="205847912"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2021 07:20:03 -0700
IronPort-SDR: Dy33VW6IRdqiZTeXcCI17ancSVSqZTKfwIiFgkt/n+yf/h55STQwiBxBkXoRk2v/4kwv0Sx8WT
 woP05QcFCM4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,273,1616482800"; d="scan'208";a="403668467"
Received: from tejas-system-product-name.iind.intel.com ([10.145.162.130])
 by orsmga006.jf.intel.com with ESMTP; 14 Jun 2021 07:20:01 -0700
From: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Mon, 14 Jun 2021 19:40:59 +0530
Message-Id: <20210614141059.843300-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH] drm/i915/ehl: Update MOCS table for EHL
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

From: Matt Roper <matthew.d.roper@intel.com>

These extra EHL entries were not behaving as expected without proper
flushing implemented in kernel.
https://cgit.freedesktop.org/drm-tip/commit/?id=a679f58d051025db6fa86226c4d35650b75e990f
patch introduces proper flushing to make it work as expected.

Hence adding those EHL entries back.

Cc: Francisco Jerez <francisco.jerez.plata@intel.com>
Cc: Jon Bloomfield <jon.bloomfield@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: <stable@vger.kernel.org>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Fixes: 046091758b50 ("Revert "drm/i915/ehl: Update MOCS table for EHL"")
Link: https://patchwork.freedesktop.org/patch/msgid/20191112224757.25116-1-matthew.d.roper@intel.com
---
 drivers/gpu/drm/i915/gt/intel_mocs.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_mocs.c b/drivers/gpu/drm/i915/gt/intel_mocs.c
index 17848807f111..7d9ef0210805 100644
--- a/drivers/gpu/drm/i915/gt/intel_mocs.c
+++ b/drivers/gpu/drm/i915/gt/intel_mocs.c
@@ -194,6 +194,14 @@ static const struct drm_i915_mocs_entry broxton_mocs_table[] = {
 	MOCS_ENTRY(15, \
 		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(2) | LE_AOM(1), \
 		   L3_3_WB), \
+	/* Bypass LLC - Uncached (EHL+) */ \
+	MOCS_ENTRY(16, \
+		   LE_1_UC | LE_TC_1_LLC | LE_SCF(1), \
+		   L3_1_UC), \
+	/* Bypass LLC - L3 (Read-Only) (EHL+) */ \
+	MOCS_ENTRY(17, \
+		   LE_1_UC | LE_TC_1_LLC | LE_SCF(1), \
+		   L3_3_WB), \
 	/* Self-Snoop - L3 + LLC */ \
 	MOCS_ENTRY(18, \
 		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(3) | LE_SSE(3), \
-- 
2.31.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
