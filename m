Return-Path: <SRS0=j43y=EM=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17146C2D0A3
	for <intel-gfx@archiver.kernel.org>; Fri,  6 Nov 2020 21:15:24 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8633F208C7
	for <intel-gfx@archiver.kernel.org>; Fri,  6 Nov 2020 21:15:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8633F208C7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE3A16EB16;
	Fri,  6 Nov 2020 21:15:22 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id E59A36E0E6;
 Fri,  6 Nov 2020 21:15:21 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id D4CC0A8169;
 Fri,  6 Nov 2020 21:15:21 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Date: Fri, 06 Nov 2020 21:15:21 -0000
Message-ID: <160469732184.19145.18061427171840737753@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20201106210006.837953-1-lucas.demarchi@intel.com>
In-Reply-To: <20201106210006.837953-1-lucas.demarchi@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_drm/i915/dg1=3A_map/unmap_pll_clocks?=
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

Series: drm/i915/dg1: map/unmap pll clocks
URL   : https://patchwork.freedesktop.org/series/83592/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
a589e37423a2 drm/i915/dg1: map/unmap pll clocks
-:187: WARNING:LONG_LINE: line length of 108 exceeds 100 columns
#187: FILE: drivers/gpu/drm/i915/display/intel_display.c:11014:
+	clk_sel = intel_de_read(dev_priv, DG1_DPCLKA_CFGCR0(phy)) & DG1_DPCLKA_CFGCR0_DDI_CLK_SEL_MASK(phy);

-:254: WARNING:LONG_LINE: line length of 112 exceeds 100 columns
#254: FILE: drivers/gpu/drm/i915/i915_reg.h:10331:
+#define _DG1_PHY_DPLL_MAP(phy)				((phy) >= PHY_C ? DPLL_ID_DG1_DPLL2 : DPLL_ID_DG1_DPLL0)

-:260: WARNING:LONG_LINE: line length of 126 exceeds 100 columns
#260: FILE: drivers/gpu/drm/i915/i915_reg.h:10337:
+#define   DG1_DPCLKA_CFGCR0_DDI_CLK_SEL(pll, phy)	(_DG1_DPCLKA_PLL_IDX(pll) << DG1_DPCLKA_CFGCR0_DDI_CLK_SEL_SHIFT(phy))

-:261: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#261: FILE: drivers/gpu/drm/i915/i915_reg.h:10338:
+#define   DG1_DPCLKA_CFGCR0_DDI_CLK_SEL_MASK(phy)	(0x3 << DG1_DPCLKA_CFGCR0_DDI_CLK_SEL_SHIFT(phy))

-:262: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'phy' - possible side-effects?
#262: FILE: drivers/gpu/drm/i915/i915_reg.h:10339:
+#define   DG1_DPCLKA_CFGCR0_DDI_CLK_SEL_DPLL_MAP(clk_sel, phy) \
+	(((clk_sel) >> DG1_DPCLKA_CFGCR0_DDI_CLK_SEL_SHIFT(phy)) + _DG1_PHY_DPLL_MAP(phy))

total: 0 errors, 4 warnings, 1 checks, 211 lines checked


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
