Return-Path: <SRS0=lQef=JL=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 891F1C43460
	for <intel-gfx@archiver.kernel.org>; Wed, 14 Apr 2021 11:50:45 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30A4E613C0
	for <intel-gfx@archiver.kernel.org>; Wed, 14 Apr 2021 11:50:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30A4E613C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 653016E491;
	Wed, 14 Apr 2021 11:50:44 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31A996E42C
 for <Intel-gfx@lists.freedesktop.org>; Wed, 14 Apr 2021 11:50:43 +0000 (UTC)
IronPort-SDR: pgCizdY4QsAPtbCu20xjzpMEILXHl2nGzyB3RTV1z4oFOygqJSbmZfAgo7TGTpVqBRQw5lIlJU
 OBcAIzp/KtDw==
X-IronPort-AV: E=McAfee;i="6200,9189,9953"; a="194732244"
X-IronPort-AV: E=Sophos;i="5.82,222,1613462400"; d="scan'208";a="194732244"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2021 04:50:42 -0700
IronPort-SDR: my01fhsAdvbz8UXBNXY51LFDwzPxDHSj/Orr/Ezg/Oj5q6dfU0RXeIlKxUQVJYAWGvB4GtQOTR
 klu4hlN5i4NQ==
X-IronPort-AV: E=Sophos;i="5.82,222,1613462400"; d="scan'208";a="521965107"
Received: from bdebhal-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.205.119])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2021 04:50:41 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Date: Wed, 14 Apr 2021 12:50:02 +0100
Message-Id: <20210414115028.168504-3-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210414115028.168504-1-tvrtko.ursulin@linux.intel.com>
References: <20210414115028.168504-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [RFC 02/28] drm/i915: Make I845G platform support
 optional
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

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/i915/Kconfig.platforms | 7 +++++++
 drivers/gpu/drm/i915/i915_drv.h        | 2 +-
 drivers/gpu/drm/i915/i915_pci.c        | 4 ++++
 3 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/Kconfig.platforms b/drivers/gpu/drm/i915/Kconfig.platforms
index f3949fff21e9..cf06ed3b0727 100644
--- a/drivers/gpu/drm/i915/Kconfig.platforms
+++ b/drivers/gpu/drm/i915/Kconfig.platforms
@@ -4,3 +4,10 @@ config DRM_I915_PLATFORM_INTEL_I830
 	depends on DRM_I915
 	help
 	  Include support for Intel i830 platform.
+
+config DRM_I915_PLATFORM_INTEL_I845G
+	bool "Intel i845G platform support"
+	default y
+	depends on DRM_I915
+	help
+	  Include support for Intel i845G platform.
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 6ea33c92ccef..59231e500f78 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -2579,7 +2579,7 @@ intel_info(const struct drm_i915_private *dev_priv)
 	(IS_ENABLED(CONFIG_DRM_I915_PLATFORM_##p) && IS_PLATFORM(dev_priv, p))
 
 #define IS_I830(dev_priv)	IS_OPT_PLATFORM(dev_priv, INTEL_I830)
-#define IS_I845G(dev_priv)	IS_PLATFORM(dev_priv, INTEL_I845G)
+#define IS_I845G(dev_priv)	IS_OPT_PLATFORM(dev_priv, INTEL_I845G)
 #define IS_I85X(dev_priv)	IS_PLATFORM(dev_priv, INTEL_I85X)
 #define IS_I865G(dev_priv)	IS_PLATFORM(dev_priv, INTEL_I865G)
 #define IS_I915G(dev_priv)	IS_PLATFORM(dev_priv, INTEL_I915G)
diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index 81573073dceb..d98c35d2ff9d 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -83,10 +83,12 @@ static const struct intel_device_info intel_i830_info = {
 };
 #endif
 
+#ifdef CONFIG_DRM_I915_PLATFORM_INTEL_I845G
 static const struct intel_device_info intel_i845g_info = {
 	GEN2_FEATURES,
 	.platform = INTEL_I845G,
 };
+#endif
 
 static const struct intel_device_info intel_i85x_info = {
 	GEN2_FEATURES,
@@ -604,7 +606,9 @@ static const struct pci_device_id pciidlist[] = {
 #ifdef CONFIG_DRM_I915_PLATFORM_INTEL_I830
 	INTEL_I830_IDS(&intel_i830_info),
 #endif
+#ifdef CONFIG_DRM_I915_PLATFORM_INTEL_I845G
 	INTEL_I845G_IDS(&intel_i845g_info),
+#endif
 	INTEL_I85X_IDS(&intel_i85x_info),
 	INTEL_I865G_IDS(&intel_i865g_info),
 	INTEL_I915G_IDS(&intel_i915g_info),
-- 
2.27.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
