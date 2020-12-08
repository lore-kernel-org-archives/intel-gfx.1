Return-Path: <SRS0=GdbL=FM=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5432C4361B
	for <intel-gfx@archiver.kernel.org>; Tue,  8 Dec 2020 10:29:40 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A58223A9D
	for <intel-gfx@archiver.kernel.org>; Tue,  8 Dec 2020 10:29:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A58223A9D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1C856E0C2;
	Tue,  8 Dec 2020 10:29:39 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 839986E954;
 Tue,  8 Dec 2020 10:29:38 +0000 (UTC)
IronPort-SDR: 0sMvCHy6fmZFawmrJgW2/8CdwuwLEaB5HRNO3JNAPu04FCLuo0hCO0mNqtoHWa+cp05bcLKMmo
 HLnWKu9EmFdQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9828"; a="173981794"
X-IronPort-AV: E=Sophos;i="5.78,402,1599548400"; d="scan'208";a="173981794"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 02:29:35 -0800
IronPort-SDR: 28Slnwr2AG/p2Hfbj97/zPGi9bO1QiMahWuUJasINXwgDGZ/u+fiNo3svAe42X5deLbKqwU8Lk
 KOUskNzxTSqA==
X-IronPort-AV: E=Sophos;i="5.78,402,1599548400"; d="scan'208";a="317737777"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO localhost)
 ([10.213.246.199])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 02:29:33 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Date: Tue,  8 Dec 2020 12:29:09 +0200
Message-Id: <ed11c982872c7c3bef4f22d13dfa029e18e980a9.1607422863.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1607422863.git.jani.nikula@intel.com>
References: <cover.1607422863.git.jani.nikula@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH 3/8] drm/i915/gvt: make gtt.h self-contained
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Add necessary #includes and forward declarations to make the header
compile on its own.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/Makefile  |  1 -
 drivers/gpu/drm/i915/gvt/gtt.h | 11 ++++++++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index c22fff634d18..33fdcd81e352 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -284,7 +284,6 @@ obj-$(CONFIG_DRM_I915_GVT_KVMGT) += gvt/kvmgt.o
 # exclude some broken headers from the test coverage
 no-header-test := \
 	display/intel_vbt_defs.h \
-	gvt/gtt.h \
 	gvt/gvt.h \
 	gvt/interrupt.h \
 	gvt/mmio_context.h \
diff --git a/drivers/gpu/drm/i915/gvt/gtt.h b/drivers/gpu/drm/i915/gvt/gtt.h
index b0e173f2d990..3bf45672ef98 100644
--- a/drivers/gpu/drm/i915/gvt/gtt.h
+++ b/drivers/gpu/drm/i915/gvt/gtt.h
@@ -34,10 +34,19 @@
 #ifndef _GVT_GTT_H_
 #define _GVT_GTT_H_
 
-#define I915_GTT_PAGE_SHIFT         12
+#include <linux/kernel.h>
+#include <linux/kref.h>
+#include <linux/mutex.h>
+#include <linux/radix-tree.h>
+
+#include "gt/intel_gtt.h"
 
+struct intel_gvt;
+struct intel_vgpu;
 struct intel_vgpu_mm;
 
+#define I915_GTT_PAGE_SHIFT         12
+
 #define INTEL_GVT_INVALID_ADDR (~0UL)
 
 struct intel_gvt_gtt_entry {
-- 
2.20.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
