Return-Path: <SRS0=1U3p=FF=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B993AC83014
	for <intel-gfx@archiver.kernel.org>; Tue,  1 Dec 2020 23:58:45 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63C45206DF
	for <intel-gfx@archiver.kernel.org>; Tue,  1 Dec 2020 23:58:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 63C45206DF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D4E66E9C3;
	Tue,  1 Dec 2020 23:58:29 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C24B6E99C
 for <Intel-gfx@lists.freedesktop.org>; Tue,  1 Dec 2020 23:58:24 +0000 (UTC)
IronPort-SDR: PZ6pvS1wFMKXOIPZITyeVr22ruuigpTTTbVpZ3pOvjVNj7eThEaUWbNxsOSUoKpYBbSm8g0Xt4
 ZnCtw02oAoDA==
X-IronPort-AV: E=McAfee;i="6000,8403,9822"; a="191136817"
X-IronPort-AV: E=Sophos;i="5.78,385,1599548400"; d="scan'208";a="191136817"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2020 15:58:22 -0800
IronPort-SDR: eUQOPm5IAP0X6fObU8slKJLSjDbawGO7TIOZ/+hQGOU0eSHD4g5SAvOVUAJVZpaH1vNg5VGqxI
 JkyYd7CxfZLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,385,1599548400"; d="scan'208";a="315897597"
Received: from sean-virtualbox.fm.intel.com ([10.105.158.96])
 by fmsmga007.fm.intel.com with ESMTP; 01 Dec 2020 15:58:22 -0800
From: "Huang, Sean Z" <sean.z.huang@intel.com>
To: Intel-gfx@lists.freedesktop.org
Date: Tue,  1 Dec 2020 15:57:42 -0800
Message-Id: <20201201235747.26017-22-sean.z.huang@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201201235747.26017-1-sean.z.huang@intel.com>
References: <20201201235747.26017-1-sean.z.huang@intel.com>
Subject: [Intel-gfx] [RFC-v3 21/26] drm/i915/pxp: Expose session state for
 display protection flip
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Implement the intel_pxp_gem_object_status() to allow i915 display
querying the current PXP session state. In the design, display
should not perform protection flip on the protected buffers if
there is no PXP session alive.

Signed-off-by: Huang, Sean Z <sean.z.huang@intel.com>
---
 drivers/gpu/drm/i915/pxp/intel_pxp.c | 8 ++++++++
 drivers/gpu/drm/i915/pxp/intel_pxp.h | 7 +++++++
 2 files changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.c b/drivers/gpu/drm/i915/pxp/intel_pxp.c
index 8134b39c7419..90e6766991c5 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp.c
@@ -326,3 +326,11 @@ void intel_pxp_irq_handler(struct intel_gt *gt, u16 iir)
 	i915->pxp.current_events |= events;
 	schedule_work(&i915->pxp.irq_work);
 }
+
+bool intel_pxp_gem_object_status(struct drm_i915_private *i915)
+{
+	if (i915->pxp.ctx && i915->pxp.ctx->flag_display_hm_surface_keys)
+		return true;
+	else
+		return false;
+}
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.h b/drivers/gpu/drm/i915/pxp/intel_pxp.h
index 818e79e9caca..7556ad5c7904 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp.h
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp.h
@@ -116,6 +116,8 @@ int i915_pxp_global_terminate_complete_callback(struct drm_i915_private *i915);
 
 int intel_pxp_init(struct drm_i915_private *i915);
 void intel_pxp_uninit(struct drm_i915_private *i915);
+
+bool intel_pxp_gem_object_status(struct drm_i915_private *i915);
 #else
 static inline int i915_pxp_ops_ioctl(struct drm_device *dev, void *data, struct drm_file *drmfile)
 {
@@ -153,6 +155,11 @@ static inline int intel_pxp_init(struct drm_i915_private *i915)
 static inline void intel_pxp_uninit(struct drm_i915_private *i915)
 {
 }
+
+static inline bool intel_pxp_gem_object_status(struct drm_i915_private *i915)
+{
+	return false;
+}
 #endif
 
 #endif /* __INTEL_PXP_PM_H__ */
-- 
2.17.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
