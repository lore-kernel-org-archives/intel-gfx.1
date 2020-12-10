Return-Path: <SRS0=CSZM=FO=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFAD3C433FE
	for <intel-gfx@archiver.kernel.org>; Thu, 10 Dec 2020 06:40:51 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3D0B23C44
	for <intel-gfx@archiver.kernel.org>; Thu, 10 Dec 2020 06:40:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A3D0B23C44
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2512C6E9E6;
	Thu, 10 Dec 2020 06:40:51 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16C1A6E9E6;
 Thu, 10 Dec 2020 06:40:49 +0000 (UTC)
IronPort-SDR: lzob+Ye20Bb9eC8T91Wpej7lTKyYciAAjSkrnyKB0Ai/dO15kLC8N06L03/4mc7eGHGVfAHb/0
 fQ8MLO+EcarQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9830"; a="174322216"
X-IronPort-AV: E=Sophos;i="5.78,407,1599548400"; d="scan'208";a="174322216"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2020 22:40:48 -0800
IronPort-SDR: 713aYsPcg7mi7jlRNKjd5N2q0ESW0e7d5TQdbTB2BguP2CVje8OkvExsIisiWV3+9pwEIzTWAj
 jXnZEhPNE3xw==
X-IronPort-AV: E=Sophos;i="5.78,407,1599548400"; d="scan'208";a="318854419"
Received: from genxfsim-desktop.iind.intel.com ([10.223.74.178])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2020 22:40:45 -0800
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Date: Thu, 10 Dec 2020 11:56:31 +0530
Message-Id: <20201210062640.11783-10-anshuman.gupta@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201210062640.11783-1-anshuman.gupta@intel.com>
References: <20201210062640.11783-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v7 09/18] drm/i915/hdcp: Enable Gen12 HDCP 1.4
 DP MST support
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
Cc: jani.nikula@intel.com, seanpaul@chromium.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Enable HDCP 1.4 over DP MST for Gen12.

v2:
- Enable HDCP for <= Gen12 platforms. [Ram]

Cc: Ramalingam C <ramalingam.c@intel.com>
Tested-by: Karthik B S <karthik.b.s@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 47beb442094f..ae24e1af49be 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -829,12 +829,10 @@ static struct drm_connector *intel_dp_add_mst_connector(struct drm_dp_mst_topolo
 	intel_attach_force_audio_property(connector);
 	intel_attach_broadcast_rgb_property(connector);
 
-
-	/* TODO: Figure out how to make HDCP work on GEN12+ */
-	if (INTEL_GEN(dev_priv) < 12) {
+	if (INTEL_GEN(dev_priv) <= 12) {
 		ret = intel_dp_init_hdcp(dig_port, intel_connector);
 		if (ret)
-			DRM_DEBUG_KMS("HDCP init failed, skipping.\n");
+			drm_dbg_kms(&dev_priv->drm, "HDCP init failed, skipping.\n");
 	}
 
 	/*
-- 
2.26.2

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
