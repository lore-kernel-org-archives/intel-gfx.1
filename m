Return-Path: <SRS0=zhYU=GO=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFE6BC433DB
	for <intel-gfx@archiver.kernel.org>; Mon, 11 Jan 2021 19:45:01 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FC8322BED
	for <intel-gfx@archiver.kernel.org>; Mon, 11 Jan 2021 19:45:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7FC8322BED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D87FA89DDF;
	Mon, 11 Jan 2021 19:45:00 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id F124189DDF;
 Mon, 11 Jan 2021 19:44:59 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id E9E82A47DF;
 Mon, 11 Jan 2021 19:44:59 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Aditya Swarup" <aditya.swarup@intel.com>
Date: Mon, 11 Jan 2021 19:44:59 -0000
Message-ID: <161039429992.25134.17213165292355621199@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20210111193000.16738-1-aditya.swarup@intel.com>
In-Reply-To: <20210111193000.16738-1-aditya.swarup@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_Use_TGL_stepping_info_and_add_ADLS_platform_changes_=28rev2?=
 =?utf-8?q?=29?=
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

Series: Use TGL stepping info and add ADLS platform changes (rev2)
URL   : https://patchwork.freedesktop.org/series/85639/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
5e2bd50d9a37 drm/i915/tgl: Use TGL stepping info for applying WAs
-:197: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'p' - possible side-effects?
#197: FILE: drivers/gpu/drm/i915/i915_drv.h:1595:
+#define IS_TGL_DISP_STEPPING(p, since, until) \
 	(IS_TIGERLAKE(p) && \
+	 tgl_stepping_get(p)->disp_stepping >= (since) && \
+	 tgl_stepping_get(p)->disp_stepping <= (until))

-:205: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'p' - possible side-effects?
#205: FILE: drivers/gpu/drm/i915/i915_drv.h:1600:
+#define IS_TGL_UY_GT_STEPPING(p, since, until) \
 	((IS_TGL_U(p) || IS_TGL_Y(p)) && \
+	 tgl_stepping_get(p)->gt_stepping >= (since) && \
+	 tgl_stepping_get(p)->gt_stepping <= (until))

-:213: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'p' - possible side-effects?
#213: FILE: drivers/gpu/drm/i915/i915_drv.h:1605:
+#define IS_TGL_GT_STEPPING(p, since, until) \
 	(IS_TIGERLAKE(p) && \
 	 !(IS_TGL_U(p) || IS_TGL_Y(p)) && \
+	 tgl_stepping_get(p)->gt_stepping >= (since) && \
+	 tgl_stepping_get(p)->gt_stepping <= (until))

total: 0 errors, 0 warnings, 3 checks, 182 lines checked
f919d3dd38ae drm/i915/adl_s: Add ADL-S platform info and PCI ids
-:126: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'p' - possible side-effects?
#126: FILE: drivers/gpu/drm/i915/i915_drv.h:1639:
+#define IS_ADLS_DISP_STEPPING(p, since, until) \
+	(IS_ALDERLAKE_S(p) && \
+	 tgl_stepping_get(p)->disp_stepping >= (since) && \
+	 tgl_stepping_get(p)->disp_stepping <= (until))

-:131: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'p' - possible side-effects?
#131: FILE: drivers/gpu/drm/i915/i915_drv.h:1644:
+#define IS_ADLS_GT_STEPPING(p, since, until) \
+	(IS_ALDERLAKE_S(p) && \
+	 tgl_stepping_get(p)->gt_stepping >= (since) && \
+	 tgl_stepping_get(p)->gt_stepping <= (until))

-:203: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#203: FILE: include/drm/i915_pciids.h:638:
+#define INTEL_ADLS_IDS(info) \
+	INTEL_VGA_DEVICE(0x4680, info), \
+	INTEL_VGA_DEVICE(0x4681, info), \
+	INTEL_VGA_DEVICE(0x4682, info), \
+	INTEL_VGA_DEVICE(0x4683, info), \
+	INTEL_VGA_DEVICE(0x4690, info), \
+	INTEL_VGA_DEVICE(0x4691, info), \
+	INTEL_VGA_DEVICE(0x4692, info), \
+	INTEL_VGA_DEVICE(0x4693, info)

-:203: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'info' - possible side-effects?
#203: FILE: include/drm/i915_pciids.h:638:
+#define INTEL_ADLS_IDS(info) \
+	INTEL_VGA_DEVICE(0x4680, info), \
+	INTEL_VGA_DEVICE(0x4681, info), \
+	INTEL_VGA_DEVICE(0x4682, info), \
+	INTEL_VGA_DEVICE(0x4683, info), \
+	INTEL_VGA_DEVICE(0x4690, info), \
+	INTEL_VGA_DEVICE(0x4691, info), \
+	INTEL_VGA_DEVICE(0x4692, info), \
+	INTEL_VGA_DEVICE(0x4693, info)

total: 1 errors, 0 warnings, 3 checks, 128 lines checked


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
