Return-Path: <SRS0=Us6R=MC=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C8F1C07E95
	for <intel-gfx@archiver.kernel.org>; Sat, 10 Jul 2021 03:58:48 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40C82613DC
	for <intel-gfx@archiver.kernel.org>; Sat, 10 Jul 2021 03:58:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40C82613DC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB8A56EAD0;
	Sat, 10 Jul 2021 03:58:47 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3CFA76EACC;
 Sat, 10 Jul 2021 03:58:47 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 2F58AA47E9;
 Sat, 10 Jul 2021 03:58:47 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Date: Sat, 10 Jul 2021 03:58:47 -0000
Message-ID: <162588952717.15855.5861460429922852823@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20210710033724.2459367-1-matthew.d.roper@intel.com>
In-Reply-To: <20210710033724.2459367-1-matthew.d.roper@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_Minor_revid/stepping_and_workaround_cleanup_=28rev2=29?=
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

Series: Minor revid/stepping and workaround cleanup (rev2)
URL   : https://patchwork.freedesktop.org/series/92299/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
602f2fe49dc0 drm/i915/step: s/<platform>_revid_tbl/<platform>_revids
023cab2a2100 drm/i915: Make pre-production detection use direct revid comparison
f260bb283918 drm/i915/skl: Use revid->stepping tables
-:56: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'p' - possible side-effects?
#56: FILE: drivers/gpu/drm/i915/i915_drv.h:1518:
+#define IS_SKL_GT_STEP(p, since, until) (IS_SKYLAKE(p) && IS_GT_STEP(p, since, until))

total: 0 errors, 0 warnings, 1 checks, 80 lines checked
02447a87c0cc drm/i915/kbl: Drop pre-production revision from stepping table
2ee48fd0d6f6 drm/i915/bxt: Use revid->stepping tables
c506016c4648 drm/i915/glk: Use revid->stepping tables
db965751e531 drm/i915/icl: Use revid->stepping tables
-:116: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'p' - possible side-effects?
#116: FILE: drivers/gpu/drm/i915/i915_drv.h:1532:
+#define IS_ICL_GT_STEP(p, since, until) \
+	(IS_ICELAKE(p) && IS_GT_STEP(p, since, until))

total: 0 errors, 0 warnings, 1 checks, 87 lines checked
fc2b6164fa50 drm/i915/jsl_ehl: Use revid->stepping tables
-:51: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'p' - possible side-effects?
#51: FILE: drivers/gpu/drm/i915/i915_drv.h:1535:
+#define IS_JSL_EHL_GT_STEP(p, since, until) \
+	(IS_JSL_EHL(p) && IS_GT_STEP(p, since, until))

-:53: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'p' - possible side-effects?
#53: FILE: drivers/gpu/drm/i915/i915_drv.h:1537:
+#define IS_JSL_EHL_DISPLAY_STEP(p, since, until) \
+	(IS_JSL_EHL(p) && IS_DISPLAY_STEP(p, since, until))

total: 0 errors, 0 warnings, 2 checks, 51 lines checked
c53e1e6ba585 drm/i915/rkl: Use revid->stepping tables
-:48: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'p' - possible side-effects?
#48: FILE: drivers/gpu/drm/i915/i915_drv.h:1552:
+#define IS_RKL_DISPLAY_STEP(p, since, until) \
+	(IS_ROCKETLAKE(p) && IS_DISPLAY_STEP(p, since, until))

total: 0 errors, 0 warnings, 1 checks, 51 lines checked
36d6af0814ee drm/i915/dg1: Use revid->stepping tables
-:124: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'p' - possible side-effects?
#124: FILE: drivers/gpu/drm/i915/i915_drv.h:1546:
+#define IS_DG1_GT_STEP(p, since, until) \
+	(IS_DG1(p) && IS_GT_STEP(p, since, until))

-:126: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'p' - possible side-effects?
#126: FILE: drivers/gpu/drm/i915/i915_drv.h:1548:
+#define IS_DG1_DISPLAY_STEP(p, since, until) \
+	(IS_DG1(p) && IS_DISPLAY_STEP(p, since, until))

total: 0 errors, 0 warnings, 2 checks, 118 lines checked
febbb9864d60 drm/i915/cnl: Drop all workarounds
4fbd5e59cb10 drm/i915/icl: Drop workarounds that only apply to pre-production steppings


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
