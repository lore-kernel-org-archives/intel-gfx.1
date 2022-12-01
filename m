Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B5B4C43217
	for <intel-gfx@archiver.kernel.org>; Thu,  1 Dec 2022 15:01:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 455E310E087;
	Thu,  1 Dec 2022 15:01:05 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 31C7110E087;
 Thu,  1 Dec 2022 15:01:01 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 0109BAADD8;
 Thu,  1 Dec 2022 15:01:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Andi Shyti" <andi.shyti@linux.intel.com>
Date: Thu, 01 Dec 2022 15:01:00 -0000
Message-ID: <166990686097.14637.8360600405173708334@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20221130235805.221010-1-andi.shyti@linux.intel.com>
In-Reply-To: <20221130235805.221010-1-andi.shyti@linux.intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_add_guard_padding_around_i915=5Fvma_=28rev5=29?=
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

Series: add guard padding around i915_vma (rev5)
URL   : https://patchwork.freedesktop.org/series/110720/
State : warning

== Summary ==

Error: dim checkpatch failed
009020c6bd1a drm/i915: Limit the display memory alignment to 32 bit instead of 64
724ab32df37d drm/i915: Wrap all access to i915_vma.node.start|size
-:264: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#264: FILE: drivers/gpu/drm/i915/gem/selftests/i915_gem_client_blt.c:475:
+	GEM_BUG_ON(i915_vma_offset(vma) != addr);

-:356: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#356: FILE: drivers/gpu/drm/i915/gem/selftests/igt_gem_utils.c:65:
+	GEM_BUG_ON(offset + (count - 1) * PAGE_SIZE > i915_vma_size(vma));

-:393: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#393: FILE: drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c:223:
+		GEM_BUG_ON(vma->fence_size > i915_vma_size(vma));

-:787: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#787: FILE: drivers/gpu/drm/i915/i915_vma.c:450:
+	GEM_BUG_ON(vma->size > i915_vma_size(vma));

-:870: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#870: FILE: drivers/gpu/drm/i915/i915_vma.h:146:
+	GEM_BUG_ON(!drm_mm_node_allocated(&vma->node));

-:892: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#892: FILE: drivers/gpu/drm/i915/i915_vma.h:168:
+	GEM_BUG_ON(!drm_mm_node_allocated(&vma->node));

-:903: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#903: FILE: drivers/gpu/drm/i915/i915_vma.h:176:
+	GEM_BUG_ON(upper_32_bits(i915_vma_offset(vma)));

-:904: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#904: FILE: drivers/gpu/drm/i915/i915_vma.h:177:
+	GEM_BUG_ON(upper_32_bits(i915_vma_offset(vma) +

total: 0 errors, 8 warnings, 0 checks, 805 lines checked
a37e430ffc37 drm/i915: Introduce guard pages to i915_vma
-:119: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#119: FILE: drivers/gpu/drm/i915/i915_vma.c:762:
+	GEM_BUG_ON(hweight64(flags & (PIN_OFFSET_GUARD | PIN_OFFSET_FIXED | PIN_OFFSET_BIAS)) > 1);

-:133: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#133: FILE: drivers/gpu/drm/i915/i915_vma.c:778:
+		GEM_BUG_ON(overflows_type(flags & PIN_OFFSET_MASK, u32));

-:226: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_node' - possible side-effects?
#226: FILE: drivers/gpu/drm/i915/i915_vma_resource.c:37:
+#define VMA_RES_START(_node) ((_node)->start - (_node)->guard)

-:227: CHECK:MACRO_ARG_REUSE: Macro argument reuse '_node' - possible side-effects?
#227: FILE: drivers/gpu/drm/i915/i915_vma_resource.c:38:
+#define VMA_RES_LAST(_node) ((_node)->start + (_node)->node_size + (_node)->guard - 1)

total: 0 errors, 2 warnings, 2 checks, 205 lines checked
3e29ca8fdd75 drm/i915: Refine VT-d scanout workaround
7cc593c798e7 Revert "drm/i915: Improve on suspend / resume time with VT-d enabled"


