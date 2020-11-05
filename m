Return-Path: <SRS0=eU4y=EL=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1B3BC4742C
	for <intel-gfx@archiver.kernel.org>; Thu,  5 Nov 2020 23:12:42 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28EC0206CB
	for <intel-gfx@archiver.kernel.org>; Thu,  5 Nov 2020 23:12:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 28EC0206CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D02E6E873;
	Thu,  5 Nov 2020 23:12:41 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 01C586E871;
 Thu,  5 Nov 2020 23:12:41 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id EE4F1A0078;
 Thu,  5 Nov 2020 23:12:40 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Manasi Navare" <manasi.d.navare@intel.com>
Date: Thu, 05 Nov 2020 23:12:40 -0000
Message-ID: <160461796094.14957.16879583178549498119@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20201105223359.28203-1-manasi.d.navare@intel.com>
In-Reply-To: <20201105223359.28203-1-manasi.d.navare@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_Final_prep_series_for_bigjoiner?=
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

Series: Final prep series for bigjoiner
URL   : https://patchwork.freedesktop.org/series/83547/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
a1e5aa27e03c drm/i915/dp: Some reshuffling in mode_valid as prep for bigjoiner modes
5c583972c6ab drm/i915: Move encoder->get_config to a new function
7099fec68e5b drm/i915/dp: Add a wrapper function around get_pipe_config
faeced2f5a32 drm/i915: Add hw.pipe_mode to allow bigjoiner pipe/transcoder split
-:183: CHECK:MULTIPLE_ASSIGNMENTS: multiple assignments should be avoided
#183: FILE: drivers/gpu/drm/i915/display/intel_display.c:13485:
+	crtc_state->hw.pipe_mode = crtc_state->hw.adjusted_mode = crtc_state->uapi.adjusted_mode;

total: 0 errors, 0 warnings, 1 checks, 392 lines checked
f3f325988674 drm/i915: Pass intel_atomic_state instead of drm_atomic_state
8aa86e74eb81 drm/i915/dp: Add from_crtc_state to copy color blobs
c922ac533b62 drm/i915/dp: Allow big joiner modes in intel_dp_mode_valid(), v3.
-:191: CHECK:LOGICAL_CONTINUATIONS: Logical continuations should be on the previous line
#191: FILE: drivers/gpu/drm/i915/display/intel_dp.c:774:
+	if ((target_clock > max_dotclk || mode->hdisplay > 5120)
+	    && intel_dp_can_bigjoiner(intel_dp)) {

total: 0 errors, 0 warnings, 1 checks, 211 lines checked


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
