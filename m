Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4859EC982E6
	for <intel-gfx@archiver.kernel.org>; Mon, 21 Sep 2026 17:24:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B55AD10E03C;
	Mon, 21 Sep 2026 17:24:32 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B783210E03C;
 Mon, 21 Sep 2026 17:24:30 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1823247720044415923=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_drm/i915/display=3A_swit?=
 =?utf-8?q?ch_to_modern_drm=5Fdp=5Fdpcd*_accessors_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Mon, 21 Sep 2026 17:24:30 -0000
Message-ID: <179001147072.188434.5592023816677100192@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <cover.1789547331.git.jani.nikula@intel.com>
In-Reply-To: <cover.1789547331.git.jani.nikula@intel.com>
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

--===============1823247720044415923==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: switch to modern drm_dp_dpcd* accessors (rev2)
URL   : https://patchwork.freedesktop.org/series/174242/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_19191_full -> Patchwork_174242v2_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with Patchwork_174242v2_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in Patchwork_174242v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (10 -> 10)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in Patchwork_174242v2_full:

### IGT changes ###

#### Possible regressions ####

  * igt@perf_pmu@module-unload:
    - shard-glk:          NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-glk6/igt@perf_pmu@module-unload.html
    - shard-tglu-1:       NOTRUN -> [FAIL][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-tglu-1/igt@perf_pmu@module-unload.html

  
New tests
---------

  New tests have been introduced between CI_DRM_19191_full and Patchwork_174242v2_full:

### New IGT tests (1) ###

  * igt@kms_pm_backlight:
    - Statuses :
    - Exec time: [None] s

  

Known issues
------------

  Here are the changes found in Patchwork_174242v2_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@device_reset@unbind-reset-rebind:
    - shard-dg1:          NOTRUN -> [ABORT][3] ([i915#11814])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg1-17/igt@device_reset@unbind-reset-rebind.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-rkl:          NOTRUN -> [SKIP][4] ([i915#3555] / [i915#9323])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-7/igt@gem_ccs@block-copy-compressed.html
    - shard-dg1:          NOTRUN -> [SKIP][5] ([i915#3555] / [i915#9323])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg1-14/igt@gem_ccs@block-copy-compressed.html
    - shard-mtlp:         NOTRUN -> [SKIP][6] ([i915#3555] / [i915#9323])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-mtlp-4/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ccs@suspend-resume:
    - shard-tglu:         NOTRUN -> [SKIP][7] ([i915#9323])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-tglu-4/igt@gem_ccs@suspend-resume.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-tglu:         NOTRUN -> [SKIP][8] ([i915#6335])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-tglu-10/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_create@create-ext-set-pat:
    - shard-rkl:          NOTRUN -> [SKIP][9] ([i915#8562])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-2/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_persistence@hang:
    - shard-dg1:          NOTRUN -> [SKIP][10] ([i915#8555])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg1-12/igt@gem_ctx_persistence@hang.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-tglu-1:       NOTRUN -> [SKIP][11] ([i915#280])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-tglu-1/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_exec_balancer@invalid-bonds:
    - shard-dg1:          NOTRUN -> [SKIP][12] ([i915#4036])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg1-14/igt@gem_exec_balancer@invalid-bonds.html
    - shard-mtlp:         NOTRUN -> [SKIP][13] ([i915#4036])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-mtlp-4/igt@gem_exec_balancer@invalid-bonds.html

  * igt@gem_exec_balancer@parallel-bb-first:
    - shard-rkl:          NOTRUN -> [SKIP][14] ([i915#4525])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-2/igt@gem_exec_balancer@parallel-bb-first.html

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-tglu-1:       NOTRUN -> [SKIP][15] ([i915#4525])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-tglu-1/igt@gem_exec_balancer@parallel-ordering.html

  * igt@gem_exec_capture@capture@vecs0-lmem0:
    - shard-dg1:          NOTRUN -> [FAIL][16] ([i915#16904]) +2 other tests fail
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg1-15/igt@gem_exec_capture@capture@vecs0-lmem0.html

  * igt@gem_exec_flush@basic-batch-kernel-default-uc:
    - shard-dg1:          NOTRUN -> [SKIP][17] ([i915#3539] / [i915#4852])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg1-12/igt@gem_exec_flush@basic-batch-kernel-default-uc.html

  * igt@gem_exec_reloc@basic-wc-cpu-noreloc:
    - shard-dg1:          NOTRUN -> [SKIP][18] ([i915#3281]) +7 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg1-14/igt@gem_exec_reloc@basic-wc-cpu-noreloc.html
    - shard-mtlp:         NOTRUN -> [SKIP][19] ([i915#3281]) +2 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-mtlp-4/igt@gem_exec_reloc@basic-wc-cpu-noreloc.html

  * igt@gem_exec_reloc@basic-write-cpu-noreloc:
    - shard-dg2:          NOTRUN -> [SKIP][20] ([i915#3281])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg2-1/igt@gem_exec_reloc@basic-write-cpu-noreloc.html

  * igt@gem_exec_reloc@basic-write-read:
    - shard-rkl:          NOTRUN -> [SKIP][21] ([i915#3281]) +5 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-2/igt@gem_exec_reloc@basic-write-read.html

  * igt@gem_exec_schedule@reorder-wide:
    - shard-dg1:          NOTRUN -> [SKIP][22] ([i915#4812]) +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg1-14/igt@gem_exec_schedule@reorder-wide.html
    - shard-mtlp:         NOTRUN -> [SKIP][23] ([i915#4537] / [i915#4812])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-mtlp-4/igt@gem_exec_schedule@reorder-wide.html

  * igt@gem_fence_thrash@bo-write-verify-y:
    - shard-dg1:          NOTRUN -> [SKIP][24] ([i915#4860]) +2 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg1-12/igt@gem_fence_thrash@bo-write-verify-y.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][25] ([i915#4860])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg2-8/igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:
    - shard-mtlp:         NOTRUN -> [SKIP][26] ([i915#4860])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-mtlp-4/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html

  * igt@gem_huc_copy@huc-copy:
    - shard-rkl:          NOTRUN -> [SKIP][27] ([i915#2190])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-2/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@parallel-random-verify:
    - shard-tglu-1:       NOTRUN -> [SKIP][28] ([i915#4613])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-tglu-1/igt@gem_lmem_swapping@parallel-random-verify.html

  * igt@gem_lmem_swapping@random:
    - shard-glk:          NOTRUN -> [SKIP][29] ([i915#4613]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-glk8/igt@gem_lmem_swapping@random.html
    - shard-rkl:          NOTRUN -> [SKIP][30] ([i915#4613])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-2/igt@gem_lmem_swapping@random.html

  * igt@gem_lmem_swapping@verify-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][31] ([i915#12193])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg1-15/igt@gem_lmem_swapping@verify-ccs.html

  * igt@gem_lmem_swapping@verify-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][32] ([i915#4565])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg1-15/igt@gem_lmem_swapping@verify-ccs@lmem0.html

  * igt@gem_mmap_gtt@bad-object:
    - shard-dg2:          NOTRUN -> [SKIP][33] ([i915#4077]) +4 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg2-4/igt@gem_mmap_gtt@bad-object.html

  * igt@gem_mmap_gtt@close-race:
    - shard-dg1:          NOTRUN -> [SKIP][34] ([i915#4077]) +6 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg1-12/igt@gem_mmap_gtt@close-race.html

  * igt@gem_mmap_gtt@cpuset-medium-copy-odd:
    - shard-mtlp:         NOTRUN -> [SKIP][35] ([i915#4077]) +3 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-mtlp-4/igt@gem_mmap_gtt@cpuset-medium-copy-odd.html

  * igt@gem_mmap_wc@write-wc-read-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][36] ([i915#4083]) +4 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg1-17/igt@gem_mmap_wc@write-wc-read-gtt.html

  * igt@gem_partial_pwrite_pread@reads:
    - shard-dg1:          NOTRUN -> [SKIP][37] ([i915#3282]) +5 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg1-14/igt@gem_partial_pwrite_pread@reads.html
    - shard-mtlp:         NOTRUN -> [SKIP][38] ([i915#3282]) +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-mtlp-4/igt@gem_partial_pwrite_pread@reads.html

  * igt@gem_partial_pwrite_pread@writes-after-reads:
    - shard-rkl:          NOTRUN -> [SKIP][39] ([i915#3282]) +5 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-2/igt@gem_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_pread@exhaustion:
    - shard-glk:          NOTRUN -> [WARN][40] ([i915#2658])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-glk6/igt@gem_pread@exhaustion.html
    - shard-tglu-1:       NOTRUN -> [WARN][41] ([i915#2658])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-tglu-1/igt@gem_pread@exhaustion.html

  * igt@gem_pxp@regular-baseline-src-copy-readible:
    - shard-dg1:          NOTRUN -> [SKIP][42] ([i915#4270]) +3 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg1-14/igt@gem_pxp@regular-baseline-src-copy-readible.html

  * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
    - shard-dg2:          NOTRUN -> [SKIP][43] ([i915#4270])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg2-8/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html

  * igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:
    - shard-snb:          NOTRUN -> [SKIP][44] +92 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-snb4/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html

  * igt@gem_render_copy@yf-tiled-to-vebox-y-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][45] ([i915#8428])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-mtlp-4/igt@gem_render_copy@yf-tiled-to-vebox-y-tiled.html

  * igt@gem_softpin@evict-snoop:
    - shard-dg1:          NOTRUN -> [SKIP][46] ([i915#4885])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg1-14/igt@gem_softpin@evict-snoop.html
    - shard-mtlp:         NOTRUN -> [SKIP][47] ([i915#4885])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-mtlp-4/igt@gem_softpin@evict-snoop.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-tglu:         NOTRUN -> [SKIP][48] ([i915#3297] / [i915#3323])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-tglu-9/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
    - shard-tglu-1:       NOTRUN -> [SKIP][49] ([i915#3297])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-tglu-1/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html

  * igt@gem_userptr_blits@readonly-pwrite-unsync:
    - shard-dg1:          NOTRUN -> [SKIP][50] ([i915#3297])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg1-14/igt@gem_userptr_blits@readonly-pwrite-unsync.html
    - shard-mtlp:         NOTRUN -> [SKIP][51] ([i915#3297])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-mtlp-4/igt@gem_userptr_blits@readonly-pwrite-unsync.html

  * igt@gem_userptr_blits@sd-probe:
    - shard-dg1:          NOTRUN -> [SKIP][52] ([i915#3297] / [i915#4958])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg1-14/igt@gem_userptr_blits@sd-probe.html

  * igt@gem_userptr_blits@unsync-overlap:
    - shard-rkl:          NOTRUN -> [SKIP][53] ([i915#3297]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-2/igt@gem_userptr_blits@unsync-overlap.html

  * igt@gem_userptr_blits@unsync-unmap:
    - shard-dg2:          NOTRUN -> [SKIP][54] ([i915#3297])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg2-8/igt@gem_userptr_blits@unsync-unmap.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-tglu-1:       NOTRUN -> [SKIP][55] ([i915#2527] / [i915#2856]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-tglu-1/igt@gen9_exec_parse@allowed-all.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-dg1:          NOTRUN -> [SKIP][56] ([i915#2527]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg1-14/igt@gen9_exec_parse@allowed-single.html
    - shard-mtlp:         NOTRUN -> [SKIP][57] ([i915#2856]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-mtlp-4/igt@gen9_exec_parse@allowed-single.html

  * igt@gen9_exec_parse@bb-secure:
    - shard-dg2:          NOTRUN -> [SKIP][58] ([i915#2856])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg2-4/igt@gen9_exec_parse@bb-secure.html

  * igt@gen9_exec_parse@bb-start-far:
    - shard-rkl:          NOTRUN -> [SKIP][59] ([i915#2527])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-2/igt@gen9_exec_parse@bb-start-far.html

  * igt@gen9_exec_parse@valid-registers:
    - shard-tglu:         NOTRUN -> [SKIP][60] ([i915#2527] / [i915#2856]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-tglu-10/igt@gen9_exec_parse@valid-registers.html

  * igt@i915_drm_fdinfo@isolation@rcs0:
    - shard-dg1:          NOTRUN -> [SKIP][61] ([i915#14073]) +5 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg1-12/igt@i915_drm_fdinfo@isolation@rcs0.html

  * igt@i915_fb_tiling@basic-x-tiling:
    - shard-dg1:          NOTRUN -> [SKIP][62] ([i915#13786])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg1-15/igt@i915_fb_tiling@basic-x-tiling.html

  * igt@i915_module_load@reload-no-display:
    - shard-tglu:         [PASS][63] -> [ABORT][64] ([i915#16996])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19191/shard-tglu-8/igt@i915_module_load@reload-no-display.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-tglu-3/igt@i915_module_load@reload-no-display.html

  * igt@i915_pm_freq_api@freq-reset:
    - shard-rkl:          NOTRUN -> [SKIP][65] ([i915#8399])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-2/igt@i915_pm_freq_api@freq-reset.html

  * igt@i915_pm_freq_api@freq-suspend:
    - shard-tglu-1:       NOTRUN -> [SKIP][66] ([i915#8399])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-tglu-1/igt@i915_pm_freq_api@freq-suspend.html

  * igt@i915_pm_freq_api@freq-suspend@gt0:
    - shard-dg2:          [PASS][67] -> [INCOMPLETE][68] ([i915#13356] / [i915#13820]) +1 other test incomplete
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19191/shard-dg2-3/igt@i915_pm_freq_api@freq-suspend@gt0.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg2-3/igt@i915_pm_freq_api@freq-suspend@gt0.html

  * igt@i915_pm_rc6_residency@rc6-accuracy:
    - shard-dg2:          NOTRUN -> [FAIL][69] ([i915#12964]) +1 other test fail
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg2-4/igt@i915_pm_rc6_residency@rc6-accuracy.html

  * igt@i915_pm_rpm@system-suspend:
    - shard-rkl:          [PASS][70] -> [ABORT][71] ([i915#15060])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19191/shard-rkl-2/igt@i915_pm_rpm@system-suspend.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-1/igt@i915_pm_rpm@system-suspend.html

  * igt@i915_pm_rps@basic-api:
    - shard-dg1:          NOTRUN -> [SKIP][72] ([i915#11681] / [i915#6621])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg1-17/igt@i915_pm_rps@basic-api.html

  * igt@i915_pm_rps@thresholds-park:
    - shard-dg1:          NOTRUN -> [SKIP][73] ([i915#11681])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg1-15/igt@i915_pm_rps@thresholds-park.html

  * igt@i915_pm_sseu@full-enable:
    - shard-tglu:         NOTRUN -> [SKIP][74] ([i915#4387])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-tglu-9/igt@i915_pm_sseu@full-enable.html

  * igt@i915_query@hwconfig_table:
    - shard-tglu-1:       NOTRUN -> [SKIP][75] ([i915#6245])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-tglu-1/igt@i915_query@hwconfig_table.html

  * igt@i915_query@query-topology-known-pci-ids:
    - shard-dg1:          NOTRUN -> [SKIP][76] ([i915#16109])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg1-14/igt@i915_query@query-topology-known-pci-ids.html
    - shard-mtlp:         NOTRUN -> [SKIP][77] ([i915#16109])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-mtlp-4/igt@i915_query@query-topology-known-pci-ids.html
    - shard-rkl:          NOTRUN -> [SKIP][78] ([i915#16109])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-7/igt@i915_query@query-topology-known-pci-ids.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-tglu:         NOTRUN -> [INCOMPLETE][79] ([i915#4817] / [i915#7443])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-tglu-4/igt@i915_suspend@basic-s3-without-i915.html

  * igt@i915_suspend@sysfs-reader:
    - shard-glk:          [PASS][80] -> [INCOMPLETE][81] ([i915#13356] / [i915#16182] / [i915#4817])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19191/shard-glk6/igt@i915_suspend@sysfs-reader.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-glk8/igt@i915_suspend@sysfs-reader.html

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-glk:          NOTRUN -> [INCOMPLETE][82] ([i915#12761] / [i915#13356]) +1 other test incomplete
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-glk8/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-0:
    - shard-rkl:          NOTRUN -> [SKIP][83] ([i915#5286]) +1 other test skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-2/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
    - shard-mtlp:         [PASS][84] -> [FAIL][85] ([i915#15733] / [i915#5138])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19191/shard-mtlp-1/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-mtlp-7/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
    - shard-dg1:          NOTRUN -> [SKIP][86] ([i915#5286])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg1-14/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-tglu:         NOTRUN -> [SKIP][87] ([i915#5286]) +2 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-tglu-9/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg1:          NOTRUN -> [SKIP][88] ([i915#4538] / [i915#5286]) +2 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg1-12/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-tglu-1:       NOTRUN -> [SKIP][89] ([i915#5286]) +3 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-mtlp:         NOTRUN -> [SKIP][90] +4 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-mtlp-4/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][91] ([i915#3638]) +4 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-2/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-0:
    - shard-dg2:          NOTRUN -> [SKIP][92] ([i915#4538] / [i915#5190]) +1 other test skip
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg2-8/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][93] ([i915#3638]) +1 other test skip
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg1-17/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-mtlp:         NOTRUN -> [SKIP][94] ([i915#6187])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-mtlp-4/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-dg2:          NOTRUN -> [SKIP][95] ([i915#5190])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg2-4/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][96] ([i915#4538])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg1-12/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1:
    - shard-glk10:        NOTRUN -> [SKIP][97] +129 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-glk10/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][98] ([i915#10307] / [i915#10434] / [i915#6095]) +1 other test skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg2-4/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][99] ([i915#6095]) +39 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-tglu-9/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][100] ([i915#12313])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-2/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][101] ([i915#12313])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-tglu-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][102] ([i915#10307] / [i915#6095]) +70 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg2-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2:
    - shard-glk:          NOTRUN -> [SKIP][103] +261 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-glk1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1:
    - shard-dg1:          NOTRUN -> [SKIP][104] ([i915#6095]) +205 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg1-14/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][105] ([i915#6095]) +69 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][106] ([i915#12805])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
    - shard-dg1:          NOTRUN -> [SKIP][107] ([i915#12805])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg1-17/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
    - shard-rkl:          [PASS][108] -> [INCOMPLETE][109] ([i915#14694] / [i915#15582])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19191/shard-rkl-2/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][110] ([i915#14694] / [i915#15582])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][111] ([i915#14098] / [i915#6095]) +41 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-2/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][112] ([i915#6095]) +19 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-tglu-1/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][113] ([i915#12313])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-tglu-10/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][114] ([i915#6095]) +9 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-mtlp-4/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-b-edp-1.html

  * igt@kms_cdclk@mode-transition:
    - shard-tglu-1:       NOTRUN -> [SKIP][115] ([i915#3742])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-tglu-1/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][116] ([i915#13781]) +3 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg2-1/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html

  * igt@kms_chamelium_audio@hdmi-audio-after-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][117] ([i915#11151])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-2/igt@kms_chamelium_audio@hdmi-audio-after-suspend.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4:
    - shard-dg1:          NOTRUN -> [SKIP][118] ([i915#16471])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg1-12/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d:
    - shard-dg2:          NOTRUN -> [SKIP][119] ([i915#16471]) +1 other test skip
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg2-8/igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d.html
    - shard-tglu:         NOTRUN -> [SKIP][120] ([i915#16471]) +1 other test skip
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-tglu-4/igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d.html

  * igt@kms_chamelium_edid@dp-mode-timings:
    - shard-tglu:         NOTRUN -> [SKIP][121] ([i915#11151] / [i915#7828]) +3 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-tglu-10/igt@kms_chamelium_edid@dp-mode-timings.html

  * igt@kms_chamelium_hpd@dp-hpd:
    - shard-mtlp:         NOTRUN -> [SKIP][122] ([i915#11151] / [i915#7828]) +2 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-mtlp-4/igt@kms_chamelium_hpd@dp-hpd.html

  * igt@kms_chamelium_hpd@dp-hpd-storm:
    - shard-rkl:          NOTRUN -> [SKIP][123] ([i915#11151] / [i915#7828]) +5 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-4/igt@kms_chamelium_hpd@dp-hpd-storm.html

  * igt@kms_chamelium_hpd@dp-hpd-storm-disable:
    - shard-dg1:          NOTRUN -> [SKIP][124] ([i915#11151] / [i915#7828]) +6 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg1-17/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm:
    - shard-tglu-1:       NOTRUN -> [SKIP][125] ([i915#11151] / [i915#7828]) +4 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-tglu-1/igt@kms_chamelium_hpd@hdmi-hpd-storm.html

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - shard-dg2:          NOTRUN -> [SKIP][126] ([i915#11151] / [i915#7828])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg2-8/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_color_pipeline@plane-ctm3x4-lut1d@pipe-b-plane-4:
    - shard-dg1:          NOTRUN -> [SKIP][127] ([i915#16990]) +15 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg1-12/igt@kms_color_pipeline@plane-ctm3x4-lut1d@pipe-b-plane-4.html

  * igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-b-plane-4:
    - shard-rkl:          NOTRUN -> [SKIP][128] ([i915#16990]) +5 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-2/igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-b-plane-4.html

  * igt@kms_content_protection@atomic-hdcp14:
    - shard-tglu:         NOTRUN -> [SKIP][129] ([i915#15865]) +2 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-tglu-10/igt@kms_content_protection@atomic-hdcp14.html

  * igt@kms_content_protection@content-type-change:
    - shard-dg1:          NOTRUN -> [SKIP][130] ([i915#15865]) +1 other test skip
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg1-14/igt@kms_content_protection@content-type-change.html
    - shard-mtlp:         NOTRUN -> [SKIP][131] ([i915#15865])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-mtlp-4/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-tglu-1:       NOTRUN -> [SKIP][132] ([i915#15330] / [i915#3116] / [i915#3299])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-tglu-1/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-tglu:         NOTRUN -> [SKIP][133] ([i915#15330] / [i915#3116] / [i915#3299])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-tglu-9/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@dp-mst-type-1-suspend-resume:
    - shard-mtlp:         NOTRUN -> [SKIP][134] ([i915#15330])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-mtlp-4/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html
    - shard-dg1:          NOTRUN -> [SKIP][135] ([i915#15330])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg1-14/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html

  * igt@kms_content_protection@legacy:
    - shard-dg2:          NOTRUN -> [SKIP][136] ([i915#15865]) +1 other test skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg2-8/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@legacy-hdcp14:
    - shard-rkl:          NOTRUN -> [SKIP][137] ([i915#15865]) +2 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-2/igt@kms_content_protection@legacy-hdcp14.html

  * igt@kms_content_protection@type1:
    - shard-tglu-1:       NOTRUN -> [SKIP][138] ([i915#15865])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-tglu-1/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-tglu-1:       NOTRUN -> [SKIP][139] ([i915#13049]) +1 other test skip
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-tglu-1/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-random-128x42:
    - shard-rkl:          [PASS][140] -> [FAIL][141] ([i915#13566]) +1 other test fail
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19191/shard-rkl-7/igt@kms_cursor_crc@cursor-random-128x42.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-3/igt@kms_cursor_crc@cursor-random-128x42.html

  * igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [FAIL][142] ([i915#13566]) +1 other test fail
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-tglu-1/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-tglu:         NOTRUN -> [SKIP][143] ([i915#13049])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-tglu-10/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-256x85@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [FAIL][144] ([i915#13566])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-2/igt@kms_cursor_crc@cursor-sliding-256x85@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-glk11:        NOTRUN -> [INCOMPLETE][145] ([i915#12358] / [i915#13356] / [i915#14152] / [i915#7882])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-glk11/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
    - shard-glk11:        NOTRUN -> [INCOMPLETE][146] ([i915#12358] / [i915#13356] / [i915#14152])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-glk11/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][147] ([i915#13046] / [i915#5354])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg2-4/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg1:          NOTRUN -> [SKIP][148] ([i915#4103])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg1-12/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
    - shard-tglu-1:       NOTRUN -> [SKIP][149] ([i915#9067])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-tglu-1/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-tglu:         NOTRUN -> [SKIP][150] ([i915#9723])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-tglu-9/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-tglu-1:       NOTRUN -> [SKIP][151] ([i915#1769] / [i915#3555] / [i915#3804])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-tglu-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][152] ([i915#3804])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-5/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html
    - shard-tglu-1:       NOTRUN -> [SKIP][153] ([i915#3804])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-tglu-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-dg1:          NOTRUN -> [SKIP][154] ([i915#13749])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg1-12/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-dg2:          NOTRUN -> [SKIP][155] ([i915#13748])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg2-8/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-tglu:         NOTRUN -> [SKIP][156] ([i915#16867])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-tglu-10/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback:
    - shard-tglu-1:       NOTRUN -> [SKIP][157] ([i915#16870])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-tglu-1/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html

  * igt@kms_dsc@dsc-with-bpc-bigjoiner:
    - shard-dg2:          NOTRUN -> [SKIP][158] ([i915#16361])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg2-8/igt@kms_dsc@dsc-with-bpc-bigjoiner.html

  * igt@kms_dsc@dsc-with-bpc-ultrajoiner:
    - shard-dg1:          NOTRUN -> [SKIP][159] ([i915#16361]) +2 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg1-14/igt@kms_dsc@dsc-with-bpc-ultrajoiner.html
    - shard-mtlp:         NOTRUN -> [SKIP][160] ([i915#16361])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-mtlp-4/igt@kms_dsc@dsc-with-bpc-ultrajoiner.html

  * igt@kms_dsc@dsc-with-formats-ultrajoiner:
    - shard-tglu:         NOTRUN -> [SKIP][161] ([i915#16361]) +1 other test skip
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-tglu-9/igt@kms_dsc@dsc-with-formats-ultrajoiner.html

  * igt@kms_dsc@dsc-with-output-formats-bigjoiner:
    - shard-tglu-1:       NOTRUN -> [SKIP][162] ([i915#16361])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-tglu-1/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner:
    - shard-rkl:          NOTRUN -> [SKIP][163] ([i915#16361]) +3 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-2/igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner.html

  * igt@kms_fbcon_fbt@psr:
    - shard-dg2:          NOTRUN -> [SKIP][164] ([i915#16680])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg2-4/igt@kms_fbcon_fbt@psr.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-tglu-1:       NOTRUN -> [SKIP][165] ([i915#16680])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-tglu-1/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-tglu-1:       NOTRUN -> [SKIP][166] ([i915#2065])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-tglu-1/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-3x:
    - shard-rkl:          NOTRUN -> [SKIP][167] ([i915#16081])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-2/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@psr2:
    - shard-tglu:         NOTRUN -> [SKIP][168] ([i915#658])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-tglu-9/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank:
    - shard-tglu:         NOTRUN -> [SKIP][169] ([i915#3637] / [i915#9934]) +2 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-tglu-9/igt@kms_flip@2x-blocking-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-mtlp:         NOTRUN -> [SKIP][170] ([i915#3637] / [i915#9934])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-mtlp-4/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][171] ([i915#9934]) +7 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-2/igt@kms_flip@2x-flip-vs-dpms.html
    - shard-dg1:          NOTRUN -> [SKIP][172] ([i915#9934]) +8 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg1-17/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop:
    - shard-mtlp:         NOTRUN -> [SKIP][173] ([i915#9934])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-mtlp-4/igt@kms_flip@2x-flip-vs-dpms-on-nop.html

  * igt@kms_flip@2x-flip-vs-fences-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][174] ([i915#8381])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg1-12/igt@kms_flip@2x-flip-vs-fences-interruptible.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible:
    - shard-tglu-1:       NOTRUN -> [SKIP][175] ([i915#3637] / [i915#9934]) +2 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-tglu-1/igt@kms_flip@2x-flip-vs-panning-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
    - shard-rkl:          [PASS][176] -> [FAIL][177] ([i915#14600])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19191/shard-rkl-7/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-2/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-vga1:
    - shard-snb:          [PASS][178] -> [FAIL][179] ([i915#14600]) +1 other test fail
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19191/shard-snb4/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-vga1.html
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-snb7/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-vga1.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-hdmi-a1:
    - shard-rkl:          NOTRUN -> [FAIL][180] ([i915#14600])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-2/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-hdmi-a1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a4:
    - shard-dg1:          NOTRUN -> [FAIL][181] ([i915#13027])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg1-16/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a4.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][182] ([i915#15643]) +1 other test skip
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:
    - shard-tglu:         NOTRUN -> [SKIP][183] ([i915#15643]) +1 other test skip
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-tglu-10/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][184] ([i915#15643]) +1 other test skip
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][185] ([i915#15643] / [i915#5190])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg2-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-rkl:          NOTRUN -> [SKIP][186] ([i915#15643]) +2 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-2/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][187] ([i915#15643]) +3 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg1-12/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][188] ([i915#15991] / [i915#5354]) +1 other test skip
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][189] ([i915#1825]) +3 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][190] ([i915#10056] / [i915#13356] / [i915#16593])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-glk6/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-tglu-1:       NOTRUN -> [SKIP][191] ([i915#5439])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-tglu-1/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff:
    - shard-tglu-1:       NOTRUN -> [SKIP][192] ([i915#15989]) +11 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-tglu-1/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-onoff:
    - shard-rkl:          NOTRUN -> [SKIP][193] ([i915#15989]) +13 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-2/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-mtlp:         NOTRUN -> [SKIP][194] ([i915#15991]) +11 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-shrfb-msflip-blt:
    - shard-tglu:         NOTRUN -> [SKIP][195] +53 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-tglu-4/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-shrfb-pgflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][196] +57 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-2/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - shard-glk:          [PASS][197] -> [SKIP][198] +4 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19191/shard-glk8/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-glk2/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbchdr-farfromfence-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][199] ([i915#15990]) +14 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg1-14/igt@kms_frontbuffer_tracking@fbchdr-farfromfence-mmap-gtt.html
    - shard-mtlp:         NOTRUN -> [SKIP][200] ([i915#15990]) +1 other test skip
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbchdr-farfromfence-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-blt:
    - shard-tglu:         NOTRUN -> [SKIP][201] ([i915#15989]) +10 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-tglu-9/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-render:
    - shard-dg2:          NOTRUN -> [SKIP][202] ([i915#15989]) +5 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg2-8/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][203] ([i915#15104] / [i915#15990])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg1-12/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][204] ([i915#15990] / [i915#8708]) +8 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg1-14/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][205] ([i915#15990] / [i915#8708]) +7 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:
    - shard-dg1:          NOTRUN -> [SKIP][206] ([i915#15102]) +27 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg1-14/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
    - shard-tglu-1:       NOTRUN -> [SKIP][207] ([i915#15102]) +24 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][208] ([i915#15990]) +2 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-render:
    - shard-tglu:         NOTRUN -> [SKIP][209] ([i915#15102]) +28 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-tglu-4/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-msflip-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][210] ([i915#15989]) +7 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-shrfb-plflip-blt:
    - shard-dg1:          NOTRUN -> [SKIP][211] +61 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg1-15/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb101010-draw-mmap-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][212] ([i915#15102]) +3 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb101010-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-pwrite:
    - shard-rkl:          [PASS][213] -> [SKIP][214] ([i915#15989]) +5 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19191/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-pwrite.html
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-4/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-onoff:
    - shard-dg2:          NOTRUN -> [SKIP][215] ([i915#15991]) +11 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg2-8/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@hdr-2p-rte:
    - shard-tglu-1:       NOTRUN -> [SKIP][216] +52 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-tglu-1/igt@kms_frontbuffer_tracking@hdr-2p-rte.html

  * igt@kms_frontbuffer_tracking@hdr-shrfb-scaledprimary:
    - shard-dg1:          NOTRUN -> [SKIP][217] ([i915#15989]) +8 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg1-12/igt@kms_frontbuffer_tracking@hdr-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-dg2:          NOTRUN -> [SKIP][218] ([i915#9766])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg2-8/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][219] ([i915#15102]) +27 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-plflip-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][220] ([i915#15991] / [i915#1825]) +9 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-mtlp-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-shrfb-draw-render:
    - shard-glk11:        NOTRUN -> [SKIP][221] +170 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-glk11/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery:
    - shard-rkl:          [PASS][222] -> [INCOMPLETE][223] ([i915#17110])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19191/shard-rkl-5/igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery.html
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-6/igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery.html
    - shard-glk:          [PASS][224] -> [INCOMPLETE][225] ([i915#13356])
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19191/shard-glk1/igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery.html
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-glk8/igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-mtlp:         [PASS][226] -> [SKIP][227] ([i915#15725])
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19191/shard-mtlp-3/igt@kms_hdmi_inject@inject-audio.html
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-mtlp-1/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][228] ([i915#16644] / [i915#3555] / [i915#8228])
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-2/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-tglu-1:       NOTRUN -> [SKIP][229] ([i915#3555] / [i915#8228])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-tglu-1/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-dg1:          NOTRUN -> [SKIP][230] ([i915#3555] / [i915#8228])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg1-14/igt@kms_hdr@static-toggle-suspend.html
    - shard-mtlp:         NOTRUN -> [SKIP][231] ([i915#12713] / [i915#16490] / [i915#3555] / [i915#8228])
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-mtlp-4/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][232] ([i915#15460])
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-tglu-10/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][233] ([i915#15459])
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-2/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][234] ([i915#15638] / [i915#15722])
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-7/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
    - shard-dg1:          NOTRUN -> [SKIP][235] ([i915#15638] / [i915#15722])
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg1-14/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
    - shard-mtlp:         NOTRUN -> [SKIP][236] ([i915#15638] / [i915#15722])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-mtlp-4/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_mst@mst-suspend-read-crc:
    - shard-rkl:          NOTRUN -> [SKIP][237] ([i915#16451])
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-2/igt@kms_mst@mst-suspend-read-crc.html

  * igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c:
    - shard-dg2:          NOTRUN -> [SKIP][238]
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg2-4/igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c.html

  * igt@kms_pipe_stress@stress-xrgb8888-xtiled:
    - shard-glk:          NOTRUN -> [DMESG-FAIL][239] ([i915#118])
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-glk6/igt@kms_pipe_stress@stress-xrgb8888-xtiled.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping:
    - shard-rkl:          NOTRUN -> [SKIP][240] ([i915#15709])
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-2/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping:
    - shard-tglu-1:       NOTRUN -> [SKIP][241] ([i915#15709]) +2 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-tglu-1/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier:
    - shard-tglu:         NOTRUN -> [SKIP][242] ([i915#15709]) +2 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-tglu-10/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier.html

  * igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5:
    - shard-rkl:          NOTRUN -> [SKIP][243] ([i915#16386]) +1 other test skip
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-2/igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-7:
    - shard-tglu-1:       NOTRUN -> [SKIP][244] ([i915#16386]) +1 other test skip
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-tglu-1/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-7.html

  * igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping:
    - shard-dg1:          NOTRUN -> [SKIP][245] ([i915#15709])
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg1-15/igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping.html

  * igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y:
    - shard-rkl:          NOTRUN -> [SKIP][246] ([i915#16112])
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-2/igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-rkl:          NOTRUN -> [SKIP][247] ([i915#13958]) +1 other test skip
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-2/igt@kms_plane_multiple@2x-tiling-4.html
    - shard-dg1:          NOTRUN -> [SKIP][248] ([i915#13958]) +1 other test skip
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg1-17/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-mtlp:         NOTRUN -> [SKIP][249] ([i915#13958])
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-mtlp-4/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-tglu-1:       NOTRUN -> [SKIP][250] ([i915#13958])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-tglu-1/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-rkl:          NOTRUN -> [SKIP][251] ([i915#14259])
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-7/igt@kms_plane_multiple@tiling-yf.html
    - shard-dg1:          NOTRUN -> [SKIP][252] ([i915#14259]) +1 other test skip
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg1-14/igt@kms_plane_multiple@tiling-yf.html
    - shard-mtlp:         NOTRUN -> [SKIP][253] ([i915#14259])
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-mtlp-4/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b:
    - shard-rkl:          NOTRUN -> [SKIP][254] ([i915#15329]) +3 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-2/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:
    - shard-dg1:          NOTRUN -> [SKIP][255] ([i915#15329]) +9 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg1-15/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d:
    - shard-tglu-1:       NOTRUN -> [SKIP][256] ([i915#15329]) +4 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-tglu-1/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5:
    - shard-mtlp:         NOTRUN -> [SKIP][257] ([i915#15329] / [i915#6953])
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-mtlp-4/igt@kms_plane_scaling@planes-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a:
    - shard-mtlp:         NOTRUN -> [SKIP][258] ([i915#15329]) +3 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-mtlp-4/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-tglu:         NOTRUN -> [SKIP][259] ([i915#12343] / [i915#9812])
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-tglu-10/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][260] ([i915#12343] / [i915#5354])
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-7/igt@kms_pm_backlight@fade-with-suspend.html
    - shard-dg1:          NOTRUN -> [SKIP][261] ([i915#12343] / [i915#5354])
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg1-14/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-tglu-1:       NOTRUN -> [SKIP][262] ([i915#15948])
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-tglu-1/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc5-psr-suspend-resume:
    - shard-tglu:         NOTRUN -> [SKIP][263] ([i915#16914])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-tglu-9/igt@kms_pm_dc@dc5-psr-suspend-resume.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-rkl:          NOTRUN -> [SKIP][264] ([i915#3828]) +1 other test skip
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-2/igt@kms_pm_lpsp@kms-lpsp.html
    - shard-dg1:          NOTRUN -> [SKIP][265] ([i915#9340])
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg1-17/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@i2c:
    - shard-glk10:        NOTRUN -> [FAIL][266] ([i915#8717])
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-glk10/igt@kms_pm_rpm@i2c.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-dg1:          NOTRUN -> [SKIP][267] ([i915#15073])
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg1-12/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-rkl:          [PASS][268] -> [SKIP][269] ([i915#15073]) +1 other test skip
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19191/shard-rkl-7/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-2/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-dg1:          [PASS][270] -> [SKIP][271] ([i915#15073])
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19191/shard-dg1-17/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg1-14/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
    - shard-tglu:         NOTRUN -> [SKIP][272] ([i915#15073])
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-tglu-4/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_prime@d3hot:
    - shard-rkl:          NOTRUN -> [SKIP][273] ([i915#6524])
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-2/igt@kms_prime@d3hot.html

  * igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:
    - shard-rkl:          NOTRUN -> [SKIP][274] ([i915#11520]) +5 other tests skip
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-2/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][275] ([i915#11520]) +4 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-glk6/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:
    - shard-snb:          NOTRUN -> [SKIP][276] ([i915#11520])
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-snb4/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-dg1:          NOTRUN -> [SKIP][277] ([i915#11520]) +5 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg1-14/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][278] ([i915#9808])
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-mtlp-4/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][279] ([i915#12316]) +2 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-mtlp-4/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-b-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
    - shard-glk11:        NOTRUN -> [SKIP][280] ([i915#11520]) +3 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-glk11/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-tglu:         NOTRUN -> [SKIP][281] ([i915#11520]) +3 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-tglu-9/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
    - shard-dg2:          NOTRUN -> [SKIP][282] ([i915#11520]) +2 other tests skip
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg2-8/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:
    - shard-glk10:        NOTRUN -> [SKIP][283] ([i915#11520]) +2 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-glk10/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-tglu-1:       NOTRUN -> [SKIP][284] ([i915#11520]) +4 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-tglu-1/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-rkl:          NOTRUN -> [SKIP][285] ([i915#9683]) +1 other test skip
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-2/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-tglu:         NOTRUN -> [SKIP][286] ([i915#9683])
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-tglu-10/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-dg1:          NOTRUN -> [SKIP][287] ([i915#9683])
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg1-17/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-tglu-1:       NOTRUN -> [SKIP][288] ([i915#9683])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-tglu-1/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-primary-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][289] ([i915#9688]) +4 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-mtlp-4/igt@kms_psr@fbc-pr-primary-blt.html

  * igt@kms_psr@fbc-psr-cursor-plane-move:
    - shard-tglu:         NOTRUN -> [SKIP][290] ([i915#9732]) +10 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-tglu-10/igt@kms_psr@fbc-psr-cursor-plane-move.html

  * igt@kms_psr@psr-cursor-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][291] ([i915#1072] / [i915#9732]) +4 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg2-1/igt@kms_psr@psr-cursor-mmap-gtt.html

  * igt@kms_psr@psr-sprite-mmap-cpu:
    - shard-dg1:          NOTRUN -> [SKIP][292] ([i915#1072] / [i915#9732]) +16 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg1-15/igt@kms_psr@psr-sprite-mmap-cpu.html

  * igt@kms_psr@psr-sprite-plane-move:
    - shard-rkl:          NOTRUN -> [SKIP][293] ([i915#1072] / [i915#9732]) +10 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-7/igt@kms_psr@psr-sprite-plane-move.html

  * igt@kms_psr@psr2-cursor-mmap-gtt:
    - shard-tglu-1:       NOTRUN -> [SKIP][294] ([i915#9732]) +8 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-tglu-1/igt@kms_psr@psr2-cursor-mmap-gtt.html

  * igt@kms_psr@psr2-primary-mmap-gtt@edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][295] ([i915#4077] / [i915#9688]) +1 other test skip
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-mtlp-4/igt@kms_psr@psr2-primary-mmap-gtt@edp-1.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-rkl:          NOTRUN -> [SKIP][296] ([i915#5289])
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-2/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-dg2:          NOTRUN -> [SKIP][297] ([i915#12755] / [i915#15867])
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg2-4/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-tglu:         NOTRUN -> [SKIP][298] ([i915#5289])
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-tglu-9/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - shard-rkl:          NOTRUN -> [SKIP][299] ([i915#3555])
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-2/igt@kms_scaling_modes@scaling-mode-full.html
    - shard-dg1:          NOTRUN -> [SKIP][300] ([i915#3555])
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg1-17/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@kms_scaling_modes@scaling-mode-none:
    - shard-tglu-1:       NOTRUN -> [SKIP][301] ([i915#3555]) +3 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-tglu-1/igt@kms_scaling_modes@scaling-mode-none.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-tglu-1:       NOTRUN -> [ABORT][302] ([i915#13179]) +1 other test abort
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-tglu-1/igt@kms_selftest@drm_framebuffer.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-tglu:         NOTRUN -> [SKIP][303] ([i915#3555]) +3 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-tglu-10/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg1:          NOTRUN -> [SKIP][304] ([i915#8623])
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg1-14/igt@kms_tiled_display@basic-test-pattern.html
    - shard-mtlp:         NOTRUN -> [SKIP][305] ([i915#8623])
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-mtlp-4/igt@kms_tiled_display@basic-test-pattern.html
    - shard-glk10:        NOTRUN -> [FAIL][306] ([i915#10959])
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-glk10/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-glk10:        NOTRUN -> [INCOMPLETE][307] ([i915#12276] / [i915#13356]) +1 other test incomplete
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-glk10/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-2:
    - shard-rkl:          [PASS][308] -> [INCOMPLETE][309] ([i915#12276])
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19191/shard-rkl-1/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-2.html
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-6/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-2.html

  * igt@kms_vrr@max-min:
    - shard-dg1:          NOTRUN -> [SKIP][310] ([i915#9906])
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg1-15/igt@kms_vrr@max-min.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-rkl:          NOTRUN -> [SKIP][311] ([i915#9906]) +1 other test skip
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-2/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@perf@mi-rpc:
    - shard-dg1:          NOTRUN -> [SKIP][312] ([i915#2434])
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg1-15/igt@perf@mi-rpc.html

  * igt@perf_pmu@rc6@other-idle-gt0:
    - shard-tglu:         NOTRUN -> [SKIP][313] ([i915#8516])
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-tglu-9/igt@perf_pmu@rc6@other-idle-gt0.html

  * igt@prime_udl@share-import-addfb:
    - shard-tglu-1:       NOTRUN -> [SKIP][314] ([i915#16420])
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-tglu-1/igt@prime_udl@share-import-addfb.html

  * igt@prime_vgem@basic-fence-read:
    - shard-rkl:          NOTRUN -> [SKIP][315] ([i915#3291] / [i915#3708])
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-2/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@basic-write:
    - shard-dg1:          NOTRUN -> [SKIP][316] ([i915#3708])
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg1-14/igt@prime_vgem@basic-write.html
    - shard-mtlp:         NOTRUN -> [SKIP][317] ([i915#10216] / [i915#3708])
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-mtlp-4/igt@prime_vgem@basic-write.html

  * igt@prime_vgem@fence-flip-hang:
    - shard-rkl:          NOTRUN -> [SKIP][318] ([i915#3708])
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-2/igt@prime_vgem@fence-flip-hang.html

  * igt@prime_vgem@fence-write-hang:
    - shard-dg2:          NOTRUN -> [SKIP][319] ([i915#3708])
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg2-1/igt@prime_vgem@fence-write-hang.html

  
#### Possible fixes ####

  * igt@gem_ccs@suspend-resume:
    - shard-dg2:          [INCOMPLETE][320] ([i915#13356] / [i915#16348]) -> [PASS][321] +1 other test pass
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19191/shard-dg2-1/igt@gem_ccs@suspend-resume.html
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg2-8/igt@gem_ccs@suspend-resume.html

  * igt@gem_create@create-clear:
    - shard-dg1:          [ABORT][322] ([i915#13562]) -> [PASS][323]
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19191/shard-dg1-14/igt@gem_create@create-clear.html
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg1-15/igt@gem_create@create-clear.html

  * igt@gem_create@create-clear@lmem0:
    - shard-dg1:          [ABORT][324] -> [PASS][325]
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19191/shard-dg1-14/igt@gem_create@create-clear@lmem0.html
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg1-15/igt@gem_create@create-clear@lmem0.html

  * igt@gem_eio@suspend:
    - shard-dg1:          [DMESG-WARN][326] ([i915#4391] / [i915#4423]) -> [PASS][327]
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19191/shard-dg1-15/igt@gem_eio@suspend.html
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg1-16/igt@gem_eio@suspend.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-rkl:          [INCOMPLETE][328] ([i915#13356]) -> [PASS][329] +1 other test pass
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19191/shard-rkl-6/igt@gem_exec_suspend@basic-s3.html
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-4/igt@gem_exec_suspend@basic-s3.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-2:
    - shard-glk:          [FAIL][330] ([i915#14888]) -> [PASS][331] +1 other test pass
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19191/shard-glk4/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-2.html
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-glk5/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-2.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-mtlp:         [FAIL][332] ([i915#15733] / [i915#5138]) -> [PASS][333]
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19191/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-mtlp-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-tglu:         [FAIL][334] ([i915#13027]) -> [PASS][335] +1 other test pass
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19191/shard-tglu-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-tglu-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-mtlp:         [SKIP][336] ([i915#15672]) -> [PASS][337] +1 other test pass
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19191/shard-mtlp-1/igt@kms_force_connector_basic@prune-stale-modes.html
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-mtlp-7/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff:
    - shard-rkl:          [SKIP][338] ([i915#15989]) -> [PASS][339]
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19191/shard-rkl-5/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff.html
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-move:
    - shard-glk:          [SKIP][340] -> [PASS][341] +5 other tests pass
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19191/shard-glk6/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-move.html
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-glk8/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-move.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-dg2:          [SKIP][342] ([i915#15073]) -> [PASS][343] +1 other test pass
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19191/shard-dg2-1/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg2-4/igt@kms_pm_rpm@modeset-lpsp-stress.html
    - shard-rkl:          [SKIP][344] ([i915#15073]) -> [PASS][345] +2 other tests pass
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19191/shard-rkl-7/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-2/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-dg1:          [SKIP][346] ([i915#15073]) -> [PASS][347]
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19191/shard-dg1-17/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg1-15/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@system-suspend-idle:
    - shard-dg2:          [INCOMPLETE][348] ([i915#14419]) -> [PASS][349]
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19191/shard-dg2-3/igt@kms_pm_rpm@system-suspend-idle.html
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg2-4/igt@kms_pm_rpm@system-suspend-idle.html

  
#### Warnings ####

  * igt@api_intel_bb@crc32:
    - shard-rkl:          [SKIP][350] ([i915#6230]) -> [SKIP][351] ([i915#14544] / [i915#6230])
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19191/shard-rkl-1/igt@api_intel_bb@crc32.html
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-6/igt@api_intel_bb@crc32.html

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-rkl:          [SKIP][352] ([i915#11078]) -> [SKIP][353] ([i915#11078] / [i915#14544])
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19191/shard-rkl-1/igt@device_reset@unbind-cold-reset-rebind.html
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-6/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-rkl:          [SKIP][354] ([i915#14544] / [i915#7697]) -> [SKIP][355] ([i915#7697])
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19191/shard-rkl-6/igt@gem_close_race@multigpu-basic-threads.html
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-4/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_exec_balancer@parallel-keep-submit-fence:
    - shard-rkl:          [SKIP][356] ([i915#4525]) -> [SKIP][357] ([i915#14544] / [i915#4525])
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19191/shard-rkl-1/igt@gem_exec_balancer@parallel-keep-submit-fence.html
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-6/igt@gem_exec_balancer@parallel-keep-submit-fence.html

  * igt@gem_exec_capture@capture-recoverable:
    - shard-rkl:          [SKIP][358] ([i915#14544] / [i915#6344]) -> [SKIP][359] ([i915#6344])
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19191/shard-rkl-6/igt@gem_exec_capture@capture-recoverable.html
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-4/igt@gem_exec_capture@capture-recoverable.html

  * igt@gem_exec_reloc@basic-cpu-gtt-noreloc:
    - shard-rkl:          [SKIP][360] ([i915#14544] / [i915#3281]) -> [SKIP][361] ([i915#3281]) +4 other tests skip
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19191/shard-rkl-6/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-4/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html

  * igt@gem_lmem_swapping@massive:
    - shard-rkl:          [SKIP][362] ([i915#4613]) -> [SKIP][363] ([i915#14544] / [i915#4613])
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19191/shard-rkl-1/igt@gem_lmem_swapping@massive.html
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-6/igt@gem_lmem_swapping@massive.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - shard-rkl:          [SKIP][364] ([i915#14544] / [i915#4613]) -> [SKIP][365] ([i915#4613])
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19191/shard-rkl-6/igt@gem_lmem_swapping@parallel-random-engines.html
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-4/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@gem_pread@uncached:
    - shard-rkl:          [SKIP][366] ([i915#3282]) -> [SKIP][367] ([i915#14544] / [i915#3282])
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19191/shard-rkl-1/igt@gem_pread@uncached.html
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-6/igt@gem_pread@uncached.html

  * igt@gem_pwrite_snooped:
    - shard-rkl:          [SKIP][368] ([i915#14544] / [i915#3282]) -> [SKIP][369] ([i915#3282])
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19191/shard-rkl-6/igt@gem_pwrite_snooped.html
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-7/igt@gem_pwrite_snooped.html

  * igt@gem_userptr_blits@coherency-unsync:
    - shard-rkl:          [SKIP][370] ([i915#14544] / [i915#3297]) -> [SKIP][371] ([i915#3297]) +1 other test skip
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19191/shard-rkl-6/igt@gem_userptr_blits@coherency-unsync.html
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-4/igt@gem_userptr_blits@coherency-unsync.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-rkl:          [SKIP][372] ([i915#3297]) -> [SKIP][373] ([i915#14544] / [i915#3297])
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19191/shard-rkl-1/igt@gem_userptr_blits@create-destroy-unsync.html
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-6/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gen9_exec_parse@cmd-crossing-page:
    - shard-rkl:          [SKIP][374] ([i915#2527]) -> [SKIP][375] ([i915#14544] / [i915#2527])
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19191/shard-rkl-1/igt@gen9_exec_parse@cmd-crossing-page.html
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-6/igt@gen9_exec_parse@cmd-crossing-page.html

  * igt@gen9_exec_parse@shadow-peek:
    - shard-rkl:          [SKIP][376] ([i915#14544] / [i915#2527]) -> [SKIP][377] ([i915#2527]) +2 other tests skip
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19191/shard-rkl-6/igt@gen9_exec_parse@shadow-peek.html
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-4/igt@gen9_exec_parse@shadow-peek.html

  * igt@i915_pm_freq_api@freq-basic-api:
    - shard-rkl:          [SKIP][378] ([i915#14544] / [i915#8399]) -> [SKIP][379] ([i915#8399])
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19191/shard-rkl-6/igt@i915_pm_freq_api@freq-basic-api.html
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-7/igt@i915_pm_freq_api@freq-basic-api.html

  * igt@i915_power@sanity:
    - shard-rkl:          [SKIP][380] ([i915#7984]) -> [SKIP][381] ([i915#14544] / [i915#7984])
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19191/shard-rkl-1/igt@i915_power@sanity.html
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-6/igt@i915_power@sanity.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-rkl:          [SKIP][382] ([i915#14544] / [i915#5723]) -> [SKIP][383] ([i915#5723])
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19191/shard-rkl-6/igt@i915_query@test-query-geometry-subslices.html
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-4/igt@i915_query@test-query-geometry-subslices.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-rkl:          [SKIP][384] ([i915#14544] / [i915#1769] / [i915#3555]) -> [SKIP][385] ([i915#1769] / [i915#3555])
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19191/shard-rkl-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-rkl:          [SKIP][386] ([i915#5286]) -> [SKIP][387] ([i915#14544] / [i915#5286])
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19191/shard-rkl-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180.html
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-rkl:          [SKIP][388] ([i915#14544] / [i915#5286]) -> [SKIP][389] ([i915#5286]) +2 other tests skip
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19191/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-rkl:          [SKIP][390] ([i915#3828]) -> [SKIP][391] ([i915#14544] / [i915#3828])
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19191/shard-rkl-1/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-6/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-rkl:          [SKIP][392] ([i915#14544] / [i915#3828]) -> [SKIP][393] ([i915#3828])
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19191/shard-rkl-6/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-4/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2:
    - shard-rkl:          [SKIP][394] ([i915#14098] / [i915#14544] / [i915#6095]) -> [SKIP][395] ([i915#14098] / [i915#6095]) +7 other tests skip
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19191/shard-rkl-6/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2.html
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-4/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          [SKIP][396] ([i915#6095]) -> [SKIP][397] ([i915#14544] / [i915#6095]) +1 other test skip
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19191/shard-rkl-1/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-2.html
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2:
    - shard-rkl:          [SKIP][398] ([i915#14098] / [i915#6095]) -> [SKIP][399] ([i915#14098] / [i915#14544] / [i915#6095]) +1 other test skip
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19191/shard-rkl-1/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2.html
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2:
    - shard-rkl:          [SKIP][400] ([i915#14544] / [i915#6095]) -> [SKIP][401] ([i915#6095]) +7 other tests skip
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19191/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2.html
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-4/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-rkl:          [SKIP][402] ([i915#12313]) -> [SKIP][403] ([i915#12313] / [i915#14544])
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19191/shard-rkl-1/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-rkl:          [SKIP][404] ([i915#14544] / [i915#3742]) -> [SKIP][405] ([i915#3742])
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19191/shard-rkl-6/igt@kms_cdclk@mode-transition-all-outputs.html
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-4/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:
    - shard-rkl:          [SKIP][406] ([i915#11151] / [i915#14544] / [i915#7828]) -> [SKIP][407] ([i915#11151] / [i915#7828]) +1 other test skip
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19191/shard-rkl-6/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-4/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html

  * igt@kms_chamelium_frames@hdmi-frame-dump:
    - shard-rkl:          [SKIP][408] ([i915#11151] / [i915#7828]) -> [SKIP][409] ([i915#11151] / [i915#14544] / [i915#7828]) +1 other test skip
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19191/shard-rkl-1/igt@kms_chamelium_frames@hdmi-frame-dump.html
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-6/igt@kms_chamelium_frames@hdmi-frame-dump.html

  * igt@kms_content_protection@dp-mst-type-1-suspend-resume:
    - shard-rkl:          [SKIP][410] ([i915#14544] / [i915#15330]) -> [SKIP][411] ([i915#15330])
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19191/shard-rkl-6/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-7/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html

  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
    - shard-rkl:          [SKIP][412] ([i915#9067]) -> [SKIP][413] ([i915#14544] / [i915#9067])
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19191/shard-rkl-5/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-6/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-rkl:          [SKIP][414] ([i915#14544] / [i915#16361]) -> [SKIP][415] ([i915#16361])
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19191/shard-rkl-6/igt@kms_dsc@dsc-with-bpc.html
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-4/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-glk:          [INCOMPLETE][416] ([i915#12745] / [i915#13356] / [i915#4839]) -> [INCOMPLETE][417] ([i915#12314] / [i915#12745] / [i915#13356] / [i915#4839] / [i915#6113])
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19191/shard-glk4/igt@kms_flip@2x-flip-vs-suspend.html
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-glk5/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-glk:          [INCOMPLETE][418] ([i915#12314] / [i915#12745] / [i915#13356] / [i915#4839]) -> [INCOMPLETE][419] ([i915#12745] / [i915#13356] / [i915#4839])
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19191/shard-glk8/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-glk2/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2:
    - shard-glk:          [INCOMPLETE][420] ([i915#12314] / [i915#12745] / [i915#13356]) -> [INCOMPLETE][421] ([i915#12745] / [i915#13356])
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19191/shard-glk8/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2.html
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-glk2/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a1-hdmi-a2:
    - shard-glk:          [INCOMPLETE][422] ([i915#12745] / [i915#13356]) -> [INCOMPLETE][423] ([i915#12314] / [i915#12745] / [i915#13356])
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19191/shard-glk4/igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a1-hdmi-a2.html
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-glk5/igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-rkl:          [SKIP][424] ([i915#14544] / [i915#9934]) -> [SKIP][425] ([i915#9934]) +1 other test skip
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19191/shard-rkl-6/igt@kms_flip@2x-modeset-vs-vblank-race.html
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-4/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-rkl:          [SKIP][426] ([i915#9934]) -> [SKIP][427] ([i915#14544] / [i915#9934]) +2 other tests skip
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19191/shard-rkl-1/igt@kms_flip@2x-plain-flip-interruptible.html
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-6/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-rkl:          [SKIP][428] ([i915#15643]) -> [SKIP][429] ([i915#14544] / [i915#15643])
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19191/shard-rkl-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-rkl:          [SKIP][430] ([i915#14544] / [i915#15643]) -> [SKIP][431] ([i915#15643])
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19191/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-onoff:
    - shard-rkl:          [SKIP][432] -> [SKIP][433] ([i915#14544]) +11 other tests skip
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19191/shard-rkl-1/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-onoff.html
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-rte:
    - shard-rkl:          [SKIP][434] ([i915#14544] / [i915#15102]) -> [SKIP][435] ([i915#15102]) +18 other tests skip
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19191/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-spr-indfb-draw-render:
    - shard-rkl:          [SKIP][436] ([i915#14544]) -> [SKIP][437] +36 other tests skip
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19191/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-spr-indfb-draw-render.html
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@hdr-suspend:
    - shard-rkl:          [SKIP][438] ([i915#15989]) -> [INCOMPLETE][439] ([i915#16056])
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19191/shard-rkl-5/igt@kms_frontbuffer_tracking@hdr-suspend.html
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-suspend.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg1:          [SKIP][440] ([i915#15990] / [i915#4423] / [i915#8708]) -> [SKIP][441] ([i915#15990] / [i915#8708])
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19191/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-dg1-19/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - shard-rkl:          [SKIP][442] ([i915#14544] / [i915#1825]) -> [SKIP][443] ([i915#1825]) +1 other test skip
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19191/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:
    - shard-rkl:          [SKIP][444] ([i915#15102]) -> [SKIP][445] ([i915#14544] / [i915#15102]) +6 other tests skip
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19191/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-rkl:          [SKIP][446] ([i915#1187] / [i915#12713] / [i915#16644]) -> [SKIP][447] ([i915#12713] / [i915#16644])
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19191/shard-rkl-3/igt@kms_hdr@brightness-with-hdr.html
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-7/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-hdr:
    - shard-rkl:          [SKIP][448] ([i915#16644] / [i915#3555] / [i915#8228]) -> [SKIP][449] ([i915#14544] / [i915#16644] / [i915#3555] / [i915#8228])
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19191/shard-rkl-1/igt@kms_hdr@invalid-hdr.html
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-6/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-rkl:          [INCOMPLETE][450] ([i915#15436]) -> [SKIP][451] ([i915#16644] / [i915#3555] / [i915#8228])
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19191/shard-rkl-6/igt@kms_hdr@static-toggle-suspend.html
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-7/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-rkl:          [SKIP][452] ([i915#15458]) -> [SKIP][453] ([i915#14544] / [i915#15458])
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19191/shard-rkl-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-6/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping:
    - shard-rkl:          [SKIP][454] ([i915#15709]) -> [SKIP][455] ([i915#14544] / [i915#15709])
   [454]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19191/shard-rkl-5/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping.html
   [455]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:
    - shard-rkl:          [SKIP][456] ([i915#14544] / [i915#15709]) -> [SKIP][457] ([i915#15709])
   [456]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19191/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier.html
   [457]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-4/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-rkl:          [SKIP][458] ([i915#14544] / [i915#3555]) -> [SKIP][459] ([i915#3555]) +2 other tests skip
   [458]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19191/shard-rkl-6/igt@kms_plane_lowres@tiling-yf.html
   [459]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-4/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-rkl:          [SKIP][460] ([i915#13958] / [i915#14544]) -> [SKIP][461] ([i915#13958])
   [460]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19191/shard-rkl-6/igt@kms_plane_multiple@2x-tiling-x.html
   [461]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-7/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_pm_dc@dc5-psr-suspend-resume:
    - shard-rkl:          [SKIP][462] ([i915#16914]) -> [SKIP][463] ([i915#14544] / [i915#16914])
   [462]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19191/shard-rkl-5/igt@kms_pm_dc@dc5-psr-suspend-resume.html
   [463]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-6/igt@kms_pm_dc@dc5-psr-suspend-resume.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-rkl:          [SKIP][464] ([i915#14544] / [i915#6524]) -> [SKIP][465] ([i915#6524])
   [464]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19191/shard-rkl-6/igt@kms_prime@basic-modeset-hybrid.html
   [465]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-4/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:
    - shard-rkl:          [SKIP][466] ([i915#11520] / [i915#14544]) -> [SKIP][467] ([i915#11520])
   [466]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19191/shard-rkl-6/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html
   [467]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-4/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:
    - shard-rkl:          [SKIP][468] ([i915#11520]) -> [SKIP][469] ([i915#11520] / [i915#14544])
   [468]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19191/shard-rkl-1/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html
   [469]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-6/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr@fbc-psr2-primary-blt:
    - shard-rkl:          [SKIP][470] ([i915#1072] / [i915#14544] / [i915#9732]) -> [SKIP][471] ([i915#1072] / [i915#9732]) +7 other tests skip
   [470]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19191/shard-rkl-6/igt@kms_psr@fbc-psr2-primary-blt.html
   [471]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-7/igt@kms_psr@fbc-psr2-primary-blt.html

  * igt@kms_psr@psr2-sprite-mmap-cpu:
    - shard-rkl:          [SKIP][472] ([i915#1072] / [i915#9732]) -> [SKIP][473] ([i915#1072] / [i915#14544] / [i915#9732]) +2 other tests skip
   [472]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19191/shard-rkl-1/igt@kms_psr@psr2-sprite-mmap-cpu.html
   [473]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-6/igt@kms_psr@psr2-sprite-mmap-cpu.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-rkl:          [SKIP][474] ([i915#14544] / [i915#8623]) -> [SKIP][475] ([i915#8623])
   [474]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19191/shard-rkl-6/igt@kms_tiled_display@basic-test-pattern.html
   [475]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-7/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-rkl:          [ABORT][476] ([i915#15132]) -> [INCOMPLETE][477] ([i915#12276])
   [476]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19191/shard-rkl-1/igt@kms_vblank@ts-continuation-suspend.html
   [477]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-6/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vrr@flip-suspend:
    - shard-rkl:          [SKIP][478] ([i915#14544] / [i915#15243] / [i915#3555]) -> [SKIP][479] ([i915#15243] / [i915#3555])
   [478]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19191/shard-rkl-6/igt@kms_vrr@flip-suspend.html
   [479]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-4/igt@kms_vrr@flip-suspend.html

  * igt@prime_vgem@basic-write:
    - shard-rkl:          [SKIP][480] ([i915#14544] / [i915#3291] / [i915#3708]) -> [SKIP][481] ([i915#3291] / [i915#3708])
   [480]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19191/shard-rkl-6/igt@prime_vgem@basic-write.html
   [481]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-7/igt@prime_vgem@basic-write.html

  
  [i915#10056]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10056
  [i915#10216]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10216
  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#10959]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10959
  [i915#11078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078
  [i915#11151]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
  [i915#118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/118
  [i915#11814]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11814
  [i915#1187]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187
  [i915#12193]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12193
  [i915#12276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276
  [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
  [i915#12314]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12314
  [i915#12316]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316
  [i915#12343]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343
  [i915#12358]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12358
  [i915#12713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713
  [i915#12745]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745
  [i915#12755]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755
  [i915#12761]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12761
  [i915#12805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805
  [i915#12964]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964
  [i915#13027]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13027
  [i915#13046]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046
  [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
  [i915#13179]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179
  [i915#13356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356
  [i915#13562]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13562
  [i915#13566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566
  [i915#13748]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748
  [i915#13749]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749
  [i915#13781]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13781
  [i915#13786]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13786
  [i915#13820]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13820
  [i915#13958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958
  [i915#14073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073
  [i915#14098]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098
  [i915#14152]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14152
  [i915#14259]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259
  [i915#14419]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14419
  [i915#14544]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544
  [i915#14600]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14600
  [i915#14694]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14694
  [i915#14888]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14888
  [i915#15060]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15060
  [i915#15073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073
  [i915#15102]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102
  [i915#15104]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104
  [i915#15132]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132
  [i915#15243]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243
  [i915#15329]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329
  [i915#15330]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330
  [i915#15436]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15436
  [i915#15458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458
  [i915#15459]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459
  [i915#15460]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460
  [i915#15582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582
  [i915#15638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15638
  [i915#15643]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643
  [i915#15672]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15672
  [i915#15709]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709
  [i915#15722]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15722
  [i915#15725]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15725
  [i915#15733]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15733
  [i915#15865]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865
  [i915#15867]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867
  [i915#15948]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948
  [i915#15989]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989
  [i915#15990]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990
  [i915#15991]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991
  [i915#16056]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16056
  [i915#16081]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081
  [i915#16109]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16109
  [i915#16112]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16112
  [i915#16182]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16182
  [i915#16348]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16348
  [i915#16361]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361
  [i915#16386]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16386
  [i915#16420]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16420
  [i915#16451]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16451
  [i915#16471]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471
  [i915#16490]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16490
  [i915#16593]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16593
  [i915#16644]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644
  [i915#16680]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16680
  [i915#16867]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16867
  [i915#16870]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16870
  [i915#16904]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16904
  [i915#16914]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16914
  [i915#16990]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16990
  [i915#16996]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16996
  [i915#17110]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17110
  [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
  [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
  [i915#2065]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2065
  [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
  [i915#2434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434
  [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
  [i915#2658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658
  [i915#280]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280
  [i915#2856]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
  [i915#3116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299
  [i915#3323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323
  [i915#3539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#3742]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
  [i915#3828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828
  [i915#4036]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4036
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
  [i915#4387]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387
  [i915#4391]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4391
  [i915#4423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423
  [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
  [i915#4537]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537
  [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
  [i915#4565]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4565
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#4812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812
  [i915#4817]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817
  [i915#4839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839
  [i915#4852]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852
  [i915#4860]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860
  [i915#4885]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4885
  [i915#4958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4958
  [i915#5138]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#5439]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439
  [i915#5723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5723
  [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
  [i915#6113]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113
  [i915#6187]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6187
  [i915#6230]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6230
  [i915#6245]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245
  [i915#6335]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335
  [i915#6344]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6344
  [i915#6524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
  [i915#658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658
  [i915#6621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621
  [i915#6953]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953
  [i915#7443]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7443
  [i915#7697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697
  [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
  [i915#7882]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7882
  [i915#7984]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984
  [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
  [i915#8381]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381
  [i915#8399]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399
  [i915#8428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
  [i915#8516]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516
  [i915#8555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555
  [i915#8562]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562
  [i915#8623]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623
  [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
  [i915#8717]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8717
  [i915#9067]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067
  [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
  [i915#9340]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340
  [i915#9683]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683
  [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
  [i915#9723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9766]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766
  [i915#9808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9808
  [i915#9812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812
  [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
  [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934


Build changes
-------------

  * Linux: CI_DRM_19191 -> Patchwork_174242v2

  CI-20190529: 20190529
  CI_DRM_19191: f709158f7998ec6a0c6ecebe5aa7911bfb8412bb @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_9103: f307fd753abbe6c03d0a6e1c769fc6020ebd5d86 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  Patchwork_174242v2: f709158f7998ec6a0c6ecebe5aa7911bfb8412bb @ git://anongit.freedesktop.org/gfx-ci/linux
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/index.html

--===============1823247720044415923==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


<!DOCTYPE html>
<html xmlns=3D"http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8"/>
  <title>Project List - Patchwork</title>
  <style id=3D"css-table-select" type=3D"text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>drm/i915/display: switch to modern drm_dp_dp=
cd* accessors (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/174242/">https://patchwork.freedesktop.org/series/174242/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/Patchwork_174242v2/index.html">https://intel-gfx-ci.01.org/tre=
e/drm-tip/Patchwork_174242v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_19191_full -&gt; Patchwork_174242v=
2_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with Patchwork_174242v2_full absolutely n=
eed to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in Patchwork_174242v2_full, please notify your bug team (I915-=
ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (10 -&gt; 10)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in Patchwork_=
174242v2_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@perf_pmu@module-unload:<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-glk6/igt@perf_pmu@module-unload.html=
">FAIL</a></li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-tglu-1/igt@perf_pmu@module-unload.ht=
ml">FAIL</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_19191_full and Patchwork_1=
74242v2_full:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_pm_backlight:<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_174242v2_full that come from kno=
wn issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@device_reset@unbind-reset-rebind:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-dg1-17/igt@device_reset@unbind-reset=
-rebind.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/11814">i915#11814</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-copy-compressed:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-rkl-7/igt@gem_ccs@block-copy-compres=
sed.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-dg1-14/igt@gem_ccs@block-copy-compre=
ssed.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-mtlp-4/igt@gem_ccs@block-copy-compre=
ssed.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-tglu-4/igt@gem_ccs@suspend-resume.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-big:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-tglu-10/igt@gem_create@create-ext-cp=
u-access-big.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/6335">i915#6335</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-set-pat:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-rkl-2/igt@gem_create@create-ext-set-=
pat.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/8562">i915#8562</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@hang:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-dg1-12/igt@gem_ctx_persistence@hang.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/8555">i915#8555</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@mmap-args:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-tglu-1/igt@gem_ctx_sseu@mmap-args.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@invalid-bonds:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-dg1-14/igt@gem_exec_balancer@invalid=
-bonds.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/4036">i915#4036</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-mtlp-4/igt@gem_exec_balancer@invalid=
-bonds.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/4036">i915#4036</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-bb-first:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-rkl-2/igt@gem_exec_balancer@parallel=
-bb-first.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-tglu-1/igt@gem_exec_balancer@paralle=
l-ordering.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture@vecs0-lmem0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-dg1-15/igt@gem_exec_capture@capture@=
vecs0-lmem0.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/16904">i915#16904</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-uc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-dg1-12/igt@gem_exec_flush@basic-batc=
h-kernel-default-uc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/3539">i915#3539</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/4852">i915#4852</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-cpu-noreloc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-dg1-14/igt@gem_exec_reloc@basic-wc-c=
pu-noreloc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3281">i915#3281</a>) +7 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-mtlp-4/igt@gem_exec_reloc@basic-wc-c=
pu-noreloc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3281">i915#3281</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-cpu-noreloc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-dg2-1/igt@gem_exec_reloc@basic-write=
-cpu-noreloc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/3281">i915#3281</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-rkl-2/igt@gem_exec_reloc@basic-write=
-read.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3281">i915#3281</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@reorder-wide:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-dg1-14/igt@gem_exec_schedule@reorder=
-wide.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/4812">i915#4812</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-mtlp-4/igt@gem_exec_schedule@reorder=
-wide.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/4537">i915#4537</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-write-verify-y:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-dg1-12/igt@gem_fence_thrash@bo-write=
-verify-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/4860">i915#4860</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-dg2-8/igt@gem_fenced_exec_thrash@no-=
spare-fences-busy-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/4860">i915#4860</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-mtlp-4/igt@gem_fenced_exec_thrash@no=
-spare-fences-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/4860">i915#4860</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-rkl-2/igt@gem_huc_copy@huc-copy.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-tglu-1/igt@gem_lmem_swapping@paralle=
l-random-verify.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-glk8/igt@gem_lmem_swapping@random.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/4613">i915#4613</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-rkl-2/igt@gem_lmem_swapping@random.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-dg1-15/igt@gem_lmem_swapping@verify-=
ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/12193">i915#12193</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-ccs@lmem0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-dg1-15/igt@gem_lmem_swapping@verify-=
ccs@lmem0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/4565">i915#4565</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@bad-object:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-dg2-4/igt@gem_mmap_gtt@bad-object.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/4077">i915#4077</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@close-race:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-dg1-12/igt@gem_mmap_gtt@close-race.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/4077">i915#4077</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-medium-copy-odd:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-mtlp-4/igt@gem_mmap_gtt@cpuset-mediu=
m-copy-odd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/4077">i915#4077</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write-wc-read-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-dg1-17/igt@gem_mmap_wc@write-wc-read=
-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/4083">i915#4083</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-dg1-14/igt@gem_partial_pwrite_pread@=
reads.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3282">i915#3282</a>) +5 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-mtlp-4/igt@gem_partial_pwrite_pread@=
reads.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3282">i915#3282</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-rkl-2/igt@gem_partial_pwrite_pread@w=
rites-after-reads.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/3282">i915#3282</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-glk6/igt@gem_pread@exhaustion.html">=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/2658">i915#2658</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-tglu-1/igt@gem_pread@exhaustion.html=
">WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/2658">i915#2658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@regular-baseline-src-copy-readible:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-dg1-14/igt@gem_pxp@regular-baseline-=
src-copy-readible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/4270">i915#4270</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-execution-after-suspend-resume:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-dg2-8/igt@gem_pxp@verify-pxp-executi=
on-after-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/4270">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-snb4/igt@gem_render_copy@x-tiled-to-=
vebox-yf-tiled.html">SKIP</a> +92 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-to-vebox-y-tiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-mtlp-4/igt@gem_render_copy@yf-tiled-=
to-vebox-y-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/8428">i915#8428</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-dg1-14/igt@gem_softpin@evict-snoop.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/4885">i915#4885</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-mtlp-4/igt@gem_softpin@evict-snoop.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/4885">i915#4885</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-tglu-9/igt@gem_userptr_blits@dmabuf-=
sync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3297">i915#3297</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/3323">i915#3323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@invalid-mmap-offset-unsync:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-tglu-1/igt@gem_userptr_blits@invalid=
-mmap-offset-unsync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-pwrite-unsync:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-dg1-14/igt@gem_userptr_blits@readonl=
y-pwrite-unsync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-mtlp-4/igt@gem_userptr_blits@readonl=
y-pwrite-unsync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@sd-probe:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-dg1-14/igt@gem_userptr_blits@sd-prob=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3297">i915#3297</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/4958">i915#4958</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-overlap:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-rkl-2/igt@gem_userptr_blits@unsync-o=
verlap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3297">i915#3297</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-dg2-8/igt@gem_userptr_blits@unsync-u=
nmap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-tglu-1/igt@gen9_exec_parse@allowed-a=
ll.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/2527">i915#2527</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/2856">i915#2856</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-dg1-14/igt@gen9_exec_parse@allowed-s=
ingle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/2527">i915#2527</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-mtlp-4/igt@gen9_exec_parse@allowed-s=
ingle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/2856">i915#2856</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-secure:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-dg2-4/igt@gen9_exec_parse@bb-secure.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-far:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-rkl-2/igt@gen9_exec_parse@bb-start-f=
ar.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/2527">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@valid-registers:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-tglu-10/igt@gen9_exec_parse@valid-re=
gisters.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/2527">i915#2527</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/2856">i915#2856</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@isolation@rcs0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-dg1-12/igt@i915_drm_fdinfo@isolation=
@rcs0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/14073">i915#14073</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_fb_tiling@basic-x-tiling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-dg1-15/igt@i915_fb_tiling@basic-x-ti=
ling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/13786">i915#13786</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-no-display:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19191/shard-tglu-8/igt@i915_module_load@reload-no-display.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_1=
74242v2/shard-tglu-3/igt@i915_module_load@reload-no-display.html">ABORT</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16996"=
>i915#16996</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-reset:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-rkl-2/igt@i915_pm_freq_api@freq-rese=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/8399">i915#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-suspend:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-tglu-1/igt@i915_pm_freq_api@freq-sus=
pend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/8399">i915#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-suspend@gt0:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19191/shard-dg2-3/igt@i915_pm_freq_api@freq-suspend@gt0.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174=
242v2/shard-dg2-3/igt@i915_pm_freq_api@freq-suspend@gt0.html">INCOMPLETE</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356=
">i915#13356</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/13820">i915#13820</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-accuracy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-dg2-4/igt@i915_pm_rc6_residency@rc6-=
accuracy.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/12964">i915#12964</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19191/shard-rkl-2/igt@i915_pm_rpm@system-suspend.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/s=
hard-rkl-1/igt@i915_pm_rpm@system-suspend.html">ABORT</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15060">i915#15060</a>)</=
li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-dg1-17/igt@i915_pm_rps@basic-api.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/11681">i915#11681</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/6621">i915#6621</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds-park:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-dg1-15/igt@i915_pm_rps@thresholds-pa=
rk.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/11681">i915#11681</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-tglu-9/igt@i915_pm_sseu@full-enable.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/4387">i915#4387</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@hwconfig_table:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-tglu-1/igt@i915_query@hwconfig_table=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/6245">i915#6245</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-known-pci-ids:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-dg1-14/igt@i915_query@query-topology=
-known-pci-ids.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/16109">i915#16109</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-mtlp-4/igt@i915_query@query-topology=
-known-pci-ids.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/16109">i915#16109</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-rkl-7/igt@i915_query@query-topology-=
known-pci-ids.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/16109">i915#16109</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-tglu-4/igt@i915_suspend@basic-s3-wit=
hout-i915.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/4817">i915#4817</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/7443">i915#7443</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@sysfs-reader:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19191/shard-glk6/igt@i915_suspend@sysfs-reader.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/sha=
rd-glk8/igt@i915_suspend@sysfs-reader.html">INCOMPLETE</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16182">=
i915#16182</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/4817">i915#4817</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-glk8/igt@kms_async_flips@async-flip-=
suspend-resume.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/12761">i915#12761</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) +1 othe=
r test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-rkl-2/igt@kms_big_fb@4-tiled-16bpp-r=
otate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/5286">i915#5286</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19191/shard-mtlp-1/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_=
174242v2/shard-mtlp-7/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15733=
">i915#15733</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/5138">i915#5138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-dg1-14/igt@kms_big_fb@4-tiled-addfb-=
size-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-tglu-9/igt@kms_big_fb@4-tiled-max-hw=
-stride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +2 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-dg1-12/igt@kms_big_fb@4-tiled-max-hw=
-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +2 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw=
-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +3 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-mtlp-4/igt@kms_big_fb@linear-64bpp-r=
otate-270.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-rkl-2/igt@kms_big_fb@linear-8bpp-rot=
ate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/3638">i915#3638</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-dg2-8/igt@kms_big_fb@y-tiled-16bpp-r=
otate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/4538">i915#4538</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-dg1-17/igt@kms_big_fb@y-tiled-8bpp-r=
otate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/3638">i915#3638</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-mtlp-4/igt@kms_big_fb@yf-tiled-addfb=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/6187">i915#6187</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-dg2-4/igt@kms_big_fb@yf-tiled-addfb-=
size-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-dg1-12/igt@kms_big_fb@yf-tiled-max-h=
w-stride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-glk10/igt@kms_ccs@bad-pixel-format-4=
-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> +129 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-dg2-4/igt@kms_ccs@bad-rotation-90-4-=
tiled-mtl-rc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434">i915#10434<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/60=
95">i915#6095</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-tglu-9/igt@kms_ccs@ccs-on-another-bo=
-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +39 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-rkl-2/igt@kms_ccs@crc-primary-basic-=
4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-tglu-1/igt@kms_ccs@crc-primary-rotat=
ion-180-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3:=
</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-dg2-1/igt@kms_ccs@crc-primary-rotati=
on-180-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i91=
5#6095</a>) +70 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2:=
</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-glk1/igt@kms_ccs@crc-primary-rotatio=
n-180-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> +261 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1:=
</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-dg1-14/igt@kms_ccs@crc-primary-rotat=
ion-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +20=
5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:=
</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-rkl-7/igt@kms_ccs@crc-primary-rotati=
on-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +69 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-rkl-2/igt@kms_ccs@crc-primary-suspen=
d-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/12805">i915#12805</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-dg1-17/igt@kms_ccs@crc-primary-suspe=
nd-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/12805">i915#12805</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19191/shard-rkl-2/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-=
ccs.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/Patchwork_174242v2/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-y-tiled-ge=
n12-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/14694">i915#14694</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15582">i915#15582</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-rkl-3/igt@kms_ccs@crc-primary-suspen=
d-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2.html">INCOMPLETE</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14694">i915#14694</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582"=
>i915#15582</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-rkl-2/igt@kms_ccs@crc-primary-suspen=
d-yf-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +41 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-tglu-1/igt@kms_ccs@missing-ccs-buffe=
r-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +19 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-tglu-10/igt@kms_ccs@random-ccs-data-=
4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-mtlp-4/igt@kms_ccs@random-ccs-data-y=
-tiled-gen12-rc-ccs@pipe-b-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +9 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-tglu-1/igt@kms_cdclk@mode-transition=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/3742">i915#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-dg2-1/igt@kms_cdclk@mode-transition@=
pipe-d-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/13781">i915#13781</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-after-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-rkl-2/igt@kms_chamelium_audio@hdmi-a=
udio-after-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/11151">i915#11151</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-dg1-12/igt@kms_chamelium_color_pipel=
ine@plane-lut1d-ctm3x4.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/16471">i915#16471</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-dg2-8/igt@kms_chamelium_color_pipeli=
ne@plane-lut1d-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/16471">i915#16471</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-tglu-4/igt@kms_chamelium_color_pipel=
ine@plane-lut1d-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/16471">i915#16471</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-mode-timings:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-tglu-10/igt@kms_chamelium_edid@dp-mo=
de-timings.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +3 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-mtlp-4/igt@kms_chamelium_hpd@dp-hpd.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/7828">i915#7828</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-rkl-4/igt@kms_chamelium_hpd@dp-hpd-s=
torm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm-disable:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-dg1-17/igt@kms_chamelium_hpd@dp-hpd-=
storm-disable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +6 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-tglu-1/igt@kms_chamelium_hpd@hdmi-hp=
d-storm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +4 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-fast:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-dg2-8/igt@kms_chamelium_hpd@vga-hpd-=
fast.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-ctm3x4-lut1d@pipe-b-plane-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-dg1-12/igt@kms_color_pipeline@plane-=
ctm3x4-lut1d@pipe-b-plane-4.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/16990">i915#16990</a>) +15 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-b-plane-4:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-rkl-2/igt@kms_color_pipeline@plane-l=
ut1d-ctm3x4@pipe-b-plane-4.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/16990">i915#16990</a>) +5 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-hdcp14:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-tglu-10/igt@kms_content_protection@a=
tomic-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/15865">i915#15865</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-dg1-14/igt@kms_content_protection@co=
ntent-type-change.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/15865">i915#15865</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-mtlp-4/igt@kms_content_protection@co=
ntent-type-change.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/15865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-tglu-1/igt@kms_content_protection@dp=
-mst-lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/15330">i915#15330</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-tglu-9/igt@kms_content_protection@dp=
-mst-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/15330">i915#15330</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1-suspend-resume:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-mtlp-4/igt@kms_content_protection@dp=
-mst-type-1-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-dg1-14/igt@kms_content_protection@dp=
-mst-type-1-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-dg2-8/igt@kms_content_protection@leg=
acy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/15865">i915#15865</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy-hdcp14:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-rkl-2/igt@kms_content_protection@leg=
acy-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/15865">i915#15865</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-tglu-1/igt@kms_content_protection@ty=
pe1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/15865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-tglu-1/igt@kms_cursor_crc@cursor-ons=
creen-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/13049">i915#13049</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-128x42:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19191/shard-rkl-7/igt@kms_cursor_crc@cursor-random-128x42.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_1=
74242v2/shard-rkl-3/igt@kms_cursor_crc@cursor-random-128x42.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">=
i915#13566</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-tglu-1/igt@kms_cursor_crc@cursor-ran=
dom-128x42@pipe-a-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +1 other test fai=
l</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-tglu-10/igt@kms_cursor_crc@cursor-ra=
ndom-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-rkl-2/igt@kms_cursor_crc@cursor-slid=
ing-256x85@pipe-a-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-glk11/igt@kms_cursor_crc@cursor-susp=
end.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/12358">i915#12358</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/14152">i915#14152</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7882">i91=
5#7882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-glk11/igt@kms_cursor_crc@cursor-susp=
end@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/12358">i915#12358</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14152">i9=
15#14152</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-dg2-4/igt@kms_cursor_legacy@2x-curso=
r-vs-flip-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/13046">i915#13046</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-dg1-12/igt@kms_cursor_legacy@basic-b=
usy-flip-before-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-tglu-1/igt@kms_cursor_legacy@modeset=
-atomic-cursor-hotspot.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/9067">i915#9067</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-tglu-9/igt@kms_dirtyfb@drrs-dirtyfb-=
ioctl.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/9723">i915#9723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-tglu-1/igt@kms_dither@fb-8bpc-vs-pan=
el-6bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/1769">i915#1769</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-rkl-5/igt@kms_dither@fb-8bpc-vs-pane=
l-6bpc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-tglu-1/igt@kms_dither@fb-8bpc-vs-pan=
el-6bpc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-dg1-12/igt@kms_dp_link_training@non-=
uhbr-sst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/13749">i915#13749</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-dg2-8/igt@kms_dp_link_training@uhbr-=
sst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/13748">i915#13748</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-tglu-10/igt@kms_dp_linktrain_fallbac=
k@dp-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/16867">i915#16867</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-tglu-1/igt@kms_dp_linktrain_fallback=
@uhbr-to-hbr-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/16870">i915#16870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-bigjoiner:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-dg2-8/igt@kms_dsc@dsc-with-bpc-bigjo=
iner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/16361">i915#16361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-ultrajoiner:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-dg1-14/igt@kms_dsc@dsc-with-bpc-ultr=
ajoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/16361">i915#16361</a>) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-mtlp-4/igt@kms_dsc@dsc-with-bpc-ultr=
ajoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/16361">i915#16361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats-ultrajoiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-tglu-9/igt@kms_dsc@dsc-with-formats-=
ultrajoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/16361">i915#16361</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-bigjoiner:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-tglu-1/igt@kms_dsc@dsc-with-output-f=
ormats-bigjoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/16361">i915#16361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-rkl-2/igt@kms_dsc@dsc-with-output-fo=
rmats-with-bpc-bigjoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +3 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-dg2-4/igt@kms_fbcon_fbt@psr.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
16680">i915#16680</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-tglu-1/igt@kms_fbcon_fbt@psr-suspend=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/16680">i915#16680</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-tglu-1/igt@kms_feature_discovery@cha=
melium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/2065">i915#2065</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-rkl-2/igt@kms_feature_discovery@disp=
lay-3x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/16081">i915#16081</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-tglu-9/igt@kms_feature_discovery@psr=
2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-tglu-9/igt@kms_flip@2x-blocking-abso=
lute-wf_vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/3637">i915#3637</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +2 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-mtlp-4/igt@kms_flip@2x-flip-vs-block=
ing-wf-vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/3637">i915#3637</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-rkl-2/igt@kms_flip@2x-flip-vs-dpms.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/9934">i915#9934</a>) +7 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-dg1-17/igt@kms_flip@2x-flip-vs-dpms.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/9934">i915#9934</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-mtlp-4/igt@kms_flip@2x-flip-vs-dpms-=
on-nop.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences-interruptible:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-dg1-12/igt@kms_flip@2x-flip-vs-fence=
s-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/8381">i915#8381</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-tglu-1/igt@kms_flip@2x-flip-vs-panni=
ng-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19191/shard-rkl-7/igt@kms_flip@flip-vs-absolute-wf_vblank-interrupt=
ible.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/Patchwork_174242v2/shard-rkl-2/igt@kms_flip@flip-vs-absolute-wf_vblank-i=
nterruptible.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/14600">i915#14600</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-vga1:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19191/shard-snb4/igt@kms_flip@flip-vs-absolute-wf_vblank-interrupti=
ble@a-vga1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/Patchwork_174242v2/shard-snb7/igt@kms_flip@flip-vs-absolute-wf_vbl=
ank-interruptible@a-vga1.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/14600">i915#14600</a>) +1 other test fail<=
/li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-hdmi-a1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-rkl-2/igt@kms_flip@flip-vs-absolute-=
wf_vblank-interruptible@b-hdmi-a1.html">FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/14600">i915#14600</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-dg1-16/igt@kms_flip@flip-vs-expired-=
vblank-interruptible@a-hdmi-a4.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/13027">i915#13027</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-tglu-1/igt@kms_flip_scaled_crc@flip-=
32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>)=
 +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-tglu-10/igt@kms_flip_scaled_crc@flip=
-32bpp-4tile-to-64bpp-4tile-upscaling.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +1 oth=
er test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling=
:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-=
32bpp-yftile-to-32bpp-yftileccs-downscaling.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) =
+1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:<=
/p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-dg2-8/igt@kms_flip_scaled_crc@flip-3=
2bpp-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915=
#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:<=
/p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-rkl-2/igt@kms_flip_scaled_crc@flip-3=
2bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +2 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-dg1-12/igt@kms_flip_scaled_crc@flip-=
64bpp-yftile-to-16bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +3 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-dg2-4/igt@kms_frontbuffer_tracking@f=
bc-2p-primscrn-pri-indfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#535=
4</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-rkl-2/igt@kms_frontbuffer_tracking@f=
bc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +3 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-glk6/igt@kms_frontbuffer_tracking@fb=
c-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/10056">i915#10056</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16593">i915#16593</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-tglu-1/igt@kms_frontbuffer_tracking@=
fbc-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-tglu-1/igt@kms_frontbuffer_tracking@=
fbchdr-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +11 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-rkl-2/igt@kms_frontbuffer_tracking@f=
bchdr-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +13 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-mtlp-4/igt@kms_frontbuffer_tracking@=
fbchdr-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a>) +1=
1 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-tglu-4/igt@kms_frontbuffer_tracking@=
fbchdr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> +53 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-rkl-2/igt@kms_frontbuffer_tracking@f=
bchdr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> +57 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-shrfb-draw-mmap-gtt:=
</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19191/shard-glk8/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pr=
i-shrfb-draw-mmap-gtt.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/Patchwork_174242v2/shard-glk2/igt@kms_frontbuffer_track=
ing@fbchdr-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> +4 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-farfromfence-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-dg1-14/igt@kms_frontbuffer_tracking@=
fbchdr-farfromfence-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +14 other tests=
 skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-mtlp-4/igt@kms_frontbuffer_tracking@=
fbchdr-farfromfence-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-blt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-tglu-9/igt@kms_frontbuffer_tracking@=
fbchdr-rgb101010-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +10 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-render:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-dg2-8/igt@kms_frontbuffer_tracking@f=
bchdr-rgb101010-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +5 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt=
:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-dg1-12/igt@kms_frontbuffer_tracking@=
fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">=
i915#15990</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-dg1-14/igt@kms_frontbuffer_tracking@=
fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i91=
5#8708</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-dg2-4/igt@kms_frontbuffer_tracking@f=
bcpsr-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915=
#8708</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-dg1-14/igt@kms_frontbuffer_tracking@=
fbcpsr-rgb101010-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +27 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-tglu-1/igt@kms_frontbuffer_tracking@=
fbcpsr-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +24 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-mmap-=
wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-dg2-4/igt@kms_frontbuffer_tracking@f=
bcpsrhdr-1p-offscreen-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>)=
 +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-rende=
r:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-tglu-4/igt@kms_frontbuffer_tracking@=
fbcpsrhdr-1p-offscreen-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>)=
 +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-mtlp-4/igt@kms_frontbuffer_tracking@=
fbcpsrhdr-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +7 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-dg1-15/igt@kms_frontbuffer_tracking@=
fbcpsrhdr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> +61 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb101010-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-dg2-8/igt@kms_frontbuffer_tracking@f=
bcpsrhdr-rgb101010-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +3 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-pwrite:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19191/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri=
-indfb-draw-pwrite.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/Patchwork_174242v2/shard-rkl-4/igt@kms_frontbuffer_trackin=
g@hdr-1p-offscreen-pri-indfb-draw-pwrite.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +5 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-dg2-8/igt@kms_frontbuffer_tracking@h=
dr-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a>) +11 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-rte:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-tglu-1/igt@kms_frontbuffer_tracking@=
hdr-2p-rte.html">SKIP</a> +52 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-shrfb-scaledprimary:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-dg1-12/igt@kms_frontbuffer_tracking@=
hdr-shrfb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +8 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-dg2-8/igt@kms_frontbuffer_tracking@p=
ipe-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/9766">i915#9766</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-rkl-2/igt@kms_frontbuffer_tracking@p=
sr-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +27 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-mtlp-4/igt@kms_frontbuffer_tracking@=
psr-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a=
>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-shrfb-draw-render:</=
p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-glk11/igt@kms_frontbuffer_tracking@p=
srhdr-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> +170 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19191/shard-rkl-5/igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Pa=
tchwork_174242v2/shard-rkl-6/igt@kms_hdmi_audio_bw@suspend-mem-audio-recove=
ry.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17110">i915#17110</a>)</li>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19191/shard-glk1/igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Pat=
chwork_174242v2/shard-glk8/igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery=
.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/13356">i915#13356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19191/shard-mtlp-3/igt@kms_hdmi_inject@inject-audio.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v=
2/shard-mtlp-1/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15725">i915#15725</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-rkl-2/igt@kms_hdr@bpc-switch-dpms.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/16644">i915#16644</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-tglu-1/igt@kms_hdr@static-toggle-dpm=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-dg1-14/igt@kms_hdr@static-toggle-sus=
pend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-mtlp-4/igt@kms_hdr@static-toggle-sus=
pend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/12713">i915#12713</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/16490">i915#16490</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-tglu-10/igt@kms_joiner@invalid-modes=
et-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/15460">i915#15460</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-rkl-2/igt@kms_joiner@invalid-modeset=
-force-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/15459">i915#15459</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-rkl-7/igt@kms_joiner@switch-modeset-=
ultra-joiner-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/15638">i915#15638</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/15722">i915#15722</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-dg1-14/igt@kms_joiner@switch-modeset=
-ultra-joiner-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/15638">i915#15638</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/15722">i915#15722</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-mtlp-4/igt@kms_joiner@switch-modeset=
-ultra-joiner-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/15638">i915#15638</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/15722">i915#15722</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_mst@mst-suspend-read-crc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-rkl-2/igt@kms_mst@mst-suspend-read-c=
rc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/16451">i915#16451</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-dg2-4/igt@kms_pipe_b_c_ivb@pipe-b-dp=
ms-off-modeset-pipe-c.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-xtiled:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-glk6/igt@kms_pipe_stress@stress-xrgb=
8888-xtiled.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/118">i915#118</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping:<=
/p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-rkl-2/igt@kms_plane@pixel-format-4-t=
iled-dg2-rc-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-tglu-1/igt@kms_plane@pixel-format-4-=
tiled-lnl-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +2 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-tglu-10/igt@kms_plane@pixel-format-4=
-tiled-mtl-rc-ccs-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +2 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-rkl-2/igt@kms_plane@pixel-format-x-t=
iled-modifier@pipe-b-plane-5.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/16386">i915#16386</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane=
-7:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-tglu-1/igt@kms_plane@pixel-format-y-=
tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-7.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16386">i915#16386</a>=
) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-dg1-15/igt@kms_plane@pixel-format-yf=
-tiled-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-rkl-2/igt@kms_plane@planar-pixel-for=
mat-settings@nv12-tile4-src-y.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/16112">i915#16112</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-rkl-2/igt@kms_plane_multiple@2x-tili=
ng-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/13958">i915#13958</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-dg1-17/igt@kms_plane_multiple@2x-til=
ing-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/13958">i915#13958</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-mtlp-4/igt@kms_plane_multiple@2x-til=
ing-x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-tglu-1/igt@kms_plane_multiple@2x-til=
ing-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-rkl-7/igt@kms_plane_multiple@tiling-=
yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/14259">i915#14259</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-dg1-14/igt@kms_plane_multiple@tiling=
-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/14259">i915#14259</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-mtlp-4/igt@kms_plane_multiple@tiling=
-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/14259">i915#14259</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b:</=
p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-rkl-2/igt@kms_plane_scaling@plane-sc=
aler-unity-scaling-with-rotation@pipe-b.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +3 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-dg1-15/igt@kms_plane_scaling@plane-u=
pscale-20x20-with-rotation@pipe-a.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +9 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-tglu-1/igt@kms_plane_scaling@plane-u=
pscale-factor-0-25-with-rotation@pipe-d.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +4 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-mtlp-4/igt@kms_plane_scaling@planes-=
downscale-factor-0-5.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-mtlp-4/igt@kms_plane_scaling@planes-=
downscale-factor-0-5@pipe-a.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +3 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-tglu-10/igt@kms_pm_backlight@bad-bri=
ghtness.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/12343">i915#12343</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/9812">i915#9812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-rkl-7/igt@kms_pm_backlight@fade-with=
-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/12343">i915#12343</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-dg1-14/igt@kms_pm_backlight@fade-wit=
h-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/12343">i915#12343</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-tglu-1/igt@kms_pm_dc@dc5-psr.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/15948">i915#15948</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr-suspend-resume:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-tglu-9/igt@kms_pm_dc@dc5-psr-suspend=
-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/16914">i915#16914</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-rkl-2/igt@kms_pm_lpsp@kms-lpsp.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3828">i915#3828</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-dg1-17/igt@kms_pm_lpsp@kms-lpsp.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/9340">i915#9340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-glk10/igt@kms_pm_rpm@i2c.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/871=
7">i915#8717</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-dg1-12/igt@kms_pm_rpm@modeset-lpsp-s=
tress.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19191/shard-rkl-7/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17=
4242v2/shard-rkl-2/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i9=
15#15073</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19191/shard-dg1-17/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Pat=
chwork_174242v2/shard-dg1-14/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/15073">i915#15073</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-tglu-4/igt@kms_pm_rpm@modeset-non-lp=
sp-stress-no-wait.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@d3hot:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-rkl-2/igt@kms_prime@d3hot.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/65=
24">i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-rkl-2/igt@kms_psr2_sf@fbc-pr-overlay=
-primary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +5 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-glk6/igt@kms_psr2_sf@fbc-pr-plane-mo=
ve-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/11520">i915#11520</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-snb4/igt@kms_psr2_sf@fbc-pr-primary-=
plane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/11520">i915#11520</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-dg1-14/igt@kms_psr2_sf@fbc-psr2-curs=
or-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +5 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-a-e=
dp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-mtlp-4/igt@kms_psr2_sf@fbc-psr2-curs=
or-plane-move-continuous-exceed-sf@pipe-a-edp-1.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9808">i915#9808</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-b-e=
dp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-mtlp-4/igt@kms_psr2_sf@fbc-psr2-curs=
or-plane-move-continuous-exceed-sf@pipe-b-edp-1.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316">i915#12316</=
a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-glk11/igt@kms_psr2_sf@fbc-psr2-overl=
ay-primary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +3 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-tglu-9/igt@kms_psr2_sf@pr-overlay-pl=
ane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +3 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-dg2-8/igt@kms_psr2_sf@pr-overlay-pla=
ne-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +2 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-glk10/igt@kms_psr2_sf@pr-primary-pla=
ne-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +2 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-tglu-1/igt@kms_psr2_sf@psr2-cursor-p=
lane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +4 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-rkl-2/igt@kms_psr2_su@frontbuffer-xr=
gb8888.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/9683">i915#9683</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-tglu-10/igt@kms_psr2_su@page_flip-nv=
12.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/9683">i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-dg1-17/igt@kms_psr2_su@page_flip-p01=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/9683">i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-tglu-1/igt@kms_psr2_su@page_flip-xrg=
b8888.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/9683">i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-primary-blt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-mtlp-4/igt@kms_psr@fbc-pr-primary-bl=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/9688">i915#9688</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-plane-move:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-tglu-10/igt@kms_psr@fbc-psr-cursor-p=
lane-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/9732">i915#9732</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-dg2-1/igt@kms_psr@psr-cursor-mmap-gt=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/9732">i915#9732</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-mmap-cpu:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-dg1-15/igt@kms_psr@psr-sprite-mmap-c=
pu.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/9732">i915#9732</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-move:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-rkl-7/igt@kms_psr@psr-sprite-plane-m=
ove.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/9732">i915#9732</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-mmap-gtt:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-tglu-1/igt@kms_psr@psr2-cursor-mmap-=
gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/9732">i915#9732</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-mmap-gtt@edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-mtlp-4/igt@kms_psr@psr2-primary-mmap=
-gtt@edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/4077">i915#4077</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/9688">i915#9688</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-rkl-2/igt@kms_rotation_crc@primary-4=
-tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-dg2-4/igt@kms_rotation_crc@primary-r=
otation-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/12755">i915#12755</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/15867">i915#15867</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-tglu-9/igt@kms_rotation_crc@primary-=
yf-tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-rkl-2/igt@kms_scaling_modes@scaling-=
mode-full.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/3555">i915#3555</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-dg1-17/igt@kms_scaling_modes@scaling=
-mode-full.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-tglu-1/igt@kms_scaling_modes@scaling=
-mode-none.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_framebuffer:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-tglu-1/igt@kms_selftest@drm_framebuf=
fer.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/13179">i915#13179</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-tglu-10/igt@kms_setmode@invalid-clon=
e-single-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-dg1-14/igt@kms_tiled_display@basic-t=
est-pattern.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/8623">i915#8623</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-mtlp-4/igt@kms_tiled_display@basic-t=
est-pattern.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/8623">i915#8623</a>)</li>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-glk10/igt@kms_tiled_display@basic-te=
st-pattern.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/10959">i915#10959</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-glk10/igt@kms_vblank@ts-continuation=
-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/12276">i915#12276</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) +1 other test=
 incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19191/shard-rkl-1/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdm=
i-a-2.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/Patchwork_174242v2/shard-rkl-6/igt@kms_vblank@ts-continuation-suspend@p=
ipe-a-hdmi-a-2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/12276">i915#12276</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-dg1-15/igt@kms_vrr@max-min.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9=
906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-rkl-2/igt@kms_vrr@seamless-rr-switch=
-vrr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/9906">i915#9906</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@perf@mi-rpc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-dg1-15/igt@perf@mi-rpc.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434"=
>i915#2434</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6@other-idle-gt0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-tglu-9/igt@perf_pmu@rc6@other-idle-g=
t0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/8516">i915#8516</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_udl@share-import-addfb:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-tglu-1/igt@prime_udl@share-import-ad=
dfb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/16420">i915#16420</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-rkl-2/igt@prime_vgem@basic-fence-rea=
d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3291">i915#3291</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-dg1-14/igt@prime_vgem@basic-write.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3708">i915#3708</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-mtlp-4/igt@prime_vgem@basic-write.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/10216">i915#10216</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-flip-hang:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-rkl-2/igt@prime_vgem@fence-flip-hang=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-write-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-dg2-1/igt@prime_vgem@fence-write-han=
g.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ccs@suspend-resume:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19191/shard-dg2-1/igt@gem_ccs@suspend-resume.html">INCOMPLETE</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i=
915#13356</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/16348">i915#16348</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-dg2-8/igt@gem_ccs@suspend-resume.htm=
l">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-clear:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19191/shard-dg1-14/igt@gem_create@create-clear.html">ABORT</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13562">i915=
#13562</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patch=
work_174242v2/shard-dg1-15/igt@gem_create@create-clear.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_create@create-clear@lmem0:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19191/shard-dg1-14/igt@gem_create@create-clear@lmem0.html">ABORT</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17424=
2v2/shard-dg1-15/igt@gem_create@create-clear@lmem0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@suspend:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19191/shard-dg1-15/igt@gem_eio@suspend.html">DMESG-WARN</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4391">i915#439=
1</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
4423">i915#4423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/Patchwork_174242v2/shard-dg1-16/igt@gem_eio@suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19191/shard-rkl-6/igt@gem_exec_suspend@basic-s3.html">INCOMPLETE</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356=
">i915#13356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/Patchwork_174242v2/shard-rkl-4/igt@gem_exec_suspend@basic-s3.html">PASS</a=
> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19191/shard-glk4/igt@kms_async_flips@alternate-sync-async-flip-atom=
ic@pipe-a-hdmi-a-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/14888">i915#14888</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-glk5/igt@kms_asyn=
c_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-2.html">PASS</a> +1 =
other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19191/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotat=
e-180.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/15733">i915#15733</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/5138">i915#5138</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-mtlp-5/igt@kms_b=
ig_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19191/shard-tglu-8/igt@kms_flip@flip-vs-expired-vblank-interruptibl=
e.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/13027">i915#13027</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/Patchwork_174242v2/shard-tglu-3/igt@kms_flip@flip-vs-expire=
d-vblank-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19191/shard-mtlp-1/igt@kms_force_connector_basic@prune-stale-modes.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/15672">i915#15672</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-mtlp-7/igt@kms_force_connector_basic=
@prune-stale-modes.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19191/shard-rkl-5/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-c=
ur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/15989">i915#15989</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-6/igt@kms_frontbu=
ffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19191/shard-glk6/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-i=
ndfb-move.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/Patchwork_174242v2/shard-glk8/igt@kms_frontbuffer_tracking@hdr-1p-p=
rimscrn-cur-indfb-move.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19191/shard-dg2-1/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073"=
>i915#15073</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
Patchwork_174242v2/shard-dg2-4/igt@kms_pm_rpm@modeset-lpsp-stress.html">PAS=
S</a> +1 other test pass</li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19191/shard-rkl-7/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073"=
>i915#15073</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
Patchwork_174242v2/shard-rkl-2/igt@kms_pm_rpm@modeset-lpsp-stress.html">PAS=
S</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19191/shard-dg1-17/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/15073">i915#15073</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/Patchwork_174242v2/shard-dg1-15/igt@kms_pm_rpm@modeset-lpsp-stress=
-no-wait.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-idle:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19191/shard-dg2-3/igt@kms_pm_rpm@system-suspend-idle.html">INCOMPLE=
TE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14419">i915#14419</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/Patchwork_174242v2/shard-dg2-4/igt@kms_pm_rpm@system-suspend-idle.htm=
l">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@api_intel_bb@crc32:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19191/shard-rkl-1/igt@api_intel_bb@crc32.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6230">i915#6230</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_1742=
42v2/shard-rkl-6/igt@api_intel_bb@crc32.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6230">i915#=
6230</a>)</li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-cold-reset-rebind:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19191/shard-rkl-1/igt@device_reset@unbind-cold-reset-rebind.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/11078">i915#11078</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/Patchwork_174242v2/shard-rkl-6/igt@device_reset@unbind-cold-reset-re=
bind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/11078">i915#11078</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-threads:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19191/shard-rkl-6/igt@gem_close_race@multigpu-basic-threads.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/7697">i915#7697</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-4/igt@gem_close_race@mult=
igpu-basic-threads.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-submit-fence:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19191/shard-rkl-1/igt@gem_exec_balancer@parallel-keep-submit-fence.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/4525">i915#4525</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/Patchwork_174242v2/shard-rkl-6/igt@gem_exec_balancer@parallel-k=
eep-submit-fence.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-recoverable:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19191/shard-rkl-6/igt@gem_exec_capture@capture-recoverable.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/6344">i915#6344</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-4/igt@gem_exec_capture@cap=
ture-recoverable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/6344">i915#6344</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-gtt-noreloc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19191/shard-rkl-6/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/3281">i915#3281</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-4/igt@gem_exec_reloc@basic=
-cpu-gtt-noreloc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/3281">i915#3281</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@massive:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19191/shard-rkl-1/igt@gem_lmem_swapping@massive.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#=
4613</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwo=
rk_174242v2/shard-rkl-6/igt@gem_lmem_swapping@massive.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#1=
4544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19191/shard-rkl-6/igt@gem_lmem_swapping@parallel-random-engines.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/4613">i915#4613</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-4/igt@gem_lmem_swappi=
ng@parallel-random-engines.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pread@uncached:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19191/shard-rkl-1/igt@gem_pread@uncached.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_1742=
42v2/shard-rkl-6/igt@gem_pread@uncached.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#=
3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite_snooped:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19191/shard-rkl-6/igt@gem_pwrite_snooped.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/32=
82">i915#3282</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/Patchwork_174242v2/shard-rkl-7/igt@gem_pwrite_snooped.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#=
3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-unsync:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19191/shard-rkl-6/igt@gem_userptr_blits@coherency-unsync.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3297">i915#3297</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-4/igt@gem_userptr_blits@cohe=
rency-unsync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/3297">i915#3297</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@create-destroy-unsync:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19191/shard-rkl-1/igt@gem_userptr_blits@create-destroy-unsync.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3297">i915#3297</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/Patchwork_174242v2/shard-rkl-6/igt@gem_userptr_blits@create-destroy-=
unsync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@cmd-crossing-page:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19191/shard-rkl-1/igt@gen9_exec_parse@cmd-crossing-page.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/252=
7">i915#2527</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/Patchwork_174242v2/shard-rkl-6/igt@gen9_exec_parse@cmd-crossing-page.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/2527">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@shadow-peek:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19191/shard-rkl-6/igt@gen9_exec_parse@shadow-peek.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i9=
15#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/2527">i915#2527</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/Patchwork_174242v2/shard-rkl-4/igt@gen9_exec_parse@shadow-peek.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/2527">i915#2527</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-basic-api:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19191/shard-rkl-6/igt@i915_pm_freq_api@freq-basic-api.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544=
">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/8399">i915#8399</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/Patchwork_174242v2/shard-rkl-7/igt@i915_pm_freq_api@freq-bas=
ic-api.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/8399">i915#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_power@sanity:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19191/shard-rkl-1/igt@i915_power@sanity.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984">i915#7984</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17424=
2v2/shard-rkl-6/igt@i915_power@sanity.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984">i915#79=
84</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@test-query-geometry-subslices:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19191/shard-rkl-6/igt@i915_query@test-query-geometry-subslices.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/5723">i915#5723</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-4/igt@i915_query@test-=
query-geometry-subslices.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/5723">i915#5723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19191/shard-rkl-6/igt@kms_atomic_transition@plane-all-modeset-trans=
ition-fencing-internal-panels.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i=
915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Pat=
chwork_174242v2/shard-rkl-4/igt@kms_atomic_transition@plane-all-modeset-tra=
nsition-fencing-internal-panels.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19191/shard-rkl-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate=
-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/5286">i915#5286</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/Patchwork_174242v2/shard-rkl-6/igt@kms_big_fb@4-tiled-max-=
hw-stride-32bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19191/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate=
-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-4/igt@kms=
_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286=
</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19191/shard-rkl-1/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-=
0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/3828">i915#3828</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-6/igt@kms_big_fb@linear-ma=
x-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19191/shard-rkl-6/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-=
180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-4/igt@km=
s_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#382=
8</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19191/shard-rkl-6/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-c=
c@pipe-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_1=
74242v2/shard-rkl-4/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe=
-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +7 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19191/shard-rkl-1/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs@pi=
pe-b-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-6/igt@kms_ccs@bad-ro=
tation-90-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">=
i915#6095</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19191/shard-rkl-1/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs@pi=
pe-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-6/ig=
t@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098"=
>i915#14098</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/6095">i915#6095</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19191/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc=
@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-4=
/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
6095">i915#6095</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19191/shard-rkl-1/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/12313">i915#12313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/Patchwork_174242v2/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled=
-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/12313">i915#12313</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19191/shard-rkl-6/igt@kms_cdclk@mode-transition-all-outputs.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/3742">i915#3742</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-4/igt@kms_cdclk@mode-tran=
sition-all-outputs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/3742">i915#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19191/shard-rkl-6/igt@kms_chamelium_edid@dp-edid-stress-resolution-=
non-4k.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard=
-rkl-4/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1115=
1">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/7828">i915#7828</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-frame-dump:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19191/shard-rkl-1/igt@kms_chamelium_frames@hdmi-frame-dump.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/7828">i915#7828</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-6/igt@kms_chamelium_frames=
@hdmi-frame-dump.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a=
>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1-suspend-resume:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19191/shard-rkl-6/igt@kms_content_protection@dp-mst-type-1-suspend-=
resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/15330">i915#15330</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-7/igt@kms=
_content_protection@dp-mst-type-1-suspend-resume.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19191/shard-rkl-5/igt@kms_cursor_legacy@modeset-atomic-cursor-hotsp=
ot.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/9067">i915#9067</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/Patchwork_174242v2/shard-rkl-6/igt@kms_cursor_legacy@modeset=
-atomic-cursor-hotspot.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/9067">i915#9067</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19191/shard-rkl-6/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/16361">i915#16361</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/Patchwork_174242v2/shard-rkl-4/igt@kms_dsc@dsc-with-bpc.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1636=
1">i915#16361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19191/shard-glk4/igt@kms_flip@2x-flip-vs-suspend.html">INCOMPLETE</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1274=
5">i915#12745</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/13356">i915#13356</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/4839">i915#4839</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-glk5/igt@kms_flip@=
2x-flip-vs-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/12314">i915#12314</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i91=
5#13356</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/4839">i915#4839</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/6113">i915#6113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19191/shard-glk8/igt@kms_flip@2x-flip-vs-suspend-interruptible.html=
">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/12314">i915#12314</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_1=
74242v2/shard-glk2/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">INCO=
MPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/12745">i915#12745</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19191/shard-glk8/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-h=
dmi-a1-hdmi-a2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/12314">i915#12314</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13=
356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwor=
k_174242v2/shard-glk2/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi=
-a1-hdmi-a2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19191/shard-glk4/igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a1-hdmi-a2=
.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/12745">i915#12745</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-glk5/igt@kms_=
flip@2x-flip-vs-suspend@ac-hdmi-a1-hdmi-a2.html">INCOMPLETE</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12314">i915#12314<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12=
745">i915#12745</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/13356">i915#13356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19191/shard-rkl-6/igt@kms_flip@2x-modeset-vs-vblank-race.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/9934">i915#9934</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-4/igt@kms_flip@2x-modeset-vs=
-vblank-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/9934">i915#9934</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19191/shard-rkl-1/igt@kms_flip@2x-plain-flip-interruptible.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
9934">i915#9934</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/Patchwork_174242v2/shard-rkl-6/igt@kms_flip@2x-plain-flip-interruptible=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/9934">i915#9934</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19191/shard-rkl-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp=
-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-6/igt=
@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/15643">i915#15643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19191/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp=
-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/s=
hard-rkl-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-=
upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/15643">i915#15643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19191/shard-rkl-1/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-c=
ur-indfb-onoff.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/Patchwork_174242v2/shard-rkl-6/igt@kms_frontbuffer_tracking@fb=
chdr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +11 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-rte:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19191/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-4/igt@kms_frontbuffer_=
tracking@fbcpsr-1p-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +18 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-spr-indfb-draw-render=
:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19191/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscr=
n-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-4/igt@km=
s_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-spr-indfb-draw-render.html">SK=
IP</a> +36 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19191/shard-rkl-5/igt@kms_frontbuffer_tracking@hdr-suspend.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
15989">i915#15989</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/Patchwork_174242v2/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-suspe=
nd.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/16056">i915#16056</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19191/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri=
-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_1=
74242v2/shard-dg1-19/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/15990">i915#15990</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19191/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-=
shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rk=
l-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-gtt.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/1825">i915#1825</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19191/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-indfb-scaledprim=
ary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/15102">i915#15102</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-6/igt@kms_frontbuffer_tracki=
ng@psr-indfb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +=
6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19191/shard-rkl-3/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187">i91=
5#1187</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/12713">i915#12713</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/16644">i915#16644</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-7/igt@kms_hdr@brigh=
tness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/12713">i915#12713</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/16644">i915#16644</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19191/shard-rkl-1/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644">i915#166=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/8228">i915#8228</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-6/igt@kms_hdr@invalid-hdr.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/16644">i915#16644</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19191/shard-rkl-6/igt@kms_hdr@static-toggle-suspend.html">INCOMPLET=
E</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
5436">i915#15436</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/Patchwork_174242v2/shard-rkl-7/igt@kms_hdr@static-toggle-suspend.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/16644">i915#16644</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19191/shard-rkl-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/15458">i915#15458</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/Patchwork_174242v2/shard-rkl-6/igt@kms_joiner@invalid-modese=
t-force-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/15458">i915#15458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping:<=
/p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19191/shard-rkl-5/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-mod=
ifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-6/igt@kms_=
plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/15709">i915#15709</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19191/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-mod=
ifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-4/igt@kms_=
plane@pixel-format-4-tiled-mtl-mc-ccs-modifier.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19191/shard-rkl-6/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i91=
5#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3555">i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/Patchwork_174242v2/shard-rkl-4/igt@kms_plane_lowres@tiling-yf.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/3555">i915#3555</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19191/shard-rkl-6/igt@kms_plane_multiple@2x-tiling-x.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958"=
>i915#13958</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/Patchwork_174242v2/shard-rkl-7/igt@kms_plane_multiple@2x-ti=
ling-x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr-suspend-resume:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19191/shard-rkl-5/igt@kms_pm_dc@dc5-psr-suspend-resume.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1691=
4">i915#16914</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/Patchwork_174242v2/shard-rkl-6/igt@kms_pm_dc@dc5-psr-suspend-resume.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/16914">i915#16914</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-modeset-hybrid:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19191/shard-rkl-6/igt@kms_prime@basic-modeset-hybrid.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"=
>i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/6524">i915#6524</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174242v2/shard-rkl-4/igt@kms_prime@basic-modeset-hy=
brid.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/6524">i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19191/shard-rkl-6/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-ar=
ea-big-fb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/11520">i915#11520</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-4/igt@=
kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#=
11520</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19191/shard-rkl-1/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/11520">i915#11520</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/Patchwork_174242v2/shard-rkl-6/igt@kms_psr2_sf@psr2-plane-move-sf-=
dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/11520">i915#11520</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-blt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19191/shard-rkl-6/igt@kms_psr@fbc-psr2-primary-blt.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i9=
15#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-7/igt@kms_psr@fbc-ps=
r2-primary-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/1072">i915#1072</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +7 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-mmap-cpu:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19191/shard-rkl-1/igt@kms_psr@psr2-sprite-mmap-cpu.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i9=
15#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9732">i915#9732</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/Patchwork_174242v2/shard-rkl-6/igt@kms_psr@psr2-sprite-mmap-cpu.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +2 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19191/shard-rkl-6/igt@kms_tiled_display@basic-test-pattern.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/8623">i915#8623</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-7/igt@kms_tiled_display@ba=
sic-test-pattern.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/8623">i915#8623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19191/shard-rkl-1/igt@kms_vblank@ts-continuation-suspend.html">ABOR=
T</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
5132">i915#15132</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/Patchwork_174242v2/shard-rkl-6/igt@kms_vblank@ts-continuation-suspend.=
html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/12276">i915#12276</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19191/shard-rkl-6/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/15243">i915#15243</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-4/igt@kms_vrr@flip-suspen=
d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/15243">i915#15243</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19191/shard-rkl-6/igt@prime_vgem@basic-write.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14=
544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3291">i915#3291</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/3708">i915#3708</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/Patchwork_174242v2/shard-rkl-7/igt@prime_vgem@basic-wri=
te.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3291">i915#3291</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_19191 -&gt; Patchwork_174242v2</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19191: f709158f7998ec6a0c6ecebe5aa7911bfb8412bb @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGT_9103: f307fd753abbe6c03d0a6e1c769fc6020ebd5d86 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  Patchwork_174242v2: f709158f7998ec6a0c6ecebe5aa7911bfb8412bb @ git://anon=
git.freedesktop.org/gfx-ci/linux<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============1823247720044415923==--
