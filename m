Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67444C48BF6
	for <intel-gfx@archiver.kernel.org>; Thu,  7 Mar 2024 10:49:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1CE910F3A5;
	Thu,  7 Mar 2024 10:49:22 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD96110F3A2;
 Thu,  7 Mar 2024 10:49:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2ECHECKPATCH=3A_warning_for_Introduce_drm_sharpe?=
 =?utf-8?q?ning_property_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nemesa Garg" <nemesa.garg@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Thu, 07 Mar 2024 10:49:21 -0000
Message-ID: <170980856177.580595.8141229294276189514@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240307083237.576177-1-nemesa.garg@intel.com>
In-Reply-To: <20240307083237.576177-1-nemesa.garg@intel.com>
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

Series: Introduce drm sharpening property (rev2)
URL   : https://patchwork.freedesktop.org/series/129888/
State : warning

== Summary ==

Error: dim checkpatch failed
4fe845215e02 drm: Introduce sharpness mode property
65b8e0c3c5e8 drm/i915/display: Compute the scaler filter coefficients
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:74: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#74: 
new file mode 100644

-:196: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#196: FILE: drivers/gpu/drm/i915/display/intel_sharpen_filter.c:118:
+				SHARP_COEFF_TO_REG_FORMAT(crtc_state->hw.casf_params.coeff[tapindex]);

-:216: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'coefficient' - possible side-effects?
#216: FILE: drivers/gpu/drm/i915/display/intel_sharpen_filter.h:11:
+#define SHARP_COEFF_TO_REG_FORMAT(coefficient) ((u16)(coefficient.sign << 15 | \
+			coefficient.exp << 12 | coefficient.mantissa << 3))

total: 0 errors, 2 warnings, 1 checks, 206 lines checked
34a37b8966c7 drm/i915/display: Enable the second scaler
-:198: CHECK:MULTIPLE_ASSIGNMENTS: multiple assignments should be avoided
#198: FILE: drivers/gpu/drm/i915/display/skl_scaler.c:747:
+	x = y = 0;

total: 0 errors, 0 warnings, 1 checks, 204 lines checked
7f7464e052b9 drm/i915/display: Add registers and compute the strength
51c9a73ff22c drm/i915/display: Load the lut values and enable sharpness


