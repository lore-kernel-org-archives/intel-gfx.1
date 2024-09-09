Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C94C8ECE589
	for <intel-gfx@archiver.kernel.org>; Mon,  9 Sep 2024 19:35:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65C3710E1B9;
	Mon,  9 Sep 2024 19:35:36 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B65810E1B9;
 Mon,  9 Sep 2024 19:35:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2ECHECKPATCH=3A_warning_for_drm/i915/display=3A_?=
 =?utf-8?q?add_snapshot_capture/print_infra_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Mon, 09 Sep 2024 19:35:34 -0000
Message-ID: <172591053456.977796.11820877685665350368@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <cover.1725888718.git.jani.nikula@intel.com>
In-Reply-To: <cover.1725888718.git.jani.nikula@intel.com>
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

Series: drm/i915/display: add snapshot capture/print infra (rev3)
URL   : https://patchwork.freedesktop.org/series/138151/
State : warning

== Summary ==

Error: dim checkpatch failed
648fcb624b42 drm/i915: dump display parameters captured in error state, not current
-:35: WARNING:MACRO_ARG_UNUSED: Argument 'T' is not used in function-like macro
#35: FILE: drivers/gpu/drm/i915/display/intel_display_params.c:185:
+#define PRINT(T, x, ...) _param_print(p, driver_name, #x, params->x);

-:35: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'x' may be better as '(x)' to avoid precedence issues
#35: FILE: drivers/gpu/drm/i915/display/intel_display_params.c:185:
+#define PRINT(T, x, ...) _param_print(p, driver_name, #x, params->x);

-:35: WARNING:TRAILING_SEMICOLON: macros should not use a trailing semicolon
#35: FILE: drivers/gpu/drm/i915/display/intel_display_params.c:185:
+#define PRINT(T, x, ...) _param_print(p, driver_name, #x, params->x);

total: 0 errors, 2 warnings, 1 checks, 52 lines checked
c4df7e175813 drm/i915/display: add intel_display_snapshot abstraction
-:32: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#32: 
new file mode 100644

-:197: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#197: FILE: drivers/gpu/drm/i915/display/intel_overlay.h:65:
 }
+static inline void intel_overlay_snapshot_print(const struct intel_overlay_snapshot *error,

total: 0 errors, 1 warnings, 1 checks, 217 lines checked
b784a1421f7a drm/i915/display: move device info and params handling to snapshot
51f36d65ac61 drm/i915/display: move dmc snapshotting to new display snapshot


