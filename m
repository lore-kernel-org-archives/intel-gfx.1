Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8CD606A320
	for <intel-gfx@archiver.kernel.org>; Fri, 20 Nov 2026 15:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jiO0yq6X
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C888B10E225;
	Fri, 20 Nov 2026 15:57:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28FF010E225
 for <intel-gfx@lists.freedesktop.org>; Fri, 20 Nov 2026 15:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795190265; x=1826726265;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/evWTXyXGcyosonHpgOJI7nSmmCbx+uPiZnCcApp5ow=;
 b=jiO0yq6XN2sneorxN3S2wSfOnyrF8E2P+PbvewhUZ/6IJTEvWrzrjssF
 wKkyTeTppBf9ylJ3i91foCTqntj6/Kk/zEGf04kUMexgAHcrzUzRvITxk
 wgCGfgAy5EIKs7qKr+qwnjxpqoEC+N25n7MkLx4NBbiHu7190mhm84Bb9
 zeleSbPXc+RIGPh80SPnmjFOzOMVrN2K3LZ28t09lin4WzyKh5RMWnuZa
 JuZpolGEcv4bTQDJK1zDc6g1+6mOQqJ87DlfOLYG1W7oY3J43PYwIeZ8F
 AXWs0F0O0GatyBH/2JHPyJZg0t1Y5pHbRxjkiium76HwKPM+f7cTg6+dK w==;
X-CSE-ConnectionGUID: uVKBqmyEQSmXRmGntsg5eA==
X-CSE-MsgGUID: uKshqiItS1mD+NodSZCTpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="3955177"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="3955177"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 07:57:44 -0800
X-CSE-ConnectionGUID: wFx4roQ8SYirz+ZdN++WBw==
X-CSE-MsgGUID: OC2RHHl9Tm+7p2ZIrSNTlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; d="scan'208";a="10673606"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.250])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 07:57:43 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 2/2] drm/i915/gvt: Descend to GVT Makefile through kbuild,
 not include
Date: Fri, 20 Nov 2026 17:57:34 +0200
Message-ID: <20261120155734.259742-2-jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261120155734.259742-1-jani.nikula@intel.com>
References: <20261120155734.259742-1-jani.nikula@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Treat the gvt/ subdirectory and Makefile like a regular kernel driver
directory, and descend to it through kbuild, not Makefile include.

The main change is that the resulting kvmgt.ko is also placed in the
gvt/ subdirectory in the build directory.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/Makefile     |  4 +--
 drivers/gpu/drm/i915/gvt/Makefile | 48 ++++++++++++++++---------------
 2 files changed, 27 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index d4e7764621e1..ba7eecfffdca 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -433,10 +433,10 @@ i915-y += \
 i915-$(CONFIG_DRM_I915_GVT) += \
 	intel_gvt.o \
 	intel_gvt_mmio_table.o
-include $(src)/gvt/Makefile
 
 obj-$(CONFIG_DRM_I915) += i915.o
-obj-$(CONFIG_DRM_I915_GVT_KVMGT) += kvmgt.o
+
+obj-$(CONFIG_DRM_I915_GVT_KVMGT) += gvt/
 
 # kernel-doc test
 #
diff --git a/drivers/gpu/drm/i915/gvt/Makefile b/drivers/gpu/drm/i915/gvt/Makefile
index 47f4f6f43c15..dfbf813f672c 100644
--- a/drivers/gpu/drm/i915/gvt/Makefile
+++ b/drivers/gpu/drm/i915/gvt/Makefile
@@ -1,25 +1,27 @@
 # SPDX-License-Identifier: GPL-2.0
 
-kvmgt-$(CONFIG_DRM_I915_GVT) += \
-	gvt/aperture_gm.o \
-	gvt/cfg_space.o \
-	gvt/cmd_parser.o \
-	gvt/debugfs.o \
-	gvt/display.o \
-	gvt/dmabuf.o \
-	gvt/edid.o \
-	gvt/execlist.o \
-	gvt/fb_decoder.o \
-	gvt/firmware.o \
-	gvt/gtt.o \
-	gvt/handlers.o \
-	gvt/interrupt.o \
-	gvt/kvmgt_module.o \
-	gvt/mmio.o \
-	gvt/mmio_context.o \
-	gvt/opregion.o \
-	gvt/page_track.o \
-	gvt/sched_policy.o \
-	gvt/scheduler.o \
-	gvt/trace_points.o \
-	gvt/vgpu.o
+kvmgt-y += \
+	aperture_gm.o \
+	cfg_space.o \
+	cmd_parser.o \
+	debugfs.o \
+	display.o \
+	dmabuf.o \
+	edid.o \
+	execlist.o \
+	fb_decoder.o \
+	firmware.o \
+	gtt.o \
+	handlers.o \
+	interrupt.o \
+	kvmgt_module.o \
+	mmio.o \
+	mmio_context.o \
+	opregion.o \
+	page_track.o \
+	sched_policy.o \
+	scheduler.o \
+	trace_points.o \
+	vgpu.o
+
+obj-$(CONFIG_DRM_I915_GVT_KVMGT) += kvmgt.o
-- 
2.47.3

