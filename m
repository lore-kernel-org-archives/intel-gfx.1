Return-Path: <SRS0=fe42=EH=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DA21C388F9
	for <intel-gfx@archiver.kernel.org>; Sun,  1 Nov 2020 10:13:56 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9F9120719
	for <intel-gfx@archiver.kernel.org>; Sun,  1 Nov 2020 10:13:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9F9120719
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB18D6EA85;
	Sun,  1 Nov 2020 10:13:48 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32BD16EA82;
 Sun,  1 Nov 2020 10:13:47 +0000 (UTC)
IronPort-SDR: TojTsuaWbzmpZ98yL/8oHEIHQa9M7K9k32Ic+/CXbhJ46jANF8TtPhOT0kNulj/ZYogd+jWxUX
 0WzuXUZssoMw==
X-IronPort-AV: E=McAfee;i="6000,8403,9791"; a="166190487"
X-IronPort-AV: E=Sophos;i="5.77,441,1596524400"; d="scan'208";a="166190487"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2020 02:13:47 -0800
IronPort-SDR: iDi9r1Xp2kcQ/r0TZqBKctMNuqRguFrx4xOgzdNwgr7hjxv6HYgbOpumvFPg+1/9oHonzXTfuB
 +vuDMqg2XhZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,441,1596524400"; d="scan'208";a="425738545"
Received: from linux-akn.iind.intel.com ([10.223.34.148])
 by fmsmga001.fm.intel.com with ESMTP; 01 Nov 2020 02:13:45 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Sun,  1 Nov 2020 15:36:45 +0530
Message-Id: <20201101100657.12087-2-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201101100657.12087-1-ankit.k.nautiyal@intel.com>
References: <20201101100657.12087-1-ankit.k.nautiyal@intel.com>
Subject: [Intel-gfx] [PATCH v2 01/13] drm/edid: Add additional HFVSDB fields
 for HDMI2.1
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

From: Swati Sharma <swati2.sharma@intel.com>

The HDMI2.1 extends HFVSDB (HDMI Forum Vendor Specific
Data block) to have fields related to newly defined methods of FRL
(Fixed Rate Link) levels, number of lanes supported, DSC Color bit
depth, VRR min/max, FVA (Fast Vactive), ALLM etc.

This patch adds the new HFVSDB fields that are required for
HDMI2.1.

v2: Minor fixes + consistent naming for DPCD register masks
(Uma Shankar)

Signed-off-by: Sharma, Swati2 <swati2.sharma@intel.com>
Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 include/drm/drm_edid.h | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index b27a0e2169c8..a6ca992e105d 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -229,6 +229,36 @@ struct detailed_timing {
 				    DRM_EDID_YCBCR420_DC_36 | \
 				    DRM_EDID_YCBCR420_DC_30)
 
+/* HDMI 2.1 additional fields */
+#define DRM_EDID_MAX_FRL_RATE_MASK		0xf0
+#define DRM_EDID_FAPA_START_LOCATION		(1 << 0)
+#define DRM_EDID_ALLM				(1 << 1)
+#define DRM_EDID_FVA				(1 << 2)
+
+/* Deep Color specific */
+#define DRM_EDID_DC_30BIT_420			(1 << 0)
+#define DRM_EDID_DC_36BIT_420			(1 << 1)
+#define DRM_EDID_DC_48BIT_420			(1 << 2)
+
+/* VRR specific */
+#define DRM_EDID_CNMVRR				(1 << 3)
+#define DRM_EDID_CINEMA_VRR			(1 << 4)
+#define DRM_EDID_MDELTA				(1 << 5)
+#define DRM_EDID_VRR_MAX_UPPER_MASK		0xc0
+#define DRM_EDID_VRR_MAX_LOWER_MASK		0xff
+#define DRM_EDID_VRR_MIN_MASK			0x3f
+
+/* DSC specific */
+#define DRM_EDID_DSC_10BPC			(1 << 0)
+#define DRM_EDID_DSC_12BPC			(1 << 1)
+#define DRM_EDID_DSC_16BPC			(1 << 2)
+#define DRM_EDID_DSC_ALL_BPP			(1 << 3)
+#define DRM_EDID_DSC_NATIVE_420			(1 << 6)
+#define DRM_EDID_DSC_1P2			(1 << 7)
+#define DRM_EDID_DSC_MAX_FRL_RATE_MASK		0xf0
+#define DRM_EDID_DSC_MAX_SLICES			0xf
+#define DRM_EDID_DSC_TOTAL_CHUNK_KBYTES		0x3f
+
 /* ELD Header Block */
 #define DRM_ELD_HEADER_BLOCK_SIZE	4
 
-- 
2.17.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
