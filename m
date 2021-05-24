Return-Path: <SRS0=+tRi=KT=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87730C04FF3
	for <intel-gfx@archiver.kernel.org>; Mon, 24 May 2021 18:43:52 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4946761411
	for <intel-gfx@archiver.kernel.org>; Mon, 24 May 2021 18:43:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4946761411
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8F906E903;
	Mon, 24 May 2021 18:43:51 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3586C6E903;
 Mon, 24 May 2021 18:43:50 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 2E7A1A47DB;
 Mon, 24 May 2021 18:43:50 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Date: Mon, 24 May 2021 18:43:50 -0000
Message-ID: <162188183018.10902.7843519725942907911@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20210524172703.2113058-1-imre.deak@intel.com>
In-Reply-To: <20210524172703.2113058-1-imre.deak@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_series_starting_with_=5B1/3=5D_drm/i915/adlp=3A_Require_DPT?=
 =?utf-8?q?_FB_CCS_color_planes_to_be_2MB_aligned?=
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

Series: series starting with [1/3] drm/i915/adlp: Require DPT FB CCS color planes to be 2MB aligned
URL   : https://patchwork.freedesktop.org/series/90484/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
67ae62f3578a drm/i915/adlp: Require DPT FB CCS color planes to be 2MB aligned
ab61802fef7d drm/i915/adlp: Fix GEM VM asserts for DPT VMs
-:27: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'vm' - possible side-effects?
#27: FILE: drivers/gpu/drm/i915/gt/intel_gtt.h:362:
+#define i915_is_ggtt_or_dpt(vm) (i915_is_ggtt(vm) || i915_is_dpt(vm))

total: 0 errors, 0 warnings, 1 checks, 31 lines checked
5e4ab79a1296 drm/i915/debugfs: Print remap info for DPT VMAs as well
-:28: WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements (8, 15)
#28: FILE: drivers/gpu/drm/i915/i915_debugfs.c:129:
+	if (i915_vma_is_ggtt(vma))
+	       return "ggtt";

-:29: WARNING:TABSTOP: Statements should start on a tabstop
#29: FILE: drivers/gpu/drm/i915/i915_debugfs.c:130:
+	       return "ggtt";

total: 0 errors, 2 warnings, 0 checks, 42 lines checked


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
