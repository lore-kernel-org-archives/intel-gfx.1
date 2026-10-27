Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16EC2606A31A
	for <intel-gfx@archiver.kernel.org>; Tue, 27 Oct 2026 21:52:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B9D010E4A6;
	Tue, 27 Oct 2026 21:52:49 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2844010E4A0;
 Tue, 27 Oct 2026 21:52:48 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0091404581817066981=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EFull=3A_success_for_series_starting_with_=5B?=
 =?utf-8?q?v3=2C1/3=5D_drm/i915/fbc=3A_update_the_supported_FP16_formats?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Tue, 27 Oct 2026 21:52:48 -0000
Message-ID: <179313796813.78940.13409790167741512547@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261027150544.81548-1-vinod.govindapillai@intel.com>
In-Reply-To: <20261027150544.81548-1-vinod.govindapillai@intel.com>
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

--===============0091404581817066981==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [v3,1/3] drm/i915/fbc: update the supported FP16 formats
URL   : https://patchwork.freedesktop.org/series/176963/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_19399_full -> Patchwork_176963v1_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (10 -> 10)
------------------------------

  No changes in participating hosts

New tests
---------

  New tests have been introduced between CI_DRM_19399_full and Patchwork_176963v1_full:

### New IGT tests (1) ###

  * igt@kms_cursor_crc@cursor-random-64x64@pipe-c-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [4.10] s

  

