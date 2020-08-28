Return-Path: <SRS0=+bTq=CG=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B33AC433E7
	for <intel-gfx@archiver.kernel.org>; Fri, 28 Aug 2020 13:56:29 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6FFD3207DF
	for <intel-gfx@archiver.kernel.org>; Fri, 28 Aug 2020 13:56:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6FFD3207DF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE2CC6E2E3;
	Fri, 28 Aug 2020 13:56:28 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 835496E2E3;
 Fri, 28 Aug 2020 13:56:27 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 7D3D9A3C0D;
 Fri, 28 Aug 2020 13:56:27 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lionel Landwerlin" <lionel.g.landwerlin@intel.com>
Date: Fri, 28 Aug 2020 13:56:27 -0000
Message-ID: <159862298748.4240.15291473819369247826@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20200828133125.157171-1-lionel.g.landwerlin@intel.com>
In-Reply-To: <20200828133125.157171-1-lionel.g.landwerlin@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_drm/i915=3A_break_TGL_pci-ids_in_GT_1_=26_2?=
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
Reply-To: intel-gfx@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/i915: break TGL pci-ids in GT 1 & 2
URL   : https://patchwork.freedesktop.org/series/81144/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
367b86db54b4 drm/i915: break TGL pci-ids in GT 1 & 2
-:20: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#20: FILE: include/drm/i915_pciids.h:597:
+#define INTEL_TGL_12_GT1_IDS(info) \
+	INTEL_VGA_DEVICE(0x9A60, info), \
+	INTEL_VGA_DEVICE(0x9A68, info), \
+	INTEL_VGA_DEVICE(0x9A70, info)

-:20: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'info' - possible side-effects?
#20: FILE: include/drm/i915_pciids.h:597:
+#define INTEL_TGL_12_GT1_IDS(info) \
+	INTEL_VGA_DEVICE(0x9A60, info), \
+	INTEL_VGA_DEVICE(0x9A68, info), \
+	INTEL_VGA_DEVICE(0x9A70, info)

-:25: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#25: FILE: include/drm/i915_pciids.h:602:
+#define INTEL_TGL_12_GT2_IDS(info) \
 	INTEL_VGA_DEVICE(0x9A40, info), \
 	INTEL_VGA_DEVICE(0x9A49, info), \
 	INTEL_VGA_DEVICE(0x9A59, info), \
 	INTEL_VGA_DEVICE(0x9A78, info), \
 	INTEL_VGA_DEVICE(0x9AC0, info), \
 	INTEL_VGA_DEVICE(0x9AC9, info), \
 	INTEL_VGA_DEVICE(0x9AD9, info), \
 	INTEL_VGA_DEVICE(0x9AF8, info)

-:25: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'info' - possible side-effects?
#25: FILE: include/drm/i915_pciids.h:602:
+#define INTEL_TGL_12_GT2_IDS(info) \
 	INTEL_VGA_DEVICE(0x9A40, info), \
 	INTEL_VGA_DEVICE(0x9A49, info), \
 	INTEL_VGA_DEVICE(0x9A59, info), \
 	INTEL_VGA_DEVICE(0x9A78, info), \
 	INTEL_VGA_DEVICE(0x9AC0, info), \
 	INTEL_VGA_DEVICE(0x9AC9, info), \
 	INTEL_VGA_DEVICE(0x9AD9, info), \
 	INTEL_VGA_DEVICE(0x9AF8, info)

-:38: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#38: FILE: include/drm/i915_pciids.h:612:
+#define INTEL_TGL_12_IDS(info) \
+	INTEL_TGL_12_GT1_IDS(info), \
+	INTEL_TGL_12_GT2_IDS(info)

-:38: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'info' - possible side-effects?
#38: FILE: include/drm/i915_pciids.h:612:
+#define INTEL_TGL_12_IDS(info) \
+	INTEL_TGL_12_GT1_IDS(info), \
+	INTEL_TGL_12_GT2_IDS(info)

total: 3 errors, 0 warnings, 3 checks, 29 lines checked


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
