Return-Path: <SRS0=+Lzr=GP=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 011E6C433DB
	for <intel-gfx@archiver.kernel.org>; Tue, 12 Jan 2021 16:43:22 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CC7223109
	for <intel-gfx@archiver.kernel.org>; Tue, 12 Jan 2021 16:43:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9CC7223109
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC8F289C0A;
	Tue, 12 Jan 2021 16:43:20 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D88D89C0A
 for <intel-gfx@lists.freedesktop.org>; Tue, 12 Jan 2021 16:43:20 +0000 (UTC)
IronPort-SDR: Vtm9kt+URDogz4OApkdEA+BMC6Gs19WgfrOBK23eRGQZonCMTXxXIB4K6ksMLYmpTPsZfsWQM7
 b9SfLyma9mvg==
X-IronPort-AV: E=McAfee;i="6000,8403,9862"; a="177293997"
X-IronPort-AV: E=Sophos;i="5.79,341,1602572400"; d="scan'208";a="177293997"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2021 08:43:17 -0800
IronPort-SDR: 3KqsjR681ieS7aiQECtZzCguQuLLD511XAnxyHSDfxFpHlNFAXH7sDcev3EVS055xG2H7tKfdj
 hLju5QzoaQ8g==
X-IronPort-AV: E=Sophos;i="5.79,341,1602572400"; d="scan'208";a="381488037"
Received: from epetresx-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.252.6.143])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2021 08:43:16 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue, 12 Jan 2021 16:43:00 +0000
Message-Id: <20210112164300.356524-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH] drm/i915: move region_lmem under gt
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
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Device local-memory should be thought of as part the GT, which means it
should also sit under gt/.

Suggested-by: Chris Wilson <chris@chris-wilson.co.uk>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/i915/Makefile                     | 2 +-
 drivers/gpu/drm/i915/{ => gt}/intel_region_lmem.c | 0
 drivers/gpu/drm/i915/{ => gt}/intel_region_lmem.h | 0
 drivers/gpu/drm/i915/i915_drv.h                   | 2 +-
 4 files changed, 2 insertions(+), 2 deletions(-)
 rename drivers/gpu/drm/i915/{ => gt}/intel_region_lmem.c (100%)
 rename drivers/gpu/drm/i915/{ => gt}/intel_region_lmem.h (100%)

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 48f82c354611..d6ac946d0407 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -110,6 +110,7 @@ gt-y += \
 	gt/intel_mocs.o \
 	gt/intel_ppgtt.o \
 	gt/intel_rc6.o \
+	gt/intel_region_lmem.o \
 	gt/intel_renderstate.o \
 	gt/intel_reset.o \
 	gt/intel_ring.o \
@@ -170,7 +171,6 @@ i915-y += \
 	  i915_scheduler.o \
 	  i915_trace_points.o \
 	  i915_vma.o \
-	  intel_region_lmem.o \
 	  intel_wopcm.o
 
 # general-purpose microcontroller (GuC) support
diff --git a/drivers/gpu/drm/i915/intel_region_lmem.c b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
similarity index 100%
rename from drivers/gpu/drm/i915/intel_region_lmem.c
rename to drivers/gpu/drm/i915/gt/intel_region_lmem.c
diff --git a/drivers/gpu/drm/i915/intel_region_lmem.h b/drivers/gpu/drm/i915/gt/intel_region_lmem.h
similarity index 100%
rename from drivers/gpu/drm/i915/intel_region_lmem.h
rename to drivers/gpu/drm/i915/gt/intel_region_lmem.h
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 7a2b6ac04068..e3d58299b323 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -81,6 +81,7 @@
 
 #include "gt/intel_engine.h"
 #include "gt/intel_gt_types.h"
+#include "gt/intel_region_lmem.h"
 #include "gt/intel_workarounds.h"
 #include "gt/uc/intel_uc.h"
 
@@ -102,7 +103,6 @@
 #include "i915_vma.h"
 #include "i915_irq.h"
 
-#include "intel_region_lmem.h"
 
 /* General customization:
  */
-- 
2.26.2

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