Known issues
------------

  Here are the changes found in Patchwork_176963v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-glk:          NOTRUN -> [SKIP][1] ([i915#17537])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk1/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@dmabuf@dma-buf-fence-chain:
    - shard-glk10:        NOTRUN -> [SKIP][2] ([i915#17712])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk10/igt@dmabuf@dma-buf-fence-chain.html

  * igt@drm_read@short-buffer-nonblock:
    - shard-dg2:          [PASS][3] -> [SKIP][4] ([i915#17359]) +2 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-8/igt@drm_read@short-buffer-nonblock.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@drm_read@short-buffer-nonblock.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-glk:          NOTRUN -> [SKIP][5] ([i915#17499]) +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk9/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-tglu-1:       NOTRUN -> [SKIP][6] ([i915#9323])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-rkl:          NOTRUN -> [SKIP][7] ([i915#3555] / [i915#9323])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-7/igt@gem_ccs@ctrl-surf-copy.html
    - shard-tglu-1:       NOTRUN -> [SKIP][8] ([i915#3555] / [i915#9323])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_ccs@large-ctrl-surf-copy:
    - shard-glk11:        NOTRUN -> [SKIP][9] ([i915#17499])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk11/igt@gem_ccs@large-ctrl-surf-copy.html
    - shard-tglu-1:       NOTRUN -> [SKIP][10] ([i915#13008])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@gem_ccs@large-ctrl-surf-copy.html

  * igt@gem_ccs@suspend-resume:
    - shard-tglu:         NOTRUN -> [SKIP][11] ([i915#9323])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-9/igt@gem_ccs@suspend-resume.html

  * igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0:
    - shard-dg2:          [PASS][12] -> [INCOMPLETE][13] ([i915#13356] / [i915#16348])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-1/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-glk11:        NOTRUN -> [SKIP][14] ([i915#17568])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk11/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-glk:          NOTRUN -> [SKIP][15] ([i915#17568])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk9/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_compute@compute-square:
    - shard-glk:          NOTRUN -> [SKIP][16] ([i915#17552])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk9/igt@gem_compute@compute-square.html

  * igt@gem_create@create-ext-cpu-access-sanity-check:
    - shard-rkl:          NOTRUN -> [SKIP][17] ([i915#6335])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-8/igt@gem_create@create-ext-cpu-access-sanity-check.html

  * igt@gem_create@create-ext-set-pat:
    - shard-tglu:         NOTRUN -> [SKIP][18] ([i915#8562])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-3/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_param@set-priority-not-supported:
    - shard-tglu:         NOTRUN -> [SKIP][19] ([i915#17444])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-3/igt@gem_ctx_param@set-priority-not-supported.html

  * igt@gem_ctx_persistence@legacy-engines-mixed:
    - shard-snb:          NOTRUN -> [SKIP][20] ([i915#1099])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-snb4/igt@gem_ctx_persistence@legacy-engines-mixed.html

  * igt@gem_ctx_persistence@saturated-hostile-nopreempt:
    - shard-dg2:          NOTRUN -> [SKIP][21] ([i915#5882]) +7 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-1/igt@gem_ctx_persistence@saturated-hostile-nopreempt.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-glk:          NOTRUN -> [SKIP][22] ([i915#17496])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk1/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-tglu-1:       NOTRUN -> [SKIP][23] ([i915#280])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_eio@in-flight-suspend:
    - shard-mtlp:         [PASS][24] -> [ABORT][25] ([i915#17217])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-mtlp-4/igt@gem_eio@in-flight-suspend.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-mtlp-4/igt@gem_eio@in-flight-suspend.html

  * igt@gem_eio@unwedge-stress:
    - shard-snb:          NOTRUN -> [FAIL][26] ([i915#8898]) +1 other test fail
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-snb4/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@bonded-pair:
    - shard-dg2:          NOTRUN -> [SKIP][27] ([i915#4771])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-1/igt@gem_exec_balancer@bonded-pair.html

  * igt@gem_exec_balancer@parallel-keep-submit-fence:
    - shard-glk:          NOTRUN -> [SKIP][28] ([i915#17547]) +3 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk4/igt@gem_exec_balancer@parallel-keep-submit-fence.html
    - shard-tglu:         NOTRUN -> [SKIP][29] ([i915#4525])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-9/igt@gem_exec_balancer@parallel-keep-submit-fence.html

  * igt@gem_exec_balancer@parallel-out-fence:
    - shard-rkl:          NOTRUN -> [SKIP][30] ([i915#4525])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-7/igt@gem_exec_balancer@parallel-out-fence.html
    - shard-tglu-1:       NOTRUN -> [SKIP][31] ([i915#4525])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@gem_exec_balancer@parallel-out-fence.html

  * igt@gem_exec_big@single:
    - shard-rkl:          NOTRUN -> [FAIL][32] ([i915#16604])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-8/igt@gem_exec_big@single.html

  * igt@gem_exec_capture@capture-invisible@lmem0:
    - shard-dg2:          NOTRUN -> [SKIP][33] ([i915#6334]) +2 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-1/igt@gem_exec_capture@capture-invisible@lmem0.html

  * igt@gem_exec_capture@capture@vecs0-lmem0:
    - shard-dg1:          NOTRUN -> [FAIL][34] ([i915#16904]) +2 other tests fail
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-19/igt@gem_exec_capture@capture@vecs0-lmem0.html

  * igt@gem_exec_endless@dispatch@bcs0:
    - shard-glk10:        NOTRUN -> [SKIP][35] ([i915#17571])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk10/igt@gem_exec_endless@dispatch@bcs0.html

  * igt@gem_exec_fence@submit67:
    - shard-dg1:          NOTRUN -> [SKIP][36] ([i915#4812]) +1 other test skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-12/igt@gem_exec_fence@submit67.html

  * igt@gem_exec_flush@basic-uc-set-default:
    - shard-dg1:          NOTRUN -> [SKIP][37] ([i915#3539])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-12/igt@gem_exec_flush@basic-uc-set-default.html

  * igt@gem_exec_flush@basic-wb-pro-default:
    - shard-dg1:          NOTRUN -> [SKIP][38] ([i915#3539] / [i915#4852])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-19/igt@gem_exec_flush@basic-wb-pro-default.html

  * igt@gem_exec_params@rsvd2-dirt:
    - shard-glk10:        NOTRUN -> [SKIP][39] ([i915#17565])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk10/igt@gem_exec_params@rsvd2-dirt.html
    - shard-tglu:         NOTRUN -> [SKIP][40] ([i915#17453])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-4/igt@gem_exec_params@rsvd2-dirt.html

  * igt@gem_exec_params@secure-non-master:
    - shard-rkl:          NOTRUN -> [SKIP][41] ([i915#17416])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-7/igt@gem_exec_params@secure-non-master.html
    - shard-tglu-1:       NOTRUN -> [SKIP][42] ([i915#17416])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@gem_exec_params@secure-non-master.html

  * igt@gem_exec_reloc@basic-gtt-noreloc:
    - shard-dg1:          NOTRUN -> [SKIP][43] ([i915#3281])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-12/igt@gem_exec_reloc@basic-gtt-noreloc.html

  * igt@gem_exec_reloc@basic-gtt-read:
    - shard-dg2:          NOTRUN -> [SKIP][44] ([i915#3281]) +3 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-1/igt@gem_exec_reloc@basic-gtt-read.html

  * igt@gem_exec_reloc@basic-write-wc-active:
    - shard-rkl:          NOTRUN -> [SKIP][45] ([i915#3281]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-8/igt@gem_exec_reloc@basic-write-wc-active.html

  * igt@gem_fence_thrash@bo-copy:
    - shard-dg1:          NOTRUN -> [SKIP][46] ([i915#4860])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-12/igt@gem_fence_thrash@bo-copy.html

  * igt@gem_huc_copy@huc-copy:
    - shard-rkl:          NOTRUN -> [SKIP][47] ([i915#2190])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-8/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@heavy-verify-random:
    - shard-tglu-1:       NOTRUN -> [SKIP][48] ([i915#4613]) +2 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@gem_lmem_swapping@heavy-verify-random.html
    - shard-glk11:        NOTRUN -> [SKIP][49] ([i915#17503])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk11/igt@gem_lmem_swapping@heavy-verify-random.html

  * igt@gem_lmem_swapping@random-engines:
    - shard-glk:          NOTRUN -> [SKIP][50] ([i915#17503] / [i915#4613]) +3 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk4/igt@gem_lmem_swapping@random-engines.html

  * igt@gem_lmem_swapping@verify:
    - shard-glk10:        NOTRUN -> [SKIP][51] ([i915#17503]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk10/igt@gem_lmem_swapping@verify.html

  * igt@gem_lmem_swapping@verify-random-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][52] ([i915#4613]) +3 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-3/igt@gem_lmem_swapping@verify-random-ccs.html

  * igt@gem_media_vme:
    - shard-dg1:          NOTRUN -> [SKIP][53] ([i915#284])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-16/igt@gem_media_vme.html

  * igt@gem_mmap_gtt@basic-read-write:
    - shard-dg2:          NOTRUN -> [SKIP][54] ([i915#4077]) +1 other test skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-1/igt@gem_mmap_gtt@basic-read-write.html

  * igt@gem_mmap_gtt@basic-small-bo-tiledx:
    - shard-glk10:        NOTRUN -> [DMESG-WARN][55] ([i915#16685])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk10/igt@gem_mmap_gtt@basic-small-bo-tiledx.html

  * igt@gem_mmap_gtt@coherency:
    - shard-glk:          NOTRUN -> [SKIP][56] ([i915#17582])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk9/igt@gem_mmap_gtt@coherency.html

  * igt@gem_mmap_wc@write-wc-read-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][57] ([i915#4083]) +2 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-16/igt@gem_mmap_wc@write-wc-read-gtt.html

  * igt@gem_partial_pwrite_pread@write-snoop:
    - shard-dg1:          NOTRUN -> [SKIP][58] ([i915#3282]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-19/igt@gem_partial_pwrite_pread@write-snoop.html

  * igt@gem_pread@bench:
    - shard-dg2:          NOTRUN -> [SKIP][59] ([i915#3282])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-1/igt@gem_pread@bench.html

  * igt@gem_pxp@hw-rejects-pxp-buffer:
    - shard-tglu:         NOTRUN -> [SKIP][60] ([i915#13398])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-3/igt@gem_pxp@hw-rejects-pxp-buffer.html

  * igt@gem_pxp@reject-modify-context-protection-off-1:
    - shard-glk11:        NOTRUN -> [SKIP][61] ([i915#17521])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk11/igt@gem_pxp@reject-modify-context-protection-off-1.html

  * igt@gem_pxp@reject-modify-context-protection-off-2:
    - shard-glk:          NOTRUN -> [SKIP][62] ([i915#17521]) +3 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk9/igt@gem_pxp@reject-modify-context-protection-off-2.html

  * igt@gem_pxp@reject-modify-context-protection-off-3:
    - shard-dg1:          NOTRUN -> [SKIP][63] ([i915#4270]) +1 other test skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-16/igt@gem_pxp@reject-modify-context-protection-off-3.html

  * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
    - shard-glk10:        NOTRUN -> [SKIP][64] ([i915#17521])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk10/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html

  * igt@gem_pxp@verify-pxp-stale-buf-execution:
    - shard-dg2:          NOTRUN -> [SKIP][65] ([i915#4270])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-1/igt@gem_pxp@verify-pxp-stale-buf-execution.html

  * igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][66] ([i915#5190] / [i915#8428]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-1/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled:
    - shard-glk11:        NOTRUN -> [SKIP][67] ([i915#17492])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk11/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html

  * igt@gem_render_copy@yf-tiled-to-vebox-linear:
    - shard-glk:          NOTRUN -> [SKIP][68] ([i915#17492]) +3 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk9/igt@gem_render_copy@yf-tiled-to-vebox-linear.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][69] ([i915#4885])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-19/igt@gem_softpin@evict-snoop-interruptible.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-rkl:          NOTRUN -> [SKIP][70] ([i915#3297])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-8/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@readonly-pwrite-unsync:
    - shard-glk10:        NOTRUN -> [SKIP][71] ([i915#17507])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk10/igt@gem_userptr_blits@readonly-pwrite-unsync.html

  * igt@gem_userptr_blits@unsync-overlap:
    - shard-tglu-1:       NOTRUN -> [SKIP][72] ([i915#3297]) +1 other test skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@gem_userptr_blits@unsync-overlap.html
    - shard-glk11:        NOTRUN -> [SKIP][73] ([i915#17507])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk11/igt@gem_userptr_blits@unsync-overlap.html

  * igt@gem_userptr_blits@unsync-unmap:
    - shard-glk:          NOTRUN -> [SKIP][74] ([i915#17507])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk4/igt@gem_userptr_blits@unsync-unmap.html
    - shard-tglu:         NOTRUN -> [SKIP][75] ([i915#3297])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-9/igt@gem_userptr_blits@unsync-unmap.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-dg1:          NOTRUN -> [SKIP][76] ([i915#3297])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-16/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gem_workarounds@suspend-resume:
    - shard-glk10:        NOTRUN -> [INCOMPLETE][77] ([i915#13356] / [i915#14586])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk10/igt@gem_workarounds@suspend-resume.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-rkl:          [PASS][78] -> [INCOMPLETE][79] ([i915#13356])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-5/igt@gem_workarounds@suspend-resume-context.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-6/igt@gem_workarounds@suspend-resume-context.html

  * igt@gen3_render_linear_blits:
    - shard-glk:          NOTRUN -> [SKIP][80] ([i915#17555])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk1/igt@gen3_render_linear_blits.html

  * igt@gen3_render_mixed_blits:
    - shard-glk11:        NOTRUN -> [SKIP][81] ([i915#17532])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk11/igt@gen3_render_mixed_blits.html

  * igt@gen3_render_tiledx_blits:
    - shard-glk:          NOTRUN -> [SKIP][82] ([i915#17511])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk9/igt@gen3_render_tiledx_blits.html

  * igt@gen3_render_tiledy_blits:
    - shard-glk:          NOTRUN -> [SKIP][83] ([i915#17578])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk4/igt@gen3_render_tiledy_blits.html

  * igt@gen7_exec_parse@basic-allocation:
    - shard-glk:          NOTRUN -> [SKIP][84] ([i915#17505]) +1 other test skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk1/igt@gen7_exec_parse@basic-allocation.html

  * igt@gen7_exec_parse@basic-rejected:
    - shard-tglu-1:       NOTRUN -> [SKIP][85] ([i915#17455]) +2 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@gen7_exec_parse@basic-rejected.html

  * igt@gen7_exec_parse@batch-without-end:
    - shard-rkl:          NOTRUN -> [SKIP][86] ([i915#17455])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-7/igt@gen7_exec_parse@batch-without-end.html

  * igt@gen7_exec_parse@bitmasks:
    - shard-glk10:        NOTRUN -> [SKIP][87] ([i915#17505]) +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk10/igt@gen7_exec_parse@bitmasks.html
    - shard-tglu:         NOTRUN -> [SKIP][88] ([i915#17455]) +2 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-4/igt@gen7_exec_parse@bitmasks.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-dg1:          NOTRUN -> [SKIP][89] ([i915#2527]) +1 other test skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-12/igt@gen9_exec_parse@allowed-single.html

  * igt@gen9_exec_parse@basic-rejected-ctx-param:
    - shard-tglu:         NOTRUN -> [SKIP][90] ([i915#2527] / [i915#2856]) +2 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-9/igt@gen9_exec_parse@basic-rejected-ctx-param.html

  * igt@gen9_exec_parse@batch-without-end:
    - shard-dg2:          NOTRUN -> [SKIP][91] ([i915#2856])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-1/igt@gen9_exec_parse@batch-without-end.html

  * igt@gen9_exec_parse@valid-registers:
    - shard-tglu-1:       NOTRUN -> [SKIP][92] ([i915#2527] / [i915#2856]) +1 other test skip
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@gen9_exec_parse@valid-registers.html

  * igt@i915_drm_fdinfo@all-busy-idle-check-all:
    - shard-dg1:          NOTRUN -> [SKIP][93] ([i915#14123])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-16/igt@i915_drm_fdinfo@all-busy-idle-check-all.html

  * igt@i915_drm_fdinfo@busy-idle@vecs0:
    - shard-dg2:          NOTRUN -> [SKIP][94] ([i915#14073]) +7 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-1/igt@i915_drm_fdinfo@busy-idle@vecs0.html

  * igt@i915_drm_fdinfo@virtual-busy-hang:
    - shard-dg1:          NOTRUN -> [SKIP][95] ([i915#14118])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-12/igt@i915_drm_fdinfo@virtual-busy-hang.html

  * igt@i915_module_load@fault-injection@intel_connector_register:
    - shard-tglu:         NOTRUN -> [ABORT][96] ([i915#15342]) +1 other test abort
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-9/igt@i915_module_load@fault-injection@intel_connector_register.html

  * igt@i915_module_load@fault-injection@uc_fw_rsa_data_create:
    - shard-tglu:         NOTRUN -> [SKIP][97] ([i915#15479]) +4 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-9/igt@i915_module_load@fault-injection@uc_fw_rsa_data_create.html

  * igt@i915_pm_freq_api@freq-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][98] ([i915#8399]) +1 other test skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-4/igt@i915_pm_freq_api@freq-suspend.html
    - shard-glk10:        NOTRUN -> [SKIP][99] ([i915#17526]) +1 other test skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk10/igt@i915_pm_freq_api@freq-suspend.html

  * igt@i915_pm_rc6_residency@media-rc6-accuracy:
    - shard-dg1:          NOTRUN -> [SKIP][100] ([i915#16080] / [i915#16166])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-12/igt@i915_pm_rc6_residency@media-rc6-accuracy.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-tglu:         NOTRUN -> [WARN][101] ([i915#13790] / [i915#2681]) +1 other test warn
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-9/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_query@hwconfig_table:
    - shard-glk11:        NOTRUN -> [SKIP][102] ([i915#17584])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk11/igt@i915_query@hwconfig_table.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-rkl:          [PASS][103] -> [ABORT][104] ([i915#15131])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-7/igt@i915_suspend@basic-s3-without-i915.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-1/igt@i915_suspend@basic-s3-without-i915.html

  * igt@intel_hwmon@hwmon-write:
    - shard-glk:          NOTRUN -> [SKIP][105] ([i915#11680])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk9/igt@intel_hwmon@hwmon-write.html

  * igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:
    - shard-dg1:          NOTRUN -> [SKIP][106] ([i915#4212])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-12/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear:
    - shard-dg2:          [PASS][107] -> [SKIP][108] ([i915#17356]) +77 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-8/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html
    - shard-glk10:        NOTRUN -> [SKIP][109] ([i915#17562])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk10/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-glk11:        NOTRUN -> [SKIP][110] ([i915#17485])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk11/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-tglu:         NOTRUN -> [SKIP][111] ([i915#1769] / [i915#3555])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-0:
    - shard-tglu:         NOTRUN -> [SKIP][112] ([i915#17432] / [i915#5286]) +4 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-4/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-glk:          NOTRUN -> [SKIP][113] ([i915#17478]) +4 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk4/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-0:
    - shard-rkl:          NOTRUN -> [SKIP][114] ([i915#4538] / [i915#5286])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-7/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-rkl:          NOTRUN -> [SKIP][115] ([i915#5286])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-8/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-glk:          NOTRUN -> [SKIP][116] ([i915#17544])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk9/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-dg1:          NOTRUN -> [SKIP][117] ([i915#4538] / [i915#5286]) +1 other test skip
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-12/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-glk11:        NOTRUN -> [SKIP][118] ([i915#17478]) +1 other test skip
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk11/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-mtlp:         [PASS][119] -> [FAIL][120] ([i915#15733] / [i915#5138])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-mtlp-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-mtlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-tglu-1:       NOTRUN -> [SKIP][121] ([i915#17432] / [i915#5286]) +4 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-glk11:        NOTRUN -> [SKIP][122] ([i915#17500]) +2 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk11/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-tglu-1:       NOTRUN -> [SKIP][123] ([i915#17431]) +2 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-glk:          NOTRUN -> [SKIP][124] ([i915#17524]) +1 other test skip
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk1/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-tglu-1:       NOTRUN -> [SKIP][125] ([i915#3828])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-tglu:         NOTRUN -> [SKIP][126] ([i915#3828])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-9/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-dg2:          NOTRUN -> [SKIP][127] ([i915#3828])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-1/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-snb:          NOTRUN -> [SKIP][128] ([i915#17500])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-snb4/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-glk10:        NOTRUN -> [SKIP][129] ([i915#17500]) +2 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk10/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - shard-glk:          NOTRUN -> [SKIP][130] ([i915#17500]) +7 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk9/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
    - shard-dg1:          NOTRUN -> [SKIP][131] ([i915#3638]) +1 other test skip
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-19/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-snb:          NOTRUN -> [SKIP][132] ([i915#17478]) +1 other test skip
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-snb4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
    - shard-dg1:          NOTRUN -> [SKIP][133] ([i915#4538]) +4 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-12/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
    - shard-glk10:        NOTRUN -> [SKIP][134] ([i915#17478]) +2 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk10/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-tglu-1:       NOTRUN -> [SKIP][135] ([i915#17432]) +4 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg2:          NOTRUN -> [SKIP][136] ([i915#4538] / [i915#5190])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-tglu:         NOTRUN -> [SKIP][137] ([i915#17432]) +3 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-9/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-rkl:          NOTRUN -> [SKIP][138] ([i915#4538])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-8/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_busy@basic:
    - shard-dg2:          [PASS][139] -> [SKIP][140] ([i915#11190] / [i915#17356]) +1 other test skip
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-8/igt@kms_busy@basic.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_busy@basic.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][141] ([i915#6095]) +49 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@bad-aux-stride-yf-tiled-ccs:
    - shard-glk10:        NOTRUN -> [DMESG-WARN][142] ([i915#118] / [i915#16685])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk10/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-1:
    - shard-glk11:        NOTRUN -> [SKIP][143] ([i915#17491]) +33 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk11/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][144] ([i915#14098] / [i915#6095]) +25 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-8/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs:
    - shard-dg1:          [PASS][145] -> [DMESG-WARN][146] ([i915#4423])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg1-17/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-14/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-glk:          NOTRUN -> [SKIP][147] ([i915#17525]) +1 other test skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk4/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][148] ([i915#6095]) +24 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-3/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-2:
    - shard-glk10:        NOTRUN -> [SKIP][149] ([i915#17491]) +28 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk10/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc:
    - shard-glk10:        NOTRUN -> [SKIP][150] ([i915#17490] / [i915#17491]) +9 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk10/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-glk11:        NOTRUN -> [SKIP][151] ([i915#17525]) +1 other test skip
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk11/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][152] ([i915#12313]) +1 other test skip
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-9/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][153] ([i915#10307] / [i915#6095]) +77 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-6/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][154] ([i915#12313])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
    - shard-mtlp:         [PASS][155] -> [FAIL][156] ([i915#17158]) +1 other test fail
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-mtlp-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-mtlp-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-2:
    - shard-glk:          NOTRUN -> [INCOMPLETE][157] ([i915#13356] / [i915#15582])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk2/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][158] ([i915#6095]) +15 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-8/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][159] ([i915#12313]) +1 other test skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-12/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:
    - shard-glk:          NOTRUN -> [SKIP][160] ([i915#17490] / [i915#17491]) +17 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk9/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [SKIP][161] ([i915#17491]) +54 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk9/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-hdmi-a-1:
    - shard-dg1:          NOTRUN -> [SKIP][162] ([i915#6095]) +122 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-15/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][163] ([i915#12313])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-8/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][164] ([i915#12313]) +2 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-2:
    - shard-glk11:        NOTRUN -> [SKIP][165] ([i915#17490] / [i915#17491]) +11 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk11/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][166] ([i915#6095]) +47 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-7/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_cdclk@mode-rejected-max-dotclock:
    - shard-tglu-1:       NOTRUN -> [SKIP][167] ([i915#17099])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@kms_cdclk@mode-rejected-max-dotclock.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-glk:          NOTRUN -> [SKIP][168] ([i915#17550])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk4/igt@kms_cdclk@mode-transition-all-outputs.html
    - shard-tglu:         NOTRUN -> [SKIP][169] ([i915#3742])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-9/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][170] ([i915#13781]) +7 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-5/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html

  * igt@kms_chamelium_audio@dp-audio-after-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][171] ([i915#11151])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-3/igt@kms_chamelium_audio@dp-audio-after-suspend.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-tglu:         NOTRUN -> [SKIP][172] ([i915#17427]) +2 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-4/igt@kms_chamelium_color@ctm-green-to-red.html
    - shard-glk10:        NOTRUN -> [SKIP][173] ([i915#17489])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk10/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-tglu-1:       NOTRUN -> [SKIP][174] ([i915#17427])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@kms_chamelium_color@ctm-negative.html
    - shard-glk11:        NOTRUN -> [SKIP][175] ([i915#17489]) +1 other test skip
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk11/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-dg2:          NOTRUN -> [SKIP][176] ([i915#17427])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-1/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_color@gamma:
    - shard-glk:          NOTRUN -> [SKIP][177] ([i915#17489]) +1 other test skip
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk9/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d:
    - shard-rkl:          NOTRUN -> [SKIP][178] ([i915#16471] / [i915#17427])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-8/igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020:
    - shard-glk:          NOTRUN -> [SKIP][179] ([i915#17497]) +2 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk4/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d:
    - shard-glk10:        NOTRUN -> [SKIP][180] ([i915#17497]) +1 other test skip
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk10/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d:
    - shard-dg1:          NOTRUN -> [SKIP][181] ([i915#17427])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-12/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d.html
    - shard-snb:          NOTRUN -> [SKIP][182] ([i915#17497])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-snb4/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d:
    - shard-tglu-1:       NOTRUN -> [SKIP][183] ([i915#16471] / [i915#17427]) +1 other test skip
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@kms_chamelium_color_pipeline@plane-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d:
    - shard-dg2:          NOTRUN -> [SKIP][184] ([i915#16471] / [i915#17427])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-1/igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-lut3d-green-only:
    - shard-dg1:          NOTRUN -> [SKIP][185] ([i915#16471] / [i915#17427]) +1 other test skip
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-19/igt@kms_chamelium_color_pipeline@plane-lut3d-green-only.html

  * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:
    - shard-rkl:          NOTRUN -> [SKIP][186] ([i915#11151] / [i915#7828]) +1 other test skip
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-8/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - shard-dg1:          NOTRUN -> [SKIP][187] ([i915#11151] / [i915#7828]) +4 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-16/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_chamelium_hpd@dp-hpd-storm-disable:
    - shard-tglu-1:       NOTRUN -> [SKIP][188] ([i915#11151] / [i915#7828]) +5 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html
    - shard-glk11:        NOTRUN -> [SKIP][189] ([i915#17483]) +3 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk11/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-glk:          NOTRUN -> [SKIP][190] ([i915#17483]) +10 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk1/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:
    - shard-glk10:        NOTRUN -> [SKIP][191] ([i915#17483]) +1 other test skip
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk10/igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode.html

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - shard-tglu:         NOTRUN -> [SKIP][192] ([i915#11151] / [i915#7828]) +5 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-9/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_color@background-color@pipe-a-background-color:
    - shard-glk:          NOTRUN -> [FAIL][193] ([i915#17133]) +3 other tests fail
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk4/igt@kms_color@background-color@pipe-a-background-color.html

  * igt@kms_color@ctm-0-25:
    - shard-dg2:          [PASS][194] -> [SKIP][195] ([i915#12655] / [i915#17373]) +2 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-6/igt@kms_color@ctm-0-25.html
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_color@ctm-0-25.html

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d:
    - shard-dg2:          [PASS][196] -> [SKIP][197] ([i915#15529]) +2 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-6/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d.html
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d.html

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709:
    - shard-glk:          NOTRUN -> [SKIP][198] ([i915#17510]) +1 other test skip
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk9/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709.html

  * igt@kms_color_pipeline@plane-lut1d:
    - shard-glk11:        NOTRUN -> [SKIP][199] ([i915#17510])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk11/igt@kms_color_pipeline@plane-lut1d.html

  * igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-a-plane-4:
    - shard-dg2:          NOTRUN -> [SKIP][200] ([i915#16990]) +7 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-6/igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-a-plane-4.html

  * igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-d-plane-3:
    - shard-dg1:          NOTRUN -> [SKIP][201] ([i915#16990]) +15 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-16/igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-d-plane-3.html

  * igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-b-plane-4:
    - shard-tglu-1:       NOTRUN -> [SKIP][202] ([i915#16990]) +15 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-b-plane-4.html

  * igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4:
    - shard-glk10:        NOTRUN -> [SKIP][203] ([i915#17510]) +2 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk10/igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4.html

  * igt@kms_content_protection@atomic:
    - shard-dg1:          NOTRUN -> [SKIP][204] ([i915#15865]) +1 other test skip
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-19/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-glk:          NOTRUN -> [SKIP][205] ([i915#17508]) +1 other test skip
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk1/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@content-type-change:
    - shard-tglu:         NOTRUN -> [SKIP][206] ([i915#15865]) +2 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-9/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-glk11:        NOTRUN -> [SKIP][207] ([i915#17502])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk11/igt@kms_content_protection@dp-mst-lic-type-0.html
    - shard-tglu-1:       NOTRUN -> [SKIP][208] ([i915#15330] / [i915#3116] / [i915#3299])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg1:          NOTRUN -> [SKIP][209] ([i915#15330] / [i915#3299])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-16/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@dp-mst-type-0-hdcp14:
    - shard-dg1:          NOTRUN -> [SKIP][210] ([i915#15330])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-12/igt@kms_content_protection@dp-mst-type-0-hdcp14.html

  * igt@kms_content_protection@dp-mst-type-0-suspend-resume:
    - shard-glk:          NOTRUN -> [SKIP][211] ([i915#17502])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk9/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html

  * igt@kms_content_protection@legacy-hdcp14:
    - shard-glk11:        NOTRUN -> [SKIP][212] ([i915#17508]) +1 other test skip
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk11/igt@kms_content_protection@legacy-hdcp14.html

  * igt@kms_content_protection@lic-type-1:
    - shard-dg2:          NOTRUN -> [SKIP][213] ([i915#15865])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-1/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@mei-interface:
    - shard-tglu-1:       NOTRUN -> [SKIP][214] ([i915#15865]) +1 other test skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@uevent:
    - shard-glk10:        NOTRUN -> [SKIP][215] ([i915#17508])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk10/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-glk:          NOTRUN -> [SKIP][216] ([i915#17504]) +1 other test skip
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk1/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-glk10:        NOTRUN -> [SKIP][217] ([i915#17533])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk10/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-glk:          NOTRUN -> [SKIP][218] ([i915#17533]) +2 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk1/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-tglu:         NOTRUN -> [SKIP][219] ([i915#13049]) +1 other test skip
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-3/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-a-hdmi-a-1:
    - shard-tglu:         [PASS][220] -> [FAIL][221] ([i915#13566]) +1 other test fail
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-tglu-10/igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-a-hdmi-a-1.html
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-9/igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [FAIL][222] ([i915#13566]) +1 other test fail
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-7/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-2.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-glk10:        NOTRUN -> [SKIP][223] ([i915#17504])
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk10/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-rkl:          NOTRUN -> [SKIP][224] ([i915#13049])
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-7/igt@kms_cursor_crc@cursor-random-512x170.html
    - shard-tglu-1:       NOTRUN -> [SKIP][225] ([i915#13049]) +1 other test skip
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-random-64x21:
    - shard-tglu-1:       NOTRUN -> [FAIL][226] ([i915#13566]) +1 other test fail
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@kms_cursor_crc@cursor-random-64x21.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-tglu-1:       NOTRUN -> [SKIP][227] ([i915#3555])
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_crc@cursor-sliding-32x32:
    - shard-glk11:        NOTRUN -> [SKIP][228] ([i915#17504])
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk11/igt@kms_cursor_crc@cursor-sliding-32x32.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-tglu:         NOTRUN -> [SKIP][229] ([i915#3555]) +1 other test skip
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-3/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][230] ([i915#12358] / [i915#13356] / [i915#14152] / [i915#7882])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk1/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][231] ([i915#12358] / [i915#13356] / [i915#14152])
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk1/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-tglu-1:       NOTRUN -> [SKIP][232] ([i915#4103]) +1 other test skip
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-glk:          NOTRUN -> [SKIP][233] ([i915#17457])
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-tglu-1:       NOTRUN -> [SKIP][234] ([i915#17428] / [i915#17454]) +1 other test skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-tglu:         NOTRUN -> [SKIP][235] ([i915#17428] / [i915#17454]) +4 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-9/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-glk11:        NOTRUN -> [FAIL][236] ([i915#15768])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk11/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-tglu:         NOTRUN -> [SKIP][237] ([i915#9723])
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-3/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-tglu-1:       NOTRUN -> [SKIP][238] ([i915#9723])
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-dg1:          NOTRUN -> [SKIP][239] ([i915#13691])
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-12/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dither@fb-8bpc-vs-panel-8bpc:
    - shard-dg1:          NOTRUN -> [SKIP][240] ([i915#3555]) +4 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-16/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html

  * igt@kms_dp_aux_dev@basic:
    - shard-rkl:          NOTRUN -> [SKIP][241] ([i915#1257])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-8/igt@kms_dp_aux_dev@basic.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-rkl:          NOTRUN -> [SKIP][242] ([i915#17289])
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-7/igt@kms_dp_link_training@non-uhbr-mst.html
    - shard-tglu-1:       NOTRUN -> [SKIP][243] ([i915#17289])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_link_training@non-uhbr-sst-direct-train:
    - shard-dg2:          NOTRUN -> [SKIP][244] ([i915#17286])
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-1/igt@kms_dp_link_training@non-uhbr-sst-direct-train.html

  * igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train:
    - shard-tglu:         NOTRUN -> [SKIP][245] ([i915#17290])
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-9/igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train.html
    - shard-glk:          NOTRUN -> [SKIP][246] ([i915#17531])
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk4/igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train.html

  * igt@kms_dp_link_training@uhbr-mst-tbtalt-train:
    - shard-glk:          NOTRUN -> [SKIP][247] ([i915#17477])
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk9/igt@kms_dp_link_training@uhbr-mst-tbtalt-train.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-tglu-1:       NOTRUN -> [SKIP][248] ([i915#13748])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-glk:          NOTRUN -> [SKIP][249] ([i915#17680])
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk1/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback:
    - shard-glk:          NOTRUN -> [SKIP][250] ([i915#17548])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk9/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html

  * igt@kms_draw_crc@draw-method-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][251] ([i915#8812])
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-16/igt@kms_draw_crc@draw-method-mmap-gtt.html

  * igt@kms_dsc@dsc-basic-ultrajoiner:
    - shard-dg1:          NOTRUN -> [SKIP][252] ([i915#16361]) +2 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-12/igt@kms_dsc@dsc-basic-ultrajoiner.html
    - shard-snb:          NOTRUN -> [SKIP][253] ([i915#17458]) +1 other test skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-snb4/igt@kms_dsc@dsc-basic-ultrajoiner.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-tglu:         NOTRUN -> [SKIP][254] ([i915#16361]) +1 other test skip
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-4/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-fractional-bpp-bigjoiner:
    - shard-tglu-1:       NOTRUN -> [SKIP][255] ([i915#16361]) +2 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@kms_dsc@dsc-fractional-bpp-bigjoiner.html
    - shard-glk11:        NOTRUN -> [SKIP][256] ([i915#17458])
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk11/igt@kms_dsc@dsc-fractional-bpp-bigjoiner.html

  * igt@kms_dsc@dsc-with-bpc-formats-ultrajoiner:
    - shard-dg2:          NOTRUN -> [SKIP][257] ([i915#16361]) +1 other test skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-1/igt@kms_dsc@dsc-with-bpc-formats-ultrajoiner.html

  * igt@kms_dsc@dsc-with-bpc-ultrajoiner:
    - shard-rkl:          NOTRUN -> [SKIP][258] ([i915#16361])
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-8/igt@kms_dsc@dsc-with-bpc-ultrajoiner.html

  * igt@kms_dsc@dsc-with-output-formats-ultrajoiner:
    - shard-glk10:        NOTRUN -> [SKIP][259] ([i915#17458]) +1 other test skip
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk10/igt@kms_dsc@dsc-with-output-formats-ultrajoiner.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-glk:          NOTRUN -> [SKIP][260] ([i915#17458]) +3 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk9/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@psr:
    - shard-dg2:          NOTRUN -> [SKIP][261] ([i915#16680])
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-1/igt@kms_fbcon_fbt@psr.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-glk:          NOTRUN -> [SKIP][262] ([i915#17516])
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk9/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-glk:          NOTRUN -> [SKIP][263] ([i915#17581])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk1/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-2x:
    - shard-tglu:         NOTRUN -> [SKIP][264] ([i915#16081])
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-3/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@display-3x:
    - shard-glk:          NOTRUN -> [SKIP][265] ([i915#17679])
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk9/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@vrr:
    - shard-tglu-1:       NOTRUN -> [SKIP][266] ([i915#16600]) +1 other test skip
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@kms_feature_discovery@vrr.html

  * igt@kms_fence_pin_leak:
    - shard-dg2:          NOTRUN -> [SKIP][267] ([i915#4881])
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-1/igt@kms_fence_pin_leak.html

  * igt@kms_flip@2x-flip-vs-modeset:
    - shard-dg1:          NOTRUN -> [SKIP][268] ([i915#9934]) +5 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-16/igt@kms_flip@2x-flip-vs-modeset.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-glk11:        NOTRUN -> [INCOMPLETE][269] ([i915#12745] / [i915#13356] / [i915#17183] / [i915#4839])
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk11/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2:
    - shard-glk11:        NOTRUN -> [INCOMPLETE][270] ([i915#12745] / [i915#13356] / [i915#17183])
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk11/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
    - shard-tglu-1:       NOTRUN -> [SKIP][271] ([i915#3637] / [i915#9934]) +4 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-tglu:         NOTRUN -> [SKIP][272] ([i915#3637] / [i915#9934]) +5 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-3/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ab-vga1-hdmi-a1:
    - shard-snb:          [PASS][273] -> [FAIL][274] ([i915#10826]) +1 other test fail
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-snb5/igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ab-vga1-hdmi-a1.html
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-snb5/igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ab-vga1-hdmi-a1.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-glk:          [PASS][275] -> [FAIL][276] ([i915#13027]) +2 other tests fail
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-glk3/igt@kms_flip@flip-vs-expired-vblank.html
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk3/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-rmfb-interruptible:
    - shard-dg2:          [PASS][277] -> [SKIP][278] ([i915#5354]) +5 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-8/igt@kms_flip@flip-vs-rmfb-interruptible.html
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_flip@flip-vs-rmfb-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-glk:          NOTRUN -> [SKIP][279] ([i915#17484]) +4 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk9/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
    - shard-dg2:          [PASS][280] -> [SKIP][281] ([i915#3555] / [i915#8813]) +2 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-5/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:
    - shard-glk11:        NOTRUN -> [SKIP][282] ([i915#17522]) +1 other test skip
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk11/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:
    - shard-tglu:         NOTRUN -> [SKIP][283] ([i915#15643]) +4 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][284] ([i915#15643])
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-16/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
    - shard-glk:          NOTRUN -> [SKIP][285] ([i915#17493])
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-glk11:        NOTRUN -> [SKIP][286] ([i915#17493]) +1 other test skip
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk11/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-glk10:        NOTRUN -> [SKIP][287] ([i915#17484]) +1 other test skip
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk10/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling:
    - shard-glk10:        NOTRUN -> [SKIP][288] ([i915#17522]) +1 other test skip
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk10/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][289] ([i915#15643]) +2 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html
    - shard-glk11:        NOTRUN -> [SKIP][290] ([i915#17484])
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk11/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
    - shard-glk:          NOTRUN -> [SKIP][291] ([i915#17522]) +3 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile:
    - shard-dg2:          [PASS][292] -> [SKIP][293] ([i915#8813])
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-5/igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile.html
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile.html

  * igt@kms_flip_tiling@flip-change-tiling:
    - shard-dg2:          [PASS][294] -> [SKIP][295] ([i915#3555])
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-1/igt@kms_flip_tiling@flip-change-tiling.html
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_flip_tiling@flip-change-tiling.html

  * igt@kms_force_connector_basic@force-load-detect:
    - shard-tglu-1:       NOTRUN -> [SKIP][296] ([i915#17452])
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-cpu:
    - shard-dg2:          [PASS][297] -> [SKIP][298] ([i915#16708])
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-cpu.html
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-dg2:          [PASS][299] -> [SKIP][300] ([i915#16708] / [i915#5354]) +8 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-2p-indfb-fliptrack-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][301] ([i915#15990] / [i915#8708])
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-2p-indfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][302] ([i915#17428] / [i915#1825]) +2 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-pwrite:
    - shard-tglu:         NOTRUN -> [SKIP][303] ([i915#15989]) +15 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-4/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-shrfb-draw-render:
    - shard-dg2:          NOTRUN -> [SKIP][304] ([i915#15989]) +2 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-1/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-blt:
    - shard-glk:          NOTRUN -> [SKIP][305] ([i915#17517]) +46 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk1/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-blt:
    - shard-tglu-1:       NOTRUN -> [SKIP][306] ([i915#17428]) +60 other tests skip
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-blt:
    - shard-rkl:          NOTRUN -> [SKIP][307] ([i915#14544] / [i915#17428])
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-modesetfrombusy:
    - shard-rkl:          NOTRUN -> [SKIP][308] ([i915#15989]) +5 other tests skip
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-7/igt@kms_frontbuffer_tracking@fbchdr-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@fbchdr-stridechange:
    - shard-dg1:          NOTRUN -> [SKIP][309] ([i915#15989]) +6 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-16/igt@kms_frontbuffer_tracking@fbchdr-stridechange.html

  * igt@kms_frontbuffer_tracking@fbchdr-tiling-4:
    - shard-glk:          NOTRUN -> [SKIP][310] ([i915#17559]) +1 other test skip
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk1/igt@kms_frontbuffer_tracking@fbchdr-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][311] ([i915#15104] / [i915#15990])
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-12/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-pwrite:
    - shard-glk:          NOTRUN -> [SKIP][312] ([i915#17482]) +89 other tests skip
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:
    - shard-tglu-1:       NOTRUN -> [SKIP][313] ([i915#15102]) +31 other tests skip
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
    - shard-rkl:          NOTRUN -> [SKIP][314] ([i915#15102]) +14 other tests skip
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:
    - shard-dg2:          NOTRUN -> [SKIP][315] ([i915#15102]) +3 other tests skip
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-plflip-blt:
    - shard-dg1:          NOTRUN -> [SKIP][316] ([i915#15102]) +20 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-12/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-plflip-blt.html
    - shard-snb:          NOTRUN -> [SKIP][317] ([i915#17588]) +7 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-snb4/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-onoff:
    - shard-rkl:          NOTRUN -> [SKIP][318] ([i915#17428]) +19 other tests skip
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-farfromfence-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][319] ([i915#14544] / [i915#15102])
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-farfromfence-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4:
    - shard-tglu:         NOTRUN -> [SKIP][320] ([i915#5439])
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-4/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4.html
    - shard-glk10:        NOTRUN -> [SKIP][321] ([i915#17559])
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk10/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4.html

  * igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-blt:
    - shard-tglu-1:       NOTRUN -> [SKIP][322] ([i915#15989]) +17 other tests skip
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-pwrite:
    - shard-rkl:          [PASS][323] -> [SKIP][324] ([i915#15989]) +8 other tests skip
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-pwrite.html
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-4/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][325] ([i915#15990]) +7 other tests skip
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-1/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-indfb-draw-pwrite:
    - shard-tglu:         NOTRUN -> [SKIP][326] ([i915#17428]) +62 other tests skip
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-4/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-glk:          [PASS][327] -> [SKIP][328] ([i915#17517]) +15 other tests skip
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-glk8/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk6/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-rkl:          NOTRUN -> [SKIP][329] ([i915#9766])
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-7/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
    - shard-tglu-1:       NOTRUN -> [SKIP][330] ([i915#9766])
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][331] ([i915#15990] / [i915#8708]) +6 other tests skip
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-16/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:
    - shard-tglu:         NOTRUN -> [SKIP][332] ([i915#15102]) +31 other tests skip
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff:
    - shard-glk11:        NOTRUN -> [SKIP][333] ([i915#17482]) +39 other tests skip
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk11/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render:
    - shard-dg2:          NOTRUN -> [SKIP][334] ([i915#15991] / [i915#5354]) +4 other tests skip
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-indfb-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][335] ([i915#15990]) +13 other tests skip
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-12/igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-indfb-draw-mmap-wc.html
    - shard-snb:          NOTRUN -> [SKIP][336] ([i915#17482]) +5 other tests skip
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-snb4/igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-draw-render:
    - shard-dg2:          NOTRUN -> [SKIP][337] ([i915#15991]) +6 other tests skip
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-1/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-onoff:
    - shard-dg1:          NOTRUN -> [SKIP][338] ([i915#17428]) +40 other tests skip
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-12/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-pwrite:
    - shard-glk10:        NOTRUN -> [SKIP][339] ([i915#17482]) +35 other tests skip
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk10/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_hdmi_audio_bw@audio-bw-hblank80:
    - shard-dg2:          [PASS][340] -> [SKIP][341] ([i915#17357])
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-1/igt@kms_hdmi_audio_bw@audio-bw-hblank80.html
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_hdmi_audio_bw@audio-bw-hblank80.html

  * igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery:
    - shard-dg1:          NOTRUN -> [ABORT][342] ([i915#17145])
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-19/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html

  * igt@kms_hdr@bpc-switch:
    - shard-glk11:        NOTRUN -> [SKIP][343] ([i915#17498]) +1 other test skip
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk11/igt@kms_hdr@bpc-switch.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-tglu-1:       NOTRUN -> [SKIP][344] ([i915#3555] / [i915#8228])
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-tglu-1:       NOTRUN -> [SKIP][345] ([i915#12713])
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-tglu:         NOTRUN -> [SKIP][346] ([i915#3555] / [i915#8228])
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-9/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_hdr@static-swap:
    - shard-dg1:          NOTRUN -> [SKIP][347] ([i915#3555] / [i915#8228]) +1 other test skip
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-12/igt@kms_hdr@static-swap.html
    - shard-snb:          NOTRUN -> [SKIP][348] ([i915#17498])
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-snb4/igt@kms_hdr@static-swap.html

  * igt@kms_hdr@static-toggle:
    - shard-dg2:          NOTRUN -> [SKIP][349] ([i915#16518] / [i915#3555] / [i915#8228])
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-1/igt@kms_hdr@static-toggle.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-glk:          NOTRUN -> [SKIP][350] ([i915#17498]) +1 other test skip
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk9/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_invalid_mode@zero-clock:
    - shard-dg2:          [PASS][351] -> [SKIP][352] ([i915#16746] / [i915#3555]) +3 other tests skip
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-5/igt@kms_invalid_mode@zero-clock.html
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_invalid_mode@zero-clock.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-glk11:        NOTRUN -> [SKIP][353] ([i915#17512])
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk11/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][354] ([i915#15459])
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-9/igt@kms_joiner@basic-force-big-joiner.html
    - shard-glk:          NOTRUN -> [SKIP][355] ([i915#17678])
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk4/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-glk:          NOTRUN -> [SKIP][356] ([i915#17567])
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk9/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-tglu-1:       NOTRUN -> [SKIP][357] ([i915#15458])
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-tglu-1:       NOTRUN -> [SKIP][358] ([i915#15460])
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][359] ([i915#15459])
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-19/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-dg2:          NOTRUN -> [SKIP][360] ([i915#15458])
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-1/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-glk:          NOTRUN -> [SKIP][361] ([i915#17701])
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-glk11:        NOTRUN -> [SKIP][362] ([i915#17577])
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk11/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_panel_fitting@legacy:
    - shard-dg1:          NOTRUN -> [SKIP][363] ([i915#6301])
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-12/igt@kms_panel_fitting@legacy.html

  * igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c:
    - shard-glk11:        NOTRUN -> [SKIP][364] ([i915#17540])
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk11/igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c.html

  * igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes:
    - shard-glk:          NOTRUN -> [SKIP][365] ([i915#17540])
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk9/igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes.html

  * igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c:
    - shard-dg1:          NOTRUN -> [SKIP][366] ([i915#17455])
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-16/igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][367] ([i915#12756] / [i915#13356] / [i915#13409] / [i915#13476] / [i915#16789]) +1 other test incomplete
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk2/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html

  * igt@kms_pipe_stress@stress-xrgb8888-untiled:
    - shard-glk10:        NOTRUN -> [DMESG-WARN][368] ([i915#118])
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk10/igt@kms_pipe_stress@stress-xrgb8888-untiled.html

  * igt@kms_pipe_stress@stress-xrgb8888-xtiled:
    - shard-glk:          NOTRUN -> [DMESG-FAIL][369] ([i915#118])
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk4/igt@kms_pipe_stress@stress-xrgb8888-xtiled.html

  * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
    - shard-dg1:          NOTRUN -> [SKIP][370] ([i915#14712])
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-16/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier:
    - shard-tglu:         NOTRUN -> [SKIP][371] ([i915#15709]) +3 other tests skip
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-3/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier:
    - shard-dg1:          NOTRUN -> [SKIP][372] ([i915#15709]) +1 other test skip
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-12/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier.html
    - shard-snb:          NOTRUN -> [SKIP][373] ([i915#17479])
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-snb4/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier.html

  * igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping:
    - shard-glk11:        NOTRUN -> [SKIP][374] ([i915#17479]) +3 other tests skip
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk11/igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5:
    - shard-dg2:          NOTRUN -> [SKIP][375] ([i915#16386]) +5 other tests skip
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-6/igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:
    - shard-glk10:        NOTRUN -> [SKIP][376] ([i915#17479])
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk10/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier:
    - shard-glk:          NOTRUN -> [SKIP][377] ([i915#17479]) +1 other test skip
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk4/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier.html

  * igt@kms_plane@pixel-format-linear-modifier:
    - shard-dg2:          [PASS][378] -> [SKIP][379] ([i915#8825]) +3 other tests skip
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-1/igt@kms_plane@pixel-format-linear-modifier.html
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_plane@pixel-format-linear-modifier.html

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier:
    - shard-tglu-1:       NOTRUN -> [SKIP][380] ([i915#15709]) +1 other test skip
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html

  * igt@kms_plane@pixel-format-y-tiled-modifier@pipe-a-plane-4:
    - shard-glk:          NOTRUN -> [SKIP][381] ([i915#17494]) +1 other test skip
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk9/igt@kms_plane@pixel-format-y-tiled-modifier@pipe-a-plane-4.html

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier:
    - shard-rkl:          NOTRUN -> [SKIP][382] ([i915#15709])
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-8/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier.html

  * igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y:
    - shard-dg2:          NOTRUN -> [SKIP][383] ([i915#16112])
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-6/igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-glk11:        NOTRUN -> [INCOMPLETE][384] ([i915#13026] / [i915#13356]) +1 other test incomplete
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk11/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_alpha_blend@alpha-basic:
    - shard-glk10:        NOTRUN -> [FAIL][385] ([i915#12178])
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk10/igt@kms_plane_alpha_blend@alpha-basic.html

  * igt@kms_plane_alpha_blend@alpha-basic@pipe-c-hdmi-a-1:
    - shard-glk10:        NOTRUN -> [FAIL][386] ([i915#7862]) +1 other test fail
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk10/igt@kms_plane_alpha_blend@alpha-basic@pipe-c-hdmi-a-1.html

  * igt@kms_plane_alpha_blend@constant-alpha-min:
    - shard-snb:          NOTRUN -> [SKIP][387] ([i915#17595])
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-snb4/igt@kms_plane_alpha_blend@constant-alpha-min.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-tglu-1:       NOTRUN -> [SKIP][388] ([i915#13958])
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-dg1:          NOTRUN -> [SKIP][389] ([i915#13958])
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-16/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-rkl:          [PASS][390] -> [SKIP][391] ([i915#6953])
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-6/igt@kms_plane_scaling@intel-max-src-size.html
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-4/igt@kms_plane_scaling@intel-max-src-size.html
    - shard-dg1:          NOTRUN -> [SKIP][392] ([i915#6953])
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-19/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b:
    - shard-rkl:          NOTRUN -> [SKIP][393] ([i915#15329]) +3 other tests skip
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-8/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a:
    - shard-tglu:         NOTRUN -> [SKIP][394] ([i915#15329]) +4 other tests skip
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-3/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b:
    - shard-glk10:        NOTRUN -> [SKIP][395] ([i915#17529]) +1 other test skip
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk10/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-c:
    - shard-glk10:        NOTRUN -> [SKIP][396] ([i915#17528]) +1 other test skip
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk10/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-c.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:
    - shard-dg2:          [PASS][397] -> [SKIP][398] ([i915#15329] / [i915#17356] / [i915#3555] / [i915#9423])
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-5/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b:
    - shard-glk:          NOTRUN -> [SKIP][399] ([i915#17529]) +1 other test skip
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk9/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c:
    - shard-glk:          NOTRUN -> [SKIP][400] ([i915#17528]) +1 other test skip
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk9/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers:
    - shard-dg2:          [PASS][401] -> [SKIP][402] ([i915#15329] / [i915#17356] / [i915#9423]) +1 other test skip
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-8/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers.html
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-c:
    - shard-dg2:          [PASS][403] -> [SKIP][404] ([i915#15329]) +20 other tests skip
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-8/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-c.html
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-c.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:
    - shard-dg2:          [PASS][405] -> [SKIP][406] ([i915#15329] / [i915#17356] / [i915#3555] / [i915#6953] / [i915#9423])
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-d:
    - shard-dg2:          [PASS][407] -> [SKIP][408] ([i915#15329] / [i915#17356]) +6 other tests skip
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-d.html
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
    - shard-dg2:          [PASS][409] -> [SKIP][410] ([i915#15329] / [i915#17356] / [i915#6953] / [i915#9423]) +2 other tests skip
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-glk11:        NOTRUN -> [SKIP][411] ([i915#17462])
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk11/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-glk10:        NOTRUN -> [SKIP][412] ([i915#17462])
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk10/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-glk:          NOTRUN -> [SKIP][413] ([i915#17462])
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk9/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][414] ([i915#12343] / [i915#5354]) +1 other test skip
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-1/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc5-pageflip-negative:
    - shard-tglu-1:       NOTRUN -> [SKIP][415] ([i915#9685])
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@kms_pm_dc@dc5-pageflip-negative.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg1:          NOTRUN -> [SKIP][416] ([i915#15948])
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-16/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-glk:          NOTRUN -> [SKIP][417] ([i915#17703])
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk9/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-glk11:        NOTRUN -> [SKIP][418] ([i915#17564])
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk11/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][419] ([i915#15739])
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-7/igt@kms_pm_dc@dc9-dpms.html
    - shard-tglu-1:       NOTRUN -> [SKIP][420] ([i915#15739])
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-glk:          NOTRUN -> [SKIP][421] ([i915#17573])
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk9/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_pm_rpm@cursor:
    - shard-dg1:          NOTRUN -> [SKIP][422] ([i915#4077]) +7 other tests skip
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-12/igt@kms_pm_rpm@cursor.html
    - shard-snb:          NOTRUN -> [SKIP][423] ([i915#17473])
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-snb4/igt@kms_pm_rpm@cursor.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-rkl:          [PASS][424] -> [SKIP][425] ([i915#15073])
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-7/igt@kms_pm_rpm@dpms-non-lpsp.html
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-8/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@drm-resources-equal:
    - shard-dg2:          [PASS][426] -> [SKIP][427] ([i915#17446] / [i915#3547])
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-6/igt@kms_pm_rpm@drm-resources-equal.html
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_pm_rpm@drm-resources-equal.html

  * igt@kms_pm_rpm@i2c:
    - shard-dg2:          [PASS][428] -> [SKIP][429] ([i915#17446])
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-8/igt@kms_pm_rpm@i2c.html
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_pm_rpm@i2c.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-glk:          NOTRUN -> [SKIP][430] ([i915#15073])
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk1/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-dg2:          [PASS][431] -> [SKIP][432] ([i915#15073]) +1 other test skip
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-8/igt@kms_pm_rpm@modeset-non-lpsp.html
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_pm_rpm@modeset-non-lpsp.html
    - shard-dg1:          [PASS][433] -> [SKIP][434] ([i915#15073])
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg1-19/igt@kms_pm_rpm@modeset-non-lpsp.html
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-15/igt@kms_pm_rpm@modeset-non-lpsp.html
    - shard-tglu:         NOTRUN -> [SKIP][435] ([i915#15073])
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-4/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-pc8-residency-stress:
    - shard-tglu-1:       NOTRUN -> [SKIP][436] ([i915#17434] / [i915#17450])
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@kms_pm_rpm@modeset-pc8-residency-stress.html

  * igt@kms_pm_rpm@pc8-residency:
    - shard-tglu:         NOTRUN -> [SKIP][437] ([i915#17434] / [i915#17450])
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-3/igt@kms_pm_rpm@pc8-residency.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-dg1:          NOTRUN -> [SKIP][438] ([i915#6524])
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-12/igt@kms_prime@basic-crc-hybrid.html
    - shard-snb:          NOTRUN -> [SKIP][439] ([i915#17569])
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-snb4/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-glk:          NOTRUN -> [SKIP][440] ([i915#17569])
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk4/igt@kms_prime@basic-modeset-hybrid.html
    - shard-tglu:         NOTRUN -> [SKIP][441] ([i915#6524])
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-9/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_properties@colorop-properties-atomic:
    - shard-dg2:          [PASS][442] -> [SKIP][443] ([i915#15347])
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-8/igt@kms_properties@colorop-properties-atomic.html
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_properties@colorop-properties-atomic.html

  * igt@kms_properties@colorop-properties-legacy:
    - shard-glk:          NOTRUN -> [SKIP][444] ([i915#17481])
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk9/igt@kms_properties@colorop-properties-legacy.html

  * igt@kms_properties@plane-properties-legacy:
    - shard-dg2:          [PASS][445] -> [SKIP][446] ([i915#11521]) +1 other test skip
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-6/igt@kms_properties@plane-properties-legacy.html
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_properties@plane-properties-legacy.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-tglu:         NOTRUN -> [SKIP][447] ([i915#11520]) +5 other tests skip
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-3/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:
    - shard-dg1:          NOTRUN -> [SKIP][448] ([i915#11520]) +4 other tests skip
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-12/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - shard-rkl:          NOTRUN -> [SKIP][449] ([i915#11520]) +1 other test skip
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-8/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-tglu-1:       NOTRUN -> [SKIP][450] ([i915#11520]) +5 other tests skip
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - shard-glk10:        NOTRUN -> [SKIP][451] ([i915#11520]) +1 other test skip
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk10/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:
    - shard-glk11:        NOTRUN -> [SKIP][452] ([i915#11520]) +3 other tests skip
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk11/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:
    - shard-dg2:          NOTRUN -> [SKIP][453] ([i915#11520])
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-1/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-snb:          NOTRUN -> [SKIP][454] ([i915#11520])
   [454]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-snb4/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][455] ([i915#11520]) +7 other tests skip
   [455]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk4/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-dg1:          NOTRUN -> [SKIP][456] ([i915#9683])
   [456]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-19/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-glk10:        NOTRUN -> [SKIP][457] ([i915#17546])
   [457]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk10/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-tglu-1:       NOTRUN -> [SKIP][458] ([i915#9683])
   [458]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-glk:          NOTRUN -> [SKIP][459] ([i915#17546])
   [459]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk9/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][460] ([i915#1072] / [i915#14544] / [i915#9732])
   [460]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-6/igt@kms_psr@fbc-pr-dpms.html

  * igt@kms_psr@fbc-pr-sprite-render:
    - shard-snb:          NOTRUN -> [SKIP][461] ([i915#17480]) +2 other tests skip
   [461]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-snb4/igt@kms_psr@fbc-pr-sprite-render.html
    - shard-dg1:          NOTRUN -> [SKIP][462] ([i915#1072] / [i915#9732]) +13 other tests skip
   [462]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-12/igt@kms_psr@fbc-pr-sprite-render.html

  * igt@kms_psr@fbc-psr-sprite-mmap-cpu:
    - shard-glk11:        NOTRUN -> [SKIP][463] ([i915#17480]) +9 other tests skip
   [463]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk11/igt@kms_psr@fbc-psr-sprite-mmap-cpu.html

  * igt@kms_psr@fbc-psr2-cursor-blt:
    - shard-tglu-1:       NOTRUN -> [SKIP][464] ([i915#9732]) +13 other tests skip
   [464]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@kms_psr@fbc-psr2-cursor-blt.html

  * igt@kms_psr@fbc-psr2-cursor-mmap-gtt:
    - shard-glk:          NOTRUN -> [SKIP][465] ([i915#17480]) +16 other tests skip
   [465]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk9/igt@kms_psr@fbc-psr2-cursor-mmap-gtt.html

  * igt@kms_psr@pr-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][466] ([i915#9732]) +15 other tests skip
   [466]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-4/igt@kms_psr@pr-dpms.html

  * igt@kms_psr@psr-cursor-mmap-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][467] ([i915#1072] / [i915#9732]) +5 other tests skip
   [467]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-1/igt@kms_psr@psr-cursor-mmap-cpu.html

  * igt@kms_psr@psr-cursor-plane-move:
    - shard-glk10:        NOTRUN -> [SKIP][468] ([i915#17480] / [i915#9732])
   [468]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk10/igt@kms_psr@psr-cursor-plane-move.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-glk11:        NOTRUN -> [SKIP][469] ([i915#17480] / [i915#9732])
   [469]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk11/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - shard-glk:          NOTRUN -> [SKIP][470] ([i915#17480] / [i915#9732])
   [470]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk1/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@kms_psr@psr-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][471] ([i915#1072] / [i915#9732]) +4 other tests skip
   [471]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-8/igt@kms_psr@psr-suspend.html

  * igt@kms_psr@psr2-no-drrs:
    - shard-glk10:        NOTRUN -> [SKIP][472] ([i915#17480]) +7 other tests skip
   [472]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk10/igt@kms_psr@psr2-no-drrs.html

  * igt@kms_rotation_crc@exhaust-fences:
    - shard-dg2:          NOTRUN -> [SKIP][473] ([i915#4235])
   [473]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-1/igt@kms_rotation_crc@exhaust-fences.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
    - shard-dg1:          NOTRUN -> [SKIP][474] ([i915#5289])
   [474]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-12/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-tglu-1:       NOTRUN -> [SKIP][475] ([i915#17432] / [i915#5289])
   [475]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
    - shard-glk11:        NOTRUN -> [SKIP][476] ([i915#17488])
   [476]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk11/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-tglu:         NOTRUN -> [SKIP][477] ([i915#17432] / [i915#5289])
   [477]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-9/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
    - shard-glk:          NOTRUN -> [SKIP][478] ([i915#17488]) +2 other tests skip
   [478]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-glk:          NOTRUN -> [SKIP][479] ([i915#17501])
   [479]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk9/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free:
    - shard-dg2:          NOTRUN -> [ABORT][480] ([i915#13179]) +1 other test abort
   [480]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][481] ([i915#12276] / [i915#13356]) +1 other test incomplete
   [481]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk9/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-rkl:          [PASS][482] -> [INCOMPLETE][483] ([i915#12276])
   [482]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-8/igt@kms_vblank@ts-continuation-suspend.html
   [483]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-3/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][484] ([i915#12276])
   [484]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-3/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-2.html

  * igt@kms_vrr@flip-basic:
    - shard-snb:          NOTRUN -> [SKIP][485] ([i915#17520])
   [485]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-snb4/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@flip-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][486] ([i915#15243] / [i915#3555])
   [486]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-8/igt@kms_vrr@flip-dpms.html

  * igt@kms_vrr@flip-suspend:
    - shard-glk:          NOTRUN -> [SKIP][487] ([i915#17520]) +1 other test skip
   [487]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk9/igt@kms_vrr@flip-suspend.html

  * igt@kms_vrr@flipline:
    - shard-glk10:        NOTRUN -> [SKIP][488] ([i915#17520])
   [488]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk10/igt@kms_vrr@flipline.html

  * igt@kms_vrr@lobf:
    - shard-glk11:        NOTRUN -> [SKIP][489] ([i915#17561])
   [489]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk11/igt@kms_vrr@lobf.html

  * igt@kms_vrr@max-min:
    - shard-glk11:        NOTRUN -> [SKIP][490] ([i915#17520])
   [490]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk11/igt@kms_vrr@max-min.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-dg2:          NOTRUN -> [SKIP][491] ([i915#17356])
   [491]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@perf@per-context-mode-unprivileged:
    - shard-glk11:        NOTRUN -> [SKIP][492] ([i915#17704])
   [492]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk11/igt@perf@per-context-mode-unprivileged.html

  * igt@perf@unprivileged-single-ctx-counters:
    - shard-dg1:          NOTRUN -> [SKIP][493] ([i915#17455] / [i915#2433])
   [493]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-12/igt@perf@unprivileged-single-ctx-counters.html

  * igt@perf_pmu@event-wait:
    - shard-glk:          NOTRUN -> [SKIP][494] ([i915#17698]) +1 other test skip
   [494]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk4/igt@perf_pmu@event-wait.html

  * igt@perf_pmu@event-wait@rcs0:
    - shard-tglu:         NOTRUN -> [SKIP][495] ([i915#17416]) +1 other test skip
   [495]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-9/igt@perf_pmu@event-wait@rcs0.html

  * igt@perf_pmu@module-unload:
    - shard-dg1:          NOTRUN -> [FAIL][496] ([i915#17119])
   [496]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-12/igt@perf_pmu@module-unload.html

  * igt@perf_pmu@rc6-suspend:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][497] ([i915#13520])
   [497]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-6/igt@perf_pmu@rc6-suspend.html

  * igt@perf_pmu@rc6@other-idle-gt0:
    - shard-tglu-1:       NOTRUN -> [SKIP][498] ([i915#8516])
   [498]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@perf_pmu@rc6@other-idle-gt0.html

  * igt@prime_mmap_kms@buffer-sharing:
    - shard-dg2:          [PASS][499] -> [SKIP][500] ([i915#17454])
   [499]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-6/igt@prime_mmap_kms@buffer-sharing.html
   [500]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@prime_mmap_kms@buffer-sharing.html

  * igt@prime_udl@share-import:
    - shard-glk:          NOTRUN -> [SKIP][501] ([i915#16420])
   [501]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk4/igt@prime_udl@share-import.html
    - shard-tglu:         NOTRUN -> [SKIP][502] ([i915#16420])
   [502]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-9/igt@prime_udl@share-import.html

  * igt@prime_vgem@basic-fence-flip:
    - shard-dg1:          NOTRUN -> [SKIP][503] ([i915#3708])
   [503]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-16/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@basic-fence-mmap:
    - shard-dg1:          NOTRUN -> [SKIP][504] ([i915#3708] / [i915#4077])
   [504]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-12/igt@prime_vgem@basic-fence-mmap.html

  * igt@prime_vgem@coherency-gtt:
    - shard-tglu:         NOTRUN -> [SKIP][505] ([i915#17429] / [i915#17448])
   [505]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-3/igt@prime_vgem@coherency-gtt.html

  * igt@prime_vgem@fence-write-hang:
    - shard-glk:          NOTRUN -> [SKIP][506] ([i915#17467])
   [506]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk1/igt@prime_vgem@fence-write-hang.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-dg2:          NOTRUN -> [SKIP][507] ([i915#4818])
   [507]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-1/igt@tools_test@sysfs_l3_parity.html

  
#### Possible fixes ####

  * igt@fbdev@unaligned-read:
    - shard-dg2:          [SKIP][508] ([i915#2582]) -> [PASS][509]
   [508]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@fbdev@unaligned-read.html
   [509]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-6/igt@fbdev@unaligned-read.html

  * igt@gem_eio@in-flight-contexts-immediate:
    - shard-snb:          [INCOMPLETE][510] -> [PASS][511]
   [510]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-snb5/igt@gem_eio@in-flight-contexts-immediate.html
   [511]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-snb4/igt@gem_eio@in-flight-contexts-immediate.html

  * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
    - shard-rkl:          [ABORT][512] ([i915#15131]) -> [PASS][513]
   [512]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-1/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html
   [513]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-6/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html

  * igt@i915_power@sanity:
    - shard-mtlp:         [SKIP][514] ([i915#7984]) -> [PASS][515]
   [514]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-mtlp-5/igt@i915_power@sanity.html
   [515]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-mtlp-7/igt@i915_power@sanity.html

  * igt@i915_suspend@sysfs-reader:
    - shard-rkl:          [INCOMPLETE][516] ([i915#4817]) -> [PASS][517]
   [516]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-4/igt@i915_suspend@sysfs-reader.html
   [517]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-8/igt@i915_suspend@sysfs-reader.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-mtlp:         [FAIL][518] ([i915#15733] / [i915#5138]) -> [PASS][519]
   [518]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [519]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-mtlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1:
    - shard-glk:          [INCOMPLETE][520] ([i915#13356] / [i915#15582]) -> [PASS][521]
   [520]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-glk8/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1.html
   [521]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk2/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d:
    - shard-dg2:          [SKIP][522] ([i915#15529]) -> [PASS][523] +3 other tests pass
   [522]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d.html
   [523]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-8/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d.html

  * igt@kms_cursor_edge_walk@256x256-top-edge:
    - shard-dg2:          [SKIP][524] ([i915#17356]) -> [PASS][525] +53 other tests pass
   [524]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_cursor_edge_walk@256x256-top-edge.html
   [525]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-6/igt@kms_cursor_edge_walk@256x256-top-edge.html

  * igt@kms_fb_coherency@memset-crc:
    - shard-dg2:          [SKIP][526] ([i915#17454]) -> [PASS][527]
   [526]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_fb_coherency@memset-crc.html
   [527]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-6/igt@kms_fb_coherency@memset-crc.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-dg2:          [SKIP][528] ([i915#1849]) -> [PASS][529] +1 other test pass
   [528]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_fbcon_fbt@fbc-suspend.html
   [529]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-6/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@flip-vs-panning:
    - shard-dg2:          [SKIP][530] ([i915#5354]) -> [PASS][531] +6 other tests pass
   [530]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_flip@flip-vs-panning.html
   [531]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-6/igt@kms_flip@flip-vs-panning.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-dg2:          [SKIP][532] ([i915#3555] / [i915#8813]) -> [PASS][533] +4 other tests pass
   [532]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
   [533]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-cpu:
    - shard-dg2:          [SKIP][534] ([i915#16708]) -> [PASS][535] +1 other test pass
   [534]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-cpu.html
   [535]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:
    - shard-dg2:          [SKIP][536] ([i915#16708] / [i915#5354]) -> [PASS][537] +1 other test pass
   [536]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html
   [537]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-render:
    - shard-glk:          [SKIP][538] ([i915#17517]) -> [PASS][539] +11 other tests pass
   [538]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-glk5/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-render.html
   [539]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk8/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_hdmi_audio_bw@dpms-audio-recovery:
    - shard-dg2:          [SKIP][540] ([i915#17357]) -> [PASS][541]
   [540]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_hdmi_audio_bw@dpms-audio-recovery.html
   [541]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-8/igt@kms_hdmi_audio_bw@dpms-audio-recovery.html

  * igt@kms_invalid_mode@overflow-vrefresh:
    - shard-dg2:          [SKIP][542] ([i915#16746]) -> [PASS][543]
   [542]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_invalid_mode@overflow-vrefresh.html
   [543]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-6/igt@kms_invalid_mode@overflow-vrefresh.html

  * igt@kms_invalid_mode@zero-vdisplay:
    - shard-dg2:          [SKIP][544] ([i915#16746] / [i915#3555]) -> [PASS][545] +1 other test pass
   [544]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_invalid_mode@zero-vdisplay.html
   [545]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-8/igt@kms_invalid_mode@zero-vdisplay.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence:
    - shard-dg2:          [SKIP][546] ([i915#11190] / [i915#17356]) -> [PASS][547] +3 other tests pass
   [546]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html
   [547]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-6/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-glk:          [DMESG-WARN][548] ([i915#118]) -> [PASS][549]
   [548]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-glk9/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
   [549]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk3/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane@pixel-format-4-tiled-modifier:
    - shard-dg2:          [SKIP][550] ([i915#8825]) -> [PASS][551] +2 other tests pass
   [550]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_plane@pixel-format-4-tiled-modifier.html
   [551]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-6/igt@kms_plane@pixel-format-4-tiled-modifier.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:
    - shard-rkl:          [ABORT][552] ([i915#15132]) -> [PASS][553] +1 other test pass
   [552]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-1/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html
   [553]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-7/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers@pipe-b:
    - shard-dg2:          [SKIP][554] ([i915#15329]) -> [PASS][555] +23 other tests pass
   [554]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers@pipe-b.html
   [555]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers@pipe-b.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers@pipe-d:
    - shard-dg2:          [SKIP][556] ([i915#15329] / [i915#17356]) -> [PASS][557] +7 other tests pass
   [556]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers@pipe-d.html
   [557]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-1/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75:
    - shard-dg2:          [SKIP][558] ([i915#15329] / [i915#17356] / [i915#3555] / [i915#6953] / [i915#9423]) -> [PASS][559]
   [558]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_plane_scaling@planes-downscale-factor-0-75.html
   [559]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-6/igt@kms_plane_scaling@planes-downscale-factor-0-75.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20:
    - shard-dg2:          [SKIP][560] ([i915#15329] / [i915#17356] / [i915#9423]) -> [PASS][561] +3 other tests pass
   [560]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20.html
   [561]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-6/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20.html

  * igt@kms_plane_scaling@planes-scaler-unity-scaling:
    - shard-dg2:          [SKIP][562] ([i915#15329] / [i915#17356] / [i915#3555] / [i915#9423]) -> [PASS][563] +2 other tests pass
   [562]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_plane_scaling@planes-scaler-unity-scaling.html
   [563]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-8/igt@kms_plane_scaling@planes-scaler-unity-scaling.html

  * igt@kms_pm_dc@dc5-dpms-negative:
    - shard-dg2:          [SKIP][564] ([i915#13441]) -> [PASS][565]
   [564]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_pm_dc@dc5-dpms-negative.html
   [565]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-8/igt@kms_pm_dc@dc5-dpms-negative.html

  * igt@kms_pm_rpm@i2c:
    - shard-dg1:          [DMESG-WARN][566] ([i915#4423]) -> [PASS][567]
   [566]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg1-19/igt@kms_pm_rpm@i2c.html
   [567]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-15/igt@kms_pm_rpm@i2c.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-dg2:          [SKIP][568] ([i915#15073]) -> [PASS][569] +1 other test pass
   [568]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [569]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-6/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
    - shard-dg1:          [SKIP][570] ([i915#15073]) -> [PASS][571]
   [570]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg1-15/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [571]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-12/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_pm_rpm@system-suspend-idle:
    - shard-dg2:          [INCOMPLETE][572] ([i915#14419]) -> [PASS][573]
   [572]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-3/igt@kms_pm_rpm@system-suspend-idle.html
   [573]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-1/igt@kms_pm_rpm@system-suspend-idle.html

  * igt@perf_pmu@render-node-busy:
    - shard-rkl:          [FAIL][574] ([i915#4349]) -> [PASS][575] +2 other tests pass
   [574]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-5/igt@perf_pmu@render-node-busy.html
   [575]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-2/igt@perf_pmu@render-node-busy.html

  * igt@perf_pmu@semaphore-busy@vcs1:
    - shard-mtlp:         [FAIL][576] ([i915#4349]) -> [PASS][577] +6 other tests pass
   [576]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-mtlp-2/igt@perf_pmu@semaphore-busy@vcs1.html
   [577]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-mtlp-8/igt@perf_pmu@semaphore-busy@vcs1.html

  
#### Warnings ####

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-rkl:          [SKIP][578] ([i915#14544] / [i915#4525]) -> [SKIP][579] ([i915#4525])
   [578]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-6/igt@gem_exec_balancer@parallel-ordering.html
   [579]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-1/igt@gem_exec_balancer@parallel-ordering.html

  * igt@gem_exec_params@rsvd2-dirt:
    - shard-rkl:          [SKIP][580] ([i915#17453]) -> [SKIP][581] ([i915#14544] / [i915#17453])
   [580]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-1/igt@gem_exec_params@rsvd2-dirt.html
   [581]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-6/igt@gem_exec_params@rsvd2-dirt.html

  * igt@gem_exec_reloc@basic-gtt-cpu:
    - shard-rkl:          [SKIP][582] ([i915#3281]) -> [SKIP][583] ([i915#14544] / [i915#3281]) +2 other tests skip
   [582]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-1/igt@gem_exec_reloc@basic-gtt-cpu.html
   [583]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-cpu.html

  * igt@gem_exec_reloc@basic-write-read:
    - shard-rkl:          [SKIP][584] ([i915#14544] / [i915#3281]) -> [SKIP][585] ([i915#3281]) +2 other tests skip
   [584]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-6/igt@gem_exec_reloc@basic-write-read.html
   [585]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-1/igt@gem_exec_reloc@basic-write-read.html

  * igt@gem_lmem_swapping@heavy-verify-random-ccs:
    - shard-rkl:          [SKIP][586] ([i915#14544] / [i915#4613]) -> [SKIP][587] ([i915#4613])
   [586]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-6/igt@gem_lmem_swapping@heavy-verify-random-ccs.html
   [587]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-1/igt@gem_lmem_swapping@heavy-verify-random-ccs.html

  * igt@gem_lmem_swapping@parallel-random:
    - shard-rkl:          [SKIP][588] ([i915#4613]) -> [SKIP][589] ([i915#14544] / [i915#4613]) +1 other test skip
   [588]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-5/igt@gem_lmem_swapping@parallel-random.html
   [589]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-6/igt@gem_lmem_swapping@parallel-random.html

  * igt@gem_partial_pwrite_pread@write-snoop:
    - shard-rkl:          [SKIP][590] ([i915#14544] / [i915#3282]) -> [SKIP][591] ([i915#3282])
   [590]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-6/igt@gem_partial_pwrite_pread@write-snoop.html
   [591]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-4/igt@gem_partial_pwrite_pread@write-snoop.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-rkl:          [SKIP][592] ([i915#14544] / [i915#17430]) -> [SKIP][593] ([i915#17430])
   [592]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-6/igt@gem_softpin@evict-snoop-interruptible.html
   [593]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-4/igt@gem_softpin@evict-snoop-interruptible.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-rkl:          [SKIP][594] ([i915#14544] / [i915#3297] / [i915#3323]) -> [SKIP][595] ([i915#3297] / [i915#3323])
   [594]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-6/igt@gem_userptr_blits@dmabuf-sync.html
   [595]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-1/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gen7_exec_parse@bitmasks:
    - shard-rkl:          [SKIP][596] ([i915#17455]) -> [SKIP][597] ([i915#14544] / [i915#17455])
   [596]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-1/igt@gen7_exec_parse@bitmasks.html
   [597]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-6/igt@gen7_exec_parse@bitmasks.html

  * igt@gen9_exec_parse@secure-batches:
    - shard-rkl:          [SKIP][598] ([i915#2527]) -> [SKIP][599] ([i915#14544] / [i915#2527])
   [598]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-1/igt@gen9_exec_parse@secure-batches.html
   [599]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-6/igt@gen9_exec_parse@secure-batches.html

  * igt@i915_module_load@fault-injection@__uc_init:
    - shard-rkl:          [SKIP][600] ([i915#14544] / [i915#15479]) -> [SKIP][601] ([i915#15479]) +4 other tests skip
   [600]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-6/igt@i915_module_load@fault-injection@__uc_init.html
   [601]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-3/igt@i915_module_load@fault-injection@__uc_init.html

  * igt@i915_pm_freq_api@freq-suspend:
    - shard-rkl:          [SKIP][602] ([i915#8399]) -> [SKIP][603] ([i915#14544] / [i915#8399])
   [602]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-1/igt@i915_pm_freq_api@freq-suspend.html
   [603]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-6/igt@i915_pm_freq_api@freq-suspend.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-dg2:          [SKIP][604] ([i915#17356]) -> [SKIP][605] ([i915#1769] / [i915#3555])
   [604]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
   [605]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-8/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-0:
    - shard-rkl:          [SKIP][606] ([i915#4538] / [i915#5286]) -> [SKIP][607] ([i915#14544] / [i915#4538] / [i915#5286])
   [606]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-1/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html
   [607]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-6/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg2:          [SKIP][608] ([i915#3828]) -> [SKIP][609] ([i915#17356])
   [608]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-1/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html
   [609]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-dg2:          [SKIP][610] ([i915#17356]) -> [SKIP][611] ([i915#17431]) +5 other tests skip
   [610]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
   [611]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-6/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-dg2:          [SKIP][612] ([i915#17431]) -> [SKIP][613] ([i915#17356]) +4 other tests skip
   [612]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-5/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
   [613]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
    - shard-rkl:          [SKIP][614] ([i915#14544] / [i915#17431] / [i915#3638]) -> [SKIP][615] ([i915#17431] / [i915#3638])
   [614]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-6/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html
   [615]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-4/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2:          [SKIP][616] ([i915#5190]) -> [SKIP][617] ([i915#17356] / [i915#5190]) +2 other tests skip
   [616]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-8/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [617]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2:          [SKIP][618] ([i915#4538] / [i915#5190]) -> [SKIP][619] ([i915#17356] / [i915#5190]) +11 other tests skip
   [618]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-5/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [619]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
    - shard-rkl:          [SKIP][620] ([i915#14544] / [i915#4538]) -> [SKIP][621] ([i915#4538])
   [620]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-6/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html
   [621]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-1/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
    - shard-dg2:          [SKIP][622] ([i915#17356] / [i915#5190]) -> [SKIP][623] ([i915#4538] / [i915#5190]) +9 other tests skip
   [622]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html
   [623]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-6/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs:
    - shard-dg2:          [SKIP][624] ([i915#17356]) -> [SKIP][625] ([i915#10307] / [i915#6095]) +13 other tests skip
   [624]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html
   [625]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-6/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs:
    - shard-dg2:          [SKIP][626] ([i915#10307] / [i915#6095]) -> [SKIP][627] ([i915#17356]) +15 other tests skip
   [626]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-8/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html
   [627]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          [SKIP][628] ([i915#14544] / [i915#6095]) -> [SKIP][629] ([i915#6095]) +7 other tests skip
   [628]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-2.html
   [629]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-1/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-c-hdmi-a-2:
    - shard-rkl:          [SKIP][630] ([i915#14098] / [i915#14544] / [i915#6095]) -> [SKIP][631] ([i915#14098] / [i915#6095]) +7 other tests skip
   [630]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-6/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-c-hdmi-a-2.html
   [631]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-4/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-dg2:          [SKIP][632] ([i915#12313]) -> [SKIP][633] ([i915#17356]) +2 other tests skip
   [632]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-8/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
   [633]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-dg2:          [SKIP][634] ([i915#17356]) -> [SKIP][635] ([i915#12313]) +1 other test skip
   [634]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
   [635]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-1/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-rkl:          [SKIP][636] ([i915#12805] / [i915#14544]) -> [SKIP][637] ([i915#12805])
   [636]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
   [637]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-1/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-b-edp-1:
    - shard-mtlp:         [FAIL][638] ([i915#17158]) -> [INCOMPLETE][639] ([i915#15582])
   [638]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-mtlp-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-b-edp-1.html
   [639]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-mtlp-8/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-b-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
    - shard-dg2:          [SKIP][640] ([i915#17356]) -> [SKIP][641] ([i915#6095]) +1 other test skip
   [640]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html
   [641]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-8/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-2:
    - shard-rkl:          [SKIP][642] ([i915#6095]) -> [SKIP][643] ([i915#14544] / [i915#6095]) +7 other tests skip
   [642]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-1/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-2.html
   [643]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2:
    - shard-rkl:          [SKIP][644] ([i915#14098] / [i915#6095]) -> [SKIP][645] ([i915#14098] / [i915#14544] / [i915#6095]) +7 other tests skip
   [644]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-1/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2.html
   [645]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_cdclk@plane-scaling:
    - shard-dg2:          [SKIP][646] ([i915#17356]) -> [SKIP][647] ([i915#13781])
   [646]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_cdclk@plane-scaling.html
   [647]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-6/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-rkl:          [SKIP][648] ([i915#17427]) -> [SKIP][649] ([i915#14544] / [i915#17427]) +1 other test skip
   [648]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-1/igt@kms_chamelium_color@ctm-green-to-red.html
   [649]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-6/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_color_pipeline@plane-lut3d-green-only:
    - shard-rkl:          [SKIP][650] ([i915#14544] / [i915#16471] / [i915#17427]) -> [SKIP][651] ([i915#16471] / [i915#17427])
   [650]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-6/igt@kms_chamelium_color_pipeline@plane-lut3d-green-only.html
   [651]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-4/igt@kms_chamelium_color_pipeline@plane-lut3d-green-only.html

  * igt@kms_chamelium_edid@hdmi-mode-timings:
    - shard-rkl:          [SKIP][652] ([i915#11151] / [i915#14544] / [i915#7828]) -> [SKIP][653] ([i915#11151] / [i915#7828]) +1 other test skip
   [652]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-6/igt@kms_chamelium_edid@hdmi-mode-timings.html
   [653]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-1/igt@kms_chamelium_edid@hdmi-mode-timings.html

  * igt@kms_chamelium_frames@hdmi-crc-single:
    - shard-rkl:          [SKIP][654] ([i915#11151] / [i915#7828]) -> [SKIP][655] ([i915#11151] / [i915#14544] / [i915#7828]) +1 other test skip
   [654]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-3/igt@kms_chamelium_frames@hdmi-crc-single.html
   [655]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-6/igt@kms_chamelium_frames@hdmi-crc-single.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-rkl:          [SKIP][656] ([i915#15865]) -> [SKIP][657] ([i915#14544] / [i915#15865]) +1 other test skip
   [656]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-3/igt@kms_content_protection@atomic-dpms.html
   [657]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-6/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2:          [SKIP][658] ([i915#15330] / [i915#3299]) -> [SKIP][659] ([i915#17356])
   [658]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-8/igt@kms_content_protection@dp-mst-lic-type-0.html
   [659]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-dg2:          [SKIP][660] ([i915#17356]) -> [SKIP][661] ([i915#15330] / [i915#3299])
   [660]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_content_protection@dp-mst-type-1.html
   [661]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-6/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@mei-interface:
    - shard-dg2:          [SKIP][662] ([i915#15865]) -> [SKIP][663] ([i915#17356]) +5 other tests skip
   [662]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-6/igt@kms_content_protection@mei-interface.html
   [663]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@srm:
    - shard-dg2:          [SKIP][664] ([i915#17356]) -> [SKIP][665] ([i915#15865]) +3 other tests skip
   [664]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_content_protection@srm.html
   [665]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-6/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent-hdcp14:
    - shard-rkl:          [SKIP][666] ([i915#14544] / [i915#15865]) -> [SKIP][667] ([i915#15865]) +2 other tests skip
   [666]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-6/igt@kms_content_protection@uevent-hdcp14.html
   [667]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-1/igt@kms_content_protection@uevent-hdcp14.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-dg2:          [SKIP][668] ([i915#3555]) -> [SKIP][669] ([i915#17356]) +2 other tests skip
   [668]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-1/igt@kms_cursor_crc@cursor-offscreen-32x32.html
   [669]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-rkl:          [SKIP][670] ([i915#13049]) -> [SKIP][671] ([i915#13049] / [i915#14544])
   [670]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-1/igt@kms_cursor_crc@cursor-offscreen-512x170.html
   [671]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-6/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2:          [SKIP][672] ([i915#17356]) -> [SKIP][673] ([i915#13049]) +1 other test skip
   [672]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [673]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-6/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-dg2:          [SKIP][674] ([i915#13049]) -> [SKIP][675] ([i915#17356]) +4 other tests skip
   [674]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-8/igt@kms_cursor_crc@cursor-random-512x170.html
   [675]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-random-max-size:
    - shard-rkl:          [SKIP][676] ([i915#14544] / [i915#3555]) -> [SKIP][677] ([i915#3555])
   [676]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-6/igt@kms_cursor_crc@cursor-random-max-size.html
   [677]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-1/igt@kms_cursor_crc@cursor-random-max-size.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
    - shard-dg2:          [SKIP][678] ([i915#17356]) -> [SKIP][679] ([i915#3555]) +3 other tests skip
   [678]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html
   [679]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-6/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-dg2:          [SKIP][680] ([i915#13046] / [i915#17454] / [i915#5354]) -> [SKIP][681] ([i915#17356]) +5 other tests skip
   [680]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-5/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [681]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-dg2:          [SKIP][682] ([i915#4103]) -> [SKIP][683] ([i915#11190] / [i915#17356])
   [682]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [683]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-rkl:          [SKIP][684] ([i915#14544] / [i915#17428]) -> [SKIP][685] ([i915#17428]) +16 other tests skip
   [684]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [685]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-3/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-dg2:          [SKIP][686] ([i915#17356]) -> [SKIP][687] ([i915#13046] / [i915#17454] / [i915#5354]) +4 other tests skip
   [686]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [687]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-6/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
    - shard-dg2:          [SKIP][688] ([i915#17356]) -> [SKIP][689] ([i915#9067])
   [688]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
   [689]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-6/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-dg2:          [SKIP][690] ([i915#4103]) -> [SKIP][691] ([i915#17356])
   [690]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
   [691]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-dg2:          [SKIP][692] ([i915#17356]) -> [SKIP][693] ([i915#4103])
   [692]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [693]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-dg2:          [SKIP][694] ([i915#17356]) -> [SKIP][695] ([i915#9833])
   [694]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
   [695]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-8/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-rkl:          [SKIP][696] ([i915#14544] / [i915#3555] / [i915#3804]) -> [SKIP][697] ([i915#3555] / [i915#3804])
   [696]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [697]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
    - shard-rkl:          [SKIP][698] ([i915#14544] / [i915#3804]) -> [SKIP][699] ([i915#3804])
   [698]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html
   [699]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-dg2:          [SKIP][700] ([i915#17289]) -> [SKIP][701] ([i915#17356])
   [700]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-8/igt@kms_dp_link_training@non-uhbr-mst.html
   [701]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_link_training@non-uhbr-mst-direct-train:
    - shard-dg2:          [SKIP][702] ([i915#17356]) -> [SKIP][703] ([i915#17287])
   [702]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_dp_link_training@non-uhbr-mst-direct-train.html
   [703]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-6/igt@kms_dp_link_training@non-uhbr-mst-direct-train.html

  * igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train:
    - shard-dg2:          [SKIP][704] ([i915#17356]) -> [SKIP][705] ([i915#17290])
   [704]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train.html
   [705]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-1/igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train.html

  * igt@kms_dp_link_training@uhbr-mst-tbtalt-train:
    - shard-dg2:          [SKIP][706] ([i915#17285]) -> [SKIP][707] ([i915#17356])
   [706]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-5/igt@kms_dp_link_training@uhbr-mst-tbtalt-train.html
   [707]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_dp_link_training@uhbr-mst-tbtalt-train.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-dg2:          [SKIP][708] ([i915#13748]) -> [SKIP][709] ([i915#17356])
   [708]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-6/igt@kms_dp_link_training@uhbr-sst.html
   [709]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dp_link_training@uhbr-sst-tbtalt-train:
    - shard-dg2:          [SKIP][710] ([i915#17356]) -> [SKIP][711] ([i915#17285]) +1 other test skip
   [710]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_dp_link_training@uhbr-sst-tbtalt-train.html
   [711]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-6/igt@kms_dp_link_training@uhbr-sst-tbtalt-train.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-dg2:          [SKIP][712] ([i915#13707]) -> [SKIP][713] ([i915#17356])
   [712]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-1/igt@kms_dp_linktrain_fallback@dsc-fallback.html
   [713]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - shard-rkl:          [SKIP][714] ([i915#13707]) -> [SKIP][715] ([i915#13707] / [i915#14544])
   [714]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-3/igt@kms_dp_linktrain_fallback@dsc-fallback.html
   [715]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-6/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_draw_crc@draw-method-mmap-wc:
    - shard-dg2:          [SKIP][716] ([i915#17356]) -> [SKIP][717] ([i915#8812])
   [716]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_draw_crc@draw-method-mmap-wc.html
   [717]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-8/igt@kms_draw_crc@draw-method-mmap-wc.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-dg2:          [SKIP][718] ([i915#16361]) -> [SKIP][719] ([i915#17356]) +4 other tests skip
   [718]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-8/igt@kms_dsc@dsc-fractional-bpp.html
   [719]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_dsc@dsc-fractional-bpp.html
    - shard-rkl:          [SKIP][720] ([i915#16361]) -> [SKIP][721] ([i915#14544] / [i915#16361])
   [720]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-1/igt@kms_dsc@dsc-fractional-bpp.html
   [721]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-6/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-dg2:          [SKIP][722] ([i915#17356]) -> [SKIP][723] ([i915#16361]) +3 other tests skip
   [722]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_dsc@dsc-with-bpc.html
   [723]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-1/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-rkl:          [SKIP][724] ([i915#14544] / [i915#16361]) -> [SKIP][725] ([i915#16361])
   [724]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-6/igt@kms_dsc@dsc-with-formats.html
   [725]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-4/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_feature_discovery@chamelium:
    - shard-rkl:          [SKIP][726] ([i915#16084]) -> [SKIP][727] ([i915#14544] / [i915#16084])
   [726]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-3/igt@kms_feature_discovery@chamelium.html
   [727]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-6/igt@kms_feature_discovery@chamelium.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible:
    - shard-rkl:          [SKIP][728] ([i915#9934]) -> [SKIP][729] ([i915#14544] / [i915#9934])
   [728]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-1/igt@kms_flip@2x-flip-vs-panning-interruptible.html
   [729]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-6/igt@kms_flip@2x-flip-vs-panning-interruptible.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-rkl:          [SKIP][730] ([i915#14544] / [i915#9934]) -> [SKIP][731] ([i915#9934]) +1 other test skip
   [730]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-6/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [731]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-4/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@bo-too-big:
    - shard-mtlp:         [ABORT][732] ([i915#13562] / [i915#17146]) -> [INCOMPLETE][733] ([i915#13562] / [i915#16472])
   [732]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-mtlp-8/igt@kms_flip@bo-too-big.html
   [733]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-mtlp-5/igt@kms_flip@bo-too-big.html

  * igt@kms_flip@bo-too-big@a-edp1:
    - shard-mtlp:         [DMESG-WARN][734] ([i915#13562]) -> [INCOMPLETE][735] ([i915#13562] / [i915#16472])
   [734]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-mtlp-8/igt@kms_flip@bo-too-big@a-edp1.html
   [735]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-mtlp-5/igt@kms_flip@bo-too-big@a-edp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-gtt:
    - shard-dg2:          [SKIP][736] ([i915#15104] / [i915#15990]) -> [SKIP][737] ([i915#16708])
   [736]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-gtt.html
   [737]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
    - shard-dg2:          [SKIP][738] ([i915#16708] / [i915#5354]) -> [SKIP][739] ([i915#15991] / [i915#5354]) +31 other tests skip
   [738]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html
   [739]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-dg2:          [SKIP][740] ([i915#15990] / [i915#8708]) -> [SKIP][741] ([i915#16708] / [i915#5354]) +19 other tests skip
   [740]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html
   [741]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:
    - shard-dg2:          [SKIP][742] ([i915#15991] / [i915#5354]) -> [SKIP][743] ([i915#16708] / [i915#5354]) +37 other tests skip
   [742]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html
   [743]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - shard-rkl:          [SKIP][744] ([i915#14544] / [i915#17428] / [i915#1825]) -> [SKIP][745] ([i915#17428] / [i915#1825])
   [744]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html
   [745]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-indfb-pgflip-blt:
    - shard-rkl:          [SKIP][746] ([i915#17428]) -> [SKIP][747] ([i915#14544] / [i915#17428]) +20 other tests skip
   [746]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-1/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-indfb-pgflip-blt.html
   [747]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite:
    - shard-dg2:          [SKIP][748] ([i915#15102]) -> [SKIP][749] ([i915#16708] / [i915#5354]) +18 other tests skip
   [748]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite.html
   [749]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2:          [SKIP][750] ([i915#16708] / [i915#5354]) -> [SKIP][751] ([i915#15990] / [i915#8708]) +12 other tests skip
   [750]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [751]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-mmap-cpu:
    - shard-dg2:          [SKIP][752] ([i915#15102]) -> [SKIP][753] ([i915#16708]) +24 other tests skip
   [752]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-mmap-cpu.html
   [753]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-mmap-gtt:
    - shard-dg2:          [SKIP][754] ([i915#16708]) -> [SKIP][755] ([i915#15990]) +20 other tests skip
   [754]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-mmap-gtt.html
   [755]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-shrfb-fliptrack-mmap-gtt:
    - shard-dg2:          [SKIP][756] ([i915#15990]) -> [SKIP][757] ([i915#16708]) +26 other tests skip
   [756]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-shrfb-fliptrack-mmap-gtt.html
   [757]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-shrfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-render:
    - shard-dg2:          [SKIP][758] ([i915#16708]) -> [SKIP][759] ([i915#15102]) +19 other tests skip
   [758]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-render.html
   [759]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4:
    - shard-rkl:          [SKIP][760] ([i915#5439]) -> [SKIP][761] ([i915#14544] / [i915#5439])
   [760]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4.html
   [761]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4.html

  * igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-pwrite:
    - shard-dg2:          [SKIP][762] ([i915#15989]) -> [SKIP][763] ([i915#16708]) +28 other tests skip
   [762]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-5/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-pwrite.html
   [763]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-dg2:          [SKIP][764] ([i915#16708]) -> [SKIP][765] ([i915#15989]) +19 other tests skip
   [764]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html
   [765]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-6/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-fullscreen:
    - shard-dg2:          [SKIP][766] ([i915#16708]) -> [SKIP][767] ([i915#15991]) +45 other tests skip
   [766]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-fullscreen.html
   [767]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-6/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@hdr-suspend:
    - shard-rkl:          [SKIP][768] ([i915#15989]) -> [INCOMPLETE][769] ([i915#16056])
   [768]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-3/igt@kms_frontbuffer_tracking@hdr-suspend.html
   [769]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-suspend.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-dg2:          [SKIP][770] ([i915#9766]) -> [SKIP][771] ([i915#16708] / [i915#4342] / [i915#5354])
   [770]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-8/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
   [771]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc:
    - shard-dg2:          [SKIP][772] ([i915#16708]) -> [SKIP][773] ([i915#15104] / [i915#15990]) +3 other tests skip
   [772]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc.html
   [773]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:
    - shard-dg2:          [SKIP][774] ([i915#16708] / [i915#5354]) -> [SKIP][775] ([i915#15102]) +14 other tests skip
   [774]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html
   [775]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:
    - shard-rkl:          [SKIP][776] ([i915#15102]) -> [SKIP][777] ([i915#14544] / [i915#15102]) +11 other tests skip
   [776]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html
   [777]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-pwrite:
    - shard-dg1:          [SKIP][778] ([i915#17428]) -> [SKIP][779] ([i915#17428] / [i915#4423])
   [778]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg1-12/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-pwrite.html
   [779]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-rkl:          [SKIP][780] ([i915#17428] / [i915#1825]) -> [SKIP][781] ([i915#14544] / [i915#17428] / [i915#1825]) +2 other tests skip
   [780]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-gtt.html
   [781]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-cur-indfb-draw-render:
    - shard-rkl:          [SKIP][782] ([i915#14544] / [i915#15102]) -> [SKIP][783] ([i915#15102]) +2 other tests skip
   [782]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-6/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-cur-indfb-draw-render.html
   [783]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-4/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-pri-indfb-multidraw:
    - shard-dg2:          [SKIP][784] ([i915#15991]) -> [SKIP][785] ([i915#16708]) +48 other tests skip
   [784]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-5/igt@kms_frontbuffer_tracking@psrhdr-2p-pri-indfb-multidraw.html
   [785]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_frontbuffer_tracking@psrhdr-2p-pri-indfb-multidraw.html

  * igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery:
    - shard-dg2:          [ABORT][786] ([i915#15132]) -> [SKIP][787] ([i915#17357])
   [786]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-5/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html
   [787]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-dg2:          [SKIP][788] ([i915#12713] / [i915#16518]) -> [SKIP][789] ([i915#17356])
   [788]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-6/igt@kms_hdr@brightness-with-hdr.html
   [789]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-rkl:          [SKIP][790] ([i915#14544] / [i915#15459]) -> [SKIP][791] ([i915#15459])
   [790]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [791]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-4/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-rkl:          [SKIP][792] ([i915#14544] / [i915#15458]) -> [SKIP][793] ([i915#15458])
   [792]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-6/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [793]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-rkl:          [SKIP][794] ([i915#15815]) -> [SKIP][795] ([i915#14544] / [i915#15815])
   [794]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-3/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [795]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-dg2:          [SKIP][796] ([i915#17356]) -> [SKIP][797] ([i915#13705])
   [796]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
   [797]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-6/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane@pixel-format-yf-tiled-modifier:
    - shard-rkl:          [SKIP][798] ([i915#15709]) -> [SKIP][799] ([i915#14544] / [i915#15709])
   [798]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-3/igt@kms_plane@pixel-format-yf-tiled-modifier.html
   [799]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-6/igt@kms_plane@pixel-format-yf-tiled-modifier.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-dg2:          [SKIP][800] ([i915#8821]) -> [SKIP][801] ([i915#17356])
   [800]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-1/igt@kms_plane_lowres@tiling-y.html
   [801]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-dg2:          [SKIP][802] ([i915#17356]) -> [SKIP][803] ([i915#3555] / [i915#8821])
   [802]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_plane_lowres@tiling-yf.html
   [803]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-6/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-dg2:          [SKIP][804] ([i915#13958]) -> [SKIP][805] ([i915#17356])
   [804]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-8/igt@kms_plane_multiple@2x-tiling-none.html
   [805]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2:          [SKIP][806] ([i915#6953] / [i915#9423]) -> [SKIP][807] ([i915#17356] / [i915#6953] / [i915#9423])
   [806]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-5/igt@kms_plane_scaling@intel-max-src-size.html
   [807]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_pm_dc@dc5-dpms-suspend-resume:
    - shard-rkl:          [INCOMPLETE][808] ([i915#16943]) -> [ABORT][809] ([i915#15132])
   [808]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-6/igt@kms_pm_dc@dc5-dpms-suspend-resume.html
   [809]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-1/igt@kms_pm_dc@dc5-dpms-suspend-resume.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-rkl:          [SKIP][810] ([i915#9340]) -> [SKIP][811] ([i915#3828])
   [810]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-4/igt@kms_pm_lpsp@kms-lpsp.html
   [811]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-8/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_prime@d3hot:
    - shard-dg1:          [SKIP][812] ([i915#6524]) -> [SKIP][813] ([i915#4423] / [i915#6524])
   [812]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg1-18/igt@kms_prime@d3hot.html
   [813]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-18/igt@kms_prime@d3hot.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - shard-rkl:          [SKIP][814] ([i915#11520]) -> [SKIP][815] ([i915#11520] / [i915#14544]) +1 other test skip
   [814]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-1/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html
   [815]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:
    - shard-rkl:          [SKIP][816] ([i915#11520] / [i915#14544]) -> [SKIP][817] ([i915#11520]) +1 other test skip
   [816]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-6/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html
   [817]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-4/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-rkl:          [SKIP][818] ([i915#14544] / [i915#9683]) -> [SKIP][819] ([i915#9683])
   [818]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-6/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [819]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-4/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@fbc-pr-sprite-plane-onoff:
    - shard-rkl:          [SKIP][820] ([i915#1072] / [i915#9732]) -> [SKIP][821] ([i915#1072] / [i915#14544] / [i915#9732]) +8 other tests skip
   [820]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-3/igt@kms_psr@fbc-pr-sprite-plane-onoff.html
   [821]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-6/igt@kms_psr@fbc-pr-sprite-plane-onoff.html

  * igt@kms_psr@psr2-cursor-plane-move:
    - shard-rkl:          [SKIP][822] ([i915#1072] / [i915#14544] / [i915#9732]) -> [SKIP][823] ([i915#1072] / [i915#9732]) +4 other tests skip
   [822]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-6/igt@kms_psr@psr2-cursor-plane-move.html
   [823]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-4/igt@kms_psr@psr2-cursor-plane-move.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-dg2:          [SKIP][824] ([i915#12755] / [i915#15867]) -> [SKIP][825] ([i915#17356])
   [824]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-6/igt@kms_rotation_crc@bad-tiling.html
   [825]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-dg2:          [SKIP][826] ([i915#17356]) -> [SKIP][827] ([i915#12755] / [i915#15867]) +1 other test skip
   [826]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_rotation_crc@primary-rotation-270.html
   [827]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-6/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-dg2:          [SKIP][828] ([i915#17356] / [i915#5190]) -> [SKIP][829] ([i915#5190])
   [828]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [829]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2:          [SKIP][830] ([i915#12755] / [i915#15867] / [i915#5190]) -> [SKIP][831] ([i915#17356] / [i915#5190])
   [830]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
   [831]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-rkl:          [SKIP][832] ([i915#14544] / [i915#8623]) -> [SKIP][833] ([i915#8623])
   [832]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [833]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-dg2:          [SKIP][834] ([i915#17356]) -> [SKIP][835] ([i915#9906])
   [834]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_vrr@flip-basic-fastset.html
   [835]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-6/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@flipline:
    - shard-dg2:          [SKIP][836] ([i915#15243] / [i915#3555]) -> [SKIP][837] ([i915#17356])
   [836]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-8/igt@kms_vrr@flipline.html
   [837]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_vrr@flipline.html
    - shard-rkl:          [SKIP][838] ([i915#15243] / [i915#3555]) -> [SKIP][839] ([i915#14544] / [i915#15243] / [i915#3555])
   [838]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-1/igt@kms_vrr@flipline.html
   [839]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-6/igt@kms_vrr@flipline.html

  * igt@kms_vrr@negative-basic:
    - shard-dg2:          [SKIP][840] ([i915#17356]) -> [SKIP][841] ([i915#3555] / [i915#9906])
   [840]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_vrr@negative-basic.html
   [841]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-6/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-dg2:          [SKIP][842] ([i915#9906]) -> [SKIP][843] ([i915#17356])
   [842]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-5/igt@kms_vrr@seamless-rr-switch-vrr.html
   [843]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_vrr@seamless-rr-switch-vrr.html

  
  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#10826]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10826
  [i915#1099]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099
  [i915#11151]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151
  [i915#11190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#11521]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11521
  [i915#11680]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11680
  [i915#118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/118
  [i915#12178]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12178
  [i915#12276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276
  [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
  [i915#12343]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343
  [i915#12358]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12358
  [i915#1257]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257
  [i915#12655]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655
  [i915#12713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713
  [i915#12745]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745
  [i915#12755]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755
  [i915#12756]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12756
  [i915#12805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805
  [i915#13008]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13008
  [i915#13026]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13026
  [i915#13027]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13027
  [i915#13046]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046
  [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
  [i915#13179]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179
  [i915#13356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356
  [i915#13398]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13398
  [i915#13409]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13409
  [i915#13441]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13441
  [i915#13476]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13476
  [i915#13520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13520
  [i915#13562]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13562
  [i915#13566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566
  [i915#13691]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13691
  [i915#13705]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13705
  [i915#13707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707
  [i915#13748]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748
  [i915#13781]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13781
  [i915#13790]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13790
  [i915#13958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958
  [i915#14073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073
  [i915#14098]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098
  [i915#14118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14118
  [i915#14123]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14123
  [i915#14152]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14152
  [i915#14419]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14419
  [i915#14544]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544
  [i915#14586]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14586
  [i915#14712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712
  [i915#15073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073
  [i915#15102]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102
  [i915#15104]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104
  [i915#15131]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15131
  [i915#15132]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132
  [i915#15243]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243
  [i915#15329]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329
  [i915#15330]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330
  [i915#15342]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15342
  [i915#15347]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15347
  [i915#15458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458
  [i915#15459]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459
  [i915#15460]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460
  [i915#15479]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15479
  [i915#15529]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15529
  [i915#15582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582
  [i915#15643]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643
  [i915#15709]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709
  [i915#15733]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15733
  [i915#15739]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15739
  [i915#15768]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15768
  [i915#15815]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15815
  [i915#15865]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865
  [i915#15867]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867
  [i915#15948]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948
  [i915#15989]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989
  [i915#15990]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990
  [i915#15991]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991
  [i915#16056]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16056
  [i915#16080]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16080
  [i915#16081]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081
  [i915#16084]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16084
  [i915#16112]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16112
  [i915#16166]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16166
  [i915#16348]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16348
  [i915#16361]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361
  [i915#16386]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16386
  [i915#16420]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16420
  [i915#16471]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471
  [i915#16472]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16472
  [i915#16518]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16518
  [i915#16600]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16600
  [i915#16604]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16604
  [i915#16680]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16680
  [i915#16685]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16685
  [i915#16708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708
  [i915#16746]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16746
  [i915#16789]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16789
  [i915#16904]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16904
  [i915#16943]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16943
  [i915#16990]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16990
  [i915#17099]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17099
  [i915#17119]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17119
  [i915#17133]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17133
  [i915#17145]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17145
  [i915#17146]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17146
  [i915#17158]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17158
  [i915#17183]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17183
  [i915#17217]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17217
  [i915#17285]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17285
  [i915#17286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17286
  [i915#17287]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17287
  [i915#17289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17289
  [i915#17290]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17290
  [i915#17356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356
  [i915#17357]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17357
  [i915#17359]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17359
  [i915#17373]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17373
  [i915#17416]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17416
  [i915#17427]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427
  [i915#17428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428
  [i915#17429]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17429
  [i915#17430]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17430
  [i915#17431]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17431
  [i915#17432]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17432
  [i915#17434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17434
  [i915#17444]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17444
  [i915#17446]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17446
  [i915#17448]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17448
  [i915#17450]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17450
  [i915#17452]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17452
  [i915#17453]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17453
  [i915#17454]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17454
  [i915#17455]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17455
  [i915#17457]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17457
  [i915#17458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17458
  [i915#17462]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17462
  [i915#17467]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17467
  [i915#17473]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17473
  [i915#17477]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17477
  [i915#17478]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17478
  [i915#17479]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17479
  [i915#17480]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17480
  [i915#17481]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17481
  [i915#17482]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17482
  [i915#17483]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17483
  [i915#17484]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17484
  [i915#17485]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17485
  [i915#17488]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17488
  [i915#17489]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17489
  [i915#17490]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17490
  [i915#17491]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17491
  [i915#17492]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17492
  [i915#17493]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17493
  [i915#17494]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17494
  [i915#17496]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17496
  [i915#17497]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17497
  [i915#17498]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17498
  [i915#17499]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17499
  [i915#17500]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17500
  [i915#17501]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17501
  [i915#17502]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17502
  [i915#17503]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17503
  [i915#17504]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17504
  [i915#17505]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17505
  [i915#17507]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17507
  [i915#17508]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17508
  [i915#17510]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17510
  [i915#17511]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17511
  [i915#17512]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17512
  [i915#17516]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17516
  [i915#17517]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17517
  [i915#17520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17520
  [i915#17521]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17521
  [i915#17522]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17522
  [i915#17524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17524
  [i915#17525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17525
  [i915#17526]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17526
  [i915#17528]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17528
  [i915#17529]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17529
  [i915#17531]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17531
  [i915#17532]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17532
  [i915#17533]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17533
  [i915#17537]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17537
  [i915#17540]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17540
  [i915#17544]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17544
  [i915#17546]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17546
  [i915#17547]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17547
  [i915#17548]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17548
  [i915#17550]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17550
  [i915#17552]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17552
  [i915#17555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17555
  [i915#17559]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17559
  [i915#17561]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17561
  [i915#17562]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17562
  [i915#17564]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17564
  [i915#17565]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17565
  [i915#17567]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17567
  [i915#17568]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17568
  [i915#17569]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17569
  [i915#17571]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17571
  [i915#17573]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17573
  [i915#17577]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17577
  [i915#17578]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17578
  [i915#17581]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17581
  [i915#17582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17582
  [i915#17584]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17584
  [i915#17588]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17588
  [i915#17595]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17595
  [i915#17678]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17678
  [i915#17679]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17679
  [i915#17680]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17680
  [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
  [i915#17698]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17698
  [i915#17701]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17701
  [i915#17703]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17703
  [i915#17704]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17704
  [i915#17712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17712
  [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
  [i915#1849]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849
  [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
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
  [i915#3297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299
  [i915#3323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323
  [i915#3539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
  [i915#3547]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3547
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#3742]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
  [i915#3828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
  [i915#4235]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4235
  [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
  [i915#4342]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4342
  [i915#4349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349
  [i915#4423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423
  [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
  [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#4771]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4771
  [i915#4812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812
  [i915#4817]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817
  [i915#4818]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4818
  [i915#4839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839
  [i915#4852]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852
  [i915#4860]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860
  [i915#4881]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4881
  [i915#4885]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4885
  [i915#5138]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#5439]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439
  [i915#5882]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5882
  [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
  [i915#6301]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301
  [i915#6334]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334
  [i915#6335]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335
  [i915#6524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
  [i915#6953]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953
  [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
  [i915#7862]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7862
  [i915#7882]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7882
  [i915#7984]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984
  [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
  [i915#8399]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399
  [i915#8428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
  [i915#8516]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516
  [i915#8562]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562
  [i915#8623]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623
  [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
  [i915#8812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8812
  [i915#8813]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813
  [i915#8821]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8821
  [i915#8825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825
  [i915#8898]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8898
  [i915#9067]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067
  [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
  [i915#9340]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340
  [i915#9423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423
  [i915#9683]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683
  [i915#9685]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685
  [i915#9723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9766]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766
  [i915#9833]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9833
  [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
  [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934


Build changes
-------------

  * Linux: CI_DRM_19399 -> Patchwork_176963v1

  CI-20190529: 20190529
  CI_DRM_19399: 4fae0a24d63d617b8651b1cc247c3a36bc1eff32 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_9167: 9167
  Patchwork_176963v1: 4fae0a24d63d617b8651b1cc247c3a36bc1eff32 @ git://anongit.freedesktop.org/gfx-ci/linux
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/index.html

--===============0091404581817066981==
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
<tr><td><b>Series:</b></td><td>series starting with [v3,1/3] drm/i915/fbc: update the supported FP16 formats</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/176963/">https://patchwork.freedesktop.org/series/176963/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_19399_full -&gt; Patchwork_176963v1_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (10 -&gt; 10)</h2>
<p>No changes in participating hosts</p>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_19399_full and Patchwork_176963v1_full:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_cursor_crc@cursor-random-64x64@pipe-c-hdmi-a-2:<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.10] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_176963v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@device_reset@unbind-cold-reset-rebind:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk1/igt@device_reset@unbind-cold-reset-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17537">i915#17537</a>)</li>
</ul>
</li>
<li>
<p>igt@dmabuf@dma-buf-fence-chain:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk10/igt@dmabuf@dma-buf-fence-chain.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17712">i915#17712</a>)</li>
</ul>
</li>
<li>
<p>igt@drm_read@short-buffer-nonblock:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-8/igt@drm_read@short-buffer-nonblock.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@drm_read@short-buffer-nonblock.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17359">i915#17359</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-copy-compressed:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk9/igt@gem_ccs@block-copy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17499">i915#17499</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-compressed:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@gem_ccs@block-multicopy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-7/igt@gem_ccs@ctrl-surf-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@gem_ccs@ctrl-surf-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@large-ctrl-surf-copy:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk11/igt@gem_ccs@large-ctrl-surf-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17499">i915#17499</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@gem_ccs@large-ctrl-surf-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13008">i915#13008</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-9/igt@gem_ccs@suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-1/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16348">i915#16348</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-process:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk11/igt@gem_close_race@multigpu-basic-process.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17568">i915#17568</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-threads:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk9/igt@gem_close_race@multigpu-basic-threads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17568">i915#17568</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_compute@compute-square:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk9/igt@gem_compute@compute-square.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17552">i915#17552</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-sanity-check:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-8/igt@gem_create@create-ext-cpu-access-sanity-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335">i915#6335</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-set-pat:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-3/igt@gem_create@create-ext-set-pat.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562">i915#8562</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_param@set-priority-not-supported:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-3/igt@gem_ctx_param@set-priority-not-supported.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17444">i915#17444</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-mixed:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-snb4/igt@gem_ctx_persistence@legacy-engines-mixed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099">i915#1099</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@saturated-hostile-nopreempt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-1/igt@gem_ctx_persistence@saturated-hostile-nopreempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5882">i915#5882</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-args:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk1/igt@gem_ctx_sseu@invalid-args.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17496">i915#17496</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-sseu:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-mtlp-4/igt@gem_eio@in-flight-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-mtlp-4/igt@gem_eio@in-flight-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17217">i915#17217</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-snb4/igt@gem_eio@unwedge-stress.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8898">i915#8898</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-pair:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-1/igt@gem_exec_balancer@bonded-pair.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4771">i915#4771</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-submit-fence:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk4/igt@gem_exec_balancer@parallel-keep-submit-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17547">i915#17547</a>) +3 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-9/igt@gem_exec_balancer@parallel-keep-submit-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-out-fence:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-7/igt@gem_exec_balancer@parallel-out-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@gem_exec_balancer@parallel-out-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_big@single:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-8/igt@gem_exec_big@single.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16604">i915#16604</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible@lmem0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-1/igt@gem_exec_capture@capture-invisible@lmem0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334">i915#6334</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture@vecs0-lmem0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-19/igt@gem_exec_capture@capture@vecs0-lmem0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16904">i915#16904</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_endless@dispatch@bcs0:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk10/igt@gem_exec_endless@dispatch@bcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17571">i915#17571</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@submit67:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-12/igt@gem_exec_fence@submit67.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-set-default:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-12/igt@gem_exec_flush@basic-uc-set-default.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539">i915#3539</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-pro-default:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-19/igt@gem_exec_flush@basic-wb-pro-default.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852">i915#4852</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@rsvd2-dirt:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk10/igt@gem_exec_params@rsvd2-dirt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17565">i915#17565</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-4/igt@gem_exec_params@rsvd2-dirt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17453">i915#17453</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-master:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-7/igt@gem_exec_params@secure-non-master.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17416">i915#17416</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@gem_exec_params@secure-non-master.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17416">i915#17416</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-noreloc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-12/igt@gem_exec_reloc@basic-gtt-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-read:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-1/igt@gem_exec_reloc@basic-gtt-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-wc-active:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-8/igt@gem_exec_reloc@basic-write-wc-active.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-copy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-12/igt@gem_fence_thrash@bo-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860">i915#4860</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-8/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@gem_lmem_swapping@heavy-verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +2 other tests skip</li>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk11/igt@gem_lmem_swapping@heavy-verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17503">i915#17503</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random-engines:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk4/igt@gem_lmem_swapping@random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17503">i915#17503</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk10/igt@gem_lmem_swapping@verify.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17503">i915#17503</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-3/igt@gem_lmem_swapping@verify-random-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-16/igt@gem_media_vme.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284">i915#284</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic-read-write:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-1/igt@gem_mmap_gtt@basic-read-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic-small-bo-tiledx:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk10/igt@gem_mmap_gtt@basic-small-bo-tiledx.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16685">i915#16685</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@coherency:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk9/igt@gem_mmap_gtt@coherency.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17582">i915#17582</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write-wc-read-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-16/igt@gem_mmap_wc@write-wc-read-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@write-snoop:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-19/igt@gem_partial_pwrite_pread@write-snoop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pread@bench:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-1/igt@gem_pread@bench.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@hw-rejects-pxp-buffer:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-3/igt@gem_pxp@hw-rejects-pxp-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13398">i915#13398</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-1:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk11/igt@gem_pxp@reject-modify-context-protection-off-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17521">i915#17521</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk9/igt@gem_pxp@reject-modify-context-protection-off-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17521">i915#17521</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-16/igt@gem_pxp@reject-modify-context-protection-off-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-execution-after-suspend-resume:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk10/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17521">i915#17521</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-buf-execution:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-1/igt@gem_pxp@verify-pxp-stale-buf-execution.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-1/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428">i915#8428</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk11/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17492">i915#17492</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-to-vebox-linear:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk9/igt@gem_render_copy@yf-tiled-to-vebox-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17492">i915#17492</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop-interruptible:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-19/igt@gem_softpin@evict-snoop-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4885">i915#4885</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-unsync:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-8/igt@gem_userptr_blits@dmabuf-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-pwrite-unsync:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk10/igt@gem_userptr_blits@readonly-pwrite-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17507">i915#17507</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-overlap:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@gem_userptr_blits@unsync-overlap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) +1 other test skip</li>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk11/igt@gem_userptr_blits@unsync-overlap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17507">i915#17507</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk4/igt@gem_userptr_blits@unsync-unmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17507">i915#17507</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-9/igt@gem_userptr_blits@unsync-unmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-cycles:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-16/igt@gem_userptr_blits@unsync-unmap-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk10/igt@gem_workarounds@suspend-resume.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14586">i915#14586</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-context:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-5/igt@gem_workarounds@suspend-resume-context.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-6/igt@gem_workarounds@suspend-resume-context.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>)</li>
</ul>
</li>
<li>
<p>igt@gen3_render_linear_blits:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk1/igt@gen3_render_linear_blits.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17555">i915#17555</a>)</li>
</ul>
</li>
<li>
<p>igt@gen3_render_mixed_blits:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk11/igt@gen3_render_mixed_blits.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17532">i915#17532</a>)</li>
</ul>
</li>
<li>
<p>igt@gen3_render_tiledx_blits:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk9/igt@gen3_render_tiledx_blits.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17511">i915#17511</a>)</li>
</ul>
</li>
<li>
<p>igt@gen3_render_tiledy_blits:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk4/igt@gen3_render_tiledy_blits.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17578">i915#17578</a>)</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-allocation:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk1/igt@gen7_exec_parse@basic-allocation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17505">i915#17505</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-rejected:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@gen7_exec_parse@basic-rejected.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17455">i915#17455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@batch-without-end:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-7/igt@gen7_exec_parse@batch-without-end.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17455">i915#17455</a>)</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@bitmasks:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk10/igt@gen7_exec_parse@bitmasks.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17505">i915#17505</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-4/igt@gen7_exec_parse@bitmasks.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17455">i915#17455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-12/igt@gen9_exec_parse@allowed-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected-ctx-param:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-9/igt@gen9_exec_parse@basic-rejected-ctx-param.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-without-end:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-1/igt@gen9_exec_parse@batch-without-end.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@valid-registers:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@gen9_exec_parse@valid-registers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@all-busy-idle-check-all:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-16/igt@i915_drm_fdinfo@all-busy-idle-check-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14123">i915#14123</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-idle@vecs0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-1/igt@i915_drm_fdinfo@busy-idle@vecs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073">i915#14073</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@virtual-busy-hang:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-12/igt@i915_drm_fdinfo@virtual-busy-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14118">i915#14118</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@intel_connector_register:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-9/igt@i915_module_load@fault-injection@intel_connector_register.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15342">i915#15342</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@uc_fw_rsa_data_create:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-9/igt@i915_module_load@fault-injection@uc_fw_rsa_data_create.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15479">i915#15479</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-4/igt@i915_pm_freq_api@freq-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399">i915#8399</a>) +1 other test skip</li>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk10/igt@i915_pm_freq_api@freq-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17526">i915#17526</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@media-rc6-accuracy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-12/igt@i915_pm_rc6_residency@media-rc6-accuracy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16080">i915#16080</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16166">i915#16166</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-9/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13790">i915#13790</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2681">i915#2681</a>) +1 other test warn</li>
</ul>
</li>
<li>
<p>igt@i915_query@hwconfig_table:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk11/igt@i915_query@hwconfig_table.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17584">i915#17584</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-7/igt@i915_suspend@basic-s3-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-1/igt@i915_suspend@basic-s3-without-i915.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15131">i915#15131</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk9/igt@intel_hwmon@hwmon-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11680">i915#11680</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-12/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-8/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) +77 other tests skip</li>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk10/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17562">i915#17562</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk11/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17485">i915#17485</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-4/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17432">i915#17432</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk4/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17478">i915#17478</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-7/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-8/igt@kms_big_fb@4-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk9/igt@kms_big_fb@4-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17544">i915#17544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-12/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk11/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17478">i915#17478</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-mtlp-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-mtlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15733">i915#15733</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138">i915#5138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17432">i915#17432</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk11/igt@kms_big_fb@linear-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17500">i915#17500</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17431">i915#17431</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk1/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17524">i915#17524</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-9/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-1/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-snb4/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17500">i915#17500</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk10/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17500">i915#17500</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk9/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17500">i915#17500</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-19/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-snb4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17478">i915#17478</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-12/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk10/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17478">i915#17478</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17432">i915#17432</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-9/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17432">i915#17432</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-8/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-8/igt@kms_busy@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_busy@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190">i915#11190</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +49 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-yf-tiled-ccs:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk10/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16685">i915#16685</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk11/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17491">i915#17491</a>) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-8/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg1-17/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-14/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk4/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17525">i915#17525</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-3/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk10/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17491">i915#17491</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk10/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17490">i915#17490</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17491">i915#17491</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk11/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17525">i915#17525</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-9/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-6/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +77 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-mtlp-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-mtlp-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17158">i915#17158</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk2/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582">i915#15582</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-8/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-12/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk9/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17490">i915#17490</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17491">i915#17491</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk9/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17491">i915#17491</a>) +54 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-15/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +122 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-8/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk11/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17490">i915#17490</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17491">i915#17491</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-7/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +47 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-rejected-max-dotclock:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@kms_cdclk@mode-rejected-max-dotclock.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17099">i915#17099</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk4/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17550">i915#17550</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-9/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742">i915#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-5/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13781">i915#13781</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio-after-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-3/igt@kms_chamelium_audio@dp-audio-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-4/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) +2 other tests skip</li>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk10/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17489">i915#17489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>)</li>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk11/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17489">i915#17489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-1/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk9/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17489">i915#17489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-8/igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk4/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17497">i915#17497</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk10/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17497">i915#17497</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-12/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-snb4/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17497">i915#17497</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@kms_chamelium_color_pipeline@plane-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-1/igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut3d-green-only:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-19/igt@kms_chamelium_color_pipeline@plane-lut3d-green-only.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-8/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-fast:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-16/igt@kms_chamelium_frames@dp-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm-disable:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +5 other tests skip</li>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk11/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17483">i915#17483</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk1/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17483">i915#17483</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk10/igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17483">i915#17483</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-fast:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-9/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@background-color@pipe-a-background-color:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk4/igt@kms_color@background-color@pipe-a-background-color.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17133">i915#17133</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-6/igt@kms_color@ctm-0-25.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655">i915#12655</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17373">i915#17373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-6/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15529">i915#15529</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk9/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17510">i915#17510</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk11/igt@kms_color_pipeline@plane-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17510">i915#17510</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-a-plane-4:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-6/igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-a-plane-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16990">i915#16990</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-d-plane-3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-16/igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-d-plane-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16990">i915#16990</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-b-plane-4:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-b-plane-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16990">i915#16990</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk10/igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17510">i915#17510</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-19/igt@kms_content_protection@atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk1/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17508">i915#17508</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-9/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk11/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17502">i915#17502</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-16/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-hdcp14:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-12/igt@kms_content_protection@dp-mst-type-0-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-suspend-resume:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk9/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17502">i915#17502</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy-hdcp14:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk11/igt@kms_content_protection@legacy-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17508">i915#17508</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-1/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk10/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17508">i915#17508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x32:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk1/igt@kms_cursor_crc@cursor-offscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17504">i915#17504</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk10/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17533">i915#17533</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk1/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17533">i915#17533</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-3/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-tglu-10/igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-9/igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-7/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk10/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17504">i915#17504</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-7/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-64x21:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@kms_cursor_crc@cursor-random-64x21.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x32:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk11/igt@kms_cursor_crc@cursor-sliding-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17504">i915#17504</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-3/igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk1/igt@kms_cursor_crc@cursor-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12358">i915#12358</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14152">i915#14152</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7882">i915#7882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk1/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12358">i915#12358</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14152">i915#14152</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17457">i915#17457</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17454">i915#17454</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-9/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17454">i915#17454</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk11/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15768">i915#15768</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-3/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723">i915#9723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723">i915#9723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-12/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13691">i915#13691</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-8bpc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-16/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev@basic:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-8/igt@kms_dp_aux_dev@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257">i915#1257</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-7/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17289">i915#17289</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17289">i915#17289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst-direct-train:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-1/igt@kms_dp_link_training@non-uhbr-sst-direct-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17286">i915#17286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-9/igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17290">i915#17290</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk4/igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17531">i915#17531</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst-tbtalt-train:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk9/igt@kms_dp_link_training@uhbr-mst-tbtalt-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17477">i915#17477</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748">i915#13748</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk1/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17680">i915#17680</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk9/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17548">i915#17548</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-16/igt@kms_draw_crc@draw-method-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8812">i915#8812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic-ultrajoiner:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-12/igt@kms_dsc@dsc-basic-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +2 other tests skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-snb4/igt@kms_dsc@dsc-basic-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17458">i915#17458</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-4/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-bigjoiner:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@kms_dsc@dsc-fractional-bpp-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +2 other tests skip</li>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk11/igt@kms_dsc@dsc-fractional-bpp-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17458">i915#17458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats-ultrajoiner:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-1/igt@kms_dsc@dsc-with-bpc-formats-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-ultrajoiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-8/igt@kms_dsc@dsc-with-bpc-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-ultrajoiner:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk10/igt@kms_dsc@dsc-with-output-formats-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17458">i915#17458</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk9/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17458">i915#17458</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-1/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16680">i915#16680</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk9/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17516">i915#17516</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk1/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17581">i915#17581</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-3/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081">i915#16081</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk9/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17679">i915#17679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@vrr:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@kms_feature_discovery@vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16600">i915#16600</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fence_pin_leak:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-1/igt@kms_fence_pin_leak.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4881">i915#4881</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-16/igt@kms_flip@2x-flip-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk11/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17183">i915#17183</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk11/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17183">i915#17183</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-3/igt@kms_flip@2x-plain-flip-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-snb5/igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ab-vga1-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-snb5/igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ab-vga1-hdmi-a1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10826">i915#10826</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-glk3/igt@kms_flip@flip-vs-expired-vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk3/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13027">i915#13027</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-8/igt@kms_flip@flip-vs-rmfb-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_flip@flip-vs-rmfb-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk9/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17484">i915#17484</a>) +4 other tests skip</li>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-5/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813">i915#8813</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk11/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17522">i915#17522</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-16/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17493">i915#17493</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk11/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17493">i915#17493</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk10/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17484">i915#17484</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk10/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17522">i915#17522</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +2 other tests skip</li>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk11/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17484">i915#17484</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17522">i915#17522</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-5/igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813">i915#8813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-1/igt@kms_flip_tiling@flip-change-tiling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_flip_tiling@flip-change-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17452">i915#17452</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-cpu.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-indfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-2p-indfb-fliptrack-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-4/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-1/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk1/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17517">i915#17517</a>) +46 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) +60 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-modesetfrombusy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-7/igt@kms_frontbuffer_tracking@fbchdr-modesetfrombusy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-stridechange:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-16/igt@kms_frontbuffer_tracking@fbchdr-stridechange.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-tiling-4:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk1/igt@kms_frontbuffer_tracking@fbchdr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17559">i915#17559</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-12/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17482">i915#17482</a>) +89 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-12/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +20 other tests skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-snb4/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17588">i915#17588</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-farfromfence-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-farfromfence-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-4/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439">i915#5439</a>)</li>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk10/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17559">i915#17559</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-blt:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-pwrite:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-pwrite.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-4/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-1/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-4/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-indfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) +62 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-glk8/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk6/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17517">i915#17517</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-7/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766">i915#9766</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766">i915#9766</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-16/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk11/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17482">i915#17482</a>) +39 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-12/igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +13 other tests skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-snb4/igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17482">i915#17482</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-1/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-12/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) +40 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk10/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17482">i915#17482</a>) +35 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@audio-bw-hblank80:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-1/igt@kms_hdmi_audio_bw@audio-bw-hblank80.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_hdmi_audio_bw@audio-bw-hblank80.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17357">i915#17357</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-19/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17145">i915#17145</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk11/igt@kms_hdr@bpc-switch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17498">i915#17498</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@kms_hdr@bpc-switch-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#12713</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-9/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-12/igt@kms_hdr@static-swap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) +1 other test skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-snb4/igt@kms_hdr@static-swap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17498">i915#17498</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-1/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16518">i915#16518</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk9/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17498">i915#17498</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-clock:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-5/igt@kms_invalid_mode@zero-clock.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_invalid_mode@zero-clock.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16746">i915#16746</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk11/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17512">i915#17512</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-9/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459">i915#15459</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk4/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17678">i915#17678</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk9/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17567">i915#17567</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458">i915#15458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460">i915#15460</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-19/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459">i915#15459</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-1/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458">i915#15458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17701">i915#17701</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk11/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17577">i915#17577</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-12/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301">i915#6301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk11/igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17540">i915#17540</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk9/igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17540">i915#17540</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-16/igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17455">i915#17455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk2/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12756">i915#12756</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13409">i915#13409</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13476">i915#13476</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16789">i915#16789</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-untiled:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk10/igt@kms_pipe_stress@stress-xrgb8888-untiled.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/118">i915#118</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-xtiled:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk4/igt@kms_pipe_stress@stress-xrgb8888-xtiled.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/118">i915#118</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-yftiled:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-16/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712">i915#14712</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-3/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-12/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +1 other test skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-snb4/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17479">i915#17479</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk11/igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17479">i915#17479</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-6/igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16386">i915#16386</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk10/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17479">i915#17479</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk4/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17479">i915#17479</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-linear-modifier:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-1/igt@kms_plane@pixel-format-linear-modifier.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_plane@pixel-format-linear-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825">i915#8825</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier@pipe-a-plane-4:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk9/igt@kms_plane@pixel-format-y-tiled-modifier@pipe-a-plane-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17494">i915#17494</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-8/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-6/igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16112">i915#16112</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk11/igt@kms_plane@plane-panning-bottom-right-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13026">i915#13026</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk10/igt@kms_plane_alpha_blend@alpha-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12178">i915#12178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk10/igt@kms_plane_alpha_blend@alpha-basic@pipe-c-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7862">i915#7862</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-min:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-snb4/igt@kms_plane_alpha_blend@constant-alpha-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17595">i915#17595</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@kms_plane_multiple@2x-tiling-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-16/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-6/igt@kms_plane_scaling@intel-max-src-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-4/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-19/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-8/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-3/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk10/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17529">i915#17529</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-c:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk10/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17528">i915#17528</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-5/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk9/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17529">i915#17529</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk9/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17528">i915#17528</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-8/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-c:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-8/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-c.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-d:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-d.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk11/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17462">i915#17462</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk10/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17462">i915#17462</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk9/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17462">i915#17462</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-1/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-pageflip-negative:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@kms_pm_dc@dc5-pageflip-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i915#9685</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-16/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948">i915#15948</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk9/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17703">i915#17703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk11/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17564">i915#17564</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-7/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15739">i915#15739</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15739">i915#15739</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@screens-disabled:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk9/igt@kms_pm_lpsp@screens-disabled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17573">i915#17573</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-12/igt@kms_pm_rpm@cursor.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +7 other tests skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-snb4/igt@kms_pm_rpm@cursor.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17473">i915#17473</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-7/igt@kms_pm_rpm@dpms-non-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-8/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@drm-resources-equal:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-6/igt@kms_pm_rpm@drm-resources-equal.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_pm_rpm@drm-resources-equal.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17446">i915#17446</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3547">i915#3547</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-8/igt@kms_pm_rpm@i2c.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_pm_rpm@i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17446">i915#17446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk1/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-8/igt@kms_pm_rpm@modeset-non-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) +1 other test skip</li>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg1-19/igt@kms_pm_rpm@modeset-non-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-15/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-4/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-pc8-residency-stress:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@kms_pm_rpm@modeset-pc8-residency-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17434">i915#17434</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17450">i915#17450</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@pc8-residency:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-3/igt@kms_pm_rpm@pc8-residency.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17434">i915#17434</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17450">i915#17450</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-hybrid:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-12/igt@kms_prime@basic-crc-hybrid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-snb4/igt@kms_prime@basic-crc-hybrid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17569">i915#17569</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-modeset-hybrid:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk4/igt@kms_prime@basic-modeset-hybrid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17569">i915#17569</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-9/igt@kms_prime@basic-modeset-hybrid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_properties@colorop-properties-atomic:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-8/igt@kms_properties@colorop-properties-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_properties@colorop-properties-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15347">i915#15347</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_properties@colorop-properties-legacy:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk9/igt@kms_properties@colorop-properties-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17481">i915#17481</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-legacy:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-6/igt@kms_properties@plane-properties-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_properties@plane-properties-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11521">i915#11521</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-3/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-12/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-8/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk10/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk11/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-1/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-snb4/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk4/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-19/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk10/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17546">i915#17546</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk9/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17546">i915#17546</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-6/igt@kms_psr@fbc-pr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-render:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-snb4/igt@kms_psr@fbc-pr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17480">i915#17480</a>) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-12/igt@kms_psr@fbc-pr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-mmap-cpu:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk11/igt@kms_psr@fbc-psr-sprite-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17480">i915#17480</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-blt:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@kms_psr@fbc-psr2-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-mmap-gtt:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk9/igt@kms_psr@fbc-psr2-cursor-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17480">i915#17480</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-dpms:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-4/igt@kms_psr@pr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-mmap-cpu:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-1/igt@kms_psr@psr-cursor-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk10/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17480">i915#17480</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk11/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17480">i915#17480</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk1/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17480">i915#17480</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-8/igt@kms_psr@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-no-drrs:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk10/igt@kms_psr@psr2-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17480">i915#17480</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@exhaust-fences:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-1/igt@kms_rotation_crc@exhaust-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4235">i915#4235</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-12/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17432">i915#17432</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk11/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17488">i915#17488</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-9/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17432">i915#17432</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17488">i915#17488</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk9/igt@kms_scaling_modes@scaling-mode-full-aspect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17501">i915#17501</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179">i915#13179</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk9/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276">i915#12276</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-8/igt@kms_vblank@ts-continuation-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-3/igt@kms_vblank@ts-continuation-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276">i915#12276</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-3/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276">i915#12276</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-snb4/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17520">i915#17520</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-8/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243">i915#15243</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk9/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17520">i915#17520</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk10/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17520">i915#17520</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk11/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17561">i915#17561</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk11/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17520">i915#17520</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@per-context-mode-unprivileged:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk11/igt@perf@per-context-mode-unprivileged.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17704">i915#17704</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-12/igt@perf@unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17455">i915#17455</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2433">i915#2433</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@event-wait:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk4/igt@perf_pmu@event-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17698">i915#17698</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@event-wait@rcs0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-9/igt@perf_pmu@event-wait@rcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17416">i915#17416</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-12/igt@perf_pmu@module-unload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17119">i915#17119</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-6/igt@perf_pmu@rc6-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13520">i915#13520</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6@other-idle-gt0:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-1/igt@perf_pmu@rc6@other-idle-gt0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516">i915#8516</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_mmap_kms@buffer-sharing:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-6/igt@prime_mmap_kms@buffer-sharing.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@prime_mmap_kms@buffer-sharing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17454">i915#17454</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_udl@share-import:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk4/igt@prime_udl@share-import.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16420">i915#16420</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-9/igt@prime_udl@share-import.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16420">i915#16420</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-16/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-mmap:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-12/igt@prime_vgem@basic-fence-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@coherency-gtt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-tglu-3/igt@prime_vgem@coherency-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17429">i915#17429</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17448">i915#17448</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-write-hang:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk1/igt@prime_vgem@fence-write-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17467">i915#17467</a>)</li>
</ul>
</li>
<li>
<p>igt@tools_test@sysfs_l3_parity:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-1/igt@tools_test@sysfs_l3_parity.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4818">i915#4818</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@unaligned-read:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@fbdev@unaligned-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582">i915#2582</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-6/igt@fbdev@unaligned-read.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-contexts-immediate:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-snb5/igt@gem_eio@in-flight-contexts-immediate.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-snb4/igt@gem_eio@in-flight-contexts-immediate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-execution-after-suspend-resume:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-1/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15131">i915#15131</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-6/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_power@sanity:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-mtlp-5/igt@i915_power@sanity.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984">i915#7984</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-mtlp-7/igt@i915_power@sanity.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@sysfs-reader:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-4/igt@i915_suspend@sysfs-reader.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-8/igt@i915_suspend@sysfs-reader.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15733">i915#15733</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138">i915#5138</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-mtlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-glk8/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582">i915#15582</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk2/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15529">i915#15529</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-8/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-top-edge:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_cursor_edge_walk@256x256-top-edge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-6/igt@kms_cursor_edge_walk@256x256-top-edge.html">PASS</a> +53 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_fb_coherency@memset-crc:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_fb_coherency@memset-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17454">i915#17454</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-6/igt@kms_fb_coherency@memset-crc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_fbcon_fbt@fbc-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-6/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_flip@flip-vs-panning.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-6/igt@kms_flip@flip-vs-panning.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813">i915#8813</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-cpu.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-glk5/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17517">i915#17517</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk8/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-render.html">PASS</a> +11 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@dpms-audio-recovery:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_hdmi_audio_bw@dpms-audio-recovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17357">i915#17357</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-8/igt@kms_hdmi_audio_bw@dpms-audio-recovery.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@overflow-vrefresh:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_invalid_mode@overflow-vrefresh.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16746">i915#16746</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-6/igt@kms_invalid_mode@overflow-vrefresh.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-vdisplay:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_invalid_mode@zero-vdisplay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16746">i915#16746</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-8/igt@kms_invalid_mode@zero-vdisplay.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190">i915#11190</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-6/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-glk9/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/118">i915#118</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-glk3/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_plane@pixel-format-4-tiled-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825">i915#8825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-6/igt@kms_plane@pixel-format-4-tiled-modifier.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-1/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132">i915#15132</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-7/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers@pipe-b:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers@pipe-b.html">PASS</a> +23 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers@pipe-d:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-1/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers@pipe-d.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_plane_scaling@planes-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-6/igt@kms_plane_scaling@planes-downscale-factor-0-75.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-6/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-scaler-unity-scaling:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_plane_scaling@planes-scaler-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-8/igt@kms_plane_scaling@planes-scaler-unity-scaling.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-negative:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_pm_dc@dc5-dpms-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13441">i915#13441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-8/igt@kms_pm_dc@dc5-dpms-negative.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg1-19/igt@kms_pm_rpm@i2c.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-15/igt@kms_pm_rpm@i2c.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-6/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">PASS</a> +1 other test pass</li>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg1-15/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-12/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-idle:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-3/igt@kms_pm_rpm@system-suspend-idle.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14419">i915#14419</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-1/igt@kms_pm_rpm@system-suspend-idle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@render-node-busy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-5/igt@perf_pmu@render-node-busy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-2/igt@perf_pmu@render-node-busy.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@semaphore-busy@vcs1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-mtlp-2/igt@perf_pmu@semaphore-busy@vcs1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-mtlp-8/igt@perf_pmu@semaphore-busy@vcs1.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-6/igt@gem_exec_balancer@parallel-ordering.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-1/igt@gem_exec_balancer@parallel-ordering.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@rsvd2-dirt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-1/igt@gem_exec_params@rsvd2-dirt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17453">i915#17453</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-6/igt@gem_exec_params@rsvd2-dirt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17453">i915#17453</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-cpu:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-1/igt@gem_exec_reloc@basic-gtt-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-6/igt@gem_exec_reloc@basic-write-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-1/igt@gem_exec_reloc@basic-write-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random-ccs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-6/igt@gem_lmem_swapping@heavy-verify-random-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-1/igt@gem_lmem_swapping@heavy-verify-random-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-5/igt@gem_lmem_swapping@parallel-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-6/igt@gem_lmem_swapping@parallel-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@write-snoop:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-6/igt@gem_partial_pwrite_pread@write-snoop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-4/igt@gem_partial_pwrite_pread@write-snoop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop-interruptible:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-6/igt@gem_softpin@evict-snoop-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17430">i915#17430</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-4/igt@gem_softpin@evict-snoop-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17430">i915#17430</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-6/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323">i915#3323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-1/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323">i915#3323</a>)</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@bitmasks:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-1/igt@gen7_exec_parse@bitmasks.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17455">i915#17455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-6/igt@gen7_exec_parse@bitmasks.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17455">i915#17455</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@secure-batches:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-1/igt@gen9_exec_parse@secure-batches.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-6/igt@gen9_exec_parse@secure-batches.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@__uc_init:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-6/igt@i915_module_load@fault-injection@__uc_init.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15479">i915#15479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-3/igt@i915_module_load@fault-injection@__uc_init.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15479">i915#15479</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-1/igt@i915_pm_freq_api@freq-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399">i915#8399</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-6/igt@i915_pm_freq_api@freq-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399">i915#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-8/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-1/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-6/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-1/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-6/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17431">i915#17431</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-5/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17431">i915#17431</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-6/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17431">i915#17431</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-4/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17431">i915#17431</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-8/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-5/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-6/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-1/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-6/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-6/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-8/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-1/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-6/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-4/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-8/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-1/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805">i915#12805</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-1/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805">i915#12805</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-mtlp-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-b-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17158">i915#17158</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-mtlp-8/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-b-edp-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582">i915#15582</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-8/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-1/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-1/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-6/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13781">i915#13781</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-1/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-6/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut3d-green-only:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-6/igt@kms_chamelium_color_pipeline@plane-lut3d-green-only.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-4/igt@kms_chamelium_color_pipeline@plane-lut3d-green-only.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-mode-timings:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-6/igt@kms_chamelium_edid@hdmi-mode-timings.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-1/igt@kms_chamelium_edid@hdmi-mode-timings.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-single:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-3/igt@kms_chamelium_frames@hdmi-crc-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-6/igt@kms_chamelium_frames@hdmi-crc-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-3/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-6/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-8/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-6/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-6/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-6/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent-hdcp14:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-6/igt@kms_content_protection@uevent-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-1/igt@kms_content_protection@uevent-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x32:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-1/igt@kms_cursor_crc@cursor-offscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_cursor_crc@cursor-offscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-1/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-6/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-6/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-8/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-max-size:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-6/igt@kms_cursor_crc@cursor-random-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-1/igt@kms_cursor_crc@cursor-random-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x32:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-6/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-5/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046">i915#13046</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17454">i915#17454</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190">i915#11190</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-3/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-6/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046">i915#13046</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17454">i915#17454</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-6/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067">i915#9067</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-8/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9833">i915#9833</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-8/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17289">i915#17289</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst-direct-train:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_dp_link_training@non-uhbr-mst-direct-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-6/igt@kms_dp_link_training@non-uhbr-mst-direct-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17287">i915#17287</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-1/igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17290">i915#17290</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst-tbtalt-train:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-5/igt@kms_dp_link_training@uhbr-mst-tbtalt-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17285">i915#17285</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_dp_link_training@uhbr-mst-tbtalt-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-6/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748">i915#13748</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst-tbtalt-train:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_dp_link_training@uhbr-sst-tbtalt-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-6/igt@kms_dp_link_training@uhbr-sst-tbtalt-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17285">i915#17285</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-1/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707">i915#13707</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>)</li>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-3/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707">i915#13707</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-6/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707">i915#13707</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-wc:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_draw_crc@draw-method-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-8/igt@kms_draw_crc@draw-method-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8812">i915#8812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-8/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) +4 other tests skip</li>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-1/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-6/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-1/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-6/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-4/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-3/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16084">i915#16084</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-6/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16084">i915#16084</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-1/igt@kms_flip@2x-flip-vs-panning-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-6/igt@kms_flip@2x-flip-vs-panning-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-6/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-4/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@bo-too-big:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-mtlp-8/igt@kms_flip@bo-too-big.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13562">i915#13562</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17146">i915#17146</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-mtlp-5/igt@kms_flip@bo-too-big.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13562">i915#13562</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16472">i915#16472</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@bo-too-big@a-edp1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-mtlp-8/igt@kms_flip@bo-too-big@a-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13562">i915#13562</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-mtlp-5/igt@kms_flip@bo-too-big@a-edp1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13562">i915#13562</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16472">i915#16472</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +37 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-1/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-shrfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-shrfb-fliptrack-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-shrfb-fliptrack-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-render:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439">i915#5439</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-pwrite:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-5/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-6/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-6/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a>) +45 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-3/igt@kms_frontbuffer_tracking@hdr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16056">i915#16056</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-8/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766">i915#9766</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4342">i915#4342</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg1-12/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-6/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-4/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-5/igt@kms_frontbuffer_tracking@psrhdr-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_frontbuffer_tracking@psrhdr-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a>) +48 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-5/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132">i915#15132</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17357">i915#17357</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-6/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#12713</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16518">i915#16518</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459">i915#15459</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-4/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459">i915#15459</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-6/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458">i915#15458</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458">i915#15458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-3/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15815">i915#15815</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15815">i915#15815</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-6/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13705">i915#13705</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-3/igt@kms_plane@pixel-format-yf-tiled-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-6/igt@kms_plane@pixel-format-yf-tiled-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-1/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8821">i915#8821</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-6/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8821">i915#8821</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-8/igt@kms_plane_multiple@2x-tiling-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_plane_multiple@2x-tiling-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-5/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-suspend-resume:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-6/igt@kms_pm_dc@dc5-dpms-suspend-resume.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16943">i915#16943</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-1/igt@kms_pm_dc@dc5-dpms-suspend-resume.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132">i915#15132</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-4/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340">i915#9340</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-8/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@d3hot:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg1-18/igt@kms_prime@d3hot.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg1-18/igt@kms_prime@d3hot.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-1/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-6/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-4/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-6/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915#9683</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-4/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-plane-onoff:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-3/igt@kms_psr@fbc-pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-6/igt@kms_psr@fbc-pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-plane-move:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-6/igt@kms_psr@psr2-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-4/igt@kms_psr@psr2-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-6/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755">i915#12755</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867">i915#15867</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-6/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755">i915#12755</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867">i915#15867</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755">i915#12755</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867">i915#15867</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623">i915#8623</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623">i915#8623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-6/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-8/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243">i915#15243</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>)</li>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-rkl-1/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243">i915#15243</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-rkl-6/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243">i915#15243</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-7/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-6/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19399/shard-dg2-5/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_176963v1/shard-dg2-7/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_19399 -&gt; Patchwork_176963v1</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19399: 4fae0a24d63d617b8651b1cc247c3a36bc1eff32 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_9167: 9167<br />
  Patchwork_176963v1: 4fae0a24d63d617b8651b1cc247c3a36bc1eff32 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============0091404581817066981==--
