Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F70DC4706C
	for <intel-gfx@archiver.kernel.org>; Tue, 16 Jan 2024 09:02:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D710A10E18A;
	Tue, 16 Jan 2024 09:02:45 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6635610E18A;
 Tue, 16 Jan 2024 09:02:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2ECHECKPATCH=3A_warning_for_drm/i915=3A_=28stole?=
 =?utf-8?q?n=29_memory_region_related_fixes_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Date: Tue, 16 Jan 2024 09:02:44 -0000
Message-ID: <170539576441.500854.2762013483487057586@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240116075636.6121-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20240116075636.6121-1-ville.syrjala@linux.intel.com>
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

Series: drm/i915: (stolen) memory region related fixes (rev6)
URL   : https://patchwork.freedesktop.org/series/127721/
State : warning

== Summary ==

Error: dim checkpatch failed
72a9e5460135 drm/i915: Use struct resource for memory region IO as well
-:387: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#387: FILE: drivers/gpu/drm/i915/intel_region_ttm.c:227:
+			if (WARN_ON(overflows_type(resource_size(&mem->io) >> PAGE_SHIFT, place.lpfn))) {

total: 0 errors, 1 warnings, 0 checks, 281 lines checked
04c5e770efde drm/i915: Print memory region info during probe
a7d0ba6c8a13 drm/i915: Remove ad-hoc lmem/stolen debugs
29a8a9da9fa3 drm/i915: Bypass LMEMBAR/GTTMMADR for MTL stolen memory access
516154c02d82 drm/i915: Disable the "binder"
dcd84ee46528 drm/i915: Rename the DSM/GSM registers
5d36651d103b drm/i915: Fix PTE decode during initial plane readout
c4b43d6e7c3b drm/i915: Fix region start during initial plane readout
0a52c22fa07c drm/i915: Fix MTL initial plane readout
2152a95323ef drm/i915: s/phys_base/dma_addr/
cc095e647e13 drm/i915: Split the smem and lmem plane readout apart
a36eb1e75a76 drm/i915: Simplify intel_initial_plane_config() calling convention
e66cb88c8697 drm/i915/fbdev: Fix smem_start for LMEMBAR stolen objects
90b4fdfecf0b drm/i915: Tweak BIOS fb reuse check
66f0e8965f66 drm/i915: Try to relocate the BIOS fb to the start of ggtt
-:104: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#104: FILE: drivers/gpu/drm/i915/display/i9xx_plane.h:51:
 }
+static inline bool i9xx_fixup_initial_plane_config(struct intel_crtc *crtc,

-:105: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#105: FILE: drivers/gpu/drm/i915/display/i9xx_plane.h:52:
+						   const struct intel_initial_plane_config *plane_config)

total: 0 errors, 1 warnings, 1 checks, 229 lines checked
9dc34e4ff2f9 drm/i915: Annotate more of the BIOS fb takeover failure paths


