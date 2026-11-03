Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10019606A327
	for <intel-gfx@archiver.kernel.org>; Tue,  3 Nov 2026 03:22:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CC8410E355;
	Tue,  3 Nov 2026 03:22:34 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E17AC10E11F;
 Tue,  3 Nov 2026 03:22:33 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7128412604185327517=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_drm/i915=3A_LT=27s_suppo?=
 =?utf-8?q?rt_for_Vswing_/_Pre-emphasis_Override?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Micha=C5=82_Grzelak?= <michal.grzelak@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Tue, 03 Nov 2026 03:22:33 -0000
Message-ID: <179367615389.108204.15334440586770920199@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261103001518.3478578-1-michal.grzelak@linux.intel.com>
In-Reply-To: <20261103001518.3478578-1-michal.grzelak@linux.intel.com>
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-gfx@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=0.1 required=3.0 tests=BAYES_00,HTML_MESSAGE,
	MAILING_LIST_MULTI,MPART_ALT_DIFF_COUNT,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============7128412604185327517==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915: LT's support for Vswing / Pre-emphasis Override
URL   : https://patchwork.freedesktop.org/series/177526/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_19433_full -> Patchwork_177526v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with Patchwork_177526v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in Patchwork_177526v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in Patchwork_177526v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_async_flips@async-flip-dpms@pipe-d-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][1] +4 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-1/igt@kms_async_flips@async-flip-dpms@pipe-d-hdmi-a-1.html

  
Known issues
------------

  Here are the changes found in Patchwork_177526v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - shard-dg1:          NOTRUN -> [SKIP][2] ([i915#8411])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg1-19/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@device_reset@cold-reset-bound:
    - shard-rkl:          NOTRUN -> [SKIP][3] ([i915#11078])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-7/igt@device_reset@cold-reset-bound.html

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-glk:          NOTRUN -> [SKIP][4] ([i915#17537])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk4/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@dmabuf@dma-buf-fence-chain:
    - shard-glk:          NOTRUN -> [SKIP][5] ([i915#17712])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk6/igt@dmabuf@dma-buf-fence-chain.html

  * igt@drm_read@short-buffer-wakeup:
    - shard-dg2:          [PASS][6] -> [SKIP][7] ([i915#17359])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-dg2-1/igt@drm_read@short-buffer-wakeup.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-7/igt@drm_read@short-buffer-wakeup.html

  * igt@fbdev@read:
    - shard-dg2:          [PASS][8] -> [SKIP][9] ([i915#2582])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-dg2-3/igt@fbdev@read.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-7/igt@fbdev@read.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-glk:          NOTRUN -> [SKIP][10] ([i915#17499])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk4/igt@gem_ccs@ctrl-surf-copy.html
    - shard-tglu-1:       NOTRUN -> [SKIP][11] ([i915#3555] / [i915#9323])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-1/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_ccs@ctrl-surf-copy-new-ctx:
    - shard-dg1:          NOTRUN -> [SKIP][12] ([i915#9323])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg1-19/igt@gem_ccs@ctrl-surf-copy-new-ctx.html

  * igt@gem_ccs@suspend-resume:
    - shard-tglu:         NOTRUN -> [SKIP][13] ([i915#9323]) +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-9/igt@gem_ccs@suspend-resume.html

  * igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0:
    - shard-dg2:          [PASS][14] -> [INCOMPLETE][15] ([i915#13356] / [i915#16348])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-dg2-7/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-4/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html

  * igt@gem_compute@compute-square:
    - shard-glk:          NOTRUN -> [SKIP][16] ([i915#17552])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk4/igt@gem_compute@compute-square.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-rkl:          NOTRUN -> [SKIP][17] ([i915#6335])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-4/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_ctx_sseu@engines:
    - shard-glk:          NOTRUN -> [SKIP][18] ([i915#17496])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk6/igt@gem_ctx_sseu@engines.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-tglu:         NOTRUN -> [SKIP][19] ([i915#280]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-9/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-rkl:          NOTRUN -> [SKIP][20] ([i915#280]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-4/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_exec_balancer@noheartbeat:
    - shard-mtlp:         NOTRUN -> [SKIP][21] ([i915#8555])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-mtlp-1/igt@gem_exec_balancer@noheartbeat.html

  * igt@gem_exec_balancer@parallel:
    - shard-tglu-1:       NOTRUN -> [SKIP][22] ([i915#4525])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-1/igt@gem_exec_balancer@parallel.html

  * igt@gem_exec_balancer@parallel-contexts:
    - shard-rkl:          NOTRUN -> [SKIP][23] ([i915#4525]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-3/igt@gem_exec_balancer@parallel-contexts.html
    - shard-tglu:         NOTRUN -> [SKIP][24] ([i915#4525]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-3/igt@gem_exec_balancer@parallel-contexts.html

  * igt@gem_exec_balancer@parallel-keep-in-fence:
    - shard-glk10:        NOTRUN -> [SKIP][25] ([i915#17547])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk10/igt@gem_exec_balancer@parallel-keep-in-fence.html

  * igt@gem_exec_capture@capture:
    - shard-mtlp:         NOTRUN -> [FAIL][26] ([i915#16904]) +1 other test fail
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-mtlp-7/igt@gem_exec_capture@capture.html

  * igt@gem_exec_capture@capture-recoverable:
    - shard-glk:          NOTRUN -> [SKIP][27] ([i915#17711])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk4/igt@gem_exec_capture@capture-recoverable.html
    - shard-tglu-1:       NOTRUN -> [SKIP][28] ([i915#6344])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-1/igt@gem_exec_capture@capture-recoverable.html

  * igt@gem_exec_endless@dispatch@bcs0:
    - shard-glk:          NOTRUN -> [SKIP][29] ([i915#17571])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk2/igt@gem_exec_endless@dispatch@bcs0.html

  * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
    - shard-mtlp:         NOTRUN -> [SKIP][30] ([i915#3711])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-mtlp-7/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html

  * igt@gem_exec_params@rsvd2-dirt:
    - shard-mtlp:         NOTRUN -> [SKIP][31] ([i915#5107])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-mtlp-7/igt@gem_exec_params@rsvd2-dirt.html

  * igt@gem_exec_params@secure-non-master:
    - shard-glk:          NOTRUN -> [SKIP][32] ([i915#17523])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk6/igt@gem_exec_params@secure-non-master.html

  * igt@gem_exec_params@secure-non-root:
    - shard-dg1:          NOTRUN -> [SKIP][33] ([i915#17416])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg1-17/igt@gem_exec_params@secure-non-root.html

  * igt@gem_exec_reloc@basic-cpu-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][34] ([i915#3281]) +8 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-4/igt@gem_exec_reloc@basic-cpu-gtt.html

  * igt@gem_exec_reloc@basic-write-cpu-active:
    - shard-dg1:          NOTRUN -> [SKIP][35] ([i915#3281]) +3 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg1-17/igt@gem_exec_reloc@basic-write-cpu-active.html

  * igt@gem_exec_schedule@preempt-queue-chain:
    - shard-dg1:          NOTRUN -> [SKIP][36] ([i915#4812])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg1-19/igt@gem_exec_schedule@preempt-queue-chain.html

  * igt@gem_lmem_swapping@parallel-random:
    - shard-glk:          NOTRUN -> [SKIP][37] ([i915#17503] / [i915#4613]) +2 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk6/igt@gem_lmem_swapping@parallel-random.html
    - shard-mtlp:         NOTRUN -> [SKIP][38] ([i915#4613])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-mtlp-1/igt@gem_lmem_swapping@parallel-random.html

  * igt@gem_lmem_swapping@parallel-random-verify:
    - shard-rkl:          NOTRUN -> [SKIP][39] ([i915#4613]) +3 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-5/igt@gem_lmem_swapping@parallel-random-verify.html
    - shard-tglu-1:       NOTRUN -> [SKIP][40] ([i915#4613]) +2 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-1/igt@gem_lmem_swapping@parallel-random-verify.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][41] ([i915#4613]) +3 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-9/igt@gem_lmem_swapping@parallel-random-verify-ccs.html

  * igt@gem_lmem_swapping@smem-oom:
    - shard-glk11:        NOTRUN -> [SKIP][42] ([i915#17503])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk11/igt@gem_lmem_swapping@smem-oom.html

  * igt@gem_madvise@dontneed-before-pwrite:
    - shard-rkl:          NOTRUN -> [SKIP][43] ([i915#3282]) +4 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-4/igt@gem_madvise@dontneed-before-pwrite.html

  * igt@gem_media_vme:
    - shard-tglu-1:       NOTRUN -> [SKIP][44] ([i915#284])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-1/igt@gem_media_vme.html
    - shard-glk:          NOTRUN -> [SKIP][45] ([i915#17543])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk4/igt@gem_media_vme.html

  * igt@gem_mmap_gtt@coherency:
    - shard-rkl:          NOTRUN -> [SKIP][46] ([i915#17429])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-3/igt@gem_mmap_gtt@coherency.html
    - shard-tglu:         NOTRUN -> [SKIP][47] ([i915#17429])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-3/igt@gem_mmap_gtt@coherency.html

  * igt@gem_mmap_gtt@flink-race:
    - shard-dg1:          NOTRUN -> [SKIP][48] ([i915#4077]) +6 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg1-17/igt@gem_mmap_gtt@flink-race.html

  * igt@gem_mmap_wc@write-read:
    - shard-dg1:          NOTRUN -> [SKIP][49] ([i915#4083]) +4 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg1-19/igt@gem_mmap_wc@write-read.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-display:
    - shard-dg1:          NOTRUN -> [SKIP][50] ([i915#3282]) +2 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg1-17/igt@gem_partial_pwrite_pread@writes-after-reads-display.html

  * igt@gem_pxp@hw-rejects-pxp-buffer:
    - shard-rkl:          NOTRUN -> [SKIP][51] ([i915#13717])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-4/igt@gem_pxp@hw-rejects-pxp-buffer.html

  * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
    - shard-rkl:          [PASS][52] -> [ABORT][53] ([i915#15131])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-rkl-7/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-1/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html
    - shard-dg1:          NOTRUN -> [SKIP][54] ([i915#4270])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg1-17/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html

  * igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
    - shard-glk:          NOTRUN -> [SKIP][55] ([i915#17521]) +2 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk2/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html

  * igt@gem_readwrite@read-bad-handle:
    - shard-mtlp:         NOTRUN -> [SKIP][56] ([i915#3282]) +2 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-mtlp-1/igt@gem_readwrite@read-bad-handle.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-y-tiled-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][57] ([i915#8428])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-mtlp-7/igt@gem_render_copy@y-tiled-mc-ccs-to-y-tiled-ccs.html

  * igt@gem_render_copy@y-tiled-to-vebox-y-tiled:
    - shard-glk:          NOTRUN -> [SKIP][58] ([i915#17492]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk4/igt@gem_render_copy@y-tiled-to-vebox-y-tiled.html

  * igt@gem_tiled_pread_basic@basic:
    - shard-rkl:          NOTRUN -> [SKIP][59] ([i915#15656])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-7/igt@gem_tiled_pread_basic@basic.html

  * igt@gem_tiled_pread_pwrite:
    - shard-mtlp:         NOTRUN -> [SKIP][60] ([i915#4079])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-mtlp-1/igt@gem_tiled_pread_pwrite.html

  * igt@gem_userptr_blits@access-control:
    - shard-tglu-1:       NOTRUN -> [SKIP][61] ([i915#3297])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-1/igt@gem_userptr_blits@access-control.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-rkl:          NOTRUN -> [SKIP][62] ([i915#3297]) +1 other test skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-3/igt@gem_userptr_blits@create-destroy-unsync.html
    - shard-tglu:         NOTRUN -> [SKIP][63] ([i915#3297]) +2 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-3/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-mtlp:         NOTRUN -> [SKIP][64] ([i915#3297]) +1 other test skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-mtlp-7/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@forbidden-operations:
    - shard-rkl:          NOTRUN -> [SKIP][65] ([i915#3282] / [i915#3297])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-3/igt@gem_userptr_blits@forbidden-operations.html

  * igt@gem_userptr_blits@readonly-pwrite-unsync:
    - shard-dg1:          NOTRUN -> [SKIP][66] ([i915#3297]) +2 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg1-19/igt@gem_userptr_blits@readonly-pwrite-unsync.html

  * igt@gen3_mixed_blits:
    - shard-glk:          NOTRUN -> [SKIP][67] ([i915#17688])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk2/igt@gen3_mixed_blits.html

  * igt@gen3_render_tiledx_blits:
    - shard-glk:          NOTRUN -> [SKIP][68] ([i915#17511])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk9/igt@gen3_render_tiledx_blits.html

  * igt@gen7_exec_parse@basic-offset:
    - shard-rkl:          NOTRUN -> [SKIP][69] ([i915#17455]) +1 other test skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-3/igt@gen7_exec_parse@basic-offset.html

  * igt@gen7_exec_parse@batch-without-end:
    - shard-glk:          NOTRUN -> [SKIP][70] ([i915#17505])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk4/igt@gen7_exec_parse@batch-without-end.html
    - shard-tglu-1:       NOTRUN -> [SKIP][71] ([i915#17455]) +2 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-1/igt@gen7_exec_parse@batch-without-end.html

  * igt@gen7_exec_parse@oacontrol-tracking:
    - shard-glk10:        NOTRUN -> [SKIP][72] ([i915#17505])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk10/igt@gen7_exec_parse@oacontrol-tracking.html

  * igt@gen9_exec_parse@batch-without-end:
    - shard-dg1:          NOTRUN -> [SKIP][73] ([i915#2527])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg1-19/igt@gen9_exec_parse@batch-without-end.html

  * igt@gen9_exec_parse@batch-zero-length:
    - shard-mtlp:         NOTRUN -> [SKIP][74] ([i915#2856])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-mtlp-7/igt@gen9_exec_parse@batch-zero-length.html

  * igt@gen9_exec_parse@bb-large:
    - shard-tglu:         NOTRUN -> [SKIP][75] ([i915#2527] / [i915#2856]) +3 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-9/igt@gen9_exec_parse@bb-large.html

  * igt@gen9_exec_parse@shadow-peek:
    - shard-rkl:          NOTRUN -> [SKIP][76] ([i915#2527]) +1 other test skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-5/igt@gen9_exec_parse@shadow-peek.html
    - shard-tglu-1:       NOTRUN -> [SKIP][77] ([i915#2527] / [i915#2856])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-1/igt@gen9_exec_parse@shadow-peek.html

  * igt@gpu_buddy@gpu_buddy:
    - shard-rkl:          NOTRUN -> [SKIP][78] ([i915#15678])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-7/igt@gpu_buddy@gpu_buddy.html

  * igt@i915_drm_fdinfo@most-busy-check-all@vcs1:
    - shard-dg1:          NOTRUN -> [SKIP][79] ([i915#14073]) +5 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg1-17/igt@i915_drm_fdinfo@most-busy-check-all@vcs1.html

  * igt@i915_fb_tiling@basic-x-tiling:
    - shard-mtlp:         NOTRUN -> [SKIP][80] ([i915#13786])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-mtlp-7/igt@i915_fb_tiling@basic-x-tiling.html

  * igt@i915_pm_freq_api@freq-reset:
    - shard-tglu:         NOTRUN -> [SKIP][81] ([i915#8399])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-8/igt@i915_pm_freq_api@freq-reset.html

  * igt@i915_pm_rc6_residency@media-rc6-accuracy:
    - shard-mtlp:         NOTRUN -> [SKIP][82] ([i915#16080] / [i915#16166])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-mtlp-1/igt@i915_pm_rc6_residency@media-rc6-accuracy.html
    - shard-glk:          NOTRUN -> [SKIP][83] ([i915#17541])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk6/igt@i915_pm_rc6_residency@media-rc6-accuracy.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-tglu-1:       NOTRUN -> [WARN][84] ([i915#13790] / [i915#2681]) +1 other test warn
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-1/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_query@query-topology-known-pci-ids:
    - shard-glk:          NOTRUN -> [SKIP][85] ([i915#17574])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk9/igt@i915_query@query-topology-known-pci-ids.html

  * igt@i915_selftest@perf:
    - shard-tglu:         NOTRUN -> [ABORT][86] ([i915#17018]) +1 other test abort
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-3/igt@i915_selftest@perf.html

  * igt@i915_suspend@sysfs-reader:
    - shard-glk11:        NOTRUN -> [INCOMPLETE][87] ([i915#13356] / [i915#16182] / [i915#4817])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk11/igt@i915_suspend@sysfs-reader.html

  * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
    - shard-mtlp:         NOTRUN -> [SKIP][88] ([i915#4212])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-mtlp-7/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-glk10:        NOTRUN -> [SKIP][89] ([i915#17668])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk10/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-dg1:          [PASS][90] -> [FAIL][91] ([i915#14888])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-dg1-17/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg1-15/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1:
    - shard-glk:          [PASS][92] -> [FAIL][93] ([i915#14888])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-glk4/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk4/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1.html
    - shard-dg1:          NOTRUN -> [FAIL][94] ([i915#14888])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg1-15/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-rkl:          NOTRUN -> [SKIP][95] ([i915#9531])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-8/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-0:
    - shard-rkl:          NOTRUN -> [SKIP][96] ([i915#4538] / [i915#5286]) +5 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-4/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
    - shard-tglu-1:       NOTRUN -> [SKIP][97] ([i915#17432] / [i915#5286])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-1/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-0:
    - shard-mtlp:         [PASS][98] -> [FAIL][99] ([i915#12469] / [i915#15733] / [i915#5138])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-mtlp-7/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-mtlp-1/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
    - shard-glk:          NOTRUN -> [SKIP][100] ([i915#17478]) +3 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk2/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
    - shard-tglu:         NOTRUN -> [SKIP][101] ([i915#17432] / [i915#5286]) +5 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-9/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-tglu-1:       NOTRUN -> [SKIP][102] ([i915#5286])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-1/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-glk10:        NOTRUN -> [SKIP][103] ([i915#17544])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk10/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-glk11:        NOTRUN -> [SKIP][104] ([i915#17478])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk11/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][105] ([i915#4538] / [i915#5286]) +2 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg1-17/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-mtlp:         [PASS][106] -> [FAIL][107] ([i915#15733] / [i915#5138])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-mtlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-mtlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-glk11:        NOTRUN -> [SKIP][108] ([i915#17500])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk11/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-tglu-1:       NOTRUN -> [SKIP][109] ([i915#17431])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-1/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][110] ([i915#17431] / [i915#3638]) +1 other test skip
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-7/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-dg1:          NOTRUN -> [SKIP][111] ([i915#3638])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg1-19/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-glk10:        NOTRUN -> [SKIP][112] ([i915#17500])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk10/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-mtlp:         NOTRUN -> [SKIP][113] ([i915#17431]) +1 other test skip
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-mtlp-1/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-glk:          NOTRUN -> [SKIP][114] ([i915#17524])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk4/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-tglu-1:       NOTRUN -> [SKIP][115] ([i915#3828]) +1 other test skip
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-1/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-glk:          NOTRUN -> [SKIP][116] ([i915#17500]) +9 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk2/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
    - shard-tglu:         NOTRUN -> [SKIP][117] ([i915#17431]) +2 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-9/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
    - shard-rkl:          NOTRUN -> [SKIP][118] ([i915#4538]) +4 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-3/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
    - shard-tglu-1:       NOTRUN -> [SKIP][119] ([i915#17432]) +1 other test skip
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-1/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-rkl:          NOTRUN -> [SKIP][120] ([i915#17432])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-4/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg1:          NOTRUN -> [SKIP][121] ([i915#4538]) +2 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg1-19/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
    - shard-tglu:         NOTRUN -> [SKIP][122] ([i915#17432]) +5 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-8/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-mtlp:         NOTRUN -> [SKIP][123] ([i915#17432]) +3 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-mtlp-7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][124] ([i915#10307] / [i915#10434] / [i915#6095]) +4 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-4/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1:
    - shard-glk10:        NOTRUN -> [SKIP][125] ([i915#17491]) +9 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk10/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2:
    - shard-glk:          NOTRUN -> [SKIP][126] ([i915#17490] / [i915#17491]) +17 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk2/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][127] ([i915#12313]) +1 other test skip
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-3/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
    - shard-rkl:          NOTRUN -> [SKIP][128] ([i915#12313])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-3/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-glk:          NOTRUN -> [SKIP][129] ([i915#17525]) +2 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk6/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [SKIP][130] ([i915#6095]) +186 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg1-12/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs:
    - shard-glk11:        NOTRUN -> [SKIP][131] ([i915#17490] / [i915#17491]) +1 other test skip
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk11/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][132] ([i915#6095]) +14 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-1/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc:
    - shard-tglu:         NOTRUN -> [SKIP][133] ([i915#6095]) +64 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][134] ([i915#12805]) +1 other test skip
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][135] ([i915#13356] / [i915#15582]) +2 other tests incomplete
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk6/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
    - shard-rkl:          [PASS][136] -> [INCOMPLETE][137] ([i915#15582])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-rkl-5/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][138] ([i915#15582])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][139] ([i915#6095]) +3 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-3/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-glk11:        NOTRUN -> [SKIP][140] ([i915#17525])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk11/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs:
    - shard-glk10:        NOTRUN -> [SKIP][141] ([i915#17490] / [i915#17491]) +3 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk10/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2:
    - shard-glk:          NOTRUN -> [SKIP][142] ([i915#17491]) +46 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][143] ([i915#6095]) +43 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-4/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][144] ([i915#14098] / [i915#6095]) +32 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-3/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][145] ([i915#6095]) +29 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-mtlp-1/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-edp-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][146] ([i915#12313])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-mtlp-7/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-c-hdmi-a-1:
    - shard-glk11:        NOTRUN -> [SKIP][147] ([i915#17491]) +6 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk11/igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][148] ([i915#10307] / [i915#6095]) +98 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-4/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_cdclk@mode-rejected-max-dotclock:
    - shard-rkl:          NOTRUN -> [SKIP][149] ([i915#17099])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-7/igt@kms_cdclk@mode-rejected-max-dotclock.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-tglu-1:       NOTRUN -> [SKIP][150] ([i915#3742])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-1/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@plane-scaling:
    - shard-dg1:          NOTRUN -> [SKIP][151] ([i915#3742])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg1-17/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_audio@hdmi-audio-after-suspend:
    - shard-glk10:        NOTRUN -> [SKIP][152] ([i915#17483]) +1 other test skip
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk10/igt@kms_chamelium_audio@hdmi-audio-after-suspend.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-tglu-1:       NOTRUN -> [SKIP][153] ([i915#17427])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-1/igt@kms_chamelium_color@ctm-green-to-red.html
    - shard-glk:          NOTRUN -> [SKIP][154] ([i915#17489])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk4/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_color@degamma:
    - shard-rkl:          NOTRUN -> [SKIP][155] ([i915#17427]) +2 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-3/igt@kms_chamelium_color@degamma.html
    - shard-tglu:         NOTRUN -> [SKIP][156] ([i915#17427]) +2 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-3/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_color_pipeline@plane-ctm3x4:
    - shard-glk:          NOTRUN -> [SKIP][157] ([i915#17497]) +1 other test skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk2/igt@kms_chamelium_color_pipeline@plane-ctm3x4.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim:
    - shard-dg1:          NOTRUN -> [SKIP][158] ([i915#17427]) +1 other test skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg1-19/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d:
    - shard-glk11:        NOTRUN -> [SKIP][159] ([i915#17497])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk11/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4:
    - shard-tglu-1:       NOTRUN -> [SKIP][160] ([i915#16471] / [i915#17427])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-1/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d:
    - shard-mtlp:         NOTRUN -> [SKIP][161] ([i915#16464] / [i915#16471] / [i915#17427]) +1 other test skip
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-mtlp-1/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d:
    - shard-dg1:          NOTRUN -> [SKIP][162] ([i915#16471] / [i915#17427])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg1-19/igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4:
    - shard-rkl:          NOTRUN -> [SKIP][163] ([i915#16471] / [i915#17427])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-3/igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4.html
    - shard-tglu:         NOTRUN -> [SKIP][164] ([i915#16471] / [i915#17427]) +2 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-3/igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4.html

  * igt@kms_chamelium_edid@hdmi-edid-read:
    - shard-rkl:          NOTRUN -> [SKIP][165] ([i915#11151] / [i915#7828]) +6 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-8/igt@kms_chamelium_edid@hdmi-edid-read.html

  * igt@kms_chamelium_edid@vga-edid-read:
    - shard-dg1:          NOTRUN -> [SKIP][166] ([i915#11151] / [i915#7828]) +2 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg1-17/igt@kms_chamelium_edid@vga-edid-read.html

  * igt@kms_chamelium_hpd@hdmi-hpd-after-runtime-suspend-d3hot:
    - shard-tglu:         NOTRUN -> [SKIP][167] ([i915#11151])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-9/igt@kms_chamelium_hpd@hdmi-hpd-after-runtime-suspend-d3hot.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-glk:          NOTRUN -> [SKIP][168] ([i915#17483]) +8 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk6/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-tglu-1:       NOTRUN -> [SKIP][169] ([i915#11151] / [i915#7828]) +4 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-1/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][170] ([i915#11151] / [i915#7828]) +2 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-mtlp-7/igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode.html

  * igt@kms_chamelium_hpd@vga-hpd-without-ddc:
    - shard-tglu:         NOTRUN -> [SKIP][171] ([i915#11151] / [i915#7828]) +6 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-9/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html

  * igt@kms_color@background-color:
    - shard-dg2:          [PASS][172] -> [SKIP][173] ([i915#17373])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-dg2-3/igt@kms_color@background-color.html
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-7/igt@kms_color@background-color.html

  * igt@kms_color@ctm-signed:
    - shard-dg2:          [PASS][174] -> [SKIP][175] ([i915#12655] / [i915#17373])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-dg2-1/igt@kms_color@ctm-signed.html
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-7/igt@kms_color@ctm-signed.html

  * igt@kms_color@deep-color:
    - shard-rkl:          NOTRUN -> [SKIP][176] ([i915#12655] / [i915#3555])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-7/igt@kms_color@deep-color.html

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d:
    - shard-glk:          NOTRUN -> [SKIP][177] ([i915#17510]) +2 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk4/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d.html

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d:
    - shard-glk11:        NOTRUN -> [SKIP][178] ([i915#17510])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk11/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d.html

  * igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d:
    - shard-glk10:        NOTRUN -> [SKIP][179] ([i915#17510])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk10/igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d.html

  * igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-d-plane-3:
    - shard-dg2:          NOTRUN -> [SKIP][180] ([i915#16990]) +7 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-8/igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-d-plane-3.html

  * igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-b-plane-3:
    - shard-tglu:         NOTRUN -> [SKIP][181] ([i915#16990]) +15 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-9/igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-b-plane-3.html

  * igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4:
    - shard-dg2:          [PASS][182] -> [SKIP][183] ([i915#15529]) +1 other test skip
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-dg2-6/igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4.html
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-7/igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4.html

  * igt@kms_content_protection@atomic-dpms-hdcp14:
    - shard-tglu-1:       NOTRUN -> [SKIP][184] ([i915#15865]) +1 other test skip
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-1/igt@kms_content_protection@atomic-dpms-hdcp14.html

  * igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:
    - shard-dg1:          NOTRUN -> [SKIP][185] ([i915#15330])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg1-19/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html
    - shard-tglu:         NOTRUN -> [SKIP][186] ([i915#15330])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-8/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-mtlp:         NOTRUN -> [SKIP][187] ([i915#15330] / [i915#3299])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-mtlp-1/igt@kms_content_protection@dp-mst-lic-type-1.html
    - shard-glk:          NOTRUN -> [SKIP][188] ([i915#17502])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk6/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-glk11:        NOTRUN -> [SKIP][189] ([i915#17502])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk11/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@dp-mst-type-1-suspend-resume:
    - shard-tglu-1:       NOTRUN -> [SKIP][190] ([i915#15330])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-1/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html

  * igt@kms_content_protection@legacy-hdcp14:
    - shard-glk:          NOTRUN -> [SKIP][191] ([i915#17508]) +1 other test skip
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk6/igt@kms_content_protection@legacy-hdcp14.html
    - shard-mtlp:         NOTRUN -> [SKIP][192] ([i915#15865]) +1 other test skip
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-mtlp-1/igt@kms_content_protection@legacy-hdcp14.html

  * igt@kms_content_protection@mei-interface:
    - shard-rkl:          NOTRUN -> [SKIP][193] ([i915#15865]) +5 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-4/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@type1:
    - shard-dg1:          NOTRUN -> [SKIP][194] ([i915#15865])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg1-19/igt@kms_content_protection@type1.html
    - shard-tglu:         NOTRUN -> [SKIP][195] ([i915#15865]) +3 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-8/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-glk:          NOTRUN -> [SKIP][196] ([i915#17533])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk9/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-offscreen-max-size:
    - shard-glk11:        NOTRUN -> [SKIP][197] ([i915#17504])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk11/igt@kms_cursor_crc@cursor-offscreen-max-size.html

  * igt@kms_cursor_crc@cursor-onscreen-128x42:
    - shard-rkl:          [PASS][198] -> [FAIL][199] ([i915#13566]) +1 other test fail
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-rkl-2/igt@kms_cursor_crc@cursor-onscreen-128x42.html
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-2/igt@kms_cursor_crc@cursor-onscreen-128x42.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-rkl:          NOTRUN -> [SKIP][200] ([i915#3555]) +3 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-4/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-mtlp:         NOTRUN -> [SKIP][201] ([i915#13049] / [i915#3359])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-mtlp-7/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-32x10:
    - shard-glk10:        NOTRUN -> [SKIP][202] ([i915#17504])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk10/igt@kms_cursor_crc@cursor-random-32x10.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-rkl:          NOTRUN -> [SKIP][203] ([i915#13049]) +1 other test skip
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-3/igt@kms_cursor_crc@cursor-random-512x170.html
    - shard-tglu:         NOTRUN -> [SKIP][204] ([i915#13049])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-3/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-random-max-size:
    - shard-tglu-1:       NOTRUN -> [SKIP][205] ([i915#3555]) +1 other test skip
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-1/igt@kms_cursor_crc@cursor-random-max-size.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-glk:          NOTRUN -> [SKIP][206] ([i915#17504]) +2 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk4/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_crc@cursor-sliding-256x85:
    - shard-rkl:          NOTRUN -> [FAIL][207] ([i915#13566]) +3 other tests fail
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-8/igt@kms_cursor_crc@cursor-sliding-256x85.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-dg1:          NOTRUN -> [SKIP][208] ([i915#3555]) +1 other test skip
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg1-19/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-mtlp:         NOTRUN -> [SKIP][209] ([i915#16119] / [i915#4213])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-mtlp-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
    - shard-mtlp:         NOTRUN -> [SKIP][210] ([i915#17428] / [i915#9809])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-mtlp-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-tglu-1:       NOTRUN -> [SKIP][211] ([i915#17428] / [i915#17454])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-1/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-tglu:         NOTRUN -> [SKIP][212] ([i915#17428] / [i915#17454]) +5 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-rkl:          NOTRUN -> [SKIP][213] ([i915#9723])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-8/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dp_link_training@non-uhbr-mst-direct-train:
    - shard-dg1:          NOTRUN -> [SKIP][214] ([i915#17287])
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg1-17/igt@kms_dp_link_training@non-uhbr-mst-direct-train.html

  * igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train:
    - shard-mtlp:         NOTRUN -> [SKIP][215] ([i915#17291])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-mtlp-1/igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train.html
    - shard-glk:          NOTRUN -> [SKIP][216] ([i915#17616])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk6/igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-glk:          NOTRUN -> [SKIP][217] ([i915#17664])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk4/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dp_link_training@non-uhbr-sst-direct-train:
    - shard-glk:          NOTRUN -> [SKIP][218] ([i915#17506])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk2/igt@kms_dp_link_training@non-uhbr-sst-direct-train.html
    - shard-tglu:         NOTRUN -> [SKIP][219] ([i915#17286])
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-9/igt@kms_dp_link_training@non-uhbr-sst-direct-train.html

  * igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train:
    - shard-glk11:        NOTRUN -> [SKIP][220] ([i915#17531])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk11/igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train.html

  * igt@kms_dp_link_training@uhbr-mst-direct-train:
    - shard-tglu-1:       NOTRUN -> [SKIP][221] ([i915#17285])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-1/igt@kms_dp_link_training@uhbr-mst-direct-train.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-rkl:          NOTRUN -> [SKIP][222] ([i915#13748])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-3/igt@kms_dp_link_training@uhbr-sst.html
    - shard-tglu:         NOTRUN -> [SKIP][223] ([i915#13748])
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-3/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-glk:          NOTRUN -> [SKIP][224] ([i915#17625])
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk9/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-rkl:          NOTRUN -> [SKIP][225] ([i915#13707])
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-7/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dsc@dsc-basic:
    - shard-tglu-1:       NOTRUN -> [SKIP][226] ([i915#16361])
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-1/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc-bigjoiner:
    - shard-glk10:        NOTRUN -> [SKIP][227] ([i915#17458])
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk10/igt@kms_dsc@dsc-fractional-bpp-with-bpc-bigjoiner.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-tglu:         NOTRUN -> [SKIP][228] ([i915#16361]) +1 other test skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-3/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_dsc@dsc-with-output-formats-bigjoiner:
    - shard-mtlp:         NOTRUN -> [SKIP][229] ([i915#16361]) +2 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-mtlp-1/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html

  * igt@kms_dsc@dsc-with-output-formats-ultrajoiner:
    - shard-glk:          NOTRUN -> [SKIP][230] ([i915#17458]) +3 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk2/igt@kms_dsc@dsc-with-output-formats-ultrajoiner.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner:
    - shard-rkl:          NOTRUN -> [SKIP][231] ([i915#16361]) +2 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-8/igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner.html

  * igt@kms_fbcon_fbt@psr:
    - shard-glk:          NOTRUN -> [SKIP][232] ([i915#17516])
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk6/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@chamelium:
    - shard-tglu:         NOTRUN -> [SKIP][233] ([i915#2065])
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-8/igt@kms_feature_discovery@chamelium.html
    - shard-dg1:          NOTRUN -> [SKIP][234] ([i915#16084])
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg1-19/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-2x:
    - shard-rkl:          NOTRUN -> [SKIP][235] ([i915#16081])
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-3/igt@kms_feature_discovery@display-2x.html
    - shard-tglu:         NOTRUN -> [SKIP][236] ([i915#16081])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-3/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@display-3x:
    - shard-tglu-1:       NOTRUN -> [SKIP][237] ([i915#16081]) +1 other test skip
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-1/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-glk:          NOTRUN -> [SKIP][238] ([i915#17666])
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk4/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@psr1:
    - shard-glk10:        NOTRUN -> [SKIP][239] ([i915#17707])
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk10/igt@kms_feature_discovery@psr1.html

  * igt@kms_feature_discovery@psr2:
    - shard-tglu:         NOTRUN -> [SKIP][240] ([i915#658])
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-9/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][241] ([i915#9934]) +2 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg1-19/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - shard-rkl:          NOTRUN -> [SKIP][242] ([i915#9934]) +8 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-4/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
    - shard-tglu-1:       NOTRUN -> [SKIP][243] ([i915#3637] / [i915#9934]) +1 other test skip
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-1/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html

  * igt@kms_flip@2x-plain-flip:
    - shard-mtlp:         NOTRUN -> [SKIP][244] ([i915#3637] / [i915#9934]) +1 other test skip
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-mtlp-7/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-tglu:         NOTRUN -> [SKIP][245] ([i915#3637] / [i915#9934]) +5 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-9/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@basic-flip-vs-dpms:
    - shard-dg2:          [PASS][246] -> [SKIP][247] ([i915#5354]) +5 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-dg2-6/igt@kms_flip@basic-flip-vs-dpms.html
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-7/igt@kms_flip@basic-flip-vs-dpms.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-dg2:          [PASS][248] -> [SKIP][249] ([i915#3555] / [i915#8813]) +1 other test skip
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-dg2-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
    - shard-tglu-1:       NOTRUN -> [SKIP][250] ([i915#15643])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-tglu:         NOTRUN -> [SKIP][251] ([i915#15643]) +3 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-9/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
    - shard-glk:          NOTRUN -> [SKIP][252] ([i915#17484]) +1 other test skip
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][253] ([i915#15643])
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-mtlp-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][254] ([i915#15643]) +1 other test skip
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg1-17/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][255] ([i915#3555] / [i915#8810] / [i915#8813]) +1 other test skip
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][256] ([i915#15643]) +5 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:
    - shard-glk:          NOTRUN -> [SKIP][257] ([i915#17522]) +1 other test skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
    - shard-glk:          NOTRUN -> [SKIP][258] ([i915#17493])
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html

  * igt@kms_force_connector_basic@force-connector-state:
    - shard-mtlp:         [PASS][259] -> [SKIP][260] ([i915#15672])
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-mtlp-7/igt@kms_force_connector_basic@force-connector-state.html
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-mtlp-1/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render:
    - shard-dg2:          [PASS][261] -> [SKIP][262] ([i915#16708]) +1 other test skip
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render.html
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-dg1:          NOTRUN -> [SKIP][263] ([i915#17428]) +44 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg1-19/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-tglu-1:       NOTRUN -> [SKIP][264] ([i915#17428]) +44 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary:
    - shard-dg2:          [PASS][265] -> [SKIP][266] ([i915#16708] / [i915#5354]) +4 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbchdr-farfromfence-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][267] ([i915#15990]) +10 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg1-17/igt@kms_frontbuffer_tracking@fbchdr-farfromfence-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-pwrite:
    - shard-mtlp:         NOTRUN -> [SKIP][268] ([i915#15989]) +16 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-render:
    - shard-dg1:          NOTRUN -> [SKIP][269] ([i915#15989]) +5 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg1-17/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-pwrite:
    - shard-glk:          [PASS][270] -> [SKIP][271] ([i915#17517]) +12 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-glk8/igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-pwrite.html
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk9/igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-pwrite.html
    - shard-rkl:          [PASS][272] -> [SKIP][273] ([i915#15989]) +4 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-rkl-1/igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-pwrite.html
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-3/igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
    - shard-rkl:          NOTRUN -> [SKIP][274] ([i915#15102]) +33 other tests skip
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][275] ([i915#15990] / [i915#8708]) +1 other test skip
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:
    - shard-rkl:          NOTRUN -> [SKIP][276] ([i915#17428]) +67 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-spr-indfb-draw-pwrite:
    - shard-glk11:        NOTRUN -> [SKIP][277] ([i915#17482]) +5 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk11/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-indfb-draw-pwrite:
    - shard-glk:          NOTRUN -> [SKIP][278] ([i915#17482]) +72 other tests skip
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk9/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-farfromfence-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][279] ([i915#15990]) +7 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-farfromfence-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4:
    - shard-tglu-1:       NOTRUN -> [SKIP][280] ([i915#5439])
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y:
    - shard-mtlp:         NOTRUN -> [SKIP][281] ([i915#10055])
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y.html

  * igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-shrfb-draw-mmap-gtt:
    - shard-tglu:         NOTRUN -> [SKIP][282] ([i915#15989]) +22 other tests skip
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-3/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-tglu-1:       NOTRUN -> [SKIP][283] ([i915#15989]) +6 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-1/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-glk:          NOTRUN -> [SKIP][284] ([i915#17517]) +35 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk2/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-tglu:         NOTRUN -> [SKIP][285] ([i915#17428]) +78 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-9/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-pwrite:
    - shard-rkl:          NOTRUN -> [SKIP][286] ([i915#15989]) +19 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-3/igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-glk11:        NOTRUN -> [SKIP][287] ([i915#17534])
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk11/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-cpu:
    - shard-dg1:          NOTRUN -> [SKIP][288] ([i915#15102]) +15 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg1-19/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-tglu-1:       NOTRUN -> [SKIP][289] ([i915#15102]) +17 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-fullscreen:
    - shard-glk10:        NOTRUN -> [SKIP][290] ([i915#17482]) +5 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk10/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][291] ([i915#15991] / [i915#17428] / [i915#1825]) +8 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-mtlp-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-rkl:          NOTRUN -> [SKIP][292] ([i915#17428] / [i915#1825]) +5 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][293] ([i915#15990] / [i915#8708]) +5 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary:
    - shard-tglu:         NOTRUN -> [SKIP][294] ([i915#15102]) +41 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-9/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-shrfb-msflip-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][295] ([i915#15991] / [i915#17428]) +9 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-mtlp-7/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery:
    - shard-rkl:          [PASS][296] -> [INCOMPLETE][297] ([i915#17110])
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-rkl-4/igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery.html
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-7/igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-mtlp:         NOTRUN -> [SKIP][298] ([i915#15725])
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-mtlp-1/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@bpc-switch:
    - shard-dg1:          NOTRUN -> [SKIP][299] ([i915#3555] / [i915#8228])
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg1-17/igt@kms_hdr@bpc-switch.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][300] ([i915#3555] / [i915#8228]) +1 other test skip
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-3/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@invalid-hdr:
    - shard-rkl:          NOTRUN -> [SKIP][301] ([i915#16644] / [i915#3555] / [i915#8228])
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-8/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@static-swap:
    - shard-glk:          NOTRUN -> [SKIP][302] ([i915#17498]) +1 other test skip
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk4/igt@kms_hdr@static-swap.html
    - shard-tglu-1:       NOTRUN -> [SKIP][303] ([i915#3555] / [i915#8228])
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-1/igt@kms_hdr@static-swap.html

  * igt@kms_invalid_mode@bad-hsync-end:
    - shard-dg2:          [PASS][304] -> [SKIP][305] ([i915#16746] / [i915#3555]) +2 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-dg2-1/igt@kms_invalid_mode@bad-hsync-end.html
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-7/igt@kms_invalid_mode@bad-hsync-end.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-glk:          NOTRUN -> [SKIP][306] ([i915#17567])
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk2/igt@kms_joiner@basic-ultra-joiner.html
    - shard-tglu:         NOTRUN -> [SKIP][307] ([i915#15458])
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-9/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-mtlp:         NOTRUN -> [SKIP][308] ([i915#15458])
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-mtlp-7/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][309] ([i915#15638] / [i915#15722])
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-9/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_lease@lease-revoke:
    - shard-dg2:          [PASS][310] -> [SKIP][311] ([i915#17356]) +45 other tests skip
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-dg2-3/igt@kms_lease@lease-revoke.html
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-7/igt@kms_lease@lease-revoke.html

  * igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes:
    - shard-dg1:          NOTRUN -> [SKIP][312] ([i915#17455]) +3 other tests skip
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg1-17/igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes.html

  * igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c:
    - shard-tglu:         NOTRUN -> [SKIP][313] ([i915#17455]) +5 other tests skip
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-8/igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c.html

  * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
    - shard-mtlp:         NOTRUN -> [SKIP][314] ([i915#14712])
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-mtlp-7/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping:
    - shard-glk:          NOTRUN -> [SKIP][315] ([i915#17479])
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk2/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping:
    - shard-tglu:         NOTRUN -> [SKIP][316] ([i915#15709]) +5 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-3/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-b-plane-5:
    - shard-dg2:          NOTRUN -> [SKIP][317] ([i915#16386]) +1 other test skip
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-4/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-b-plane-5.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping:
    - shard-tglu-1:       NOTRUN -> [SKIP][318] ([i915#15709]) +2 other tests skip
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-1/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-linear-modifier:
    - shard-dg2:          [PASS][319] -> [SKIP][320] ([i915#8825]) +2 other tests skip
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-dg2-6/igt@kms_plane@pixel-format-linear-modifier.html
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-7/igt@kms_plane@pixel-format-linear-modifier.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier:
    - shard-rkl:          NOTRUN -> [SKIP][321] ([i915#15709]) +3 other tests skip
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-3/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier:
    - shard-mtlp:         NOTRUN -> [SKIP][322] ([i915#15709])
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-mtlp-7/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier.html

  * igt@kms_plane@pixel-format-y-tiled-modifier@pipe-a-plane-4:
    - shard-glk:          NOTRUN -> [SKIP][323] ([i915#17494]) +1 other test skip
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk2/igt@kms_plane@pixel-format-y-tiled-modifier@pipe-a-plane-4.html

  * igt@kms_plane@pixel-format-y-tiled-modifier@pipe-b-plane-7:
    - shard-tglu:         NOTRUN -> [SKIP][324] ([i915#16386]) +1 other test skip
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-9/igt@kms_plane@pixel-format-y-tiled-modifier@pipe-b-plane-7.html

  * igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping:
    - shard-dg1:          NOTRUN -> [SKIP][325] ([i915#15709])
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg1-19/igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping.html

  * igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y:
    - shard-dg1:          NOTRUN -> [SKIP][326] ([i915#16112])
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg1-17/igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y.html

  * igt@kms_plane@plane-panning-bottom-right@pipe-b:
    - shard-mtlp:         NOTRUN -> [FAIL][327] ([i915#15733]) +2 other tests fail
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-mtlp-1/igt@kms_plane@plane-panning-bottom-right@pipe-b.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-dg1:          NOTRUN -> [SKIP][328] ([i915#13958])
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg1-17/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_plane_multiple@tiling-4:
    - shard-glk:          NOTRUN -> [SKIP][329] ([i915#17542])
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk6/igt@kms_plane_multiple@tiling-4.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-tglu-1:       NOTRUN -> [SKIP][330] ([i915#14259])
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-1/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-d:
    - shard-dg2:          [PASS][331] -> [SKIP][332] ([i915#15329] / [i915#17356]) +4 other tests skip
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-dg2-3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-d.html
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-d.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:
    - shard-dg1:          NOTRUN -> [SKIP][333] ([i915#15329] / [i915#3555])
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg1-19/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html
    - shard-tglu:         NOTRUN -> [SKIP][334] ([i915#15329] / [i915#3555])
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-8/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b:
    - shard-tglu:         NOTRUN -> [SKIP][335] ([i915#15329]) +3 other tests skip
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-8/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:
    - shard-rkl:          NOTRUN -> [SKIP][336] ([i915#15329]) +7 other tests skip
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-8/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d:
    - shard-dg1:          NOTRUN -> [SKIP][337] ([i915#15329]) +8 other tests skip
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg1-17/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20:
    - shard-dg2:          [PASS][338] -> [SKIP][339] ([i915#15329] / [i915#17356] / [i915#9423]) +1 other test skip
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-dg2-6/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20.html
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-7/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25:
    - shard-dg2:          [PASS][340] -> [SKIP][341] ([i915#15329] / [i915#17356] / [i915#6953] / [i915#9423])
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-dg2-6/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-7/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-scaler-unity-scaling:
    - shard-dg2:          [PASS][342] -> [SKIP][343] ([i915#15329] / [i915#17356] / [i915#3555] / [i915#9423]) +1 other test skip
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-dg2-3/igt@kms_plane_scaling@planes-scaler-unity-scaling.html
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-7/igt@kms_plane_scaling@planes-scaler-unity-scaling.html

  * igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-a:
    - shard-dg2:          [PASS][344] -> [SKIP][345] ([i915#15329]) +14 other tests skip
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-dg2-3/igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-a.html
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-7/igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-a.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-glk10:        NOTRUN -> [SKIP][346] ([i915#17462])
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk10/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-tglu-1:       NOTRUN -> [SKIP][347] ([i915#12343] / [i915#9812])
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-1/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-glk:          NOTRUN -> [SKIP][348] ([i915#17462])
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk9/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-dg1:          NOTRUN -> [SKIP][349] ([i915#12343] / [i915#5354])
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg1-19/igt@kms_pm_backlight@fade-with-dpms.html
    - shard-tglu:         NOTRUN -> [SKIP][350] ([i915#12343] / [i915#9812]) +1 other test skip
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-8/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][351] ([i915#12343] / [i915#5354])
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-3/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc5-dpms-negative:
    - shard-dg2:          [PASS][352] -> [SKIP][353] ([i915#13441])
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-dg2-6/igt@kms_pm_dc@dc5-dpms-negative.html
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-7/igt@kms_pm_dc@dc5-dpms-negative.html

  * igt@kms_pm_dc@dc5-psr-suspend-resume:
    - shard-glk:          NOTRUN -> [SKIP][354] ([i915#17495])
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk4/igt@kms_pm_dc@dc5-psr-suspend-resume.html
    - shard-tglu-1:       NOTRUN -> [SKIP][355] ([i915#16914])
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-1/igt@kms_pm_dc@dc5-psr-suspend-resume.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-tglu:         NOTRUN -> [FAIL][356] ([i915#16479])
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-9/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-dg1:          [PASS][357] -> [SKIP][358] ([i915#15073])
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-dg1-15/igt@kms_pm_rpm@dpms-lpsp.html
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg1-16/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@fences:
    - shard-mtlp:         NOTRUN -> [SKIP][359] ([i915#4077]) +2 other tests skip
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-mtlp-7/igt@kms_pm_rpm@fences.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-dg2:          [PASS][360] -> [SKIP][361] ([i915#15073]) +1 other test skip
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-dg2-4/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-5/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-tglu:         NOTRUN -> [SKIP][362] ([i915#15073]) +2 other tests skip
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-9/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-pc8-residency-stress:
    - shard-rkl:          NOTRUN -> [SKIP][363] ([i915#17434] / [i915#17450])
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-8/igt@kms_pm_rpm@modeset-pc8-residency-stress.html

  * igt@kms_pm_rpm@package-g7:
    - shard-tglu:         NOTRUN -> [SKIP][364] ([i915#15403])
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-3/igt@kms_pm_rpm@package-g7.html
    - shard-rkl:          NOTRUN -> [SKIP][365] ([i915#15403])
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-3/igt@kms_pm_rpm@package-g7.html

  * igt@kms_pm_rpm@system-suspend-idle:
    - shard-dg2:          [PASS][366] -> [SKIP][367] ([i915#9519])
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-dg2-6/igt@kms_pm_rpm@system-suspend-idle.html
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-7/igt@kms_pm_rpm@system-suspend-idle.html
    - shard-rkl:          [PASS][368] -> [INCOMPLETE][369] ([i915#14419])
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-rkl-2/igt@kms_pm_rpm@system-suspend-idle.html
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-4/igt@kms_pm_rpm@system-suspend-idle.html

  * igt@kms_properties@colorop-properties-atomic:
    - shard-glk:          NOTRUN -> [SKIP][370] ([i915#17481])
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk4/igt@kms_properties@colorop-properties-atomic.html

  * igt@kms_properties@plane-properties-legacy:
    - shard-dg2:          [PASS][371] -> [SKIP][372] ([i915#11521])
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-dg2-3/igt@kms_properties@plane-properties-legacy.html
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-7/igt@kms_properties@plane-properties-legacy.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:
    - shard-tglu:         NOTRUN -> [SKIP][373] ([i915#11520]) +4 other tests skip
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-9/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-mtlp:         NOTRUN -> [SKIP][374] ([i915#12316]) +4 other tests skip
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-mtlp-7/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
    - shard-glk11:        NOTRUN -> [SKIP][375] ([i915#11520]) +1 other test skip
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk11/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - shard-tglu-1:       NOTRUN -> [SKIP][376] ([i915#11520]) +2 other tests skip
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-1/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:
    - shard-rkl:          NOTRUN -> [SKIP][377] ([i915#11520]) +7 other tests skip
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-8/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][378] ([i915#9808])
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-mtlp-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-glk10:        NOTRUN -> [SKIP][379] ([i915#11520])
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk10/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:
    - shard-dg1:          NOTRUN -> [SKIP][380] ([i915#11520]) +3 other tests skip
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg1-17/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][381] ([i915#11520]) +4 other tests skip
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk9/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-glk:          NOTRUN -> [SKIP][382] ([i915#17546])
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk2/igt@kms_psr2_su@page_flip-nv12.html
    - shard-tglu:         NOTRUN -> [SKIP][383] ([i915#9683]) +1 other test skip
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-9/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-rkl:          NOTRUN -> [SKIP][384] ([i915#9683])
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-3/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr-primary-blt:
    - shard-dg1:          NOTRUN -> [SKIP][385] ([i915#1072] / [i915#9732]) +9 other tests skip
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg1-19/igt@kms_psr@fbc-psr-primary-blt.html

  * igt@kms_psr@fbc-psr-sprite-render:
    - shard-mtlp:         NOTRUN -> [SKIP][386] ([i915#9688]) +7 other tests skip
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-mtlp-7/igt@kms_psr@fbc-psr-sprite-render.html

  * igt@kms_psr@fbc-psr2-cursor-blt:
    - shard-tglu-1:       NOTRUN -> [SKIP][387] ([i915#9732]) +9 other tests skip
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-1/igt@kms_psr@fbc-psr2-cursor-blt.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-glk10:        NOTRUN -> [SKIP][388] ([i915#17480]) +1 other test skip
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk10/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-glk11:        NOTRUN -> [SKIP][389] ([i915#17480]) +1 other test skip
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk11/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_psr@pr-sprite-plane-move:
    - shard-tglu:         NOTRUN -> [SKIP][390] ([i915#9732]) +20 other tests skip
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-8/igt@kms_psr@pr-sprite-plane-move.html

  * igt@kms_psr@psr2-primary-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][391] ([i915#1072] / [i915#9732]) +14 other tests skip
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-3/igt@kms_psr@psr2-primary-mmap-gtt.html

  * igt@kms_psr@psr2-primary-render:
    - shard-glk:          NOTRUN -> [SKIP][392] ([i915#17480]) +15 other tests skip
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk6/igt@kms_psr@psr2-primary-render.html

  * igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:
    - shard-glk10:        NOTRUN -> [INCOMPLETE][393] ([i915#15500] / [i915#16184])
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk10/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html

  * igt@kms_rotation_crc@multiplane-rotation-cropping-top:
    - shard-glk11:        NOTRUN -> [INCOMPLETE][394] ([i915#15492] / [i915#16184])
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk11/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-dg1:          NOTRUN -> [SKIP][395] ([i915#5289])
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg1-17/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-mtlp:         NOTRUN -> [SKIP][396] ([i915#15867])
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-mtlp-7/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-glk:          NOTRUN -> [SKIP][397] ([i915#17488]) +1 other test skip
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-glk10:        NOTRUN -> [SKIP][398] ([i915#17488])
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk10/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-tglu-1:       NOTRUN -> [SKIP][399] ([i915#17432] / [i915#5289])
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-rkl:          NOTRUN -> [SKIP][400] ([i915#17432] / [i915#5289]) +1 other test skip
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-tglu:         NOTRUN -> [SKIP][401] ([i915#17432] / [i915#5289])
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-glk10:        NOTRUN -> [ABORT][402] ([i915#13179]) +1 other test abort
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk10/igt@kms_selftest@drm_framebuffer.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-mtlp:         NOTRUN -> [SKIP][403] ([i915#17445])
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-mtlp-7/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-rkl:          [PASS][404] -> [INCOMPLETE][405] ([i915#12276]) +1 other test incomplete
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-rkl-7/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-3/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-glk:          NOTRUN -> [SKIP][406] ([i915#17520]) +1 other test skip
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk2/igt@kms_vrr@flip-basic-fastset.html
    - shard-tglu:         NOTRUN -> [SKIP][407] ([i915#9906])
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-9/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@flip-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][408] ([i915#3555]) +5 other tests skip
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-8/igt@kms_vrr@flip-suspend.html

  * igt@kms_vrr@lobf:
    - shard-glk:          NOTRUN -> [SKIP][409] ([i915#17561])
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk6/igt@kms_vrr@lobf.html
    - shard-mtlp:         NOTRUN -> [SKIP][410] ([i915#11920])
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-mtlp-1/igt@kms_vrr@lobf.html

  * igt@kms_vrr@max-min:
    - shard-rkl:          NOTRUN -> [SKIP][411] ([i915#9906])
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-8/igt@kms_vrr@max-min.html

  * igt@perf@gen12-mi-rpc:
    - shard-glk:          NOTRUN -> [SKIP][412] ([i915#17536]) +1 other test skip
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk2/igt@perf@gen12-mi-rpc.html

  * igt@perf@per-context-mode-unprivileged:
    - shard-dg1:          NOTRUN -> [SKIP][413] ([i915#17455] / [i915#2433])
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg1-19/igt@perf@per-context-mode-unprivileged.html

  * igt@perf@unprivileged-single-ctx-counters:
    - shard-glk:          NOTRUN -> [SKIP][414] ([i915#17704])
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk6/igt@perf@unprivileged-single-ctx-counters.html

  * igt@perf_pmu@event-wait@rcs0:
    - shard-rkl:          NOTRUN -> [SKIP][415] ([i915#17416]) +1 other test skip
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-3/igt@perf_pmu@event-wait@rcs0.html
    - shard-tglu:         NOTRUN -> [SKIP][416] ([i915#17416]) +1 other test skip
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-3/igt@perf_pmu@event-wait@rcs0.html

  * igt@perf_pmu@module-unload:
    - shard-mtlp:         NOTRUN -> [FAIL][417] ([i915#17119])
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-mtlp-7/igt@perf_pmu@module-unload.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-glk:          NOTRUN -> [SKIP][418] ([i915#17583])
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk2/igt@perf_pmu@rc6-all-gts.html
    - shard-tglu:         NOTRUN -> [SKIP][419] ([i915#8516])
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-9/igt@perf_pmu@rc6-all-gts.html

  * igt@prime_mmap_kms@buffer-sharing:
    - shard-dg2:          [PASS][420] -> [SKIP][421] ([i915#17454])
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-dg2-3/igt@prime_mmap_kms@buffer-sharing.html
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-7/igt@prime_mmap_kms@buffer-sharing.html

  * igt@prime_udl@share-import-addfb:
    - shard-dg1:          NOTRUN -> [SKIP][422] ([i915#16420])
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg1-19/igt@prime_udl@share-import-addfb.html
    - shard-tglu:         NOTRUN -> [SKIP][423] ([i915#16420])
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-8/igt@prime_udl@share-import-addfb.html

  * igt@prime_vgem@basic-write:
    - shard-mtlp:         NOTRUN -> [SKIP][424] ([i915#10216] / [i915#3708])
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-mtlp-1/igt@prime_vgem@basic-write.html

  * igt@prime_vgem@coherency-gtt:
    - shard-tglu-1:       NOTRUN -> [SKIP][425] ([i915#17429] / [i915#17448])
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-1/igt@prime_vgem@coherency-gtt.html
    - shard-glk:          NOTRUN -> [SKIP][426] ([i915#17467]) +1 other test skip
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk4/igt@prime_vgem@coherency-gtt.html

  * igt@prime_vgem@fence-read-hang:
    - shard-mtlp:         NOTRUN -> [SKIP][427] ([i915#3708])
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-mtlp-1/igt@prime_vgem@fence-read-hang.html

  
#### Possible fixes ####

  * igt@fbdev@eof:
    - shard-dg2:          [SKIP][428] ([i915#2582]) -> [PASS][429] +1 other test pass
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-dg2-7/igt@fbdev@eof.html
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-8/igt@fbdev@eof.html

  * igt@gem_softpin@noreloc-s3:
    - shard-glk:          [INCOMPLETE][430] ([i915#13356] / [i915#13809] / [i915#16193]) -> [PASS][431]
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-glk8/igt@gem_softpin@noreloc-s3.html
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk9/igt@gem_softpin@noreloc-s3.html

  * igt@i915_selftest@live:
    - shard-tglu-1:       [ABORT][432] -> [PASS][433]
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-tglu-1/igt@i915_selftest@live.html
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-1/igt@i915_selftest@live.html

  * igt@i915_selftest@live@hangcheck:
    - shard-tglu-1:       [ABORT][434] ([i915#16666]) -> [PASS][435]
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-tglu-1/igt@i915_selftest@live@hangcheck.html
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-1/igt@i915_selftest@live@hangcheck.html

  * igt@i915_suspend@debugfs-reader:
    - shard-rkl:          [INCOMPLETE][436] ([i915#4817]) -> [PASS][437]
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-rkl-4/igt@i915_suspend@debugfs-reader.html
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-5/igt@i915_suspend@debugfs-reader.html

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-rkl:          [INCOMPLETE][438] ([i915#12761]) -> [PASS][439] +1 other test pass
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-rkl-3/igt@kms_async_flips@async-flip-suspend-resume.html
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-4/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - shard-dg2:          [SKIP][440] ([i915#17356]) -> [PASS][441] +28 other tests pass
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-dg2-7/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-8/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1:
    - shard-glk:          [INCOMPLETE][442] ([i915#13356] / [i915#15582]) -> [PASS][443]
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-glk8/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1.html
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk9/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_color@ctm-negative:
    - shard-dg2:          [SKIP][444] ([i915#12655] / [i915#17373]) -> [PASS][445] +1 other test pass
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-dg2-7/igt@kms_color@ctm-negative.html
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-4/igt@kms_color@ctm-negative.html

  * igt@kms_color_pipeline@plane-lut1d-ctm3x4:
    - shard-dg2:          [SKIP][446] ([i915#15529]) -> [PASS][447] +1 other test pass
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-dg2-7/igt@kms_color_pipeline@plane-lut1d-ctm3x4.html
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-8/igt@kms_color_pipeline@plane-lut1d-ctm3x4.html

  * igt@kms_cursor_crc@cursor-onscreen-128x42:
    - shard-tglu:         [FAIL][448] ([i915#13566]) -> [PASS][449] +1 other test pass
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-tglu-3/igt@kms_cursor_crc@cursor-onscreen-128x42.html
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-tglu-7/igt@kms_cursor_crc@cursor-onscreen-128x42.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-2:
    - shard-rkl:          [INCOMPLETE][450] ([i915#12358] / [i915#14152]) -> [PASS][451] +1 other test pass
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-rkl-3/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-2.html
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-7/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-2.html

  * igt@kms_cursor_edge_walk@256x256-left-edge:
    - shard-mtlp:         [INCOMPLETE][452] -> [PASS][453] +1 other test pass
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-mtlp-7/igt@kms_cursor_edge_walk@256x256-left-edge.html
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-mtlp-1/igt@kms_cursor_edge_walk@256x256-left-edge.html

  * igt@kms_flip@flip-vs-dpms-off-vs-modeset:
    - shard-dg2:          [SKIP][454] ([i915#5354]) -> [PASS][455]
   [454]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-dg2-7/igt@kms_flip@flip-vs-dpms-off-vs-modeset.html
   [455]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-8/igt@kms_flip@flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip_tiling@flip-change-tiling:
    - shard-dg2:          [SKIP][456] ([i915#3555]) -> [PASS][457]
   [456]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-dg2-7/igt@kms_flip_tiling@flip-change-tiling.html
   [457]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-8/igt@kms_flip_tiling@flip-change-tiling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2:          [SKIP][458] ([i915#16708] / [i915#5354]) -> [PASS][459] +2 other tests pass
   [458]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html
   [459]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-tiling-linear:
    - shard-rkl:          [SKIP][460] ([i915#15989]) -> [PASS][461] +6 other tests pass
   [460]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-rkl-7/igt@kms_frontbuffer_tracking@fbchdr-tiling-linear.html
   [461]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-tiling-linear.html

  * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-shrfb-draw-render:
    - shard-glk:          [SKIP][462] ([i915#17517]) -> [PASS][463] +2 other tests pass
   [462]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-glk2/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-shrfb-draw-render.html
   [463]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk8/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_hdr@static-toggle:
    - shard-rkl:          [SKIP][464] ([i915#16644] / [i915#3555] / [i915#8228]) -> [PASS][465]
   [464]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-rkl-7/igt@kms_hdr@static-toggle.html
   [465]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-6/igt@kms_hdr@static-toggle.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:
    - shard-dg2:          [SKIP][466] ([i915#11190] / [i915#17356]) -> [PASS][467] +1 other test pass
   [466]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-dg2-7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html
   [467]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-4/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier:
    - shard-dg2:          [SKIP][468] ([i915#8825]) -> [PASS][469] +1 other test pass
   [468]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-dg2-7/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier.html
   [469]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-4/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers:
    - shard-dg2:          [SKIP][470] ([i915#15329] / [i915#17356] / [i915#9423]) -> [PASS][471]
   [470]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-dg2-7/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers.html
   [471]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-8/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5:
    - shard-dg2:          [SKIP][472] ([i915#15329] / [i915#17356] / [i915#6953] / [i915#9423]) -> [PASS][473]
   [472]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-dg2-7/igt@kms_plane_scaling@planes-downscale-factor-0-5.html
   [473]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-4/igt@kms_plane_scaling@planes-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a:
    - shard-dg2:          [SKIP][474] ([i915#15329]) -> [PASS][475] +11 other tests pass
   [474]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-dg2-7/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a.html
   [475]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-4/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25:
    - shard-dg2:          [SKIP][476] ([i915#15329] / [i915#17356] / [i915#3555] / [i915#6953] / [i915#9423]) -> [PASS][477] +1 other test pass
   [476]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-dg2-7/igt@kms_plane_scaling@planes-upscale-factor-0-25.html
   [477]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-4/igt@kms_plane_scaling@planes-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-d:
    - shard-dg2:          [SKIP][478] ([i915#15329] / [i915#17356]) -> [PASS][479] +3 other tests pass
   [478]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-dg2-7/igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-d.html
   [479]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-4/igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-d.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-dg2:          [SKIP][480] ([i915#15073]) -> [PASS][481] +1 other test pass
   [480]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-dg2-1/igt@kms_pm_rpm@dpms-lpsp.html
   [481]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-4/igt@kms_pm_rpm@dpms-lpsp.html
    - shard-rkl:          [SKIP][482] ([i915#15073]) -> [PASS][483] +2 other tests pass
   [482]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-rkl-4/igt@kms_pm_rpm@dpms-lpsp.html
   [483]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-8/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-dg1:          [SKIP][484] ([i915#15073]) -> [PASS][485] +2 other tests pass
   [484]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-dg1-17/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [485]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg1-15/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-rkl:          [ABORT][486] ([i915#15132]) -> [PASS][487]
   [486]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-rkl-1/igt@kms_vblank@ts-continuation-suspend.html
   [487]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-8/igt@kms_vblank@ts-continuation-suspend.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@preservation-s3:
    - shard-mtlp:         [FAIL][488] ([i915#17176]) -> [ABORT][489] ([i915#17146]) +1 other test abort
   [488]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-mtlp-5/igt@gem_ctx_isolation@preservation-s3.html
   [489]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-mtlp-6/igt@gem_ctx_isolation@preservation-s3.html

  * igt@gem_ctx_sseu@engines:
    - shard-rkl:          [SKIP][490] ([i915#280]) -> [SKIP][491] ([i915#14544] / [i915#280])
   [490]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-rkl-7/igt@gem_ctx_sseu@engines.html
   [491]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-6/igt@gem_ctx_sseu@engines.html

  * igt@gem_eio@in-flight-suspend:
    - shard-rkl:          [INCOMPLETE][492] ([i915#13390] / [i915#17327]) -> [ABORT][493] ([i915#15131])
   [492]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-rkl-6/igt@gem_eio@in-flight-suspend.html
   [493]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-1/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_params@secure-non-master:
    - shard-rkl:          [SKIP][494] ([i915#17416]) -> [SKIP][495] ([i915#14544] / [i915#17416])
   [494]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-rkl-7/igt@gem_exec_params@secure-non-master.html
   [495]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-6/igt@gem_exec_params@secure-non-master.html

  * igt@gem_exec_reloc@basic-cpu:
    - shard-rkl:          [SKIP][496] ([i915#14544] / [i915#3281]) -> [SKIP][497] ([i915#3281])
   [496]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-rkl-6/igt@gem_exec_reloc@basic-cpu.html
   [497]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-1/igt@gem_exec_reloc@basic-cpu.html

  * igt@gem_exec_reloc@basic-write-read:
    - shard-rkl:          [SKIP][498] ([i915#3281]) -> [SKIP][499] ([i915#14544] / [i915#3281]) +2 other tests skip
   [498]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-rkl-5/igt@gem_exec_reloc@basic-write-read.html
   [499]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-6/igt@gem_exec_reloc@basic-write-read.html

  * igt@gem_lmem_swapping@heavy-multi:
    - shard-rkl:          [SKIP][500] ([i915#14544] / [i915#4613]) -> [SKIP][501] ([i915#4613])
   [500]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-rkl-6/igt@gem_lmem_swapping@heavy-multi.html
   [501]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-1/igt@gem_lmem_swapping@heavy-multi.html

  * igt@gem_lmem_swapping@parallel-random:
    - shard-rkl:          [SKIP][502] ([i915#4613]) -> [SKIP][503] ([i915#14544] / [i915#4613])
   [502]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-rkl-7/igt@gem_lmem_swapping@parallel-random.html
   [503]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-6/igt@gem_lmem_swapping@parallel-random.html

  * igt@gem_softpin@noreloc-s3:
    - shard-rkl:          [ABORT][504] ([i915#15131]) -> [INCOMPLETE][505] ([i915#13809] / [i915#16226])
   [504]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-rkl-1/igt@gem_softpin@noreloc-s3.html
   [505]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-3/igt@gem_softpin@noreloc-s3.html

  * igt@gem_tiled_pread_pwrite:
    - shard-rkl:          [SKIP][506] ([i915#3282]) -> [SKIP][507] ([i915#14544] / [i915#3282]) +1 other test skip
   [506]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-rkl-7/igt@gem_tiled_pread_pwrite.html
   [507]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-6/igt@gem_tiled_pread_pwrite.html

  * igt@gen9_exec_parse@bb-start-out:
    - shard-rkl:          [SKIP][508] ([i915#2527]) -> [SKIP][509] ([i915#14544] / [i915#2527])
   [508]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-rkl-7/igt@gen9_exec_parse@bb-start-out.html
   [509]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-6/igt@gen9_exec_parse@bb-start-out.html

  * igt@i915_pm_rc6_residency@media-rc6-accuracy:
    - shard-rkl:          [SKIP][510] ([i915#16080] / [i915#16166]) -> [SKIP][511] ([i915#14544] / [i915#16080] / [i915#16166])
   [510]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-rkl-7/igt@i915_pm_rc6_residency@media-rc6-accuracy.html
   [511]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-6/igt@i915_pm_rc6_residency@media-rc6-accuracy.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
    - shard-dg2:          [SKIP][512] ([i915#17431]) -> [SKIP][513] ([i915#17356])
   [512]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-dg2-6/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html
   [513]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-7/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-0:
    - shard-rkl:          [SKIP][514] ([i915#4538] / [i915#5286]) -> [SKIP][515] ([i915#14544] / [i915#4538] / [i915#5286])
   [514]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-rkl-7/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html
   [515]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-6/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-dg2:          [SKIP][516] ([i915#17356]) -> [SKIP][517] ([i915#17431]) +1 other test skip
   [516]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-dg2-7/igt@kms_big_fb@linear-16bpp-rotate-90.html
   [517]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-4/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-rkl:          [SKIP][518] ([i915#17431] / [i915#3638]) -> [SKIP][519] ([i915#14544] / [i915#17431] / [i915#3638]) +1 other test skip
   [518]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-rkl-7/igt@kms_big_fb@linear-8bpp-rotate-270.html
   [519]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-6/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-dg2:          [SKIP][520] ([i915#3828]) -> [SKIP][521] ([i915#17356]) +1 other test skip
   [520]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-dg2-6/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html
   [521]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-7/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2:          [SKIP][522] ([i915#5190]) -> [SKIP][523] ([i915#17356] / [i915#5190]) +1 other test skip
   [522]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-dg2-1/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [523]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-7/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-dg2:          [SKIP][524] ([i915#17356] / [i915#5190]) -> [SKIP][525] ([i915#4538] / [i915#5190]) +6 other tests skip
   [524]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-dg2-7/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [525]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2:          [SKIP][526] ([i915#4538] / [i915#5190]) -> [SKIP][527] ([i915#17356] / [i915#5190]) +7 other tests skip
   [526]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-dg2-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [527]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-7/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-rkl:          [SKIP][528] ([i915#4538]) -> [SKIP][529] ([i915#14544] / [i915#4538]) +1 other test skip
   [528]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-rkl-7/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html
   [529]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-rkl:          [SKIP][530] ([i915#14544] / [i915#4538]) -> [SKIP][531] ([i915#4538])
   [530]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-rkl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [531]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-rkl:          [SKIP][532] ([i915#12313]) -> [SKIP][533] ([i915#12313] / [i915#14544])
   [532]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-rkl-7/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
   [533]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:
    - shard-dg2:          [SKIP][534] ([i915#17356]) -> [SKIP][535] ([i915#10307] / [i915#6095]) +6 other tests skip
   [534]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-dg2-7/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html
   [535]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-8/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:
    - shard-dg2:          [SKIP][536] ([i915#10307] / [i915#10434] / [i915#6095]) -> [SKIP][537] ([i915#17356])
   [536]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-dg2-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html
   [537]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-dg2:          [SKIP][538] ([i915#12805]) -> [SKIP][539] ([i915#17356])
   [538]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-dg2-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [539]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
    - shard-dg2:          [SKIP][540] ([i915#6095]) -> [SKIP][541] ([i915#17356])
   [540]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-dg2-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html
   [541]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-dg2:          [SKIP][542] ([i915#17356]) -> [SKIP][543] ([i915#12313])
   [542]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-dg2-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
   [543]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:
    - shard-rkl:          [SKIP][544] ([i915#14098] / [i915#6095]) -> [SKIP][545] ([i915#14098] / [i915#14544] / [i915#6095]) +7 other tests skip
   [544]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-rkl-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html
   [545]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          [SKIP][546] ([i915#6095]) -> [SKIP][547] ([i915#14544] / [i915#6095]) +6 other tests skip
   [546]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-rkl-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-2.html
   [547]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2:          [SKIP][548] ([i915#10307] / [i915#6095]) -> [SKIP][549] ([i915#17356]) +8 other tests skip
   [548]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-dg2-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc.html
   [549]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2:          [SKIP][550] ([i915#16017]) -> [SKIP][551] ([i915#17356])
   [550]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-dg2-1/igt@kms_cdclk@mode-transition-all-outputs.html
   [551]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-7/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-rkl:          [SKIP][552] ([i915#14544] / [i915#17427]) -> [SKIP][553] ([i915#17427])
   [552]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-rkl-6/igt@kms_chamelium_color@ctm-limited-range.html
   [553]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-1/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d:
    - shard-rkl:          [SKIP][554] ([i915#16471] / [i915#17427]) -> [SKIP][555] ([i915#14544] / [i915#16471] / [i915#17427])
   [554]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-rkl-7/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d.html
   [555]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-6/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - shard-rkl:          [SKIP][556] ([i915#11151] / [i915#7828]) -> [SKIP][557] ([i915#11151] / [i915#14544] / [i915#7828]) +1 other test skip
   [556]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-rkl-7/igt@kms_chamelium_frames@dp-crc-fast.html
   [557]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-6/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2:          [SKIP][558] ([i915#17356]) -> [SKIP][559] ([i915#15865]) +1 other test skip
   [558]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-dg2-7/igt@kms_content_protection@atomic-dpms.html
   [559]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-4/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-rkl:          [SKIP][560] ([i915#15330] / [i915#3116]) -> [SKIP][561] ([i915#14544] / [i915#15330] / [i915#3116])
   [560]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-rkl-7/igt@kms_content_protection@dp-mst-lic-type-1.html
   [561]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-6/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2:          [SKIP][562] ([i915#17356]) -> [SKIP][563] ([i915#15330] / [i915#3299])
   [562]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-dg2-7/igt@kms_content_protection@dp-mst-type-0.html
   [563]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-4/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@dp-mst-type-0-hdcp14:
    - shard-rkl:          [SKIP][564] ([i915#14544] / [i915#15330]) -> [SKIP][565] ([i915#15330])
   [564]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-rkl-6/igt@kms_content_protection@dp-mst-type-0-hdcp14.html
   [565]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-1/igt@kms_content_protection@dp-mst-type-0-hdcp14.html

  * igt@kms_content_protection@dp-mst-type-0-suspend-resume:
    - shard-dg2:          [SKIP][566] ([i915#17356]) -> [SKIP][567] ([i915#15330])
   [566]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-dg2-7/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html
   [567]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-8/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html

  * igt@kms_content_protection@dp-mst-type-1-suspend-resume:
    - shard-dg2:          [SKIP][568] ([i915#15330]) -> [SKIP][569] ([i915#17356])
   [568]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-dg2-1/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html
   [569]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-7/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html

  * igt@kms_content_protection@legacy-hdcp14:
    - shard-rkl:          [SKIP][570] ([i915#15865]) -> [SKIP][571] ([i915#14544] / [i915#15865])
   [570]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-rkl-7/igt@kms_content_protection@legacy-hdcp14.html
   [571]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-6/igt@kms_content_protection@legacy-hdcp14.html

  * igt@kms_content_protection@mei-interface:
    - shard-dg2:          [SKIP][572] ([i915#15865]) -> [SKIP][573] ([i915#17356]) +3 other tests skip
   [572]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-dg2-3/igt@kms_content_protection@mei-interface.html
   [573]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-7/igt@kms_content_protection@mei-interface.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2:          [SKIP][574] ([i915#17356]) -> [SKIP][575] ([i915#13049])
   [574]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-dg2-7/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [575]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-8/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-rkl:          [SKIP][576] ([i915#13049] / [i915#14544]) -> [SKIP][577] ([i915#13049])
   [576]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-rkl-6/igt@kms_cursor_crc@cursor-random-512x512.html
   [577]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-1/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-random-max-size:
    - shard-dg2:          [SKIP][578] ([i915#3555]) -> [SKIP][579] ([i915#17356]) +2 other tests skip
   [578]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-dg2-1/igt@kms_cursor_crc@cursor-random-max-size.html
   [579]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-7/igt@kms_cursor_crc@cursor-random-max-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-dg2:          [SKIP][580] ([i915#13046] / [i915#17454] / [i915#5354]) -> [SKIP][581] ([i915#17356])
   [580]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-dg2-3/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [581]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-7/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
    - shard-dg2:          [SKIP][582] ([i915#17356]) -> [SKIP][583] ([i915#13046] / [i915#17454] / [i915#5354]) +5 other tests skip
   [582]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-dg2-7/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html
   [583]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-8/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-dg2:          [SKIP][584] ([i915#4103]) -> [SKIP][585] ([i915#17356])
   [584]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-dg2-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
   [585]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-dg2:          [SKIP][586] ([i915#13691]) -> [SKIP][587] ([i915#17356])
   [586]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-dg2-6/igt@kms_display_modes@extended-mode-basic.html
   [587]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-7/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train:
    - shard-rkl:          [SKIP][588] ([i915#17291]) -> [SKIP][589] ([i915#14544] / [i915#17291])
   [588]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-rkl-7/igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train.html
   [589]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-6/igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train.html

  * igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train:
    - shard-dg2:          [SKIP][590] ([i915#17356]) -> [SKIP][591] ([i915#17290])
   [590]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-dg2-7/igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train.html
   [591]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-4/igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train.html

  * igt@kms_dp_link_training@uhbr-mst-direct-train:
    - shard-dg2:          [SKIP][592] ([i915#17285]) -> [SKIP][593] ([i915#17356])
   [592]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-dg2-1/igt@kms_dp_link_training@uhbr-mst-direct-train.html
   [593]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-7/igt@kms_dp_link_training@uhbr-mst-direct-train.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-dg2:          [SKIP][594] ([i915#17356]) -> [SKIP][595] ([i915#16867])
   [594]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-dg2-7/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [595]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-8/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dsc@dsc-basic:
    - shard-dg2:          [SKIP][596] ([i915#16361]) -> [SKIP][597] ([i915#11190] / [i915#17356])
   [596]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-dg2-1/igt@kms_dsc@dsc-basic.html
   [597]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-7/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-with-formats-bigjoiner:
    - shard-dg2:          [SKIP][598] ([i915#16361]) -> [SKIP][599] ([i915#17356]) +1 other test skip
   [598]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-dg2-6/igt@kms_dsc@dsc-with-formats-bigjoiner.html
   [599]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-7/igt@kms_dsc@dsc-with-formats-bigjoiner.html

  * igt@kms_dsc@dsc-with-output-formats-bigjoiner:
    - shard-rkl:          [SKIP][600] ([i915#16361]) -> [SKIP][601] ([i915#14544] / [i915#16361]) +1 other test skip
   [600]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-rkl-7/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html
   [601]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-6/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner:
    - shard-dg2:          [SKIP][602] ([i915#17356]) -> [SKIP][603] ([i915#16361]) +1 other test skip
   [602]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-dg2-7/igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner.html
   [603]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-8/igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner.html

  * igt@kms_fbcon_fbt@psr:
    - shard-rkl:          [SKIP][604] ([i915#16680]) -> [SKIP][605] ([i915#14544] / [i915#16680])
   [604]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-rkl-7/igt@kms_fbcon_fbt@psr.html
   [605]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-6/igt@kms_fbcon_fbt@psr.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-rkl:          [SKIP][606] ([i915#9934]) -> [SKIP][607] ([i915#14544] / [i915#9934])
   [606]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-rkl-7/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
   [607]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-6/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-glk:          [INCOMPLETE][608] ([i915#12745] / [i915#13356] / [i915#17183] / [i915#4839]) -> [INCOMPLETE][609] ([i915#12314] / [i915#12745] / [i915#13356] / [i915#17183] / [i915#4839])
   [608]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-glk2/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [609]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk8/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2:
    - shard-glk:          [INCOMPLETE][610] ([i915#12745] / [i915#13356] / [i915#17183]) -> [INCOMPLETE][611] ([i915#12314] / [i915#12745] / [i915#13356] / [i915#17183])
   [610]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-glk2/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2.html
   [611]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk8/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-glk:          [INCOMPLETE][612] ([i915#12314] / [i915#12745] / [i915#13356] / [i915#17183] / [i915#4839] / [i915#6113]) -> [INCOMPLETE][613] ([i915#12745] / [i915#13356] / [i915#17183] / [i915#4839])
   [612]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-glk5/igt@kms_flip@flip-vs-suspend-interruptible.html
   [613]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk9/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
    - shard-glk:          [INCOMPLETE][614] ([i915#12314] / [i915#12745] / [i915#13356] / [i915#17183]) -> [INCOMPLETE][615] ([i915#12745] / [i915#13356] / [i915#17183])
   [614]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-glk5/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
   [615]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk9/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a2:
    - shard-rkl:          [INCOMPLETE][616] ([i915#16276] / [i915#6113]) -> [ABORT][617] ([i915#15132] / [i915#16925]) +1 other test abort
   [616]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-rkl-3/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a2.html
   [617]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-1/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a2.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-rkl:          [SKIP][618] ([i915#14544] / [i915#15643]) -> [SKIP][619] ([i915#15643])
   [618]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
   [619]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-rkl:          [SKIP][620] ([i915#15643]) -> [SKIP][621] ([i915#14544] / [i915#15643]) +1 other test skip
   [620]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-rkl-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
   [621]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-wc:
    - shard-dg2:          [SKIP][622] ([i915#15104] / [i915#15990]) -> [SKIP][623] ([i915#16708]) +3 other tests skip
   [622]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-wc.html
   [623]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2:          [SKIP][624] ([i915#15990] / [i915#8708]) -> [SKIP][625] ([i915#16708] / [i915#5354]) +9 other tests skip
   [624]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [625]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-rkl:          [SKIP][626] ([i915#17428] / [i915#1825]) -> [SKIP][627] ([i915#14544] / [i915#17428] / [i915#1825]) +3 other tests skip
   [626]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [627]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-cur-indfb-draw-pwrite:
    - shard-dg2:          [SKIP][628] ([i915#15991]) -> [SKIP][629] ([i915#16708]) +30 other tests skip
   [628]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-dg2-3/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-cur-indfb-draw-pwrite.html
   [629]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-7/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-cur-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move:
    - shard-rkl:          [SKIP][630] ([i915#14544] / [i915#15102]) -> [SKIP][631] ([i915#15102]) +2 other tests skip
   [630]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move.html
   [631]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-dg2:          [SKIP][632] ([i915#16708] / [i915#5354]) -> [SKIP][633] ([i915#15990] / [i915#8708]) +8 other tests skip
   [632]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-gtt.html
   [633]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:
    - shard-dg2:          [SKIP][634] ([i915#16708] / [i915#5354]) -> [SKIP][635] ([i915#15991] / [i915#5354]) +14 other tests skip
   [634]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html
   [635]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move:
    - shard-dg2:          [SKIP][636] ([i915#15991] / [i915#5354]) -> [SKIP][637] ([i915#16708] / [i915#5354]) +21 other tests skip
   [636]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move.html
   [637]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-mmap-cpu:
    - shard-dg2:          [SKIP][638] ([i915#15102]) -> [SKIP][639] ([i915#16708]) +15 other tests skip
   [638]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-mmap-cpu.html
   [639]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-indfb-plflip-blt:
    - shard-dg2:          [SKIP][640] ([i915#16708]) -> [SKIP][641] ([i915#15102]) +9 other tests skip
   [640]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-indfb-plflip-blt.html
   [641]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-pgflip-blt:
    - shard-rkl:          [SKIP][642] ([i915#15102]) -> [SKIP][643] ([i915#14544] / [i915#15102]) +8 other tests skip
   [642]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-pgflip-blt.html
   [643]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-draw-mmap-gtt:
    - shard-dg2:          [SKIP][644] ([i915#15990]) -> [SKIP][645] ([i915#16708]) +8 other tests skip
   [644]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-draw-mmap-gtt.html
   [645]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-shrfb-fliptrack-mmap-gtt:
    - shard-rkl:          [SKIP][646] ([i915#17428]) -> [SKIP][647] ([i915#14544] / [i915#17428]) +21 other tests skip
   [646]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-shrfb-fliptrack-mmap-gtt.html
   [647]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-shrfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-pwrite:
    - shard-dg2:          [SKIP][648] ([i915#16708]) -> [SKIP][649] ([i915#15989]) +10 other tests skip
   [648]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-dg2-7/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-pwrite.html
   [649]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-8/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-dg2:          [SKIP][650] ([i915#15989]) -> [SKIP][651] ([i915#16708]) +10 other tests skip
   [650]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-dg2-3/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html
   [651]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-7/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-dg2:          [SKIP][652] ([i915#16708] / [i915#4342] / [i915#5354]) -> [SKIP][653] ([i915#9766])
   [652]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-dg2-7/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
   [653]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-4/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc:
    - shard-dg2:          [SKIP][654] ([i915#16708]) -> [SKIP][655] ([i915#15104] / [i915#15990])
   [654]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc.html
   [655]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:
    - shard-dg2:          [SKIP][656] ([i915#15102]) -> [SKIP][657] ([i915#16708] / [i915#5354]) +8 other tests skip
   [656]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html
   [657]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:
    - shard-dg2:          [SKIP][658] ([i915#16708] / [i915#5354]) -> [SKIP][659] ([i915#15102]) +6 other tests skip
   [658]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html
   [659]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2:          [SKIP][660] ([i915#16708]) -> [SKIP][661] ([i915#15990]) +9 other tests skip
   [660]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-dg2-7/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-indfb-draw-mmap-wc.html
   [661]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-4/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-pri-indfb-multidraw:
    - shard-dg2:          [SKIP][662] ([i915#16708]) -> [SKIP][663] ([i915#15991]) +18 other tests skip
   [662]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-dg2-7/igt@kms_frontbuffer_tracking@psrhdr-2p-pri-indfb-multidraw.html
   [663]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-4/igt@kms_frontbuffer_tracking@psrhdr-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-rkl:          [SKIP][664] ([i915#14544] / [i915#17428]) -> [SKIP][665] ([i915#17428]) +3 other tests skip
   [664]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-rkl-6/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-draw-mmap-gtt.html
   [665]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-1/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-rkl:          [INCOMPLETE][666] ([i915#15436]) -> [SKIP][667] ([i915#16644] / [i915#3555] / [i915#8228])
   [666]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-rkl-6/igt@kms_hdr@bpc-switch-suspend.html
   [667]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-3/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-dg2:          [SKIP][668] ([i915#17356]) -> [SKIP][669] ([i915#12713] / [i915#16518])
   [668]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-dg2-7/igt@kms_hdr@brightness-with-hdr.html
   [669]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-8/igt@kms_hdr@brightness-with-hdr.html
    - shard-rkl:          [SKIP][670] ([i915#16644]) -> [SKIP][671] ([i915#1187] / [i915#12713] / [i915#16644])
   [670]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-rkl-1/igt@kms_hdr@brightness-with-hdr.html
   [671]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-3/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-dg2:          [SKIP][672] ([i915#17356]) -> [SKIP][673] ([i915#16518] / [i915#3555] / [i915#8228])
   [672]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-dg2-7/igt@kms_hdr@invalid-metadata-sizes.html
   [673]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-4/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-dg2:          [SKIP][674] ([i915#16518] / [i915#3555] / [i915#8228]) -> [SKIP][675] ([i915#17356])
   [674]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-dg2-6/igt@kms_hdr@static-toggle-dpms.html
   [675]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-7/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_panel_fitting@legacy:
    - shard-dg2:          [SKIP][676] ([i915#17356]) -> [SKIP][677] ([i915#6301])
   [676]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-dg2-7/igt@kms_panel_fitting@legacy.html
   [677]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-4/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-dg2:          [SKIP][678] ([i915#13958]) -> [SKIP][679] ([i915#17356])
   [678]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-dg2-6/igt@kms_plane_multiple@2x-tiling-4.html
   [679]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-7/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-rkl:          [SKIP][680] ([i915#13958] / [i915#14544]) -> [SKIP][681] ([i915#13958])
   [680]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-rkl-6/igt@kms_plane_multiple@2x-tiling-x.html
   [681]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-1/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-dg2:          [SKIP][682] ([i915#17356]) -> [SKIP][683] ([i915#13958])
   [682]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-dg2-7/igt@kms_plane_multiple@2x-tiling-y.html
   [683]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-8/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_multiple@tiling-4:
    - shard-rkl:          [SKIP][684] ([i915#14259]) -> [SKIP][685] ([i915#14259] / [i915#14544])
   [684]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-rkl-7/igt@kms_plane_multiple@tiling-4.html
   [685]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-6/igt@kms_plane_multiple@tiling-4.html

  * igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:
    - shard-rkl:          [SKIP][686] ([i915#11520]) -> [SKIP][687] ([i915#11520] / [i915#14544]) +1 other test skip
   [686]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-rkl-7/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html
   [687]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-6/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr@pr-primary-mmap-gtt:
    - shard-rkl:          [SKIP][688] ([i915#1072] / [i915#9732]) -> [SKIP][689] ([i915#1072] / [i915#14544] / [i915#9732]) +5 other tests skip
   [688]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-rkl-7/igt@kms_psr@pr-primary-mmap-gtt.html
   [689]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-6/igt@kms_psr@pr-primary-mmap-gtt.html

  * igt@kms_scaling_modes@scaling-mode-none:
    - shard-dg2:          [SKIP][690] ([i915#17356]) -> [SKIP][691] ([i915#3555]) +1 other test skip
   [690]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-dg2-7/igt@kms_scaling_modes@scaling-mode-none.html
   [691]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-4/igt@kms_scaling_modes@scaling-mode-none.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-rkl:          [SKIP][692] ([i915#3555]) -> [SKIP][693] ([i915#14544] / [i915#3555])
   [692]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-rkl-5/igt@kms_setmode@clone-exclusive-crtc.html
   [693]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-6/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_vrr@lobf:
    - shard-rkl:          [SKIP][694] ([i915#11920]) -> [SKIP][695] ([i915#11920] / [i915#14544])
   [694]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-rkl-7/igt@kms_vrr@lobf.html
   [695]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-6/igt@kms_vrr@lobf.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-dg2:          [SKIP][696] ([i915#9906]) -> [SKIP][697] ([i915#17356])
   [696]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-dg2-6/igt@kms_vrr@seamless-rr-switch-drrs.html
   [697]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-7/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@perf@unprivileged-single-ctx-counters:
    - shard-rkl:          [SKIP][698] ([i915#2433]) -> [SKIP][699] ([i915#14544] / [i915#2433])
   [698]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-rkl-7/igt@perf@unprivileged-single-ctx-counters.html
   [699]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-6/igt@perf@unprivileged-single-ctx-counters.html

  * igt@prime_vgem@basic-write:
    - shard-rkl:          [SKIP][700] ([i915#17448] / [i915#3291] / [i915#3708]) -> [SKIP][701] ([i915#14544] / [i915#17448] / [i915#3291] / [i915#3708])
   [700]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-rkl-7/igt@prime_vgem@basic-write.html
   [701]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-6/igt@prime_vgem@basic-write.html

  * igt@prime_vgem@fence-read-hang:
    - shard-rkl:          [SKIP][702] ([i915#17448] / [i915#3708]) -> [SKIP][703] ([i915#14544] / [i915#17448] / [i915#3708])
   [702]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19433/shard-rkl-7/igt@prime_vgem@fence-read-hang.html
   [703]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-6/igt@prime_vgem@fence-read-hang.html

  
  [i915#10055]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10055
  [i915#10216]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10216
  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#11078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078
  [i915#11151]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151
  [i915#11190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#11521]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11521
  [i915#1187]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187
  [i915#11920]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920
  [i915#12276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276
  [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
  [i915#12314]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12314
  [i915#12316]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316
  [i915#12343]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343
  [i915#12358]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12358
  [i915#12469]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12469
  [i915#12655]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655
  [i915#12713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713
  [i915#12745]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745
  [i915#12761]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12761
  [i915#12805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805
  [i915#13046]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046
  [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
  [i915#13179]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179
  [i915#13356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356
  [i915#13390]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13390
  [i915#13441]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13441
  [i915#13566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566
  [i915#13691]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13691
  [i915#13707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707
  [i915#13717]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13717
  [i915#13748]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748
  [i915#13786]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13786
  [i915#13790]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13790
  [i915#13809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13809
  [i915#13958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958
  [i915#14073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073
  [i915#14098]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098
  [i915#14152]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14152
  [i915#14259]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259
  [i915#14419]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14419
  [i915#14544]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544
  [i915#14712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712
  [i915#14888]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14888
  [i915#15073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073
  [i915#15102]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102
  [i915#15104]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104
  [i915#15131]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15131
  [i915#15132]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132
  [i915#15329]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329
  [i915#15330]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330
  [i915#15403]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15403
  [i915#15436]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15436
  [i915#15458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458
  [i915#15492]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15492
  [i915#15500]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15500
  [i915#15529]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15529
  [i915#15582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582
  [i915#15638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15638
  [i915#15643]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643
  [i915#15656]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15656
  [i915#15672]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15672
  [i915#15678]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15678
  [i915#15709]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709
  [i915#15722]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15722
  [i915#15725]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15725
  [i915#15733]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15733
  [i915#15865]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865
  [i915#15867]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867
  [i915#15989]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989
  [i915#15990]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990
  [i915#15991]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991
  [i915#16017]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16017
  [i915#16080]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16080
  [i915#16081]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081
  [i915#16084]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16084
  [i915#16112]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16112
  [i915#16119]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16119
  [i915#16166]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16166
  [i915#16182]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16182
  [i915#16184]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16184
  [i915#16193]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16193
  [i915#16226]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16226
  [i915#16276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16276
  [i915#16348]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16348
  [i915#16361]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361
  [i915#16386]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16386
  [i915#16420]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16420
  [i915#16464]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16464
  [i915#16471]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471
  [i915#16479]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16479
  [i915#16518]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16518
  [i915#16644]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644
  [i915#16666]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16666
  [i915#16680]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16680
  [i915#16708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708
  [i915#16746]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16746
  [i915#16867]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16867
  [i915#16904]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16904
  [i915#16914]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16914
  [i915#16925]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16925
  [i915#16990]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16990
  [i915#17018]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17018
  [i915#17099]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17099
  [i915#17110]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17110
  [i915#17119]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17119
  [i915#17146]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17146
  [i915#17176]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17176
  [i915#17183]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17183
  [i915#17285]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17285
  [i915#17286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17286
  [i915#17287]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17287
  [i915#17290]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17290
  [i915#17291]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17291
  [i915#17327]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17327
  [i915#17356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356
  [i915#17359]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17359
  [i915#17373]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17373
  [i915#17416]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17416
  [i915#17427]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427
  [i915#17428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428
  [i915#17429]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17429
  [i915#17431]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17431
  [i915#17432]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17432
  [i915#17434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17434
  [i915#17445]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17445
  [i915#17448]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17448
  [i915#17450]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17450
  [i915#17454]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17454
  [i915#17455]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17455
  [i915#17458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17458
  [i915#17462]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17462
  [i915#17467]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17467
  [i915#17478]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17478
  [i915#17479]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17479
  [i915#17480]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17480
  [i915#17481]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17481
  [i915#17482]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17482
  [i915#17483]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17483
  [i915#17484]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17484
  [i915#17488]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17488
  [i915#17489]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17489
  [i915#17490]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17490
  [i915#17491]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17491
  [i915#17492]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17492
  [i915#17493]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17493
  [i915#17494]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17494
  [i915#17495]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17495
  [i915#17496]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17496
  [i915#17497]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17497
  [i915#17498]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17498
  [i915#17499]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17499
  [i915#17500]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17500
  [i915#17502]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17502
  [i915#17503]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17503
  [i915#17504]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17504
  [i915#17505]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17505
  [i915#17506]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17506
  [i915#17508]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17508
  [i915#17510]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17510
  [i915#17511]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17511
  [i915#17516]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17516
  [i915#17517]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17517
  [i915#17520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17520
  [i915#17521]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17521
  [i915#17522]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17522
  [i915#17523]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17523
  [i915#17524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17524
  [i915#17525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17525
  [i915#17531]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17531
  [i915#17533]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17533
  [i915#17534]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17534
  [i915#17536]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17536
  [i915#17537]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17537
  [i915#17541]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17541
  [i915#17542]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17542
  [i915#17543]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17543
  [i915#17544]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17544
  [i915#17546]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17546
  [i915#17547]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17547
  [i915#17552]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17552
  [i915#17561]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17561
  [i915#17567]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17567
  [i915#17571]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17571
  [i915#17574]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17574
  [i915#17583]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17583
  [i915#17616]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17616
  [i915#17625]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17625
  [i915#17664]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17664
  [i915#17666]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17666
  [i915#17668]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17668
  [i915#17688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17688
  [i915#17704]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17704
  [i915#17707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17707
  [i915#17711]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17711
  [i915#17712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17712
  [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
  [i915#2065]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2065
  [i915#2433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2433
  [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
  [i915#2582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582
  [i915#2681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2681
  [i915#280]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280
  [i915#284]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284
  [i915#2856]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
  [i915#3116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299
  [i915#3359]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3359
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#3711]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3711
  [i915#3742]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742
  [i915#3828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213
  [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
  [i915#4342]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4342
  [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
  [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#4812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812
  [i915#4817]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817
  [i915#4839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839
  [i915#5107]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5107
  [i915#5138]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#5439]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439
  [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
  [i915#6113]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113
  [i915#6301]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301
  [i915#6335]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335
  [i915#6344]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6344
  [i915#658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658
  [i915#6953]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953
  [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
  [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
  [i915#8399]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399
  [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
  [i915#8428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
  [i915#8516]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516
  [i915#8555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555
  [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
  [i915#8810]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8810
  [i915#8813]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813
  [i915#8825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825
  [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
  [i915#9423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423
  [i915#9519]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519
  [i915#9531]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531
  [i915#9683]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683
  [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
  [i915#9723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9766]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766
  [i915#9808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9808
  [i915#9809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809
  [i915#9812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812
  [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
  [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934


Build changes
-------------

  * Linux: CI_DRM_19433 -> Patchwork_177526v1

  CI-20190529: 20190529
  CI_DRM_19433: 0f5e7199aaceed05aa49dad4c97df2677e32f779 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_9175: 9175
  Patchwork_177526v1: 0f5e7199aaceed05aa49dad4c97df2677e32f779 @ git://anongit.freedesktop.org/gfx-ci/linux
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/index.html

--===============7128412604185327517==
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
<tr><td><b>Series:</b></td><td>drm/i915: LT&#x27;s support for Vswing / Pre=
-emphasis Override</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/177526/">https://patchwork.freedesktop.org/series/177526/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/Patchwork_177526v1/index.html">https://intel-gfx-ci.01.org/tre=
e/drm-tip/Patchwork_177526v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_19433_full -&gt; Patchwork_177526v=
1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with Patchwork_177526v1_full absolutely n=
eed to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in Patchwork_177526v1_full, please notify your bug team (I915-=
ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in Patchwork_=
177526v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_async_flips@async-flip-dpms@pipe-d-hdmi-a-1:<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-tglu-1/igt@kms_async_flips@async-fli=
p-dpms@pipe-d-hdmi-a-1.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_177526v1_full that come from kno=
wn issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-reloc-purge-cache:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-dg1-19/igt@api_intel_bb@blit-reloc-p=
urge-cache.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@device_reset@cold-reset-bound:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-rkl-7/igt@device_reset@cold-reset-bo=
und.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/11078">i915#11078</a>)</li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-cold-reset-rebind:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk4/igt@device_reset@unbind-cold-re=
set-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17537">i915#17537</a>)</li>
</ul>
</li>
<li>
<p>igt@dmabuf@dma-buf-fence-chain:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk6/igt@dmabuf@dma-buf-fence-chain.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17712">i915#17712</a>)</li>
</ul>
</li>
<li>
<p>igt@drm_read@short-buffer-wakeup:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-dg2-1/igt@drm_read@short-buffer-wakeup.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1=
/shard-dg2-7/igt@drm_read@short-buffer-wakeup.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17359">i915#17359</a>=
)</li>
</ul>
</li>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-dg2-3/igt@fbdev@read.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-7/igt@f=
bdev@read.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/2582">i915#2582</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk4/igt@gem_ccs@ctrl-surf-copy.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/17499">i915#17499</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-tglu-1/igt@gem_ccs@ctrl-surf-copy.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy-new-ctx:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-dg1-19/igt@gem_ccs@ctrl-surf-copy-ne=
w-ctx.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-tglu-9/igt@gem_ccs@suspend-resume.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9323">i915#9323</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-dg2-7/igt@gem_ccs@suspend-resume@linear-compressed-comp=
fmt0-smem-lmem0.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-dg2-4/igt@gem_ccs@suspend-resume@lin=
ear-compressed-compfmt0-smem-lmem0.html">INCOMPLETE</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16348">i91=
5#16348</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_compute@compute-square:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk4/igt@gem_compute@compute-square.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17552">i915#17552</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-big:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-rkl-4/igt@gem_create@create-ext-cpu-=
access-big.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/6335">i915#6335</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@engines:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk6/igt@gem_ctx_sseu@engines.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17496">i915#17496</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-sseu:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-tglu-9/igt@gem_ctx_sseu@invalid-sseu=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/280">i915#280</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@mmap-args:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-rkl-4/igt@gem_ctx_sseu@mmap-args.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/280">i915#280</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@noheartbeat:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-mtlp-1/igt@gem_exec_balancer@noheart=
beat.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/8555">i915#8555</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-tglu-1/igt@gem_exec_balancer@paralle=
l.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-contexts:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-rkl-3/igt@gem_exec_balancer@parallel=
-contexts.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/4525">i915#4525</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-tglu-3/igt@gem_exec_balancer@paralle=
l-contexts.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/4525">i915#4525</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-in-fence:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk10/igt@gem_exec_balancer@parallel=
-keep-in-fence.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/17547">i915#17547</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-mtlp-7/igt@gem_exec_capture@capture.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/16904">i915#16904</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-recoverable:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk4/igt@gem_exec_capture@capture-re=
coverable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17711">i915#17711</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-tglu-1/igt@gem_exec_capture@capture-=
recoverable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/6344">i915#6344</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_endless@dispatch@bcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk2/igt@gem_exec_endless@dispatch@b=
cs0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17571">i915#17571</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-cmd:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-mtlp-7/igt@gem_exec_flush@basic-batc=
h-kernel-default-cmd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/3711">i915#3711</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@rsvd2-dirt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-mtlp-7/igt@gem_exec_params@rsvd2-dir=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/5107">i915#5107</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-master:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk6/igt@gem_exec_params@secure-non-=
master.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17523">i915#17523</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-root:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-dg1-17/igt@gem_exec_params@secure-no=
n-root.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17416">i915#17416</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-rkl-4/igt@gem_exec_reloc@basic-cpu-g=
tt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3281">i915#3281</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-cpu-active:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-dg1-17/igt@gem_exec_reloc@basic-writ=
e-cpu-active.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/3281">i915#3281</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue-chain:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-dg1-19/igt@gem_exec_schedule@preempt=
-queue-chain.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk6/igt@gem_lmem_swapping@parallel-=
random.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17503">i915#17503</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-mtlp-1/igt@gem_lmem_swapping@paralle=
l-random.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-rkl-5/igt@gem_lmem_swapping@parallel=
-random-verify.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-tglu-1/igt@gem_lmem_swapping@paralle=
l-random-verify.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/4613">i915#4613</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-tglu-9/igt@gem_lmem_swapping@paralle=
l-random-verify-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk11/igt@gem_lmem_swapping@smem-oom=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17503">i915#17503</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_madvise@dontneed-before-pwrite:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-rkl-4/igt@gem_madvise@dontneed-befor=
e-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/3282">i915#3282</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-tglu-1/igt@gem_media_vme.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284=
">i915#284</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk4/igt@gem_media_vme.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17543=
">i915#17543</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@coherency:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-rkl-3/igt@gem_mmap_gtt@coherency.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17429">i915#17429</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-tglu-3/igt@gem_mmap_gtt@coherency.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17429">i915#17429</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@flink-race:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-dg1-17/igt@gem_mmap_gtt@flink-race.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/4077">i915#4077</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write-read:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-dg1-19/igt@gem_mmap_wc@write-read.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/4083">i915#4083</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-display:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-dg1-17/igt@gem_partial_pwrite_pread@=
writes-after-reads-display.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +2 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@hw-rejects-pxp-buffer:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-rkl-4/igt@gem_pxp@hw-rejects-pxp-buf=
fer.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/13717">i915#13717</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-execution-after-suspend-resume:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-rkl-7/igt@gem_pxp@verify-pxp-execution-after-suspend-re=
sume.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/Patchwork_177526v1/shard-rkl-1/igt@gem_pxp@verify-pxp-execution-after-su=
spend-resume.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/15131">i915#15131</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-dg1-17/igt@gem_pxp@verify-pxp-execut=
ion-after-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/4270">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk2/igt@gem_pxp@verify-pxp-key-chan=
ge-after-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/17521">i915#17521</a>) +2 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@gem_readwrite@read-bad-handle:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-mtlp-1/igt@gem_readwrite@read-bad-ha=
ndle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3282">i915#3282</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-mc-ccs-to-y-tiled-ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-mtlp-7/igt@gem_render_copy@y-tiled-m=
c-ccs-to-y-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/8428">i915#8428</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-to-vebox-y-tiled:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk4/igt@gem_render_copy@y-tiled-to-=
vebox-y-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/17492">i915#17492</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic@basic:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-rkl-7/igt@gem_tiled_pread_basic@basi=
c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/15656">i915#15656</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_pwrite:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-mtlp-1/igt@gem_tiled_pread_pwrite.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/4079">i915#4079</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@access-control:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-tglu-1/igt@gem_userptr_blits@access-=
control.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@create-destroy-unsync:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-rkl-3/igt@gem_userptr_blits@create-d=
estroy-unsync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/3297">i915#3297</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-tglu-3/igt@gem_userptr_blits@create-=
destroy-unsync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/3297">i915#3297</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-mtlp-7/igt@gem_userptr_blits@dmabuf-=
sync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3297">i915#3297</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@forbidden-operations:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-rkl-3/igt@gem_userptr_blits@forbidde=
n-operations.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/3282">i915#3282</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-pwrite-unsync:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-dg1-19/igt@gem_userptr_blits@readonl=
y-pwrite-unsync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/3297">i915#3297</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen3_mixed_blits:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk2/igt@gen3_mixed_blits.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17=
688">i915#17688</a>)</li>
</ul>
</li>
<li>
<p>igt@gen3_render_tiledx_blits:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk9/igt@gen3_render_tiledx_blits.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17511">i915#17511</a>)</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-offset:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-rkl-3/igt@gen7_exec_parse@basic-offs=
et.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17455">i915#17455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@batch-without-end:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk4/igt@gen7_exec_parse@batch-witho=
ut-end.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17505">i915#17505</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-tglu-1/igt@gen7_exec_parse@batch-wit=
hout-end.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17455">i915#17455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@oacontrol-tracking:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk10/igt@gen7_exec_parse@oacontrol-=
tracking.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17505">i915#17505</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-without-end:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-dg1-19/igt@gen9_exec_parse@batch-wit=
hout-end.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/2527">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-zero-length:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-mtlp-7/igt@gen9_exec_parse@batch-zer=
o-length.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-large:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-tglu-9/igt@gen9_exec_parse@bb-large.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/2527">i915#2527</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/2856">i915#2856</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@shadow-peek:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-rkl-5/igt@gen9_exec_parse@shadow-pee=
k.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/2527">i915#2527</a>) +1 other test skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-tglu-1/igt@gen9_exec_parse@shadow-pe=
ek.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/2527">i915#2527</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@gpu_buddy@gpu_buddy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-rkl-7/igt@gpu_buddy@gpu_buddy.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/15678">i915#15678</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@most-busy-check-all@vcs1:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-dg1-17/igt@i915_drm_fdinfo@most-busy=
-check-all@vcs1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/14073">i915#14073</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_fb_tiling@basic-x-tiling:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-mtlp-7/igt@i915_fb_tiling@basic-x-ti=
ling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/13786">i915#13786</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-reset:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-tglu-8/igt@i915_pm_freq_api@freq-res=
et.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/8399">i915#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@media-rc6-accuracy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-mtlp-1/igt@i915_pm_rc6_residency@med=
ia-rc6-accuracy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/16080">i915#16080</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/16166">i915#16166</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk6/igt@i915_pm_rc6_residency@media=
-rc6-accuracy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/17541">i915#17541</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-tglu-1/igt@i915_pm_rc6_residency@rc6=
-fence.html">WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/13790">i915#13790</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/2681">i915#2681</a>) +1 other test warn</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-known-pci-ids:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk9/igt@i915_query@query-topology-k=
nown-pci-ids.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/17574">i915#17574</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@perf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-tglu-3/igt@i915_selftest@perf.html">=
ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/17018">i915#17018</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@sysfs-reader:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk11/igt@i915_suspend@sysfs-reader.=
html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/13356">i915#13356</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/16182">i915#16182</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-legacy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-mtlp-7/igt@kms_addfb_basic@addfb25-x=
-tiled-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/4212">i915#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk10/igt@kms_addfb_basic@invalid-sm=
em-bo-on-discrete.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/17668">i915#17668</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-dg1-17/igt@kms_async_flips@alternate-sync-async-flip-at=
omic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/Patchwork_177526v1/shard-dg1-15/igt@kms_async_flips@alternate-sync-async=
-flip-atomic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/14888">i915#14888</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-glk4/igt@kms_async_flips@alternate-sync-async-flip-atom=
ic@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/Patchwork_177526v1/shard-glk4/igt@kms_async_flips@alternat=
e-sync-async-flip-atomic@pipe-a-hdmi-a-1.html">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/14888">i915#14888</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-dg1-15/igt@kms_async_flips@alternate=
-sync-async-flip-atomic@pipe-a-hdmi-a-1.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/14888">i915#14888</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-rkl-8/igt@kms_atomic@plane-primary-o=
verlay-mutable-zpos.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/9531">i915#9531</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-rkl-4/igt@kms_big_fb@4-tiled-16bpp-r=
otate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/4538">i915#4538</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-tglu-1/igt@kms_big_fb@4-tiled-16bpp-=
rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17432">i915#17432</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-mtlp-7/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17=
7526v1/shard-mtlp-1/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12469">i9=
15#12469</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/15733">i915#15733</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/5138">i915#5138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk2/igt@kms_big_fb@4-tiled-64bpp-ro=
tate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17478">i915#17478</a>) +3 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-tglu-9/igt@kms_big_fb@4-tiled-64bpp-=
rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17432">i915#17432</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +5 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-tglu-1/igt@kms_big_fb@4-tiled-addfb.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk10/igt@kms_big_fb@4-tiled-addfb-s=
ize-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/17544">i915#17544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk11/igt@kms_big_fb@4-tiled-max-hw-=
stride-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/17478">i915#17478</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-dg1-17/igt@kms_big_fb@4-tiled-max-hw=
-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#52=
86</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-mtlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotat=
e-180-hflip.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/Patchwork_177526v1/shard-mtlp-4/igt@kms_big_fb@4-tiled-max-hw-str=
ide-64bpp-rotate-180-hflip.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/15733">i915#15733</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138">i915#5138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk11/igt@kms_big_fb@linear-16bpp-ro=
tate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/17500">i915#17500</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-tglu-1/igt@kms_big_fb@linear-32bpp-r=
otate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17431">i915#17431</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-rkl-7/igt@kms_big_fb@linear-32bpp-ro=
tate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/17431">i915#17431</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-dg1-19/igt@kms_big_fb@linear-64bpp-r=
otate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/3638">i915#3638</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk10/igt@kms_big_fb@linear-64bpp-ro=
tate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/17500">i915#17500</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-mtlp-1/igt@kms_big_fb@linear-8bpp-ro=
tate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17431">i915#17431</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk4/igt@kms_big_fb@linear-max-hw-st=
ride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/17524">i915#17524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-tglu-1/igt@kms_big_fb@linear-max-hw-=
stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>) +1 other test sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk2/igt@kms_big_fb@x-tiled-16bpp-ro=
tate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17500">i915#17500</a>) +9 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-tglu-9/igt@kms_big_fb@x-tiled-16bpp-=
rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17431">i915#17431</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-rkl-3/igt@kms_big_fb@yf-tiled-16bpp-=
rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/4538">i915#4538</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-tglu-1/igt@kms_big_fb@yf-tiled-64bpp=
-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17432">i915#17432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-rkl-4/igt@kms_big_fb@yf-tiled-addfb.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17432">i915#17432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-dg1-19/igt@kms_big_fb@yf-tiled-max-h=
w-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a>) +2 other tests s=
kip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-tglu-8/igt@kms_big_fb@yf-tiled-max-h=
w-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/17432">i915#17432</a>) +5 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-mtlp-7/igt@kms_big_fb@yf-tiled-max-h=
w-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/17432">i915#17432</a>) +3 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-dg2-4/igt@kms_ccs@bad-aux-stride-y-t=
iled-gen12-rc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434">i915#104=
34</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/6095">i915#6095</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk10/igt@kms_ccs@bad-pixel-format-4=
-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/17491">i915#17491</a>) +9 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk2/igt@kms_ccs@bad-pixel-format-4-=
tiled-mtl-mc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/17490">i915#17490</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17491">i915#17491<=
/a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-tglu-3/igt@kms_ccs@bad-rotation-90-4=
-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/12313">i915#12313</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-rkl-3/igt@kms_ccs@bad-rotation-90-4-=
tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk6/igt@kms_ccs@bad-rotation-90-4-t=
iled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/17525">i915#17525</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-dg1-12/igt@kms_ccs@crc-primary-basic=
-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +186 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk11/igt@kms_ccs@crc-primary-basic-=
4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/17490">i915#17490</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/17491">i915#17491</a>) +1 other =
test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-ccs:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-tglu-1/igt@kms_ccs@crc-primary-basic=
-y-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/6095">i915#6095</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-tglu-3/igt@kms_ccs@crc-primary-rotat=
ion-180-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +64 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-tglu-1/igt@kms_ccs@crc-primary-suspe=
nd-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/12805">i915#12805</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk6/igt@kms_ccs@crc-primary-suspend=
-y-tiled-ccs@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582">i915#155=
82</a>) +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-rkl-5/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-=
ccs-cc.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/Patchwork_177526v1/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-y-tiled=
-gen12-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/15582">i915#15582</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-2:=
</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-rkl-6/igt@kms_ccs@crc-primary-suspen=
d-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-2.html">INCOMPLETE</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582">i915#15582</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-dg2-3/igt@kms_ccs@crc-primary-suspen=
d-yf-tiled-ccs@pipe-d-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +3 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk11/igt@kms_ccs@crc-sprite-planes-=
basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/17525">i915#17525</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk10/igt@kms_ccs@crc-sprite-planes-=
basic-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/17490">i915#17490</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/17491">i915#17491</a>) +3 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2:<=
/p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk6/igt@kms_ccs@crc-sprite-planes-b=
asic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/17491">i915#17491</a>) +46 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-rkl-4/igt@kms_ccs@crc-sprite-planes-=
basic-y-tiled-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +43 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-rkl-3/igt@kms_ccs@random-ccs-data-4-=
tiled-dg2-mc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a=
>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-mtlp-1/igt@kms_ccs@random-ccs-data-4=
-tiled-dg2-rc-ccs@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +29 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-mtlp-7/igt@kms_ccs@random-ccs-data-4=
-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk11/igt@kms_ccs@random-ccs-data-y-=
tiled-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/17491">i915#17491</a>) +6 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-dg2-4/igt@kms_ccs@random-ccs-data-y-=
tiled-gen12-mc-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095=
</a>) +98 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-rejected-max-dotclock:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-rkl-7/igt@kms_cdclk@mode-rejected-ma=
x-dotclock.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17099">i915#17099</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-tglu-1/igt@kms_cdclk@mode-transition=
-all-outputs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/3742">i915#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-dg1-17/igt@kms_cdclk@plane-scaling.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/3742">i915#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-after-suspend:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk10/igt@kms_chamelium_audio@hdmi-a=
udio-after-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/17483">i915#17483</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-tglu-1/igt@kms_chamelium_color@ctm-g=
reen-to-red.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/17427">i915#17427</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk4/igt@kms_chamelium_color@ctm-gre=
en-to-red.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17489">i915#17489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-rkl-3/igt@kms_chamelium_color@degamm=
a.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17427">i915#17427</a>) +2 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-tglu-3/igt@kms_chamelium_color@degam=
ma.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17427">i915#17427</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-ctm3x4:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk2/igt@kms_chamelium_color_pipelin=
e@plane-ctm3x4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/17497">i915#17497</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim:</=
p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-dg1-19/igt@kms_chamelium_color_pipel=
ine@plane-fixed-matrix-yuv-rgb-bt601-lim.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) +1 =
other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d:=
</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk11/igt@kms_chamelium_color_pipeli=
ne@plane-fixed-matrix-yuv-rgb-bt601-lut1d.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/17497">i915#17497</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-tglu-1/igt@kms_chamelium_color_pipel=
ine@plane-lut1d-ctm3x4.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/16471">i915#16471</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-mtlp-1/igt@kms_chamelium_color_pipel=
ine@plane-lut1d-ctm3x4-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/16464">i915#16464</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427"=
>i915#17427</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-dg1-19/igt@kms_chamelium_color_pipel=
ine@plane-lut1d-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/16471">i915#16471</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-rkl-3/igt@kms_chamelium_color_pipeli=
ne@plane-lut1d-post-ctm3x4.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>)</=
li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-tglu-3/igt@kms_chamelium_color_pipel=
ine@plane-lut1d-post-ctm3x4.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) =
+2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-read:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-rkl-8/igt@kms_chamelium_edid@hdmi-ed=
id-read.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +6 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@vga-edid-read:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-dg1-17/igt@kms_chamelium_edid@vga-ed=
id-read.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +2 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-after-runtime-suspend-d3hot:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-tglu-9/igt@kms_chamelium_hpd@hdmi-hp=
d-after-runtime-suspend-d3hot.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk6/igt@kms_chamelium_hpd@hdmi-hpd-=
for-each-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/17483">i915#17483</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-tglu-1/igt@kms_chamelium_hpd@hdmi-hp=
d-with-enabled-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +4 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-mtlp-7/igt@kms_chamelium_hpd@vga-hpd=
-enable-disable-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +2 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-without-ddc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-tglu-9/igt@kms_chamelium_hpd@vga-hpd=
-without-ddc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +6 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_color@background-color:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-dg2-3/igt@kms_color@background-color.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/s=
hard-dg2-7/igt@kms_color@background-color.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/17373">i915#17373</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-dg2-1/igt@kms_color@ctm-signed.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-d=
g2-7/igt@kms_color@ctm-signed.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/12655">i915#12655</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17373">i915#17373</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-rkl-7/igt@kms_color@deep-color.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/12655">i915#12655</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk4/igt@kms_color_pipeline@plane-fi=
xed-matrix-yuv-rgb-bt709-lim-lut1d.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/17510">i915#17510</a>) +2 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk11/igt@kms_color_pipeline@plane-f=
ixed-matrix-yuv-rgb-bt709-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/17510">i915#17510</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk10/igt@kms_color_pipeline@plane-l=
ut1d-ctm3x4-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/17510">i915#17510</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-d-plane-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-dg2-8/igt@kms_color_pipeline@plane-l=
ut1d-ctm3x4@pipe-d-plane-3.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/16990">i915#16990</a>) +7 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-b-plane-3:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-tglu-9/igt@kms_color_pipeline@plane-=
lut1d-lut1d@pipe-b-plane-3.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/16990">i915#16990</a>) +15 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-dg2-6/igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patch=
work_177526v1/shard-dg2-7/igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/15529">i915#15529</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms-hdcp14:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-tglu-1/igt@kms_content_protection@at=
omic-dpms-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/15865">i915#15865</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-dg1-19/igt@kms_content_protection@dp=
-mst-lic-type-0-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-tglu-8/igt@kms_content_protection@dp=
-mst-lic-type-0-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-mtlp-1/igt@kms_content_protection@dp=
-mst-lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/15330">i915#15330</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk6/igt@kms_content_protection@dp-m=
st-lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/17502">i915#17502</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk11/igt@kms_content_protection@dp-=
mst-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17502">i915#17502</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1-suspend-resume:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-tglu-1/igt@kms_content_protection@dp=
-mst-type-1-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy-hdcp14:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk6/igt@kms_content_protection@lega=
cy-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17508">i915#17508</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-mtlp-1/igt@kms_content_protection@le=
gacy-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/15865">i915#15865</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-rkl-4/igt@kms_content_protection@mei=
-interface.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/15865">i915#15865</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-dg1-19/igt@kms_content_protection@ty=
pe1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/15865">i915#15865</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-tglu-8/igt@kms_content_protection@ty=
pe1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/15865">i915#15865</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk9/igt@kms_cursor_crc@cursor-offsc=
reen-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/17533">i915#17533</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-max-size:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk11/igt@kms_cursor_crc@cursor-offs=
creen-max-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/17504">i915#17504</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x42:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-rkl-2/igt@kms_cursor_crc@cursor-onscreen-128x42.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork=
_177526v1/shard-rkl-2/igt@kms_cursor_crc@cursor-onscreen-128x42.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/135=
66">i915#13566</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x32:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-rkl-4/igt@kms_cursor_crc@cursor-onsc=
reen-32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-mtlp-7/igt@kms_cursor_crc@cursor-ons=
creen-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/13049">i915#13049</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/3359">i915#3359</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x10:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk10/igt@kms_cursor_crc@cursor-rand=
om-32x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17504">i915#17504</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-rkl-3/igt@kms_cursor_crc@cursor-rand=
om-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/13049">i915#13049</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-tglu-3/igt@kms_cursor_crc@cursor-ran=
dom-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-max-size:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-tglu-1/igt@kms_cursor_crc@cursor-ran=
dom-max-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-max-size:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk4/igt@kms_cursor_crc@cursor-rapid=
-movement-max-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/17504">i915#17504</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-rkl-8/igt@kms_cursor_crc@cursor-slid=
ing-256x85.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/13566">i915#13566</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-dg1-19/igt@kms_cursor_crc@cursor-sli=
ding-max-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-mtlp-7/igt@kms_cursor_legacy@basic-b=
usy-flip-before-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/16119">i915#16119</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213">i915#4213</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-mtlp-7/igt@kms_cursor_legacy@cursorb=
-vs-flipa-atomic-transitions.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809">i915#9809</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-tglu-1/igt@kms_cursor_legacy@cursorb=
-vs-flipa-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/17428">i915#17428</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/17454">i915#17454</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-tglu-8/igt@kms_cursor_legacy@cursorb=
-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17454">i9=
15#17454</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-rkl-8/igt@kms_dirtyfb@psr-dirtyfb-io=
ctl.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/9723">i915#9723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst-direct-train:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-dg1-17/igt@kms_dp_link_training@non-=
uhbr-mst-direct-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/17287">i915#17287</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-mtlp-1/igt@kms_dp_link_training@non-=
uhbr-mst-tbtalt-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/17291">i915#17291</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk6/igt@kms_dp_link_training@non-uh=
br-mst-tbtalt-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/17616">i915#17616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk4/igt@kms_dp_link_training@non-uh=
br-sst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17664">i915#17664</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst-direct-train:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk2/igt@kms_dp_link_training@non-uh=
br-sst-direct-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/17506">i915#17506</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-tglu-9/igt@kms_dp_link_training@non-=
uhbr-sst-direct-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/17286">i915#17286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk11/igt@kms_dp_link_training@non-u=
hbr-sst-tbtalt-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/17531">i915#17531</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst-direct-train:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-tglu-1/igt@kms_dp_link_training@uhbr=
-mst-direct-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/17285">i915#17285</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-rkl-3/igt@kms_dp_link_training@uhbr-=
sst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/13748">i915#13748</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-tglu-3/igt@kms_dp_link_training@uhbr=
-sst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/13748">i915#13748</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk9/igt@kms_dp_linktrain_fallback@d=
p-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17625">i915#17625</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-rkl-7/igt@kms_dp_linktrain_fallback@=
dsc-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/13707">i915#13707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-tglu-1/igt@kms_dsc@dsc-basic.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/16361">i915#16361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc-bigjoiner:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk10/igt@kms_dsc@dsc-fractional-bpp=
-with-bpc-bigjoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/17458">i915#17458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-tglu-3/igt@kms_dsc@dsc-with-bpc-form=
ats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/16361">i915#16361</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-bigjoiner:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-mtlp-1/igt@kms_dsc@dsc-with-output-f=
ormats-bigjoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/16361">i915#16361</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-ultrajoiner:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk2/igt@kms_dsc@dsc-with-output-for=
mats-ultrajoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/17458">i915#17458</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-rkl-8/igt@kms_dsc@dsc-with-output-fo=
rmats-with-bpc-ultrajoiner.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +2 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk6/igt@kms_fbcon_fbt@psr.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
7516">i915#17516</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-tglu-8/igt@kms_feature_discovery@cha=
melium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/2065">i915#2065</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-dg1-19/igt@kms_feature_discovery@cha=
melium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/16084">i915#16084</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-rkl-3/igt@kms_feature_discovery@disp=
lay-2x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/16081">i915#16081</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-tglu-3/igt@kms_feature_discovery@dis=
play-2x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/16081">i915#16081</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-tglu-1/igt@kms_feature_discovery@dis=
play-3x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/16081">i915#16081</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk4/igt@kms_feature_discovery@displ=
ay-4x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/17666">i915#17666</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk10/igt@kms_feature_discovery@psr1=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17707">i915#17707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-tglu-9/igt@kms_feature_discovery@psr=
2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-dg1-19/igt@kms_flip@2x-flip-vs-absol=
ute-wf_vblank-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +2 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-rkl-4/igt@kms_flip@2x-flip-vs-pannin=
g-vs-hang.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/9934">i915#9934</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-tglu-1/igt@kms_flip@2x-modeset-vs-vb=
lank-race-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +1 other=
 test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-mtlp-7/igt@kms_flip@2x-plain-flip.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3637">i915#3637</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/9934">i915#9934</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-tglu-9/igt@kms_flip@2x-plain-flip-fb=
-recreate-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +5 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-dg2-6/igt@kms_flip@basic-flip-vs-dpms.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/=
shard-dg2-7/igt@kms_flip@basic-flip-vs-dpms.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +5=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-dg2-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp=
-4tiledg2rcccs-downscaling.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-7/igt@kms_flip_scaled=
_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915=
#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/8813">i915#8813</a>) +1 other test skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-tglu-1/igt@kms_flip_scaled_crc@flip-=
32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-tglu-9/igt@kms_flip_scaled_crc@flip-=
32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>)=
 +3 other tests skip</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk2/igt@kms_flip_scaled_crc@flip-32=
bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17484">i915#17484</a>) +=
1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-mtlp-1/igt@kms_flip_scaled_crc@flip-=
32bpp-ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-dg1-17/igt@kms_flip_scaled_crc@flip-=
64bpp-4tile-to-16bpp-4tile-upscaling.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +1 othe=
r test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-=
64bpp-xtile-to-16bpp-xtile-downscaling.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8810">i915#881=
0</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
8813">i915#8813</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-rkl-8/igt@kms_flip_scaled_crc@flip-6=
4bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +5 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk2/igt@kms_flip_scaled_crc@flip-64=
bpp-ytile-to-32bpp-ytile-upscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/17522">i915#17522</a>) +1 other =
test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling=
:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk4/igt@kms_flip_scaled_crc@flip-64=
bpp-ytile-to-32bpp-ytilercccs-downscaling.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/17493">i915#17493</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-mtlp-7/igt@kms_force_connector_basic@force-connector-st=
ate.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/Patchwork_177526v1/shard-mtlp-1/igt@kms_force_connector_basic@force-conne=
ctor-state.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/15672">i915#15672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri=
-indfb-draw-render.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/Patchwork_177526v1/shard-dg2-7/igt@kms_frontbuffer_trackin=
g@fbc-1p-offscreen-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a>) +1 =
other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-dg1-19/igt@kms_frontbuffer_tracking@=
fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) +44 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-tglu-1/igt@kms_frontbuffer_tracking@=
fbc-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) +44 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprim=
ary.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/Patchwork_177526v1/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-indfb-sca=
ledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/16708">i915#16708</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +4 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-farfromfence-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-dg1-17/igt@kms_frontbuffer_tracking@=
fbchdr-farfromfence-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +10 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-pwrite:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-mtlp-7/igt@kms_frontbuffer_tracking@=
fbchdr-rgb101010-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +16 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-render:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-dg1-17/igt@kms_frontbuffer_tracking@=
fbchdr-rgb101010-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +5 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-pwrite:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-glk8/igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-pw=
rite.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/Patchwork_177526v1/shard-glk9/igt@kms_frontbuffer_tracking@fbchdr-rgb565=
-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/17517">i915#17517</a>) +12 other tests skip</li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-rkl-1/igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-p=
write.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/Patchwork_177526v1/shard-rkl-3/igt@kms_frontbuffer_tracking@fbchdr-rgb5=
65-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/15989">i915#15989</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-rkl-8/igt@kms_frontbuffer_tracking@f=
bcpsr-1p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +33 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-gtt:=
</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-mtlp-7/igt@kms_frontbuffer_tracking@=
fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i9=
15#8708</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-rkl-8/igt@kms_frontbuffer_tracking@f=
bcpsr-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) +67 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-spr-indfb-draw-pwrite=
:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk11/igt@kms_frontbuffer_tracking@f=
bcpsrhdr-2p-primscrn-spr-indfb-draw-pwrite.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17482">i915#17482</a>) +=
5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-indfb-draw-pwrite=
:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk9/igt@kms_frontbuffer_tracking@fb=
cpsrhdr-2p-scndscrn-pri-indfb-draw-pwrite.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/17482">i915#17482</a>) +7=
2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-farfromfence-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-mtlp-7/igt@kms_frontbuffer_tracking@=
fbcpsrhdr-farfromfence-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +7 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-tglu-1/igt@kms_frontbuffer_tracking@=
fbcpsrhdr-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-mtlp-7/igt@kms_frontbuffer_tracking@=
fbcpsrhdr-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/10055">i915#10055</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-shrfb-draw-mmap-gtt:</=
p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-tglu-3/igt@kms_frontbuffer_tracking@=
hdr-1p-offscreen-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +22=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-tglu-1/igt@kms_frontbuffer_tracking@=
hdr-1p-primscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +6 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk2/igt@kms_frontbuffer_tracking@hd=
r-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/17517">i915#17517</a>) +35 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-tglu-9/igt@kms_frontbuffer_tracking@=
hdr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) +78 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-pwrite:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-rkl-3/igt@kms_frontbuffer_tracking@h=
dr-rgb101010-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +19 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk11/igt@kms_frontbuffer_tracking@p=
ipe-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/17534">i915#17534</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-cpu:</=
p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-dg1-19/igt@kms_frontbuffer_tracking@=
psr-1p-offscreen-pri-indfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +15=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-tglu-1/igt@kms_frontbuffer_tracking@=
psr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +17 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk10/igt@kms_frontbuffer_tracking@p=
sr-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/17482">i915#17482</a>) +5 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-mtlp-1/igt@kms_frontbuffer_tracking@=
psr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/18=
25">i915#1825</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-rkl-4/igt@kms_frontbuffer_tracking@p=
sr-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#18=
25</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-dg1-17/igt@kms_frontbuffer_tracking@=
psr-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +5 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-tglu-9/igt@kms_frontbuffer_tracking@=
psr-shrfb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +41 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-mtlp-7/igt@kms_frontbuffer_tracking@=
psrhdr-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#174=
28</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-rkl-4/igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Pa=
tchwork_177526v1/shard-rkl-7/igt@kms_hdmi_audio_bw@suspend-mem-audio-recove=
ry.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17110">i915#17110</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-mtlp-1/igt@kms_hdmi_inject@inject-au=
dio.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/15725">i915#15725</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-dg1-17/igt@kms_hdr@bpc-switch.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-tglu-3/igt@kms_hdr@bpc-switch-suspen=
d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/8228">i915#8228</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-rkl-8/igt@kms_hdr@invalid-hdr.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/16644">i915#16644</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk4/igt@kms_hdr@static-swap.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17498">i915#17498</a>) +1 other test skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-tglu-1/igt@kms_hdr@static-swap.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-end:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-dg2-1/igt@kms_invalid_mode@bad-hsync-end.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526=
v1/shard-dg2-7/igt@kms_invalid_mode@bad-hsync-end.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16746">i915#167=
46</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/3555">i915#3555</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk2/igt@kms_joiner@basic-ultra-join=
er.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17567">i915#17567</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-tglu-9/igt@kms_joiner@basic-ultra-jo=
iner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/15458">i915#15458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-mtlp-7/igt@kms_joiner@invalid-modese=
t-force-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/15458">i915#15458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-tglu-9/igt@kms_joiner@switch-modeset=
-ultra-joiner-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/15638">i915#15638</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/15722">i915#15722</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-revoke:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-dg2-3/igt@kms_lease@lease-revoke.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard=
-dg2-7/igt@kms_lease@lease-revoke.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) +45 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-dg1-17/igt@kms_pipe_b_c_ivb@enable-p=
ipe-c-while-b-has-3-lanes.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/17455">i915#17455</a>) +3 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-tglu-8/igt@kms_pipe_b_c_ivb@pipe-b-d=
pms-off-modeset-pipe-c.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/17455">i915#17455</a>) +5 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-yftiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-mtlp-7/igt@kms_pipe_stress@stress-xr=
gb8888-yftiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/14712">i915#14712</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk2/igt@kms_plane@pixel-format-4-ti=
led-bmg-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/17479">i915#17479</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping:<=
/p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-tglu-3/igt@kms_plane@pixel-format-4-=
tiled-dg2-mc-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +5=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-b-plane-5:</=
p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-dg2-4/igt@kms_plane@pixel-format-4-t=
iled-dg2-rc-ccs-modifier@pipe-b-plane-5.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/16386">i915#16386</a>) +1 o=
ther test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping:<=
/p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-tglu-1/igt@kms_plane@pixel-format-4-=
tiled-mtl-rc-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +2=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-linear-modifier:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-dg2-6/igt@kms_plane@pixel-format-linear-modifier.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwor=
k_177526v1/shard-dg2-7/igt@kms_plane@pixel-format-linear-modifier.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8=
825">i915#8825</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-rkl-3/igt@kms_plane@pixel-format-y-t=
iled-gen12-mc-ccs-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +3 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-mtlp-7/igt@kms_plane@pixel-format-y-=
tiled-gen12-rc-ccs-cc-modifier.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier@pipe-a-plane-4:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk2/igt@kms_plane@pixel-format-y-ti=
led-modifier@pipe-a-plane-4.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/17494">i915#17494</a>) +1 other test sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier@pipe-b-plane-7:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-tglu-9/igt@kms_plane@pixel-format-y-=
tiled-modifier@pipe-b-plane-7.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/16386">i915#16386</a>) +1 other test =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-dg1-19/igt@kms_plane@pixel-format-yf=
-tiled-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-dg1-17/igt@kms_plane@planar-pixel-fo=
rmat-settings@nv12-tile4-src-y.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/16112">i915#16112</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right@pipe-b:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-mtlp-1/igt@kms_plane@plane-panning-b=
ottom-right@pipe-b.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/15733">i915#15733</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-dg1-17/igt@kms_plane_multiple@2x-til=
ing-none.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-4:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk6/igt@kms_plane_multiple@tiling-4=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17542">i915#17542</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-tglu-1/igt@kms_plane_multiple@tiling=
-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/14259">i915#14259</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@=
pipe-d:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-dg2-3/igt@kms_plane_scaling@plane-scaler-with-clipping-=
clamping-pixel-formats@pipe-d.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-7/igt@kms_plane_sc=
aling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-d.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1532=
9">i915#15329</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17356">i915#17356</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-dg1-19/igt@kms_plane_scaling@plane-s=
caler-with-clipping-clamping-rotation.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#35=
55</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-tglu-8/igt@kms_plane_scaling@plane-s=
caler-with-clipping-clamping-rotation.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#35=
55</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-=
b:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-tglu-8/igt@kms_plane_scaling@plane-s=
caler-with-clipping-clamping-rotation@pipe-b.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>)=
 +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-rkl-8/igt@kms_plane_scaling@plane-up=
scale-20x20-with-rotation@pipe-a.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +7 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-dg1-17/igt@kms_plane_scaling@plane-u=
pscale-factor-0-25-with-rotation@pipe-d.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +8 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-dg2-6/igt@kms_plane_scaling@planes-downscale-factor-0-5=
-upscale-20x20.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/Patchwork_177526v1/shard-dg2-7/igt@kms_plane_scaling@planes-do=
wnscale-factor-0-5-upscale-20x20.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/94=
23">i915#9423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25:<=
/p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-dg2-6/igt@kms_plane_scaling@planes-downscale-factor-0-7=
5-upscale-factor-0-25.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-7/igt@kms_plane_scaling@pl=
anes-downscale-factor-0-75-upscale-factor-0-25.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1735=
6">i915#17356</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/6953">i915#6953</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/9423">i915#9423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-scaler-unity-scaling:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-dg2-3/igt@kms_plane_scaling@planes-scaler-unity-scaling=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/P=
atchwork_177526v1/shard-dg2-7/igt@kms_plane_scaling@planes-scaler-unity-sca=
ling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/15329">i915#15329</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/17356">i915#17356</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-a:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-dg2-3/igt@kms_plane_scaling@planes-scaler-unity-scaling=
@pipe-a.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/Patchwork_177526v1/shard-dg2-7/igt@kms_plane_scaling@planes-scaler-un=
ity-scaling@pipe-a.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/15329">i915#15329</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk10/igt@kms_pm_backlight@bad-brigh=
tness.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/17462">i915#17462</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-tglu-1/igt@kms_pm_backlight@basic-br=
ightness.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/12343">i915#12343</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/9812">i915#9812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk9/igt@kms_pm_backlight@brightness=
-with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17462">i915#17462</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-dg1-19/igt@kms_pm_backlight@fade-wit=
h-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/12343">i915#12343</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-tglu-8/igt@kms_pm_backlight@fade-wit=
h-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/12343">i915#12343</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/9812">i915#9812</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-rkl-3/igt@kms_pm_backlight@fade-with=
-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/12343">i915#12343</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-negative:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-dg2-6/igt@kms_pm_dc@dc5-dpms-negative.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/=
shard-dg2-7/igt@kms_pm_dc@dc5-dpms-negative.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13441">i915#13441</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr-suspend-resume:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk4/igt@kms_pm_dc@dc5-psr-suspend-r=
esume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/17495">i915#17495</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-tglu-1/igt@kms_pm_dc@dc5-psr-suspend=
-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/16914">i915#16914</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-tglu-9/igt@kms_pm_dc@dc6-dpms.html">=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/16479">i915#16479</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-dg1-15/igt@kms_pm_rpm@dpms-lpsp.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-=
dg1-16/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@fences:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-mtlp-7/igt@kms_pm_rpm@fences.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/4077">i915#4077</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-dg2-4/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwor=
k_177526v1/shard-dg2-5/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
5073">i915#15073</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-tglu-9/igt@kms_pm_rpm@modeset-non-lp=
sp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/15073">i915#15073</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-pc8-residency-stress:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-rkl-8/igt@kms_pm_rpm@modeset-pc8-res=
idency-stress.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/17434">i915#17434</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/17450">i915#17450</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@package-g7:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-tglu-3/igt@kms_pm_rpm@package-g7.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/15403">i915#15403</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-rkl-3/igt@kms_pm_rpm@package-g7.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/15403">i915#15403</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-idle:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-dg2-6/igt@kms_pm_rpm@system-suspend-idle.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526=
v1/shard-dg2-7/igt@kms_pm_rpm@system-suspend-idle.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519">i915#9519=
</a>)</li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-rkl-2/igt@kms_pm_rpm@system-suspend-idle.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526=
v1/shard-rkl-4/igt@kms_pm_rpm@system-suspend-idle.html">INCOMPLETE</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14419">i915=
#14419</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_properties@colorop-properties-atomic:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk4/igt@kms_properties@colorop-prop=
erties-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/17481">i915#17481</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-legacy:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-dg2-3/igt@kms_properties@plane-properties-legacy.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwor=
k_177526v1/shard-dg2-7/igt@kms_properties@plane-properties-legacy.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
1521">i915#11521</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-tglu-9/igt@kms_psr2_sf@fbc-pr-cursor=
-plane-update-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/11520">i915#11520</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-mtlp-7/igt@kms_psr2_sf@fbc-pr-overla=
y-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316">i915#12316</a>) +4 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk11/igt@kms_psr2_sf@fbc-pr-overlay=
-plane-update-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +1 other test sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-tglu-1/igt@kms_psr2_sf@fbc-pr-plane-=
move-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/11520">i915#11520</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-rkl-8/igt@kms_psr2_sf@fbc-pr-primary=
-plane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +7 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-=
edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-mtlp-1/igt@kms_psr2_sf@fbc-psr2-over=
lay-plane-move-continuous-exceed-sf@pipe-a-edp-1.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9808">i915#9808</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk10/igt@kms_psr2_sf@psr2-cursor-pl=
ane-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-dg1-17/igt@kms_psr2_sf@psr2-overlay-=
plane-update-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +3 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk9/igt@kms_psr2_sf@psr2-overlay-pr=
imary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +4 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk2/igt@kms_psr2_su@page_flip-nv12.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17546">i915#17546</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-tglu-9/igt@kms_psr2_su@page_flip-nv1=
2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/9683">i915#9683</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-rkl-3/igt@kms_psr2_su@page_flip-p010=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/9683">i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-blt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-dg1-19/igt@kms_psr@fbc-psr-primary-b=
lt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/9732">i915#9732</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-render:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-mtlp-7/igt@kms_psr@fbc-psr-sprite-re=
nder.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/9688">i915#9688</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-blt:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-tglu-1/igt@kms_psr@fbc-psr2-cursor-b=
lt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/9732">i915#9732</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk10/igt@kms_psr@fbc-psr2-primary-r=
ender.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/17480">i915#17480</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk11/igt@kms_psr@fbc-psr2-sprite-pl=
ane-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17480">i915#17480</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-plane-move:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-tglu-8/igt@kms_psr@pr-sprite-plane-m=
ove.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/9732">i915#9732</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-rkl-3/igt@kms_psr@psr2-primary-mmap-=
gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/9732">i915#9732</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk6/igt@kms_psr@psr2-primary-render=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17480">i915#17480</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk10/igt@kms_rotation_crc@multiplan=
e-rotation-cropping-bottom.html">INCOMPLETE</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15500">i915#15500</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16184">i915#16184<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-top:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk11/igt@kms_rotation_crc@multiplan=
e-rotation-cropping-top.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/15492">i915#15492</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16184">i915#16184</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-dg1-17/igt@kms_rotation_crc@primary-=
4-tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-mtlp-7/igt@kms_rotation_crc@primary-=
rotation-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/15867">i915#15867</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk2/igt@kms_rotation_crc@primary-y-=
tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/17488">i915#17488</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk10/igt@kms_rotation_crc@primary-y=
-tiled-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/17488">i915#17488</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-tglu-1/igt@kms_rotation_crc@primary-=
yf-tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/17432">i915#17432</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-rkl-7/igt@kms_rotation_crc@primary-y=
f-tiled-reflect-x-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/17432">i915#17432</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>) +1 other=
 test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-tglu-3/igt@kms_rotation_crc@primary-=
yf-tiled-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/17432">i915#17432</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_framebuffer:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk10/igt@kms_selftest@drm_framebuff=
er.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/13179">i915#13179</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-mtlp-7/igt@kms_tv_load_detect@load-d=
etect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/17445">i915#17445</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-rkl-7/igt@kms_vblank@ts-continuation-dpms-suspend.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwo=
rk_177526v1/shard-rkl-3/igt@kms_vblank@ts-continuation-dpms-suspend.html">I=
NCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/12276">i915#12276</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk2/igt@kms_vrr@flip-basic-fastset.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17520">i915#17520</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-tglu-9/igt@kms_vrr@flip-basic-fastse=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-tglu-8/igt@kms_vrr@flip-suspend.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/3555">i915#3555</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk6/igt@kms_vrr@lobf.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17561"=
>i915#17561</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-mtlp-1/igt@kms_vrr@lobf.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1192=
0">i915#11920</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-rkl-8/igt@kms_vrr@max-min.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/99=
06">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@gen12-mi-rpc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk2/igt@perf@gen12-mi-rpc.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
7536">i915#17536</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@perf@per-context-mode-unprivileged:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-dg1-19/igt@perf@per-context-mode-unp=
rivileged.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17455">i915#17455</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/2433">i915#2433</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk6/igt@perf@unprivileged-single-ct=
x-counters.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17704">i915#17704</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@event-wait@rcs0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-rkl-3/igt@perf_pmu@event-wait@rcs0.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17416">i915#17416</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-tglu-3/igt@perf_pmu@event-wait@rcs0.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17416">i915#17416</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-mtlp-7/igt@perf_pmu@module-unload.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17119">i915#17119</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-all-gts:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk2/igt@perf_pmu@rc6-all-gts.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17583">i915#17583</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-tglu-9/igt@perf_pmu@rc6-all-gts.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/8516">i915#8516</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_mmap_kms@buffer-sharing:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-dg2-3/igt@prime_mmap_kms@buffer-sharing.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v=
1/shard-dg2-7/igt@prime_mmap_kms@buffer-sharing.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17454">i915#17454</=
a>)</li>
</ul>
</li>
<li>
<p>igt@prime_udl@share-import-addfb:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-dg1-19/igt@prime_udl@share-import-ad=
dfb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/16420">i915#16420</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-tglu-8/igt@prime_udl@share-import-ad=
dfb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/16420">i915#16420</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-mtlp-1/igt@prime_vgem@basic-write.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/10216">i915#10216</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@coherency-gtt:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-tglu-1/igt@prime_vgem@coherency-gtt.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17429">i915#17429</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/17448">i915#17448</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk4/igt@prime_vgem@coherency-gtt.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17467">i915#17467</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-read-hang:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-mtlp-1/igt@prime_vgem@fence-read-han=
g.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-dg2-7/igt@fbdev@eof.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582">i915#2582</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shar=
d-dg2-8/igt@fbdev@eof.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@noreloc-s3:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-glk8/igt@gem_softpin@noreloc-s3.html">INCOMPLETE</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i9=
15#13356</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/13809">i915#13809</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/16193">i915#16193</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk9/igt@gem_softpin@=
noreloc-s3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>shard-tglu-1:       <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-tglu-1/igt@i915_selftest@live.html">ABORT</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-t=
glu-1/igt@i915_selftest@live.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>shard-tglu-1:       <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-tglu-1/igt@i915_selftest@live@hangcheck.html">ABORT</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16666"=
>i915#16666</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
Patchwork_177526v1/shard-tglu-1/igt@i915_selftest@live@hangcheck.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@debugfs-reader:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-rkl-4/igt@i915_suspend@debugfs-reader.html">INCOMPLETE<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/481=
7">i915#4817</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/Patchwork_177526v1/shard-rkl-5/igt@i915_suspend@debugfs-reader.html">PASS<=
/a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-rkl-3/igt@kms_async_flips@async-flip-suspend-resume.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/12761">i915#12761</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/Patchwork_177526v1/shard-rkl-4/igt@kms_async_flips@async-f=
lip-suspend-resume.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-dg2-7/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
7356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/Patchwork_177526v1/shard-dg2-8/igt@kms_big_fb@x-tiled-64bpp-rotate-180=
.html">PASS</a> +28 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-glk8/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-=
a-hdmi-a-1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15582">i915#15582</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk=
9/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1.html">PASS</=
a></li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-dg2-7/igt@kms_color@ctm-negative.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655">i915#12=
655</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17373">i915#17373</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/Patchwork_177526v1/shard-dg2-4/igt@kms_color@ctm-negative.html">PAS=
S</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-ctm3x4:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-dg2-7/igt@kms_color_pipeline@plane-lut1d-ctm3x4.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/15529">i915#15529</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/Patchwork_177526v1/shard-dg2-8/igt@kms_color_pipeline@plane-lut1d-ct=
m3x4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x42:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-tglu-3/igt@kms_cursor_crc@cursor-onscreen-128x42.html">=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/13566">i915#13566</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/Patchwork_177526v1/shard-tglu-7/igt@kms_cursor_crc@cursor-onscreen-=
128x42.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-rkl-3/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-2=
.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/12358">i915#12358</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/14152">i915#14152</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-7/igt@kms=
_cursor_crc@cursor-suspend@pipe-a-hdmi-a-2.html">PASS</a> +1 other test pas=
s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-left-edge:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-mtlp-7/igt@kms_cursor_edge_walk@256x256-left-edge.html"=
>INCOMPLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/P=
atchwork_177526v1/shard-mtlp-1/igt@kms_cursor_edge_walk@256x256-left-edge.h=
tml">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-dg2-7/igt@kms_flip@flip-vs-dpms-off-vs-modeset.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
5354">i915#5354</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/Patchwork_177526v1/shard-dg2-8/igt@kms_flip@flip-vs-dpms-off-vs-modeset=
.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-dg2-7/igt@kms_flip_tiling@flip-change-tiling.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/35=
55">i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/Patchwork_177526v1/shard-dg2-8/igt@kms_flip_tiling@flip-change-tiling.htm=
l">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-=
shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/16708">i915#16708</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-4=
/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html">PASS=
</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-tiling-linear:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-rkl-7/igt@kms_frontbuffer_tracking@fbchdr-tiling-linear=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/15989">i915#15989</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/Patchwork_177526v1/shard-rkl-6/igt@kms_frontbuffer_tracking@=
fbchdr-tiling-linear.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-glk2/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-s=
hrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/17517">i915#17517</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-glk8/igt@kms_frontb=
uffer_tracking@hdr-2p-primscrn-pri-shrfb-draw-render.html">PASS</a> +2 othe=
r tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-rkl-7/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644">i915#166=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/8228">i915#8228</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-6/igt@kms_hdr@static-toggle=
.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-dg2-7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr=
24.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/11190">i915#11190</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-4/igt@kms_pip=
e_crc_basic@compare-crc-sanitycheck-xr24.html">PASS</a> +1 other test pass<=
/li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-dg2-7/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-mod=
ifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/8825">i915#8825</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-4/igt@kms_plane@pixel-format=
-4-tiled-dg2-rc-ccs-modifier.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-dg2-7/igt@kms_plane_scaling@plane-downscale-factor-0-5-=
with-modifiers.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/15329">i915#15329</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526=
v1/shard-dg2-8/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifi=
ers.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-dg2-7/igt@kms_plane_scaling@planes-downscale-factor-0-5=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/15329">i915#15329</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/17356">i915#17356</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526=
v1/shard-dg2-4/igt@kms_plane_scaling@planes-downscale-factor-0-5.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-dg2-7/igt@kms_plane_scaling@planes-downscale-factor-0-5=
@pipe-a.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/15329">i915#15329</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-4/igt@kms_plane_scaling@=
planes-downscale-factor-0-5@pipe-a.html">PASS</a> +11 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-dg2-7/igt@kms_plane_scaling@planes-upscale-factor-0-25.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/15329">i915#15329</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/17356">i915#17356</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i=
915#9423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Pat=
chwork_177526v1/shard-dg2-4/igt@kms_plane_scaling@planes-upscale-factor-0-2=
5.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-d:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-dg2-7/igt@kms_plane_scaling@planes-upscale-factor-0-25@=
pipe-d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/15329">i915#15329</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-4/igt@kms=
_plane_scaling@planes-upscale-factor-0-25@pipe-d.html">PASS</a> +3 other te=
sts pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-dg2-1/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#150=
73</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork=
_177526v1/shard-dg2-4/igt@kms_pm_rpm@dpms-lpsp.html">PASS</a> +1 other test=
 pass</li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-rkl-4/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#150=
73</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork=
_177526v1/shard-rkl-8/igt@kms_pm_rpm@dpms-lpsp.html">PASS</a> +2 other test=
s pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-dg1-17/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073=
">i915#15073</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/Patchwork_177526v1/shard-dg1-15/igt@kms_pm_rpm@modeset-lpsp-stress.html">P=
ASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-rkl-1/igt@kms_vblank@ts-continuation-suspend.html">ABOR=
T</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
5132">i915#15132</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/Patchwork_177526v1/shard-rkl-8/igt@kms_vblank@ts-continuation-suspend.=
html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_ctx_isolation@preservation-s3:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-mtlp-5/igt@gem_ctx_isolation@preservation-s3.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17=
176">i915#17176</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/Patchwork_177526v1/shard-mtlp-6/igt@gem_ctx_isolation@preservation-s3.h=
tml">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17146">i915#17146</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@engines:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-rkl-7/igt@gem_ctx_sseu@engines.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177=
526v1/shard-rkl-6/igt@gem_ctx_sseu@engines.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i91=
5#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-rkl-6/igt@gem_eio@in-flight-suspend.html">INCOMPLETE</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13390=
">i915#13390</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17327">i915#17327</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/Patchwork_177526v1/shard-rkl-1/igt@gem_eio@in-flight-suspe=
nd.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/15131">i915#15131</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-master:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-rkl-7/igt@gem_exec_params@secure-non-master.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/174=
16">i915#17416</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/Patchwork_177526v1/shard-rkl-6/igt@gem_exec_params@secure-non-master.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/17416">i915#17416</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-rkl-6/igt@gem_exec_reloc@basic-cpu.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#=
14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/3281">i915#3281</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/Patchwork_177526v1/shard-rkl-1/igt@gem_exec_reloc@basic-cpu.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/3281">i915#3281</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-rkl-5/igt@gem_exec_reloc@basic-write-read.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281"=
>i915#3281</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/P=
atchwork_177526v1/shard-rkl-6/igt@gem_exec_reloc@basic-write-read.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
4544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3281">i915#3281</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-multi:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-rkl-6/igt@gem_lmem_swapping@heavy-multi.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">=
i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/4613">i915#4613</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/Patchwork_177526v1/shard-rkl-1/igt@gem_lmem_swapping@heavy-mul=
ti.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-rkl-7/igt@gem_lmem_swapping@parallel-random.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/461=
3">i915#4613</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/Patchwork_177526v1/shard-rkl-6/igt@gem_lmem_swapping@parallel-random.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@noreloc-s3:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-rkl-1/igt@gem_softpin@noreloc-s3.html">ABORT</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15131">i915#1=
5131</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwo=
rk_177526v1/shard-rkl-3/igt@gem_softpin@noreloc-s3.html">INCOMPLETE</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13809">i91=
5#13809</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/16226">i915#16226</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_pwrite:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-rkl-7/igt@gem_tiled_pread_pwrite.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#328=
2</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_=
177526v1/shard-rkl-6/igt@gem_tiled_pread_pwrite.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/328=
2">i915#3282</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-out:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-rkl-7/igt@gen9_exec_parse@bb-start-out.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i9=
15#2527</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patc=
hwork_177526v1/shard-rkl-6/igt@gen9_exec_parse@bb-start-out.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">=
i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/2527">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@media-rc6-accuracy:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-rkl-7/igt@i915_pm_rc6_residency@media-rc6-accuracy.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/16080">i915#16080</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/16166">i915#16166</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-6/igt@i915_pm_rc6_re=
sidency@media-rc6-accuracy.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16080">i915#16080</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16166">i=
915#16166</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-dg2-6/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
7431">i915#17431</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/Patchwork_177526v1/shard-dg2-7/igt@kms_big_fb@4-tiled-16bpp-rotate-270=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-rkl-7/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/453=
8">i915#4538</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/5286">i915#5286</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/Patchwork_177526v1/shard-rkl-6/igt@kms_big_fb@4-tiled-64bpp-=
rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-dg2-7/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/173=
56">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/Patchwork_177526v1/shard-dg2-4/igt@kms_big_fb@linear-16bpp-rotate-90.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17431">i915#17431</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-rkl-7/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/174=
31">i915#17431</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3638">i915#3638</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/Patchwork_177526v1/shard-rkl-6/igt@kms_big_fb@linear-8bpp-=
rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/17431">i915#17431</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) +1 =
other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-dg2-6/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-=
180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/3828">i915#3828</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-7/igt@kms_big_fb@linear-=
max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) +1 othe=
r test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-dg2-1/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/5190">i915#5190</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/Patchwork_177526v1/shard-dg2-7/igt@kms_big_fb@y-tiled-addfb-si=
ze-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/17356">i915#17356</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-dg2-7/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate=
-0-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/17356">i915#17356</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-8/ig=
t@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">=
i915#4538</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/5190">i915#5190</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-dg2-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate=
-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg=
2-7/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17356">i915#17356</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/5190">i915#5190</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-rkl-7/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
4538">i915#4538</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/Patchwork_177526v1/shard-rkl-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-270=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/4538">i915#4538</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-rkl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotat=
e-180-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-1=
/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
4538">i915#4538</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-rkl-7/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/12313">i915#12313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/Patchwork_177526v1/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled=
-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/12313">i915#12313</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-dg2-7/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-cc=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/Patchwork_177526v1/shard-dg2-8/igt@kms_ccs@ccs-on-another-b=
o-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +6 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-dg2-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-=
mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/10307">i915#10307</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/10434">i915#10434</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard=
-dg2-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1735=
6">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-dg2-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/12805">i915#12805</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/Patchwork_177526v1/shard-dg2-7/igt@kms_ccs@crc-primary-suspend=
-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-dg2-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-=
ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/Patchwork_177526v1/shard-dg2-7/igt@kms_ccs@crc-primary-susp=
end-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-dg2-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-c=
cs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/Patchwork_177526v1/shard-dg2-4/igt@kms_ccs@crc-sprite-plan=
es-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-rkl-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-m=
c-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/14098">i915#14098</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-6/igt@kms_cc=
s@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"=
>i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/6095">i915#6095</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-2:<=
/p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-rkl-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-m=
c-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-6/igt@kms_cc=
s@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-2.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"=
>i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/6095">i915#6095</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-dg2-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-r=
c-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/10307">i915#10307</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-7/igt@kms=
_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#173=
56</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-dg2-1/igt@kms_cdclk@mode-transition-all-outputs.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/16017">i915#16017</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/Patchwork_177526v1/shard-dg2-7/igt@kms_cdclk@mode-transition-all-out=
puts.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-rkl-6/igt@kms_chamelium_color@ctm-limited-range.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17427">i915#17427</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-1/igt@kms_chamelium_col=
or@ctm-limited-range.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/17427">i915#17427</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-rkl-7/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3=
x4-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/16471">i915#16471</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-6/igt@k=
ms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14=
544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/16471">i915#16471</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17427">i915#17427</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-fast:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-rkl-7/igt@kms_chamelium_frames@dp-crc-fast.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1115=
1">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/7828">i915#7828</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/Patchwork_177526v1/shard-rkl-6/igt@kms_chamelium_frames@dp-=
crc-fast.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +1 ot=
her test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-dg2-7/igt@kms_content_protection@atomic-dpms.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17=
356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/Patchwork_177526v1/shard-dg2-4/igt@kms_content_protection@atomic-dpms.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/15865">i915#15865</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-rkl-7/igt@kms_content_protection@dp-mst-lic-type-1.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/15330">i915#15330</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/3116">i915#3116</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-6/igt@kms_content_prot=
ection@dp-mst-lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116">i915=
#3116</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-dg2-7/igt@kms_content_protection@dp-mst-type-0.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/Patchwork_177526v1/shard-dg2-4/igt@kms_content_protection@dp-mst-type=
-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/15330">i915#15330</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-hdcp14:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-rkl-6/igt@kms_content_protection@dp-mst-type-0-hdcp14.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/15330">i915#15330</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-1/igt@kms_content=
_protection@dp-mst-type-0-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-suspend-resume:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-dg2-7/igt@kms_content_protection@dp-mst-type-0-suspend-=
resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-8/igt@kms_content_protect=
ion@dp-mst-type-0-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1-suspend-resume:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-dg2-1/igt@kms_content_protection@dp-mst-type-1-suspend-=
resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/15330">i915#15330</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-7/igt@kms_content_protect=
ion@dp-mst-type-1-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy-hdcp14:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-rkl-7/igt@kms_content_protection@legacy-hdcp14.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
15865">i915#15865</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/Patchwork_177526v1/shard-rkl-6/igt@kms_content_protection@legacy-hdcp=
14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/15865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-dg2-3/igt@kms_content_protection@mei-interface.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
15865">i915#15865</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/Patchwork_177526v1/shard-dg2-7/igt@kms_content_protection@mei-interfa=
ce.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17356">i915#17356</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-dg2-7/igt@kms_cursor_crc@cursor-offscreen-512x512.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/17356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/Patchwork_177526v1/shard-dg2-8/igt@kms_cursor_crc@cursor-offscreen=
-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-rkl-6/igt@kms_cursor_crc@cursor-random-512x512.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
13049">i915#13049</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-1/igt@kms_cursor_crc@cur=
sor-random-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-max-size:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-dg2-1/igt@kms_cursor_crc@cursor-random-max-size.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/3555">i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/Patchwork_177526v1/shard-dg2-7/igt@kms_cursor_crc@cursor-random-max-si=
ze.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17356">i915#17356</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-dg2-3/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/13046">i915#13046</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/17454">i915#17454</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-7/igt=
@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-dg2-7/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-si=
ze.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/Patchwork_177526v1/shard-dg2-8/igt@kms_cursor_legacy@curso=
rb-vs-flipb-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/13046">i915#13046</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/17454">i915#17454</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915=
#5354</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:<=
/p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-dg2-6/igt@kms_cursor_legacy@short-busy-flip-before-curs=
or-atomic-transitions.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-7/igt@kms_cu=
rsor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356"=
>i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-dg2-6/igt@kms_display_modes@extended-mode-basic.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/13691">i915#13691</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/Patchwork_177526v1/shard-dg2-7/igt@kms_display_modes@extended-mode-b=
asic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-rkl-7/igt@kms_dp_link_training@non-uhbr-mst-tbtalt-trai=
n.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17291">i915#17291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/Patchwork_177526v1/shard-rkl-6/igt@kms_dp_link_training@non=
-uhbr-mst-tbtalt-train.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/17291">i915#17291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-dg2-7/igt@kms_dp_link_training@non-uhbr-sst-tbtalt-trai=
n.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/Patchwork_177526v1/shard-dg2-4/igt@kms_dp_link_training@non=
-uhbr-sst-tbtalt-train.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/17290">i915#17290</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst-direct-train:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-dg2-1/igt@kms_dp_link_training@uhbr-mst-direct-train.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17285">i915#17285</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/Patchwork_177526v1/shard-dg2-7/igt@kms_dp_link_training@uhbr-ms=
t-direct-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-dg2-7/igt@kms_dp_linktrain_fallback@dp-fallback.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/Patchwork_177526v1/shard-dg2-8/igt@kms_dp_linktrain_fallback@dp-fall=
back.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/16867">i915#16867</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-dg2-1/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177=
526v1/shard-dg2-7/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190">i915#11190</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915=
#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats-bigjoiner:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-dg2-6/igt@kms_dsc@dsc-with-formats-bigjoiner.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16=
361">i915#16361</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/Patchwork_177526v1/shard-dg2-7/igt@kms_dsc@dsc-with-formats-bigjoiner.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17356">i915#17356</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-bigjoiner:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-rkl-7/igt@kms_dsc@dsc-with-output-formats-bigjoiner.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/16361">i915#16361</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/Patchwork_177526v1/shard-rkl-6/igt@kms_dsc@dsc-with-output-forma=
ts-bigjoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-dg2-7/igt@kms_dsc@dsc-with-output-formats-with-bpc-bigj=
oiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/17356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-8/igt@kms_dsc@dsc-with-out=
put-formats-with-bpc-bigjoiner.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-rkl-7/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16680">i915#16680</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177=
526v1/shard-rkl-6/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16680">i915=
#16680</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-rkl-7/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/9934">i915#9934</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/Patchwork_177526v1/shard-rkl-6/igt@kms_flip@2x-flip-vs-blocking-wf-vb=
lank.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-glk2/igt@kms_flip@2x-flip-vs-suspend-interruptible.html=
">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/12745">i915#12745</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/17183">i915#17183</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_1=
77526v1/shard-glk8/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">INCO=
MPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/12314">i915#12314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/12745">i915#12745</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17183">i915#17183</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i=
915#4839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-glk2/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-h=
dmi-a1-hdmi-a2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17183">i915#17=
183</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwor=
k_177526v1/shard-glk8/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi=
-a1-hdmi-a2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/12314">i915#12314</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#133=
56</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17183">i915#17183</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-glk5/igt@kms_flip@flip-vs-suspend-interruptible.html">I=
NCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/12314">i915#12314</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/12745">i915#12745</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17183">i915#17183</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839=
">i915#4839</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/6113">i915#6113</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177526v1/shard-glk9/igt@kms_flip@flip-vs-suspend-in=
terruptible.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17183">i915#171=
83</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/4839">i915#4839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-glk5/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-=
a1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/12314">i915#12314</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17183">i91=
5#17183</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patc=
hwork_177526v1/shard-glk9/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi=
-a1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/12745">i915#12745</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/17183">i915#17183</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-rkl-3/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi=
-a2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/16276">i915#16276</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/6113">i915#6113</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-1/igt@km=
s_flip@flip-vs-suspend-interruptible@a-hdmi-a2.html">ABORT</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132">i915#15132</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/169=
25">i915#16925</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp=
-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1=
/shard-rkl-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rccc=
s-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/15643">i915#15643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-rkl-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp=
-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-6/igt@k=
ms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/15643">i915#15643</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri=
-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/15104">i915#15104</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-=
dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-wc.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/16708">i915#16708</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-=
indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2=
-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/16708">i915#16708</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/5354">i915#5354</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-=
indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/17428">i915#17428</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl=
-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/17428">i915#17428</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +3 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-cur-indfb-draw-pwrite:</=
p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-dg2-3/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-c=
ur-indfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/15991">i915#15991</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-7/igt@kms_f=
rontbuffer_tracking@fbchdr-2p-scndscrn-cur-indfb-draw-pwrite.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708"=
>i915#16708</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-c=
ur-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-1=
/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/151=
02">i915#15102</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-gtt:=
</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-p=
ri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/16708">i915#16708</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard=
-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-=
gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/15990">i915#15990</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/8708">i915#8708</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-s=
hrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/16708">i915#16708</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-4=
/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
5991">i915#15991</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/5354">i915#5354</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-c=
ur-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/15991">i915#15991</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-7/ig=
t@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708"=
>i915#16708</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/5354">i915#5354</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-mmap-=
cpu:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscre=
en-pri-indfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-7/igt=
@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-mmap-cpu.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/16708">i915#16708</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscr=
n-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/16708">i915#16708</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-4/igt@kms_fro=
ntbuffer_tracking@fbcpsrhdr-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i91=
5#15102</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscr=
n-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-6/igt@kms_fro=
ntbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i91=
5#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/15102">i915#15102</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-draw-mmap-g=
tt:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscr=
n-spr-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-7/igt@=
kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-draw-mmap-gtt.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/16708">i915#16708</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-shrfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-shrfb-f=
liptrack-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/17428">i915#17428</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-6/igt@kms_fron=
tbuffer_tracking@fbcpsrhdr-2p-shrfb-fliptrack-mmap-gtt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#=
14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/17428">i915#17428</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-pwrite:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-dg2-7/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri=
-indfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/16708">i915#16708</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-8/igt@kms_fro=
ntbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-pwrite.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i91=
5#15989</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-dg2-3/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-=
shrfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/15989">i915#15989</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-7/igt@kms_fr=
ontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i=
915#16708</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-dg2-7/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/16708">i915#16708</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/4342">i915#4342</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-4/igt@kms_f=
rontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/9766">i915#9766</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri=
-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/16708">i915#16708</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-4/igt@kms_fr=
ontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104">i=
915#15104</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/15990">i915#15990</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-=
indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-7/igt@kms_frontbuffer=
_tracking@psr-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915=
#5354</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-indfb-scaledprim=
ary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/16708">i915#16708</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-4/igt@kms_fron=
tbuffer_tracking@psr-indfb-scaledprimary.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +6 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-dg2-7/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-p=
ri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/16708">i915#16708</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-4/igt@kms_=
frontbuffer_tracking@psrhdr-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1599=
0">i915#15990</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-dg2-7/igt@kms_frontbuffer_tracking@psrhdr-2p-pri-indfb-=
multidraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/16708">i915#16708</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-4/igt@kms_frontbuffer_=
tracking@psrhdr-2p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a>) +18 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-draw-mmap-gtt:=
</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-rkl-6/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-s=
pr-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1/sha=
rd-rkl-1/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-draw-mma=
p-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/17428">i915#17428</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-rkl-6/igt@kms_hdr@bpc-switch-suspend.html">INCOMPLETE</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1543=
6">i915#15436</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/Patchwork_177526v1/shard-rkl-3/igt@kms_hdr@bpc-switch-suspend.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/166=
44">i915#16644</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-dg2-7/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i9=
15#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Pat=
chwork_177526v1/shard-dg2-8/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">=
i915#12713</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/16518">i915#16518</a>)</li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-rkl-1/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644">i9=
15#16644</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Pat=
chwork_177526v1/shard-rkl-3/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187">i=
915#1187</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/12713">i915#12713</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/16644">i915#16644</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-dg2-7/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356"=
>i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
Patchwork_177526v1/shard-dg2-4/igt@kms_hdr@invalid-metadata-sizes.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
6518">i915#16518</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-dg2-6/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16518">i91=
5#16518</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/8228">i915#8228</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-dg2-7/igt@kms_hdr@static-t=
oggle-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-dg2-7/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#=
17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchw=
ork_177526v1/shard-dg2-4/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301">i915#63=
01</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-dg2-6/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958"=
>i915#13958</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
Patchwork_177526v1/shard-dg2-7/igt@kms_plane_multiple@2x-tiling-4.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
7356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-rkl-6/igt@kms_plane_multiple@2x-tiling-x.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958"=
>i915#13958</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/Patchwork_177526v1/shard-rkl-1/igt@kms_plane_multiple@2x-ti=
ling-x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-dg2-7/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356"=
>i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
Patchwork_177526v1/shard-dg2-8/igt@kms_plane_multiple@2x-tiling-y.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
3958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-4:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-rkl-7/igt@kms_plane_multiple@tiling-4.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259">i9=
15#14259</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Pat=
chwork_177526v1/shard-rkl-6/igt@kms_plane_multiple@tiling-4.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259">=
i915#14259</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-rkl-7/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-=
dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/11520">i915#11520</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-6/igt@kms_psr2_sf@fbc-p=
r-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14=
544</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-rkl-7/igt@kms_psr@pr-primary-mmap-gtt.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i91=
5#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/9732">i915#9732</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/Patchwork_177526v1/shard-rkl-6/igt@kms_psr@pr-primary-mmap-gtt.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +5 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-dg2-7/igt@kms_scaling_modes@scaling-mode-none.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
7356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/Patchwork_177526v1/shard-dg2-4/igt@kms_scaling_modes@scaling-mode-none=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-rkl-5/igt@kms_setmode@clone-exclusive-crtc.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555=
">i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
Patchwork_177526v1/shard-rkl-6/igt@kms_setmode@clone-exclusive-crtc.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-rkl-7/igt@kms_vrr@lobf.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920">i915#11920</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177526v1=
/shard-rkl-6/igt@kms_vrr@lobf.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/11920">i915#11920</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-dg2-6/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906"=
>i915#9906</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/P=
atchwork_177526v1/shard-dg2-7/igt@kms_vrr@seamless-rr-switch-drrs.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
7356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-rkl-7/igt@perf@unprivileged-single-ctx-counters.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/2433">i915#2433</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/Patchwork_177526v1/shard-rkl-6/igt@perf@unprivileged-single-ctx-counte=
rs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/2433">i915#2433</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-rkl-7/igt@prime_vgem@basic-write.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17448">i915#17=
448</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3291">i915#3291</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/3708">i915#3708</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/Patchwork_177526v1/shard-rkl-6/igt@prime_vgem@basic-wri=
te.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/17448">i915#17448</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a=
>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-read-hang:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19433/shard-rkl-7/igt@prime_vgem@fence-read-hang.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17448">i91=
5#17448</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3708">i915#3708</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/Patchwork_177526v1/shard-rkl-6/igt@prime_vgem@fence-read-hang.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/17448">i915#17448</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_19433 -&gt; Patchwork_177526v1</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19433: 0f5e7199aaceed05aa49dad4c97df2677e32f779 @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGT_9175: 9175<br />
  Patchwork_177526v1: 0f5e7199aaceed05aa49dad4c97df2677e32f779 @ git://anon=
git.freedesktop.org/gfx-ci/linux<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============7128412604185327517==--
