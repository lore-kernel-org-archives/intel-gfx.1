Return-Path: <SRS0=685S=O5=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AEB3C433EF
	for <intel-gfx@archiver.kernel.org>; Sat,  9 Oct 2021 00:05:47 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A35D660FC3
	for <intel-gfx@archiver.kernel.org>; Sat,  9 Oct 2021 00:05:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A35D660FC3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 056AF6E89B;
	Sat,  9 Oct 2021 00:05:46 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id B67F36E89A;
 Sat,  9 Oct 2021 00:05:44 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id AED29A00FD;
 Sat,  9 Oct 2021 00:05:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Sat, 09 Oct 2021 00:05:44 -0000
Message-ID: <163373794470.8821.13882943807399457763@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20211008215635.2026385-1-matthew.d.roper@intel.com>
In-Reply-To: <20211008215635.2026385-1-matthew.d.roper@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_i915=3A_Initial_multi-tile_support_=28rev2=29?=
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

Series: i915: Initial multi-tile support (rev2)
URL   : https://patchwork.freedesktop.org/series/95631/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
2226b987792c drm/i915: rework some irq functions to take intel_gt as argument
-:17: WARNING:BAD_SIGN_OFF: Non-standard signature: Co-authored-by:
#17: 
Co-authored-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

total: 0 errors, 1 warnings, 0 checks, 75 lines checked
e0ff68ad5d2c drm/i915: split general MMIO setup from per-GT uncore init
bda304cedcf1 drm/i915: Restructure probe to handle multi-tile platforms
35a19ffd0117 drm/i915: Store backpointer to GT in uncore
ca609d95d12f drm/i915: Prepare for multiple gts
-:179: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#179: FILE: drivers/gpu/drm/i915/gt/intel_gt.h:91:
+#define for_each_gt(i915__, id__, gt__) \
+	for ((id__) = 0; \
+	     (id__) < I915_MAX_TILES; \
+	     (id__)++) \
+		for_each_if (((gt__) = (i915__)->gts[(id__)]))

-:179: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'id__' - possible side-effects?
#179: FILE: drivers/gpu/drm/i915/gt/intel_gt.h:91:
+#define for_each_gt(i915__, id__, gt__) \
+	for ((id__) = 0; \
+	     (id__) < I915_MAX_TILES; \
+	     (id__)++) \
+		for_each_if (((gt__) = (i915__)->gts[(id__)]))

-:183: WARNING:SPACING: space prohibited between function name and open parenthesis '('
#183: FILE: drivers/gpu/drm/i915/gt/intel_gt.h:95:
+		for_each_if (((gt__) = (i915__)->gts[(id__)]))

total: 1 errors, 1 warnings, 1 checks, 192 lines checked
e9cb525007df drm/i915: Initial support for per-tile uncore
2f61fef5cee6 drm/i915/xehp: Determine which tile raised an interrupt
d0ba3e4e7b13 drm/i915/xehp: Make IRQ reset and postinstall multi-tile aware
6a3bf9cfb5b1 drm/i915/guc: Update CT debug macro for multi-tile
9d78e0b7d2fa drm/i915: Release per-gt resources allocated
7702b40e06c2 drm/i915/xehpsdv: Initialize multi-tiles
-:255: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#255: FILE: drivers/gpu/drm/i915/i915_pci.c:1012:
+#define XE_HP_SDV_ENGINES \
+	BIT(BCS0) | \
+	BIT(VECS0) | BIT(VECS1) | BIT(VECS2) | BIT(VECS3) | \
+	BIT(VCS0) | BIT(VCS1) | BIT(VCS2) | BIT(VCS3) | \
+	BIT(VCS4) | BIT(VCS5) | BIT(VCS6) | BIT(VCS7)

total: 1 errors, 0 warnings, 0 checks, 284 lines checked


