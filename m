Return-Path: <SRS0=bw6s=HG=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9E94C433E0
	for <intel-gfx@archiver.kernel.org>; Thu,  4 Feb 2021 22:10:58 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6369264F47
	for <intel-gfx@archiver.kernel.org>; Thu,  4 Feb 2021 22:10:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6369264F47
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D75466EE74;
	Thu,  4 Feb 2021 22:10:57 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2C88C6EE83;
 Thu,  4 Feb 2021 22:10:56 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 1DDA4A363D;
 Thu,  4 Feb 2021 22:10:56 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Date: Thu, 04 Feb 2021 22:10:56 -0000
Message-ID: <161247665609.4504.1521851597384333529@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20210204181048.24202-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20210204181048.24202-1-ville.syrjala@linux.intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_drm/i915=3A_Clean_up_the_DDI_clock_routing_mess_=28rev2=29?=
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

Series: drm/i915: Clean up the DDI clock routing mess (rev2)
URL   : https://patchwork.freedesktop.org/series/86544/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
7a9a433648ec drm/i915: Introduce .{enable, disable}_clock() encoder vfuncs
104612889762 drm/i915: Extract hsw_ddi_{enable, disable}_clock()
370fdbea29e2 drm/i915: Extract skl_ddi_{enable, disable}_clock()
ff375afcdf02 drm/i195: Extract cnl_ddi_{enable, disable}_clock()
818ed01c5517 drm/i915: Convert DG1 over to .{enable, disable}_clock()
6556f08b6691 drm/i915: Extract icl+ .{enable, disable}_clock() vfuncs
-:12: WARNING:COMMIT_LOG_LONG_LINE: Possible unwrapped commit description (prefer a maximum 75 chars per line)
#12: 
   and ICL_DPCLKA_CFGCR0_TC_CLK_OFF part form icl_{map,unmap}_plls_to_ports()

total: 0 errors, 1 warnings, 0 checks, 232 lines checked
05feedf13562 drm/i915: Use intel_de_rmw() for DDI clock routing
955b034d57a3 drm/i915: Sprinkle a few missing locks around shared DDI clock registers
da8fa7f178d4 drm/i915: Sprinkle WARN(!pll) into icl/dg1 .clock_enable()
2c2cbb342e26 drm/i915: Extract _cnl_ddi_{enable, disable}_clock()
ad2ff2024cda drm/i915: Split adl-s/rkl from icl_ddi_combo_{enable, disable}_clock()
43bdf3bff434 drm/i915: Use .disable_clock() for pll sanitation
68c071acd87d drm/i915: Relocate icl_sanitize_encoder_pll_mapping()
3042cc386f80 drm/i915: s/dev_priv/i915/ for the remainder of DDI clock routing


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
