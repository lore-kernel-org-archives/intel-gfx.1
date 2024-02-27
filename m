Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DDFBC5478C
	for <intel-gfx@archiver.kernel.org>; Tue, 27 Feb 2024 14:58:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED13F10E2DE;
	Tue, 27 Feb 2024 14:58:01 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C02810E535;
 Tue, 27 Feb 2024 14:58:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2ECHECKPATCH=3A_warning_for_series_starting_with?=
 =?utf-8?q?_=5B1/2=5D_drm/i915/display/drrs=3A_Refactor_CPU_transcoder_DRRS_?=
 =?utf-8?q?check?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Tue, 27 Feb 2024 14:58:01 -0000
Message-ID: <170904588124.337360.7229265096563691436@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240227123833.2799647-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20240227123833.2799647-1-bhanuprakash.modem@intel.com>
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
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

== Series Details ==

Series: series starting with [1/2] drm/i915/display/drrs: Refactor CPU transcoder DRRS check
URL   : https://patchwork.freedesktop.org/series/130433/
State : warning

== Summary ==

Error: dim checkpatch failed
4e54fc855aa6 drm/i915/display/drrs: Refactor CPU transcoder DRRS check
-:43: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#43: FILE: drivers/gpu/drm/i915/display/intel_display.h:488:
+bool intel_cpu_transcoder_has_drrs(struct drm_i915_private *i915,
+				    enum transcoder cpu_transcoder);

total: 0 errors, 0 warnings, 1 checks, 46 lines checked
20e527158a9a drm/i915/display/debugfs: Fix duplicate checks in i915_drrs_status
-:27: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#27: FILE: drivers/gpu/drm/i915/display/intel_drrs.c:316:
+		   str_yes_no(intel_cpu_transcoder_has_drrs(i915,
+						crtc_state->cpu_transcoder)));

total: 0 errors, 0 warnings, 1 checks, 11 lines checked


