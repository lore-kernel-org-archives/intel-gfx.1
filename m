Return-Path: <SRS0=S4gL=NN=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5BBCC4338F
	for <intel-gfx@archiver.kernel.org>; Sun, 22 Aug 2021 16:42:19 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 864FD61266
	for <intel-gfx@archiver.kernel.org>; Sun, 22 Aug 2021 16:42:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 864FD61266
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D011789AFF;
	Sun, 22 Aug 2021 16:42:18 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 339E489AFF;
 Sun, 22 Aug 2021 16:42:17 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 15901A73C7;
 Sun, 22 Aug 2021 16:42:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ayaz A Siddiqui" <ayaz.siddiqui@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Sun, 22 Aug 2021 16:42:17 -0000
Message-ID: <162965053705.11138.15698963754858154462@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20210822162706.819507-1-ayaz.siddiqui@intel.com>
In-Reply-To: <20210822162706.819507-1-ayaz.siddiqui@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_drm/i915/lmem=3A_Enable_device_memory_support_for_DG2?=
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

Series: drm/i915/lmem: Enable device memory support for DG2
URL   : https://patchwork.freedesktop.org/series/93904/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
d96ba2006a6a drm/i915: Add has_64k_pages flag
6ba41b6b2c87 drm/i915/xehpsdv: set min page-size to 64K
00fb079092d9 drm/i915/xehpsdv: enforce min GTT alignment
1e386ec5b392 drm/i915/gem: Remove unused i915_gem_lmem_obj_ops
e14c5791cf60 drm/i915: enforce min page size for scratch
bb305eaba00b drm/i915/gtt/xehpsdv: move scratch page to system memory
ef698973c78e drm/i915/xehpsdv: support 64K GTT pages
2593fa6f3554 drm/i915: Add vm min alignment support
75128fae26bb drm/i915/selftests: account for min_alignment in GTT selftests
-:108: WARNING:DEEP_INDENTATION: Too many leading tabs - consider code refactoring
#108: FILE: drivers/gpu/drm/i915/selftests/i915_gem_gtt.c:456:
+						if (offset < hole_start + aligned_size)

-:120: WARNING:DEEP_INDENTATION: Too many leading tabs - consider code refactoring
#120: FILE: drivers/gpu/drm/i915/selftests/i915_gem_gtt.c:480:
+						if (offset + aligned_size > hole_end)

-:138: WARNING:DEEP_INDENTATION: Too many leading tabs - consider code refactoring
#138: FILE: drivers/gpu/drm/i915/selftests/i915_gem_gtt.c:496:
+						if (offset < hole_start + aligned_size)

-:150: WARNING:DEEP_INDENTATION: Too many leading tabs - consider code refactoring
#150: FILE: drivers/gpu/drm/i915/selftests/i915_gem_gtt.c:519:
+						if (offset + aligned_size > hole_end)

-:168: WARNING:DEEP_INDENTATION: Too many leading tabs - consider code refactoring
#168: FILE: drivers/gpu/drm/i915/selftests/i915_gem_gtt.c:535:
+						if (offset < hole_start + aligned_size)

-:180: WARNING:DEEP_INDENTATION: Too many leading tabs - consider code refactoring
#180: FILE: drivers/gpu/drm/i915/selftests/i915_gem_gtt.c:559:
+						if (offset + aligned_size > hole_end)

-:198: WARNING:DEEP_INDENTATION: Too many leading tabs - consider code refactoring
#198: FILE: drivers/gpu/drm/i915/selftests/i915_gem_gtt.c:575:
+						if (offset < hole_start + aligned_size)

-:210: WARNING:DEEP_INDENTATION: Too many leading tabs - consider code refactoring
#210: FILE: drivers/gpu/drm/i915/selftests/i915_gem_gtt.c:598:
+						if (offset + aligned_size > hole_end)

total: 0 errors, 8 warnings, 0 checks, 297 lines checked
ad751b4ca2fb drm/i915/xehpsdv: implement memory coloring
ef7a6211c866 drm/i915/xehpsdv: Add has_flat_ccs to device info
ea82c71e78be drm/i915/lmem: Enable lmem for platforms with Flat CCS
-:70: CHECK:LINE_SPACING: Please don't use multiple blank lines
#70: FILE: drivers/gpu/drm/i915/gt/intel_region_lmem.c:205:
 
+

total: 0 errors, 0 warnings, 1 checks, 70 lines checked
136640c27dc2 drm/i915/gt: Clear compress metadata for Gen12.5 >= platforms


