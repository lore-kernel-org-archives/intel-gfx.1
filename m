Return-Path: <SRS0=HG33=FU=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC00DC0018C
	for <intel-gfx@archiver.kernel.org>; Wed, 16 Dec 2020 05:37:42 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AABB223123
	for <intel-gfx@archiver.kernel.org>; Wed, 16 Dec 2020 05:37:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AABB223123
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F03989C5E;
	Wed, 16 Dec 2020 05:37:38 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90D1F89885;
 Wed, 16 Dec 2020 05:37:37 +0000 (UTC)
IronPort-SDR: nqupXATCF+aDoIoqU6HtM/dK3Dr5fdY2Sswv3rRsL1K95ev99314c5MEr6KVnZbRZhbt3Dkhua
 L9bVglwzuo9A==
X-IronPort-AV: E=McAfee;i="6000,8403,9836"; a="172437295"
X-IronPort-AV: E=Sophos;i="5.78,423,1599548400"; d="scan'208";a="172437295"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2020 21:37:37 -0800
IronPort-SDR: qFjOE35Mp9yfbaYEDq3GQZ2O534horzVZg2eAp7kxxmN8fu9E3+XHWoVhl2wSjihxmNmi9dYPl
 x2cuuVeHAgnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,423,1599548400"; d="scan'208";a="556647050"
Received: from linux-akn.iind.intel.com ([10.223.34.148])
 by fmsmga006.fm.intel.com with ESMTP; 15 Dec 2020 21:37:34 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Wed, 16 Dec 2020 11:01:08 +0530
Message-Id: <20201216053121.18819-3-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201216053121.18819-1-ankit.k.nautiyal@intel.com>
References: <20201216053121.18819-1-ankit.k.nautiyal@intel.com>
Subject: [Intel-gfx] [PATCH v5 02/15] drm/edid: Parse MAX_FRL field from
 HFVSDB block
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

From: Swati Sharma <swati2.sharma@intel.com>

This patch parses MAX_FRL field to get the MAX rate in Gbps that
the HDMI 2.1 panel can support in FRL mode. Source need this
field to determine the optimal rate between the source and sink
during FRL training.

v2: Fixed minor bugs, and removed extra wrapper function (Uma Shankar)

Signed-off-by: Sharma, Swati2 <swati2.sharma@intel.com>
Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/drm_edid.c  | 44 +++++++++++++++++++++++++++++++++++++
 include/drm/drm_connector.h |  6 +++++
 2 files changed, 50 insertions(+)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 74f5a3197214..e657c321d9e4 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -4851,6 +4851,41 @@ static void drm_parse_vcdb(struct drm_connector *connector, const u8 *db)
 		info->rgb_quant_range_selectable = true;
 }
 
+static
+void drm_get_max_frl_rate(int max_frl_rate, u8 *max_lanes, u8 *max_rate_per_lane)
+{
+	switch (max_frl_rate) {
+	case 1:
+		*max_lanes = 3;
+		*max_rate_per_lane = 3;
+		break;
+	case 2:
+		*max_lanes = 3;
+		*max_rate_per_lane = 6;
+		break;
+	case 3:
+		*max_lanes = 4;
+		*max_rate_per_lane = 6;
+		break;
+	case 4:
+		*max_lanes = 4;
+		*max_rate_per_lane = 8;
+		break;
+	case 5:
+		*max_lanes = 4;
+		*max_rate_per_lane = 10;
+		break;
+	case 6:
+		*max_lanes = 4;
+		*max_rate_per_lane = 12;
+		break;
+	case 0:
+	default:
+		*max_lanes = 0;
+		*max_rate_per_lane = 0;
+	}
+}
+
 static void drm_parse_ycbcr420_deep_color_info(struct drm_connector *connector,
 					       const u8 *db)
 {
@@ -4904,6 +4939,15 @@ static void drm_parse_hdmi_forum_vsdb(struct drm_connector *connector,
 		}
 	}
 
+	if (hf_vsdb[7]) {
+		u8 max_frl_rate;
+
+		DRM_DEBUG_KMS("hdmi_21 sink detected. parsing edid\n");
+		max_frl_rate = (hf_vsdb[7] & DRM_EDID_MAX_FRL_RATE_MASK) >> 4;
+		drm_get_max_frl_rate(max_frl_rate, &hdmi->max_lanes,
+				&hdmi->max_frl_rate_per_lane);
+	}
+
 	drm_parse_ycbcr420_deep_color_info(connector, hf_vsdb);
 }
 
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index fcdc58d8b88b..1a3b4776b458 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -207,6 +207,12 @@ struct drm_hdmi_info {
 
 	/** @y420_dc_modes: bitmap of deep color support index */
 	u8 y420_dc_modes;
+
+	/** @max_frl_rate_per_lane: support fixed rate link */
+	u8 max_frl_rate_per_lane;
+
+	/** @max_lanes: supported by sink */
+	u8 max_lanes;
 };
 
 /**
-- 
2.17.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
