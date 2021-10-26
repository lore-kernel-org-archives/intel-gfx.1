Return-Path: <SRS0=bGS0=PO=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89D1EC433EF
	for <intel-gfx@archiver.kernel.org>; Tue, 26 Oct 2021 23:53:32 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5CD4160E74
	for <intel-gfx@archiver.kernel.org>; Tue, 26 Oct 2021 23:53:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5CD4160E74
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9254789EA6;
	Tue, 26 Oct 2021 23:53:29 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5003C89EA6;
 Tue, 26 Oct 2021 23:53:28 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 45F19A7525;
 Tue, 26 Oct 2021 23:53:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Tue, 26 Oct 2021 23:53:28 -0000
Message-ID: <163529240828.9776.2960011366539516873@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20211026225105.2783797-1-imre.deak@intel.com>
In-Reply-To: <20211026225105.2783797-1-imre.deak@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_drm/i915/adlp/fb=3A_Remove_CCS_FB_stride_restrictions?=
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

Series: drm/i915/adlp/fb: Remove CCS FB stride restrictions
URL   : https://patchwork.freedesktop.org/series/96322/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
9cba4428b32d drm/i915/fb: Fix rounding error in subsampled plane size calculation
a3c4b2242791 drm/i915/adlp/fb: Prevent the mapping of redundant trailing padding NULL pages
cc21aac93ca8 drm/i915/fb: Factor out functions to remap contiguous FB obj pages
afe502a5c79a drm/i915/adlp/fb: Fix remapping of linear CCS AUX surfaces
-:117: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'var' - possible side-effects?
#117: FILE: drivers/gpu/drm/i915/display/intel_fb.c:1312:
+#define assign_bfld_chk_ovf(i915, var, val) ({ \
+	(var) = (val); \
+	drm_WARN_ON(&(i915)->drm, (var) != (val)); \
+	(var); \
+})

-:117: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'val' - possible side-effects?
#117: FILE: drivers/gpu/drm/i915/display/intel_fb.c:1312:
+#define assign_bfld_chk_ovf(i915, var, val) ({ \
+	(var) = (val); \
+	drm_WARN_ON(&(i915)->drm, (var) != (val)); \
+	(var); \
+})

total: 0 errors, 0 warnings, 2 checks, 318 lines checked
c22064ad4251 drm/i915/fb: Rename i915_color_plane_view::stride to mapping_stride
02233c237439 drm/i915/adlp/fb: Remove restriction on semiplanar UV plane offset
b599bcdbbdaf drm/i915/adlp/fb: Remove restriction on CCS AUX plane strides


