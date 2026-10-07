Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 184B0CA5FFC
	for <intel-gfx@archiver.kernel.org>; Wed,  7 Oct 2026 10:42:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85C8210E620;
	Wed,  7 Oct 2026 10:42:41 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DA9F10E620;
 Wed,  7 Oct 2026 10:42:40 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1614178911960783170=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EFull=3A_success_for_drm/i915/scaler=3A_Prune?=
 =?utf-8?q?_YUV420_modes_against_the_max_source_width?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arun R Murthy" <arun.r.murthy@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Wed, 07 Oct 2026 10:42:40 -0000
Message-ID: <179136976016.247420.1533658059846648670@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20261007070601.3611674-1-arun.r.murthy@intel.com>
In-Reply-To: <20261007070601.3611674-1-arun.r.murthy@intel.com>
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

--===============1614178911960783170==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/scaler: Prune YUV420 modes against the max source width
URL   : https://patchwork.freedesktop.org/series/175645/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_19291_full -> Patchwork_175645v1_full
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with Patchwork_175645v1_full need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in Patchwork_175645v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (10 -> 10)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in Patchwork_175645v1_full:

### IGT changes ###

#### Warnings ####

  * igt@kms_hdmi_audio_bw@audio-bw-hblank160:
    - shard-glk:          [FAIL][1] ([i915#17102]) -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-glk3/igt@kms_hdmi_audio_bw@audio-bw-hblank160.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-glk8/igt@kms_hdmi_audio_bw@audio-bw-hblank160.html

  
New tests
---------

  New tests have been introduced between CI_DRM_19291_full and Patchwork_175645v1_full:

### New IGT tests (3) ###

  * igt@kms_cursor_crc@cursor-sliding-256x256@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.66] s

  * igt@kms_plane_multiple@tiling-x@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.79] s

  * igt@kms_plane_multiple@tiling-x@pipe-b-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.83] s

  

