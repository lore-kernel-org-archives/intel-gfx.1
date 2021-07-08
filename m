Return-Path: <SRS0=yDSU=MA=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CF40C07E95
	for <intel-gfx@archiver.kernel.org>; Thu,  8 Jul 2021 01:53:58 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FEBB61C9A
	for <intel-gfx@archiver.kernel.org>; Thu,  8 Jul 2021 01:53:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1FEBB61C9A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5F5B8980C;
	Thu,  8 Jul 2021 01:53:57 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id AEC448980C;
 Thu,  8 Jul 2021 01:53:56 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id A7DD4A0169;
 Thu,  8 Jul 2021 01:53:56 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Date: Thu, 08 Jul 2021 01:53:56 -0000
Message-ID: <162570923666.32072.1998600684009103057@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20210707235921.2416911-1-lucas.demarchi@intel.com>
In-Reply-To: <20210707235921.2416911-1-lucas.demarchi@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_series_starting_with_=5B1/2=5D_drm/i915=3A_do_not_abbreviat?=
 =?utf-8?q?e_version_in_debugfs?=
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

Series: series starting with [1/2] drm/i915: do not abbreviate version in debugfs
URL   : https://patchwork.freedesktop.org/series/92296/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
b99d3141fb47 drm/i915: do not abbreviate version in debugfs
392edad5e651 drm/i915: Add release id version
-:48: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'i915' - possible side-effects?
#48: FILE: drivers/gpu/drm/i915/i915_drv.h:1249:
+#define GRAPHICS_VER_FULL(i915)		IP_VER(INTEL_INFO(i915)->graphics_ver, \
+					       INTEL_INFO(i915)->graphics_rel)

-:54: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'i915' - possible side-effects?
#54: FILE: drivers/gpu/drm/i915/i915_drv.h:1255:
+#define MEDIA_VER_FULL(i915)		IP_VER(INTEL_INFO(i915)->media_ver, \
+					       INTEL_INFO(i915)->media_rel)

-:70: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#70: FILE: drivers/gpu/drm/i915/intel_device_info.c:100:
+		drm_printf(p, "graphics version: %u.%02u\n", info->graphics_ver, info->graphics_rel);

total: 0 errors, 1 warnings, 2 checks, 44 lines checked


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
