Return-Path: <SRS0=EqF4=GR=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5727C433E0
	for <intel-gfx@archiver.kernel.org>; Thu, 14 Jan 2021 21:39:41 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85CFC2389B
	for <intel-gfx@archiver.kernel.org>; Thu, 14 Jan 2021 21:39:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 85CFC2389B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 001936E03C;
	Thu, 14 Jan 2021 21:39:40 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 660B36E03B;
 Thu, 14 Jan 2021 21:39:40 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 5FD5DA7DFF;
 Thu, 14 Jan 2021 21:39:40 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Date: Thu, 14 Jan 2021 21:39:40 -0000
Message-ID: <161066038036.19647.4197751523004864269@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20210114201314.783648-1-imre.deak@intel.com>
In-Reply-To: <20210114201314.783648-1-imre.deak@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_drm/i915/gen12=3A_Add_display_render_clear_color_decompress?=
 =?utf-8?q?ion_support?=
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/i915/gen12: Add display render clear color decompression support
URL   : https://patchwork.freedesktop.org/series/85877/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
89e07f063541 drm/framebuffer: Format modifier for Intel Gen 12 render compression with Clear Color
45aadd34aaa8 drm/i915/gem: Add a helper to read data from a GEM object page
-:34: WARNING:LONG_LINE: line length of 111 exceeds 100 columns
#34: FILE: drivers/gpu/drm/i915/gem/i915_gem_object.c:388:
+i915_gem_object_read_from_page_kmap(struct drm_i915_gem_object *obj, unsigned long offset, int size, void *dst)

-:50: WARNING:LONG_LINE: line length of 112 exceeds 100 columns
#50: FILE: drivers/gpu/drm/i915/gem/i915_gem_object.c:404:
+i915_gem_object_read_from_page_iomap(struct drm_i915_gem_object *obj, unsigned long offset, int size, void *dst)

-:76: WARNING:TYPO_SPELLING: 'sucess' may be misspelled - perhaps 'success'?
#76: FILE: drivers/gpu/drm/i915/gem/i915_gem_object.c:430:
+ * Returns 0 on sucess, negative error code on failre.
                 ^^^^^^

-:78: WARNING:LONG_LINE: line length of 113 exceeds 100 columns
#78: FILE: drivers/gpu/drm/i915/gem/i915_gem_object.c:432:
+int i915_gem_object_read_from_page(struct drm_i915_gem_object *obj, unsigned long offset, size_t size, void *dst)

-:118: WARNING:LONG_LINE: line length of 114 exceeds 100 columns
#118: FILE: drivers/gpu/drm/i915/gem/i915_gem_object.h:543:
+int i915_gem_object_read_from_page(struct drm_i915_gem_object *obj, unsigned long offset, size_t size, void *dst);

total: 0 errors, 5 warnings, 0 checks, 93 lines checked
89044f4fa5e2 drm/i915/tgl: Add Clear Color support for TGL Render Decompression
-:235: WARNING:SIZEOF_ADDRESS: sizeof(& should be avoided
#235: FILE: drivers/gpu/drm/i915/display/intel_display.c:15299:
+						     sizeof(&plane_state->ccval),

-:360: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'pipe' - possible side-effects?
#360: FILE: drivers/gpu/drm/i915/i915_reg.h:7120:
+#define PLANE_CC_VAL(pipe, plane)	\
+	_MMIO_PLANE(plane, _PLANE_CC_VAL_1(pipe), _PLANE_CC_VAL_2(pipe))

total: 0 errors, 1 warnings, 1 checks, 280 lines checked


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
