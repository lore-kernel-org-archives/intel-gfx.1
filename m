Return-Path: <SRS0=u9zS=JF=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E674BC43460
	for <intel-gfx@archiver.kernel.org>; Thu,  8 Apr 2021 00:42:17 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A474961130
	for <intel-gfx@archiver.kernel.org>; Thu,  8 Apr 2021 00:42:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A474961130
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 863316E9BD;
	Thu,  8 Apr 2021 00:42:12 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75AD06E107
 for <intel-gfx@lists.freedesktop.org>; Thu,  8 Apr 2021 00:42:10 +0000 (UTC)
IronPort-SDR: cXTMEzkVyM3dqIYhEiy5gRhYRoqLUCEw48fp1oU7c8BNGuEBfflFLZq2lsW410+lg71a5nTBU0
 /iHlMR9++zEg==
X-IronPort-AV: E=McAfee;i="6000,8403,9947"; a="172900153"
X-IronPort-AV: E=Sophos;i="5.82,204,1613462400"; d="scan'208";a="172900153"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2021 17:42:09 -0700
IronPort-SDR: WD+ZRyoQEoBLfWY4qbgYtqqxcMTI2pvYdm5e8FTwkWOsnBIhMumXCL344djvIltlknBg6LIFjE
 y2ir5UjwSjbw==
X-IronPort-AV: E=Sophos;i="5.82,205,1613462400"; d="scan'208";a="519634211"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2021 17:42:09 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Wed,  7 Apr 2021 17:41:50 -0700
Message-Id: <20210408004200.984176-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210408004200.984176-1-lucas.demarchi@intel.com>
References: <20210408004200.984176-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 02/12] drm/i915: add macros for graphics and
 media versions
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

Like it was done in
commit 01eb15c9165e ("drm/i915: Add DISPLAY_VER() and related macros")
add the correspondent macros for graphics and media. Going forward we
will prefer checking the versions for the specific IPs (graphics, media
and display) rather than grouping everything under a "gen" version.

For consistency and to make the maintenance easier, it'd be preferred
not to mix the *GEN* macros with the new ones. For older platforms we
can simply consider that the previous "gen" number will extend to all
3 IPs. Then we can start replacing its use in the driver. Right now this
replacement is not done and only the infrastructure is put in place.
We also leave gen and gen_mask inside struct intel_device_info while
it's still being used throughout the code.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/i915_drv.h          | 17 ++++++++++++++++-
 drivers/gpu/drm/i915/i915_pci.c          |  7 ++++++-
 drivers/gpu/drm/i915/intel_device_info.h |  3 +++
 3 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 8c62bb2abd31..97cbd019f2e9 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -1234,9 +1234,24 @@ static inline struct drm_i915_private *pdev_to_i915(struct pci_dev *pdev)
 #define RUNTIME_INFO(dev_priv)	(&(dev_priv)->__runtime)
 #define DRIVER_CAPS(dev_priv)	(&(dev_priv)->caps)
 
-#define INTEL_GEN(dev_priv)	(INTEL_INFO(dev_priv)->gen)
 #define INTEL_DEVID(dev_priv)	(RUNTIME_INFO(dev_priv)->device_id)
 
+/*
+ * Deprecated: this will be replaced by individual IP checks:
+ * GRAPHICS_VER(), MEDIA_VER and DISPLAY_VER()
+ */
+#define INTEL_GEN(dev_priv)		(INTEL_INFO(dev_priv)->gen)
+
+#define GRAPHICS_VER(i915)		(INTEL_INFO(i915)->graphics_ver)
+#define IS_GRAPHICS_RANGE(i915, from, until) \
+	(GRAPHICS_VER(i915) >= (from) && GRAPHICS_VER(i915) <= (until))
+#define IS_GRAPHICS_VER(i915, v)	(GRAPHICS_VER(i915) == (v))
+
+#define MEDIA_VER(i915)			(INTEL_INFO(i915)->media_ver)
+#define IS_MEDIA_RANGE(i915, from, until) \
+	(MEDIA_VER(i915) >= (from) && MEDIA_VER(i915) <= (until))
+#define IS_MEDIA_VER(i915, v)		(MEDIA_VER(i915) == (v))
+
 #define DISPLAY_VER(i915)	(INTEL_INFO(i915)->display.ver)
 #define IS_DISPLAY_RANGE(i915, from, until) \
 	(DISPLAY_VER(i915) >= (from) && DISPLAY_VER(i915) <= (until))
diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index ce5cbeaf036d..97ab73276334 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -36,7 +36,12 @@
 #include "i915_selftest.h"
 
 #define PLATFORM(x) .platform = (x)
-#define GEN(x) .gen = (x), .gen_mask = BIT((x) - 1), .display.ver = (x)
+#define GEN(x) \
+	.gen_mask = BIT((x) - 1), \
+	.gen = (x), \
+	.graphics_ver = (x), \
+	.media_ver = (x), \
+	.display.ver = (x)
 
 #define I845_PIPE_OFFSETS \
 	.pipe_offsets = { \
diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/drm/i915/intel_device_info.h
index b16c75927a12..405883a8cc84 100644
--- a/drivers/gpu/drm/i915/intel_device_info.h
+++ b/drivers/gpu/drm/i915/intel_device_info.h
@@ -162,6 +162,9 @@ enum intel_ppgtt_type {
 struct intel_device_info {
 	u16 gen_mask;
 
+	u8 graphics_ver;
+	u8 media_ver;
+
 	u8 gen;
 	u8 gt; /* GT number, 0 if undefined */
 	intel_engine_mask_t platform_engine_mask; /* Engines supported by the HW */
-- 
2.31.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
