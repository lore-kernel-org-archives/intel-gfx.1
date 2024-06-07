Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E3A2C27C5F
	for <intel-gfx@archiver.kernel.org>; Fri,  7 Jun 2024 13:32:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE3AB10EBD3;
	Fri,  7 Jun 2024 13:32:41 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ED1610EBD3;
 Fri,  7 Jun 2024 13:32:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2ECHECKPATCH=3A_warning_for_drm/i915=3A_gvt_regi?=
 =?utf-8?q?ster_macro_cleanups=2C_unused_macro_removals?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Fri, 07 Jun 2024 13:32:40 -0000
Message-ID: <171776716045.26305.5842232106172510835@a6498e030952>
X-Patchwork-Hint: ignore
References: <cover.1717757337.git.jani.nikula@intel.com>
In-Reply-To: <cover.1717757337.git.jani.nikula@intel.com>
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

Series: drm/i915: gvt register macro cleanups, unused macro removals
URL   : https://patchwork.freedesktop.org/series/134600/
State : warning

== Summary ==

Error: dim checkpatch failed
66e6c4a777e0 drm/i915/gvt: remove the unused end parameter from calc_index()
0e196fd9ff22 drm/i915/gvt: use proper i915_reg_t for calc_index() parameters
-:70: WARNING:LONG_LINE: line length of 107 exceeds 100 columns
#70: FILE: drivers/gpu/drm/i915/gvt/handlers.c:1013:
+	calc_index(offset, DSPSURF(dev_priv, PIPE_A), DSPSURF(dev_priv, PIPE_B), DSPSURF(dev_priv, PIPE_C))

total: 0 errors, 1 warnings, 0 checks, 53 lines checked
885bb125a4fc drm/i915/gvt: rename range variable to stride
b0aea21a9558 drm/i915/gvt: do not use implict dev_priv in DSPSURF_TO_PIPE()
-:23: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'dev_priv' - possible side-effects?
#23: FILE: drivers/gpu/drm/i915/gvt/handlers.c:1012:
+#define DSPSURF_TO_PIPE(dev_priv, offset) \
 	calc_index(offset, DSPSURF(dev_priv, PIPE_A), DSPSURF(dev_priv, PIPE_B), DSPSURF(dev_priv, PIPE_C))

total: 0 errors, 0 warnings, 1 checks, 16 lines checked
479736242c74 drm/i915: remove unused pipe/plane B register macros
f647ac1c5917 drm/i915: remove unused HSW_STEREO_3D_CTL register macros


