Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25372C47077
	for <intel-gfx@archiver.kernel.org>; Thu, 11 Jan 2024 17:08:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92B9510E95B;
	Thu, 11 Jan 2024 17:08:33 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D33FE10E0B6;
 Thu, 11 Jan 2024 17:08:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2ECHECKPATCH=3A_warning_for_drm/i915=3A_=28stole?=
 =?utf-8?q?n=29_memory_region_related_fixes_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Date: Thu, 11 Jan 2024 17:08:32 -0000
Message-ID: <170499291286.290001.1160828803000433634@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20231215105929.29568-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20231215105929.29568-1-ville.syrjala@linux.intel.com>
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
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/i915: (stolen) memory region related fixes (rev5)
URL   : https://patchwork.freedesktop.org/series/127721/
State : warning

== Summary ==

Error: dim checkpatch failed
7b17768b17bb drm/i915: Use struct resource for memory region IO as well
-:387: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#387: FILE: drivers/gpu/drm/i915/intel_region_ttm.c:227:
+			if (WARN_ON(overflows_type(resource_size(&mem->io) >> PAGE_SHIFT, place.lpfn))) {

total: 0 errors, 1 warnings, 0 checks, 281 lines checked
71157eb1e1c6 drm/i915: Print memory region info during probe
b250bb73e28b drm/i915: Remove ad-hoc lmem/stolen debugs
5f3a02a88098 drm/i915: Bypass LMEMBAR/GTTMMADR for MTL stolen memory access
c9effba48ecc drm/i915: Disable the "binder"
0aebb3e3f6ac drm/i915: Rename the DSM/GSM registers
3cd98d29fad2 drm/i915: Fix PTE decode during initial plane readout
8d4c2360122c drm/i915: Fix region start during initial plane readout
7204cbe34643 drm/i915: Fix MTL initial plane readout
950abaacdd21 drm/i915: s/phys_base/dma_addr/
376fcecb5bde drm/i915: Split the smem and lmem plane readout apart
a575fbba837a drm/i915: Simplify intel_initial_plane_config() calling convention
f0a9ec350dc8 drm/i915/fbdev: Fix smem_start for LMEMBAR stolen objects
a417d5d1eff7 drm/i915: Tweak BIOS fb reuse check
742d185cb344 drm/i915: Try to relocate the BIOS fb to the start of ggtt
-:104: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#104: FILE: drivers/gpu/drm/i915/display/i9xx_plane.h:51:
 }
+static inline bool i9xx_fixup_initial_plane_config(struct intel_crtc *crtc,

-:105: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#105: FILE: drivers/gpu/drm/i915/display/i9xx_plane.h:52:
+						   const struct intel_initial_plane_config *plane_config)

total: 0 errors, 1 warnings, 1 checks, 229 lines checked


