Return-Path: <SRS0=k0IE=ES=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D318C388F9
	for <intel-gfx@archiver.kernel.org>; Thu, 12 Nov 2020 00:32:36 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93828205CB
	for <intel-gfx@archiver.kernel.org>; Thu, 12 Nov 2020 00:32:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 93828205CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A276F6E0CA;
	Thu, 12 Nov 2020 00:32:34 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 296BA6E046;
 Thu, 12 Nov 2020 00:32:33 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 18A61A8169;
 Thu, 12 Nov 2020 00:32:33 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Navare, Manasi" <manasi.d.navare@intel.com>
Date: Thu, 12 Nov 2020 00:32:33 -0000
Message-ID: <160514115306.29793.1103207600253072083@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20201102211906.4893-1-manasi.d.navare@intel.com>
In-Reply-To: <20201102211906.4893-1-manasi.d.navare@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_series_starting_with_=5Bv5=2C1/6=5D_drm/i915/dp=3A_Some_res?=
 =?utf-8?q?huffling_in_mode=5Fvalid_as_prep_for_bigjoiner_modes_=28rev4=29?=
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

Series: series starting with [v5,1/6] drm/i915/dp: Some reshuffling in mode_valid as prep for bigjoiner modes (rev4)
URL   : https://patchwork.freedesktop.org/series/83373/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
56832962f07a drm/i915/dp: Some reshuffling in mode_valid as prep for bigjoiner modes
5fae0b39d724 drm/i915: Move encoder->get_config to a new function
f7a41ea3fe88 drm/i915: Add hw.pipe_mode to allow bigjoiner pipe/transcoder split
-:172: CHECK:MULTIPLE_ASSIGNMENTS: multiple assignments should be avoided
#172: FILE: drivers/gpu/drm/i915/display/intel_display.c:13403:
+	crtc_state->hw.pipe_mode = crtc_state->hw.adjusted_mode = crtc_state->uapi.adjusted_mode;

total: 0 errors, 0 warnings, 1 checks, 392 lines checked
a7e4860f25c4 drm/i915: Pass intel_atomic_state instead of drm_atomic_state
201455d23ee8 drm/i915/dp: Prep for bigjoiner atomic check
8be57882b8f8 drm/i915/dp: Allow big joiner modes in intel_dp_mode_valid(), v3.
-:195: CHECK:LOGICAL_CONTINUATIONS: Logical continuations should be on the previous line
#195: FILE: drivers/gpu/drm/i915/display/intel_dp.c:774:
+	if ((target_clock > max_dotclk || mode->hdisplay > 5120)
+	    && intel_dp_can_bigjoiner(intel_dp)) {

total: 0 errors, 0 warnings, 1 checks, 211 lines checked


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
