Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8647C98318
	for <intel-gfx@archiver.kernel.org>; Thu, 24 Sep 2026 15:25:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E6DA10F663;
	Thu, 24 Sep 2026 15:25:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YB61Cy/a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB98110F65F;
 Thu, 24 Sep 2026 15:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790263503; x=1821799503;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UZUJs5PpWzyOtWvUWxR5iOIQxuwjjD/IdJnWpiYpLTI=;
 b=YB61Cy/alziBZUSyzd3El6fm28aHCThfVCW7gVPw86LUda/h1NSHLT1T
 /wwQtdLw+O+4pSrkP9LCWK7cMrs0SrwBeYHozfulicgw2GPqx7Ei6o+oN
 G6zXjGsx3rYAK1VGUL8+2sag6KrW+Xx814HW7G1nDOlX8e/jhT+2XOHtZ
 0+eL9fu090Sv5RrGsgItjrLJcxDTwjdRVuOoUYurXfqfEYzVVt31f1Xq1
 V+NFvnxgE69KYOxc4MZDvo0GxJ4CaApZLvz41YrfqS/oMZMuDJnnudkcH
 HmUq5n66q/G0RBv6ZQLWjc+gIWaAPtjWjjs+4yF0I3LIekom7+7+7Y95x Q==;
X-CSE-ConnectionGUID: rpk5HnolQ6OijGkGzEyGmA==
X-CSE-MsgGUID: bPp15yk+QgGUcg/+h5LUdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="91058144"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; d="scan'208";a="91058144"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 08:25:02 -0700
X-CSE-ConnectionGUID: G7MfP0n5TbidhlQF5EFXOA==
X-CSE-MsgGUID: KJTBeoSaTcqFjZdh+DZMeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; d="scan'208";a="301981462"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.29])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 08:25:00 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: [PATCH i-g-t 0/2] tests/intel: Don't probe intel_allocator offsets
 without full-ppgtt
Date: Thu, 24 Sep 2026 17:24:16 +0200
Message-ID: <20260924152443.829382-4-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

tests/intel/gem_softpin@safe-alignment has been occasionally failing
in CI with -ENOSPC, tracked as:

  https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/15527

The failure is sporadic and hardware-specific rather than
deterministic: the very same fi-hsw-4770 CI machine was observed both
failing and succeeding this subtest across different runs of
otherwise identical test lists.

Debug logging added by commit 90caf93a2a859388c10e1413594f764154f762e3
("tests/intel/gem_softpin: Show debug info also on success") to also
report the detected offset/alignment values on success, not just on
failure, showed that gem_detect_min_start_offset_for_region()
occasionally reports different values across otherwise identical runs
on the same aliasing-ppgtt hardware.

Root-caused as follows (full write-up on the work item above):
a PAGE_SIZE gap transiently opens up in the GGTT on aliasing-ppgtt
platforms right after driver probe, caused by late release of an
object pinned early for workaround validation, overlapping with an
fbdev framebuffer object pinned into the same slot right after; once
the workaround object is finally released, the gap is left behind.
gem_detect_min_start_offset_for_region() can observe that transient
gap and report it as a safe low offset, when it is in fact only
incidentally free and not reserved for our exclusive use.

That root cause, and the questions it raised about whether this
subtest belongs on integrated/aliasing-ppgtt platforms at all, led to
a closer look at gem_detect_min_start_offset_for_region(),
gem_detect_safe_start_offset() and gem_detect_safe_alignment()
(lib/i915/intel_memory_region.c). They turn out to exist for a single
purpose: bootstrapping intel_allocator's start offset and default
alignment (lib/intel_allocator.c). Every other call site in the tree
is either internal to the allocator itself or reachable only through
an active allocator handle (ahnd).

lib/intel_batchbuffer.c's __intel_bb_create() already documents why
that matters:

    If we don't have full ppgtt driver can change our addresses
    so allocator is useless in this case. Just enforce relocations
    for such gens and don't use allocator at all.

More precisely: without full-ppgtt, intel_allocator's private
placement bookkeeping isn't visible to the kernel, which remains free
to hand out addresses intel_allocator considers already reserved to
other users (under aliasing ppgtt, as observed above) or to relocate
objects on its own authority (under global gtt). Either way, values
returned by these probing helpers carry no guarantee once handed to a
plain EXEC_OBJECT_PINNED execbuf outside of an allocator-managed
context, making any test relying on them without checking
gem_uses_full_ppgtt() exercise a scenario that can't be trusted to
mean anything, and occasionally racing against unrelated kernel-owned
allocations as a result.

Auditing all call sites of the three helpers found two subtests
outside the file's already-existing full-ppgtt gated group that
called them unconditionally:

 - tests/intel/gem_softpin@safe-alignment
 - the gem_close_race fixture, used by all of its subtests whenever
   the kernel disallows relocations

Both are fixed here, each in its own patch, by additionally requiring
gem_uses_full_ppgtt(), consistent with the rest of gem_softpin.c and
with __intel_bb_create()'s own logic. All other call sites (used by
gem_ccs, gem_exercise_blt, api_intel_bb, intel_compute and the
allocator/batchbuffer libraries themselves) were checked and found to
already be correctly gated, directly or through hardware support that
implies full-ppgtt in practice.

Assisted-by: GitHub Copilot (Claude Sonnet 5)

Janusz Krzysztofik (2):
  tests/intel/gem_softpin: Skip safe-alignment without full-ppgtt
  tests/intel/gem_close_race: Skip offset probing without full-ppgtt

 tests/intel/gem_close_race.c | 19 ++++++++++++++-----
 tests/intel/gem_softpin.c    | 13 ++++++++++++-
 2 files changed, 26 insertions(+), 6 deletions(-)

-- 
2.55.0

