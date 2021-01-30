Return-Path: <SRS0=q2Gh=HB=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ABE5C433E0
	for <intel-gfx@archiver.kernel.org>; Sat, 30 Jan 2021 17:10:04 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFF4664E06
	for <intel-gfx@archiver.kernel.org>; Sat, 30 Jan 2021 17:10:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BFF4664E06
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1E086E0AC;
	Sat, 30 Jan 2021 17:10:02 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 24E256E090;
 Sat, 30 Jan 2021 17:10:01 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 0DF9CAA3D8;
 Sat, 30 Jan 2021 17:10:01 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Aditya Swarup" <aditya.swarup@intel.com>
Date: Sat, 30 Jan 2021 17:10:01 -0000
Message-ID: <161202660102.13907.1754284448329224362@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20210129182945.217078-1-aditya.swarup@intel.com>
In-Reply-To: <20210129182945.217078-1-aditya.swarup@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_Final_set_of_patches_for_ADLS_enabling_=28rev4=29?=
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

Series: Final set of patches for ADLS enabling (rev4)
URL   : https://patchwork.freedesktop.org/series/86322/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
8430b7bd8825 drm/i915/adl_s: Update PHY_MISC programming
ed08b452aff6 drm/i915/adl_s: Add power wells
e4919cb36554 drm/i915/adl_s: Re-use TGL GuC/HuC firmware
918d77824364 drm/i915/display: Add HAS_D12_PLANE_MINIMIZATION
-:45: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'dev_priv' - possible side-effects?
#45: FILE: drivers/gpu/drm/i915/i915_drv.h:1786:
+#define HAS_D12_PLANE_MINIMIZATION(dev_priv) (IS_ROCKETLAKE(dev_priv) || \
+					      IS_ALDERLAKE_S(dev_priv))

total: 0 errors, 0 warnings, 1 checks, 33 lines checked
b2010c2c0817 drm/i915/adl_s: Load DMC
961cb0de450b drm/i915/adl_s: Update memory bandwidth parameters
-:48: CHECK:LINE_SPACING: Please don't use multiple blank lines
#48: FILE: drivers/gpu/drm/i915/display/intel_bw.c:260:
 
+

total: 0 errors, 0 warnings, 1 checks, 23 lines checked
75e752d0c4df drm/i915/adl_s: Add display WAs for ADL-S
3a3bf77dfcb7 drm/i915/adl_s: Add GT and CTX WAs for ADL-S


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
