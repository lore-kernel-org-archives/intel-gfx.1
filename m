Return-Path: <SRS0=uIVS=DT=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C027BC433DF
	for <intel-gfx@archiver.kernel.org>; Mon, 12 Oct 2020 21:53:00 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 401472072D
	for <intel-gfx@archiver.kernel.org>; Mon, 12 Oct 2020 21:52:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 401472072D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C2706E81E;
	Mon, 12 Oct 2020 21:52:59 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2C2BE6E804;
 Mon, 12 Oct 2020 21:52:59 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 21D4BA47E2;
 Mon, 12 Oct 2020 21:52:59 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Date: Mon, 12 Oct 2020 21:52:59 -0000
Message-ID: <160253957910.31911.507768341661037065@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20201012212959.871513-1-lucas.demarchi@intel.com>
In-Reply-To: <20201012212959.871513-1-lucas.demarchi@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_Introduce_DG1?=
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

Series: Introduce DG1
URL   : https://patchwork.freedesktop.org/series/82594/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
8623a162621b drm/i915/display: allow to skip certain power wells
-:64: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__power_well_descs' - possible side-effects?
#64: FILE: drivers/gpu/drm/i915/display/intel_display_power.c:4598:
+#define set_power_wells_mask(power_domains, __power_well_descs, skip_mask) \
 	__set_power_wells(power_domains, __power_well_descs, \
+			  ARRAY_SIZE(__power_well_descs), skip_mask)

total: 0 errors, 0 warnings, 1 checks, 50 lines checked
68df339f83b7 drm/i915/cnl: skip PW_DDI_F on certain skus
d0032ba13005 drm/i915/dg1: Add DG1 power wells
427e81efb3e5 drm/i915/dg1: Add DPLL macros for DG1
4718a2b29fcc drm/i915/dg1: Add and setup DPLLs for DG1
bd28cc6aa15c drm/i915/dg1: Enable DPLL for DG1
b60e1f572176 drm/i915/dg1: add hpd interrupt handling
5c559e0d9227 drm/i915/dg1: invert HPD pins
4a9095a0b7bb drm/i915/dg1: map/unmap pll clocks
-:244: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'phy' - possible side-effects?
#244: FILE: drivers/gpu/drm/i915/i915_reg.h:10324:
+#define   DG1_DPCLKA_CFGCR0_DDI_CLK_SEL_VAL_TO_ID(val, phy) \
+	  ((((val) & DG1_DPCLKA_CFGCR0_DDI_CLK_SEL_MASK(phy)) >> ((phy % 2) * 2)) + (2 * (phy / 2)))

total: 0 errors, 0 warnings, 1 checks, 204 lines checked
2277e81c77bb drm/i915/dg1: Enable ports
-:67: WARNING:NO_AUTHOR_SIGN_OFF: Missing Signed-off-by: line by nominal patch author 'Aditya Swarup <aditya.swarup@intel.com>'

total: 0 errors, 1 warnings, 0 checks, 32 lines checked
51a8641ffb98 drm/i915/dg1: Load DMC
5da8aa482e31 drm/i915/dg1: Add initial DG1 workarounds
ad249d6324c6 drm/i915/dg1: DG1 does not support DC6
ef788aaa1608 drm/i915/dg1: Update DMC_DEBUG register
3200a254244e drm/i915/dgfx: define llc and snooping behaviour


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