Known issues
------------

  Here are the changes found in Patchwork_175645v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-keep-cache:
    - shard-dg2:          NOTRUN -> [SKIP][3] ([i915#8411])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-1/igt@api_intel_bb@blit-reloc-keep-cache.html

  * igt@api_intel_bb@crc32:
    - shard-rkl:          NOTRUN -> [SKIP][4] ([i915#6230])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-8/igt@api_intel_bb@crc32.html

  * igt@device_reset@cold-reset-bound:
    - shard-tglu:         NOTRUN -> [SKIP][5] ([i915#11078])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-2/igt@device_reset@cold-reset-bound.html

  * igt@gem_basic@multigpu-create-close:
    - shard-rkl:          NOTRUN -> [SKIP][6] ([i915#7697])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-4/igt@gem_basic@multigpu-create-close.html
    - shard-tglu-1:       NOTRUN -> [SKIP][7] ([i915#7697])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-1/igt@gem_basic@multigpu-create-close.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-tglu:         NOTRUN -> [SKIP][8] ([i915#3555] / [i915#9323])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-8/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ccs@block-multicopy-inplace:
    - shard-dg1:          NOTRUN -> [SKIP][9] ([i915#3555] / [i915#9323])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-19/igt@gem_ccs@block-multicopy-inplace.html

  * igt@gem_ccs@large-ctrl-surf-copy:
    - shard-tglu:         NOTRUN -> [SKIP][10] ([i915#13008])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-10/igt@gem_ccs@large-ctrl-surf-copy.html

  * igt@gem_ccs@suspend-resume:
    - shard-dg2:          [PASS][11] -> [INCOMPLETE][12] ([i915#13356] / [i915#16348]) +1 other test incomplete
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-dg2-6/igt@gem_ccs@suspend-resume.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-7/igt@gem_ccs@suspend-resume.html
    - shard-tglu:         NOTRUN -> [SKIP][13] ([i915#9323])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-10/igt@gem_ccs@suspend-resume.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-tglu:         NOTRUN -> [SKIP][14] ([i915#7697])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-4/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_create@create-ext-cpu-access-sanity-check:
    - shard-tglu-1:       NOTRUN -> [SKIP][15] ([i915#6335])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-1/igt@gem_create@create-ext-cpu-access-sanity-check.html

  * igt@gem_create@create-ext-set-pat:
    - shard-tglu:         NOTRUN -> [SKIP][16] ([i915#8562])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-2/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_persistence@hang:
    - shard-mtlp:         NOTRUN -> [SKIP][17] ([i915#8555])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-mtlp-2/igt@gem_ctx_persistence@hang.html

  * igt@gem_ctx_persistence@heartbeat-close:
    - shard-dg1:          NOTRUN -> [SKIP][18] ([i915#8555]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-16/igt@gem_ctx_persistence@heartbeat-close.html

  * igt@gem_ctx_persistence@hostile:
    - shard-snb:          NOTRUN -> [SKIP][19] ([i915#1099]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-snb7/igt@gem_ctx_persistence@hostile.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-rkl:          NOTRUN -> [SKIP][20] ([i915#280])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-2/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-dg2:          NOTRUN -> [SKIP][21] ([i915#280])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-8/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-dg1:          NOTRUN -> [SKIP][22] ([i915#280])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-16/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_exec_balancer@bonded-dual:
    - shard-dg1:          NOTRUN -> [SKIP][23] ([i915#4771])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-16/igt@gem_exec_balancer@bonded-dual.html

  * igt@gem_exec_balancer@invalid-bonds:
    - shard-dg1:          NOTRUN -> [SKIP][24] ([i915#4036])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-15/igt@gem_exec_balancer@invalid-bonds.html

  * igt@gem_exec_balancer@parallel:
    - shard-tglu:         NOTRUN -> [SKIP][25] ([i915#4525]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-5/igt@gem_exec_balancer@parallel.html

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-tglu-1:       NOTRUN -> [SKIP][26] ([i915#4525])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-1/igt@gem_exec_balancer@parallel-ordering.html

  * igt@gem_exec_capture@capture-invisible@smem0:
    - shard-rkl:          NOTRUN -> [SKIP][27] ([i915#6334]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-8/igt@gem_exec_capture@capture-invisible@smem0.html

  * igt@gem_exec_capture@capture@vecs0-lmem0:
    - shard-dg1:          NOTRUN -> [FAIL][28] ([i915#16904]) +2 other tests fail
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-15/igt@gem_exec_capture@capture@vecs0-lmem0.html

  * igt@gem_exec_fence@submit3:
    - shard-mtlp:         NOTRUN -> [SKIP][29] ([i915#4812])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-mtlp-2/igt@gem_exec_fence@submit3.html

  * igt@gem_exec_fence@syncobj-backward-timeline-chain-engines:
    - shard-snb:          NOTRUN -> [SKIP][30] +196 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-snb1/igt@gem_exec_fence@syncobj-backward-timeline-chain-engines.html

  * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
    - shard-mtlp:         NOTRUN -> [SKIP][31] ([i915#3711])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-mtlp-2/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html

  * igt@gem_exec_flush@basic-uc-prw-default:
    - shard-dg1:          NOTRUN -> [SKIP][32] ([i915#3539])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-19/igt@gem_exec_flush@basic-uc-prw-default.html

  * igt@gem_exec_flush@basic-wb-prw-default:
    - shard-dg1:          NOTRUN -> [SKIP][33] ([i915#3539] / [i915#4852]) +3 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-15/igt@gem_exec_flush@basic-wb-prw-default.html

  * igt@gem_exec_reloc@basic-wc:
    - shard-rkl:          NOTRUN -> [SKIP][34] ([i915#3281])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-4/igt@gem_exec_reloc@basic-wc.html

  * igt@gem_exec_reloc@basic-wc-cpu:
    - shard-mtlp:         NOTRUN -> [SKIP][35] ([i915#3281])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-mtlp-2/igt@gem_exec_reloc@basic-wc-cpu.html

  * igt@gem_exec_reloc@basic-write-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][36] ([i915#3281]) +3 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-6/igt@gem_exec_reloc@basic-write-cpu.html

  * igt@gem_exec_reloc@basic-write-cpu-active:
    - shard-dg1:          NOTRUN -> [SKIP][37] ([i915#3281]) +6 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-15/igt@gem_exec_reloc@basic-write-cpu-active.html

  * igt@gem_exec_schedule@semaphore-power:
    - shard-dg1:          NOTRUN -> [SKIP][38] ([i915#4812]) +2 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-15/igt@gem_exec_schedule@semaphore-power.html

  * igt@gem_exec_suspend@basic-s0:
    - shard-rkl:          [PASS][39] -> [INCOMPLETE][40] ([i915#13356]) +1 other test incomplete
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-8/igt@gem_exec_suspend@basic-s0.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-7/igt@gem_exec_suspend@basic-s0.html

  * igt@gem_fenced_exec_thrash@no-spare-fences:
    - shard-dg1:          NOTRUN -> [SKIP][41] ([i915#4860]) +2 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-14/igt@gem_fenced_exec_thrash@no-spare-fences.html
    - shard-mtlp:         NOTRUN -> [SKIP][42] ([i915#4860])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-mtlp-2/igt@gem_fenced_exec_thrash@no-spare-fences.html

  * igt@gem_gtt_cpu_tlb:
    - shard-dg1:          NOTRUN -> [SKIP][43] ([i915#4077]) +10 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-16/igt@gem_gtt_cpu_tlb.html

  * igt@gem_lmem_evict@dontneed-evict-race:
    - shard-tglu-1:       NOTRUN -> [SKIP][44] ([i915#4613] / [i915#7582])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-1/igt@gem_lmem_evict@dontneed-evict-race.html

  * igt@gem_lmem_swapping@heavy-verify-random:
    - shard-rkl:          NOTRUN -> [SKIP][45] ([i915#4613]) +3 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-7/igt@gem_lmem_swapping@heavy-verify-random.html

  * igt@gem_lmem_swapping@smem-oom:
    - shard-tglu:         NOTRUN -> [SKIP][46] ([i915#4613]) +3 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-4/igt@gem_lmem_swapping@smem-oom.html

  * igt@gem_lmem_swapping@verify-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][47] ([i915#4613]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-1/igt@gem_lmem_swapping@verify-ccs.html
    - shard-dg1:          NOTRUN -> [SKIP][48] ([i915#12193])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-15/igt@gem_lmem_swapping@verify-ccs.html

  * igt@gem_lmem_swapping@verify-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][49] ([i915#4565])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-15/igt@gem_lmem_swapping@verify-ccs@lmem0.html

  * igt@gem_media_fill@media-fill:
    - shard-mtlp:         NOTRUN -> [SKIP][50] ([i915#8289])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-mtlp-2/igt@gem_media_fill@media-fill.html

  * igt@gem_media_vme:
    - shard-dg1:          NOTRUN -> [SKIP][51] ([i915#284])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-19/igt@gem_media_vme.html

  * igt@gem_mmap@bad-size:
    - shard-dg2:          NOTRUN -> [SKIP][52] ([i915#4083])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-8/igt@gem_mmap@bad-size.html

  * igt@gem_mmap@basic:
    - shard-dg1:          NOTRUN -> [SKIP][53] ([i915#4083]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-19/igt@gem_mmap@basic.html

  * igt@gem_mmap_gtt@basic-write-read-distinct:
    - shard-mtlp:         NOTRUN -> [SKIP][54] ([i915#4077]) +1 other test skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-mtlp-2/igt@gem_mmap_gtt@basic-write-read-distinct.html

  * igt@gem_mmap_gtt@fault-concurrent-y:
    - shard-dg2:          NOTRUN -> [SKIP][55] ([i915#4077]) +2 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-1/igt@gem_mmap_gtt@fault-concurrent-y.html

  * igt@gem_partial_pwrite_pread@reads-uncached:
    - shard-rkl:          NOTRUN -> [SKIP][56] ([i915#3282]) +4 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-2/igt@gem_partial_pwrite_pread@reads-uncached.html

  * igt@gem_partial_pwrite_pread@write-uncached:
    - shard-dg2:          NOTRUN -> [SKIP][57] ([i915#3282])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-1/igt@gem_partial_pwrite_pread@write-uncached.html

  * igt@gem_pread@display:
    - shard-dg1:          NOTRUN -> [SKIP][58] ([i915#3282]) +2 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-16/igt@gem_pread@display.html

  * igt@gem_pread@exhaustion:
    - shard-snb:          NOTRUN -> [WARN][59] ([i915#2658])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-snb7/igt@gem_pread@exhaustion.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-glk10:        NOTRUN -> [WARN][60] ([i915#14702] / [i915#2658])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-glk10/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@create-protected-buffer:
    - shard-dg1:          NOTRUN -> [SKIP][61] ([i915#4270])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-16/igt@gem_pxp@create-protected-buffer.html

  * igt@gem_pxp@hw-rejects-pxp-context:
    - shard-tglu-1:       NOTRUN -> [SKIP][62] ([i915#13398])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-1/igt@gem_pxp@hw-rejects-pxp-context.html

  * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
    - shard-dg2:          NOTRUN -> [SKIP][63] ([i915#4270])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-1/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html

  * igt@gem_render_copy@y-tiled-ccs-to-y-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][64] ([i915#5190] / [i915#8428])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-1/igt@gem_render_copy@y-tiled-ccs-to-y-tiled.html

  * igt@gem_render_tiled_blits@basic:
    - shard-dg2:          NOTRUN -> [SKIP][65] ([i915#4079])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-6/igt@gem_render_tiled_blits@basic.html

  * igt@gem_softpin@noreloc-s3:
    - shard-glk:          [PASS][66] -> [INCOMPLETE][67] ([i915#13356] / [i915#13809] / [i915#16193])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-glk5/igt@gem_softpin@noreloc-s3.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-glk8/igt@gem_softpin@noreloc-s3.html

  * igt@gem_userptr_blits@coherency-sync:
    - shard-dg2:          NOTRUN -> [SKIP][68] ([i915#3297]) +2 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-1/igt@gem_userptr_blits@coherency-sync.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-tglu:         NOTRUN -> [SKIP][69] ([i915#3297] / [i915#3323])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-10/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-glk:          NOTRUN -> [SKIP][70] ([i915#3323])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-glk5/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@forbidden-operations:
    - shard-rkl:          NOTRUN -> [SKIP][71] ([i915#3282] / [i915#3297])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-2/igt@gem_userptr_blits@forbidden-operations.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy:
    - shard-dg1:          NOTRUN -> [SKIP][72] ([i915#3297] / [i915#4880])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-14/igt@gem_userptr_blits@map-fixed-invalidate-busy.html
    - shard-mtlp:         NOTRUN -> [SKIP][73] ([i915#3297])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-mtlp-2/igt@gem_userptr_blits@map-fixed-invalidate-busy.html

  * igt@gem_userptr_blits@readonly-unsync:
    - shard-tglu-1:       NOTRUN -> [SKIP][74] ([i915#3297])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-1/igt@gem_userptr_blits@readonly-unsync.html

  * igt@gem_userptr_blits@relocations:
    - shard-rkl:          NOTRUN -> [SKIP][75] ([i915#3281] / [i915#3297])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-4/igt@gem_userptr_blits@relocations.html

  * igt@gem_userptr_blits@sd-probe:
    - shard-dg1:          NOTRUN -> [SKIP][76] ([i915#3297] / [i915#4958])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-19/igt@gem_userptr_blits@sd-probe.html

  * igt@gem_userptr_blits@unsync-unmap-after-close:
    - shard-tglu:         NOTRUN -> [SKIP][77] ([i915#3297])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-4/igt@gem_userptr_blits@unsync-unmap-after-close.html

  * igt@gen9_exec_parse@basic-rejected-ctx-param:
    - shard-mtlp:         NOTRUN -> [SKIP][78] ([i915#2856]) +1 other test skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-mtlp-2/igt@gen9_exec_parse@basic-rejected-ctx-param.html

  * igt@gen9_exec_parse@bb-start-cmd:
    - shard-dg2:          NOTRUN -> [SKIP][79] ([i915#2856])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-8/igt@gen9_exec_parse@bb-start-cmd.html

  * igt@gen9_exec_parse@bb-start-param:
    - shard-tglu-1:       NOTRUN -> [SKIP][80] ([i915#2527] / [i915#2856]) +2 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-1/igt@gen9_exec_parse@bb-start-param.html

  * igt@gen9_exec_parse@secure-batches:
    - shard-rkl:          NOTRUN -> [SKIP][81] ([i915#2527]) +1 other test skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-8/igt@gen9_exec_parse@secure-batches.html

  * igt@gen9_exec_parse@shadow-peek:
    - shard-dg1:          NOTRUN -> [SKIP][82] ([i915#2527]) +4 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-19/igt@gen9_exec_parse@shadow-peek.html

  * igt@gen9_exec_parse@unaligned-jump:
    - shard-tglu:         NOTRUN -> [SKIP][83] ([i915#2527] / [i915#2856]) +5 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-4/igt@gen9_exec_parse@unaligned-jump.html

  * igt@gpu_buddy@gpu_buddy:
    - shard-tglu-1:       NOTRUN -> [SKIP][84] ([i915#15678])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-1/igt@gpu_buddy@gpu_buddy.html
    - shard-dg1:          NOTRUN -> [SKIP][85] ([i915#15678])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-15/igt@gpu_buddy@gpu_buddy.html

  * igt@i915_drm_fdinfo@all-busy-check-all:
    - shard-dg1:          NOTRUN -> [SKIP][86] ([i915#14123])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-16/igt@i915_drm_fdinfo@all-busy-check-all.html

  * igt@i915_drm_fdinfo@busy-hang@vcs0:
    - shard-dg2:          NOTRUN -> [SKIP][87] ([i915#14073]) +7 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-6/igt@i915_drm_fdinfo@busy-hang@vcs0.html

  * igt@i915_drm_fdinfo@virtual-busy-hang-all:
    - shard-dg1:          NOTRUN -> [SKIP][88] ([i915#14118])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-16/igt@i915_drm_fdinfo@virtual-busy-hang-all.html

  * igt@i915_module_load@fault-injection:
    - shard-dg1:          NOTRUN -> [ABORT][89] ([i915#11814] / [i915#15481]) +1 other test abort
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-14/igt@i915_module_load@fault-injection.html
    - shard-mtlp:         NOTRUN -> [ABORT][90] ([i915#15342] / [i915#15481])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-mtlp-2/igt@i915_module_load@fault-injection.html

  * igt@i915_module_load@fault-injection@__uc_init:
    - shard-mtlp:         NOTRUN -> [ABORT][91] ([i915#15481])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-mtlp-2/igt@i915_module_load@fault-injection@__uc_init.html

  * igt@i915_module_load@fault-injection@i915_driver_mmio_probe:
    - shard-dg1:          NOTRUN -> [INCOMPLETE][92] ([i915#15481])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-14/igt@i915_module_load@fault-injection@i915_driver_mmio_probe.html

  * igt@i915_module_load@fault-injection@intel_connector_register:
    - shard-mtlp:         NOTRUN -> [DMESG-WARN][93] ([i915#15342])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-mtlp-2/igt@i915_module_load@fault-injection@intel_connector_register.html

  * igt@i915_module_load@resize-bar:
    - shard-tglu-1:       NOTRUN -> [SKIP][94] ([i915#6412])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-1/igt@i915_module_load@resize-bar.html

  * igt@i915_pm_freq_api@freq-basic-api:
    - shard-tglu:         NOTRUN -> [SKIP][95] ([i915#8399])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-10/igt@i915_pm_freq_api@freq-basic-api.html

  * igt@i915_pm_rc6_residency@media-rc6-accuracy:
    - shard-dg2:          NOTRUN -> [SKIP][96] ([i915#16080] / [i915#16166])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-6/igt@i915_pm_rc6_residency@media-rc6-accuracy.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-rkl:          NOTRUN -> [SKIP][97] ([i915#14498])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-4/igt@i915_pm_rc6_residency@rc6-idle.html
    - shard-tglu-1:       NOTRUN -> [SKIP][98] ([i915#14498])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-1/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rps@thresholds:
    - shard-dg1:          NOTRUN -> [SKIP][99] ([i915#11681]) +1 other test skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-16/igt@i915_pm_rps@thresholds.html

  * igt@i915_query@hwconfig_table:
    - shard-tglu-1:       NOTRUN -> [SKIP][100] ([i915#6245])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-1/igt@i915_query@hwconfig_table.html

  * igt@i915_query@query-topology-known-pci-ids:
    - shard-tglu:         NOTRUN -> [SKIP][101] ([i915#16109])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-2/igt@i915_query@query-topology-known-pci-ids.html

  * igt@i915_suspend@forcewake:
    - shard-glk:          NOTRUN -> [INCOMPLETE][102] ([i915#13356] / [i915#16182] / [i915#4817])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-glk4/igt@i915_suspend@forcewake.html

  * igt@kms_addfb_basic@clobberred-modifier:
    - shard-dg2:          NOTRUN -> [SKIP][103] ([i915#4212])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-6/igt@kms_addfb_basic@clobberred-modifier.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-dg1:          NOTRUN -> [SKIP][104] ([i915#1769] / [i915#3555]) +1 other test skip
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-16/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][105] ([i915#5286]) +1 other test skip
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-8/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-180:
    - shard-tglu:         NOTRUN -> [SKIP][106] ([i915#5286]) +8 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-10/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-tglu-1:       NOTRUN -> [SKIP][107] ([i915#5286]) +2 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
    - shard-dg1:          NOTRUN -> [SKIP][108] ([i915#4538] / [i915#5286]) +5 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-15/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-dg2:          NOTRUN -> [SKIP][109] +3 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-1/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-tglu:         NOTRUN -> [SKIP][110] ([i915#3828]) +1 other test skip
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-5/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][111] ([i915#3638]) +4 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-4/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-dg1:          NOTRUN -> [SKIP][112] ([i915#3638])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-14/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-90:
    - shard-dg2:          NOTRUN -> [SKIP][113] ([i915#4538] / [i915#5190]) +1 other test skip
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-6/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-mtlp:         NOTRUN -> [SKIP][114] +4 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-mtlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][115] ([i915#4538]) +2 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-15/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][116] ([i915#6095]) +197 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-19/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][117] ([i915#12313]) +2 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-10/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][118] ([i915#6095]) +69 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-8/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][119] ([i915#12313])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-1/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][120] ([i915#12805]) +1 other test skip
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-19/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
    - shard-glk:          NOTRUN -> [SKIP][121] +121 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-glk3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-edp-1:
    - shard-mtlp:         NOTRUN -> [FAIL][122] ([i915#17158]) +1 other test fail
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-mtlp-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
    - shard-rkl:          [PASS][123] -> [ABORT][124] ([i915#15132])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-8/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-1/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][125] ([i915#6095]) +3 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [ABORT][126] ([i915#15132])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-1/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][127] ([i915#12313]) +1 other test skip
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-16/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-c-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][128] ([i915#14098] / [i915#6095]) +39 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-2/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][129] ([i915#10307] / [i915#6095]) +49 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-4/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][130] ([i915#6095]) +4 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-mtlp-2/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][131] ([i915#12313])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-6/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][132] ([i915#6095]) +24 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-1/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][133] ([i915#6095]) +61 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-7/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][134] ([i915#10307] / [i915#10434] / [i915#6095])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-4/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_cdclk@mode-rejected-max-dotclock:
    - shard-dg1:          NOTRUN -> [SKIP][135] ([i915#17099])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-16/igt@kms_cdclk@mode-rejected-max-dotclock.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-tglu:         NOTRUN -> [SKIP][136] ([i915#3742])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-4/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][137] ([i915#13781]) +3 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-8/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html

  * igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d:
    - shard-mtlp:         NOTRUN -> [SKIP][138] ([i915#16464] / [i915#16471])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-mtlp-2/igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d:
    - shard-rkl:          NOTRUN -> [SKIP][139] ([i915#16471])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-8/igt@kms_chamelium_color_pipeline@plane-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4:
    - shard-tglu:         NOTRUN -> [SKIP][140] ([i915#16471])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-10/igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4.html

  * igt@kms_chamelium_color_pipeline@plane-lut3d-green-only:
    - shard-dg1:          NOTRUN -> [SKIP][141] ([i915#16471]) +1 other test skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-19/igt@kms_chamelium_color_pipeline@plane-lut3d-green-only.html

  * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][142] ([i915#11151] / [i915#7828]) +3 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-6/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html

  * igt@kms_chamelium_edid@hdmi-edid-read:
    - shard-rkl:          NOTRUN -> [SKIP][143] ([i915#11151] / [i915#7828]) +6 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-8/igt@kms_chamelium_edid@hdmi-edid-read.html

  * igt@kms_chamelium_frames@hdmi-aspect-ratio:
    - shard-tglu:         NOTRUN -> [SKIP][144] ([i915#11151] / [i915#7828]) +9 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-10/igt@kms_chamelium_frames@hdmi-aspect-ratio.html

  * igt@kms_chamelium_frames@hdmi-cmp-planar-formats:
    - shard-tglu-1:       NOTRUN -> [SKIP][145] ([i915#11151] / [i915#7828]) +3 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-1/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html

  * igt@kms_chamelium_frames@hdmi-crc-multiple:
    - shard-dg1:          NOTRUN -> [SKIP][146] ([i915#11151] / [i915#7828]) +5 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-16/igt@kms_chamelium_frames@hdmi-crc-multiple.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-mtlp:         NOTRUN -> [SKIP][147] ([i915#11151] / [i915#7828])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-mtlp-2/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_color@deep-color:
    - shard-dg2:          NOTRUN -> [SKIP][148] ([i915#12655] / [i915#3555])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-1/igt@kms_color@deep-color.html

  * igt@kms_color_pipeline@plane-ctm3x4-lut1d@pipe-b-plane-4:
    - shard-tglu-1:       NOTRUN -> [SKIP][149] ([i915#16990]) +15 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-1/igt@kms_color_pipeline@plane-ctm3x4-lut1d@pipe-b-plane-4.html
    - shard-dg1:          NOTRUN -> [SKIP][150] ([i915#16990]) +15 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-15/igt@kms_color_pipeline@plane-ctm3x4-lut1d@pipe-b-plane-4.html

  * igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-d-plane-3:
    - shard-tglu:         NOTRUN -> [SKIP][151] ([i915#16990]) +47 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-2/igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-d-plane-3.html

  * igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-c-plane-4:
    - shard-rkl:          NOTRUN -> [SKIP][152] ([i915#16990]) +5 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-2/igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-c-plane-4.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-tglu:         NOTRUN -> [SKIP][153] ([i915#15330] / [i915#3116] / [i915#3299])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-8/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:
    - shard-dg1:          NOTRUN -> [SKIP][154] ([i915#15330])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-19/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-dg1:          NOTRUN -> [SKIP][155] ([i915#15330] / [i915#3299])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-16/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-0-hdcp14:
    - shard-dg2:          NOTRUN -> [SKIP][156] ([i915#15330])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-6/igt@kms_content_protection@dp-mst-type-0-hdcp14.html

  * igt@kms_content_protection@dp-mst-type-1-suspend-resume:
    - shard-rkl:          NOTRUN -> [SKIP][157] ([i915#15330])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-2/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html

  * igt@kms_content_protection@legacy:
    - shard-tglu-1:       NOTRUN -> [SKIP][158] ([i915#15865]) +1 other test skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-1/igt@kms_content_protection@legacy.html
    - shard-dg1:          NOTRUN -> [SKIP][159] ([i915#15865]) +1 other test skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-15/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic-type-0-hdcp14:
    - shard-rkl:          NOTRUN -> [SKIP][160] ([i915#15865])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-4/igt@kms_content_protection@lic-type-0-hdcp14.html

  * igt@kms_content_protection@mei-interface:
    - shard-dg2:          NOTRUN -> [SKIP][161] ([i915#15865])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-1/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@srm:
    - shard-tglu:         NOTRUN -> [SKIP][162] ([i915#15865]) +1 other test skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-8/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-onscreen-128x42:
    - shard-rkl:          NOTRUN -> [FAIL][163] ([i915#13566]) +4 other tests fail
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-4/igt@kms_cursor_crc@cursor-onscreen-128x42.html
    - shard-tglu-1:       NOTRUN -> [FAIL][164] ([i915#13566]) +1 other test fail
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-1/igt@kms_cursor_crc@cursor-onscreen-128x42.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-rkl:          NOTRUN -> [SKIP][165] ([i915#3555]) +1 other test skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-2/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-dg1:          NOTRUN -> [SKIP][166] ([i915#13049]) +2 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-16/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-rkl:          NOTRUN -> [SKIP][167] ([i915#13049]) +1 other test skip
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-4/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
    - shard-tglu-1:       NOTRUN -> [SKIP][168] ([i915#13049]) +1 other test skip
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-1/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-tglu:         NOTRUN -> [SKIP][169] ([i915#13049]) +1 other test skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-2/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-256x85:
    - shard-mtlp:         NOTRUN -> [SKIP][170] ([i915#8814])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-mtlp-2/igt@kms_cursor_crc@cursor-sliding-256x85.html

  * igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-2:
    - shard-rkl:          [PASS][171] -> [FAIL][172] ([i915#13566]) +3 other tests fail
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-2.html
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-2.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-tglu:         NOTRUN -> [SKIP][173] ([i915#3555]) +5 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-8/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions:
    - shard-dg1:          [PASS][174] -> [DMESG-WARN][175] ([i915#4423])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-dg1-18/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-17/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-mtlp:         NOTRUN -> [SKIP][176] ([i915#9809])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-mtlp-2/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic:
    - shard-dg1:          [PASS][177] -> [FAIL][178] ([i915#15999])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-dg1-19/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.html
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-14/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.html

  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
    - shard-rkl:          NOTRUN -> [SKIP][179] ([i915#9067])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-8/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg1:          NOTRUN -> [SKIP][180] ([i915#4103])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-14/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
    - shard-mtlp:         NOTRUN -> [SKIP][181] ([i915#16119] / [i915#4213])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-mtlp-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-tglu:         NOTRUN -> [SKIP][182] ([i915#4103]) +1 other test skip
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-tglu:         NOTRUN -> [SKIP][183] ([i915#9723])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-8/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-dg2:          NOTRUN -> [SKIP][184] ([i915#3555])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-dg1:          NOTRUN -> [SKIP][185] ([i915#17289])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-19/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train:
    - shard-tglu-1:       NOTRUN -> [SKIP][186] ([i915#17291])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-1/igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train.html
    - shard-dg1:          NOTRUN -> [SKIP][187] ([i915#17291])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-15/igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train.html

  * igt@kms_dp_link_training@non-uhbr-sst-direct-train:
    - shard-rkl:          NOTRUN -> [SKIP][188] ([i915#17286])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-4/igt@kms_dp_link_training@non-uhbr-sst-direct-train.html
    - shard-tglu-1:       NOTRUN -> [SKIP][189] ([i915#17286])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-1/igt@kms_dp_link_training@non-uhbr-sst-direct-train.html

  * igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train:
    - shard-rkl:          NOTRUN -> [SKIP][190] ([i915#17290])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-2/igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train.html

  * igt@kms_dp_link_training@uhbr-mst-direct-train:
    - shard-tglu:         NOTRUN -> [SKIP][191] ([i915#17285]) +1 other test skip
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-5/igt@kms_dp_link_training@uhbr-mst-direct-train.html

  * igt@kms_dp_link_training@uhbr-mst-tbtalt-train:
    - shard-dg1:          NOTRUN -> [SKIP][192] ([i915#17285])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-16/igt@kms_dp_link_training@uhbr-mst-tbtalt-train.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-tglu:         NOTRUN -> [SKIP][193] ([i915#13748])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-10/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-dg2:          NOTRUN -> [SKIP][194] ([i915#13707])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-6/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dsc@dsc-basic-ultrajoiner:
    - shard-tglu:         NOTRUN -> [SKIP][195] ([i915#16361]) +4 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-10/igt@kms_dsc@dsc-basic-ultrajoiner.html

  * igt@kms_dsc@dsc-fractional-bpp-bigjoiner:
    - shard-dg1:          NOTRUN -> [SKIP][196] ([i915#16361]) +1 other test skip
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-19/igt@kms_dsc@dsc-fractional-bpp-bigjoiner.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-tglu-1:       NOTRUN -> [SKIP][197] ([i915#16361]) +2 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-1/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-dg2:          NOTRUN -> [SKIP][198] ([i915#16361]) +1 other test skip
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-1/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_dsc@dsc-with-output-formats-bigjoiner:
    - shard-rkl:          NOTRUN -> [SKIP][199] ([i915#16361]) +2 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-2/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html

  * igt@kms_fbcon_fbt@psr:
    - shard-rkl:          NOTRUN -> [SKIP][200] ([i915#16680])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-8/igt@kms_fbcon_fbt@psr.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][201] ([i915#16680])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-4/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@display-2x:
    - shard-rkl:          NOTRUN -> [SKIP][202] ([i915#16081])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-8/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg2:          NOTRUN -> [SKIP][203] ([i915#16081])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-6/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg1:          NOTRUN -> [SKIP][204] ([i915#16599])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-16/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@dsc:
    - shard-tglu-1:       NOTRUN -> [SKIP][205] ([i915#16600])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-1/igt@kms_feature_discovery@dsc.html
    - shard-dg1:          NOTRUN -> [SKIP][206] ([i915#16600])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-15/igt@kms_feature_discovery@dsc.html

  * igt@kms_feature_discovery@psr1:
    - shard-dg2:          NOTRUN -> [SKIP][207] ([i915#658])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-8/igt@kms_feature_discovery@psr1.html

  * igt@kms_feature_discovery@psr2:
    - shard-tglu:         NOTRUN -> [SKIP][208] ([i915#658])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-4/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-dg1:          NOTRUN -> [SKIP][209] ([i915#9934]) +9 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-19/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank:
    - shard-tglu:         NOTRUN -> [SKIP][210] ([i915#3637] / [i915#9934]) +7 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-2/igt@kms_flip@2x-blocking-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
    - shard-mtlp:         NOTRUN -> [SKIP][211] ([i915#3637] / [i915#9934]) +2 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-mtlp-2/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop:
    - shard-tglu:         NOTRUN -> [SKIP][212] ([i915#9934]) +1 other test skip
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-10/igt@kms_flip@2x-flip-vs-dpms-on-nop.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-glk10:        NOTRUN -> [INCOMPLETE][213] ([i915#12745] / [i915#13356] / [i915#17183] / [i915#4839])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-glk10/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2:
    - shard-glk10:        NOTRUN -> [INCOMPLETE][214] ([i915#12745] / [i915#13356] / [i915#17183])
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-glk10/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
    - shard-tglu-1:       NOTRUN -> [SKIP][215] ([i915#3637] / [i915#9934]) +3 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-1/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][216] ([i915#9934])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-1/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-rkl:          NOTRUN -> [SKIP][217] ([i915#9934]) +3 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-8/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-fences:
    - shard-dg2:          NOTRUN -> [SKIP][218] ([i915#8381])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-6/igt@kms_flip@flip-vs-fences.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][219] ([i915#12745] / [i915#13356] / [i915#17183] / [i915#4839])
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-glk6/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-glk:          NOTRUN -> [INCOMPLETE][220] ([i915#12745] / [i915#13356] / [i915#17183] / [i915#4839] / [i915#6113])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-glk3/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a2:
    - shard-rkl:          [PASS][221] -> [INCOMPLETE][222] ([i915#16276] / [i915#6113]) +1 other test incomplete
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-4/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a2.html
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-3/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a2.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][223] ([i915#12745] / [i915#13356] / [i915#17183]) +1 other test incomplete
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-glk6/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][224] ([i915#15643])
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][225] ([i915#15643])
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][226] ([i915#15643] / [i915#5190])
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-1/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-dg1:          NOTRUN -> [SKIP][227] ([i915#15643]) +2 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-16/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-tglu:         NOTRUN -> [SKIP][228] ([i915#15643]) +5 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-10/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][229] ([i915#3555] / [i915#8810] / [i915#8813]) +1 other test skip
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][230] ([i915#15104] / [i915#15990])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-16/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][231] ([i915#15990] / [i915#8708]) +7 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
    - shard-dg2:          NOTRUN -> [SKIP][232] ([i915#15991] / [i915#5354]) +7 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][233] +60 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-dg1:          NOTRUN -> [SKIP][234] +68 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-14/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
    - shard-mtlp:         NOTRUN -> [SKIP][235] ([i915#15991] / [i915#1825]) +3 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][236] ([i915#15990] / [i915#8708])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-glk11:        NOTRUN -> [INCOMPLETE][237] ([i915#10056] / [i915#13356] / [i915#16593])
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-glk11/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-plflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][238] ([i915#15989]) +15 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-4/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-cur-indfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][239] ([i915#15990]) +17 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-16/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][240] ([i915#15991]) +9 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-6/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbchdr-indfb-scaledprimary:
    - shard-tglu-1:       NOTRUN -> [SKIP][241] ([i915#15989]) +9 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-1/igt@kms_frontbuffer_tracking@fbchdr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-mmap-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][242] ([i915#15989]) +3 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-6/igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbchdr-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][243] ([i915#15989]) +28 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-2/igt@kms_frontbuffer_tracking@fbchdr-suspend.html

  * igt@kms_frontbuffer_tracking@fbchdr-tiling-4:
    - shard-tglu-1:       NOTRUN -> [SKIP][244] ([i915#5439])
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-1/igt@kms_frontbuffer_tracking@fbchdr-tiling-4.html
    - shard-dg1:          NOTRUN -> [SKIP][245] ([i915#5439])
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-15/igt@kms_frontbuffer_tracking@fbchdr-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][246] ([i915#15102]) +13 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt:
    - shard-glk10:        NOTRUN -> [SKIP][247] +114 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-glk10/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][248] ([i915#15990] / [i915#8708]) +13 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-15/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
    - shard-rkl:          NOTRUN -> [SKIP][249] ([i915#15102]) +33 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-tglu:         NOTRUN -> [SKIP][250] ([i915#5439])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-4/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-shrfb-msflip-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][251] ([i915#15991]) +8 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-suspend:
    - shard-tglu-1:       NOTRUN -> [SKIP][252] ([i915#15102]) +21 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-suspend.html

  * igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][253] ([i915#15990]) +8 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-6/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-draw-blt:
    - shard-rkl:          [PASS][254] -> [SKIP][255] ([i915#15989]) +6 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-draw-blt.html
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-5/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-glk:          [PASS][256] -> [SKIP][257] +25 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-glk8/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-draw-mmap-cpu.html
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-glk3/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@hdr-indfb-scaledprimary:
    - shard-dg1:          NOTRUN -> [SKIP][258] ([i915#15989]) +14 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-19/igt@kms_frontbuffer_tracking@hdr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-rkl:          NOTRUN -> [SKIP][259] ([i915#9766])
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-4/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
    - shard-tglu-1:       NOTRUN -> [SKIP][260] ([i915#9766])
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-1/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-cpu:
    - shard-dg1:          NOTRUN -> [SKIP][261] ([i915#15102]) +36 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-16/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-render:
    - shard-tglu:         NOTRUN -> [SKIP][262] ([i915#15102]) +54 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-10/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][263] ([i915#15104] / [i915#15990])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-rkl:          NOTRUN -> [SKIP][264] ([i915#1825]) +1 other test skip
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-tglu:         NOTRUN -> [SKIP][265] +141 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-shrfb-draw-mmap-cpu:
    - shard-mtlp:         NOTRUN -> [SKIP][266] ([i915#15989]) +9 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-mtlp-2/igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-rte:
    - shard-tglu-1:       NOTRUN -> [SKIP][267] +47 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-1/igt@kms_frontbuffer_tracking@psrhdr-2p-rte.html

  * igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery:
    - shard-tglu:         NOTRUN -> [FAIL][268] ([i915#17188])
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-5/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html

  * igt@kms_hdr@bpc-switch:
    - shard-tglu-1:       NOTRUN -> [SKIP][269] ([i915#3555] / [i915#8228])
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-1/igt@kms_hdr@bpc-switch.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][270] ([i915#3555] / [i915#8228])
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-2/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-tglu:         NOTRUN -> [SKIP][271] ([i915#12713])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-10/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-hdr:
    - shard-rkl:          NOTRUN -> [SKIP][272] ([i915#16644] / [i915#3555] / [i915#8228])
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-8/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-mtlp:         NOTRUN -> [SKIP][273] ([i915#12713] / [i915#16490] / [i915#3555] / [i915#8228])
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-mtlp-2/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-rkl:          [PASS][274] -> [SKIP][275] ([i915#16644] / [i915#3555] / [i915#8228])
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-6/igt@kms_hdr@static-toggle-dpms.html
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-5/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-dg1:          NOTRUN -> [SKIP][276] ([i915#3555] / [i915#8228]) +2 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-16/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][277] ([i915#15460])
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-4/igt@kms_joiner@basic-big-joiner.html
    - shard-tglu-1:       NOTRUN -> [SKIP][278] ([i915#15460])
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-1/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][279] ([i915#15459])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-2/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][280] ([i915#13688])
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-4/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][281] ([i915#15459])
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-16/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][282] ([i915#15638] / [i915#15722])
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-10/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-tglu:         NOTRUN -> [SKIP][283] ([i915#15815])
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@legacy:
    - shard-tglu:         NOTRUN -> [SKIP][284] ([i915#6301])
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-10/igt@kms_panel_fitting@legacy.html

  * igt@kms_pipe_stress@stress-xrgb8888-4tiled:
    - shard-tglu:         NOTRUN -> [SKIP][285] ([i915#14712])
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-2/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html

  * igt@kms_pipe_stress@stress-xrgb8888-untiled:
    - shard-tglu:         NOTRUN -> [DMESG-WARN][286] ([i915#16696] / [i915#16772])
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-4/igt@kms_pipe_stress@stress-xrgb8888-untiled.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-dg2:          NOTRUN -> [SKIP][287] ([i915#13705])
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-6/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier@pipe-a-plane-5:
    - shard-dg2:          NOTRUN -> [SKIP][288] ([i915#16386]) +1 other test skip
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-1/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier@pipe-a-plane-5.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier:
    - shard-tglu-1:       NOTRUN -> [SKIP][289] ([i915#15709])
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-1/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier.html

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping:
    - shard-dg1:          NOTRUN -> [SKIP][290] ([i915#15709]) +2 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-19/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:
    - shard-rkl:          NOTRUN -> [SKIP][291] ([i915#15709]) +2 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-8/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping:
    - shard-dg2:          NOTRUN -> [SKIP][292] ([i915#15709]) +1 other test skip
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-1/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier:
    - shard-tglu:         NOTRUN -> [SKIP][293] ([i915#15709]) +3 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-10/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-7:
    - shard-tglu:         NOTRUN -> [SKIP][294] ([i915#16386]) +1 other test skip
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-8/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-7.html

  * igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y:
    - shard-dg1:          NOTRUN -> [SKIP][295] ([i915#16112])
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-14/igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y.html
    - shard-mtlp:         NOTRUN -> [SKIP][296] ([i915#16112])
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-mtlp-2/igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y.html

  * igt@kms_plane_alpha_blend@alpha-basic:
    - shard-glk11:        NOTRUN -> [FAIL][297] ([i915#12178])
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-glk11/igt@kms_plane_alpha_blend@alpha-basic.html

  * igt@kms_plane_alpha_blend@alpha-basic@pipe-a-hdmi-a-1:
    - shard-glk11:        NOTRUN -> [FAIL][298] ([i915#7862]) +1 other test fail
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-glk11/igt@kms_plane_alpha_blend@alpha-basic@pipe-a-hdmi-a-1.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-dg2:          NOTRUN -> [SKIP][299] ([i915#13958])
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-8/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-tglu:         NOTRUN -> [SKIP][300] ([i915#13958]) +2 other tests skip
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-4/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-tglu:         NOTRUN -> [SKIP][301] ([i915#14259])
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-8/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-rkl:          [PASS][302] -> [SKIP][303] ([i915#6953])
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-1/igt@kms_plane_scaling@intel-max-src-size.html
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-7/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-c:
    - shard-tglu:         NOTRUN -> [SKIP][304] ([i915#15329]) +4 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-8/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-c.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d:
    - shard-dg1:          NOTRUN -> [SKIP][305] ([i915#15329]) +4 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-14/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-tglu:         NOTRUN -> [SKIP][306] ([i915#12343] / [i915#9812])
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-10/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@fade:
    - shard-dg2:          NOTRUN -> [SKIP][307] ([i915#12343] / [i915#5354])
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-6/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][308] ([i915#12343] / [i915#5354]) +1 other test skip
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-4/igt@kms_pm_backlight@fade-with-dpms.html
    - shard-tglu-1:       NOTRUN -> [SKIP][309] ([i915#12343] / [i915#9812])
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-1/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-rkl:          NOTRUN -> [SKIP][310] ([i915#15948])
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-2/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc5-psr-suspend-resume:
    - shard-tglu-1:       NOTRUN -> [SKIP][311] ([i915#16914])
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-1/igt@kms_pm_dc@dc5-psr-suspend-resume.html
    - shard-dg1:          NOTRUN -> [SKIP][312] ([i915#16914])
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-15/igt@kms_pm_dc@dc5-psr-suspend-resume.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-rkl:          NOTRUN -> [FAIL][313] ([i915#16479])
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-8/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-tglu:         NOTRUN -> [SKIP][314] ([i915#15948])
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-10/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-dg1:          NOTRUN -> [SKIP][315] ([i915#9340])
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-16/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-dg1:          [PASS][316] -> [SKIP][317] ([i915#15073]) +2 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-dg1-14/igt@kms_pm_rpm@dpms-lpsp.html
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-12/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-dg2:          NOTRUN -> [SKIP][318] ([i915#15073])
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-6/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-tglu:         NOTRUN -> [SKIP][319] ([i915#15073])
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-4/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-rkl:          [PASS][320] -> [SKIP][321] ([i915#15073]) +1 other test skip
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-3/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-2/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_pm_rpm@package-g7:
    - shard-tglu:         NOTRUN -> [SKIP][322] ([i915#15403])
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-8/igt@kms_pm_rpm@package-g7.html

  * igt@kms_prime@d3hot:
    - shard-dg1:          NOTRUN -> [SKIP][323] ([i915#6524])
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-14/igt@kms_prime@d3hot.html
    - shard-mtlp:         NOTRUN -> [SKIP][324] ([i915#6524])
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-mtlp-2/igt@kms_prime@d3hot.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-tglu:         NOTRUN -> [SKIP][325] ([i915#11520]) +9 other tests skip
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-2/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - shard-dg2:          NOTRUN -> [SKIP][326] ([i915#11520]) +1 other test skip
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-1/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-glk10:        NOTRUN -> [SKIP][327] ([i915#11520]) +2 other tests skip
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-glk10/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:
    - shard-rkl:          NOTRUN -> [SKIP][328] ([i915#11520]) +4 other tests skip
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-8/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][329] ([i915#11520]) +1 other test skip
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-glk5/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
    - shard-tglu-1:       NOTRUN -> [SKIP][330] ([i915#11520]) +3 other tests skip
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-1/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html
    - shard-dg1:          NOTRUN -> [SKIP][331] ([i915#11520]) +5 other tests skip
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-15/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:
    - shard-glk11:        NOTRUN -> [SKIP][332] ([i915#11520]) +2 other tests skip
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-glk11/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-snb:          NOTRUN -> [SKIP][333] ([i915#11520]) +4 other tests skip
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-snb7/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-tglu:         NOTRUN -> [SKIP][334] ([i915#9683])
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-10/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@fbc-psr-dpms@edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][335] ([i915#9688]) +4 other tests skip
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-mtlp-2/igt@kms_psr@fbc-psr-dpms@edp-1.html

  * igt@kms_psr@fbc-psr-primary-render:
    - shard-glk11:        NOTRUN -> [SKIP][336] +106 other tests skip
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-glk11/igt@kms_psr@fbc-psr-primary-render.html

  * igt@kms_psr@fbc-psr2-primary-blt:
    - shard-rkl:          NOTRUN -> [SKIP][337] ([i915#1072] / [i915#9732]) +11 other tests skip
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-8/igt@kms_psr@fbc-psr2-primary-blt.html

  * igt@kms_psr@pr-sprite-plane-onoff:
    - shard-tglu-1:       NOTRUN -> [SKIP][338] ([i915#9732]) +9 other tests skip
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-1/igt@kms_psr@pr-sprite-plane-onoff.html

  * igt@kms_psr@psr-cursor-plane-onoff:
    - shard-dg1:          NOTRUN -> [SKIP][339] ([i915#1072] / [i915#9732]) +21 other tests skip
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-14/igt@kms_psr@psr-cursor-plane-onoff.html

  * igt@kms_psr@psr2-cursor-plane-onoff:
    - shard-tglu:         NOTRUN -> [SKIP][340] ([i915#9732]) +26 other tests skip
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-4/igt@kms_psr@psr2-cursor-plane-onoff.html

  * igt@kms_psr@psr2-primary-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][341] ([i915#1072] / [i915#9732]) +9 other tests skip
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-8/igt@kms_psr@psr2-primary-mmap-gtt.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-dg1:          NOTRUN -> [SKIP][342] ([i915#15949])
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-14/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-tglu-1:       NOTRUN -> [SKIP][343] ([i915#15949])
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
    - shard-rkl:          NOTRUN -> [SKIP][344] ([i915#15949])
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-4/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@exhaust-fences:
    - shard-dg1:          NOTRUN -> [SKIP][345] ([i915#4884])
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-19/igt@kms_rotation_crc@exhaust-fences.html

  * igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:
    - shard-glk11:        NOTRUN -> [INCOMPLETE][346] ([i915#15500] / [i915#16184])
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-glk11/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-tglu:         NOTRUN -> [SKIP][347] ([i915#5289])
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-10/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-tglu-1:       NOTRUN -> [SKIP][348] ([i915#5289])
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
    - shard-dg1:          NOTRUN -> [SKIP][349] ([i915#5289]) +1 other test skip
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-15/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-dg1:          NOTRUN -> [SKIP][350] ([i915#3555]) +1 other test skip
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-16/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-glk11:        NOTRUN -> [INCOMPLETE][351] ([i915#12276] / [i915#13356]) +1 other test incomplete
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-glk11/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-2:
    - shard-rkl:          [PASS][352] -> [INCOMPLETE][353] ([i915#12276]) +1 other test incomplete
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-7/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-2.html
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-6/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-2.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-tglu-1:       NOTRUN -> [SKIP][354] ([i915#9906])
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-1/igt@kms_vrr@flip-basic-fastset.html
    - shard-dg1:          NOTRUN -> [SKIP][355] ([i915#9906])
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-15/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-tglu:         NOTRUN -> [SKIP][356] ([i915#9906])
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-10/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@perf@gen8-unprivileged-single-ctx-counters:
    - shard-rkl:          NOTRUN -> [SKIP][357] ([i915#2436])
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-8/igt@perf@gen8-unprivileged-single-ctx-counters.html

  * igt@perf@mi-rpc:
    - shard-rkl:          NOTRUN -> [SKIP][358] ([i915#2434])
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-8/igt@perf@mi-rpc.html

  * igt@perf@unprivileged-single-ctx-counters:
    - shard-rkl:          NOTRUN -> [SKIP][359] ([i915#2433])
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-2/igt@perf@unprivileged-single-ctx-counters.html

  * igt@perf_pmu@busy-double-start:
    - shard-mtlp:         NOTRUN -> [FAIL][360] ([i915#4349]) +2 other tests fail
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-mtlp-2/igt@perf_pmu@busy-double-start.html

  * igt@perf_pmu@busy-idle-check-all@ccs0:
    - shard-mtlp:         [PASS][361] -> [FAIL][362] ([i915#4349]) +4 other tests fail
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-mtlp-5/igt@perf_pmu@busy-idle-check-all@ccs0.html
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-mtlp-7/igt@perf_pmu@busy-idle-check-all@ccs0.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-tglu:         NOTRUN -> [SKIP][363] ([i915#8516]) +1 other test skip
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-8/igt@perf_pmu@rc6-all-gts.html

  * igt@perf_pmu@rc6-suspend:
    - shard-rkl:          [PASS][364] -> [INCOMPLETE][365] ([i915#13520])
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-2/igt@perf_pmu@rc6-suspend.html
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-6/igt@perf_pmu@rc6-suspend.html

  * igt@prime_mmap@test_aperture_limit:
    - shard-dg2:          NOTRUN -> [SKIP][366] ([i915#14121]) +1 other test skip
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-1/igt@prime_mmap@test_aperture_limit.html

  * igt@prime_udl@share-import:
    - shard-rkl:          NOTRUN -> [SKIP][367] ([i915#16420])
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-4/igt@prime_udl@share-import.html
    - shard-tglu-1:       NOTRUN -> [SKIP][368] ([i915#16420])
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-1/igt@prime_udl@share-import.html

  * igt@prime_udl@share-import-addfb:
    - shard-tglu:         NOTRUN -> [SKIP][369] ([i915#16420])
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-10/igt@prime_udl@share-import-addfb.html

  * igt@prime_vgem@basic-write:
    - shard-dg1:          NOTRUN -> [SKIP][370] ([i915#3708]) +1 other test skip
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-14/igt@prime_vgem@basic-write.html
    - shard-mtlp:         NOTRUN -> [SKIP][371] ([i915#10216] / [i915#3708])
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-mtlp-2/igt@prime_vgem@basic-write.html

  
#### Possible fixes ####

  * igt@gem_eio@in-flight-suspend:
    - shard-rkl:          [INCOMPLETE][372] ([i915#13390]) -> [PASS][373]
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-6/igt@gem_eio@in-flight-suspend.html
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-4/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_suspend@basic-s0:
    - shard-dg2:          [INCOMPLETE][374] ([i915#13356]) -> [PASS][375] +1 other test pass
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-dg2-7/igt@gem_exec_suspend@basic-s0.html
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-6/igt@gem_exec_suspend@basic-s0.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-glk:          [INCOMPLETE][376] ([i915#13356]) -> [PASS][377]
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-glk8/igt@gem_workarounds@suspend-resume-context.html
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-glk3/igt@gem_workarounds@suspend-resume-context.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-rkl:          [INCOMPLETE][378] ([i915#13356]) -> [PASS][379]
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-3/igt@gem_workarounds@suspend-resume-fd.html
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-2/igt@gem_workarounds@suspend-resume-fd.html

  * igt@i915_module_load@reload-no-display:
    - shard-tglu:         [ABORT][380] ([i915#16996]) -> [PASS][381]
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-tglu-3/igt@i915_module_load@reload-no-display.html
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-5/igt@i915_module_load@reload-no-display.html

  * igt@i915_pm_freq_api@freq-suspend@gt0:
    - shard-dg2:          [INCOMPLETE][382] ([i915#13356] / [i915#13820]) -> [PASS][383] +1 other test pass
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-dg2-6/igt@i915_pm_freq_api@freq-suspend@gt0.html
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-1/igt@i915_pm_freq_api@freq-suspend@gt0.html

  * igt@i915_power@sanity:
    - shard-mtlp:         [SKIP][384] ([i915#7984]) -> [PASS][385]
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-mtlp-8/igt@i915_power@sanity.html
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-mtlp-6/igt@i915_power@sanity.html

  * igt@kms_3d@basic:
    - shard-mtlp:         [SKIP][386] ([i915#15726]) -> [PASS][387]
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-mtlp-1/igt@kms_3d@basic.html
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-mtlp-5/igt@kms_3d@basic.html

  * igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1:
    - shard-tglu:         [FAIL][388] ([i915#13566]) -> [PASS][389] +1 other test pass
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-tglu-8/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1.html
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-8/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
    - shard-rkl:          [FAIL][390] ([i915#17139]) -> [PASS][391]
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-8/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-1/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-rkl:          [INCOMPLETE][392] ([i915#10056]) -> [PASS][393]
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-3/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-move:
    - shard-rkl:          [SKIP][394] ([i915#15989]) -> [PASS][395] +5 other tests pass
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-2/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-move.html
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-mmap-cpu:
    - shard-glk:          [SKIP][396] -> [PASS][397] +15 other tests pass
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-glk3/igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-mmap-cpu.html
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-glk8/igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-suspend:
    - shard-mtlp:         [FAIL][398] ([i915#17276]) -> [PASS][399] +1 other test pass
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-mtlp-5/igt@kms_frontbuffer_tracking@psr-suspend.html
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-mtlp-7/igt@kms_frontbuffer_tracking@psr-suspend.html

  * igt@kms_hdr@static-swap:
    - shard-rkl:          [SKIP][400] ([i915#16644] / [i915#3555] / [i915#8228]) -> [PASS][401]
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-2/igt@kms_hdr@static-swap.html
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-6/igt@kms_hdr@static-swap.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-dg1:          [SKIP][402] ([i915#15073]) -> [PASS][403] +1 other test pass
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-dg1-19/igt@kms_pm_rpm@modeset-lpsp.html
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-14/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-rkl:          [SKIP][404] ([i915#15073]) -> [PASS][405]
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-2/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-6/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@system-suspend-idle:
    - shard-dg2:          [INCOMPLETE][406] ([i915#14419]) -> [PASS][407]
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-dg2-4/igt@kms_pm_rpm@system-suspend-idle.html
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-8/igt@kms_pm_rpm@system-suspend-idle.html

  
#### Warnings ####

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-rkl:          [SKIP][408] ([i915#14544] / [i915#9323]) -> [SKIP][409] ([i915#9323])
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-6/igt@gem_ccs@block-multicopy-compressed.html
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-5/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_eio@kms:
    - shard-tglu:         [ABORT][410] ([i915#13363]) -> [DMESG-WARN][411] ([i915#13363])
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-tglu-5/igt@gem_eio@kms.html
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-4/igt@gem_eio@kms.html

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-rkl:          [SKIP][412] ([i915#14544] / [i915#4525]) -> [SKIP][413] ([i915#4525])
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-6/igt@gem_exec_balancer@parallel-ordering.html
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-4/igt@gem_exec_balancer@parallel-ordering.html

  * igt@gem_exec_reloc@basic-gtt-cpu-active:
    - shard-rkl:          [SKIP][414] ([i915#14544] / [i915#3281]) -> [SKIP][415] ([i915#3281]) +2 other tests skip
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-cpu-active.html
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-cpu-active.html

  * igt@gem_lmem_swapping@parallel-random:
    - shard-rkl:          [SKIP][416] ([i915#14544] / [i915#4613]) -> [SKIP][417] ([i915#4613]) +1 other test skip
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-6/igt@gem_lmem_swapping@parallel-random.html
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-5/igt@gem_lmem_swapping@parallel-random.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-rkl:          [SKIP][418] ([i915#14544] / [i915#3282]) -> [SKIP][419] ([i915#3282])
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-6/igt@gem_pwrite@basic-exhaustion.html
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-5/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_set_tiling_vs_blt@tiled-to-tiled:
    - shard-rkl:          [SKIP][420] ([i915#14544] / [i915#8411]) -> [SKIP][421] ([i915#8411])
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-6/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-5/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-rkl:          [SKIP][422] ([i915#3297]) -> [SKIP][423] ([i915#14544] / [i915#3297]) +1 other test skip
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-2/igt@gem_userptr_blits@create-destroy-unsync.html
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-6/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
    - shard-rkl:          [SKIP][424] ([i915#14544] / [i915#3297]) -> [SKIP][425] ([i915#3297]) +1 other test skip
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-6/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-5/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html

  * igt@gen9_exec_parse@batch-without-end:
    - shard-rkl:          [SKIP][426] ([i915#2527]) -> [SKIP][427] ([i915#14544] / [i915#2527])
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-2/igt@gen9_exec_parse@batch-without-end.html
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-6/igt@gen9_exec_parse@batch-without-end.html

  * igt@gen9_exec_parse@bb-start-param:
    - shard-rkl:          [SKIP][428] ([i915#14544] / [i915#2527]) -> [SKIP][429] ([i915#2527])
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-6/igt@gen9_exec_parse@bb-start-param.html
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-4/igt@gen9_exec_parse@bb-start-param.html

  * igt@i915_module_load@resize-bar:
    - shard-rkl:          [SKIP][430] ([i915#14544] / [i915#6412]) -> [SKIP][431] ([i915#6412])
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-6/igt@i915_module_load@resize-bar.html
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-4/igt@i915_module_load@resize-bar.html

  * igt@i915_pm_rpm@system-suspend:
    - shard-rkl:          [ABORT][432] ([i915#15060]) -> [INCOMPLETE][433] ([i915#13356])
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-1/igt@i915_pm_rpm@system-suspend.html
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-7/igt@i915_pm_rpm@system-suspend.html

  * igt@i915_query@hwconfig_table:
    - shard-rkl:          [SKIP][434] ([i915#14544] / [i915#6245]) -> [SKIP][435] ([i915#6245])
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-6/igt@i915_query@hwconfig_table.html
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-4/igt@i915_query@hwconfig_table.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-rkl:          [SKIP][436] ([i915#14544] / [i915#5286]) -> [SKIP][437] ([i915#5286]) +1 other test skip
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-6/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-5/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-rkl:          [SKIP][438] ([i915#5286]) -> [SKIP][439] ([i915#14544] / [i915#5286])
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-2:
    - shard-rkl:          [SKIP][440] ([i915#6095]) -> [SKIP][441] ([i915#14544] / [i915#6095]) +3 other tests skip
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-7/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-2.html
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-6/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2:
    - shard-rkl:          [SKIP][442] ([i915#14098] / [i915#6095]) -> [SKIP][443] ([i915#14098] / [i915#14544] / [i915#6095]) +3 other tests skip
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-7/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2.html
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-6/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-rkl:          [SKIP][444] ([i915#12313] / [i915#14544]) -> [SKIP][445] ([i915#12313])
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:
    - shard-rkl:          [SKIP][446] ([i915#14098] / [i915#14544] / [i915#6095]) -> [SKIP][447] ([i915#14098] / [i915#6095]) +2 other tests skip
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_chamelium_edid@vga-edid-read:
    - shard-rkl:          [SKIP][448] ([i915#11151] / [i915#14544] / [i915#7828]) -> [SKIP][449] ([i915#11151] / [i915#7828]) +3 other tests skip
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-6/igt@kms_chamelium_edid@vga-edid-read.html
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-5/igt@kms_chamelium_edid@vga-edid-read.html

  * igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:
    - shard-rkl:          [SKIP][450] ([i915#11151] / [i915#7828]) -> [SKIP][451] ([i915#11151] / [i915#14544] / [i915#7828]) +1 other test skip
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-7/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-6/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html

  * igt@kms_content_protection@content-type-change:
    - shard-rkl:          [SKIP][452] ([i915#14544] / [i915#15865]) -> [SKIP][453] ([i915#15865]) +1 other test skip
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-6/igt@kms_content_protection@content-type-change.html
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-5/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-type-0-suspend-resume:
    - shard-rkl:          [SKIP][454] ([i915#15330]) -> [SKIP][455] ([i915#14544] / [i915#15330])
   [454]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-7/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html
   [455]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-6/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-rkl:          [SKIP][456] ([i915#13049] / [i915#14544]) -> [SKIP][457] ([i915#13049])
   [456]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [457]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-5/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback:
    - shard-rkl:          [SKIP][458] ([i915#14544] / [i915#16867]) -> [SKIP][459] ([i915#16867])
   [458]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-6/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html
   [459]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-5/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html

  * igt@kms_dsc@dsc-with-formats-bigjoiner:
    - shard-rkl:          [SKIP][460] ([i915#14544] / [i915#16361]) -> [SKIP][461] ([i915#16361]) +1 other test skip
   [460]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-6/igt@kms_dsc@dsc-with-formats-bigjoiner.html
   [461]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-5/igt@kms_dsc@dsc-with-formats-bigjoiner.html

  * igt@kms_feature_discovery@vrr:
    - shard-rkl:          [SKIP][462] ([i915#14544] / [i915#16600]) -> [SKIP][463] ([i915#16600])
   [462]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-6/igt@kms_feature_discovery@vrr.html
   [463]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-5/igt@kms_feature_discovery@vrr.html

  * igt@kms_flip@2x-flip-vs-fences-interruptible:
    - shard-rkl:          [SKIP][464] ([i915#14544] / [i915#9934]) -> [SKIP][465] ([i915#9934]) +1 other test skip
   [464]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-6/igt@kms_flip@2x-flip-vs-fences-interruptible.html
   [465]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-5/igt@kms_flip@2x-flip-vs-fences-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:
    - shard-rkl:          [SKIP][466] ([i915#15643]) -> [SKIP][467] ([i915#14544] / [i915#15643])
   [466]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html
   [467]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile:
    - shard-rkl:          [SKIP][468] ([i915#14544] / [i915#15643]) -> [SKIP][469] ([i915#15643]) +1 other test skip
   [468]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-6/igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile.html
   [469]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-5/igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-dg1:          [SKIP][470] ([i915#15990] / [i915#8708]) -> [SKIP][471] ([i915#15990] / [i915#4423] / [i915#8708])
   [470]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [471]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-17/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - shard-rkl:          [SKIP][472] ([i915#14544] / [i915#1825]) -> [SKIP][473] ([i915#1825])
   [472]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html
   [473]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-shrfb-pgflip-blt:
    - shard-rkl:          [SKIP][474] ([i915#14544]) -> [SKIP][475] +28 other tests skip
   [474]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-shrfb-pgflip-blt.html
   [475]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-5/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-draw-blt:
    - shard-rkl:          [SKIP][476] -> [SKIP][477] ([i915#14544]) +12 other tests skip
   [476]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-7/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-draw-blt.html
   [477]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-rkl:          [SKIP][478] ([i915#1825]) -> [SKIP][479] ([i915#14544] / [i915#1825])
   [478]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [479]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-shrfb-draw-render:
    - shard-dg1:          [SKIP][480] ([i915#15102]) -> [SKIP][481] ([i915#15102] / [i915#4423]) +1 other test skip
   [480]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-shrfb-draw-render.html
   [481]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-stridechange:
    - shard-rkl:          [SKIP][482] ([i915#15102]) -> [SKIP][483] ([i915#14544] / [i915#15102]) +2 other tests skip
   [482]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-stridechange.html
   [483]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-stridechange.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:
    - shard-rkl:          [SKIP][484] ([i915#14544] / [i915#15102]) -> [SKIP][485] ([i915#15102]) +11 other tests skip
   [484]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html
   [485]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-rkl:          [SKIP][486] ([i915#14544] / [i915#6301]) -> [SKIP][487] ([i915#6301])
   [486]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-6/igt@kms_panel_fitting@atomic-fastset.html
   [487]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-5/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping:
    - shard-rkl:          [SKIP][488] ([i915#15709]) -> [SKIP][489] ([i915#14544] / [i915#15709])
   [488]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-7/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html
   [489]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-6/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier:
    - shard-rkl:          [SKIP][490] ([i915#14544] / [i915#15709]) -> [SKIP][491] ([i915#15709]) +1 other test skip
   [490]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-6/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier.html
   [491]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-5/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-rkl:          [SKIP][492] ([i915#12343] / [i915#14544] / [i915#5354]) -> [SKIP][493] ([i915#12343] / [i915#5354])
   [492]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-6/igt@kms_pm_backlight@basic-brightness.html
   [493]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-5/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_dc@dc5-pageflip-negative:
    - shard-dg1:          [SKIP][494] ([i915#9685]) -> [SKIP][495] ([i915#4423] / [i915#9685])
   [494]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-dg1-18/igt@kms_pm_dc@dc5-pageflip-negative.html
   [495]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-17/igt@kms_pm_dc@dc5-pageflip-negative.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-rkl:          [SKIP][496] ([i915#3828]) -> [SKIP][497] ([i915#14544] / [i915#3828])
   [496]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-7/igt@kms_pm_dc@dc5-retention-flops.html
   [497]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-6/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-rkl:          [SKIP][498] ([i915#9340]) -> [SKIP][499] ([i915#3828])
   [498]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-3/igt@kms_pm_lpsp@kms-lpsp.html
   [499]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-5/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-rkl:          [SKIP][500] ([i915#14544] / [i915#15073]) -> [SKIP][501] ([i915#15073])
   [500]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-6/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [501]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-4/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-rkl:          [SKIP][502] ([i915#14544] / [i915#6524]) -> [SKIP][503] ([i915#6524])
   [502]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-6/igt@kms_prime@basic-modeset-hybrid.html
   [503]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-5/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-rkl:          [SKIP][504] ([i915#11520] / [i915#14544]) -> [SKIP][505] ([i915#11520]) +1 other test skip
   [504]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html
   [505]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-5/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr@pr-sprite-mmap-gtt:
    - shard-rkl:          [SKIP][506] ([i915#1072] / [i915#9732]) -> [SKIP][507] ([i915#1072] / [i915#14544] / [i915#9732]) +3 other tests skip
   [506]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-7/igt@kms_psr@pr-sprite-mmap-gtt.html
   [507]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-6/igt@kms_psr@pr-sprite-mmap-gtt.html

  * igt@kms_psr@psr2-cursor-mmap-gtt:
    - shard-rkl:          [SKIP][508] ([i915#1072] / [i915#14544] / [i915#9732]) -> [SKIP][509] ([i915#1072] / [i915#9732]) +5 other tests skip
   [508]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-6/igt@kms_psr@psr2-cursor-mmap-gtt.html
   [509]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-5/igt@kms_psr@psr2-cursor-mmap-gtt.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-rkl:          [SKIP][510] ([i915#14544] / [i915#3555]) -> [SKIP][511] ([i915#3555])
   [510]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-6/igt@kms_setmode@clone-exclusive-crtc.html
   [511]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-5/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_vrr@flip-suspend:
    - shard-rkl:          [SKIP][512] ([i915#14544] / [i915#15243] / [i915#3555]) -> [SKIP][513] ([i915#15243] / [i915#3555])
   [512]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-6/igt@kms_vrr@flip-suspend.html
   [513]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-5/igt@kms_vrr@flip-suspend.html

  * igt@kms_vrr@negative-basic:
    - shard-rkl:          [SKIP][514] ([i915#3555] / [i915#9906]) -> [SKIP][515] ([i915#14544] / [i915#3555] / [i915#9906])
   [514]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-7/igt@kms_vrr@negative-basic.html
   [515]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-6/igt@kms_vrr@negative-basic.html

  * igt@perf_pmu@rc6-suspend:
    - shard-glk:          [INCOMPLETE][516] ([i915#13356] / [i915#16236]) -> [INCOMPLETE][517] ([i915#13356] / [i915#14242] / [i915#16236])
   [516]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-glk8/igt@perf_pmu@rc6-suspend.html
   [517]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-glk9/igt@perf_pmu@rc6-suspend.html

  
  [i915#10056]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10056
  [i915#10216]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10216
  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#1099]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099
  [i915#11078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078
  [i915#11151]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
  [i915#11814]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11814
  [i915#12178]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12178
  [i915#12193]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12193
  [i915#12276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276
  [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
  [i915#12343]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343
  [i915#12655]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655
  [i915#12713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713
  [i915#12745]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745
  [i915#12805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805
  [i915#13008]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13008
  [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
  [i915#13356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356
  [i915#13363]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13363
  [i915#13390]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13390
  [i915#13398]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13398
  [i915#13520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13520
  [i915#13566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566
  [i915#13688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13688
  [i915#13705]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13705
  [i915#13707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707
  [i915#13748]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748
  [i915#13781]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13781
  [i915#13809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13809
  [i915#13820]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13820
  [i915#13958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958
  [i915#14073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073
  [i915#14098]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098
  [i915#14118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14118
  [i915#14121]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14121
  [i915#14123]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14123
  [i915#14242]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14242
  [i915#14259]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259
  [i915#14419]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14419
  [i915#14498]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14498
  [i915#14544]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544
  [i915#14702]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14702
  [i915#14712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712
  [i915#15060]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15060
  [i915#15073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073
  [i915#15102]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102
  [i915#15104]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104
  [i915#15132]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132
  [i915#15243]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243
  [i915#15329]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329
  [i915#15330]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330
  [i915#15342]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15342
  [i915#15403]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15403
  [i915#15459]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459
  [i915#15460]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460
  [i915#15481]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15481
  [i915#15500]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15500
  [i915#15638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15638
  [i915#15643]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643
  [i915#15678]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15678
  [i915#15709]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709
  [i915#15722]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15722
  [i915#15726]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15726
  [i915#15815]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15815
  [i915#15865]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865
  [i915#15948]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948
  [i915#15949]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15949
  [i915#15989]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989
  [i915#15990]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990
  [i915#15991]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991
  [i915#15999]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15999
  [i915#16080]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16080
  [i915#16081]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081
  [i915#16109]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16109
  [i915#16112]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16112
  [i915#16119]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16119
  [i915#16166]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16166
  [i915#16182]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16182
  [i915#16184]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16184
  [i915#16193]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16193
  [i915#16236]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16236
  [i915#16276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16276
  [i915#16348]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16348
  [i915#16361]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361
  [i915#16386]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16386
  [i915#16420]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16420
  [i915#16464]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16464
  [i915#16471]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471
  [i915#16479]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16479
  [i915#16490]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16490
  [i915#16593]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16593
  [i915#16599]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16599
  [i915#16600]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16600
  [i915#16644]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644
  [i915#16680]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16680
  [i915#16696]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16696
  [i915#16772]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16772
  [i915#16867]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16867
  [i915#16904]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16904
  [i915#16914]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16914
  [i915#16990]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16990
  [i915#16996]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16996
  [i915#17099]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17099
  [i915#17102]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17102
  [i915#17139]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17139
  [i915#17158]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17158
  [i915#17183]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17183
  [i915#17188]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17188
  [i915#17276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17276
  [i915#17285]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17285
  [i915#17286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17286
  [i915#17289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17289
  [i915#17290]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17290
  [i915#17291]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17291
  [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
  [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
  [i915#2433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2433
  [i915#2434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434
  [i915#2436]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2436
  [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
  [i915#2658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658
  [i915#280]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280
  [i915#284]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284
  [i915#2856]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
  [i915#3116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
  [i915#3297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299
  [i915#3323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323
  [i915#3539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#3711]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3711
  [i915#3742]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742
  [i915#3828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828
  [i915#4036]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4036
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213
  [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
  [i915#4349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349
  [i915#4423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423
  [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
  [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
  [i915#4565]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4565
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#4771]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4771
  [i915#4812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812
  [i915#4817]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817
  [i915#4839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839
  [i915#4852]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852
  [i915#4860]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860
  [i915#4880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880
  [i915#4884]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4884
  [i915#4958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4958
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#5439]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439
  [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
  [i915#6113]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113
  [i915#6230]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6230
  [i915#6245]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245
  [i915#6301]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301
  [i915#6334]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334
  [i915#6335]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335
  [i915#6412]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6412
  [i915#6524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
  [i915#658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658
  [i915#6953]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953
  [i915#7582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582
  [i915#7697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697
  [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
  [i915#7862]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7862
  [i915#7984]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984
  [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
  [i915#8289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8289
  [i915#8381]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381
  [i915#8399]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399
  [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
  [i915#8428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
  [i915#8516]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516
  [i915#8555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555
  [i915#8562]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562
  [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
  [i915#8810]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8810
  [i915#8813]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813
  [i915#8814]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814
  [i915#9067]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067
  [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
  [i915#9340]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340
  [i915#9683]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683
  [i915#9685]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685
  [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
  [i915#9723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9766]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766
  [i915#9809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809
  [i915#9812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812
  [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
  [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934


Build changes
-------------

  * Linux: CI_DRM_19291 -> Patchwork_175645v1

  CI-20190529: 20190529
  CI_DRM_19291: daeb062fc40f727fafefed080c6d12a5ad1d0d12 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_9131: 5e43e9df3a1581074f0de2bbeddd939ebd950b93 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  Patchwork_175645v1: daeb062fc40f727fafefed080c6d12a5ad1d0d12 @ git://anongit.freedesktop.org/gfx-ci/linux
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/index.html

--===============1614178911960783170==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <title>Project List - Patchwork</title>
  <style id="css-table-select" type="text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>drm/i915/scaler: Prune YUV420 modes against the max source width</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/175645/">https://patchwork.freedesktop.org/series/175645/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_19291_full -&gt; Patchwork_175645v1_full</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with Patchwork_175645v1_full need to be verified<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in Patchwork_175645v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (10 -&gt; 10)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in Patchwork_175645v1_full:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@kms_hdmi_audio_bw@audio-bw-hblank160:<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-glk3/igt@kms_hdmi_audio_bw@audio-bw-hblank160.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17102">i915#17102</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-glk8/igt@kms_hdmi_audio_bw@audio-bw-hblank160.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_19291_full and Patchwork_175645v1_full:</p>
<h3>New IGT tests (3)</h3>
<ul>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x256@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-x@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-x@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.83] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_175645v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-reloc-keep-cache:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-1/igt@api_intel_bb@blit-reloc-keep-cache.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@crc32:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-8/igt@api_intel_bb@crc32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6230">i915#6230</a>)</li>
</ul>
</li>
<li>
<p>igt@device_reset@cold-reset-bound:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-2/igt@device_reset@cold-reset-bound.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078">i915#11078</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_basic@multigpu-create-close:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-4/igt@gem_basic@multigpu-create-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697">i915#7697</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-1/igt@gem_basic@multigpu-create-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-copy-compressed:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-8/igt@gem_ccs@block-copy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-inplace:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-19/igt@gem_ccs@block-multicopy-inplace.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@large-ctrl-surf-copy:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-10/igt@gem_ccs@large-ctrl-surf-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13008">i915#13008</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-dg2-6/igt@gem_ccs@suspend-resume.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-7/igt@gem_ccs@suspend-resume.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16348">i915#16348</a>) +1 other test incomplete</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-10/igt@gem_ccs@suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-process:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-4/igt@gem_close_race@multigpu-basic-process.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-sanity-check:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-1/igt@gem_create@create-ext-cpu-access-sanity-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335">i915#6335</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-set-pat:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-2/igt@gem_create@create-ext-set-pat.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562">i915#8562</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@hang:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-mtlp-2/igt@gem_ctx_persistence@hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555">i915#8555</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-close:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-16/igt@gem_ctx_persistence@heartbeat-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555">i915#8555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@hostile:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-snb7/igt@gem_ctx_persistence@hostile.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099">i915#1099</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-args:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-2/igt@gem_ctx_sseu@invalid-args.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-sseu:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-8/igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@mmap-args:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-16/igt@gem_ctx_sseu@mmap-args.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-dual:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-16/igt@gem_exec_balancer@bonded-dual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4771">i915#4771</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@invalid-bonds:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-15/igt@gem_exec_balancer@invalid-bonds.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4036">i915#4036</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-5/igt@gem_exec_balancer@parallel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-1/igt@gem_exec_balancer@parallel-ordering.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible@smem0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-8/igt@gem_exec_capture@capture-invisible@smem0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334">i915#6334</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture@vecs0-lmem0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-15/igt@gem_exec_capture@capture@vecs0-lmem0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16904">i915#16904</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@submit3:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-mtlp-2/igt@gem_exec_fence@submit3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@syncobj-backward-timeline-chain-engines:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-snb1/igt@gem_exec_fence@syncobj-backward-timeline-chain-engines.html">SKIP</a> +196 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-cmd:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-mtlp-2/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3711">i915#3711</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-prw-default:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-19/igt@gem_exec_flush@basic-uc-prw-default.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539">i915#3539</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-prw-default:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-15/igt@gem_exec_flush@basic-wb-prw-default.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852">i915#4852</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-4/igt@gem_exec_reloc@basic-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-cpu:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-mtlp-2/igt@gem_exec_reloc@basic-wc-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-cpu:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-6/igt@gem_exec_reloc@basic-write-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-cpu-active:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-15/igt@gem_exec_reloc@basic-write-cpu-active.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@semaphore-power:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-15/igt@gem_exec_schedule@semaphore-power.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-8/igt@gem_exec_suspend@basic-s0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-7/igt@gem_exec_suspend@basic-s0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-14/igt@gem_fenced_exec_thrash@no-spare-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860">i915#4860</a>) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-mtlp-2/igt@gem_fenced_exec_thrash@no-spare-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860">i915#4860</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_gtt_cpu_tlb:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-16/igt@gem_gtt_cpu_tlb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_evict@dontneed-evict-race:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-1/igt@gem_lmem_evict@dontneed-evict-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582">i915#7582</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-7/igt@gem_lmem_swapping@heavy-verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-4/igt@gem_lmem_swapping@smem-oom.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-ccs:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-1/igt@gem_lmem_swapping@verify-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-15/igt@gem_lmem_swapping@verify-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12193">i915#12193</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-ccs@lmem0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-15/igt@gem_lmem_swapping@verify-ccs@lmem0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4565">i915#4565</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_media_fill@media-fill:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-mtlp-2/igt@gem_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8289">i915#8289</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-19/igt@gem_media_vme.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284">i915#284</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@bad-size:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-8/igt@gem_mmap@bad-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@basic:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-19/igt@gem_mmap@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic-write-read-distinct:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-mtlp-2/igt@gem_mmap_gtt@basic-write-read-distinct.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@fault-concurrent-y:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-1/igt@gem_mmap_gtt@fault-concurrent-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads-uncached:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-2/igt@gem_partial_pwrite_pread@reads-uncached.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@write-uncached:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-1/igt@gem_partial_pwrite_pread@write-uncached.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pread@display:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-16/igt@gem_pread@display.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-snb7/igt@gem_pread@exhaustion.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658">i915#2658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-glk10/igt@gem_pwrite@basic-exhaustion.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14702">i915#14702</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658">i915#2658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-protected-buffer:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-16/igt@gem_pxp@create-protected-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@hw-rejects-pxp-context:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-1/igt@gem_pxp@hw-rejects-pxp-context.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13398">i915#13398</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-execution-after-suspend-resume:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-1/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-y-tiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-1/igt@gem_render_copy@y-tiled-ccs-to-y-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428">i915#8428</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_tiled_blits@basic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-6/igt@gem_render_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@noreloc-s3:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-glk5/igt@gem_softpin@noreloc-s3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-glk8/igt@gem_softpin@noreloc-s3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13809">i915#13809</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16193">i915#16193</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-sync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-1/igt@gem_userptr_blits@coherency-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-10/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323">i915#3323</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-glk5/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323">i915#3323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@forbidden-operations:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-2/igt@gem_userptr_blits@forbidden-operations.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-busy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-14/igt@gem_userptr_blits@map-fixed-invalidate-busy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880">i915#4880</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-mtlp-2/igt@gem_userptr_blits@map-fixed-invalidate-busy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-unsync:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-1/igt@gem_userptr_blits@readonly-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@relocations:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-4/igt@gem_userptr_blits@relocations.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@sd-probe:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-19/igt@gem_userptr_blits@sd-probe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4958">i915#4958</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-after-close:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-4/igt@gem_userptr_blits@unsync-unmap-after-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected-ctx-param:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-mtlp-2/igt@gen9_exec_parse@basic-rejected-ctx-param.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-cmd:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-8/igt@gen9_exec_parse@bb-start-cmd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-param:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-1/igt@gen9_exec_parse@bb-start-param.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@secure-batches:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-8/igt@gen9_exec_parse@secure-batches.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@shadow-peek:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-19/igt@gen9_exec_parse@shadow-peek.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@unaligned-jump:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-4/igt@gen9_exec_parse@unaligned-jump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gpu_buddy@gpu_buddy:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-1/igt@gpu_buddy@gpu_buddy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15678">i915#15678</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-15/igt@gpu_buddy@gpu_buddy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15678">i915#15678</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@all-busy-check-all:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-16/igt@i915_drm_fdinfo@all-busy-check-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14123">i915#14123</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-hang@vcs0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-6/igt@i915_drm_fdinfo@busy-hang@vcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073">i915#14073</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@virtual-busy-hang-all:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-16/igt@i915_drm_fdinfo@virtual-busy-hang-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14118">i915#14118</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-14/igt@i915_module_load@fault-injection.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11814">i915#11814</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15481">i915#15481</a>) +1 other test abort</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-mtlp-2/igt@i915_module_load@fault-injection.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15342">i915#15342</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15481">i915#15481</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@__uc_init:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-mtlp-2/igt@i915_module_load@fault-injection@__uc_init.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15481">i915#15481</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@i915_driver_mmio_probe:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-14/igt@i915_module_load@fault-injection@i915_driver_mmio_probe.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15481">i915#15481</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@intel_connector_register:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-mtlp-2/igt@i915_module_load@fault-injection@intel_connector_register.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15342">i915#15342</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@resize-bar:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-1/igt@i915_module_load@resize-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6412">i915#6412</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-basic-api:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-10/igt@i915_pm_freq_api@freq-basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399">i915#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@media-rc6-accuracy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-6/igt@i915_pm_rc6_residency@media-rc6-accuracy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16080">i915#16080</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16166">i915#16166</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-4/igt@i915_pm_rc6_residency@rc6-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14498">i915#14498</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-1/igt@i915_pm_rc6_residency@rc6-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14498">i915#14498</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-16/igt@i915_pm_rps@thresholds.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_query@hwconfig_table:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-1/igt@i915_query@hwconfig_table.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245">i915#6245</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-known-pci-ids:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-2/igt@i915_query@query-topology-known-pci-ids.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16109">i915#16109</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@forcewake:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-glk4/igt@i915_suspend@forcewake.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16182">i915#16182</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@clobberred-modifier:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-6/igt@kms_addfb_basic@clobberred-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-16/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-8/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-10/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-15/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-1/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-5/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-4/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-14/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-6/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-mtlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-15/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-19/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +197 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-10/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-8/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +69 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-1/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-19/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805">i915#12805</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-glk3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> +121 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-mtlp-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17158">i915#17158</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-8/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-1/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132">i915#15132</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-1/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-2.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132">i915#15132</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-16/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-2/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +39 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-4/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +49 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-mtlp-2/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-6/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-1/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-7/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +61 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-4/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434">i915#10434</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-rejected-max-dotclock:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-16/igt@kms_cdclk@mode-rejected-max-dotclock.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17099">i915#17099</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-4/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742">i915#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-8/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13781">i915#13781</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-mtlp-2/igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16464">i915#16464</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-8/igt@kms_chamelium_color_pipeline@plane-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-10/igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut3d-green-only:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-19/igt@kms_chamelium_color_pipeline@plane-lut3d-green-only.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-suspend:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-6/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-read:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-8/igt@kms_chamelium_edid@hdmi-edid-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-10/igt@kms_chamelium_frames@hdmi-aspect-ratio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-cmp-planar-formats:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-1/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-multiple:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-16/igt@kms_chamelium_frames@hdmi-crc-multiple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-mtlp-2/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-1/igt@kms_color@deep-color.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655">i915#12655</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-ctm3x4-lut1d@pipe-b-plane-4:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-1/igt@kms_color_pipeline@plane-ctm3x4-lut1d@pipe-b-plane-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16990">i915#16990</a>) +15 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-15/igt@kms_color_pipeline@plane-ctm3x4-lut1d@pipe-b-plane-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16990">i915#16990</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-d-plane-3:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-2/igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-d-plane-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16990">i915#16990</a>) +47 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-c-plane-4:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-2/igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-c-plane-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16990">i915#16990</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-8/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-19/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-16/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-hdcp14:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-6/igt@kms_content_protection@dp-mst-type-0-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1-suspend-resume:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-2/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-1/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-15/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0-hdcp14:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-4/igt@kms_content_protection@lic-type-0-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-1/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-8/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x42:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-4/igt@kms_cursor_crc@cursor-onscreen-128x42.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +4 other tests fail</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-1/igt@kms_cursor_crc@cursor-onscreen-128x42.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-2/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-16/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-4/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) +1 other test skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-1/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-2/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-mtlp-2/igt@kms_cursor_crc@cursor-sliding-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814">i915#8814</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-8/igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-dg1-18/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-17/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-mtlp-2/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809">i915#9809</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-dg1-19/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-14/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15999">i915#15999</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-8/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067">i915#9067</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-14/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-mtlp-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16119">i915#16119</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213">i915#4213</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-8/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723">i915#9723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-19/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17289">i915#17289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-1/igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17291">i915#17291</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-15/igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17291">i915#17291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst-direct-train:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-4/igt@kms_dp_link_training@non-uhbr-sst-direct-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17286">i915#17286</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-1/igt@kms_dp_link_training@non-uhbr-sst-direct-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17286">i915#17286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-2/igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17290">i915#17290</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst-direct-train:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-5/igt@kms_dp_link_training@uhbr-mst-direct-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17285">i915#17285</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst-tbtalt-train:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-16/igt@kms_dp_link_training@uhbr-mst-tbtalt-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17285">i915#17285</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-10/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748">i915#13748</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-6/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707">i915#13707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic-ultrajoiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-10/igt@kms_dsc@dsc-basic-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-bigjoiner:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-19/igt@kms_dsc@dsc-fractional-bpp-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-1/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-1/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-bigjoiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-2/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-8/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16680">i915#16680</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-4/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16680">i915#16680</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-8/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081">i915#16081</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-6/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081">i915#16081</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-16/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16599">i915#16599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dsc:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-1/igt@kms_feature_discovery@dsc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16600">i915#16600</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-15/igt@kms_feature_discovery@dsc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16600">i915#16600</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-8/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-4/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-19/igt@kms_flip@2x-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-2/igt@kms_flip@2x-blocking-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-mtlp-2/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-10/igt@kms_flip@2x-flip-vs-dpms-on-nop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-glk10/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17183">i915#17183</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-glk10/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17183">i915#17183</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-1/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-1/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-8/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-fences:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-6/igt@kms_flip@flip-vs-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381">i915#8381</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-glk6/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17183">i915#17183</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-glk3/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17183">i915#17183</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113">i915#6113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-4/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-3/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16276">i915#16276</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113">i915#6113</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-glk6/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17183">i915#17183</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-1/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-16/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-10/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8810">i915#8810</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813">i915#8813</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-16/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html">SKIP</a> +60 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-14/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> +68 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-glk11/igt@kms_frontbuffer_tracking@fbc-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10056">i915#10056</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16593">i915#16593</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-4/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-16/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-6/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-indfb-scaledprimary:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-1/igt@kms_frontbuffer_tracking@fbchdr-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-6/igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-2/igt@kms_frontbuffer_tracking@fbchdr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-tiling-4:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-1/igt@kms_frontbuffer_tracking@fbchdr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439">i915#5439</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-15/igt@kms_frontbuffer_tracking@fbchdr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-glk10/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> +114 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-15/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-4/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-suspend:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-6/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-draw-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-5/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-glk8/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-draw-mmap-cpu.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-glk3/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a> +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-indfb-scaledprimary:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-19/igt@kms_frontbuffer_tracking@hdr-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-4/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766">i915#9766</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-1/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766">i915#9766</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-16/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +36 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-render:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-10/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +54 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> +141 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-mtlp-2/igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-shrfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-rte:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-1/igt@kms_frontbuffer_tracking@psrhdr-2p-rte.html">SKIP</a> +47 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-5/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17188">i915#17188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-1/igt@kms_hdr@bpc-switch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-2/igt@kms_hdr@bpc-switch-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-10/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#12713</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-8/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644">i915#16644</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-mtlp-2/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#12713</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16490">i915#16490</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-6/igt@kms_hdr@static-toggle-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-5/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644">i915#16644</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-16/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-4/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460">i915#15460</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-1/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460">i915#15460</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-2/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459">i915#15459</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-4/igt@kms_joiner@basic-max-non-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13688">i915#13688</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-16/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459">i915#15459</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-10/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15638">i915#15638</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15722">i915#15722</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15815">i915#15815</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-10/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301">i915#6301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-4tiled:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-2/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712">i915#14712</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-untiled:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-4/igt@kms_pipe_stress@stress-xrgb8888-untiled.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16696">i915#16696</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16772">i915#16772</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-6/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13705">i915#13705</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier@pipe-a-plane-5:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-1/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier@pipe-a-plane-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16386">i915#16386</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-1/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-19/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-8/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-1/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-10/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-7:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-8/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16386">i915#16386</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-14/igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16112">i915#16112</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-mtlp-2/igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16112">i915#16112</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-glk11/igt@kms_plane_alpha_blend@alpha-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12178">i915#12178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-glk11/igt@kms_plane_alpha_blend@alpha-basic@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7862">i915#7862</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-8/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-4/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-8/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259">i915#14259</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-1/igt@kms_plane_scaling@intel-max-src-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-7/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-c:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-8/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-14/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-10/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812">i915#9812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-6/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-4/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +1 other test skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-1/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812">i915#9812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-2/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948">i915#15948</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr-suspend-resume:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-1/igt@kms_pm_dc@dc5-psr-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16914">i915#16914</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-15/igt@kms_pm_dc@dc5-psr-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16914">i915#16914</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-8/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16479">i915#16479</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-10/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948">i915#15948</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-16/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340">i915#9340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-dg1-14/igt@kms_pm_rpm@dpms-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-12/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-6/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-4/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-3/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-2/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@package-g7:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-8/igt@kms_pm_rpm@package-g7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15403">i915#15403</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@d3hot:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-14/igt@kms_prime@d3hot.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-mtlp-2/igt@kms_prime@d3hot.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-2/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-1/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-glk10/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-8/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-glk5/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-1/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +3 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-15/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-glk11/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-snb7/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-10/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-dpms@edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-mtlp-2/igt@kms_psr@fbc-psr-dpms@edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688">i915#9688</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-render:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-glk11/igt@kms_psr@fbc-psr-primary-render.html">SKIP</a> +106 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-8/igt@kms_psr@fbc-psr2-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-plane-onoff:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-1/igt@kms_psr@pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-onoff:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-14/igt@kms_psr@psr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-4/igt@kms_psr@psr2-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-8/igt@kms_psr@psr2-primary-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-14/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15949">i915#15949</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15949">i915#15949</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-4/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15949">i915#15949</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@exhaust-fences:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-19/igt@kms_rotation_crc@exhaust-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4884">i915#4884</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-glk11/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15500">i915#15500</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16184">i915#16184</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-10/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-15/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-16/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-glk11/igt@kms_vblank@ts-continuation-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276">i915#12276</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-7/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-6/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276">i915#12276</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-1/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-15/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-10/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@gen8-unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-8/igt@perf@gen8-unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2436">i915#2436</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@mi-rpc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-8/igt@perf@mi-rpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434">i915#2434</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-2/igt@perf@unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2433">i915#2433</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-mtlp-2/igt@perf_pmu@busy-double-start.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-idle-check-all@ccs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-mtlp-5/igt@perf_pmu@busy-idle-check-all@ccs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-mtlp-7/igt@perf_pmu@busy-idle-check-all@ccs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-all-gts:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-8/igt@perf_pmu@rc6-all-gts.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516">i915#8516</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-2/igt@perf_pmu@rc6-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-6/igt@perf_pmu@rc6-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13520">i915#13520</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_mmap@test_aperture_limit:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-1/igt@prime_mmap@test_aperture_limit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14121">i915#14121</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_udl@share-import:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-4/igt@prime_udl@share-import.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16420">i915#16420</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-1/igt@prime_udl@share-import.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16420">i915#16420</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_udl@share-import-addfb:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-10/igt@prime_udl@share-import-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16420">i915#16420</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-14/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-mtlp-2/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10216">i915#10216</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-6/igt@gem_eio@in-flight-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13390">i915#13390</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-4/igt@gem_eio@in-flight-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-dg2-7/igt@gem_exec_suspend@basic-s0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-6/igt@gem_exec_suspend@basic-s0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-context:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-glk8/igt@gem_workarounds@suspend-resume-context.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-glk3/igt@gem_workarounds@suspend-resume-context.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-fd:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-3/igt@gem_workarounds@suspend-resume-fd.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-2/igt@gem_workarounds@suspend-resume-fd.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-no-display:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-tglu-3/igt@i915_module_load@reload-no-display.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16996">i915#16996</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-5/igt@i915_module_load@reload-no-display.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-suspend@gt0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-dg2-6/igt@i915_pm_freq_api@freq-suspend@gt0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13820">i915#13820</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-1/igt@i915_pm_freq_api@freq-suspend@gt0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_power@sanity:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-mtlp-8/igt@i915_power@sanity.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984">i915#7984</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-mtlp-6/igt@i915_power@sanity.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_3d@basic:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-mtlp-1/igt@kms_3d@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15726">i915#15726</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-mtlp-5/igt@kms_3d@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-tglu-8/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-8/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-8/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17139">i915#17139</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-1/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-3/igt@kms_frontbuffer_tracking@fbc-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10056">i915#10056</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-2/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-move.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-mmap-cpu:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-glk3/igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-mmap-cpu.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-glk8/igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-mmap-cpu.html">PASS</a> +15 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-suspend:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-mtlp-5/igt@kms_frontbuffer_tracking@psr-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17276">i915#17276</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-mtlp-7/igt@kms_frontbuffer_tracking@psr-suspend.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-2/igt@kms_hdr@static-swap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644">i915#16644</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-6/igt@kms_hdr@static-swap.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-dg1-19/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-14/igt@kms_pm_rpm@modeset-lpsp.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-2/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-6/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-idle:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-dg2-4/igt@kms_pm_rpm@system-suspend-idle.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14419">i915#14419</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg2-8/igt@kms_pm_rpm@system-suspend-idle.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_ccs@block-multicopy-compressed:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-6/igt@gem_ccs@block-multicopy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-5/igt@gem_ccs@block-multicopy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-tglu-5/igt@gem_eio@kms.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13363">i915#13363</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-tglu-4/igt@gem_eio@kms.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13363">i915#13363</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-6/igt@gem_exec_balancer@parallel-ordering.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-4/igt@gem_exec_balancer@parallel-ordering.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-cpu-active:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-cpu-active.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-cpu-active.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-6/igt@gem_lmem_swapping@parallel-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-5/igt@gem_lmem_swapping@parallel-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-6/igt@gem_pwrite@basic-exhaustion.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-5/igt@gem_pwrite@basic-exhaustion.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@tiled-to-tiled:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-6/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i915#8411</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-5/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@create-destroy-unsync:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-2/igt@gem_userptr_blits@create-destroy-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-6/igt@gem_userptr_blits@create-destroy-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@invalid-mmap-offset-unsync:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-6/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-5/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-without-end:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-2/igt@gen9_exec_parse@batch-without-end.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-6/igt@gen9_exec_parse@batch-without-end.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-param:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-6/igt@gen9_exec_parse@bb-start-param.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-4/igt@gen9_exec_parse@bb-start-param.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@resize-bar:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-6/igt@i915_module_load@resize-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6412">i915#6412</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-4/igt@i915_module_load@resize-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6412">i915#6412</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-1/igt@i915_pm_rpm@system-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15060">i915#15060</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-7/igt@i915_pm_rpm@system-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@hwconfig_table:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-6/igt@i915_query@hwconfig_table.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245">i915#6245</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-4/igt@i915_query@hwconfig_table.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245">i915#6245</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-6/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-5/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-7/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-6/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-7/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-6/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@vga-edid-read:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-6/igt@kms_chamelium_edid@vga-edid-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-5/igt@kms_chamelium_edid@vga-edid-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-7/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-6/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-6/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-5/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-suspend-resume:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-7/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-6/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-5/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-6/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16867">i915#16867</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-5/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16867">i915#16867</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats-bigjoiner:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-6/igt@kms_dsc@dsc-with-formats-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-5/igt@kms_dsc@dsc-with-formats-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@vrr:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-6/igt@kms_feature_discovery@vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16600">i915#16600</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-5/igt@kms_feature_discovery@vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16600">i915#16600</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences-interruptible:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-6/igt@kms_flip@2x-flip-vs-fences-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-5/igt@kms_flip@2x-flip-vs-fences-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-6/igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-5/igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-17/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-5/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-7/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-stridechange:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-stridechange.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-stridechange.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-6/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301">i915#6301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-5/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301">i915#6301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-7/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-6/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-6/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-5/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-6/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-5/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-pageflip-negative:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-dg1-18/igt@kms_pm_dc@dc5-pageflip-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i915#9685</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-dg1-17/igt@kms_pm_dc@dc5-pageflip-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i915#9685</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-7/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-6/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-3/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340">i915#9340</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-5/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-6/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-4/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-modeset-hybrid:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-6/igt@kms_prime@basic-modeset-hybrid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-5/igt@kms_prime@basic-modeset-hybrid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-5/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-7/igt@kms_psr@pr-sprite-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-6/igt@kms_psr@pr-sprite-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-6/igt@kms_psr@psr2-cursor-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-5/igt@kms_psr@psr2-cursor-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-6/igt@kms_setmode@clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-5/igt@kms_setmode@clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-6/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243">i915#15243</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-5/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243">i915#15243</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-rkl-7/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-rkl-6/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-suspend:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-glk8/igt@perf_pmu@rc6-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16236">i915#16236</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_175645v1/shard-glk9/igt@perf_pmu@rc6-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14242">i915#14242</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16236">i915#16236</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_19291 -&gt; Patchwork_175645v1</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19291: daeb062fc40f727fafefed080c6d12a5ad1d0d12 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_9131: 5e43e9df3a1581074f0de2bbeddd939ebd950b93 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  Patchwork_175645v1: daeb062fc40f727fafefed080c6d12a5ad1d0d12 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============1614178911960783170==--
