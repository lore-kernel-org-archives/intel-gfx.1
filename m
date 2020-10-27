Return-Path: <SRS0=9UyP=EC=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ECABC4363A
	for <intel-gfx@archiver.kernel.org>; Tue, 27 Oct 2020 19:28:54 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 493DA20756
	for <intel-gfx@archiver.kernel.org>; Tue, 27 Oct 2020 19:28:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 493DA20756
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35B2A6EC29;
	Tue, 27 Oct 2020 19:28:50 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 702056EC23
 for <intel-gfx@lists.freedesktop.org>; Tue, 27 Oct 2020 19:28:47 +0000 (UTC)
IronPort-SDR: lGNoBLyjkBnS5tYs3ubyelRTp/gCH319PsRVnBzpVP2mNnMh3hWltRowP9Zf51yQoDBX4+it30
 YRzUsVb2HQGg==
X-IronPort-AV: E=McAfee;i="6000,8403,9787"; a="147433127"
X-IronPort-AV: E=Sophos;i="5.77,424,1596524400"; d="scan'208";a="147433127"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2020 12:28:46 -0700
IronPort-SDR: A5crVqCrRx47murUYjLxXxe7Zy2/jk7aDa2/MOk80RW+MqYAk+GhoIJ0t8CaKyZH3ZXjARvFRE
 hKv2u6VFN26Q==
X-IronPort-AV: E=Sophos;i="5.77,424,1596524400"; d="scan'208";a="318338890"
Received: from labuser-z97x-ud5h.jf.intel.com ([10.165.21.211])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 27 Oct 2020 12:28:46 -0700
From: Manasi Navare <manasi.d.navare@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue, 27 Oct 2020 12:30:33 -0700
Message-Id: <20201027193034.28721-5-manasi.d.navare@intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20201027193034.28721-1-manasi.d.navare@intel.com>
References: <20201027193034.28721-1-manasi.d.navare@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 4/5] drm/i915/dp: Call hw.adjusted_mode as
 hw_mode for clarity
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

No functional changes just use hw_mode to retrive
hw.adjusted_mode during HW state readout for clarity
in bigjoiner case.

Signed-off-by: Manasi Navare <manasi.d.navare@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 22 +++++++++++---------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index cabda5a02e9e..b000dd68977f 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -9119,20 +9119,22 @@ static void intel_get_pipe_src_size(struct intel_crtc *crtc,
 void intel_mode_from_pipe_config(struct drm_display_mode *mode,
 				 struct intel_crtc_state *pipe_config)
 {
-	mode->hdisplay = pipe_config->hw.adjusted_mode.crtc_hdisplay;
-	mode->htotal = pipe_config->hw.adjusted_mode.crtc_htotal;
-	mode->hsync_start = pipe_config->hw.adjusted_mode.crtc_hsync_start;
-	mode->hsync_end = pipe_config->hw.adjusted_mode.crtc_hsync_end;
+	struct drm_display_mode *hw_mode = &pipe_config->hw.adjusted_mode;
 
-	mode->vdisplay = pipe_config->hw.adjusted_mode.crtc_vdisplay;
-	mode->vtotal = pipe_config->hw.adjusted_mode.crtc_vtotal;
-	mode->vsync_start = pipe_config->hw.adjusted_mode.crtc_vsync_start;
-	mode->vsync_end = pipe_config->hw.adjusted_mode.crtc_vsync_end;
+	mode->hdisplay = hw_mode->crtc_hdisplay;
+	mode->htotal = hw_mode->crtc_htotal;
+	mode->hsync_start = hw_mode->crtc_hsync_start;
+	mode->hsync_end = hw_mode->crtc_hsync_end;
 
-	mode->flags = pipe_config->hw.adjusted_mode.flags;
+	mode->vdisplay = hw_mode->crtc_vdisplay;
+	mode->vtotal = hw_mode->crtc_vtotal;
+	mode->vsync_start = hw_mode->crtc_vsync_start;
+	mode->vsync_end = hw_mode->crtc_vsync_end;
+
+	mode->flags = hw_mode->flags;
 	mode->type = DRM_MODE_TYPE_DRIVER;
 
-	mode->clock = pipe_config->hw.adjusted_mode.crtc_clock;
+	mode->clock = hw_mode->crtc_clock;
 
 	drm_mode_set_name(mode);
 }
-- 
2.19.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
