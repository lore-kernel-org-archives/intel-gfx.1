Return-Path: <SRS0=c2Tb=MM=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32729C636C8
	for <intel-gfx@archiver.kernel.org>; Tue, 20 Jul 2021 06:49:22 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03094610F7
	for <intel-gfx@archiver.kernel.org>; Tue, 20 Jul 2021 06:49:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 03094610F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 943586E1D2;
	Tue, 20 Jul 2021 06:49:21 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 210676E122
 for <intel-gfx@lists.freedesktop.org>; Tue, 20 Jul 2021 06:49:11 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10050"; a="232965315"
X-IronPort-AV: E=Sophos;i="5.84,254,1620716400"; d="scan'208";a="232965315"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2021 23:49:05 -0700
X-IronPort-AV: E=Sophos;i="5.84,254,1620716400"; d="scan'208";a="657368682"
Received: from unknown (HELO vandita-Z390-AORUS-ULTRA.iind.intel.com)
 ([10.190.238.8])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2021 23:49:04 -0700
From: Vandita Kulkarni <vandita.kulkarni@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue, 20 Jul 2021 12:19:05 +0530
Message-Id: <20210720064907.9771-2-vandita.kulkarni@intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210720064907.9771-1-vandita.kulkarni@intel.com>
References: <20210720064907.9771-1-vandita.kulkarni@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [v7 1/3] drm/i915/display: Add write permissions for
 fec support
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
Cc: Jani Nikula <jani.nikula@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Though there is a write option available on  fec_suport
debugfs file, so far it has been registering with read
permissions only.

Suggested-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Vandita Kulkarni <vandita.kulkarni@intel.com>
Reviewed-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
index 65832c4d962f..717d5624839d 100644
--- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
+++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
@@ -2434,7 +2434,7 @@ int intel_connector_debugfs_add(struct drm_connector *connector)
 	}
 
 	if ((DISPLAY_VER(dev_priv) >= 11 || IS_CANNONLAKE(dev_priv)) && ((connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort && !to_intel_connector(connector)->mst_port) || connector->connector_type == DRM_MODE_CONNECTOR_eDP))
-		debugfs_create_file("i915_dsc_fec_support", S_IRUGO, root,
+		debugfs_create_file("i915_dsc_fec_support", 0644, root,
 				    connector, &i915_dsc_fec_support_fops);
 
 	/* Legacy panels doesn't lpsp on any platform */
-- 
2.32.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
