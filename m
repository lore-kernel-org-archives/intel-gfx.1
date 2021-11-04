Return-Path: <SRS0=bagb=PX=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAC75C433F5
	for <intel-gfx@archiver.kernel.org>; Thu,  4 Nov 2021 18:47:28 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6959C601FA
	for <intel-gfx@archiver.kernel.org>; Thu,  4 Nov 2021 18:47:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6959C601FA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2768734BB;
	Thu,  4 Nov 2021 18:47:27 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0286A734BB;
 Thu,  4 Nov 2021 18:47:26 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id EF590A0078;
 Thu,  4 Nov 2021 18:47:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Date: Thu, 04 Nov 2021 18:47:25 -0000
Message-ID: <163605164595.6350.8177294430772707144@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20211104144520.22605-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20211104144520.22605-1-ville.syrjala@linux.intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_drm/i915/fbc=3A_Prep_work_for_multiple_FBC_instances?=
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

Series: drm/i915/fbc: Prep work for multiple FBC instances
URL   : https://patchwork.freedesktop.org/series/96574/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
7fa3e082ea85 drm/i915/fbc: Exract snb_fbc_program_fence()
e1a5292108ab drm/i915/fbc: Extract {skl, glk}_fbc_program_cfb_stride()
fc541fc8c2a7 drm/i915/fbc: Just use params->fence_y_offset always
b1275bed2070 drm/i915/fbc: Introduce intel_fbc_is_compressing()
1390bd7243c3 drm/i915/fbc: Extract helpers to compute FBC control register values
05ce4c3071c0 drm/i915/fbc: Introduce intel_fbc_funcs
991051ec457e drm/i915/fbc: Introduce .nuke() vfunc
02c4e4bb8f9d drm/i915/fbc: s/gen7/ivb/
e55fd73632d8 drm/i915/fbc: Introduce .program_cfb() vfunc
412acd0ad146 drm/i915/fbc: Introduce intel_fbc_set_false_color()
32266e2be84c drm/i915/fbc: Nuke BDW_FBC_COMP_SEG_MASK
a78d97623284 drm/i915/fbc: Clean up all register defines
-:131: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#131: FILE: drivers/gpu/drm/i915/i915_reg.h:3353:
+#define   DPFC_CTL_PLANE_G4X(i9xx_plane)	REG_FIELD_PREP(DPFC_CTL_PLANE_MASK_G4X, (i9xx_plane))

-:134: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#134: FILE: drivers/gpu/drm/i915/i915_reg.h:3356:
+#define   DPFC_CTL_PLANE_IVB(i9xx_plane)	REG_FIELD_PREP(DPFC_CTL_PLANE_MASK_IVB, (i9xx_plane))

total: 0 errors, 2 warnings, 0 checks, 243 lines checked
6b0b7ff03e2c drm/i915/fbc: Finish polishing FBC1 registers
c057c12826b1 drm/i915: Relocate FBC_LLC_READ_CTRL
1d79dbe56509 drm/i915/fbc: s/dev_priv/i915/
-:456: WARNING:LONG_LINE: line length of 212 exceeds 100 columns
#456: FILE: drivers/gpu/drm/i915/display/intel_fbc.c:759:
+		drm_info_once(&i915->drm, "not enough stolen space for compressed buffer (need %d more bytes), disabling. Hint: you may be able to increase stolen memory size in the BIOS to avoid this.\n", size);

total: 0 errors, 1 warnings, 0 checks, 1255 lines checked
d1bb3d3caea2 drm/i915/fbc: Start passing around intel_fbc
99847819aedc drm/1915/fbc: Replace plane->has_fbc with a pointer to the fbc instance


