Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB897C4345F
	for <intel-gfx@archiver.kernel.org>; Thu,  2 May 2024 12:59:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 977C910F4D4;
	Thu,  2 May 2024 12:59:54 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AC1110F4D4;
 Thu,  2 May 2024 12:59:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2ECHECKPATCH=3A_warning_for_series_starting_with?=
 =?utf-8?q?_=5B1/3=5D_drm/i915=3A_Fix_HAS=5FREGION=28=29_usage_in_intel=5Fgt?=
 =?utf-8?q?=5Fprobe=5Flmem=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Thu, 02 May 2024 12:59:52 -0000
Message-ID: <171465479256.1848758.8237271835807283443@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240502121423.1002-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20240502121423.1002-1-ville.syrjala@linux.intel.com>
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

Series: series starting with [1/3] drm/i915: Fix HAS_REGION() usage in intel_gt_probe_lmem()
URL   : https://patchwork.freedesktop.org/series/133135/
State : warning

== Summary ==

Error: dim checkpatch failed
2fb2c0fe26a2 drm/i915: Fix HAS_REGION() usage in intel_gt_probe_lmem()
-:25: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#25: FILE: drivers/gpu/drm/i915/gt/intel_gt.c:108:
+	GEM_BUG_ON(!HAS_REGION(i915, BIT(id)));

total: 0 errors, 1 warnings, 0 checks, 8 lines checked
6dbc9150d1b2 drm/i915: Pass the region ID rather than a bitmask to HAS_REGION()
-:25: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#25: FILE: drivers/gpu/drm/i915/gt/intel_gt.c:108:
+	GEM_BUG_ON(!HAS_REGION(i915, id));

total: 0 errors, 1 warnings, 0 checks, 26 lines checked
e644982e261c drm/i915: Remove counter productive REGION_* wrappers
-:33: WARNING:LONG_LINE: line length of 110 exceeds 100 columns
#33: FILE: drivers/gpu/drm/i915/i915_pci.c:658:
+	.memory_regions = BIT(INTEL_REGION_SMEM) | BIT(INTEL_REGION_LMEM_0) | BIT(INTEL_REGION_STOLEN_LMEM), \

total: 0 errors, 1 warnings, 0 checks, 43 lines checked


