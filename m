Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F29EFC369D3
	for <intel-gfx@archiver.kernel.org>; Wed, 23 Apr 2025 10:10:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A2BD10E66D;
	Wed, 23 Apr 2025 10:10:32 +0000 (UTC)
Received: from b68e5b3b99e1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3663C10E678;
 Wed, 23 Apr 2025 10:10:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2ECHECKPATCH=3A_warning_for_LOBF_enablement_fix_?=
 =?utf-8?q?=28rev10=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Animesh Manna" <animesh.manna@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Wed, 23 Apr 2025 10:10:31 -0000
Message-ID: <174540303121.28825.10461881986973457996@b68e5b3b99e1>
X-Patchwork-Hint: ignore
References: <20250423092334.2294483-1-animesh.manna@intel.com>
In-Reply-To: <20250423092334.2294483-1-animesh.manna@intel.com>
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

Series: LOBF enablement fix (rev10)
URL   : https://patchwork.freedesktop.org/series/141974/
State : warning

== Summary ==

Error: dim checkpatch failed
b53ba73df55c drm/i915/alpm: use variable from intel_crtc_state instead of intel_psr
52016359761f drm/i915/lobf: Add lobf enablement in post plane update
89bddd6ed3e6 drm/i915/lobf: Add debug print for LOBF
dfd5256e14c7 drm/i915/lobf: Disintegrate alpm_disable from psr_disable
b8a81b21de99 drm/i915/lobf: Add fixed refresh rate check in compute_config()
1bc2728411c7 drm/i915/lobf: Update lobf if any change in dependent parameters
6d76b4dcdaed drm/i915/lobf: Add debug interface for lobf
ebe5597f9095 drm/i915/lobf: Add mutex for alpm update
-:100: CHECK:UNCOMMENTED_DEFINITION: struct mutex definition without comment
#100: FILE: drivers/gpu/drm/i915/display/intel_display_types.h:1809:
+		struct mutex lock;

total: 0 errors, 0 warnings, 1 checks, 76 lines checked
a2a57392545e drm/i915/lobf: Check for sink error and disable LOBF
4e2b5a4bbf52 drm/i915/alpm: Add intel_psr_need_alpm() to simplify alpm check
9b8be2d18605 drm/i915/display: Disintegrate sink alpm enable from psr with lobf


