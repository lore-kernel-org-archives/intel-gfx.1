Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77087C98314
	for <intel-gfx@archiver.kernel.org>; Thu, 24 Sep 2026 07:34:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5BD410F33B;
	Thu, 24 Sep 2026 07:34:21 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69FFA10F33B;
 Thu, 24 Sep 2026 07:34:20 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2208040463014973888=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_drm/i915/psr=3A_Allow_Pa?=
 =?utf-8?q?nel_Replay_and_PSR2_with_joiner?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mika Kahola" <mika.kahola@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Thu, 24 Sep 2026 07:34:20 -0000
Message-ID: <179023526041.201310.15522857114951157776@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260923115941.746934-1-mika.kahola@intel.com>
In-Reply-To: <20260923115941.746934-1-mika.kahola@intel.com>
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

--===============2208040463014973888==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/psr: Allow Panel Replay and PSR2 with joiner
URL   : https://patchwork.freedesktop.org/series/174791/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_19207_full -> Patchwork_174791v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with Patchwork_174791v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in Patchwork_174791v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (10 -> 10)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in Patchwork_174791v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_ctx_isolation@preservation-s3@ccs0:
    - shard-mtlp:         NOTRUN -> [ABORT][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-mtlp-3/igt@gem_ctx_isolation@preservation-s3@ccs0.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
    - shard-dg2:          [PASS][2] -> [DMESG-WARN][3]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-dg2-1/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-dg2-3/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@preservation-s3:
    - shard-mtlp:         [INCOMPLETE][4] ([i915#13356]) -> [ABORT][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-mtlp-4/igt@gem_ctx_isolation@preservation-s3.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-mtlp-3/igt@gem_ctx_isolation@preservation-s3.html

  
New tests
---------

  New tests have been introduced between CI_DRM_19207_full and Patchwork_174791v1_full:

### New IGT tests (22) ###

  * igt@i915_module_load@2x-flip-vs-panning:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_module_load@bad-pixel-format-4-tiled-dg2-rc-ccs-cc:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_module_load@crc-primary-rotation-180-4-tiled-dg2-mc-ccs:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_module_load@dc5-psr:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_module_load@fbc-2p-scndscrn-pri-indfb-draw-pwrite:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_module_load@fbchdr-1p-primscrn-pri-shrfb-draw-mmap-cpu:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_module_load@fbcpsr-1p-indfb-fliptrack-mmap-gtt:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_module_load@fbcpsr-2p-scndscrn-pri-shrfb-draw-render:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_module_load@fbcpsr-rgb565-draw-mmap-wc:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_module_load@fbcpsrhdr-2p-primscrn-pri-shrfb-draw-blt:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_module_load@fences-dpms:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_module_load@hdr-1p-primscrn-pri-shrfb-draw-render:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_module_load@hdr-2p-scndscrn-spr-indfb-draw-mmap-cpu:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_module_load@missing-ccs-buffer-y-tiled-gen12-mc-ccs:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_module_load@pc8-residency:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_module_load@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_module_load@psr-2p-primscrn-pri-shrfb-draw-mmap-gtt:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_module_load@psrhdr-1p-offscreen-pri-shrfb-draw-mmap-cpu:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_module_load@psrhdr-2p-scndscrn-pri-indfb-draw-mmap-cpu:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_module_load@rc6-fence:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_module_load@timestamp-moving:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_module_load@x-tiled-max-hw-stride-32bpp-rotate-0:
    - Statuses :
    - Exec time: [None] s

  

Known issues
------------

  Here are the changes found in Patchwork_174791v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@object-reloc-purge-cache:
    - shard-dg1:          NOTRUN -> [SKIP][6] ([i915#8411])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-dg1-18/igt@api_intel_bb@object-reloc-purge-cache.html

  * igt@device_reset@cold-reset-bound:
    - shard-tglu:         NOTRUN -> [SKIP][7] ([i915#11078])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-2/igt@device_reset@cold-reset-bound.html

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-tglu-1:       NOTRUN -> [SKIP][8] ([i915#11078])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-1/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-rkl:          NOTRUN -> [SKIP][9] ([i915#9323])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-5/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_ccs@block-multicopy-inplace:
    - shard-rkl:          NOTRUN -> [SKIP][10] ([i915#3555] / [i915#9323])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-8/igt@gem_ccs@block-multicopy-inplace.html
    - shard-tglu:         NOTRUN -> [SKIP][11] ([i915#3555] / [i915#9323])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-4/igt@gem_ccs@block-multicopy-inplace.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-tglu-1:       NOTRUN -> [SKIP][12] ([i915#3555] / [i915#9323])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-1/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_ccs@suspend-resume@tile64-compressed-compfmt0-smem-lmem0:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][13] ([i915#13356] / [i915#16348])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-dg2-4/igt@gem_ccs@suspend-resume@tile64-compressed-compfmt0-smem-lmem0.html

  * igt@gem_create@create-ext-cpu-access-sanity-check:
    - shard-tglu:         NOTRUN -> [SKIP][14] ([i915#6335])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-2/igt@gem_create@create-ext-cpu-access-sanity-check.html

  * igt@gem_create@create-ext-set-pat:
    - shard-tglu:         NOTRUN -> [SKIP][15] ([i915#8562])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-4/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_isolation@preservation-s3@vcs1:
    - shard-mtlp:         NOTRUN -> [FAIL][16] ([i915#17176]) +3 other tests fail
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-mtlp-3/igt@gem_ctx_isolation@preservation-s3@vcs1.html

  * igt@gem_ctx_persistence@hang:
    - shard-snb:          NOTRUN -> [SKIP][17] ([i915#1099])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-snb6/igt@gem_ctx_persistence@hang.html

  * igt@gem_ctx_persistence@legacy-engines-hang@blt:
    - shard-glk11:        NOTRUN -> [SKIP][18] +118 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-glk11/igt@gem_ctx_persistence@legacy-engines-hang@blt.html

  * igt@gem_exec_balancer@bonded-pair:
    - shard-dg1:          NOTRUN -> [SKIP][19] ([i915#4771])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-dg1-18/igt@gem_exec_balancer@bonded-pair.html

  * igt@gem_exec_balancer@parallel-keep-submit-fence:
    - shard-tglu:         NOTRUN -> [SKIP][20] ([i915#4525])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-10/igt@gem_exec_balancer@parallel-keep-submit-fence.html

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-rkl:          NOTRUN -> [SKIP][21] ([i915#4525]) +2 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-7/igt@gem_exec_balancer@parallel-ordering.html
    - shard-tglu-1:       NOTRUN -> [SKIP][22] ([i915#4525]) +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-1/igt@gem_exec_balancer@parallel-ordering.html

  * igt@gem_exec_big@single:
    - shard-tglu:         NOTRUN -> [FAIL][23] ([i915#15816])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-9/igt@gem_exec_big@single.html

  * igt@gem_exec_capture@capture-invisible@smem0:
    - shard-glk:          NOTRUN -> [SKIP][24] ([i915#6334]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-glk8/igt@gem_exec_capture@capture-invisible@smem0.html

  * igt@gem_exec_reloc@basic-cpu-gtt-noreloc:
    - shard-rkl:          NOTRUN -> [SKIP][25] ([i915#3281]) +4 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-8/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html

  * igt@gem_exec_reloc@basic-gtt-cpu:
    - shard-dg1:          NOTRUN -> [SKIP][26] ([i915#3281]) +3 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-dg1-18/igt@gem_exec_reloc@basic-gtt-cpu.html

  * igt@gem_exec_suspend@basic-s0@smem:
    - shard-dg2:          [PASS][27] -> [INCOMPLETE][28] ([i915#13356])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-dg2-4/igt@gem_exec_suspend@basic-s0@smem.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-dg2-4/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglu:         NOTRUN -> [SKIP][29] ([i915#2190])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-10/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@heavy-multi:
    - shard-rkl:          NOTRUN -> [SKIP][30] ([i915#4613]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-8/igt@gem_lmem_swapping@heavy-multi.html

  * igt@gem_lmem_swapping@heavy-verify-random-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][31] ([i915#4613]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-1/igt@gem_lmem_swapping@heavy-verify-random-ccs.html

  * igt@gem_lmem_swapping@verify-random-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][32] ([i915#4613]) +3 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-10/igt@gem_lmem_swapping@verify-random-ccs.html

  * igt@gem_mmap_gtt@cpuset-medium-copy-xy:
    - shard-dg1:          NOTRUN -> [SKIP][33] ([i915#4077]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-dg1-18/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
    - shard-rkl:          NOTRUN -> [SKIP][34] ([i915#3282]) +4 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-8/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html

  * igt@gem_pread@exhaustion:
    - shard-dg1:          NOTRUN -> [SKIP][35] ([i915#3282])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-dg1-18/igt@gem_pread@exhaustion.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-tglu:         NOTRUN -> [SKIP][36] ([i915#3297]) +2 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-2/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@unsync-overlap:
    - shard-tglu-1:       NOTRUN -> [SKIP][37] ([i915#3297])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-1/igt@gem_userptr_blits@unsync-overlap.html

  * igt@gem_userptr_blits@unsync-unmap-after-close:
    - shard-rkl:          NOTRUN -> [SKIP][38] ([i915#3297]) +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-8/igt@gem_userptr_blits@unsync-unmap-after-close.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-rkl:          [PASS][39] -> [INCOMPLETE][40] ([i915#13356]) +1 other test incomplete
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-4/igt@gem_workarounds@suspend-resume-fd.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-3/igt@gem_workarounds@suspend-resume-fd.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-glk:          NOTRUN -> [ABORT][41] ([i915#5566])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-glk3/igt@gen9_exec_parse@allowed-single.html

  * igt@gen9_exec_parse@batch-without-end:
    - shard-rkl:          NOTRUN -> [SKIP][42] ([i915#2527]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-8/igt@gen9_exec_parse@batch-without-end.html

  * igt@gen9_exec_parse@batch-zero-length:
    - shard-tglu:         NOTRUN -> [SKIP][43] ([i915#2527] / [i915#2856]) +4 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-2/igt@gen9_exec_parse@batch-zero-length.html

  * igt@gen9_exec_parse@bb-start-param:
    - shard-dg1:          NOTRUN -> [SKIP][44] ([i915#2527]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-dg1-18/igt@gen9_exec_parse@bb-start-param.html

  * igt@gen9_exec_parse@unaligned-jump:
    - shard-tglu-1:       NOTRUN -> [SKIP][45] ([i915#2527] / [i915#2856]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-1/igt@gen9_exec_parse@unaligned-jump.html

  * igt@i915_module_load@fault-injection@uc_fw_rsa_data_create:
    - shard-mtlp:         [PASS][46] -> [INCOMPLETE][47] ([i915#16978])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-mtlp-4/igt@i915_module_load@fault-injection@uc_fw_rsa_data_create.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-mtlp-3/igt@i915_module_load@fault-injection@uc_fw_rsa_data_create.html

  * igt@i915_module_load@reload-no-display:
    - shard-tglu:         NOTRUN -> [DMESG-WARN][48] ([i915#13029] / [i915#14545])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-10/igt@i915_module_load@reload-no-display.html

  * igt@i915_module_load@resize-bar:
    - shard-tglu:         NOTRUN -> [SKIP][49] ([i915#6412])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-2/igt@i915_module_load@resize-bar.html

  * igt@i915_pm_freq_api@freq-reset:
    - shard-rkl:          NOTRUN -> [SKIP][50] ([i915#8399])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-7/igt@i915_pm_freq_api@freq-reset.html

  * igt@i915_pm_freq_api@freq-reset-multiple:
    - shard-tglu-1:       NOTRUN -> [SKIP][51] ([i915#8399]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-1/igt@i915_pm_freq_api@freq-reset-multiple.html

  * igt@i915_pm_freq_mult@media-freq@gt0:
    - shard-tglu:         NOTRUN -> [SKIP][52] ([i915#6590]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-10/igt@i915_pm_freq_mult@media-freq@gt0.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-rkl:          NOTRUN -> [SKIP][53] ([i915#14498])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-8/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rps@thresholds-idle-park:
    - shard-dg1:          NOTRUN -> [SKIP][54] ([i915#11681])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-dg1-18/igt@i915_pm_rps@thresholds-idle-park.html

  * igt@i915_query@hwconfig_table:
    - shard-tglu:         NOTRUN -> [SKIP][55] ([i915#6245])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-4/igt@i915_query@hwconfig_table.html

  * igt@i915_suspend@debugfs-reader:
    - shard-glk11:        NOTRUN -> [INCOMPLETE][56] ([i915#13356] / [i915#16182] / [i915#4817]) +1 other test incomplete
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-glk11/igt@i915_suspend@debugfs-reader.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-rkl:          [PASS][57] -> [INCOMPLETE][58] ([i915#4817]) +1 other test incomplete
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-5/igt@i915_suspend@fence-restore-untiled.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-6/igt@i915_suspend@fence-restore-untiled.html

  * igt@i915_suspend@sysfs-reader:
    - shard-mtlp:         [PASS][59] -> [ABORT][60] ([i915#17175])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-mtlp-7/igt@i915_suspend@sysfs-reader.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-mtlp-7/igt@i915_suspend@sysfs-reader.html

  * igt@intel_hwmon@hwmon-write:
    - shard-tglu:         NOTRUN -> [SKIP][61] ([i915#7707])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-9/igt@intel_hwmon@hwmon-write.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1:
    - shard-glk:          [PASS][62] -> [FAIL][63] ([i915#14888])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-glk2/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-glk9/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-glk:          NOTRUN -> [INCOMPLETE][64] ([i915#12761] / [i915#13356]) +1 other test incomplete
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-glk4/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_atomic@plane-overlay-legacy@pipe-a-vga-1:
    - shard-snb:          NOTRUN -> [FAIL][65] ([i915#17126]) +1 other test fail
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-snb6/igt@kms_atomic@plane-overlay-legacy@pipe-a-vga-1.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-snb:          NOTRUN -> [INCOMPLETE][66] ([i915#17134])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-snb6/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
    - shard-dg1:          NOTRUN -> [SKIP][67] ([i915#4538] / [i915#5286])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-dg1-18/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
    - shard-tglu:         NOTRUN -> [SKIP][68] ([i915#5286]) +7 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-2/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-rkl:          NOTRUN -> [SKIP][69] ([i915#5286]) +1 other test skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-8/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-tglu-1:       NOTRUN -> [SKIP][70] ([i915#5286]) +2 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-dg1:          NOTRUN -> [SKIP][71] ([i915#3638])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-dg1-18/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-tglu:         NOTRUN -> [SKIP][72] ([i915#3828])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-4/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][73] ([i915#3638]) +2 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-8/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg1:          NOTRUN -> [SKIP][74] ([i915#4538])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-dg1-18/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][75] ([i915#12313]) +1 other test skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-4/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][76] ([i915#14544] / [i915#6095]) +14 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][77] ([i915#14098] / [i915#14544] / [i915#6095]) +7 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][78] ([i915#6095]) +74 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-4/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs:
    - shard-snb:          NOTRUN -> [SKIP][79] +207 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-snb6/igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][80] ([i915#12313])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][81] ([i915#14098] / [i915#6095]) +36 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-7/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-edp-1:
    - shard-mtlp:         [PASS][82] -> [FAIL][83] ([i915#17158]) +1 other test fail
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-mtlp-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-edp-1.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-mtlp-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-edp-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2:
    - shard-glk10:        NOTRUN -> [SKIP][84] +121 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-glk10/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [SKIP][85] ([i915#6095]) +123 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-dg1-12/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-3.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][86] ([i915#6095]) +58 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-4/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][87] ([i915#6095]) +39 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-1/igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_cdclk@mode-rejected-max-dotclock:
    - shard-tglu:         NOTRUN -> [SKIP][88] ([i915#17099])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-4/igt@kms_cdclk@mode-rejected-max-dotclock.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-tglu:         NOTRUN -> [SKIP][89] ([i915#3742])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-2/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d:
    - shard-tglu-1:       NOTRUN -> [SKIP][90] ([i915#16471]) +1 other test skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-1/igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4:
    - shard-tglu:         NOTRUN -> [SKIP][91] ([i915#16471])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-2/igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4.html

  * igt@kms_chamelium_edid@vga-edid-read:
    - shard-tglu-1:       NOTRUN -> [SKIP][92] ([i915#11151] / [i915#7828]) +2 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-1/igt@kms_chamelium_edid@vga-edid-read.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - shard-rkl:          NOTRUN -> [SKIP][93] ([i915#11151] / [i915#7828]) +4 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-8/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_chamelium_frames@hdmi-aspect-ratio:
    - shard-tglu:         NOTRUN -> [SKIP][94] ([i915#11151] / [i915#7828]) +9 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-10/igt@kms_chamelium_frames@hdmi-aspect-ratio.html

  * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
    - shard-dg1:          NOTRUN -> [SKIP][95] ([i915#11151] / [i915#7828]) +2 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-dg1-18/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html

  * igt@kms_color_pipeline@plane-ctm3x4-lut1d@pipe-b-plane-4:
    - shard-tglu-1:       NOTRUN -> [SKIP][96] ([i915#16990]) +15 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-1/igt@kms_color_pipeline@plane-ctm3x4-lut1d@pipe-b-plane-4.html

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim:
    - shard-rkl:          NOTRUN -> [FAIL][97] ([i915#17116]) +9 other tests fail
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-7/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim.html

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d@pipe-a-plane-2:
    - shard-tglu:         NOTRUN -> [FAIL][98] ([i915#17116]) +38 other tests fail
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-9/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d@pipe-a-plane-2.html

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709@pipe-a-plane-0:
    - shard-tglu-1:       NOTRUN -> [FAIL][99] ([i915#17116]) +25 other tests fail
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-1/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709@pipe-a-plane-0.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-tglu:         NOTRUN -> [SKIP][100] ([i915#15330] / [i915#3116] / [i915#3299]) +2 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-10/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-rkl:          NOTRUN -> [SKIP][101] ([i915#15330] / [i915#3116])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-8/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg1:          NOTRUN -> [SKIP][102] ([i915#15330] / [i915#3299])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-dg1-18/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@dp-mst-type-1-suspend-resume:
    - shard-tglu:         NOTRUN -> [SKIP][103] ([i915#15330])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-2/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html

  * igt@kms_content_protection@mei-interface:
    - shard-tglu-1:       NOTRUN -> [SKIP][104] ([i915#15865]) +2 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-1/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@srm:
    - shard-rkl:          NOTRUN -> [SKIP][105] ([i915#15865]) +1 other test skip
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-7/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent-hdcp14:
    - shard-tglu:         NOTRUN -> [SKIP][106] ([i915#15865])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-9/igt@kms_content_protection@uevent-hdcp14.html

  * igt@kms_cursor_crc@cursor-onscreen-128x42:
    - shard-tglu:         NOTRUN -> [FAIL][107] ([i915#13566]) +3 other tests fail
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-9/igt@kms_cursor_crc@cursor-onscreen-128x42.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-tglu:         NOTRUN -> [SKIP][108] ([i915#13049]) +2 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-4/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
    - shard-tglu-1:       NOTRUN -> [SKIP][109] ([i915#3555]) +2 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-1/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html

  * igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [FAIL][110] ([i915#13566]) +1 other test fail
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-1/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [FAIL][111] ([i915#13566]) +4 other tests fail
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-4/igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-2.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-rkl:          NOTRUN -> [SKIP][112] ([i915#4103])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - shard-tglu:         NOTRUN -> [SKIP][113] ([i915#4103])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-rkl:          NOTRUN -> [SKIP][114] ([i915#9723])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-5/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-tglu-1:       NOTRUN -> [SKIP][115] ([i915#9723])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-1/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-tglu:         NOTRUN -> [SKIP][116] ([i915#13691])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-4/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-rkl:          NOTRUN -> [SKIP][117] ([i915#13748])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-8/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-rkl:          NOTRUN -> [SKIP][118] ([i915#16361])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-8/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-fractional-bpp-bigjoiner:
    - shard-dg1:          NOTRUN -> [SKIP][119] ([i915#16361])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-dg1-18/igt@kms_dsc@dsc-fractional-bpp-bigjoiner.html

  * igt@kms_dsc@dsc-with-bpc-bigjoiner:
    - shard-tglu:         NOTRUN -> [SKIP][120] ([i915#16361]) +2 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-2/igt@kms_dsc@dsc-with-bpc-bigjoiner.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-tglu-1:       NOTRUN -> [SKIP][121] ([i915#16361]) +1 other test skip
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-1/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-glk10:        NOTRUN -> [INCOMPLETE][122] ([i915#13356] / [i915#9878])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-glk10/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-tglu:         NOTRUN -> [SKIP][123] ([i915#2065])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-9/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-2x:
    - shard-rkl:          NOTRUN -> [SKIP][124] ([i915#16081])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-7/igt@kms_feature_discovery@display-2x.html
    - shard-tglu-1:       NOTRUN -> [SKIP][125] ([i915#16081])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-1/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@hdr:
    - shard-tglu:         NOTRUN -> [SKIP][126] ([i915#16600])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-4/igt@kms_feature_discovery@hdr.html

  * igt@kms_feature_discovery@psr2:
    - shard-tglu:         NOTRUN -> [SKIP][127] ([i915#658])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-9/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-tglu-1:       NOTRUN -> [SKIP][128] ([i915#3637] / [i915#9934]) +2 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-1/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
    - shard-tglu:         NOTRUN -> [SKIP][129] ([i915#9934])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-2/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-glk:          [PASS][130] -> [FAIL][131] ([i915#13027]) +1 other test fail
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-glk5/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-glk3/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-glk:          NOTRUN -> [INCOMPLETE][132] ([i915#12314] / [i915#12745] / [i915#13356] / [i915#17183] / [i915#4839])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-glk8/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2:
    - shard-glk:          NOTRUN -> [INCOMPLETE][133] ([i915#12314] / [i915#12745] / [i915#13356] / [i915#17183])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-glk8/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-tglu:         NOTRUN -> [SKIP][134] ([i915#3637] / [i915#9934]) +4 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-9/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][135] ([i915#9934]) +2 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-dg1-18/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-rkl:          NOTRUN -> [SKIP][136] ([i915#9934]) +1 other test skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-8/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
    - shard-tglu:         NOTRUN -> [SKIP][137] ([i915#15643]) +3 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-9/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][138] ([i915#15643]) +2 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
    - shard-tglu-1:       NOTRUN -> [SKIP][139] ([i915#15643]) +1 other test skip
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][140] ([i915#15643]) +1 other test skip
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-dg1-18/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-mtlp:         [PASS][141] -> [SKIP][142] ([i915#15672])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-mtlp-4/igt@kms_force_connector_basic@prune-stale-modes.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-mtlp-1/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][143] ([i915#15104] / [i915#15990])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-tglu-1:       NOTRUN -> [SKIP][144] +54 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-glk11:        NOTRUN -> [INCOMPLETE][145] ([i915#10056] / [i915#13356] / [i915#16593])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-glk11/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-draw-pwrite:
    - shard-rkl:          NOTRUN -> [SKIP][146] +47 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-7/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-blt:
    - shard-rkl:          NOTRUN -> [SKIP][147] ([i915#15989]) +14 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-2/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render:
    - shard-dg2:          NOTRUN -> [SKIP][148] ([i915#15991] / [i915#5354])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen:
    - shard-tglu:         NOTRUN -> [SKIP][149] +132 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-indfb-fliptrack-mmap-gtt:
    - shard-tglu:         NOTRUN -> [SKIP][150] ([i915#15102]) +58 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-4/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-indfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-render:
    - shard-tglu-1:       NOTRUN -> [SKIP][151] ([i915#15102]) +17 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-indfb-draw-blt:
    - shard-tglu:         NOTRUN -> [SKIP][152] ([i915#15989]) +25 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-10/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-rkl:          [PASS][153] -> [SKIP][154] ([i915#15989]) +8 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-1/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-2/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-shrfb-plflip-blt:
    - shard-tglu-1:       NOTRUN -> [SKIP][155] ([i915#15989]) +11 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-1/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg1:          NOTRUN -> [SKIP][156] ([i915#15989]) +4 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-dg1-18/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-cur-indfb-draw-render:
    - shard-dg2:          NOTRUN -> [SKIP][157] ([i915#15991])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-dg2-8/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - shard-glk:          [PASS][158] -> [SKIP][159] +13 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-glk8/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-glk6/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw:
    - shard-glk:          NOTRUN -> [SKIP][160] +178 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-glk3/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][161] ([i915#15990] / [i915#8708]) +4 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][162] ([i915#1825]) +4 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-onoff:
    - shard-dg1:          NOTRUN -> [SKIP][163] +15 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-dg1-18/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-spr-indfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][164] ([i915#15990]) +3 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-dg1-18/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psrhdr-rgb101010-draw-blt:
    - shard-rkl:          NOTRUN -> [SKIP][165] ([i915#15102]) +17 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-8/igt@kms_frontbuffer_tracking@psrhdr-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-rgb565-draw-render:
    - shard-dg1:          NOTRUN -> [SKIP][166] ([i915#15102]) +9 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-dg1-18/igt@kms_frontbuffer_tracking@psrhdr-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@psrhdr-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][167] ([i915#15102])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-dg2-8/igt@kms_frontbuffer_tracking@psrhdr-suspend.html

  * igt@kms_hdmi_audio_bw@audio-bw-hblank160:
    - shard-glk:          NOTRUN -> [FAIL][168] ([i915#17102])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-glk8/igt@kms_hdmi_audio_bw@audio-bw-hblank160.html

  * igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery:
    - shard-glk10:        NOTRUN -> [INCOMPLETE][169] ([i915#13356])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-glk10/igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-mtlp:         [PASS][170] -> [SKIP][171] ([i915#15725])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-mtlp-4/igt@kms_hdmi_inject@inject-audio.html
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-mtlp-1/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][172] ([i915#3555] / [i915#8228])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-9/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][173] ([i915#16644] / [i915#3555] / [i915#8228])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-7/igt@kms_hdr@bpc-switch-suspend.html
    - shard-tglu-1:       NOTRUN -> [SKIP][174] ([i915#3555] / [i915#8228])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-1/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][175] ([i915#15459])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-9/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][176] ([i915#15458]) +1 other test skip
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-2/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-tglu-1:       NOTRUN -> [SKIP][177] ([i915#15458])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-1/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_panel_fitting@legacy:
    - shard-tglu:         NOTRUN -> [SKIP][178] ([i915#6301])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-2/igt@kms_panel_fitting@legacy.html

  * igt@kms_pipe_stress@stress-xrgb8888-untiled:
    - shard-glk:          NOTRUN -> [DMESG-FAIL][179] ([i915#118])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-glk3/igt@kms_pipe_stress@stress-xrgb8888-untiled.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping:
    - shard-tglu:         NOTRUN -> [SKIP][180] ([i915#15709]) +5 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-4/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier:
    - shard-tglu-1:       NOTRUN -> [SKIP][181] ([i915#15709]) +1 other test skip
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-1/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier.html

  * igt@kms_plane@pixel-format-4-tiled-modifier:
    - shard-rkl:          NOTRUN -> [SKIP][182] ([i915#15709]) +2 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-8/igt@kms_plane@pixel-format-4-tiled-modifier.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:
    - shard-dg1:          NOTRUN -> [SKIP][183] ([i915#15709])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-dg1-18/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-7:
    - shard-tglu-1:       NOTRUN -> [SKIP][184] ([i915#16386]) +3 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-1/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-7.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-b-plane-5:
    - shard-rkl:          NOTRUN -> [SKIP][185] ([i915#16386]) +1 other test skip
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-7/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-b-plane-5.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:
    - shard-glk:          NOTRUN -> [INCOMPLETE][186] ([i915#13026] / [i915#13356])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-glk5/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-dg1:          NOTRUN -> [SKIP][187] ([i915#3555]) +2 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-dg1-18/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-tglu-1:       NOTRUN -> [SKIP][188] ([i915#13958])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-1/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-tglu:         NOTRUN -> [SKIP][189] ([i915#13958]) +1 other test skip
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-4/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b:
    - shard-dg1:          NOTRUN -> [SKIP][190] ([i915#15329]) +4 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-dg1-18/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:
    - shard-tglu:         NOTRUN -> [SKIP][191] ([i915#15329] / [i915#3555])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-10/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b:
    - shard-tglu:         NOTRUN -> [SKIP][192] ([i915#15329]) +3 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-10/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:
    - shard-rkl:          NOTRUN -> [SKIP][193] ([i915#15329]) +3 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-8/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-rkl:          NOTRUN -> [SKIP][194] ([i915#12343] / [i915#5354])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-8/igt@kms_pm_backlight@bad-brightness.html
    - shard-tglu:         NOTRUN -> [SKIP][195] ([i915#12343] / [i915#9812])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-4/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_dc@dc5-dpms-suspend-resume:
    - shard-glk:          NOTRUN -> [INCOMPLETE][196] ([i915#13356] / [i915#16938])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-glk3/igt@kms_pm_dc@dc5-dpms-suspend-resume.html

  * igt@kms_pm_dc@dc5-psr-suspend-resume:
    - shard-tglu:         NOTRUN -> [SKIP][197] ([i915#16914])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-10/igt@kms_pm_dc@dc5-psr-suspend-resume.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-tglu:         NOTRUN -> [FAIL][198] ([i915#16479])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-4/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-tglu:         NOTRUN -> [SKIP][199] ([i915#15948])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-2/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][200] ([i915#15739])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-7/igt@kms_pm_dc@dc9-dpms.html
    - shard-tglu-1:       NOTRUN -> [SKIP][201] ([i915#15739])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-1/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-tglu-1:       NOTRUN -> [SKIP][202] ([i915#3828]) +1 other test skip
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-1/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-dg1:          [PASS][203] -> [SKIP][204] ([i915#15073])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-dg1-15/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-dg1-19/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-rkl:          [PASS][205] -> [SKIP][206] ([i915#15073])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-2/igt@kms_pm_rpm@modeset-lpsp.html
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-7/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-dg1:          NOTRUN -> [SKIP][207] ([i915#15073])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-dg1-18/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-tglu:         NOTRUN -> [SKIP][208] ([i915#15073]) +1 other test skip
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-9/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-dg1:          NOTRUN -> [SKIP][209] ([i915#6524])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-dg1-18/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_prime@d3hot:
    - shard-rkl:          NOTRUN -> [SKIP][210] ([i915#6524])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-7/igt@kms_prime@d3hot.html
    - shard-tglu-1:       NOTRUN -> [SKIP][211] ([i915#6524])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-1/igt@kms_prime@d3hot.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:
    - shard-glk11:        NOTRUN -> [SKIP][212] ([i915#11520]) +3 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-glk11/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-tglu:         NOTRUN -> [SKIP][213] ([i915#11520]) +10 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-9/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-tglu-1:       NOTRUN -> [SKIP][214] ([i915#11520]) +3 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-1/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
    - shard-glk:          NOTRUN -> [SKIP][215] ([i915#11520]) +2 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-glk3/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg1:          NOTRUN -> [SKIP][216] ([i915#11520])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-dg1-18/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:
    - shard-glk10:        NOTRUN -> [SKIP][217] ([i915#11520]) +3 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-glk10/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-rkl:          NOTRUN -> [SKIP][218] ([i915#11520]) +3 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-8/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-snb:          NOTRUN -> [SKIP][219] ([i915#11520]) +3 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-snb6/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg1:          NOTRUN -> [SKIP][220] ([i915#9683])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-dg1-18/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@pr-primary-page-flip:
    - shard-tglu:         NOTRUN -> [SKIP][221] ([i915#9732]) +25 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-4/igt@kms_psr@pr-primary-page-flip.html

  * igt@kms_psr@psr-sprite-mmap-cpu:
    - shard-dg1:          NOTRUN -> [SKIP][222] ([i915#1072] / [i915#9732]) +4 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-dg1-18/igt@kms_psr@psr-sprite-mmap-cpu.html

  * igt@kms_psr@psr2-cursor-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][223] ([i915#1072] / [i915#9732]) +14 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-5/igt@kms_psr@psr2-cursor-mmap-gtt.html

  * igt@kms_psr@psr2-sprite-mmap-gtt:
    - shard-tglu-1:       NOTRUN -> [SKIP][224] ([i915#9732]) +9 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-1/igt@kms_psr@psr2-sprite-mmap-gtt.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-tglu-1:       NOTRUN -> [SKIP][225] ([i915#15949])
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
    - shard-rkl:          NOTRUN -> [SKIP][226] ([i915#15949])
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-7/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@multiplane-rotation:
    - shard-glk:          NOTRUN -> [INCOMPLETE][227] ([i915#15492] / [i915#16184])
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-glk3/igt@kms_rotation_crc@multiplane-rotation.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-tglu:         NOTRUN -> [SKIP][228] ([i915#5289]) +1 other test skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-10/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - shard-tglu:         NOTRUN -> [SKIP][229] ([i915#3555]) +5 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-2/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-tglu:         NOTRUN -> [SKIP][230] ([i915#9906])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-9/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-dg1:          NOTRUN -> [SKIP][231] ([i915#9906])
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-dg1-18/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@perf_pmu@busy-double-start@ccs0:
    - shard-dg2:          [PASS][232] -> [FAIL][233] ([i915#4349])
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-dg2-5/igt@perf_pmu@busy-double-start@ccs0.html
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-dg2-6/igt@perf_pmu@busy-double-start@ccs0.html

  * igt@perf_pmu@busy-double-start@vecs0:
    - shard-mtlp:         [PASS][234] -> [FAIL][235] ([i915#4349])
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-mtlp-5/igt@perf_pmu@busy-double-start@vecs0.html
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-mtlp-7/igt@perf_pmu@busy-double-start@vecs0.html

  * igt@perf_pmu@module-unload:
    - shard-glk10:        NOTRUN -> [FAIL][236] ([i915#17127])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-glk10/igt@perf_pmu@module-unload.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-tglu-1:       NOTRUN -> [SKIP][237] ([i915#8516])
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-1/igt@perf_pmu@rc6-all-gts.html

  * igt@prime_vgem@basic-fence-read:
    - shard-rkl:          NOTRUN -> [SKIP][238] ([i915#3291] / [i915#3708]) +1 other test skip
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-7/igt@prime_vgem@basic-fence-read.html

  
#### Possible fixes ####

  * igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0:
    - shard-dg2:          [INCOMPLETE][239] ([i915#13356] / [i915#16348]) -> [PASS][240]
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-dg2-4/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0.html
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-dg2-4/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0.html

  * igt@i915_suspend@sysfs-reader:
    - shard-rkl:          [INCOMPLETE][241] ([i915#4817]) -> [PASS][242]
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-6/igt@i915_suspend@sysfs-reader.html
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-7/igt@i915_suspend@sysfs-reader.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-2:
    - shard-glk:          [FAIL][243] ([i915#14888]) -> [PASS][244] +1 other test pass
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-glk1/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-2.html
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-glk3/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc:
    - shard-dg1:          [DMESG-WARN][245] ([i915#4423]) -> [PASS][246] +2 other tests pass
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-dg1-15/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc.html
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-dg1-19/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-rkl:          [ABORT][247] ([i915#15132] / [i915#16925]) -> [PASS][248]
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-1/igt@kms_flip@flip-vs-suspend-interruptible.html
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-2/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff:
    - shard-rkl:          [SKIP][249] ([i915#15989]) -> [PASS][250] +6 other tests pass
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-5/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff.html
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_hdmi_inject@inject-4k:
    - shard-mtlp:         [SKIP][251] ([i915#15725]) -> [PASS][252]
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-mtlp-1/igt@kms_hdmi_inject@inject-4k.html
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-mtlp-5/igt@kms_hdmi_inject@inject-4k.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:
    - shard-glk:          [INCOMPLETE][253] ([i915#13026] / [i915#13356]) -> [PASS][254]
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-glk8/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-glk5/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-rkl:          [SKIP][255] ([i915#6953]) -> [PASS][256]
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-5/igt@kms_plane_scaling@intel-max-src-size.html
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-6/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-rkl:          [SKIP][257] ([i915#15073]) -> [PASS][258] +1 other test pass
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-2/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-7/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_pm_rpm@system-suspend-idle:
    - shard-rkl:          [INCOMPLETE][259] ([i915#14419]) -> [PASS][260]
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-3/igt@kms_pm_rpm@system-suspend-idle.html
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-8/igt@kms_pm_rpm@system-suspend-idle.html

  * igt@perf_pmu@busy-double-start@vcs1:
    - shard-dg1:          [FAIL][261] ([i915#4349]) -> [PASS][262]
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-dg1-14/igt@perf_pmu@busy-double-start@vcs1.html
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-dg1-15/igt@perf_pmu@busy-double-start@vcs1.html
    - shard-mtlp:         [FAIL][263] ([i915#4349]) -> [PASS][264]
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-mtlp-5/igt@perf_pmu@busy-double-start@vcs1.html
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-mtlp-7/igt@perf_pmu@busy-double-start@vcs1.html

  * igt@perf_pmu@busy-double-start@vecs0:
    - shard-dg2:          [FAIL][265] ([i915#4349]) -> [PASS][266] +1 other test pass
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-dg2-5/igt@perf_pmu@busy-double-start@vecs0.html
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-dg2-6/igt@perf_pmu@busy-double-start@vecs0.html

  
#### Warnings ####

  * igt@api_intel_bb@object-reloc-keep-cache:
    - shard-rkl:          [SKIP][267] ([i915#8411]) -> [SKIP][268] ([i915#14544] / [i915#8411])
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-5/igt@api_intel_bb@object-reloc-keep-cache.html
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-6/igt@api_intel_bb@object-reloc-keep-cache.html

  * igt@gem_basic@multigpu-create-close:
    - shard-rkl:          [SKIP][269] ([i915#7697]) -> [SKIP][270] ([i915#14544] / [i915#7697]) +1 other test skip
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-5/igt@gem_basic@multigpu-create-close.html
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-6/igt@gem_basic@multigpu-create-close.html

  * igt@gem_ctx_isolation@preservation-s3@rcs0:
    - shard-mtlp:         [INCOMPLETE][271] ([i915#13356]) -> [FAIL][272] ([i915#17176])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-mtlp-4/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-mtlp-3/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@gem_ctx_sseu@engines:
    - shard-rkl:          [SKIP][273] ([i915#280]) -> [SKIP][274] ([i915#14544] / [i915#280])
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-5/igt@gem_ctx_sseu@engines.html
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-6/igt@gem_ctx_sseu@engines.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-rkl:          [SKIP][275] ([i915#14544] / [i915#280]) -> [SKIP][276] ([i915#280])
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-6/igt@gem_ctx_sseu@invalid-sseu.html
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-8/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_exec_balancer@parallel-balancer:
    - shard-rkl:          [SKIP][277] ([i915#4525]) -> [SKIP][278] ([i915#14544] / [i915#4525])
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-5/igt@gem_exec_balancer@parallel-balancer.html
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-6/igt@gem_exec_balancer@parallel-balancer.html

  * igt@gem_exec_capture@capture-recoverable:
    - shard-rkl:          [SKIP][279] ([i915#6344]) -> [SKIP][280] ([i915#14544] / [i915#6344])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-5/igt@gem_exec_capture@capture-recoverable.html
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-6/igt@gem_exec_capture@capture-recoverable.html

  * igt@gem_exec_reloc@basic-cpu-read-active:
    - shard-rkl:          [SKIP][281] ([i915#14544] / [i915#3281]) -> [SKIP][282] ([i915#3281]) +2 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-6/igt@gem_exec_reloc@basic-cpu-read-active.html
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-8/igt@gem_exec_reloc@basic-cpu-read-active.html

  * igt@gem_exec_reloc@basic-softpin:
    - shard-rkl:          [SKIP][283] ([i915#3281]) -> [SKIP][284] ([i915#14544] / [i915#3281]) +1 other test skip
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-5/igt@gem_exec_reloc@basic-softpin.html
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-6/igt@gem_exec_reloc@basic-softpin.html

  * igt@gem_exec_schedule@semaphore-power:
    - shard-rkl:          [SKIP][285] ([i915#14544] / [i915#7276]) -> [SKIP][286] ([i915#7276])
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-6/igt@gem_exec_schedule@semaphore-power.html
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-8/igt@gem_exec_schedule@semaphore-power.html

  * igt@gem_lmem_swapping@heavy-verify-random-ccs:
    - shard-rkl:          [SKIP][287] ([i915#14544] / [i915#4613]) -> [SKIP][288] ([i915#4613]) +1 other test skip
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-6/igt@gem_lmem_swapping@heavy-verify-random-ccs.html
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-7/igt@gem_lmem_swapping@heavy-verify-random-ccs.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-rkl:          [SKIP][289] ([i915#3282]) -> [SKIP][290] ([i915#14544] / [i915#3282])
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-5/igt@gem_pwrite@basic-exhaustion.html
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-6/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_readwrite@read-write:
    - shard-rkl:          [SKIP][291] ([i915#14544] / [i915#3282]) -> [SKIP][292] ([i915#3282]) +2 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-6/igt@gem_readwrite@read-write.html
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-7/igt@gem_readwrite@read-write.html

  * igt@gem_userptr_blits@readonly-unsync:
    - shard-rkl:          [SKIP][293] ([i915#14544] / [i915#3297]) -> [SKIP][294] ([i915#3297])
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-6/igt@gem_userptr_blits@readonly-unsync.html
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-5/igt@gem_userptr_blits@readonly-unsync.html

  * igt@gen9_exec_parse@bb-chained:
    - shard-rkl:          [SKIP][295] ([i915#2527]) -> [SKIP][296] ([i915#14544] / [i915#2527]) +1 other test skip
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-5/igt@gen9_exec_parse@bb-chained.html
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-6/igt@gen9_exec_parse@bb-chained.html

  * igt@gen9_exec_parse@unaligned-jump:
    - shard-rkl:          [SKIP][297] ([i915#14544] / [i915#2527]) -> [SKIP][298] ([i915#2527])
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-6/igt@gen9_exec_parse@unaligned-jump.html
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-7/igt@gen9_exec_parse@unaligned-jump.html

  * igt@i915_module_load@fault-injection:
    - shard-mtlp:         [ABORT][299] ([i915#15342] / [i915#15481]) -> [ABORT][300] ([i915#15481])
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-mtlp-4/igt@i915_module_load@fault-injection.html
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-mtlp-3/igt@i915_module_load@fault-injection.html

  * igt@i915_query@query-topology-known-pci-ids:
    - shard-rkl:          [SKIP][301] ([i915#14544] / [i915#16109]) -> [SKIP][302] ([i915#16109])
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-6/igt@i915_query@query-topology-known-pci-ids.html
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-5/igt@i915_query@query-topology-known-pci-ids.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-rkl:          [SKIP][303] ([i915#5723]) -> [SKIP][304] ([i915#14544] / [i915#5723])
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-5/igt@i915_query@test-query-geometry-subslices.html
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-6/igt@i915_query@test-query-geometry-subslices.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-rkl:          [SKIP][305] ([i915#5286]) -> [SKIP][306] ([i915#14544] / [i915#5286]) +2 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-5/igt@kms_big_fb@4-tiled-addfb.html
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-6/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-rkl:          [SKIP][307] ([i915#14544] / [i915#5286]) -> [SKIP][308] ([i915#5286]) +1 other test skip
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-rkl:          [SKIP][309] ([i915#14544] / [i915#3828]) -> [SKIP][310] ([i915#3828])
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-6/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-7/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
    - shard-rkl:          [SKIP][311] ([i915#3638]) -> [SKIP][312] ([i915#14544] / [i915#3638])
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-5/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-6/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2:
    - shard-rkl:          [SKIP][313] ([i915#14544] / [i915#6095]) -> [SKIP][314] ([i915#6095]) +4 other tests skip
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-6/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2.html
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-7/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs:
    - shard-rkl:          [SKIP][315] ([i915#14098] / [i915#6095]) -> [SKIP][316] ([i915#14098] / [i915#14544] / [i915#6095]) +7 other tests skip
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-5/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-6/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-rkl:          [SKIP][317] ([i915#12313]) -> [SKIP][318] ([i915#12313] / [i915#14544])
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-rkl:          [SKIP][319] ([i915#12313] / [i915#14544]) -> [SKIP][320] ([i915#12313])
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-5/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:
    - shard-rkl:          [SKIP][321] ([i915#14098] / [i915#14544] / [i915#6095]) -> [SKIP][322] ([i915#14098] / [i915#6095]) +6 other tests skip
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-8/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:
    - shard-dg1:          [SKIP][323] ([i915#6095]) -> [SKIP][324] ([i915#4423] / [i915#6095]) +1 other test skip
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-dg1-18/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4.html
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-dg1-18/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d:
    - shard-dg1:          [SKIP][325] ([i915#4423]) -> [SKIP][326]
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-dg1-12/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d.html
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-dg1-16/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d:
    - shard-rkl:          [SKIP][327] ([i915#16471]) -> [SKIP][328] ([i915#14544] / [i915#16471]) +2 other tests skip
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-5/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d.html
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-6/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d.html

  * igt@kms_chamelium_frames@hdmi-crc-fast:
    - shard-rkl:          [SKIP][329] ([i915#11151] / [i915#14544] / [i915#7828]) -> [SKIP][330] ([i915#11151] / [i915#7828]) +2 other tests skip
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-6/igt@kms_chamelium_frames@hdmi-crc-fast.html
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-5/igt@kms_chamelium_frames@hdmi-crc-fast.html

  * igt@kms_chamelium_hpd@dp-hpd-storm:
    - shard-rkl:          [SKIP][331] ([i915#11151] / [i915#7828]) -> [SKIP][332] ([i915#11151] / [i915#14544] / [i915#7828]) +2 other tests skip
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-5/igt@kms_chamelium_hpd@dp-hpd-storm.html
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-6/igt@kms_chamelium_hpd@dp-hpd-storm.html

  * igt@kms_content_protection@suspend-resume:
    - shard-rkl:          [SKIP][333] ([i915#14544] / [i915#15865]) -> [SKIP][334] ([i915#15865]) +3 other tests skip
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-6/igt@kms_content_protection@suspend-resume.html
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-5/igt@kms_content_protection@suspend-resume.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-rkl:          [SKIP][335] ([i915#13049]) -> [SKIP][336] ([i915#13049] / [i915#14544])
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-5/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
    - shard-rkl:          [SKIP][337] ([i915#9067]) -> [SKIP][338] ([i915#14544] / [i915#9067])
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-5/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-6/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html

  * igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback:
    - shard-rkl:          [SKIP][339] ([i915#16867]) -> [SKIP][340] ([i915#14544] / [i915#16867]) +1 other test skip
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-5/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-6/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-rkl:          [SKIP][341] ([i915#16361]) -> [SKIP][342] ([i915#14544] / [i915#16361]) +1 other test skip
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-5/igt@kms_dsc@dsc-with-output-formats.html
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-6/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner:
    - shard-rkl:          [SKIP][343] ([i915#14544] / [i915#16361]) -> [SKIP][344] ([i915#16361])
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-6/igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner.html
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-7/igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-rkl:          [SKIP][345] ([i915#14544] / [i915#9934]) -> [SKIP][346] ([i915#9934])
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-6/igt@kms_flip@2x-blocking-wf_vblank.html
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-7/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-rkl:          [SKIP][347] ([i915#9934]) -> [SKIP][348] ([i915#14544] / [i915#9934]) +5 other tests skip
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-5/igt@kms_flip@2x-modeset-vs-vblank-race.html
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-6/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-rkl:          [SKIP][349] ([i915#15643]) -> [SKIP][350] ([i915#14544] / [i915#15643]) +1 other test skip
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-5/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
    - shard-rkl:          [SKIP][351] ([i915#14544] / [i915#15643]) -> [SKIP][352] ([i915#15643])
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbchdr-suspend:
    - shard-rkl:          [INCOMPLETE][353] ([i915#16056]) -> [SKIP][354] ([i915#15989])
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-suspend.html
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-5/igt@kms_frontbuffer_tracking@fbchdr-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-rkl:          [SKIP][355] ([i915#14544] / [i915#1825]) -> [SKIP][356] ([i915#1825]) +4 other tests skip
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-indfb-pgflip-blt:
    - shard-dg1:          [SKIP][357] ([i915#15102] / [i915#4423]) -> [SKIP][358] ([i915#15102])
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-dg1-12/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-indfb-pgflip-blt.html
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-onoff:
    - shard-rkl:          [SKIP][359] -> [SKIP][360] ([i915#14544]) +46 other tests skip
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-onoff.html
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-rkl:          [SKIP][361] ([i915#14544]) -> [SKIP][362] +29 other tests skip
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-5/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:
    - shard-rkl:          [SKIP][363] ([i915#15102]) -> [SKIP][364] ([i915#14544] / [i915#15102]) +21 other tests skip
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-rkl:          [SKIP][365] ([i915#14544] / [i915#15102]) -> [SKIP][366] ([i915#15102]) +16 other tests skip
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-rkl:          [SKIP][367] ([i915#1825]) -> [SKIP][368] ([i915#14544] / [i915#1825]) +6 other tests skip
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-gtt.html
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery:
    - shard-rkl:          [ABORT][369] ([i915#15132]) -> [FAIL][370] ([i915#17122] / [i915#17137])
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-6/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-8/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html
    - shard-tglu:         [FAIL][371] ([i915#17101] / [i915#17108]) -> [FAIL][372] ([i915#17101] / [i915#17108] / [i915#17188])
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-tglu-9/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-8/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-rkl:          [SKIP][373] ([i915#14544] / [i915#16644]) -> [SKIP][374] ([i915#12713] / [i915#16644])
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-6/igt@kms_hdr@brightness-with-hdr.html
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-5/igt@kms_hdr@brightness-with-hdr.html
    - shard-tglu:         [SKIP][375] ([i915#1187] / [i915#12713]) -> [SKIP][376] ([i915#12713])
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-tglu-2/igt@kms_hdr@brightness-with-hdr.html
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-7/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-hdr:
    - shard-rkl:          [SKIP][377] ([i915#16644] / [i915#3555] / [i915#8228]) -> [SKIP][378] ([i915#14544] / [i915#16644] / [i915#3555] / [i915#8228])
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-5/igt@kms_hdr@invalid-hdr.html
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-6/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-rkl:          [SKIP][379] ([i915#14544] / [i915#15460]) -> [SKIP][380] ([i915#15460])
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-6/igt@kms_joiner@invalid-modeset-big-joiner.html
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-8/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-rkl:          [SKIP][381] ([i915#14544] / [i915#15458]) -> [SKIP][382] ([i915#15458])
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-6/igt@kms_joiner@invalid-modeset-ultra-joiner.html
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-7/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-rkl:          [SKIP][383] ([i915#6301]) -> [SKIP][384] ([i915#14544] / [i915#6301])
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-5/igt@kms_panel_fitting@atomic-fastset.html
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-6/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier:
    - shard-rkl:          [SKIP][385] ([i915#15709]) -> [SKIP][386] ([i915#14544] / [i915#15709])
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-5/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier.html
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-rkl:          [SKIP][387] ([i915#13958] / [i915#14544]) -> [SKIP][388] ([i915#13958])
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-6/igt@kms_plane_multiple@2x-tiling-none.html
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-8/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a:
    - shard-rkl:          [SKIP][389] ([i915#14544] / [i915#15329]) -> [SKIP][390] ([i915#15329]) +3 other tests skip
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-6/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-8/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html
    - shard-dg1:          [SKIP][391] ([i915#15329]) -> [SKIP][392] ([i915#15329] / [i915#4423]) +1 other test skip
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-dg1-18/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-dg1-18/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-rkl:          [SKIP][393] ([i915#12343] / [i915#5354]) -> [SKIP][394] ([i915#12343] / [i915#14544] / [i915#5354]) +1 other test skip
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-5/igt@kms_pm_backlight@fade-with-suspend.html
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-6/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc5-pageflip-negative:
    - shard-rkl:          [SKIP][395] ([i915#9685]) -> [SKIP][396] ([i915#14544] / [i915#9685])
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-5/igt@kms_pm_dc@dc5-pageflip-negative.html
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-6/igt@kms_pm_dc@dc5-pageflip-negative.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-rkl:          [SKIP][397] ([i915#14544] / [i915#8430]) -> [SKIP][398] ([i915#8430])
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-6/igt@kms_pm_lpsp@screens-disabled.html
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-8/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-rkl:          [SKIP][399] ([i915#11520] / [i915#14544]) -> [SKIP][400] ([i915#11520]) +1 other test skip
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:
    - shard-rkl:          [SKIP][401] ([i915#11520]) -> [SKIP][402] ([i915#11520] / [i915#14544]) +3 other tests skip
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-5/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-6/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr@fbc-psr2-primary-blt:
    - shard-rkl:          [SKIP][403] ([i915#1072] / [i915#14544] / [i915#9732]) -> [SKIP][404] ([i915#1072] / [i915#9732]) +3 other tests skip
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-6/igt@kms_psr@fbc-psr2-primary-blt.html
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-8/igt@kms_psr@fbc-psr2-primary-blt.html

  * igt@kms_psr@psr-cursor-plane-move:
    - shard-rkl:          [SKIP][405] ([i915#1072] / [i915#9732]) -> [SKIP][406] ([i915#1072] / [i915#14544] / [i915#9732]) +9 other tests skip
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-5/igt@kms_psr@psr-cursor-plane-move.html
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-6/igt@kms_psr@psr-cursor-plane-move.html

  * igt@kms_scaling_modes@scaling-mode-none:
    - shard-rkl:          [SKIP][407] ([i915#3555]) -> [SKIP][408] ([i915#14544] / [i915#3555]) +2 other tests skip
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-5/igt@kms_scaling_modes@scaling-mode-none.html
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-6/igt@kms_scaling_modes@scaling-mode-none.html

  * igt@kms_vrr@flip-suspend:
    - shard-rkl:          [SKIP][409] ([i915#15243] / [i915#3555]) -> [SKIP][410] ([i915#14544] / [i915#15243] / [i915#3555])
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-5/igt@kms_vrr@flip-suspend.html
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-6/igt@kms_vrr@flip-suspend.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-rkl:          [SKIP][411] ([i915#14544] / [i915#8516]) -> [SKIP][412] ([i915#8516])
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-6/igt@perf_pmu@rc6-all-gts.html
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-7/igt@perf_pmu@rc6-all-gts.html

  * igt@prime_vgem@coherency-gtt:
    - shard-rkl:          [SKIP][413] ([i915#3708]) -> [SKIP][414] ([i915#14544] / [i915#3708])
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-5/igt@prime_vgem@coherency-gtt.html
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-6/igt@prime_vgem@coherency-gtt.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10056]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10056
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#1099]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099
  [i915#11078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078
  [i915#11151]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
  [i915#118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/118
  [i915#1187]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187
  [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
  [i915#12314]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12314
  [i915#12343]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343
  [i915#12713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713
  [i915#12745]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745
  [i915#12761]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12761
  [i915#13026]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13026
  [i915#13027]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13027
  [i915#13029]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029
  [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
  [i915#13356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356
  [i915#13566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566
  [i915#13691]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13691
  [i915#13748]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748
  [i915#13958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958
  [i915#14098]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098
  [i915#14419]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14419
  [i915#14498]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14498
  [i915#14544]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544
  [i915#14545]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14545
  [i915#14888]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14888
  [i915#15073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073
  [i915#15102]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102
  [i915#15104]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104
  [i915#15132]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132
  [i915#15243]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243
  [i915#15329]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329
  [i915#15330]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330
  [i915#15342]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15342
  [i915#15458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458
  [i915#15459]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459
  [i915#15460]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460
  [i915#15481]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15481
  [i915#15492]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15492
  [i915#15643]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643
  [i915#15672]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15672
  [i915#15709]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709
  [i915#15725]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15725
  [i915#15739]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15739
  [i915#15816]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15816
  [i915#15865]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865
  [i915#15948]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948
  [i915#15949]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15949
  [i915#15989]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989
  [i915#15990]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990
  [i915#15991]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991
  [i915#16056]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16056
  [i915#16081]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081
  [i915#16109]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16109
  [i915#16182]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16182
  [i915#16184]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16184
  [i915#16348]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16348
  [i915#16361]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361
  [i915#16386]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16386
  [i915#16471]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471
  [i915#16479]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16479
  [i915#16593]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16593
  [i915#16600]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16600
  [i915#16644]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644
  [i915#16867]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16867
  [i915#16914]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16914
  [i915#16925]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16925
  [i915#16938]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16938
  [i915#16978]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16978
  [i915#16990]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16990
  [i915#17099]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17099
  [i915#17101]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17101
  [i915#17102]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17102
  [i915#17108]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17108
  [i915#17116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17116
  [i915#17122]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17122
  [i915#17126]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17126
  [i915#17127]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17127
  [i915#17134]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17134
  [i915#17137]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17137
  [i915#17158]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17158
  [i915#17175]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17175
  [i915#17176]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17176
  [i915#17183]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17183
  [i915#17188]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17188
  [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
  [i915#2065]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2065
  [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
  [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
  [i915#280]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280
  [i915#2856]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
  [i915#3116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#3742]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742
  [i915#3828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349
  [i915#4423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423
  [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
  [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#4771]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4771
  [i915#4817]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817
  [i915#4839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839
  [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#5566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5566
  [i915#5723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5723
  [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
  [i915#6245]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245
  [i915#6301]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301
  [i915#6334]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334
  [i915#6335]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335
  [i915#6344]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6344
  [i915#6412]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6412
  [i915#6524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
  [i915#658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658
  [i915#6590]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6590
  [i915#6953]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953
  [i915#7276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7276
  [i915#7697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697
  [i915#7707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707
  [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
  [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
  [i915#8399]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399
  [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
  [i915#8430]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430
  [i915#8516]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516
  [i915#8562]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562
  [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
  [i915#9067]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067
  [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
  [i915#9683]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683
  [i915#9685]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685
  [i915#9723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812
  [i915#9878]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9878
  [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
  [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934


Build changes
-------------

  * Linux: CI_DRM_19207 -> Patchwork_174791v1

  CI-20190529: 20190529
  CI_DRM_19207: 890d1157247d8ad65d9a2d44c065accd550b61f4 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_9109: 65f84b280be2caf8ce376295d97987a808affdee @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  Patchwork_174791v1: 890d1157247d8ad65d9a2d44c065accd550b61f4 @ git://anongit.freedesktop.org/gfx-ci/linux
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/index.html

--===============2208040463014973888==
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
<tr><td><b>Series:</b></td><td>drm/i915/psr: Allow Panel Replay and PSR2 with joiner</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/174791/">https://patchwork.freedesktop.org/series/174791/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_19207_full -&gt; Patchwork_174791v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with Patchwork_174791v1_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in Patchwork_174791v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (10 -&gt; 10)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in Patchwork_174791v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@ccs0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-mtlp-3/igt@gem_ctx_isolation@preservation-s3@ccs0.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-dg2-1/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-dg2-3/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@gem_ctx_isolation@preservation-s3:<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-mtlp-4/igt@gem_ctx_isolation@preservation-s3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-mtlp-3/igt@gem_ctx_isolation@preservation-s3.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_19207_full and Patchwork_174791v1_full:</p>
<h3>New IGT tests (22)</h3>
<ul>
<li>
<p>igt@i915_module_load@2x-flip-vs-panning:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@bad-pixel-format-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@crc-primary-rotation-180-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@dc5-psr:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fbc-2p-scndscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fbchdr-1p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fbcpsr-1p-indfb-fliptrack-mmap-gtt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fbcpsr-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fbcpsr-rgb565-draw-mmap-wc:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fbcpsrhdr-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fences-dpms:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@hdr-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@hdr-2p-scndscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@missing-ccs-buffer-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@pc8-residency:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@psr-2p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@psrhdr-1p-offscreen-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@psrhdr-2p-scndscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@rc6-fence:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@timestamp-moving:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@x-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_174791v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@object-reloc-purge-cache:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-dg1-18/igt@api_intel_bb@object-reloc-purge-cache.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@device_reset@cold-reset-bound:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-2/igt@device_reset@cold-reset-bound.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078">i915#11078</a>)</li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-cold-reset-rebind:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-1/igt@device_reset@unbind-cold-reset-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078">i915#11078</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-compressed:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-5/igt@gem_ccs@block-multicopy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-inplace:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-8/igt@gem_ccs@block-multicopy-inplace.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-4/igt@gem_ccs@block-multicopy-inplace.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-1/igt@gem_ccs@ctrl-surf-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume@tile64-compressed-compfmt0-smem-lmem0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-dg2-4/igt@gem_ccs@suspend-resume@tile64-compressed-compfmt0-smem-lmem0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16348">i915#16348</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-sanity-check:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-2/igt@gem_create@create-ext-cpu-access-sanity-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335">i915#6335</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-set-pat:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-4/igt@gem_create@create-ext-set-pat.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562">i915#8562</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@vcs1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-mtlp-3/igt@gem_ctx_isolation@preservation-s3@vcs1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17176">i915#17176</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@hang:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-snb6/igt@gem_ctx_persistence@hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099">i915#1099</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-hang@blt:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-glk11/igt@gem_ctx_persistence@legacy-engines-hang@blt.html">SKIP</a> +118 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-pair:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-dg1-18/igt@gem_exec_balancer@bonded-pair.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4771">i915#4771</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-submit-fence:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-10/igt@gem_exec_balancer@parallel-keep-submit-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-7/igt@gem_exec_balancer@parallel-ordering.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>) +2 other tests skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-1/igt@gem_exec_balancer@parallel-ordering.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_big@single:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-9/igt@gem_exec_big@single.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15816">i915#15816</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible@smem0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-glk8/igt@gem_exec_capture@capture-invisible@smem0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334">i915#6334</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-gtt-noreloc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-8/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-cpu:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-dg1-18/igt@gem_exec_reloc@basic-gtt-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-dg2-4/igt@gem_exec_suspend@basic-s0@smem.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-dg2-4/igt@gem_exec_suspend@basic-s0@smem.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-10/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-multi:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-8/igt@gem_lmem_swapping@heavy-multi.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random-ccs:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-1/igt@gem_lmem_swapping@heavy-verify-random-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-10/igt@gem_lmem_swapping@verify-random-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-medium-copy-xy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-dg1-18/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-uncached:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-8/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-dg1-18/igt@gem_pread@exhaustion.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-unsync:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-2/igt@gem_userptr_blits@dmabuf-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-overlap:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-1/igt@gem_userptr_blits@unsync-overlap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-after-close:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-8/igt@gem_userptr_blits@unsync-unmap-after-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-fd:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-4/igt@gem_workarounds@suspend-resume-fd.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-3/igt@gem_workarounds@suspend-resume-fd.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-glk3/igt@gen9_exec_parse@allowed-single.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5566">i915#5566</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-without-end:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-8/igt@gen9_exec_parse@batch-without-end.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-zero-length:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-2/igt@gen9_exec_parse@batch-zero-length.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-param:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-dg1-18/igt@gen9_exec_parse@bb-start-param.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@unaligned-jump:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-1/igt@gen9_exec_parse@unaligned-jump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@uc_fw_rsa_data_create:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-mtlp-4/igt@i915_module_load@fault-injection@uc_fw_rsa_data_create.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-mtlp-3/igt@i915_module_load@fault-injection@uc_fw_rsa_data_create.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16978">i915#16978</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-no-display:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-10/igt@i915_module_load@reload-no-display.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029">i915#13029</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14545">i915#14545</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@resize-bar:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-2/igt@i915_module_load@resize-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6412">i915#6412</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-reset:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-7/igt@i915_pm_freq_api@freq-reset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399">i915#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-reset-multiple:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-1/igt@i915_pm_freq_api@freq-reset-multiple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399">i915#8399</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_mult@media-freq@gt0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-10/igt@i915_pm_freq_mult@media-freq@gt0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6590">i915#6590</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-8/igt@i915_pm_rc6_residency@rc6-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14498">i915#14498</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds-idle-park:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-dg1-18/igt@i915_pm_rps@thresholds-idle-park.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@hwconfig_table:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-4/igt@i915_query@hwconfig_table.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245">i915#6245</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@debugfs-reader:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-glk11/igt@i915_suspend@debugfs-reader.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16182">i915#16182</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-untiled:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-5/igt@i915_suspend@fence-restore-untiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-6/igt@i915_suspend@fence-restore-untiled.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@sysfs-reader:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-mtlp-7/igt@i915_suspend@sysfs-reader.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-mtlp-7/igt@i915_suspend@sysfs-reader.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17175">i915#17175</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-9/igt@intel_hwmon@hwmon-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707">i915#7707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-glk2/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-glk9/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14888">i915#14888</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-glk4/igt@kms_async_flips@async-flip-suspend-resume.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12761">i915#12761</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-overlay-legacy@pipe-a-vga-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-snb6/igt@kms_atomic@plane-overlay-legacy@pipe-a-vga-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17126">i915#17126</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-snb6/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17134">i915#17134</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-dg1-18/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-2/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-8/igt@kms_big_fb@4-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-dg1-18/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-4/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-8/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-dg1-18/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-4/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-4/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +74 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-snb6/igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs.html">SKIP</a> +207 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-7/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +36 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-mtlp-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-mtlp-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17158">i915#17158</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-glk10/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> +121 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-dg1-12/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +123 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-4/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +58 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-1/igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +39 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-rejected-max-dotclock:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-4/igt@kms_cdclk@mode-rejected-max-dotclock.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17099">i915#17099</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-2/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742">i915#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-1/igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-2/igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@vga-edid-read:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-1/igt@kms_chamelium_edid@vga-edid-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-fast:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-8/igt@kms_chamelium_frames@dp-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-10/igt@kms_chamelium_frames@hdmi-aspect-ratio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-dg1-18/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-ctm3x4-lut1d@pipe-b-plane-4:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-1/igt@kms_color_pipeline@plane-ctm3x4-lut1d@pipe-b-plane-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16990">i915#16990</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-7/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17116">i915#17116</a>) +9 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d@pipe-a-plane-2:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-9/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d@pipe-a-plane-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17116">i915#17116</a>) +38 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709@pipe-a-plane-0:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-1/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709@pipe-a-plane-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17116">i915#17116</a>) +25 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-10/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-8/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-dg1-18/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1-suspend-resume:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-2/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-1/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-7/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent-hdcp14:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-9/igt@kms_content_protection@uevent-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x42:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-9/igt@kms_cursor_crc@cursor-onscreen-128x42.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-4/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x32:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-1/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-1/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-4/igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-5/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723">i915#9723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-1/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723">i915#9723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-4/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13691">i915#13691</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-8/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748">i915#13748</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-8/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-bigjoiner:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-dg1-18/igt@kms_dsc@dsc-fractional-bpp-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-bigjoiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-2/igt@kms_dsc@dsc-with-bpc-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-1/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-glk10/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9878">i915#9878</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-9/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2065">i915#2065</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-7/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081">i915#16081</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-1/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081">i915#16081</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@hdr:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-4/igt@kms_feature_discovery@hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16600">i915#16600</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-9/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-1/igt@kms_flip@2x-blocking-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-2/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-glk5/igt@kms_flip@2x-flip-vs-expired-vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-glk3/igt@kms_flip@2x-flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13027">i915#13027</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-glk8/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12314">i915#12314</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17183">i915#17183</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-glk8/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12314">i915#12314</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17183">i915#17183</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-9/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-dg1-18/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-8/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-9/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +2 other tests skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-dg1-18/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-mtlp-4/igt@kms_force_connector_basic@prune-stale-modes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-mtlp-1/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15672">i915#15672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> +54 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-glk11/igt@kms_frontbuffer_tracking@fbc-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10056">i915#10056</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16593">i915#16593</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-7/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-draw-pwrite.html">SKIP</a> +47 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-2/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> +132 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-indfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-4/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-indfb-fliptrack-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +58 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-10/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-1/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-2/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-1/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-dg1-18/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-dg2-8/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-glk8/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-glk6/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-glk3/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html">SKIP</a> +178 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-dg1-18/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-onoff.html">SKIP</a> +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-dg1-18/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-rgb101010-draw-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-8/igt@kms_frontbuffer_tracking@psrhdr-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-rgb565-draw-render:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-dg1-18/igt@kms_frontbuffer_tracking@psrhdr-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-suspend:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-dg2-8/igt@kms_frontbuffer_tracking@psrhdr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@audio-bw-hblank160:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-glk8/igt@kms_hdmi_audio_bw@audio-bw-hblank160.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17102">i915#17102</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-glk10/igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-mtlp-4/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-mtlp-1/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15725">i915#15725</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-9/igt@kms_hdr@bpc-switch-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-7/igt@kms_hdr@bpc-switch-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644">i915#16644</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-1/igt@kms_hdr@bpc-switch-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-9/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459">i915#15459</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-2/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458">i915#15458</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-1/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458">i915#15458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-2/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301">i915#6301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-untiled:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-glk3/igt@kms_pipe_stress@stress-xrgb8888-untiled.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/118">i915#118</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-4/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-1/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-8/igt@kms_plane@pixel-format-4-tiled-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-dg1-18/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-7:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-1/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16386">i915#16386</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-b-plane-5:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-7/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-b-plane-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16386">i915#16386</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-glk5/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13026">i915#13026</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-dg1-18/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-1/igt@kms_plane_multiple@2x-tiling-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-4/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-dg1-18/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-10/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-10/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-8/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-8/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-4/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812">i915#9812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-suspend-resume:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-glk3/igt@kms_pm_dc@dc5-dpms-suspend-resume.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16938">i915#16938</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr-suspend-resume:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-10/igt@kms_pm_dc@dc5-psr-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16914">i915#16914</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-4/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16479">i915#16479</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-2/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948">i915#15948</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-7/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15739">i915#15739</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-1/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15739">i915#15739</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-1/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-dg1-15/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-dg1-19/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-2/igt@kms_pm_rpm@modeset-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-7/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-dg1-18/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-9/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-hybrid:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-dg1-18/igt@kms_prime@basic-crc-hybrid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@d3hot:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-7/igt@kms_prime@d3hot.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-1/igt@kms_prime@d3hot.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-glk11/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-9/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-1/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-glk3/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-dg1-18/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-glk10/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-8/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-snb6/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-dg1-18/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-page-flip:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-4/igt@kms_psr@pr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-mmap-cpu:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-dg1-18/igt@kms_psr@psr-sprite-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-5/igt@kms_psr@psr2-cursor-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-mmap-gtt:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-1/igt@kms_psr@psr2-sprite-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15949">i915#15949</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-7/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15949">i915#15949</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-glk3/igt@kms_rotation_crc@multiplane-rotation.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15492">i915#15492</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16184">i915#16184</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-10/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-2/igt@kms_scaling_modes@scaling-mode-full.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-9/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-dg1-18/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@ccs0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-dg2-5/igt@perf_pmu@busy-double-start@ccs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-dg2-6/igt@perf_pmu@busy-double-start@ccs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@vecs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-mtlp-5/igt@perf_pmu@busy-double-start@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-mtlp-7/igt@perf_pmu@busy-double-start@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-glk10/igt@perf_pmu@module-unload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17127">i915#17127</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-all-gts:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-1/igt@perf_pmu@rc6-all-gts.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516">i915#8516</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-7/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-dg2-4/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16348">i915#16348</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-dg2-4/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@sysfs-reader:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-6/igt@i915_suspend@sysfs-reader.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-7/igt@i915_suspend@sysfs-reader.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-glk1/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14888">i915#14888</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-glk3/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-2.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-dg1-15/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-dg1-19/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-1/igt@kms_flip@flip-vs-suspend-interruptible.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132">i915#15132</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16925">i915#16925</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-2/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-5/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-4k:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-mtlp-1/igt@kms_hdmi_inject@inject-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15725">i915#15725</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-mtlp-5/igt@kms_hdmi_inject@inject-4k.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-glk8/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13026">i915#13026</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-glk5/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-5/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-6/igt@kms_plane_scaling@intel-max-src-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-2/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-7/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-idle:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-3/igt@kms_pm_rpm@system-suspend-idle.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14419">i915#14419</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-8/igt@kms_pm_rpm@system-suspend-idle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@vcs1:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-dg1-14/igt@perf_pmu@busy-double-start@vcs1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-dg1-15/igt@perf_pmu@busy-double-start@vcs1.html">PASS</a></li>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-mtlp-5/igt@perf_pmu@busy-double-start@vcs1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-mtlp-7/igt@perf_pmu@busy-double-start@vcs1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@vecs0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-dg2-5/igt@perf_pmu@busy-double-start@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-dg2-6/igt@perf_pmu@busy-double-start@vecs0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@api_intel_bb@object-reloc-keep-cache:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-5/igt@api_intel_bb@object-reloc-keep-cache.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i915#8411</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-6/igt@api_intel_bb@object-reloc-keep-cache.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_basic@multigpu-create-close:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-5/igt@gem_basic@multigpu-create-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697">i915#7697</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-6/igt@gem_basic@multigpu-create-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697">i915#7697</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@rcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-mtlp-4/igt@gem_ctx_isolation@preservation-s3@rcs0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-mtlp-3/igt@gem_ctx_isolation@preservation-s3@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17176">i915#17176</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@engines:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-5/igt@gem_ctx_sseu@engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-6/igt@gem_ctx_sseu@engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-sseu:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-6/igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-8/igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-balancer:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-5/igt@gem_exec_balancer@parallel-balancer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-6/igt@gem_exec_balancer@parallel-balancer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-recoverable:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-5/igt@gem_exec_capture@capture-recoverable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6344">i915#6344</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-6/igt@gem_exec_capture@capture-recoverable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6344">i915#6344</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-read-active:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-6/igt@gem_exec_reloc@basic-cpu-read-active.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-8/igt@gem_exec_reloc@basic-cpu-read-active.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-softpin:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-5/igt@gem_exec_reloc@basic-softpin.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-6/igt@gem_exec_reloc@basic-softpin.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@semaphore-power:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-6/igt@gem_exec_schedule@semaphore-power.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7276">i915#7276</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-8/igt@gem_exec_schedule@semaphore-power.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7276">i915#7276</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random-ccs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-6/igt@gem_lmem_swapping@heavy-verify-random-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-7/igt@gem_lmem_swapping@heavy-verify-random-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-5/igt@gem_pwrite@basic-exhaustion.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-6/igt@gem_pwrite@basic-exhaustion.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_readwrite@read-write:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-6/igt@gem_readwrite@read-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-7/igt@gem_readwrite@read-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-unsync:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-6/igt@gem_userptr_blits@readonly-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-5/igt@gem_userptr_blits@readonly-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-chained:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-5/igt@gen9_exec_parse@bb-chained.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-6/igt@gen9_exec_parse@bb-chained.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@unaligned-jump:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-6/igt@gen9_exec_parse@unaligned-jump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-7/igt@gen9_exec_parse@unaligned-jump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-mtlp-4/igt@i915_module_load@fault-injection.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15342">i915#15342</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15481">i915#15481</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-mtlp-3/igt@i915_module_load@fault-injection.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15481">i915#15481</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-known-pci-ids:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-6/igt@i915_query@query-topology-known-pci-ids.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16109">i915#16109</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-5/igt@i915_query@query-topology-known-pci-ids.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16109">i915#16109</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@test-query-geometry-subslices:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-5/igt@i915_query@test-query-geometry-subslices.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5723">i915#5723</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-6/igt@i915_query@test-query-geometry-subslices.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5723">i915#5723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-5/igt@kms_big_fb@4-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-6/igt@kms_big_fb@4-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-6/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-7/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-5/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-6/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-6/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-7/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-5/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-6/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-5/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-8/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-dg1-18/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-dg1-18/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-dg1-12/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-dg1-16/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-5/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-6/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-fast:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-6/igt@kms_chamelium_frames@hdmi-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-5/igt@kms_chamelium_frames@hdmi-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-5/igt@kms_chamelium_hpd@dp-hpd-storm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-6/igt@kms_chamelium_hpd@dp-hpd-storm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@suspend-resume:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-6/igt@kms_content_protection@suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-5/igt@kms_content_protection@suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-5/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-5/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067">i915#9067</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-6/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067">i915#9067</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-5/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16867">i915#16867</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-6/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16867">i915#16867</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-5/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-6/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-6/igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-7/igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-6/igt@kms_flip@2x-blocking-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-7/igt@kms_flip@2x-blocking-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-5/igt@kms_flip@2x-modeset-vs-vblank-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-6/igt@kms_flip@2x-modeset-vs-vblank-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-5/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16056">i915#16056</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-5/igt@kms_frontbuffer_tracking@fbchdr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-dg1-12/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +46 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-5/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-6/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132">i915#15132</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-8/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17122">i915#17122</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17137">i915#17137</a>)</li>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-tglu-9/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17101">i915#17101</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17108">i915#17108</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-8/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17101">i915#17101</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17108">i915#17108</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17188">i915#17188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-6/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644">i915#16644</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-5/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#12713</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644">i915#16644</a>)</li>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-tglu-2/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187">i915#1187</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#12713</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-tglu-7/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#12713</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-5/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644">i915#16644</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-6/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644">i915#16644</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-6/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460">i915#15460</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-8/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460">i915#15460</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-6/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458">i915#15458</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-7/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458">i915#15458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-5/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301">i915#6301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-6/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301">i915#6301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-5/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-6/igt@kms_plane_multiple@2x-tiling-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-8/igt@kms_plane_multiple@2x-tiling-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-6/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-8/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +3 other tests skip</li>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-dg1-18/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-dg1-18/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-5/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-6/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-pageflip-negative:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-5/igt@kms_pm_dc@dc5-pageflip-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i915#9685</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-6/igt@kms_pm_dc@dc5-pageflip-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i915#9685</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@screens-disabled:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-6/igt@kms_pm_lpsp@screens-disabled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430">i915#8430</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-8/igt@kms_pm_lpsp@screens-disabled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430">i915#8430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-5/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-6/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-blt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-6/igt@kms_psr@fbc-psr2-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-8/igt@kms_psr@fbc-psr2-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-5/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-6/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-5/igt@kms_scaling_modes@scaling-mode-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-6/igt@kms_scaling_modes@scaling-mode-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-5/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243">i915#15243</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-6/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243">i915#15243</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-all-gts:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-6/igt@perf_pmu@rc6-all-gts.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516">i915#8516</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-7/igt@perf_pmu@rc6-all-gts.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516">i915#8516</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@coherency-gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19207/shard-rkl-5/igt@prime_vgem@coherency-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174791v1/shard-rkl-6/igt@prime_vgem@coherency-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_19207 -&gt; Patchwork_174791v1</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19207: 890d1157247d8ad65d9a2d44c065accd550b61f4 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_9109: 65f84b280be2caf8ce376295d97987a808affdee @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  Patchwork_174791v1: 890d1157247d8ad65d9a2d44c065accd550b61f4 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============2208040463014973888==--
