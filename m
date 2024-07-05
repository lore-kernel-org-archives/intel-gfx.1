Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D8F9C30658
	for <intel-gfx@archiver.kernel.org>; Fri,  5 Jul 2024 12:40:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 736D210E0C0;
	Fri,  5 Jul 2024 12:40:49 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FE8610E0C0;
 Fri,  5 Jul 2024 12:40:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2ECHECKPATCH=3A_warning_for_Introduce_drm_sharpe?=
 =?utf-8?q?ning_property_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nemesa Garg" <nemesa.garg@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Fri, 05 Jul 2024 12:40:48 -0000
Message-ID: <172018324817.30593.5129446478593393017@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240705090205.72302-1-nemesa.garg@intel.com>
In-Reply-To: <20240705090205.72302-1-nemesa.garg@intel.com>
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

Series: Introduce drm sharpening property (rev3)
URL   : https://patchwork.freedesktop.org/series/129888/
State : warning

== Summary ==

Error: dim checkpatch failed
b96b65457ae5 drm: Introduce sharpness mode property
d540875503e0 drm/i915/display: Compute the scaler filter coefficients
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

total: 0 errors, 2 warnings, 1 checks, 205 lines checked
6c0772b62e39 drm/i915/display: Enable the second scaler for sharpness
-:224: CHECK:MULTIPLE_ASSIGNMENTS: multiple assignments should be avoided
#224: FILE: drivers/gpu/drm/i915/display/skl_scaler.c:746:
+	x = y = 0;

total: 0 errors, 0 warnings, 1 checks, 224 lines checked
cd1d9bf695a1 drm/i915/display: Add registers and compute the strength
09bdc3535b18 drm/i915/display: Load the lut values and enable sharpness


