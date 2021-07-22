Return-Path: <SRS0=pd08=MO=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22F4EC6377A
	for <intel-gfx@archiver.kernel.org>; Thu, 22 Jul 2021 00:06:53 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D863261241
	for <intel-gfx@archiver.kernel.org>; Thu, 22 Jul 2021 00:06:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D863261241
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 831B06E499;
	Thu, 22 Jul 2021 00:06:52 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id DF5066E499;
 Thu, 22 Jul 2021 00:06:50 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id D8822A8830;
 Thu, 22 Jul 2021 00:06:50 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Date: Thu, 22 Jul 2021 00:06:50 -0000
Message-ID: <162691241086.30345.2496249603599894290@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20210721223043.834562-1-matthew.d.roper@intel.com>
In-Reply-To: <20210721223043.834562-1-matthew.d.roper@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_CI_pass_for_reviewed_Xe=5FHP_SDV_and_DG2_patches?=
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

Series: CI pass for reviewed Xe_HP SDV and DG2 patches
URL   : https://patchwork.freedesktop.org/series/92853/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
3c0d66813984 drm/i915: Add XE_HP initial definitions
35b61c43f3e6 drm/i915/xehpsdv: add initial XeHP SDV definitions
af8335fc25c0 drm/i915/dg2: add DG2 platform info
-:53: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__i915' - possible side-effects?
#53: FILE: drivers/gpu/drm/i915/i915_drv.h:1580:
+#define IS_DG2_GT_STEP(__i915, variant, since, until) \
+	(IS_SUBPLATFORM(__i915, INTEL_DG2, INTEL_SUBPLATFORM_##variant) && \
+	 IS_GT_STEP(__i915, since, until))

-:57: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__i915' - possible side-effects?
#57: FILE: drivers/gpu/drm/i915/i915_drv.h:1584:
+#define IS_DG2_DISP_STEP(__i915, since, until) \
+	(IS_DG2(__i915) && \
+	 IS_DISPLAY_STEP(__i915, since, until))

total: 0 errors, 0 warnings, 2 checks, 117 lines checked
2e778d91bf0c drm/i915: Fork DG1 interrupt handler
2024f48f8303 drm/i915/xehp: VDBOX/VEBOX fusing registers are enable-based
54b16faca000 drm/i915/gen12: Use fuse info to enable SFC
748de8c99157 drm/i915/selftests: Allow for larger engine counts
66471aa168d2 drm/i915/xehp: Handle new device context ID format
0f78529c87f9 drm/i915/xehp: New engine context offsets
bf4e9f961c54 drm/i915/dg2: Add fake PCH
ee4554dd0f46 drm/i915/dg2: Add cdclk table and reference clock
85a603e64280 drm/i915/dg2: Skip shared DPLL handling
ca6cdb06bc87 drm/i915/dg2: Don't wait for AUX power well enable ACKs
f8744c6d424a drm/i915/dg2: Setup display outputs
4d664ff3d52d drm/i915/dg2: Add dbuf programming
adb51870fc17 drm/i915/dg2: Don't program BW_BUDDY registers
358ea009b220 drm/i915/dg2: Don't read DRAM info
7704c9aa289a drm/i915/dg2: DG2 has fixed memory bandwidth


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
