Return-Path: <SRS0=pIl2=NV=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EE85C432BE
	for <intel-gfx@archiver.kernel.org>; Mon, 30 Aug 2021 10:29:27 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68AF0610C7
	for <intel-gfx@archiver.kernel.org>; Mon, 30 Aug 2021 10:29:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 68AF0610C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E095289DC1;
	Mon, 30 Aug 2021 10:29:26 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26BFE89DC0;
 Mon, 30 Aug 2021 10:29:25 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10091"; a="197811431"
X-IronPort-AV: E=Sophos;i="5.84,363,1620716400"; d="scan'208";a="197811431"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2021 03:29:15 -0700
X-IronPort-AV: E=Sophos;i="5.84,363,1620716400"; d="scan'208";a="497453615"
Received: from anikolae-mobl1.ccr.corp.intel.com (HELO localhost)
 ([10.249.47.21])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2021 03:29:13 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com
Date: Mon, 30 Aug 2021 13:28:59 +0300
Message-Id: <1cbbea07dfcce46df37854d53f769a40a058a92d.1630319138.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1630319138.git.jani.nikula@intel.com>
References: <cover.1630319138.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 1/5] drm/displayid: re-align data block macros
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

Make the values easier to read. Also add DisplayID Structure version and
revision information (this is different from the spec version).

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 include/drm/drm_displayid.h | 57 +++++++++++++++++++------------------
 1 file changed, 29 insertions(+), 28 deletions(-)

diff --git a/include/drm/drm_displayid.h b/include/drm/drm_displayid.h
index ec64d141f578..0ed9445b5482 100644
--- a/include/drm/drm_displayid.h
+++ b/include/drm/drm_displayid.h
@@ -26,35 +26,36 @@
 
 struct edid;
 
-#define DATA_BLOCK_PRODUCT_ID 0x00
-#define DATA_BLOCK_DISPLAY_PARAMETERS 0x01
-#define DATA_BLOCK_COLOR_CHARACTERISTICS 0x02
-#define DATA_BLOCK_TYPE_1_DETAILED_TIMING 0x03
-#define DATA_BLOCK_TYPE_2_DETAILED_TIMING 0x04
-#define DATA_BLOCK_TYPE_3_SHORT_TIMING 0x05
-#define DATA_BLOCK_TYPE_4_DMT_TIMING 0x06
-#define DATA_BLOCK_VESA_TIMING 0x07
-#define DATA_BLOCK_CEA_TIMING 0x08
-#define DATA_BLOCK_VIDEO_TIMING_RANGE 0x09
-#define DATA_BLOCK_PRODUCT_SERIAL_NUMBER 0x0a
-#define DATA_BLOCK_GP_ASCII_STRING 0x0b
-#define DATA_BLOCK_DISPLAY_DEVICE_DATA 0x0c
-#define DATA_BLOCK_INTERFACE_POWER_SEQUENCING 0x0d
-#define DATA_BLOCK_TRANSFER_CHARACTERISTICS 0x0e
-#define DATA_BLOCK_DISPLAY_INTERFACE 0x0f
-#define DATA_BLOCK_STEREO_DISPLAY_INTERFACE 0x10
-#define DATA_BLOCK_TILED_DISPLAY 0x12
-#define DATA_BLOCK_CTA 0x81
+/* DisplayID Structure v1r2 Data Blocks */
+#define DATA_BLOCK_PRODUCT_ID			0x00
+#define DATA_BLOCK_DISPLAY_PARAMETERS		0x01
+#define DATA_BLOCK_COLOR_CHARACTERISTICS	0x02
+#define DATA_BLOCK_TYPE_1_DETAILED_TIMING	0x03
+#define DATA_BLOCK_TYPE_2_DETAILED_TIMING	0x04
+#define DATA_BLOCK_TYPE_3_SHORT_TIMING		0x05
+#define DATA_BLOCK_TYPE_4_DMT_TIMING		0x06
+#define DATA_BLOCK_VESA_TIMING			0x07
+#define DATA_BLOCK_CEA_TIMING			0x08
+#define DATA_BLOCK_VIDEO_TIMING_RANGE		0x09
+#define DATA_BLOCK_PRODUCT_SERIAL_NUMBER	0x0a
+#define DATA_BLOCK_GP_ASCII_STRING		0x0b
+#define DATA_BLOCK_DISPLAY_DEVICE_DATA		0x0c
+#define DATA_BLOCK_INTERFACE_POWER_SEQUENCING	0x0d
+#define DATA_BLOCK_TRANSFER_CHARACTERISTICS	0x0e
+#define DATA_BLOCK_DISPLAY_INTERFACE		0x0f
+#define DATA_BLOCK_STEREO_DISPLAY_INTERFACE	0x10
+#define DATA_BLOCK_TILED_DISPLAY		0x12
+#define DATA_BLOCK_VENDOR_SPECIFIC		0x7f
+#define DATA_BLOCK_CTA				0x81
 
-#define DATA_BLOCK_VENDOR_SPECIFIC 0x7f
-
-#define PRODUCT_TYPE_EXTENSION 0
-#define PRODUCT_TYPE_TEST 1
-#define PRODUCT_TYPE_PANEL 2
-#define PRODUCT_TYPE_MONITOR 3
-#define PRODUCT_TYPE_TV 4
-#define PRODUCT_TYPE_REPEATER 5
-#define PRODUCT_TYPE_DIRECT_DRIVE 6
+/* DisplayID Structure v1r2 Product Type */
+#define PRODUCT_TYPE_EXTENSION			0
+#define PRODUCT_TYPE_TEST			1
+#define PRODUCT_TYPE_PANEL			2
+#define PRODUCT_TYPE_MONITOR			3
+#define PRODUCT_TYPE_TV				4
+#define PRODUCT_TYPE_REPEATER			5
+#define PRODUCT_TYPE_DIRECT_DRIVE		6
 
 struct displayid_header {
 	u8 rev;
-- 
2.20.1

