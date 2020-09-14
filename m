Return-Path: <SRS0=dUrX=CX=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBC87C43461
	for <intel-gfx@archiver.kernel.org>; Mon, 14 Sep 2020 18:43:44 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86091208B3
	for <intel-gfx@archiver.kernel.org>; Mon, 14 Sep 2020 18:43:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86091208B3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1231C89C88;
	Mon, 14 Sep 2020 18:43:44 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0B64389B45;
 Mon, 14 Sep 2020 18:43:43 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 03D18A8831;
 Mon, 14 Sep 2020 18:43:43 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Anusha Srivatsa" <anusha.srivatsa@intel.com>
Date: Mon, 14 Sep 2020 18:43:42 -0000
Message-ID: <160010902298.5911.2355568343041503759@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20200914175703.15024-1-anusha.srivatsa@intel.com>
In-Reply-To: <20200914175703.15024-1-anusha.srivatsa@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_drm/i915/pll=3A_Centralize_PLL=5FENABLE_register_lookup_=28?=
 =?utf-8?q?rev5=29?=
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

Series: drm/i915/pll: Centralize PLL_ENABLE register lookup (rev5)
URL   : https://patchwork.freedesktop.org/series/81150/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
f5ec8439a17d drm/i915/pll: Centralize PLL_ENABLE register lookup
-:38: CHECK:BRACES: Blank lines aren't necessary after an open brace '{'
#38: FILE: drivers/gpu/drm/i915/display/intel_dpll_mgr.c:154:
+{
+

-:39: CHECK:UNNECESSARY_PARENTHESES: Unnecessary parentheses around 'pll->info->id == DPLL_ID_EHL_DPLL4'
#39: FILE: drivers/gpu/drm/i915/display/intel_dpll_mgr.c:155:
+	if (IS_ELKHARTLAKE(i915) && (pll->info->id == DPLL_ID_EHL_DPLL4))

-:44: CHECK:LINE_SPACING: Please don't use multiple blank lines
#44: FILE: drivers/gpu/drm/i915/display/intel_dpll_mgr.c:160:
+
+

-:45: CHECK:BRACES: Blank lines aren't necessary before a close brace '}'
#45: FILE: drivers/gpu/drm/i915/display/intel_dpll_mgr.c:161:
+
+}

total: 0 errors, 0 warnings, 4 checks, 66 lines checked


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
