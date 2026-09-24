Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50EC5C98314
	for <intel-gfx@archiver.kernel.org>; Thu, 24 Sep 2026 13:03:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A760A10F54A;
	Thu, 24 Sep 2026 13:03:39 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED23510E9C1;
 Thu, 24 Sep 2026 13:03:37 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3926469788211192505=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EFull=3A_success_for_drm/i915/gt=3A_Fix_ce_us?=
 =?utf-8?q?e-after-free_in_signal=5Firq=5Fwork=28=29_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Wentao Liang" <vulab@iscas.ac.cn>
Cc: intel-gfx@lists.freedesktop.org
Date: Thu, 24 Sep 2026 13:03:37 -0000
Message-ID: <179025501794.202880.12539403696658434647@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260916172312.2087555-1-vulab@iscas.ac.cn>
In-Reply-To: <20260916172312.2087555-1-vulab@iscas.ac.cn>
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

--===============3926469788211192505==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/gt: Fix ce use-after-free in signal_irq_work() (rev2)
URL   : https://patchwork.freedesktop.org/series/174416/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_19208_full -> Patchwork_174416v2_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (10 -> 10)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in Patchwork_174416v2_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - shard-mtlp:         NOTRUN -> [SKIP][1] ([i915#8411])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-mtlp-3/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@api_intel_bb@object-reloc-purge-cache:
    - shard-dg2:          NOTRUN -> [SKIP][2] ([i915#8411])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg2-4/igt@api_intel_bb@object-reloc-purge-cache.html

  * igt@device_reset@cold-reset-bound:
    - shard-tglu-1:       NOTRUN -> [SKIP][3] ([i915#11078])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-tglu-1/igt@device_reset@cold-reset-bound.html
    - shard-mtlp:         NOTRUN -> [SKIP][4] ([i915#11078])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-mtlp-7/igt@device_reset@cold-reset-bound.html

  * igt@gem_basic@multigpu-create-close:
    - shard-rkl:          NOTRUN -> [SKIP][5] ([i915#7697]) +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-8/igt@gem_basic@multigpu-create-close.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-tglu-1:       NOTRUN -> [SKIP][6] ([i915#3555] / [i915#9323])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-tglu-1/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ccs@ctrl-surf-copy-new-ctx:
    - shard-rkl:          NOTRUN -> [SKIP][7] ([i915#9323])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-5/igt@gem_ccs@ctrl-surf-copy-new-ctx.html

  * igt@gem_ccs@large-ctrl-surf-copy:
    - shard-rkl:          NOTRUN -> [SKIP][8] ([i915#13008])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-5/igt@gem_ccs@large-ctrl-surf-copy.html

  * igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0:
    - shard-dg2:          [PASS][9] -> [INCOMPLETE][10] ([i915#13356] / [i915#16348])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-dg2-7/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg2-3/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-dg2:          NOTRUN -> [SKIP][11] ([i915#7697])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg2-4/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-dg1:          NOTRUN -> [SKIP][12] ([i915#7697])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg1-12/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_ctx_isolation@preservation-s3:
    - shard-rkl:          [PASS][13] -> [INCOMPLETE][14] ([i915#13356]) +2 other tests incomplete
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-rkl-8/igt@gem_ctx_isolation@preservation-s3.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-6/igt@gem_ctx_isolation@preservation-s3.html

  * igt@gem_ctx_persistence@heartbeat-stop:
    - shard-dg1:          NOTRUN -> [SKIP][15] ([i915#8555])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg1-12/igt@gem_ctx_persistence@heartbeat-stop.html

  * igt@gem_ctx_persistence@hostile:
    - shard-snb:          NOTRUN -> [SKIP][16] ([i915#1099])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-snb4/igt@gem_ctx_persistence@hostile.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-mtlp:         NOTRUN -> [SKIP][17] ([i915#280])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-mtlp-3/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_exec_balancer@bonded-sync:
    - shard-dg1:          NOTRUN -> [SKIP][18] ([i915#4771]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg1-12/igt@gem_exec_balancer@bonded-sync.html

  * igt@gem_exec_balancer@parallel:
    - shard-tglu-1:       NOTRUN -> [SKIP][19] ([i915#4525]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-tglu-1/igt@gem_exec_balancer@parallel.html

  * igt@gem_exec_balancer@parallel-balancer:
    - shard-rkl:          NOTRUN -> [SKIP][20] ([i915#4525]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-8/igt@gem_exec_balancer@parallel-balancer.html

  * igt@gem_exec_balancer@parallel-keep-in-fence:
    - shard-tglu:         NOTRUN -> [SKIP][21] ([i915#4525])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-tglu-5/igt@gem_exec_balancer@parallel-keep-in-fence.html

  * igt@gem_exec_capture@capture-invisible@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][22] ([i915#6334]) +2 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg1-18/igt@gem_exec_capture@capture-invisible@lmem0.html

  * igt@gem_exec_flush@basic-wb-prw-default:
    - shard-dg1:          NOTRUN -> [SKIP][23] ([i915#3539] / [i915#4852]) +3 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg1-18/igt@gem_exec_flush@basic-wb-prw-default.html

  * igt@gem_exec_reloc@basic-cpu-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][24] ([i915#3281]) +3 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg2-4/igt@gem_exec_reloc@basic-cpu-gtt.html

  * igt@gem_exec_reloc@basic-cpu-wc-noreloc:
    - shard-mtlp:         NOTRUN -> [SKIP][25] ([i915#3281])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-mtlp-3/igt@gem_exec_reloc@basic-cpu-wc-noreloc.html

  * igt@gem_exec_reloc@basic-gtt-wc-noreloc:
    - shard-dg1:          NOTRUN -> [SKIP][26] ([i915#3281]) +4 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg1-17/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html

  * igt@gem_exec_reloc@basic-write-read-noreloc:
    - shard-rkl:          NOTRUN -> [SKIP][27] ([i915#3281]) +13 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-5/igt@gem_exec_reloc@basic-write-read-noreloc.html

  * igt@gem_exec_schedule@preempt-queue:
    - shard-dg2:          NOTRUN -> [SKIP][28] ([i915#4537] / [i915#4812])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg2-4/igt@gem_exec_schedule@preempt-queue.html

  * igt@gem_exec_schedule@preempt-queue-chain:
    - shard-mtlp:         NOTRUN -> [SKIP][29] ([i915#4537] / [i915#4812]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-mtlp-3/igt@gem_exec_schedule@preempt-queue-chain.html

  * igt@gem_exec_schedule@preempt-queue-contexts-chain:
    - shard-dg1:          NOTRUN -> [SKIP][30] ([i915#4812]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg1-12/igt@gem_exec_schedule@preempt-queue-contexts-chain.html

  * igt@gem_fence_thrash@bo-write-verify-threaded-none:
    - shard-dg1:          NOTRUN -> [SKIP][31] ([i915#4860])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg1-18/igt@gem_fence_thrash@bo-write-verify-threaded-none.html

  * igt@gem_huc_copy@huc-copy:
    - shard-rkl:          NOTRUN -> [SKIP][32] ([i915#2190])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-7/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_evict@dontneed-evict-race:
    - shard-rkl:          NOTRUN -> [SKIP][33] ([i915#4613] / [i915#7582])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-2/igt@gem_lmem_evict@dontneed-evict-race.html

  * igt@gem_lmem_swapping@heavy-random:
    - shard-glk:          NOTRUN -> [SKIP][34] ([i915#4613]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-glk4/igt@gem_lmem_swapping@heavy-random.html

  * igt@gem_lmem_swapping@heavy-verify-random-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][35] ([i915#4613]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-mtlp-3/igt@gem_lmem_swapping@heavy-verify-random-ccs.html

  * igt@gem_lmem_swapping@parallel-random:
    - shard-tglu-1:       NOTRUN -> [SKIP][36] ([i915#4613])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-tglu-1/igt@gem_lmem_swapping@parallel-random.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][37] ([i915#4613]) +2 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-2/igt@gem_lmem_swapping@parallel-random-verify-ccs.html

  * igt@gem_lmem_swapping@verify-random:
    - shard-tglu:         NOTRUN -> [SKIP][38] ([i915#4613]) +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-tglu-5/igt@gem_lmem_swapping@verify-random.html

  * igt@gem_mmap_gtt@basic-small-copy-odd:
    - shard-dg2:          NOTRUN -> [SKIP][39] ([i915#4077]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg2-4/igt@gem_mmap_gtt@basic-small-copy-odd.html

  * igt@gem_mmap_gtt@fault-concurrent:
    - shard-dg1:          NOTRUN -> [SKIP][40] ([i915#4077]) +9 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg1-12/igt@gem_mmap_gtt@fault-concurrent.html

  * igt@gem_mmap_wc@copy:
    - shard-dg1:          NOTRUN -> [SKIP][41] ([i915#4083]) +9 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg1-18/igt@gem_mmap_wc@copy.html

  * igt@gem_mmap_wc@write-gtt-read-wc:
    - shard-dg2:          NOTRUN -> [SKIP][42] ([i915#4083])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg2-4/igt@gem_mmap_wc@write-gtt-read-wc.html

  * igt@gem_partial_pwrite_pread@writes-after-reads:
    - shard-mtlp:         NOTRUN -> [SKIP][43] ([i915#3282]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-mtlp-3/igt@gem_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
    - shard-rkl:          NOTRUN -> [SKIP][44] ([i915#3282]) +11 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-7/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html
    - shard-dg1:          NOTRUN -> [SKIP][45] ([i915#3282]) +6 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg1-12/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html

  * igt@gem_pxp@display-protected-crc:
    - shard-dg1:          NOTRUN -> [SKIP][46] ([i915#4270]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg1-12/igt@gem_pxp@display-protected-crc.html

  * igt@gem_pxp@hw-rejects-pxp-context:
    - shard-rkl:          NOTRUN -> [SKIP][47] ([i915#13717])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-2/igt@gem_pxp@hw-rejects-pxp-context.html

  * igt@gem_render_copy@yf-tiled-ccs-to-linear:
    - shard-dg2:          NOTRUN -> [SKIP][48] ([i915#5190] / [i915#8428]) +2 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg2-6/igt@gem_render_copy@yf-tiled-ccs-to-linear.html

  * igt@gem_render_copy@yf-tiled-ccs-to-y-tiled-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][49] ([i915#8428]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-mtlp-3/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled-ccs.html

  * igt@gem_set_tiling_vs_blt@tiled-to-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][50] ([i915#4079])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg2-6/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html

  * igt@gem_set_tiling_vs_blt@tiled-to-untiled:
    - shard-rkl:          NOTRUN -> [SKIP][51] ([i915#8411])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-7/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html

  * igt@gem_set_tiling_vs_pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][52] ([i915#4079]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg1-17/igt@gem_set_tiling_vs_pwrite.html

  * igt@gem_softpin@evict-snoop:
    - shard-dg2:          NOTRUN -> [SKIP][53] ([i915#4885])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg2-6/igt@gem_softpin@evict-snoop.html

  * igt@gem_userptr_blits@coherency-sync:
    - shard-tglu-1:       NOTRUN -> [SKIP][54] ([i915#3297])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-tglu-1/igt@gem_userptr_blits@coherency-sync.html
    - shard-dg1:          NOTRUN -> [SKIP][55] ([i915#3297])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg1-18/igt@gem_userptr_blits@coherency-sync.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-rkl:          NOTRUN -> [SKIP][56] ([i915#3297] / [i915#3323])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-7/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-tglu:         NOTRUN -> [SKIP][57] ([i915#3297]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-tglu-5/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@map-fixed-invalidate:
    - shard-dg2:          NOTRUN -> [SKIP][58] ([i915#3297] / [i915#4880])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg2-6/igt@gem_userptr_blits@map-fixed-invalidate.html

  * igt@gem_userptr_blits@relocations:
    - shard-mtlp:         NOTRUN -> [SKIP][59] ([i915#3281] / [i915#3297])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-mtlp-3/igt@gem_userptr_blits@relocations.html

  * igt@gem_userptr_blits@unsync-overlap:
    - shard-rkl:          NOTRUN -> [SKIP][60] ([i915#3297]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-5/igt@gem_userptr_blits@unsync-overlap.html

  * igt@gen9_exec_parse@bb-chained:
    - shard-tglu:         NOTRUN -> [SKIP][61] ([i915#2527] / [i915#2856])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-tglu-2/igt@gen9_exec_parse@bb-chained.html

  * igt@gen9_exec_parse@bb-start-cmd:
    - shard-dg1:          NOTRUN -> [SKIP][62] ([i915#2527]) +2 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg1-12/igt@gen9_exec_parse@bb-start-cmd.html

  * igt@gen9_exec_parse@valid-registers:
    - shard-rkl:          NOTRUN -> [SKIP][63] ([i915#2527]) +6 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-7/igt@gen9_exec_parse@valid-registers.html

  * igt@gpu_buddy@gpu_buddy:
    - shard-tglu-1:       NOTRUN -> [SKIP][64] ([i915#15678])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-tglu-1/igt@gpu_buddy@gpu_buddy.html

  * igt@i915_drm_fdinfo@busy-idle-check-all@vcs1:
    - shard-dg1:          NOTRUN -> [SKIP][65] ([i915#11527]) +5 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg1-18/igt@i915_drm_fdinfo@busy-idle-check-all@vcs1.html

  * igt@i915_drm_fdinfo@busy-idle@rcs0:
    - shard-mtlp:         NOTRUN -> [SKIP][66] ([i915#14073]) +6 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-mtlp-3/igt@i915_drm_fdinfo@busy-idle@rcs0.html

  * igt@i915_drm_fdinfo@isolation@rcs0:
    - shard-dg1:          NOTRUN -> [SKIP][67] ([i915#14073]) +5 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg1-17/igt@i915_drm_fdinfo@isolation@rcs0.html

  * igt@i915_drm_fdinfo@virtual-busy-idle:
    - shard-mtlp:         NOTRUN -> [SKIP][68] ([i915#14118])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-mtlp-3/igt@i915_drm_fdinfo@virtual-busy-idle.html

  * igt@i915_drm_fdinfo@virtual-busy-idle-all:
    - shard-dg1:          NOTRUN -> [SKIP][69] ([i915#14118])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg1-12/igt@i915_drm_fdinfo@virtual-busy-idle-all.html

  * igt@i915_module_load@fault-injection:
    - shard-dg1:          NOTRUN -> [ABORT][70] ([i915#11814] / [i915#15481]) +1 other test abort
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg1-18/igt@i915_module_load@fault-injection.html
    - shard-mtlp:         NOTRUN -> [ABORT][71] ([i915#15342] / [i915#15481])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-mtlp-1/igt@i915_module_load@fault-injection.html

  * igt@i915_module_load@fault-injection@__uc_init:
    - shard-tglu-1:       NOTRUN -> [SKIP][72] ([i915#15479]) +4 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-tglu-1/igt@i915_module_load@fault-injection@__uc_init.html
    - shard-mtlp:         NOTRUN -> [ABORT][73] ([i915#15481])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-mtlp-1/igt@i915_module_load@fault-injection@__uc_init.html

  * igt@i915_module_load@fault-injection@i915_driver_mmio_probe:
    - shard-dg1:          NOTRUN -> [INCOMPLETE][74] ([i915#15481])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg1-18/igt@i915_module_load@fault-injection@i915_driver_mmio_probe.html

  * igt@i915_module_load@fault-injection@intel_connector_register:
    - shard-snb:          NOTRUN -> [ABORT][75] ([i915#15342]) +1 other test abort
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-snb4/igt@i915_module_load@fault-injection@intel_connector_register.html
    - shard-tglu-1:       NOTRUN -> [ABORT][76] ([i915#15342]) +1 other test abort
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-tglu-1/igt@i915_module_load@fault-injection@intel_connector_register.html
    - shard-mtlp:         NOTRUN -> [DMESG-WARN][77] ([i915#15342])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-mtlp-1/igt@i915_module_load@fault-injection@intel_connector_register.html

  * igt@i915_module_load@fault-injection@intel_guc_ct_init:
    - shard-snb:          NOTRUN -> [SKIP][78] +140 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-snb4/igt@i915_module_load@fault-injection@intel_guc_ct_init.html

  * igt@i915_module_load@reload-no-display:
    - shard-dg2:          NOTRUN -> [DMESG-WARN][79] ([i915#13029] / [i915#14545])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg2-4/igt@i915_module_load@reload-no-display.html

  * igt@i915_pm_freq_api@freq-reset:
    - shard-tglu-1:       NOTRUN -> [SKIP][80] ([i915#8399])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-tglu-1/igt@i915_pm_freq_api@freq-reset.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-rkl:          NOTRUN -> [SKIP][81] ([i915#14498])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-5/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - shard-glk:          NOTRUN -> [INCOMPLETE][82] ([i915#13356] / [i915#15172])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-glk4/igt@i915_pm_rpm@system-suspend-execbuf.html

  * igt@i915_pm_rps@min-max-config-loaded:
    - shard-dg1:          NOTRUN -> [SKIP][83] ([i915#11681] / [i915#6621])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg1-18/igt@i915_pm_rps@min-max-config-loaded.html

  * igt@i915_query@hwconfig_table:
    - shard-dg1:          NOTRUN -> [SKIP][84] ([i915#6245])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg1-17/igt@i915_query@hwconfig_table.html

  * igt@i915_query@query-topology-known-pci-ids:
    - shard-rkl:          NOTRUN -> [SKIP][85] ([i915#16109])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-8/igt@i915_query@query-topology-known-pci-ids.html

  * igt@i915_query@query-topology-unsupported:
    - shard-tglu-1:       NOTRUN -> [SKIP][86] ([i915#16079])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-tglu-1/igt@i915_query@query-topology-unsupported.html
    - shard-dg1:          NOTRUN -> [SKIP][87] ([i915#16079])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg1-18/igt@i915_query@query-topology-unsupported.html
    - shard-mtlp:         NOTRUN -> [SKIP][88] ([i915#16079])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-mtlp-1/igt@i915_query@query-topology-unsupported.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-tglu:         NOTRUN -> [SKIP][89] ([i915#5723])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-tglu-5/igt@i915_query@test-query-geometry-subslices.html

  * igt@intel_hwmon@hwmon-read:
    - shard-tglu-1:       NOTRUN -> [SKIP][90] ([i915#7707])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-tglu-1/igt@intel_hwmon@hwmon-read.html

  * igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:
    - shard-dg1:          NOTRUN -> [SKIP][91] ([i915#4212]) +1 other test skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg1-17/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html

  * igt@kms_addfb_basic@framebuffer-vs-set-tiling:
    - shard-mtlp:         NOTRUN -> [SKIP][92] ([i915#4212])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-mtlp-3/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-rkl:          NOTRUN -> [SKIP][93] ([i915#12454] / [i915#12712])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-2/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-c-edp-1:
    - shard-mtlp:         [PASS][94] -> [FAIL][95] ([i915#17150])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-mtlp-3/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-edp-1.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-mtlp-1/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-edp-1.html

  * igt@kms_atomic@plane-invalid-params-fence@pipe-a-vga-1:
    - shard-snb:          NOTRUN -> [FAIL][96] ([i915#17126]) +1 other test fail
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-snb7/igt@kms_atomic@plane-invalid-params-fence@pipe-a-vga-1.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-dg1:          NOTRUN -> [SKIP][97] ([i915#9531])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg1-17/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-tglu:         NOTRUN -> [SKIP][98] ([i915#1769] / [i915#3555])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-tglu-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-0:
    - shard-tglu:         NOTRUN -> [SKIP][99] ([i915#5286]) +2 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-tglu-5/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-0:
    - shard-rkl:          NOTRUN -> [SKIP][100] ([i915#14544] / [i915#5286])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-6/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-rkl:          NOTRUN -> [SKIP][101] ([i915#5286]) +5 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-5/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg1:          NOTRUN -> [SKIP][102] ([i915#4538] / [i915#5286]) +4 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg1-17/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-tglu-1:       NOTRUN -> [SKIP][103] ([i915#5286]) +2 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][104] ([i915#3638]) +2 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-7/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-dg1:          NOTRUN -> [SKIP][105] ([i915#3638]) +1 other test skip
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg1-17/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-mtlp:         NOTRUN -> [SKIP][106] ([i915#3828])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-mtlp-3/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-rkl:          NOTRUN -> [SKIP][107] ([i915#3828]) +1 other test skip
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-7/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html
    - shard-dg1:          NOTRUN -> [SKIP][108] ([i915#3828])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg1-12/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-dg2:          NOTRUN -> [SKIP][109]
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg2-4/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-mtlp:         NOTRUN -> [SKIP][110] +11 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-mtlp-3/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-270:
    - shard-dg2:          NOTRUN -> [SKIP][111] ([i915#4538] / [i915#5190])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg2-4/igt@kms_big_fb@yf-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-dg1:          NOTRUN -> [SKIP][112] ([i915#4538]) +5 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg1-18/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][113] ([i915#14098] / [i915#6095]) +45 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-5/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][114] ([i915#14544] / [i915#6095]) +6 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-6/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1:
    - shard-glk10:        NOTRUN -> [SKIP][115] +88 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-glk10/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][116] ([i915#12313])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-tglu-1/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][117] ([i915#12313]) +4 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-8/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][118] ([i915#12313])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg2-4/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-a-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][119] ([i915#10307] / [i915#6095]) +52 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg2-4/igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-d-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [SKIP][120] ([i915#6095]) +174 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg1-12/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-d-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][121] ([i915#6095]) +9 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-mtlp-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-d-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][122] ([i915#6095]) +70 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][123] ([i915#6095]) +3 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg2-5/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-2:
    - shard-glk:          NOTRUN -> [INCOMPLETE][124] ([i915#13356] / [i915#14694] / [i915#15582])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-glk3/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-c-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][125] ([i915#14098] / [i915#14544] / [i915#6095]) +4 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][126] ([i915#10307] / [i915#10434] / [i915#6095]) +1 other test skip
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg2-4/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-a-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][127] ([i915#6095]) +24 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-tglu-1/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][128] ([i915#6095]) +44 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-tglu-5/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][129] ([i915#12313]) +1 other test skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg1-12/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_cdclk@mode-rejected-max-dotclock:
    - shard-tglu:         NOTRUN -> [SKIP][130] ([i915#17099])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-tglu-5/igt@kms_cdclk@mode-rejected-max-dotclock.html

  * igt@kms_cdclk@mode-transition:
    - shard-glk:          NOTRUN -> [SKIP][131] +232 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-glk1/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-rkl:          NOTRUN -> [SKIP][132] ([i915#3742]) +1 other test skip
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-5/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d:
    - shard-tglu-1:       NOTRUN -> [SKIP][133] ([i915#16471])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-tglu-1/igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d:
    - shard-rkl:          NOTRUN -> [SKIP][134] ([i915#16471])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-2/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d:
    - shard-dg1:          NOTRUN -> [SKIP][135] ([i915#16471]) +1 other test skip
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg1-17/igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d.html

  * igt@kms_chamelium_edid@dp-mode-timings:
    - shard-rkl:          NOTRUN -> [SKIP][136] ([i915#11151] / [i915#7828]) +9 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-5/igt@kms_chamelium_edid@dp-mode-timings.html

  * igt@kms_chamelium_frames@dp-frame-dump:
    - shard-rkl:          NOTRUN -> [SKIP][137] ([i915#11151] / [i915#14544] / [i915#7828])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-6/igt@kms_chamelium_frames@dp-frame-dump.html

  * igt@kms_chamelium_frames@vga-frame-dump:
    - shard-mtlp:         NOTRUN -> [SKIP][138] ([i915#11151] / [i915#7828]) +1 other test skip
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-mtlp-3/igt@kms_chamelium_frames@vga-frame-dump.html

  * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
    - shard-tglu:         NOTRUN -> [SKIP][139] ([i915#11151] / [i915#7828]) +3 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-tglu-5/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html

  * igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:
    - shard-dg2:          NOTRUN -> [SKIP][140] ([i915#11151] / [i915#7828])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg2-4/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html

  * igt@kms_chamelium_hpd@dp-hpd-storm-disable:
    - shard-tglu-1:       NOTRUN -> [SKIP][141] ([i915#11151] / [i915#7828]) +2 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-tglu-1/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - shard-dg1:          NOTRUN -> [SKIP][142] ([i915#11151] / [i915#7828]) +4 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg1-18/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_color_pipeline@plane-ctm3x4-lut1d@pipe-c-plane-3:
    - shard-rkl:          NOTRUN -> [SKIP][143] ([i915#16990]) +5 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-2/igt@kms_color_pipeline@plane-ctm3x4-lut1d@pipe-c-plane-3.html

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d@pipe-a-plane-2:
    - shard-mtlp:         NOTRUN -> [FAIL][144] ([i915#15733]) +12 other tests fail
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-mtlp-3/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d@pipe-a-plane-2.html

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d:
    - shard-rkl:          NOTRUN -> [FAIL][145] ([i915#17116]) +39 other tests fail
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-8/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d.html

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d@pipe-d-plane-2:
    - shard-tglu:         NOTRUN -> [FAIL][146] ([i915#17116]) +12 other tests fail
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-tglu-5/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d@pipe-d-plane-2.html

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709@pipe-a-plane-0:
    - shard-tglu-1:       NOTRUN -> [FAIL][147] ([i915#17116]) +12 other tests fail
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-tglu-1/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709@pipe-a-plane-0.html
    - shard-dg1:          NOTRUN -> [FAIL][148] ([i915#17116]) +38 other tests fail
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg1-18/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709@pipe-a-plane-0.html

  * igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-a-plane-4:
    - shard-dg1:          NOTRUN -> [SKIP][149] ([i915#16990]) +15 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg1-18/igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-a-plane-4.html

  * igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-d-plane-4:
    - shard-tglu-1:       NOTRUN -> [SKIP][150] ([i915#16990]) +15 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-tglu-1/igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-d-plane-4.html

  * igt@kms_content_protection@atomic:
    - shard-dg2:          NOTRUN -> [SKIP][151] ([i915#15865])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg2-4/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@content-type-change:
    - shard-tglu:         NOTRUN -> [SKIP][152] ([i915#15865]) +1 other test skip
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-tglu-2/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-rkl:          NOTRUN -> [SKIP][153] ([i915#15330] / [i915#3116])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-2/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:
    - shard-rkl:          NOTRUN -> [SKIP][154] ([i915#15330])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-5/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html

  * igt@kms_content_protection@srm:
    - shard-rkl:          NOTRUN -> [SKIP][155] ([i915#15865]) +6 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-7/igt@kms_content_protection@srm.html
    - shard-dg1:          NOTRUN -> [SKIP][156] ([i915#15865]) +1 other test skip
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg1-12/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-tglu-1:       NOTRUN -> [SKIP][157] ([i915#15865])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-tglu-1/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-rkl:          NOTRUN -> [SKIP][158] ([i915#3555]) +2 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-7/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_crc@cursor-onscreen-max-size:
    - shard-rkl:          NOTRUN -> [SKIP][159] ([i915#14544] / [i915#3555])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-max-size.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-rkl:          NOTRUN -> [SKIP][160] ([i915#13049]) +1 other test skip
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-2/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-dg1:          NOTRUN -> [SKIP][161] ([i915#3555]) +1 other test skip
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg1-17/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-mtlp:         NOTRUN -> [SKIP][162] ([i915#13049])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-mtlp-7/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
    - shard-tglu-1:       NOTRUN -> [SKIP][163] ([i915#13049])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-tglu-1/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-dg2:          NOTRUN -> [SKIP][164] ([i915#3555])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg2-6/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [FAIL][165] ([i915#13566]) +2 other tests fail
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-4/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-2.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-tglu:         NOTRUN -> [SKIP][166] ([i915#13049])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-tglu-5/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-rkl:          [PASS][167] -> [INCOMPLETE][168] ([i915#12358] / [i915#14152])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-rkl-5/igt@kms_cursor_crc@cursor-suspend.html
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-6/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][169] ([i915#12358] / [i915#14152])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-6/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-2.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-mtlp:         NOTRUN -> [SKIP][170] ([i915#9809])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-mtlp-3/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-rkl:          NOTRUN -> [SKIP][171] ([i915#4103])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-rkl:          NOTRUN -> [SKIP][172] +114 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-2/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
    - shard-dg2:          NOTRUN -> [SKIP][173] ([i915#13046] / [i915#5354])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg2-4/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-dg1:          NOTRUN -> [SKIP][174] ([i915#4103])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg1-17/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-dg1:          NOTRUN -> [SKIP][175] ([i915#9723])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg1-17/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-tglu-1:       NOTRUN -> [SKIP][176] ([i915#1769] / [i915#3555] / [i915#3804])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-tglu-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][177] ([i915#3804])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-tglu-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html

  * igt@kms_dp_aux_dev@basic:
    - shard-rkl:          NOTRUN -> [SKIP][178] ([i915#1257])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-8/igt@kms_dp_aux_dev@basic.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-rkl:          NOTRUN -> [SKIP][179] ([i915#13749])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-2/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-rkl:          NOTRUN -> [SKIP][180] ([i915#13748])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-7/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-dg1:          NOTRUN -> [SKIP][181] ([i915#13748])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg1-18/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback:
    - shard-tglu:         NOTRUN -> [SKIP][182] ([i915#16870])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-tglu-5/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-dg2:          NOTRUN -> [SKIP][183] ([i915#16361])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg2-4/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-tglu:         NOTRUN -> [SKIP][184] ([i915#16361]) +1 other test skip
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-tglu-5/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_dsc@dsc-with-formats-bigjoiner:
    - shard-rkl:          NOTRUN -> [SKIP][185] ([i915#16361]) +3 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-8/igt@kms_dsc@dsc-with-formats-bigjoiner.html

  * igt@kms_dsc@dsc-with-formats-ultrajoiner:
    - shard-tglu-1:       NOTRUN -> [SKIP][186] ([i915#16361])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-tglu-1/igt@kms_dsc@dsc-with-formats-ultrajoiner.html
    - shard-dg1:          NOTRUN -> [SKIP][187] ([i915#16361]) +1 other test skip
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg1-18/igt@kms_dsc@dsc-with-formats-ultrajoiner.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-glk10:        NOTRUN -> [INCOMPLETE][188] ([i915#13356] / [i915#9878])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-glk10/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_fbcon_fbt@psr:
    - shard-tglu:         NOTRUN -> [SKIP][189] ([i915#16680])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-tglu-2/igt@kms_fbcon_fbt@psr.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][190] ([i915#16680])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg2-4/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-tglu-1:       NOTRUN -> [SKIP][191] ([i915#2065])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-tglu-1/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-2x:
    - shard-rkl:          NOTRUN -> [SKIP][192] ([i915#16081])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-7/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg1:          NOTRUN -> [SKIP][193] ([i915#16081])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg1-17/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@hdr:
    - shard-dg1:          NOTRUN -> [SKIP][194] ([i915#16600])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg1-18/igt@kms_feature_discovery@hdr.html

  * igt@kms_feature_discovery@psr2:
    - shard-tglu:         NOTRUN -> [SKIP][195] ([i915#658])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-tglu-5/igt@kms_feature_discovery@psr2.html

  * igt@kms_feature_discovery@vrr:
    - shard-rkl:          NOTRUN -> [SKIP][196] ([i915#16600])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-8/igt@kms_feature_discovery@vrr.html

  * igt@kms_fence_pin_leak:
    - shard-dg1:          NOTRUN -> [SKIP][197] ([i915#4881])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg1-12/igt@kms_fence_pin_leak.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank:
    - shard-tglu:         NOTRUN -> [SKIP][198] ([i915#3637] / [i915#9934])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-tglu-2/igt@kms_flip@2x-blocking-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
    - shard-tglu-1:       NOTRUN -> [SKIP][199] ([i915#9934])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-tglu-1/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html
    - shard-mtlp:         NOTRUN -> [SKIP][200] ([i915#9934])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-mtlp-7/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-dg2:          NOTRUN -> [SKIP][201] ([i915#9934])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg2-4/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-mtlp:         NOTRUN -> [SKIP][202] ([i915#3637] / [i915#9934])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-mtlp-7/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-glk:          NOTRUN -> [INCOMPLETE][203] ([i915#12745] / [i915#13356] / [i915#17183] / [i915#4839])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-glk1/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2:
    - shard-glk:          NOTRUN -> [INCOMPLETE][204] ([i915#12745] / [i915#13356] / [i915#17183])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-glk1/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-plain-flip:
    - shard-rkl:          NOTRUN -> [SKIP][205] ([i915#9934]) +9 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-7/igt@kms_flip@2x-plain-flip.html
    - shard-dg1:          NOTRUN -> [SKIP][206] ([i915#9934]) +4 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg1-12/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-tglu-1:       NOTRUN -> [SKIP][207] ([i915#3637] / [i915#9934]) +2 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-tglu-1/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][208] ([i915#15643]) +2 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-dg2:          NOTRUN -> [SKIP][209] ([i915#15643])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg2-4/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][210] ([i915#15643])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
    - shard-tglu:         NOTRUN -> [SKIP][211] ([i915#15643]) +1 other test skip
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-tglu-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][212] ([i915#15643]) +4 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-dg1:          NOTRUN -> [SKIP][213] ([i915#15643]) +2 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg1-18/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][214] ([i915#14544] / [i915#15643])
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][215] ([i915#15990] / [i915#8708]) +4 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][216] ([i915#15991] / [i915#1825]) +13 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-mtlp-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-glk:          [PASS][217] -> [SKIP][218] +12 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-glk8/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-mmap-wc.html
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-glk2/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-plflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][219] ([i915#15989]) +27 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-5/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][220] ([i915#15989]) +2 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg2-4/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-shrfb-draw-pwrite:
    - shard-rkl:          NOTRUN -> [SKIP][221] ([i915#14544]) +1 other test skip
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-mmap-wc:
    - shard-rkl:          [PASS][222] -> [SKIP][223] ([i915#15989]) +4 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-mmap-wc.html
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-3/igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbchdr-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][224] ([i915#15989]) +14 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-tglu-2/igt@kms_frontbuffer_tracking@fbchdr-suspend.html

  * igt@kms_frontbuffer_tracking@fbchdr-tiling-4:
    - shard-rkl:          NOTRUN -> [SKIP][225] ([i915#5439]) +1 other test skip
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-2/igt@kms_frontbuffer_tracking@fbchdr-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][226] ([i915#15990] / [i915#8708]) +14 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-gtt:
    - shard-tglu:         NOTRUN -> [SKIP][227] ([i915#15102]) +18 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-tglu-2/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
    - shard-rkl:          NOTRUN -> [SKIP][228] ([i915#15102]) +54 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-indfb-fliptrack-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][229] ([i915#15990]) +3 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-mtlp-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-indfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-shrfb-draw-mmap-cpu:
    - shard-tglu-1:       NOTRUN -> [SKIP][230] ([i915#15102]) +15 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-indfb-msflip-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][231] ([i915#15989]) +11 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-mtlp-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-cur-indfb-draw-render:
    - shard-dg2:          NOTRUN -> [SKIP][232] ([i915#15991]) +3 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-shrfb-plflip-blt:
    - shard-tglu-1:       NOTRUN -> [SKIP][233] +32 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-shrfb-plflip-blt.html
    - shard-dg1:          NOTRUN -> [SKIP][234] +60 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-shrfb-fliptrack-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][235] ([i915#15990]) +5 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-shrfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-blt:
    - shard-tglu-1:       NOTRUN -> [SKIP][236] ([i915#15989]) +6 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-tglu-1/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@hdr-indfb-scaledprimary:
    - shard-dg1:          NOTRUN -> [SKIP][237] ([i915#15989]) +10 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg1-17/igt@kms_frontbuffer_tracking@hdr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][238] ([i915#15104] / [i915#15990]) +1 other test skip
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg1-12/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:
    - shard-dg2:          NOTRUN -> [SKIP][239] ([i915#15102]) +8 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:
    - shard-dg1:          NOTRUN -> [SKIP][240] ([i915#15102]) +26 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-rkl:          NOTRUN -> [SKIP][241] ([i915#1825]) +11 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][242] ([i915#15991] / [i915#5354]) +7 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][243] ([i915#15990] / [i915#8708]) +3 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-mtlp-3/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-indfb-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][244] ([i915#15990]) +20 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg1-12/igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-indfb-draw-pwrite:
    - shard-rkl:          NOTRUN -> [SKIP][245] ([i915#14544] / [i915#15102]) +2 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-6/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-shrfb-draw-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][246] ([i915#15991]) +12 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-mtlp-1/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery:
    - shard-rkl:          NOTRUN -> [FAIL][247] ([i915#17122] / [i915#17137])
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-8/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html

  * igt@kms_hdr@bpc-switch:
    - shard-dg1:          NOTRUN -> [SKIP][248] ([i915#3555] / [i915#8228])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg1-17/igt@kms_hdr@bpc-switch.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][249] ([i915#16644] / [i915#3555] / [i915#8228])
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-2/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-rkl:          NOTRUN -> [SKIP][250] ([i915#12713] / [i915#16644])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-5/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@static-swap:
    - shard-mtlp:         NOTRUN -> [SKIP][251] ([i915#12713] / [i915#16490] / [i915#3555] / [i915#8228])
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-mtlp-3/igt@kms_hdr@static-swap.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][252] ([i915#3555] / [i915#8228])
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-tglu-5/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][253] ([i915#15459])
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-8/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][254] ([i915#15458])
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg1-18/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][255] ([i915#15638] / [i915#15722])
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-7/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
    - shard-dg1:          NOTRUN -> [SKIP][256] ([i915#15638] / [i915#15722])
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg1-12/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-tglu:         NOTRUN -> [SKIP][257] ([i915#15815])
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-tglu-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-dg1:          NOTRUN -> [SKIP][258] ([i915#6301])
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg1-17/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping:
    - shard-rkl:          NOTRUN -> [SKIP][259] ([i915#15709]) +5 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-7/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5:
    - shard-mtlp:         NOTRUN -> [SKIP][260] ([i915#16386]) +1 other test skip
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-mtlp-3/igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping:
    - shard-tglu:         NOTRUN -> [SKIP][261] ([i915#15709]) +1 other test skip
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-tglu-2/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-a-plane-5:
    - shard-rkl:          NOTRUN -> [SKIP][262] ([i915#16386]) +1 other test skip
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-7/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-a-plane-5.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-7:
    - shard-dg1:          NOTRUN -> [SKIP][263] ([i915#16386]) +3 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg1-12/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-7.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier:
    - shard-mtlp:         NOTRUN -> [SKIP][264] ([i915#15709])
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-mtlp-3/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier.html

  * igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping:
    - shard-tglu-1:       NOTRUN -> [SKIP][265] ([i915#15709]) +1 other test skip
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-tglu-1/igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping.html
    - shard-dg1:          NOTRUN -> [SKIP][266] ([i915#15709]) +3 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg1-18/igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-glk11:        NOTRUN -> [INCOMPLETE][267] ([i915#13026] / [i915#13356]) +1 other test incomplete
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-glk11/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-rkl:          NOTRUN -> [SKIP][268] ([i915#13958]) +1 other test skip
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-5/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-tglu-1:       NOTRUN -> [SKIP][269] ([i915#13958])
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-tglu-1/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-dg2:          NOTRUN -> [SKIP][270] ([i915#13958])
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg2-4/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-mtlp:         NOTRUN -> [SKIP][271] ([i915#13958]) +1 other test skip
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-mtlp-3/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_multiple@tiling-4:
    - shard-tglu:         NOTRUN -> [SKIP][272] ([i915#14259])
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-tglu-2/igt@kms_plane_multiple@tiling-4.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b:
    - shard-rkl:          NOTRUN -> [SKIP][273] ([i915#15329]) +3 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-7/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:
    - shard-dg1:          NOTRUN -> [SKIP][274] ([i915#15329] / [i915#3555])
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg1-17/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d:
    - shard-tglu-1:       NOTRUN -> [SKIP][275] ([i915#15329]) +4 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-tglu-1/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d.html
    - shard-dg1:          NOTRUN -> [SKIP][276] ([i915#15329]) +13 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg1-18/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-tglu-1:       NOTRUN -> [SKIP][277] ([i915#12343] / [i915#9812])
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-tglu-1/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][278] ([i915#12343] / [i915#5354]) +1 other test skip
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-3/igt@kms_pm_backlight@fade-with-dpms.html
    - shard-tglu:         NOTRUN -> [SKIP][279] ([i915#12343] / [i915#9812])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-tglu-2/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-dg1:          NOTRUN -> [SKIP][280] ([i915#12343] / [i915#5354]) +1 other test skip
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg1-12/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-dg1:          NOTRUN -> [SKIP][281] ([i915#15948])
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg1-17/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-rkl:          NOTRUN -> [SKIP][282] ([i915#8430])
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-7/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_pm_rpm@cursor:
    - shard-mtlp:         NOTRUN -> [SKIP][283] ([i915#4077]) +6 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-mtlp-3/igt@kms_pm_rpm@cursor.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-dg1:          [PASS][284] -> [SKIP][285] ([i915#15073]) +2 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-dg1-15/igt@kms_pm_rpm@dpms-lpsp.html
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg1-19/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-rkl:          NOTRUN -> [SKIP][286] ([i915#15073])
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-2/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-tglu:         NOTRUN -> [SKIP][287] ([i915#15073]) +1 other test skip
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-tglu-2/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@i2c:
    - shard-dg1:          NOTRUN -> [DMESG-WARN][288] ([i915#4423])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg1-18/igt@kms_pm_rpm@i2c.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-rkl:          [PASS][289] -> [SKIP][290] ([i915#15073])
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-rkl-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-dg2:          [PASS][291] -> [SKIP][292] ([i915#15073])
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-dg2-8/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg2-4/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][293] ([i915#14419])
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-6/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-dg1:          NOTRUN -> [SKIP][294] ([i915#6524])
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg1-12/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_prime@d3hot:
    - shard-tglu:         NOTRUN -> [SKIP][295] ([i915#6524])
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-tglu-5/igt@kms_prime@d3hot.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:
    - shard-glk10:        NOTRUN -> [SKIP][296] ([i915#11520]) +1 other test skip
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-glk10/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-snb:          NOTRUN -> [SKIP][297] ([i915#11520]) +3 other tests skip
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-snb7/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:
    - shard-tglu-1:       NOTRUN -> [SKIP][298] ([i915#11520]) +2 other tests skip
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-tglu-1/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:
    - shard-dg2:          NOTRUN -> [SKIP][299] ([i915#11520]) +1 other test skip
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg2-4/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][300] ([i915#11520]) +4 other tests skip
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-glk4/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][301] ([i915#9808])
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-mtlp-3/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][302] ([i915#12316]) +2 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-mtlp-3/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-tglu:         NOTRUN -> [SKIP][303] ([i915#11520]) +3 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-tglu-5/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-dg1:          NOTRUN -> [SKIP][304] ([i915#11520]) +6 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg1-17/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
    - shard-rkl:          NOTRUN -> [SKIP][305] ([i915#11520]) +10 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-7/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-rkl:          NOTRUN -> [SKIP][306] ([i915#9683])
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-7/igt@kms_psr2_su@page_flip-xrgb8888.html
    - shard-dg1:          NOTRUN -> [SKIP][307] ([i915#9683])
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg1-12/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-sprite-render:
    - shard-tglu-1:       NOTRUN -> [SKIP][308] ([i915#9732]) +8 other tests skip
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-tglu-1/igt@kms_psr@fbc-pr-sprite-render.html

  * igt@kms_psr@fbc-psr2-cursor-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][309] ([i915#1072] / [i915#9732]) +2 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg2-4/igt@kms_psr@fbc-psr2-cursor-mmap-gtt.html

  * igt@kms_psr@fbc-psr2-primary-mmap-cpu:
    - shard-mtlp:         NOTRUN -> [SKIP][310] ([i915#9688]) +7 other tests skip
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-mtlp-3/igt@kms_psr@fbc-psr2-primary-mmap-cpu.html

  * igt@kms_psr@pr-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][311] ([i915#9732]) +9 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-tglu-5/igt@kms_psr@pr-dpms.html

  * igt@kms_psr@psr-primary-mmap-cpu:
    - shard-rkl:          NOTRUN -> [SKIP][312] ([i915#1072] / [i915#14544] / [i915#9732])
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-6/igt@kms_psr@psr-primary-mmap-cpu.html

  * igt@kms_psr@psr-sprite-mmap-cpu:
    - shard-dg1:          NOTRUN -> [SKIP][313] ([i915#1072] / [i915#9732]) +16 other tests skip
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg1-17/igt@kms_psr@psr-sprite-mmap-cpu.html

  * igt@kms_psr@psr2-sprite-mmap-cpu:
    - shard-rkl:          NOTRUN -> [SKIP][314] ([i915#1072] / [i915#9732]) +23 other tests skip
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-7/igt@kms_psr@psr2-sprite-mmap-cpu.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg1:          NOTRUN -> [SKIP][315] ([i915#15949])
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg1-17/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@multiplane-rotation:
    - shard-glk10:        NOTRUN -> [INCOMPLETE][316] ([i915#15492] / [i915#16184])
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-glk10/igt@kms_rotation_crc@multiplane-rotation.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-rkl:          NOTRUN -> [SKIP][317] ([i915#5289]) +2 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-rkl:          NOTRUN -> [ABORT][318] ([i915#13179]) +1 other test abort
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-5/igt@kms_selftest@drm_framebuffer.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-tglu:         NOTRUN -> [SKIP][319] ([i915#3555]) +2 other tests skip
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-tglu-2/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-rkl:          NOTRUN -> [SKIP][320] ([i915#8623])
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-rkl:          [PASS][321] -> [INCOMPLETE][322] ([i915#12276])
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-rkl-5/igt@kms_vblank@ts-continuation-suspend.html
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-4/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][323] ([i915#12276])
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-4/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-2.html

  * igt@kms_vrr@max-min:
    - shard-dg1:          NOTRUN -> [SKIP][324] ([i915#9906])
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg1-18/igt@kms_vrr@max-min.html

  * igt@kms_vrr@negative-basic:
    - shard-rkl:          NOTRUN -> [SKIP][325] ([i915#3555] / [i915#9906])
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-7/igt@kms_vrr@negative-basic.html
    - shard-dg1:          NOTRUN -> [SKIP][326] ([i915#3555] / [i915#9906])
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg1-12/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-mtlp:         NOTRUN -> [SKIP][327] ([i915#8808] / [i915#9906])
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-mtlp-3/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-tglu:         NOTRUN -> [SKIP][328] ([i915#9906])
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-tglu-2/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-rkl:          NOTRUN -> [SKIP][329] ([i915#9906]) +2 other tests skip
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-5/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@perf@gen8-unprivileged-single-ctx-counters:
    - shard-rkl:          NOTRUN -> [SKIP][330] ([i915#14544] / [i915#2436])
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-6/igt@perf@gen8-unprivileged-single-ctx-counters.html

  * igt@perf_pmu@busy-double-start@rcs0:
    - shard-mtlp:         [PASS][331] -> [FAIL][332] ([i915#4349])
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-mtlp-8/igt@perf_pmu@busy-double-start@rcs0.html
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-mtlp-4/igt@perf_pmu@busy-double-start@rcs0.html

  * igt@perf_pmu@module-unload:
    - shard-tglu-1:       NOTRUN -> [FAIL][333] ([i915#17127])
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-tglu-1/igt@perf_pmu@module-unload.html
    - shard-dg1:          NOTRUN -> [FAIL][334] ([i915#17127])
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg1-18/igt@perf_pmu@module-unload.html
    - shard-snb:          NOTRUN -> [FAIL][335] ([i915#17127])
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-snb4/igt@perf_pmu@module-unload.html

  * igt@perf_pmu@render-node-busy-idle@bcs0:
    - shard-snb:          [PASS][336] -> [FAIL][337] ([i915#16913] / [i915#4349])
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-snb7/igt@perf_pmu@render-node-busy-idle@bcs0.html
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-snb4/igt@perf_pmu@render-node-busy-idle@bcs0.html

  * igt@perf_pmu@render-node-busy-idle@rcs0:
    - shard-snb:          [PASS][338] -> [FAIL][339] ([i915#16913])
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-snb7/igt@perf_pmu@render-node-busy-idle@rcs0.html
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-snb4/igt@perf_pmu@render-node-busy-idle@rcs0.html

  * igt@prime_udl@share-import:
    - shard-mtlp:         NOTRUN -> [SKIP][340] ([i915#16420])
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-mtlp-3/igt@prime_udl@share-import.html

  * igt@prime_vgem@basic-fence-read:
    - shard-rkl:          NOTRUN -> [SKIP][341] ([i915#3291] / [i915#3708])
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-2/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@basic-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][342] ([i915#3708] / [i915#4077])
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg1-12/igt@prime_vgem@basic-gtt.html

  * igt@prime_vgem@basic-read:
    - shard-dg2:          NOTRUN -> [SKIP][343] ([i915#3291] / [i915#3708])
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg2-4/igt@prime_vgem@basic-read.html

  * igt@prime_vgem@fence-flip-hang:
    - shard-glk11:        NOTRUN -> [SKIP][344] +15 other tests skip
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-glk11/igt@prime_vgem@fence-flip-hang.html

  * igt@prime_vgem@fence-write-hang:
    - shard-tglu:         NOTRUN -> [SKIP][345] +49 other tests skip
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-tglu-2/igt@prime_vgem@fence-write-hang.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@preservation-s3@vecs0:
    - shard-mtlp:         [FAIL][346] ([i915#17176]) -> [PASS][347]
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-mtlp-3/igt@gem_ctx_isolation@preservation-s3@vecs0.html
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-mtlp-7/igt@gem_ctx_isolation@preservation-s3@vecs0.html

  * igt@gem_exec_suspend@basic-s0:
    - shard-dg2:          [INCOMPLETE][348] ([i915#13356]) -> [PASS][349] +1 other test pass
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-dg2-1/igt@gem_exec_suspend@basic-s0.html
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg2-4/igt@gem_exec_suspend@basic-s0.html

  * igt@gem_pxp@create-protected-buffer:
    - shard-tglu:         [SKIP][350] ([i915#4270]) -> [PASS][351]
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-tglu-3/igt@gem_pxp@create-protected-buffer.html
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-tglu-4/igt@gem_pxp@create-protected-buffer.html

  * igt@i915_power@sanity:
    - shard-mtlp:         [SKIP][352] ([i915#7984]) -> [PASS][353]
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-mtlp-8/igt@i915_power@sanity.html
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-mtlp-4/igt@i915_power@sanity.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-dg1:          [DMESG-WARN][354] ([i915#4391] / [i915#4423]) -> [PASS][355]
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-dg1-15/igt@i915_suspend@basic-s3-without-i915.html
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg1-19/igt@i915_suspend@basic-s3-without-i915.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-glk:          [INCOMPLETE][356] ([i915#13356] / [i915#16182] / [i915#4817]) -> [PASS][357]
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-glk8/igt@i915_suspend@fence-restore-tiled2untiled.html
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-glk2/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-2:
    - shard-rkl:          [FAIL][358] ([i915#15662]) -> [PASS][359] +1 other test pass
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-rkl-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-2.html
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-2.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:
    - shard-mtlp:         [FAIL][360] ([i915#5956]) -> [PASS][361] +1 other test pass
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-mtlp-8/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-mtlp-4/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-0:
    - shard-dg1:          [DMESG-WARN][362] ([i915#4423]) -> [PASS][363]
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-dg1-15/igt@kms_big_fb@x-tiled-16bpp-rotate-0.html
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg1-19/igt@kms_big_fb@x-tiled-16bpp-rotate-0.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1:
    - shard-glk:          [INCOMPLETE][364] ([i915#13356] / [i915#15582]) -> [PASS][365]
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-glk6/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1.html
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-glk3/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85:
    - shard-rkl:          [FAIL][366] ([i915#13566]) -> [PASS][367]
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-rkl-7/igt@kms_cursor_crc@cursor-onscreen-256x85.html
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-8/igt@kms_cursor_crc@cursor-onscreen-256x85.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-rkl:          [INCOMPLETE][368] ([i915#9878]) -> [PASS][369]
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-rkl-4/igt@kms_fbcon_fbt@fbc-suspend.html
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-7/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible:
    - shard-dg2:          [FAIL][370] ([i915#10826]) -> [PASS][371] +1 other test pass
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-dg2-3/igt@kms_flip@wf_vblank-ts-check-interruptible.html
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg2-7/igt@kms_flip@wf_vblank-ts-check-interruptible.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-4-rc-ccs-cc-to-4-mc-ccs:
    - shard-mtlp:         [DMESG-FAIL][372] ([i915#16175]) -> [PASS][373] +1 other test pass
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-mtlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-4-rc-ccs-cc-to-4-mc-ccs.html
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-mtlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-4-rc-ccs-cc-to-4-mc-ccs.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-4-rc-ccs-to-linear:
    - shard-mtlp:         [FAIL][374] ([i915#15733]) -> [PASS][375]
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-mtlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-4-rc-ccs-to-linear.html
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-mtlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-4-rc-ccs-to-linear.html

  * igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-pwrite:
    - shard-rkl:          [SKIP][376] ([i915#15989]) -> [PASS][377] +1 other test pass
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-rkl-5/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-pwrite.html
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-glk:          [SKIP][378] -> [PASS][379] +18 other tests pass
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-glk9/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-glk8/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-rkl:          [INCOMPLETE][380] ([i915#12756] / [i915#13476]) -> [PASS][381]
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-rkl-3/igt@kms_pipe_crc_basic@suspend-read-crc.html
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-5/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-rkl:          [SKIP][382] ([i915#15073]) -> [PASS][383]
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-rkl-7/igt@kms_pm_rpm@dpms-lpsp.html
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-8/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-dg2:          [SKIP][384] ([i915#15073]) -> [PASS][385]
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-dg2-4/igt@kms_pm_rpm@modeset-non-lpsp.html
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg2-5/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-rkl:          [INCOMPLETE][386] ([i915#12276]) -> [PASS][387]
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-rkl-3/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-8/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@perf_pmu@busy-double-start@vecs1:
    - shard-dg2:          [FAIL][388] ([i915#4349]) -> [PASS][389] +4 other tests pass
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-dg2-3/igt@perf_pmu@busy-double-start@vecs1.html
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg2-6/igt@perf_pmu@busy-double-start@vecs1.html

  * igt@perf_pmu@gt-awake:
    - shard-rkl:          [FAIL][390] ([i915#17054]) -> [PASS][391]
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-rkl-3/igt@perf_pmu@gt-awake.html
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-3/igt@perf_pmu@gt-awake.html

  * igt@perf_pmu@rc6-suspend:
    - shard-rkl:          [INCOMPLETE][392] ([i915#13520]) -> [PASS][393]
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-rkl-6/igt@perf_pmu@rc6-suspend.html
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-7/igt@perf_pmu@rc6-suspend.html

  * igt@perf_pmu@render-node-busy-idle@vcs0:
    - shard-snb:          [FAIL][394] ([i915#16913] / [i915#4349]) -> [PASS][395]
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-snb7/igt@perf_pmu@render-node-busy-idle@vcs0.html
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-snb4/igt@perf_pmu@render-node-busy-idle@vcs0.html

  * igt@perf_pmu@semaphore-wait@vcs0:
    - shard-dg2:          [FAIL][396] ([i915#16855]) -> [PASS][397] +3 other tests pass
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-dg2-8/igt@perf_pmu@semaphore-wait@vcs0.html
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg2-5/igt@perf_pmu@semaphore-wait@vcs0.html

  
#### Warnings ####

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-rkl:          [SKIP][398] ([i915#11078] / [i915#14544]) -> [SKIP][399] ([i915#11078])
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-rkl-6/igt@device_reset@unbind-cold-reset-rebind.html
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-7/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@gem_bad_reloc@negative-reloc:
    - shard-rkl:          [SKIP][400] ([i915#3281]) -> [SKIP][401] ([i915#14544] / [i915#3281]) +1 other test skip
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-rkl-5/igt@gem_bad_reloc@negative-reloc.html
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-6/igt@gem_bad_reloc@negative-reloc.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-rkl:          [SKIP][402] ([i915#3555] / [i915#9323]) -> [SKIP][403] ([i915#14544] / [i915#3555] / [i915#9323])
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-rkl-8/igt@gem_ccs@block-copy-compressed.html
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-6/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_exec_reloc@basic-gtt-cpu:
    - shard-rkl:          [SKIP][404] ([i915#14544] / [i915#3281]) -> [SKIP][405] ([i915#3281]) +1 other test skip
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-cpu.html
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-3/igt@gem_exec_reloc@basic-gtt-cpu.html

  * igt@gem_lmem_swapping@heavy-verify-random:
    - shard-rkl:          [SKIP][406] ([i915#14544] / [i915#4613]) -> [SKIP][407] ([i915#4613])
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-rkl-6/igt@gem_lmem_swapping@heavy-verify-random.html
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-7/igt@gem_lmem_swapping@heavy-verify-random.html

  * igt@gem_lmem_swapping@parallel-random-verify:
    - shard-rkl:          [SKIP][408] ([i915#4613]) -> [SKIP][409] ([i915#14544] / [i915#4613]) +1 other test skip
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-rkl-5/igt@gem_lmem_swapping@parallel-random-verify.html
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-6/igt@gem_lmem_swapping@parallel-random-verify.html

  * igt@gem_partial_pwrite_pread@write:
    - shard-rkl:          [SKIP][410] ([i915#3282]) -> [SKIP][411] ([i915#14544] / [i915#3282])
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-rkl-5/igt@gem_partial_pwrite_pread@write.html
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-6/igt@gem_partial_pwrite_pread@write.html

  * igt@gem_partial_pwrite_pread@write-display:
    - shard-rkl:          [SKIP][412] ([i915#14544] / [i915#3282]) -> [SKIP][413] ([i915#3282])
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-rkl-6/igt@gem_partial_pwrite_pread@write-display.html
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-3/igt@gem_partial_pwrite_pread@write-display.html

  * igt@gem_set_tiling_vs_blt@untiled-to-tiled:
    - shard-rkl:          [SKIP][414] ([i915#8411]) -> [SKIP][415] ([i915#14544] / [i915#8411])
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-rkl-8/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-6/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html

  * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
    - shard-rkl:          [SKIP][416] ([i915#3297]) -> [SKIP][417] ([i915#14544] / [i915#3297])
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-rkl-5/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-6/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html

  * igt@gem_userptr_blits@readonly-pwrite-unsync:
    - shard-rkl:          [SKIP][418] ([i915#14544] / [i915#3297]) -> [SKIP][419] ([i915#3297])
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-rkl-6/igt@gem_userptr_blits@readonly-pwrite-unsync.html
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-3/igt@gem_userptr_blits@readonly-pwrite-unsync.html

  * igt@gen9_exec_parse@bb-chained:
    - shard-rkl:          [SKIP][420] ([i915#14544] / [i915#2527]) -> [SKIP][421] ([i915#2527])
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-rkl-6/igt@gen9_exec_parse@bb-chained.html
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-3/igt@gen9_exec_parse@bb-chained.html

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-d-edp-1:
    - shard-mtlp:         [FAIL][422] ([i915#17150]) -> [INCOMPLETE][423] ([i915#17037]) +1 other test incomplete
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-mtlp-3/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-edp-1.html
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-mtlp-1/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-edp-1.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-rkl:          [SKIP][424] ([i915#5286]) -> [SKIP][425] ([i915#14544] / [i915#5286])
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-rkl-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-rkl:          [SKIP][426] ([i915#14544] / [i915#5286]) -> [SKIP][427] ([i915#5286])
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2:
    - shard-rkl:          [SKIP][428] ([i915#14098] / [i915#14544] / [i915#6095]) -> [SKIP][429] ([i915#14098] / [i915#6095]) +7 other tests skip
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-rkl-6/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2.html
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-3/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          [SKIP][430] ([i915#14544] / [i915#6095]) -> [SKIP][431] ([i915#6095]) +6 other tests skip
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-rkl-6/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-3/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-edp-1:
    - shard-mtlp:         [INCOMPLETE][432] ([i915#15582]) -> [FAIL][433] ([i915#17158]) +1 other test fail
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-mtlp-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-edp-1.html
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-mtlp-1/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1:
    - shard-glk:          [INCOMPLETE][434] ([i915#13356] / [i915#14694] / [i915#15582]) -> [INCOMPLETE][435] ([i915#13356] / [i915#15582]) +1 other test incomplete
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-glk1/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1.html
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-glk5/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-rkl:          [SKIP][436] ([i915#14098] / [i915#6095]) -> [SKIP][437] ([i915#14098] / [i915#14544] / [i915#6095]) +2 other tests skip
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-rkl-5/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
    - shard-glk:          [INCOMPLETE][438] ([i915#13356] / [i915#15582]) -> [INCOMPLETE][439] ([i915#13356] / [i915#14694] / [i915#15582])
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-glk6/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-glk3/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-rkl:          [SKIP][440] ([i915#11151] / [i915#14544] / [i915#7828]) -> [SKIP][441] ([i915#11151] / [i915#7828])
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-rkl-6/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-3/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
    - shard-rkl:          [SKIP][442] ([i915#11151] / [i915#7828]) -> [SKIP][443] ([i915#11151] / [i915#14544] / [i915#7828]) +2 other tests skip
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-rkl-5/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-6/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html

  * igt@kms_content_protection@legacy:
    - shard-rkl:          [SKIP][444] ([i915#14544] / [i915#15865]) -> [SKIP][445] ([i915#15865])
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-rkl-6/igt@kms_content_protection@legacy.html
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-3/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@mei-interface:
    - shard-dg1:          [SKIP][446] ([i915#15865]) -> [SKIP][447] ([i915#9433])
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-dg1-18/igt@kms_content_protection@mei-interface.html
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg1-12/igt@kms_content_protection@mei-interface.html

  * igt@kms_dsc@dsc-with-bpc-ultrajoiner:
    - shard-rkl:          [SKIP][448] ([i915#16361]) -> [SKIP][449] ([i915#14544] / [i915#16361]) +1 other test skip
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-rkl-5/igt@kms_dsc@dsc-with-bpc-ultrajoiner.html
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-6/igt@kms_dsc@dsc-with-bpc-ultrajoiner.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner:
    - shard-rkl:          [SKIP][450] ([i915#14544] / [i915#16361]) -> [SKIP][451] ([i915#16361])
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-rkl-6/igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner.html
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-3/igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner.html

  * igt@kms_fbcon_fbt@psr:
    - shard-rkl:          [SKIP][452] ([i915#14544] / [i915#16680]) -> [SKIP][453] ([i915#16680])
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-rkl-6/igt@kms_fbcon_fbt@psr.html
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-3/igt@kms_fbcon_fbt@psr.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-mtlp:         [FAIL][454] ([i915#17189]) -> [ABORT][455] ([i915#17165])
   [454]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-mtlp-4/igt@kms_fbcon_fbt@psr-suspend.html
   [455]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-mtlp-2/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-rkl:          [SKIP][456] ([i915#16084]) -> [SKIP][457] ([i915#14544] / [i915#16084])
   [456]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-rkl-8/igt@kms_feature_discovery@chamelium.html
   [457]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-6/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@psr1:
    - shard-rkl:          [SKIP][458] ([i915#658]) -> [SKIP][459] ([i915#14544] / [i915#658])
   [458]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-rkl-5/igt@kms_feature_discovery@psr1.html
   [459]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-6/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank:
    - shard-rkl:          [SKIP][460] ([i915#14544] / [i915#9934]) -> [SKIP][461] ([i915#9934])
   [460]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-rkl-6/igt@kms_flip@2x-blocking-absolute-wf_vblank.html
   [461]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-3/igt@kms_flip@2x-blocking-absolute-wf_vblank.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-rkl:          [SKIP][462] ([i915#9934]) -> [SKIP][463] ([i915#14544] / [i915#9934]) +1 other test skip
   [462]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-rkl-5/igt@kms_flip@2x-nonexisting-fb.html
   [463]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-6/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-glk:          [INCOMPLETE][464] ([i915#12745] / [i915#13356] / [i915#17183] / [i915#4839]) -> [INCOMPLETE][465] ([i915#12314] / [i915#12745] / [i915#13356] / [i915#17183] / [i915#4839])
   [464]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-glk9/igt@kms_flip@flip-vs-suspend.html
   [465]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-glk8/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-glk:          [INCOMPLETE][466] ([i915#12745] / [i915#13356] / [i915#17183] / [i915#4839] / [i915#6113]) -> [INCOMPLETE][467] ([i915#12745] / [i915#13356] / [i915#17183] / [i915#4839])
   [466]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-glk2/igt@kms_flip@flip-vs-suspend-interruptible.html
   [467]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-glk6/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
    - shard-glk:          [INCOMPLETE][468] ([i915#12745] / [i915#13356] / [i915#17183]) -> [INCOMPLETE][469] ([i915#12314] / [i915#12745] / [i915#13356] / [i915#17183])
   [468]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-glk9/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html
   [469]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-glk8/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
    - shard-rkl:          [SKIP][470] ([i915#14544] / [i915#15643]) -> [SKIP][471] ([i915#15643])
   [470]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html
   [471]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-3/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-rkl:          [SKIP][472] ([i915#14544] / [i915#1825]) -> [SKIP][473] ([i915#1825])
   [472]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-gtt.html
   [473]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-rkl:          [SKIP][474] ([i915#1825]) -> [SKIP][475] ([i915#14544] / [i915#1825])
   [474]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [475]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbchdr-suspend:
    - shard-rkl:          [INCOMPLETE][476] ([i915#16056]) -> [SKIP][477] ([i915#15989])
   [476]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-suspend.html
   [477]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-3/igt@kms_frontbuffer_tracking@fbchdr-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move:
    - shard-rkl:          [SKIP][478] ([i915#14544] / [i915#15102]) -> [SKIP][479] ([i915#15102]) +8 other tests skip
   [478]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move.html
   [479]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@hdr-suspend:
    - shard-rkl:          [SKIP][480] ([i915#15989]) -> [ABORT][481] ([i915#15132])
   [480]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-rkl-8/igt@kms_frontbuffer_tracking@hdr-suspend.html
   [481]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-1/igt@kms_frontbuffer_tracking@hdr-suspend.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-rkl:          [SKIP][482] ([i915#15102]) -> [SKIP][483] ([i915#14544] / [i915#15102]) +8 other tests skip
   [482]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-rkl-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html
   [483]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-rkl:          [SKIP][484] ([i915#14544]) -> [SKIP][485] +12 other tests skip
   [484]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-rkl-6/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [485]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-3/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-rkl:          [SKIP][486] -> [SKIP][487] ([i915#14544]) +15 other tests skip
   [486]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-rkl-5/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-blt.html
   [487]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-6/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-rkl:          [SKIP][488] ([i915#14544] / [i915#15815]) -> [SKIP][489] ([i915#15815])
   [488]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-rkl-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [489]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-3/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier:
    - shard-rkl:          [SKIP][490] ([i915#15709]) -> [SKIP][491] ([i915#14544] / [i915#15709])
   [490]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-rkl-5/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier.html
   [491]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier.html

  * igt@kms_plane_multiple@tiling-4:
    - shard-rkl:          [SKIP][492] ([i915#14259] / [i915#14544]) -> [SKIP][493] ([i915#14259])
   [492]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-rkl-6/igt@kms_plane_multiple@tiling-4.html
   [493]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-3/igt@kms_plane_multiple@tiling-4.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-rkl:          [SKIP][494] ([i915#12343] / [i915#5354]) -> [SKIP][495] ([i915#12343] / [i915#14544] / [i915#5354])
   [494]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-rkl-8/igt@kms_pm_backlight@basic-brightness.html
   [495]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-6/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-dg1:          [SKIP][496] ([i915#9340]) -> [SKIP][497] ([i915#3828])
   [496]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-dg1-17/igt@kms_pm_lpsp@kms-lpsp.html
   [497]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg1-14/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@pm-tiling:
    - shard-dg1:          [SKIP][498] ([i915#4077]) -> [SKIP][499] ([i915#4077] / [i915#4423])
   [498]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-dg1-15/igt@kms_pm_rpm@pm-tiling.html
   [499]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg1-19/igt@kms_pm_rpm@pm-tiling.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
    - shard-rkl:          [SKIP][500] ([i915#11520] / [i915#14544]) -> [SKIP][501] ([i915#11520])
   [500]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-rkl-6/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html
   [501]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-3/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
    - shard-rkl:          [SKIP][502] ([i915#11520]) -> [SKIP][503] ([i915#11520] / [i915#14544])
   [502]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-rkl-8/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html
   [503]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-6/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-rkl:          [SKIP][504] ([i915#9683]) -> [SKIP][505] ([i915#14544] / [i915#9683])
   [504]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-rkl-5/igt@kms_psr2_su@page_flip-nv12.html
   [505]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-6/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-pr-suspend:
    - shard-rkl:          [SKIP][506] ([i915#1072] / [i915#14544] / [i915#9732]) -> [SKIP][507] ([i915#1072] / [i915#9732]) +4 other tests skip
   [506]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-rkl-6/igt@kms_psr@fbc-pr-suspend.html
   [507]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-3/igt@kms_psr@fbc-pr-suspend.html

  * igt@kms_psr@fbc-psr2-sprite-render:
    - shard-rkl:          [SKIP][508] ([i915#1072] / [i915#9732]) -> [SKIP][509] ([i915#1072] / [i915#14544] / [i915#9732]) +4 other tests skip
   [508]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-rkl-5/igt@kms_psr@fbc-psr2-sprite-render.html
   [509]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-6/igt@kms_psr@fbc-psr2-sprite-render.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-rkl:          [SKIP][510] ([i915#3555]) -> [SKIP][511] ([i915#14544] / [i915#3555])
   [510]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-rkl-5/igt@kms_scaling_modes@scaling-mode-center.html
   [511]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-6/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-rkl:          [SKIP][512] ([i915#14544] / [i915#3555]) -> [SKIP][513] ([i915#3555]) +2 other tests skip
   [512]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-rkl-6/igt@kms_setmode@invalid-clone-single-crtc.html
   [513]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-3/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-rkl:          [SKIP][514] ([i915#8516]) -> [SKIP][515] ([i915#14544] / [i915#8516])
   [514]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-rkl-5/igt@perf_pmu@rc6-all-gts.html
   [515]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-6/igt@perf_pmu@rc6-all-gts.html

  * igt@perf_pmu@rc6-suspend:
    - shard-glk:          [INCOMPLETE][516] ([i915#13356] / [i915#14242] / [i915#16236]) -> [INCOMPLETE][517] ([i915#13356] / [i915#16236])
   [516]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-glk5/igt@perf_pmu@rc6-suspend.html
   [517]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-glk6/igt@perf_pmu@rc6-suspend.html

  * igt@prime_vgem@fence-write-hang:
    - shard-rkl:          [SKIP][518] ([i915#14544] / [i915#3708]) -> [SKIP][519] ([i915#3708])
   [518]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19208/shard-rkl-6/igt@prime_vgem@fence-write-hang.html
   [519]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-3/igt@prime_vgem@fence-write-hang.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#10826]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10826
  [i915#1099]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099
  [i915#11078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078
  [i915#11151]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#11527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11527
  [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
  [i915#11814]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11814
  [i915#12276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276
  [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
  [i915#12314]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12314
  [i915#12316]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316
  [i915#12343]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343
  [i915#12358]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12358
  [i915#12454]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12454
  [i915#1257]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257
  [i915#12712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12712
  [i915#12713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713
  [i915#12745]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745
  [i915#12756]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12756
  [i915#13008]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13008
  [i915#13026]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13026
  [i915#13029]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029
  [i915#13046]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046
  [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
  [i915#13179]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179
  [i915#13356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356
  [i915#13476]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13476
  [i915#13520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13520
  [i915#13566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566
  [i915#13717]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13717
  [i915#13748]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748
  [i915#13749]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749
  [i915#13958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958
  [i915#14073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073
  [i915#14098]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098
  [i915#14118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14118
  [i915#14152]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14152
  [i915#14242]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14242
  [i915#14259]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259
  [i915#14419]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14419
  [i915#14498]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14498
  [i915#14544]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544
  [i915#14545]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14545
  [i915#14694]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14694
  [i915#15073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073
  [i915#15102]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102
  [i915#15104]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104
  [i915#15132]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132
  [i915#15172]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15172
  [i915#15329]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329
  [i915#15330]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330
  [i915#15342]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15342
  [i915#15458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458
  [i915#15459]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459
  [i915#15479]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15479
  [i915#15481]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15481
  [i915#15492]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15492
  [i915#15582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582
  [i915#15638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15638
  [i915#15643]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643
  [i915#15662]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15662
  [i915#15678]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15678
  [i915#15709]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709
  [i915#15722]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15722
  [i915#15733]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15733
  [i915#15815]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15815
  [i915#15865]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865
  [i915#15948]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948
  [i915#15949]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15949
  [i915#15989]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989
  [i915#15990]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990
  [i915#15991]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991
  [i915#16056]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16056
  [i915#16079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16079
  [i915#16081]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081
  [i915#16084]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16084
  [i915#16109]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16109
  [i915#16175]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16175
  [i915#16182]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16182
  [i915#16184]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16184
  [i915#16236]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16236
  [i915#16348]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16348
  [i915#16361]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361
  [i915#16386]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16386
  [i915#16420]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16420
  [i915#16471]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471
  [i915#16490]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16490
  [i915#16600]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16600
  [i915#16644]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644
  [i915#16680]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16680
  [i915#16855]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16855
  [i915#16870]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16870
  [i915#16913]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16913
  [i915#16990]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16990
  [i915#17037]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17037
  [i915#17054]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17054
  [i915#17099]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17099
  [i915#17116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17116
  [i915#17122]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17122
  [i915#17126]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17126
  [i915#17127]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17127
  [i915#17137]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17137
  [i915#17150]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17150
  [i915#17158]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17158
  [i915#17165]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17165
  [i915#17176]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17176
  [i915#17183]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17183
  [i915#17189]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17189
  [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
  [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
  [i915#2065]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2065
  [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
  [i915#2436]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2436
  [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
  [i915#280]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280
  [i915#2856]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
  [i915#3116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
  [i915#3323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323
  [i915#3539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#3742]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
  [i915#3828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
  [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
  [i915#4349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349
  [i915#4391]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4391
  [i915#4423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423
  [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
  [i915#4537]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537
  [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#4771]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4771
  [i915#4812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812
  [i915#4817]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817
  [i915#4839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839
  [i915#4852]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852
  [i915#4860]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860
  [i915#4880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880
  [i915#4881]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4881
  [i915#4885]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4885
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#5439]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439
  [i915#5723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5723
  [i915#5956]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5956
  [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
  [i915#6113]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113
  [i915#6245]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245
  [i915#6301]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301
  [i915#6334]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334
  [i915#6524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
  [i915#658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658
  [i915#6621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621
  [i915#7582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582
  [i915#7697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697
  [i915#7707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707
  [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
  [i915#7984]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984
  [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
  [i915#8399]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399
  [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
  [i915#8428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
  [i915#8430]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430
  [i915#8516]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516
  [i915#8555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555
  [i915#8623]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623
  [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
  [i915#8808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808
  [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
  [i915#9340]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340
  [i915#9433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9433
  [i915#9531]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531
  [i915#9683]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683
  [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
  [i915#9723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9808
  [i915#9809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809
  [i915#9812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812
  [i915#9878]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9878
  [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
  [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934


Build changes
-------------

  * Linux: CI_DRM_19208 -> Patchwork_174416v2

  CI-20190529: 20190529
  CI_DRM_19208: dd560c03f8fc40dbfadecfb761abce88b268be1d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_9110: 9110
  Patchwork_174416v2: dd560c03f8fc40dbfadecfb761abce88b268be1d @ git://anongit.freedesktop.org/gfx-ci/linux
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/index.html

--===============3926469788211192505==
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
<tr><td><b>Series:</b></td><td>drm/i915/gt: Fix ce use-after-free in signal=
_irq_work() (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/174416/">https://patchwork.freedesktop.org/series/174416/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/Patchwork_174416v2/index.html">https://intel-gfx-ci.01.org/tre=
e/drm-tip/Patchwork_174416v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_19208_full -&gt; Patchwork_174416v=
2_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (10 -&gt; 10)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_174416v2_full that come from kno=
wn issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-reloc-purge-cache:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-mtlp-3/igt@api_intel_bb@blit-reloc-p=
urge-cache.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@object-reloc-purge-cache:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg2-4/igt@api_intel_bb@object-reloc-=
purge-cache.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@device_reset@cold-reset-bound:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-tglu-1/igt@device_reset@cold-reset-b=
ound.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/11078">i915#11078</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-mtlp-7/igt@device_reset@cold-reset-b=
ound.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/11078">i915#11078</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_basic@multigpu-create-close:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-rkl-8/igt@gem_basic@multigpu-create-=
close.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/7697">i915#7697</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-copy-compressed:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-tglu-1/igt@gem_ccs@block-copy-compre=
ssed.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy-new-ctx:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-rkl-5/igt@gem_ccs@ctrl-surf-copy-new=
-ctx.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@large-ctrl-surf-copy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-rkl-5/igt@gem_ccs@large-ctrl-surf-co=
py.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/13008">i915#13008</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-dg2-7/igt@gem_ccs@suspend-resume@linear-compressed-comp=
fmt0-smem-lmem0.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg2-3/igt@gem_ccs@suspend-resume@lin=
ear-compressed-compfmt0-smem-lmem0.html">INCOMPLETE</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16348">i91=
5#16348</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-process:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg2-4/igt@gem_close_race@multigpu-ba=
sic-process.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-threads:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg1-12/igt@gem_close_race@multigpu-b=
asic-threads.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-rkl-8/igt@gem_ctx_isolation@preservation-s3.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174=
416v2/shard-rkl-6/igt@gem_ctx_isolation@preservation-s3.html">INCOMPLETE</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356=
">i915#13356</a>) +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-stop:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg1-12/igt@gem_ctx_persistence@heart=
beat-stop.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/8555">i915#8555</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@hostile:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-snb4/igt@gem_ctx_persistence@hostile=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/1099">i915#1099</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-sseu:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-mtlp-3/igt@gem_ctx_sseu@invalid-sseu=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-sync:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg1-12/igt@gem_exec_balancer@bonded-=
sync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/4771">i915#4771</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-tglu-1/igt@gem_exec_balancer@paralle=
l.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/4525">i915#4525</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-balancer:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-rkl-8/igt@gem_exec_balancer@parallel=
-balancer.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/4525">i915#4525</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-in-fence:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-tglu-5/igt@gem_exec_balancer@paralle=
l-keep-in-fence.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible@lmem0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg1-18/igt@gem_exec_capture@capture-=
invisible@lmem0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/6334">i915#6334</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-prw-default:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg1-18/igt@gem_exec_flush@basic-wb-p=
rw-default.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3539">i915#3539</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/4852">i915#4852</a>) +3 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg2-4/igt@gem_exec_reloc@basic-cpu-g=
tt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3281">i915#3281</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-wc-noreloc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-mtlp-3/igt@gem_exec_reloc@basic-cpu-=
wc-noreloc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3281">i915#3281</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-wc-noreloc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg1-17/igt@gem_exec_reloc@basic-gtt-=
wc-noreloc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3281">i915#3281</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read-noreloc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-rkl-5/igt@gem_exec_reloc@basic-write=
-read-noreloc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/3281">i915#3281</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg2-4/igt@gem_exec_schedule@preempt-=
queue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/4537">i915#4537</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue-chain:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-mtlp-3/igt@gem_exec_schedule@preempt=
-queue-chain.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/4537">i915#4537</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue-contexts-chain:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg1-12/igt@gem_exec_schedule@preempt=
-queue-contexts-chain.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/4812">i915#4812</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-write-verify-threaded-none:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg1-18/igt@gem_fence_thrash@bo-write=
-verify-threaded-none.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/4860">i915#4860</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-rkl-7/igt@gem_huc_copy@huc-copy.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_evict@dontneed-evict-race:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-rkl-2/igt@gem_lmem_evict@dontneed-ev=
ict-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/4613">i915#4613</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/7582">i915#7582</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-random:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-glk4/igt@gem_lmem_swapping@heavy-ran=
dom.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4613">i915#4613</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random-ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-mtlp-3/igt@gem_lmem_swapping@heavy-v=
erify-random-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/4613">i915#4613</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-tglu-1/igt@gem_lmem_swapping@paralle=
l-random.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-rkl-2/igt@gem_lmem_swapping@parallel=
-random-verify-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/4613">i915#4613</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-tglu-5/igt@gem_lmem_swapping@verify-=
random.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/4613">i915#4613</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic-small-copy-odd:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg2-4/igt@gem_mmap_gtt@basic-small-c=
opy-odd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/4077">i915#4077</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@fault-concurrent:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg1-12/igt@gem_mmap_gtt@fault-concur=
rent.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/4077">i915#4077</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@copy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg1-18/igt@gem_mmap_wc@copy.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
4083">i915#4083</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write-gtt-read-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg2-4/igt@gem_mmap_wc@write-gtt-read=
-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4083">i915#4083</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-mtlp-3/igt@gem_partial_pwrite_pread@=
writes-after-reads.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/3282">i915#3282</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-uncached:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-rkl-7/igt@gem_partial_pwrite_pread@w=
rites-after-reads-uncached.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +11 other tests ski=
p</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg1-12/igt@gem_partial_pwrite_pread@=
writes-after-reads-uncached.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +6 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@display-protected-crc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg1-12/igt@gem_pxp@display-protected=
-crc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/4270">i915#4270</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@hw-rejects-pxp-context:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-rkl-2/igt@gem_pxp@hw-rejects-pxp-con=
text.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/13717">i915#13717</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-ccs-to-linear:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg2-6/igt@gem_render_copy@yf-tiled-c=
cs-to-linear.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/5190">i915#5190</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/8428">i915#8428</a>) +2 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-ccs-to-y-tiled-ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-mtlp-3/igt@gem_render_copy@yf-tiled-=
ccs-to-y-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/8428">i915#8428</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@tiled-to-tiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg2-6/igt@gem_set_tiling_vs_blt@tile=
d-to-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/4079">i915#4079</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@tiled-to-untiled:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-rkl-7/igt@gem_set_tiling_vs_blt@tile=
d-to-untiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_pwrite:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg1-17/igt@gem_set_tiling_vs_pwrite.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/4079">i915#4079</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg2-6/igt@gem_softpin@evict-snoop.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/4885">i915#4885</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-sync:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-tglu-1/igt@gem_userptr_blits@coheren=
cy-sync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/3297">i915#3297</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg1-18/igt@gem_userptr_blits@coheren=
cy-sync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-rkl-7/igt@gem_userptr_blits@dmabuf-s=
ync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3297">i915#3297</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/3323">i915#3323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-unsync:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-tglu-5/igt@gem_userptr_blits@dmabuf-=
unsync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3297">i915#3297</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg2-6/igt@gem_userptr_blits@map-fixe=
d-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/3297">i915#3297</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/4880">i915#4880</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@relocations:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-mtlp-3/igt@gem_userptr_blits@relocat=
ions.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3281">i915#3281</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-overlap:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-rkl-5/igt@gem_userptr_blits@unsync-o=
verlap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3297">i915#3297</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-chained:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-tglu-2/igt@gen9_exec_parse@bb-chaine=
d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/2527">i915#2527</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-cmd:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg1-12/igt@gen9_exec_parse@bb-start-=
cmd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/2527">i915#2527</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@valid-registers:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-rkl-7/igt@gen9_exec_parse@valid-regi=
sters.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/2527">i915#2527</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gpu_buddy@gpu_buddy:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-tglu-1/igt@gpu_buddy@gpu_buddy.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/15678">i915#15678</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-idle-check-all@vcs1:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg1-18/igt@i915_drm_fdinfo@busy-idle=
-check-all@vcs1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/11527">i915#11527</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-idle@rcs0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-mtlp-3/igt@i915_drm_fdinfo@busy-idle=
@rcs0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/14073">i915#14073</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@isolation@rcs0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg1-17/igt@i915_drm_fdinfo@isolation=
@rcs0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/14073">i915#14073</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@virtual-busy-idle:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-mtlp-3/igt@i915_drm_fdinfo@virtual-b=
usy-idle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/14118">i915#14118</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@virtual-busy-idle-all:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg1-12/igt@i915_drm_fdinfo@virtual-b=
usy-idle-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/14118">i915#14118</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg1-18/igt@i915_module_load@fault-in=
jection.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/11814">i915#11814</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/15481">i915#15481</a>) +1 other test abort=
</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-mtlp-1/igt@i915_module_load@fault-in=
jection.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/15342">i915#15342</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/15481">i915#15481</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@__uc_init:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-tglu-1/igt@i915_module_load@fault-in=
jection@__uc_init.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/15479">i915#15479</a>) +4 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-mtlp-1/igt@i915_module_load@fault-in=
jection@__uc_init.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/15481">i915#15481</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@i915_driver_mmio_probe:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg1-18/igt@i915_module_load@fault-in=
jection@i915_driver_mmio_probe.html">INCOMPLETE</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/15481">i915#15481</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@intel_connector_register:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-snb4/igt@i915_module_load@fault-inje=
ction@intel_connector_register.html">ABORT</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/15342">i915#15342</a>) +1 other tes=
t abort</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-tglu-1/igt@i915_module_load@fault-in=
jection@intel_connector_register.html">ABORT</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15342">i915#15342</a>) +1 other t=
est abort</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-mtlp-1/igt@i915_module_load@fault-in=
jection@intel_connector_register.html">DMESG-WARN</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/15342">i915#15342</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@intel_guc_ct_init:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-snb4/igt@i915_module_load@fault-inje=
ction@intel_guc_ct_init.html">SKIP</a> +140 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-no-display:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg2-4/igt@i915_module_load@reload-no=
-display.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/13029">i915#13029</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/14545">i915#14545</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-reset:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-tglu-1/igt@i915_pm_freq_api@freq-res=
et.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/8399">i915#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-rkl-5/igt@i915_pm_rc6_residency@rc6-=
idle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/14498">i915#14498</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend-execbuf:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-glk4/igt@i915_pm_rpm@system-suspend-=
execbuf.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/15172">i915#15172</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@min-max-config-loaded:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg1-18/igt@i915_pm_rps@min-max-confi=
g-loaded.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/11681">i915#11681</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/6621">i915#6621</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@hwconfig_table:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg1-17/igt@i915_query@hwconfig_table=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/6245">i915#6245</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-known-pci-ids:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-rkl-8/igt@i915_query@query-topology-=
known-pci-ids.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/16109">i915#16109</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-unsupported:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-tglu-1/igt@i915_query@query-topology=
-unsupported.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/16079">i915#16079</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg1-18/igt@i915_query@query-topology=
-unsupported.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/16079">i915#16079</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-mtlp-1/igt@i915_query@query-topology=
-unsupported.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/16079">i915#16079</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@test-query-geometry-subslices:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-tglu-5/igt@i915_query@test-query-geo=
metry-subslices.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/5723">i915#5723</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-tglu-1/igt@intel_hwmon@hwmon-read.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/7707">i915#7707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg1-17/igt@kms_addfb_basic@addfb25-x=
-tiled-mismatch-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/4212">i915#4212</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@framebuffer-vs-set-tiling:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-mtlp-3/igt@kms_addfb_basic@framebuff=
er-vs-set-tiling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/4212">i915#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-rkl-2/igt@kms_addfb_basic@invalid-sm=
em-bo-on-discrete.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/12454">i915#12454</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/12712">i915#12712</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-c-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-mtlp-3/igt@kms_async_flips@async-flip-suspend-resume@pi=
pe-c-edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/Patchwork_174416v2/shard-mtlp-1/igt@kms_async_flips@async-flip-sus=
pend-resume@pipe-c-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/17150">i915#17150</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-invalid-params-fence@pipe-a-vga-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-snb7/igt@kms_atomic@plane-invalid-pa=
rams-fence@pipe-a-vga-1.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/17126">i915#17126</a>) +1 other test fail</=
li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg1-17/igt@kms_atomic@plane-primary-=
overlay-mutable-zpos.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/9531">i915#9531</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-tglu-5/igt@kms_atomic_transition@pla=
ne-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3=
555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-tglu-5/igt@kms_big_fb@4-tiled-32bpp-=
rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/5286">i915#5286</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-rkl-6/igt@kms_big_fb@4-tiled-8bpp-ro=
tate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-rkl-5/igt@kms_big_fb@4-tiled-addfb.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/5286">i915#5286</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg1-17/igt@kms_big_fb@4-tiled-max-hw=
-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +4 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw=
-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +2 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-rkl-7/igt@kms_big_fb@linear-16bpp-ro=
tate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/3638">i915#3638</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg1-17/igt@kms_big_fb@linear-8bpp-ro=
tate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/3638">i915#3638</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-mtlp-3/igt@kms_big_fb@linear-max-hw-=
stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-rkl-7/igt@kms_big_fb@linear-max-hw-s=
tride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>) +1 other test skip<=
/li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg1-12/igt@kms_big_fb@linear-max-hw-=
stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg2-4/igt@kms_big_fb@x-tiled-8bpp-ro=
tate-270.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-mtlp-3/igt@kms_big_fb@yf-tiled-32bpp=
-rotate-0.html">SKIP</a> +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg2-4/igt@kms_big_fb@yf-tiled-64bpp-=
rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/4538">i915#4538</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg1-18/igt@kms_big_fb@yf-tiled-max-h=
w-stride-64bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a>) +5 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-rkl-5/igt@kms_ccs@bad-pixel-format-4=
-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095=
</a>) +45 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-rkl-6/igt@kms_ccs@bad-pixel-format-4=
-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#609=
5</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-glk10/igt@kms_ccs@bad-pixel-format-4=
-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> +88 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-tglu-1/igt@kms_ccs@bad-rotation-90-4=
-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-rkl-8/igt@kms_ccs@crc-primary-basic-=
4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/12313">i915#12313</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg2-4/igt@kms_ccs@crc-primary-basic-=
4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg2-4/igt@kms_ccs@crc-primary-basic-=
y-tiled-ccs@pipe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +5=
2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg1-12/igt@kms_ccs@crc-primary-rotat=
ion-180-yf-tiled-ccs@pipe-d-hdmi-a-3.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +174 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-mtlp-3/igt@kms_ccs@crc-primary-suspe=
nd-4-tiled-dg2-rc-ccs-cc@pipe-d-edp-1.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +9 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-2:</=
p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-rkl-4/igt@kms_ccs@crc-primary-suspen=
d-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-2.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +70 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-3:=
</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg2-5/igt@kms_ccs@crc-primary-suspen=
d-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-3.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +3 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-glk3/igt@kms_ccs@crc-primary-suspend=
-yf-tiled-ccs@pipe-a-hdmi-a-2.html">INCOMPLETE</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14694">i915#146=
94</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/15582">i915#15582</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-rkl-6/igt@kms_ccs@crc-primary-suspen=
d-yf-tiled-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095=
">i915#6095</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1=
:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg2-4/igt@kms_ccs@crc-sprite-planes-=
basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434">i=
915#10434</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/6095">i915#6095</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-tglu-1/igt@kms_ccs@crc-sprite-planes=
-basic-yf-tiled-ccs@pipe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +24 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-tglu-5/igt@kms_ccs@missing-ccs-buffe=
r-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +44 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg1-12/igt@kms_ccs@random-ccs-data-4=
-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/12313">i915#12313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-rejected-max-dotclock:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-tglu-5/igt@kms_cdclk@mode-rejected-m=
ax-dotclock.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/17099">i915#17099</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-glk1/igt@kms_cdclk@mode-transition.h=
tml">SKIP</a> +232 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-rkl-5/igt@kms_cdclk@mode-transition-=
all-outputs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/3742">i915#3742</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-tglu-1/igt@kms_chamelium_color_pipel=
ine@plane-ctm3x4-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/16471">i915#16471</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-rkl-2/igt@kms_chamelium_color_pipeli=
ne@plane-lut1d-ctm3x4-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg1-17/igt@kms_chamelium_color_pipel=
ine@plane-lut1d-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/16471">i915#16471</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-mode-timings:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-rkl-5/igt@kms_chamelium_edid@dp-mode=
-timings.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +9 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-frame-dump:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-rkl-6/igt@kms_chamelium_frames@dp-fr=
ame-dump.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@vga-frame-dump:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-mtlp-3/igt@kms_chamelium_frames@vga-=
frame-dump.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-tglu-5/igt@kms_chamelium_hpd@dp-hpd-=
enable-disable-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +3 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg2-4/igt@kms_chamelium_hpd@dp-hpd-f=
or-each-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm-disable:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-tglu-1/igt@kms_chamelium_hpd@dp-hpd-=
storm-disable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +2 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-fast:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg1-18/igt@kms_chamelium_hpd@vga-hpd=
-fast.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-ctm3x4-lut1d@pipe-c-plane-3:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-rkl-2/igt@kms_color_pipeline@plane-c=
tm3x4-lut1d@pipe-c-plane-3.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/16990">i915#16990</a>) +5 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d@pipe-=
a-plane-2:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-mtlp-3/igt@kms_color_pipeline@plane-=
fixed-matrix-yuv-rgb-bt2020-lim-lut1d@pipe-a-plane-2.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15733">i915#15=
733</a>) +12 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-rkl-8/igt@kms_color_pipeline@plane-f=
ixed-matrix-yuv-rgb-bt601-lim-lut1d.html">FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/17116">i915#17116</a>) +39 othe=
r tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d@pipe-d-pla=
ne-2:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-tglu-5/igt@kms_color_pipeline@plane-=
fixed-matrix-yuv-rgb-bt601-lut1d@pipe-d-plane-2.html">FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17116">i915#17116</=
a>) +12 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709@pipe-a-plane-0:<=
/p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-tglu-1/igt@kms_color_pipeline@plane-=
fixed-matrix-yuv-rgb-bt709@pipe-a-plane-0.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/17116">i915#17116</a>) +1=
2 other tests fail</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg1-18/igt@kms_color_pipeline@plane-=
fixed-matrix-yuv-rgb-bt709@pipe-a-plane-0.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/17116">i915#17116</a>) +3=
8 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-a-plane-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg1-18/igt@kms_color_pipeline@plane-=
lut1d-ctm3x4-lut1d@pipe-a-plane-4.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/16990">i915#16990</a>) +15 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-d-plane-4:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-tglu-1/igt@kms_color_pipeline@plane-=
lut1d-pre-ctm3x4@pipe-d-plane-4.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/16990">i915#16990</a>) +15 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg2-4/igt@kms_content_protection@ato=
mic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/15865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-tglu-2/igt@kms_content_protection@co=
ntent-type-change.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/15865">i915#15865</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-rkl-2/igt@kms_content_protection@dp-=
mst-lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/15330">i915#15330</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-rkl-5/igt@kms_content_protection@dp-=
mst-lic-type-0-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-rkl-7/igt@kms_content_protection@srm=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/15865">i915#15865</a>) +6 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg1-12/igt@kms_content_protection@sr=
m.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/15865">i915#15865</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-tglu-1/igt@kms_content_protection@ue=
vent.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/15865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x32:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-rkl-7/igt@kms_cursor_crc@cursor-onsc=
reen-32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-max-size:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-rkl-6/igt@kms_cursor_crc@cursor-onsc=
reen-max-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-rkl-2/igt@kms_cursor_crc@cursor-rand=
om-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/13049">i915#13049</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg1-17/igt@kms_cursor_crc@cursor-rap=
id-movement-32x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-mtlp-7/igt@kms_cursor_crc@cursor-rap=
id-movement-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/13049">i915#13049</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-tglu-1/igt@kms_cursor_crc@cursor-rap=
id-movement-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-max-size:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg2-6/igt@kms_cursor_crc@cursor-rapi=
d-movement-max-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-rkl-4/igt@kms_cursor_crc@cursor-slid=
ing-128x42@pipe-a-hdmi-a-2.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +2 other tests fa=
il</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-tglu-5/igt@kms_cursor_crc@cursor-sli=
ding-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-rkl-5/igt@kms_cursor_crc@cursor-suspend.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v=
2/shard-rkl-6/igt@kms_cursor_crc@cursor-suspend.html">INCOMPLETE</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12358">i915#1=
2358</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/14152">i915#14152</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-rkl-6/igt@kms_cursor_crc@cursor-susp=
end@pipe-a-hdmi-a-2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/12358">i915#12358</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/14152">i915#14152</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-mtlp-3/igt@kms_cursor_legacy@2x-curs=
or-vs-flip-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/9809">i915#9809</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-rkl-5/igt@kms_cursor_legacy@basic-bu=
sy-flip-before-cursor-varying-size.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-rkl-2/igt@kms_cursor_legacy@cursorb-=
vs-flipa-legacy.html">SKIP</a> +114 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg2-4/igt@kms_cursor_legacy@cursorb-=
vs-flipb-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/13046">i915#13046</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:<=
/p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg1-17/igt@kms_cursor_legacy@short-b=
usy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg1-17/igt@kms_dirtyfb@drrs-dirtyfb-=
ioctl.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/9723">i915#9723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-tglu-1/igt@kms_dither@fb-8bpc-vs-pan=
el-6bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/1769">i915#1769</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-tglu-1/igt@kms_dither@fb-8bpc-vs-pan=
el-6bpc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev@basic:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-rkl-8/igt@kms_dp_aux_dev@basic.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/1257">i915#1257</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-rkl-2/igt@kms_dp_link_training@non-u=
hbr-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/13749">i915#13749</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-rkl-7/igt@kms_dp_link_training@uhbr-=
mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/13748">i915#13748</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg1-18/igt@kms_dp_link_training@uhbr=
-sst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/13748">i915#13748</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-tglu-5/igt@kms_dp_linktrain_fallback=
@uhbr-to-hbr-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/16870">i915#16870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg2-4/igt@kms_dsc@dsc-with-bpc.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/16361">i915#16361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-tglu-5/igt@kms_dsc@dsc-with-formats.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/16361">i915#16361</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats-bigjoiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-rkl-8/igt@kms_dsc@dsc-with-formats-b=
igjoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/16361">i915#16361</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats-ultrajoiner:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-tglu-1/igt@kms_dsc@dsc-with-formats-=
ultrajoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/16361">i915#16361</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg1-18/igt@kms_dsc@dsc-with-formats-=
ultrajoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/16361">i915#16361</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-glk10/igt@kms_fbcon_fbt@fbc-suspend.=
html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/13356">i915#13356</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/9878">i915#9878</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-tglu-2/igt@kms_fbcon_fbt@psr.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/16680">i915#16680</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg2-4/igt@kms_fbcon_fbt@psr-suspend.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/16680">i915#16680</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-tglu-1/igt@kms_feature_discovery@cha=
melium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/2065">i915#2065</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-rkl-7/igt@kms_feature_discovery@disp=
lay-2x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/16081">i915#16081</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg1-17/igt@kms_feature_discovery@dis=
play-3x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/16081">i915#16081</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@hdr:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg1-18/igt@kms_feature_discovery@hdr=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/16600">i915#16600</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-tglu-5/igt@kms_feature_discovery@psr=
2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@vrr:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-rkl-8/igt@kms_feature_discovery@vrr.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/16600">i915#16600</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fence_pin_leak:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg1-12/igt@kms_fence_pin_leak.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/4881">i915#4881</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-tglu-2/igt@kms_flip@2x-blocking-abso=
lute-wf_vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/3637">i915#3637</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-tglu-1/igt@kms_flip@2x-flip-vs-dpms-=
on-nop-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/9934">i915#9934</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-mtlp-7/igt@kms_flip@2x-flip-vs-dpms-=
on-nop-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg2-4/igt@kms_flip@2x-flip-vs-expire=
d-vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-mtlp-7/igt@kms_flip@2x-flip-vs-rmfb-=
interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/3637">i915#3637</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-glk1/igt@kms_flip@2x-flip-vs-suspend=
-interruptible.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17183">i915#17=
183</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/4839">i915#4839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-glk1/igt@kms_flip@2x-flip-vs-suspend=
-interruptible@ac-hdmi-a1-hdmi-a2.html">INCOMPLETE</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915=
#13356</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17183">i915#17183</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-rkl-7/igt@kms_flip@2x-plain-flip.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/9934">i915#9934</a>) +9 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg1-12/igt@kms_flip@2x-plain-flip.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9934">i915#9934</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-tglu-1/igt@kms_flip@2x-plain-flip-fb=
-recreate-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +2 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-=
32bpp-yftile-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +2 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:<=
/p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg2-4/igt@kms_flip_scaled_crc@flip-3=
2bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-tglu-1/igt@kms_flip_scaled_crc@flip-=
32bpp-ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-tglu-5/igt@kms_flip_scaled_crc@flip-=
64bpp-4tile-to-16bpp-4tile-upscaling.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +1 othe=
r test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-rkl-5/igt@kms_flip_scaled_crc@flip-6=
4bpp-4tile-to-32bpp-4tile-upscaling.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +4 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg1-18/igt@kms_flip_scaled_crc@flip-=
64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a=
>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-rkl-6/igt@kms_flip_scaled_crc@flip-6=
4bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#1=
5643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg2-4/igt@kms_frontbuffer_tracking@f=
bc-2p-primscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8=
708</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-mtlp-3/igt@kms_frontbuffer_tracking@=
fbc-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a=
>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-glk8/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pr=
i-indfb-draw-mmap-wc.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/Patchwork_174416v2/shard-glk2/igt@kms_frontbuffer_tracki=
ng@fbchdr-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> +12 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-rkl-5/igt@kms_frontbuffer_tracking@f=
bchdr-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +27 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-mmap-cpu:=
</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg2-4/igt@kms_frontbuffer_tracking@f=
bchdr-1p-primscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +2=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-shrfb-draw-pwrite:</=
p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-rkl-6/igt@kms_frontbuffer_tracking@f=
bchdr-2p-primscrn-pri-shrfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +1 o=
ther test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-m=
map-wc.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/Patchwork_174416v2/shard-rkl-3/igt@kms_frontbuffer_tracking@fbchdr-rgb=
565-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/15989">i915#15989</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-tglu-2/igt@kms_frontbuffer_tracking@=
fbchdr-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/15989">i915#15989</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-tiling-4:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-rkl-2/igt@kms_frontbuffer_tracking@f=
bchdr-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/5439">i915#5439</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg1-18/igt@kms_frontbuffer_tracking@=
fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i91=
5#8708</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-gtt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-tglu-2/igt@kms_frontbuffer_tracking@=
fbcpsr-rgb101010-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +18 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-rkl-7/igt@kms_frontbuffer_tracking@f=
bcpsr-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +54 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-indfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-mtlp-3/igt@kms_frontbuffer_tracking@=
fbcpsrhdr-1p-indfb-fliptrack-mmap-gtt.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +3 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-shrfb-draw-mmap-=
cpu:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-tglu-1/igt@kms_frontbuffer_tracking@=
fbcpsrhdr-1p-offscreen-pri-shrfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a=
>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-mtlp-1/igt@kms_frontbuffer_tracking@=
fbcpsrhdr-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +11 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-cur-indfb-draw-render=
:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg2-4/igt@kms_frontbuffer_tracking@f=
bcpsrhdr-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a>) +=
3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-tglu-1/igt@kms_frontbuffer_tracking@=
fbcpsrhdr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> +32 other tests skip<=
/li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg1-18/igt@kms_frontbuffer_tracking@=
fbcpsrhdr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> +60 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-shrfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg2-4/igt@kms_frontbuffer_tracking@f=
bcpsrhdr-2p-shrfb-fliptrack-mmap-gtt.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +5 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-blt:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-tglu-1/igt@kms_frontbuffer_tracking@=
hdr-1p-offscreen-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +6 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-indfb-scaledprimary:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg1-17/igt@kms_frontbuffer_tracking@=
hdr-indfb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +10 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt:</=
p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg1-12/igt@kms_frontbuffer_tracking@=
psr-1p-offscreen-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i91=
5#15990</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg2-4/igt@kms_frontbuffer_tracking@p=
sr-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +8 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg1-17/igt@kms_frontbuffer_tracking@=
psr-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +26 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-rkl-2/igt@kms_frontbuffer_tracking@p=
sr-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +11 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg2-4/igt@kms_frontbuffer_tracking@p=
sr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354=
</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-mtlp-3/igt@kms_frontbuffer_tracking@=
psr-rgb565-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +3 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg1-12/igt@kms_frontbuffer_tracking@=
psrhdr-1p-offscreen-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +=
20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-indfb-draw-pwrite:</=
p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-rkl-6/igt@kms_frontbuffer_tracking@p=
srhdr-1p-primscrn-pri-indfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915=
#15102</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-mtlp-1/igt@kms_frontbuffer_tracking@=
psrhdr-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a>) +12 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-rkl-8/igt@kms_hdmi_audio_bw@suspend-=
disk-audio-recovery.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/17122">i915#17122</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/17137">i915#17137</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg1-17/igt@kms_hdr@bpc-switch.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-rkl-2/igt@kms_hdr@bpc-switch-dpms.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/16644">i915#16644</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-rkl-5/igt@kms_hdr@brightness-with-hd=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/12713">i915#12713</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/16644">i915#16644</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-mtlp-3/igt@kms_hdr@static-swap.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/12713">i915#12713</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/16490">i915#16490</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-tglu-5/igt@kms_hdr@static-toggle-sus=
pend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-rkl-8/igt@kms_joiner@basic-force-big=
-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/15459">i915#15459</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg1-18/igt@kms_joiner@invalid-modese=
t-force-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/15458">i915#15458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-rkl-7/igt@kms_joiner@switch-modeset-=
ultra-joiner-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/15638">i915#15638</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/15722">i915#15722</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg1-12/igt@kms_joiner@switch-modeset=
-ultra-joiner-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/15638">i915#15638</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/15722">i915#15722</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-tglu-2/igt@kms_multipipe_modeset@bas=
ic-max-pipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/15815">i915#15815</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg1-17/igt@kms_panel_fitting@atomic-=
fastset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/6301">i915#6301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-rkl-7/igt@kms_plane@pixel-format-4-t=
iled-lnl-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +5 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-mtlp-3/igt@kms_plane@pixel-format-4-=
tiled-modifier@pipe-b-plane-5.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/16386">i915#16386</a>) +1 other test =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping:<=
/p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-tglu-2/igt@kms_plane@pixel-format-4-=
tiled-mtl-mc-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +1=
 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-a-plane=
-5:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-rkl-7/igt@kms_plane@pixel-format-y-t=
iled-gen12-rc-ccs-cc-modifier@pipe-a-plane-5.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16386">i915#16386</a>)=
 +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane=
-7:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg1-12/igt@kms_plane@pixel-format-y-=
tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-7.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16386">i915#16386</a>=
) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-mtlp-3/igt@kms_plane@pixel-format-y-=
tiled-gen12-rc-ccs-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-tglu-1/igt@kms_plane@pixel-format-yf=
-tiled-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +1 other tes=
t skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg1-18/igt@kms_plane@pixel-format-yf=
-tiled-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +3 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-glk11/igt@kms_plane@plane-panning-bo=
ttom-right-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/13026">i915#13026</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) +1 =
other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-rkl-5/igt@kms_plane_multiple@2x-tili=
ng-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/13958">i915#13958</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-tglu-1/igt@kms_plane_multiple@2x-til=
ing-none.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg2-4/igt@kms_plane_multiple@2x-tili=
ng-x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-mtlp-3/igt@kms_plane_multiple@2x-til=
ing-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/13958">i915#13958</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-4:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-tglu-2/igt@kms_plane_multiple@tiling=
-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/14259">i915#14259</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b:</=
p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-rkl-7/igt@kms_plane_scaling@plane-sc=
aler-unity-scaling-with-rotation@pipe-b.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +3 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg1-17/igt@kms_plane_scaling@plane-s=
caler-with-clipping-clamping-rotation.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#35=
55</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-tglu-1/igt@kms_plane_scaling@plane-u=
pscale-factor-0-25-with-rotation@pipe-d.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +4 o=
ther tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg1-18/igt@kms_plane_scaling@plane-u=
pscale-factor-0-25-with-rotation@pipe-d.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +13 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-tglu-1/igt@kms_pm_backlight@basic-br=
ightness.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/12343">i915#12343</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/9812">i915#9812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-rkl-3/igt@kms_pm_backlight@fade-with=
-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/12343">i915#12343</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-tglu-2/igt@kms_pm_backlight@fade-wit=
h-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/12343">i915#12343</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/9812">i915#9812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg1-12/igt@kms_pm_backlight@fade-wit=
h-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/12343">i915#12343</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg1-17/igt@kms_pm_dc@dc6-psr.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/15948">i915#15948</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@screens-disabled:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-rkl-7/igt@kms_pm_lpsp@screens-disabl=
ed.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/8430">i915#8430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-mtlp-3/igt@kms_pm_rpm@cursor.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/4077">i915#4077</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-dg1-15/igt@kms_pm_rpm@dpms-lpsp.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-=
dg1-19/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) +2 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-rkl-2/igt@kms_pm_rpm@dpms-mode-unset=
-non-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-tglu-2/igt@kms_pm_rpm@dpms-non-lpsp.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/15073">i915#15073</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg1-18/igt@kms_pm_rpm@i2c.html">DMES=
G-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-rkl-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17=
4416v2/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i9=
15#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-dg2-8/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.ht=
ml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patc=
hwork_174416v2/shard-dg2-4/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-rkl-6/igt@kms_pm_rpm@system-suspend-=
modeset.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/14419">i915#14419</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-modeset-hybrid:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg1-12/igt@kms_prime@basic-modeset-h=
ybrid.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/6524">i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@d3hot:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-tglu-5/igt@kms_prime@d3hot.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6=
524">i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-glk10/igt@kms_psr2_sf@fbc-pr-cursor-=
plane-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-snb7/igt@kms_psr2_sf@fbc-pr-cursor-p=
lane-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +3 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-tglu-1/igt@kms_psr2_sf@fbc-pr-cursor=
-plane-update-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/11520">i915#11520</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg2-4/igt@kms_psr2_sf@fbc-pr-overlay=
-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-glk4/igt@kms_psr2_sf@fbc-pr-plane-mo=
ve-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/11520">i915#11520</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-a-edp-1=
:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-mtlp-3/igt@kms_psr2_sf@fbc-psr2-over=
lay-primary-update-sf-dmg-area@pipe-a-edp-1.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9808">i915#9808</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1=
:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-mtlp-3/igt@kms_psr2_sf@fbc-psr2-over=
lay-primary-update-sf-dmg-area@pipe-b-edp-1.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316">i915#12316</a>) =
+2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-tglu-5/igt@kms_psr2_sf@pr-overlay-pl=
ane-update-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +3 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg1-17/igt@kms_psr2_sf@psr2-overlay-=
plane-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +6 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-rkl-7/igt@kms_psr2_sf@psr2-overlay-p=
lane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +10 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-rkl-7/igt@kms_psr2_su@page_flip-xrgb=
8888.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/9683">i915#9683</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg1-12/igt@kms_psr2_su@page_flip-xrg=
b8888.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/9683">i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-render:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-tglu-1/igt@kms_psr@fbc-pr-sprite-ren=
der.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/9732">i915#9732</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg2-4/igt@kms_psr@fbc-psr2-cursor-mm=
ap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-mmap-cpu:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-mtlp-3/igt@kms_psr@fbc-psr2-primary-=
mmap-cpu.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/9688">i915#9688</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-dpms:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-tglu-5/igt@kms_psr@pr-dpms.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9=
732">i915#9732</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-mmap-cpu:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-rkl-6/igt@kms_psr@psr-primary-mmap-c=
pu.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-mmap-cpu:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg1-17/igt@kms_psr@psr-sprite-mmap-c=
pu.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/9732">i915#9732</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-mmap-cpu:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-rkl-7/igt@kms_psr@psr2-sprite-mmap-c=
pu.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/9732">i915#9732</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg1-17/igt@kms_psr_stress_test@inval=
idate-primary-flip-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/15949">i915#15949</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-glk10/igt@kms_rotation_crc@multiplan=
e-rotation.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/15492">i915#15492</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/16184">i915#16184</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-rkl-2/igt@kms_rotation_crc@primary-y=
f-tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/5289">i915#5289</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_framebuffer:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-rkl-5/igt@kms_selftest@drm_framebuff=
er.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/13179">i915#13179</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-tglu-2/igt@kms_setmode@invalid-clone=
-single-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-rkl-5/igt@kms_tiled_display@basic-te=
st-pattern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/8623">i915#8623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-rkl-5/igt@kms_vblank@ts-continuation-suspend.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17=
4416v2/shard-rkl-4/igt@kms_vblank@ts-continuation-suspend.html">INCOMPLETE<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/122=
76">i915#12276</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-rkl-4/igt@kms_vblank@ts-continuation=
-suspend@pipe-a-hdmi-a-2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/12276">i915#12276</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg1-18/igt@kms_vrr@max-min.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9=
906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-rkl-7/igt@kms_vrr@negative-basic.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/9906">i915#9906</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg1-12/igt@kms_vrr@negative-basic.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-mtlp-3/igt@kms_vrr@seamless-rr-switc=
h-drrs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/8808">i915#8808</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-tglu-2/igt@kms_vrr@seamless-rr-switc=
h-virtual.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-rkl-5/igt@kms_vrr@seamless-rr-switch=
-vrr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/9906">i915#9906</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@perf@gen8-unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-rkl-6/igt@perf@gen8-unprivileged-sin=
gle-ctx-counters.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/2436">i915#2436</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@rcs0:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-mtlp-8/igt@perf_pmu@busy-double-start@rcs0.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_1744=
16v2/shard-mtlp-4/igt@perf_pmu@busy-double-start@rcs0.html">FAIL</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#43=
49</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-tglu-1/igt@perf_pmu@module-unload.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17127">i915#17127</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg1-18/igt@perf_pmu@module-unload.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17127">i915#17127</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-snb4/igt@perf_pmu@module-unload.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/17127">i915#17127</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@render-node-busy-idle@bcs0:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-snb7/igt@perf_pmu@render-node-busy-idle@bcs0.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17=
4416v2/shard-snb4/igt@perf_pmu@render-node-busy-idle@bcs0.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16913">i9=
15#16913</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/4349">i915#4349</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@render-node-busy-idle@rcs0:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-snb7/igt@perf_pmu@render-node-busy-idle@rcs0.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17=
4416v2/shard-snb4/igt@perf_pmu@render-node-busy-idle@rcs0.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16913">i9=
15#16913</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_udl@share-import:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-mtlp-3/igt@prime_udl@share-import.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/16420">i915#16420</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-rkl-2/igt@prime_vgem@basic-fence-rea=
d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3291">i915#3291</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg1-12/igt@prime_vgem@basic-gtt.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/3708">i915#3708</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/4077">i915#4077</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-read:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-dg2-4/igt@prime_vgem@basic-read.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/3291">i915#3291</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-flip-hang:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-glk11/igt@prime_vgem@fence-flip-hang=
.html">SKIP</a> +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-write-hang:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_174416v2/shard-tglu-2/igt@prime_vgem@fence-write-ha=
ng.html">SKIP</a> +49 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@vecs0:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-mtlp-3/igt@gem_ctx_isolation@preservation-s3@vecs0.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/17176">i915#17176</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/Patchwork_174416v2/shard-mtlp-7/igt@gem_ctx_isolation@preservatio=
n-s3@vecs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-dg2-1/igt@gem_exec_suspend@basic-s0.html">INCOMPLETE</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356=
">i915#13356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/Patchwork_174416v2/shard-dg2-4/igt@gem_exec_suspend@basic-s0.html">PASS</a=
> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-protected-buffer:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-tglu-3/igt@gem_pxp@create-protected-buffer.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270=
">i915#4270</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
Patchwork_174416v2/shard-tglu-4/igt@gem_pxp@create-protected-buffer.html">P=
ASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_power@sanity:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-mtlp-8/igt@i915_power@sanity.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984">i915#7984</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_1744=
16v2/shard-mtlp-4/igt@i915_power@sanity.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-dg1-15/igt@i915_suspend@basic-s3-without-i915.html">DME=
SG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/4391">i915#4391</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/4423">i915#4423</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-dg1-19/igt@i915_suspend@bas=
ic-s3-without-i915.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-tiled2untiled:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-glk8/igt@i915_suspend@fence-restore-tiled2untiled.html"=
>INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/13356">i915#13356</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/16182">i915#16182</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-glk2/=
igt@i915_suspend@fence-restore-tiled2untiled.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hd=
mi-a-2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-rkl-3/igt@kms_atomic_transition@plane-all-modeset-trans=
ition-fencing@pipe-a-hdmi-a-2.html">FAIL</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/15662">i915#15662</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-3=
/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi=
-a-2.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:<=
/p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-mtlp-8/igt@kms_atomic_transition@plane-toggle-modeset-t=
ransition@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/5956">i915#5956</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-mtlp-4/igt@kms_=
atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html">PASS</=
a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-dg1-15/igt@kms_big_fb@x-tiled-16bpp-rotate-0.html">DMES=
G-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/4423">i915#4423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/Patchwork_174416v2/shard-dg1-19/igt@kms_big_fb@x-tiled-16bpp-rotate=
-0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-glk6/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-=
a-hdmi-a-1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15582">i915#15582</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-glk=
3/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1.html">PASS</=
a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-rkl-7/igt@kms_cursor_crc@cursor-onscreen-256x85.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/13566">i915#13566</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/Patchwork_174416v2/shard-rkl-8/igt@kms_cursor_crc@cursor-onscreen-25=
6x85.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-rkl-4/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9878"=
>i915#9878</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/P=
atchwork_174416v2/shard-rkl-7/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a><=
/li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-dg2-3/igt@kms_flip@wf_vblank-ts-check-interruptible.htm=
l">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/10826">i915#10826</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/Patchwork_174416v2/shard-dg2-7/igt@kms_flip@wf_vblank-ts-check-i=
nterruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-4-rc-ccs-cc-to-4-mc-=
ccs:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-mtlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-b-ed=
p-1-4-rc-ccs-cc-to-4-mc-ccs.html">DMESG-FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/16175">i915#16175</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-mt=
lp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-4-rc-ccs-cc-to-4-m=
c-ccs.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-4-rc-ccs-to-linear:<=
/p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-mtlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-b-ed=
p-1-4-rc-ccs-to-linear.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/15733">i915#15733</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-mtlp-3/igt@km=
s_flip_tiling@flip-change-tiling@pipe-b-edp-1-4-rc-ccs-to-linear.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-pwrite:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-rkl-5/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-dra=
w-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/15989">i915#15989</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-6/igt@kms_frontbuffer_t=
racking@fbchdr-rgb101010-draw-pwrite.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-glk9/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-s=
hrfb-draw-mmap-wc.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/Patchwork_174416v2/shard-glk8/igt@kms_frontbuffer_tracking@=
hdr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">PASS</a> +18 other tests pass<=
/li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-rkl-3/igt@kms_pipe_crc_basic@suspend-read-crc.html">INC=
OMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/12756">i915#12756</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/13476">i915#13476</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-5/igt@kms_pipe_crc_=
basic@suspend-read-crc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-rkl-7/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#150=
73</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork=
_174416v2/shard-rkl-8/igt@kms_pm_rpm@dpms-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-dg2-4/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i9=
15#15073</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Pat=
chwork_174416v2/shard-dg2-5/igt@kms_pm_rpm@modeset-non-lpsp.html">PASS</a><=
/li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-rkl-3/igt@kms_vblank@ts-continuation-dpms-suspend.html"=
>INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/12276">i915#12276</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/Patchwork_174416v2/shard-rkl-8/igt@kms_vblank@ts-continuatio=
n-dpms-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@vecs1:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-dg2-3/igt@perf_pmu@busy-double-start@vecs1.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349=
">i915#4349</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
Patchwork_174416v2/shard-dg2-6/igt@perf_pmu@busy-double-start@vecs1.html">P=
ASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@gt-awake:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-rkl-3/igt@perf_pmu@gt-awake.html">FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17054">i915#17054</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174=
416v2/shard-rkl-3/igt@perf_pmu@gt-awake.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-rkl-6/igt@perf_pmu@rc6-suspend.html">INCOMPLETE</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13520">i91=
5#13520</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patc=
hwork_174416v2/shard-rkl-7/igt@perf_pmu@rc6-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@render-node-busy-idle@vcs0:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-snb7/igt@perf_pmu@render-node-busy-idle@vcs0.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16=
913">i915#16913</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/4349">i915#4349</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/Patchwork_174416v2/shard-snb4/igt@perf_pmu@render-node-bu=
sy-idle@vcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@semaphore-wait@vcs0:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-dg2-8/igt@perf_pmu@semaphore-wait@vcs0.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16855">i=
915#16855</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Pa=
tchwork_174416v2/shard-dg2-5/igt@perf_pmu@semaphore-wait@vcs0.html">PASS</a=
> +3 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@device_reset@unbind-cold-reset-rebind:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-rkl-6/igt@device_reset@unbind-cold-reset-rebind.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/11078">i915#11078</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-7/igt@device_reset@unbi=
nd-cold-reset-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/11078">i915#11078</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_bad_reloc@negative-reloc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-rkl-5/igt@gem_bad_reloc@negative-reloc.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i9=
15#3281</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patc=
hwork_174416v2/shard-rkl-6/igt@gem_bad_reloc@negative-reloc.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">=
i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/3281">i915#3281</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-copy-compressed:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-rkl-8/igt@gem_ccs@block-copy-compressed.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i=
915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/9323">i915#9323</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/Patchwork_174416v2/shard-rkl-6/igt@gem_ccs@block-copy-compressed=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-cpu:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-cpu.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i=
915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3281">i915#3281</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/Patchwork_174416v2/shard-rkl-3/igt@gem_exec_reloc@basic-gtt-cpu=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/3281">i915#3281</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-rkl-6/igt@gem_lmem_swapping@heavy-verify-random.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/4613">i915#4613</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-7/igt@gem_lmem_swapping@h=
eavy-verify-random.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-rkl-5/igt@gem_lmem_swapping@parallel-random-verify.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/4613">i915#4613</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/Patchwork_174416v2/shard-rkl-6/igt@gem_lmem_swapping@parallel-rando=
m-verify.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@write:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-rkl-5/igt@gem_partial_pwrite_pread@write.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">=
i915#3282</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Pa=
tchwork_174416v2/shard-rkl-6/igt@gem_partial_pwrite_pread@write.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/145=
44">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@write-display:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-rkl-6/igt@gem_partial_pwrite_pread@write-display.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/3282">i915#3282</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-3/igt@gem_partial_pwrite=
_pread@write-display.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@untiled-to-tiled:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-rkl-8/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/8411">i915#8411</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/Patchwork_174416v2/shard-rkl-6/igt@gem_set_tiling_vs_blt@untiled-to-t=
iled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@invalid-mmap-offset-unsync:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-rkl-5/igt@gem_userptr_blits@invalid-mmap-offset-unsync.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3297">i915#3297</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/Patchwork_174416v2/shard-rkl-6/igt@gem_userptr_blits@invalid-mm=
ap-offset-unsync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-pwrite-unsync:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-rkl-6/igt@gem_userptr_blits@readonly-pwrite-unsync.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/3297">i915#3297</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-3/igt@gem_userptr_blit=
s@readonly-pwrite-unsync.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-chained:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-rkl-6/igt@gen9_exec_parse@bb-chained.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i91=
5#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/2527">i915#2527</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/Patchwork_174416v2/shard-rkl-3/igt@gen9_exec_parse@bb-chained.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/2527">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-mtlp-3/igt@kms_async_flips@async-flip-suspend-resume@pi=
pe-d-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17150">i915#17150</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-mtlp-1/igt@kms_async_flip=
s@async-flip-suspend-resume@pipe-d-edp-1.html">INCOMPLETE</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17037">i915#17037</a=
>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-rkl-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate=
-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-6/igt@kms_big_=
fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i91=
5#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate=
-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rk=
l-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-rkl-6/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-c=
c@pipe-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_1=
74416v2/shard-rkl-3/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe=
-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +7 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-rkl-6/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@=
pipe-b-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-3=
/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6=
095">i915#6095</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-mtlp-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-c=
cs@pipe-d-edp-1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/15582">i915#15582</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-mtlp-1/igt@kms=
_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-edp-1.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17158">i91=
5#17158</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-glk1/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a=
-hdmi-a-1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/14694">i915#14694</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582">i915#15582</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174=
416v2/shard-glk5/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-=
1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/13356">i915#13356</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/15582">i915#15582</a>) +1 other test incomp=
lete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-rkl-5/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14098">i915#14098</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-6/igt@kms_ccs@crc-prim=
ary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915=
#6095</a>) +2 other tests skip</li>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-glk6/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html"=
>INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/13356">i915#13356</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/15582">i915#15582</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-glk3/igt@kms_ccs@cr=
c-primary-suspend-yf-tiled-ccs.html">INCOMPLETE</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14694">i915#14=
694</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/15582">i915#15582</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-rkl-6/igt@kms_chamelium_frames@hdmi-crc-nonplanar-forma=
ts.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl=
-3/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#=
11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-after-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-rkl-5/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-6/igt@kms_chamelium_hpd@=
dp-hpd-after-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#782=
8</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-rkl-6/igt@kms_content_protection@legacy.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">=
i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/15865">i915#15865</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/Patchwork_174416v2/shard-rkl-3/igt@kms_content_protection@le=
gacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/15865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-dg1-18/igt@kms_content_protection@mei-interface.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/15865">i915#15865</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/Patchwork_174416v2/shard-dg1-12/igt@kms_content_protection@mei-inter=
face.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/9433">i915#9433</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-ultrajoiner:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-rkl-5/igt@kms_dsc@dsc-with-bpc-ultrajoiner.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1636=
1">i915#16361</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/Patchwork_174416v2/shard-rkl-6/igt@kms_dsc@dsc-with-bpc-ultrajoiner.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/16361">i915#16361</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-rkl-6/igt@kms_dsc@dsc-with-output-formats-with-bpc-ultr=
ajoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-3/igt@km=
s_dsc@dsc-with-output-formats-with-bpc-ultrajoiner.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#163=
61</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-rkl-6/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/166=
80">i915#16680</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/Patchwork_174416v2/shard-rkl-3/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16680">i915=
#16680</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-mtlp-4/igt@kms_fbcon_fbt@psr-suspend.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17189">i91=
5#17189</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patc=
hwork_174416v2/shard-mtlp-2/igt@kms_fbcon_fbt@psr-suspend.html">ABORT</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17165">i=
915#17165</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-rkl-8/igt@kms_feature_discovery@chamelium.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16084=
">i915#16084</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/Patchwork_174416v2/shard-rkl-6/igt@kms_feature_discovery@chamelium.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/16084">i915#16084</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-rkl-5/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658">i915#=
658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwor=
k_174416v2/shard-rkl-6/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#1=
4544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-rkl-6/igt@kms_flip@2x-blocking-absolute-wf_vblank.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/9934">i915#9934</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-3/igt@kms_flip@2x-block=
ing-absolute-wf_vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-rkl-5/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915=
#9934</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchw=
ork_174416v2/shard-rkl-6/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915=
#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/9934">i915#9934</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-glk9/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">=
i915#12745</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/13356">i915#13356</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/17183">i915#17183</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-glk8/=
igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/12314">i915#12314</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#127=
45</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/13356">i915#13356</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17183">i915#17183</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/4839">i915#4839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-glk2/igt@kms_flip@flip-vs-suspend-interruptible.html">I=
NCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/12745">i915#12745</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/17183">i915#17183</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113">=
i915#6113</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Pa=
tchwork_174416v2/shard-glk6/igt@kms_flip@flip-vs-suspend-interruptible.html=
">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/12745">i915#12745</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/17183">i915#17183</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-glk9/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html">INCOM=
PLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/12745">i915#12745</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/13356">i915#13356</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/17183">i915#17183</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-glk8/igt@=
kms_flip@flip-vs-suspend@a-hdmi-a1.html">INCOMPLETE</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/12314">i915#12314</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i91=
5#12745</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/13356">i915#13356</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/17183">i915#17183</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling=
:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-6=
4bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/sh=
ard-rkl-3/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-down=
scaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/15643">i915#15643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-=
indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rk=
l-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-gtt.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/1825">i915#1825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-=
shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-6/igt@kms_front=
buffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#=
14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/1825">i915#1825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-suspend.html"=
>INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/16056">i915#16056</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/Patchwork_174416v2/shard-rkl-3/igt@kms_frontbuffer_tracking@=
fbchdr-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/15989">i915#15989</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-c=
ur-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-3=
/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/151=
02">i915#15102</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-rkl-8/igt@kms_frontbuffer_tracking@hdr-suspend.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
15989">i915#15989</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/Patchwork_174416v2/shard-rkl-1/igt@kms_frontbuffer_tracking@hdr-suspe=
nd.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/15132">i915#15132</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-rkl-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-=
shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-6/igt@kms_fr=
ontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i=
915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/15102">i915#15102</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-cur-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-rkl-6/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-c=
ur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-3/igt@kms_=
frontbuffer_tracking@psrhdr-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</=
a> +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-rkl-5/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-p=
ri-shrfb-draw-blt.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/Patchwork_174416v2/shard-rkl-6/igt@kms_frontbuffer_tracking=
@psrhdr-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +15 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-rkl-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-chec=
k.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/15815">i915#15815</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-3/igt@kms_mult=
ipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/15815">i915#15815</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-rkl-5/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-=
modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/15709">i915#15709</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-6/igt@kms_plane@pixel-f=
ormat-4-tiled-dg2-rc-ccs-cc-modifier.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15=
709</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-4:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-rkl-6/igt@kms_plane_multiple@tiling-4.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259">i9=
15#14259</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/Patchwork_174416v2/shard-rkl-3/igt@kms_plane_multiple@tiling-4=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/14259">i915#14259</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-rkl-8/igt@kms_pm_backlight@basic-brightness.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/123=
43">i915#12343</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/5354">i915#5354</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/Patchwork_174416v2/shard-rkl-6/igt@kms_pm_backlight@basic-=
brightness.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/12343">i915#12343</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-dg1-17/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340">i915#9340=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_1=
74416v2/shard-dg1-14/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@pm-tiling:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-dg1-15/igt@kms_pm_rpm@pm-tiling.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_1=
74416v2/shard-dg1-19/igt@kms_pm_rpm@pm-tiling.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i=
915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-rkl-6/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dm=
g-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/11520">i915#11520</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-3/igt@kms=
_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-rkl-8/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-=
area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/11520">i915#11520</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-6/igt@kms_psr2_sf@pr-overla=
y-primary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-rkl-5/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915=
#9683</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchw=
ork_174416v2/shard-rkl-6/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915=
#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/9683">i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-rkl-6/igt@kms_psr@fbc-pr-suspend.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#107=
2</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/9732">i915#9732</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-3/igt@kms_psr@fbc-pr-suspe=
nd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/9732">i915#9732</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-render:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-rkl-5/igt@kms_psr@fbc-psr2-sprite-render.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">=
i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/9732">i915#9732</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/Patchwork_174416v2/shard-rkl-6/igt@kms_psr@fbc-psr2-sprite-rend=
er.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +4 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-rkl-5/igt@kms_scaling_modes@scaling-mode-center.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/3555">i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/Patchwork_174416v2/shard-rkl-6/igt@kms_scaling_modes@scaling-mode-cent=
er.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-rkl-6/igt@kms_setmode@invalid-clone-single-crtc.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/Patchwork_174416v2/shard-rkl-3/igt@kms_setmode@invalid=
-clone-single-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-all-gts:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-rkl-5/igt@perf_pmu@rc6-all-gts.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516">i915#8516=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_1=
74416v2/shard-rkl-6/igt@perf_pmu@rc6-all-gts.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516">=
i915#8516</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-suspend:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-glk5/igt@perf_pmu@rc6-suspend.html">INCOMPLETE</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915=
#13356</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/14242">i915#14242</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/16236">i915#16236</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/Patchwork_174416v2/shard-glk6/igt@perf_pmu@rc6-s=
uspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/16236">i915#16236</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-write-hang:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19208/shard-rkl-6/igt@prime_vgem@fence-write-hang.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i9=
15#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/3708">i915#3708</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/Patchwork_174416v2/shard-rkl-3/igt@prime_vgem@fence-write-hang.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/3708">i915#3708</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_19208 -&gt; Patchwork_174416v2</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19208: dd560c03f8fc40dbfadecfb761abce88b268be1d @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGT_9110: 9110<br />
  Patchwork_174416v2: dd560c03f8fc40dbfadecfb761abce88b268be1d @ git://anon=
git.freedesktop.org/gfx-ci/linux<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============3926469788211192505==--
