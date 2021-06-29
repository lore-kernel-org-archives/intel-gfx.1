Return-Path: <SRS0=NZj8=LX=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8014DC11F67
	for <intel-gfx@archiver.kernel.org>; Tue, 29 Jun 2021 23:50:44 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3900661D5D
	for <intel-gfx@archiver.kernel.org>; Tue, 29 Jun 2021 23:50:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3900661D5D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D515C6E06D;
	Tue, 29 Jun 2021 23:50:43 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id BAF736E053;
 Tue, 29 Jun 2021 23:50:42 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id B433EA8830;
 Tue, 29 Jun 2021 23:50:42 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Anusha Srivatsa" <anusha.srivatsa@intel.com>
Date: Tue, 29 Jun 2021 23:50:42 -0000
Message-ID: <162501064271.9056.14793971904774190920@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20210629232049.7584-1-anusha.srivatsa@intel.com>
In-Reply-To: <20210629232049.7584-1-anusha.srivatsa@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_series_starting_with_=5BRFC=2C1/2=5D_drm/i915/dmc=3A_Add_so?=
 =?utf-8?q?c_stepping_to_intel=5Fstep?=
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

Series: series starting with [RFC,1/2] drm/i915/dmc: Add soc stepping to intel_step
URL   : https://patchwork.freedesktop.org/series/92039/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
15f341baff60 drm/i915/dmc: Add soc stepping to intel_step
9ab5d8facd04 drm/i915/dmc: Modify stepping/substepping table
-:27: CHECK:BRACES: Blank lines aren't necessary after an open brace '{'
#27: FILE: drivers/gpu/drm/i915/display/intel_dmc.c:274:
+{
+

-:28: ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#28: FILE: drivers/gpu/drm/i915/display/intel_dmc.c:275:
+	switch (step.soc_step) {
+		case STEP_A0:
[...]
+		case STEP_A2:
[...]
+		case STEP_B0:
[...]
+		case STEP_B1:
[...]
+		case STEP_B2:
[...]
+		case STEP_B10:
[...]
+		case STEP_C0:
[...]
+		case STEP_D0:
[...]
+		case STEP_D1:
[...]
+		case STEP_E0:
[...]
+		case STEP_F0:
[...]
+		case STEP_G0:
[...]
+		case STEP_H0:
[...]
+		case STEP_H5:
[...]
+		case STEP_J0:
[...]
+		case STEP_J1:
[...]
+		case STEP_K0:
[...]
+		case STEP_P0:
[...]
+		case STEP_L0:
[...]
+		case STEP_Q0:
[...]
+		case STEP_R0:
[...]
+		case STEP_Y0:
[...]
+		default:

-:146: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#146: FILE: drivers/gpu/drm/i915/display/intel_dmc.c:396:
+		return INTEL_REVID(dev_priv) < size ? si + INTEL_REVID(dev_priv) : &no_stepping_info;

total: 1 errors, 1 warnings, 1 checks, 133 lines checked


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
