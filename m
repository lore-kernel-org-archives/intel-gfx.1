Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 882F3C48292
	for <intel-gfx@archiver.kernel.org>; Mon,  5 Feb 2024 21:17:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A2C910E6BA;
	Mon,  5 Feb 2024 21:16:56 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9A6110E6BA;
 Mon,  5 Feb 2024 21:16:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2ECHECKPATCH=3A_warning_for_drm/i915/dsc=3A_Fix_?=
 =?utf-8?q?the_macro_that_calculates_DSCC=5F/DSCA=5F_PPS_reg_address_=28rev2?=
 =?utf-8?q?=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Manasi Navare" <navaremanasi@chromium.org>
Cc: intel-gfx@lists.freedesktop.org
Date: Mon, 05 Feb 2024 21:16:54 -0000
Message-ID: <170716781495.1024443.1305707327648614694@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240205204619.1991673-1-navaremanasi@chromium.org>
In-Reply-To: <20240205204619.1991673-1-navaremanasi@chromium.org>
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

Series: drm/i915/dsc: Fix the macro that calculates DSCC_/DSCA_ PPS reg address (rev2)
URL   : https://patchwork.freedesktop.org/series/129486/
State : warning

== Summary ==

Error: dim checkpatch failed
6a38025388cc drm/i915/dsc: Fix the macro that calculates DSCC_/DSCA_ PPS reg address
-:7: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#7: 
Commit bd077259d0a9 ("drm/i915/vdsc: Add function to read any PPS register") defines

-:45: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#45: FILE: drivers/gpu/drm/i915/display/intel_vdsc_regs.h:54:
+#define DSCA_PPS(pps)				_MMIO(_DSCA_PPS_0 + ((pps) < 12 ? (pps):(pps) + 12) * 4)

-:45: CHECK:SPACING: spaces required around that ':' (ctx:VxV)
#45: FILE: drivers/gpu/drm/i915/display/intel_vdsc_regs.h:54:
+#define DSCA_PPS(pps)				_MMIO(_DSCA_PPS_0 + ((pps) < 12 ? (pps):(pps) + 12) * 4)
                      				                                       ^

-:45: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'pps' - possible side-effects?
#45: FILE: drivers/gpu/drm/i915/display/intel_vdsc_regs.h:54:
+#define DSCA_PPS(pps)				_MMIO(_DSCA_PPS_0 + ((pps) < 12 ? (pps):(pps) + 12) * 4)

-:46: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#46: FILE: drivers/gpu/drm/i915/display/intel_vdsc_regs.h:55:
+#define DSCC_PPS(pps)				_MMIO(_DSCC_PPS_0 + ((pps) < 12 ? (pps):(pps) + 12) * 4)

-:46: CHECK:SPACING: spaces required around that ':' (ctx:VxV)
#46: FILE: drivers/gpu/drm/i915/display/intel_vdsc_regs.h:55:
+#define DSCC_PPS(pps)				_MMIO(_DSCC_PPS_0 + ((pps) < 12 ? (pps):(pps) + 12) * 4)
                      				                                       ^

-:46: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'pps' - possible side-effects?
#46: FILE: drivers/gpu/drm/i915/display/intel_vdsc_regs.h:55:
+#define DSCC_PPS(pps)				_MMIO(_DSCC_PPS_0 + ((pps) < 12 ? (pps):(pps) + 12) * 4)

total: 0 errors, 3 warnings, 4 checks, 10 lines checked


