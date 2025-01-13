Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C7EBC02180
	for <intel-gfx@archiver.kernel.org>; Mon, 13 Jan 2025 16:17:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46EA910E1BC;
	Mon, 13 Jan 2025 16:17:58 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1079710E1BC;
 Mon, 13 Jan 2025 16:17:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2ECHECKPATCH=3A_warning_for_Introduce_drm_sharpn?=
 =?utf-8?q?ess_property_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nemesa Garg" <nemesa.garg@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Mon, 13 Jan 2025 16:17:57 -0000
Message-ID: <173678507706.3291654.17473736260348136217@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250113104936.1338290-1-nemesa.garg@intel.com>
In-Reply-To: <20250113104936.1338290-1-nemesa.garg@intel.com>
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

Series: Introduce drm sharpness property (rev7)
URL   : https://patchwork.freedesktop.org/series/138754/
State : warning

== Summary ==

Error: dim checkpatch failed
a6ca833eb712 drm: Introduce sharpness strength property
5bac18368947 drm/i915/display: Compute the scaler filter coefficients
-:37: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#37: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 231 lines checked
85b079d80132 drm/i915/display: Configure the scaler
-:32: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#32: FILE: drivers/gpu/drm/i915/display/skl_scaler.c:136:
+       (PS_FILTER_PROGRAMMED | \$

-:33: ERROR:CODE_INDENT: code indent should use tabs where possible
#33: FILE: drivers/gpu/drm/i915/display/skl_scaler.c:137:
+        PS_Y_VERT_FILTER_SELECT(1) | \$

-:33: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#33: FILE: drivers/gpu/drm/i915/display/skl_scaler.c:137:
+        PS_Y_VERT_FILTER_SELECT(1) | \$

-:34: ERROR:CODE_INDENT: code indent should use tabs where possible
#34: FILE: drivers/gpu/drm/i915/display/skl_scaler.c:138:
+        PS_Y_HORZ_FILTER_SELECT(0) | \$

-:34: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#34: FILE: drivers/gpu/drm/i915/display/skl_scaler.c:138:
+        PS_Y_HORZ_FILTER_SELECT(0) | \$

-:35: ERROR:CODE_INDENT: code indent should use tabs where possible
#35: FILE: drivers/gpu/drm/i915/display/skl_scaler.c:139:
+        PS_UV_VERT_FILTER_SELECT(1) | \$

-:35: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#35: FILE: drivers/gpu/drm/i915/display/skl_scaler.c:139:
+        PS_UV_VERT_FILTER_SELECT(1) | \$

-:36: ERROR:CODE_INDENT: code indent should use tabs where possible
#36: FILE: drivers/gpu/drm/i915/display/skl_scaler.c:140:
+        PS_UV_HORZ_FILTER_SELECT(0))$

-:36: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#36: FILE: drivers/gpu/drm/i915/display/skl_scaler.c:140:
+        PS_UV_HORZ_FILTER_SELECT(0))$

-:62: CHECK:MULTIPLE_ASSIGNMENTS: multiple assignments should be avoided
#62: FILE: drivers/gpu/drm/i915/display/skl_scaler.c:694:
+	x = y = 0;

total: 4 errors, 5 warnings, 1 checks, 71 lines checked
3b63170c706a drm/i915/display: Enable the second scaler for sharpness
23bd1a2c04f7 drm/i915/display: Add registers and compute the strength
550606063d2d drm/i915/display: Load the lut values and enable sharpness


