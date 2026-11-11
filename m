Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13E8606A326
	for <intel-gfx@archiver.kernel.org>; Wed, 11 Nov 2026 14:50:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A46D10EA5B;
	Wed, 11 Nov 2026 14:50:20 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9289A10EA4A;
 Wed, 11 Nov 2026 14:50:19 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0250933209392593112=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EFull=3A_success_for_gpu/buddy=3A_restore_two?=
 =?utf-8?q?-pass_clear/dirty_guard_for_range-biased_allocation_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arunpravin Paneer Selvam" <arunpravin.paneerselvam@amd.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Wed, 11 Nov 2026 14:50:19 -0000
Message-ID: <179440861958.9880.7638454936901539957@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261111044910.333192-1-arunpravin.paneerselvam@amd.com>
In-Reply-To: <20261111044910.333192-1-arunpravin.paneerselvam@amd.com>
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
X-Spam-Status: No, score=-4.9 required=3.0 tests=BAYES_00,HTML_MESSAGE,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,MPART_ALT_DIFF_COUNT,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============0250933209392593112==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: gpu/buddy: restore two-pass clear/dirty guard for range-biased allocation (rev3)
URL   : https://patchwork.freedesktop.org/series/177601/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_19487_full -> Patchwork_177601v3_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in Patchwork_177601v3_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - shard-rkl:          NOTRUN -> [SKIP][1] ([i915#8411])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-glk:          NOTRUN -> [SKIP][2] ([i915#17537])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk2/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-glk:          NOTRUN -> [SKIP][3] ([i915#17499]) +1 other test skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk2/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_ccs@large-ctrl-surf-copy:
    - shard-glk10:        NOTRUN -> [SKIP][4] ([i915#17499])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk10/igt@gem_ccs@large-ctrl-surf-copy.html

  * igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0:
    - shard-dg2:          [PASS][5] -> [INCOMPLETE][6] ([i915#13356] / [i915#16348])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-dg2-4/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-dg2-6/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-glk11:        NOTRUN -> [SKIP][7] ([i915#17568])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk11/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-glk11:        NOTRUN -> [SKIP][8] ([i915#17513])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk11/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_ctx_freq@sysfs@gt0:
    - shard-dg2:          [PASS][9] -> [FAIL][10] ([i915#9561]) +1 other test fail
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-dg2-3/igt@gem_ctx_freq@sysfs@gt0.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-dg2-8/igt@gem_ctx_freq@sysfs@gt0.html

  * igt@gem_ctx_persistence@hang:
    - shard-glk10:        NOTRUN -> [SKIP][11] ([i915#17527])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk10/igt@gem_ctx_persistence@hang.html

  * igt@gem_ctx_persistence@heartbeat-hang:
    - shard-dg1:          NOTRUN -> [SKIP][12] ([i915#8555])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-dg1-17/igt@gem_ctx_persistence@heartbeat-hang.html

  * igt@gem_ctx_persistence@legacy-engines-hang@blt:
    - shard-glk11:        NOTRUN -> [SKIP][13] ([i915#17527])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk11/igt@gem_ctx_persistence@legacy-engines-hang@blt.html

  * igt@gem_ctx_sseu@engines:
    - shard-glk:          NOTRUN -> [SKIP][14] ([i915#17496])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk3/igt@gem_ctx_sseu@engines.html

  * igt@gem_exec_balancer@bonded-false-hang:
    - shard-dg1:          NOTRUN -> [SKIP][15] ([i915#4812]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-dg1-17/igt@gem_exec_balancer@bonded-false-hang.html

  * igt@gem_exec_balancer@parallel-keep-in-fence:
    - shard-glk10:        NOTRUN -> [SKIP][16] ([i915#17547])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk10/igt@gem_exec_balancer@parallel-keep-in-fence.html

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-rkl:          NOTRUN -> [SKIP][17] ([i915#4525])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-7/igt@gem_exec_balancer@parallel-ordering.html
    - shard-tglu:         NOTRUN -> [SKIP][18] ([i915#4525])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-tglu-2/igt@gem_exec_balancer@parallel-ordering.html

  * igt@gem_exec_capture@capture-invisible:
    - shard-glk11:        NOTRUN -> [SKIP][19] ([i915#6334]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk11/igt@gem_exec_capture@capture-invisible.html

  * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
    - shard-rkl:          NOTRUN -> [SKIP][20] ([i915#3711])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html

  * igt@gem_exec_flush@basic-batch-kernel-default-uc:
    - shard-dg1:          NOTRUN -> [SKIP][21] ([i915#3539] / [i915#4852]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-dg1-17/igt@gem_exec_flush@basic-batch-kernel-default-uc.html

  * igt@gem_exec_params@larger-than-life-batch:
    - shard-glk:          NOTRUN -> [SKIP][22] ([i915#16871])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk8/igt@gem_exec_params@larger-than-life-batch.html

  * igt@gem_exec_reloc@basic-gtt-wc-noreloc:
    - shard-dg1:          NOTRUN -> [SKIP][23] ([i915#3281]) +2 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-dg1-17/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html

  * igt@gem_exec_reloc@basic-range-active:
    - shard-rkl:          NOTRUN -> [SKIP][24] ([i915#3281]) +5 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@gem_exec_reloc@basic-range-active.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
    - shard-glk:          NOTRUN -> [SKIP][25] ([i915#17503] / [i915#4613]) +2 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk3/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html

  * igt@gem_lmem_swapping@parallel-multi:
    - shard-glk11:        NOTRUN -> [SKIP][26] ([i915#17503])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk11/igt@gem_lmem_swapping@parallel-multi.html

  * igt@gem_lmem_swapping@parallel-random:
    - shard-glk10:        NOTRUN -> [SKIP][27] ([i915#17503]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk10/igt@gem_lmem_swapping@parallel-random.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][28] ([i915#4613])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-7/igt@gem_lmem_swapping@parallel-random-verify-ccs.html
    - shard-tglu:         NOTRUN -> [SKIP][29] ([i915#4613])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-tglu-2/igt@gem_lmem_swapping@parallel-random-verify-ccs.html

  * igt@gem_mmap_gtt@coherency:
    - shard-glk10:        NOTRUN -> [SKIP][30] ([i915#17582])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk10/igt@gem_mmap_gtt@coherency.html

  * igt@gem_mmap_gtt@fault-concurrent-y:
    - shard-dg1:          NOTRUN -> [SKIP][31] ([i915#4077]) +2 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-dg1-17/igt@gem_mmap_gtt@fault-concurrent-y.html

  * igt@gem_mmap_wc@read:
    - shard-dg1:          NOTRUN -> [SKIP][32] ([i915#4083]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-dg1-17/igt@gem_mmap_wc@read.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-snoop:
    - shard-rkl:          NOTRUN -> [SKIP][33] ([i915#3282]) +3 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-7/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html

  * igt@gem_pread@exhaustion:
    - shard-glk:          NOTRUN -> [WARN][34] ([i915#2658])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk2/igt@gem_pread@exhaustion.html

  * igt@gem_pxp@create-protected-buffer:
    - shard-glk11:        NOTRUN -> [SKIP][35] ([i915#17521])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk11/igt@gem_pxp@create-protected-buffer.html

  * igt@gem_pxp@create-valid-protected-context:
    - shard-glk10:        NOTRUN -> [SKIP][36] ([i915#17521]) +1 other test skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk10/igt@gem_pxp@create-valid-protected-context.html

  * igt@gem_pxp@fail-invalid-protected-context:
    - shard-dg1:          NOTRUN -> [SKIP][37] ([i915#4270])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-dg1-17/igt@gem_pxp@fail-invalid-protected-context.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled:
    - shard-glk:          NOTRUN -> [SKIP][38] ([i915#17492]) +2 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk3/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html

  * igt@gem_render_copy@y-tiled-to-vebox-x-tiled:
    - shard-glk10:        NOTRUN -> [SKIP][39] ([i915#17492]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk10/igt@gem_render_copy@y-tiled-to-vebox-x-tiled.html

  * igt@gem_render_copy@yf-tiled-to-vebox-x-tiled:
    - shard-glk11:        NOTRUN -> [SKIP][40] ([i915#17492])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk11/igt@gem_render_copy@yf-tiled-to-vebox-x-tiled.html

  * igt@gem_set_tiling_vs_pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][41] ([i915#4079])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-dg1-17/igt@gem_set_tiling_vs_pwrite.html

  * igt@gem_unfence_active_buffers:
    - shard-dg1:          NOTRUN -> [SKIP][42] ([i915#4879])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-dg1-17/igt@gem_unfence_active_buffers.html

  * igt@gem_userptr_blits@coherency-unsync:
    - shard-rkl:          NOTRUN -> [SKIP][43] ([i915#3297])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-7/igt@gem_userptr_blits@coherency-unsync.html
    - shard-tglu:         NOTRUN -> [SKIP][44] ([i915#3297])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-tglu-2/igt@gem_userptr_blits@coherency-unsync.html

  * igt@gem_userptr_blits@forbidden-operations:
    - shard-rkl:          NOTRUN -> [SKIP][45] ([i915#3282] / [i915#3297])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-7/igt@gem_userptr_blits@forbidden-operations.html

  * igt@gem_userptr_blits@readonly-pwrite-unsync:
    - shard-glk10:        NOTRUN -> [SKIP][46] ([i915#17507])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk10/igt@gem_userptr_blits@readonly-pwrite-unsync.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-rkl:          [PASS][47] -> [INCOMPLETE][48] ([i915#13356]) +2 other tests incomplete
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-7/igt@gem_workarounds@suspend-resume-fd.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-3/igt@gem_workarounds@suspend-resume-fd.html

  * igt@gen3_mixed_blits:
    - shard-glk11:        NOTRUN -> [SKIP][49] ([i915#17688])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk11/igt@gen3_mixed_blits.html

  * igt@gen3_render_linear_blits:
    - shard-glk10:        NOTRUN -> [SKIP][50] ([i915#17555])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk10/igt@gen3_render_linear_blits.html

  * igt@gen7_exec_parse@basic-allowed:
    - shard-rkl:          NOTRUN -> [SKIP][51] ([i915#17455])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@gen7_exec_parse@basic-allowed.html

  * igt@gen7_exec_parse@cmd-crossing-page:
    - shard-glk11:        NOTRUN -> [SKIP][52] ([i915#17505])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk11/igt@gen7_exec_parse@cmd-crossing-page.html

  * igt@gen7_exec_parse@load-register-reg:
    - shard-glk10:        NOTRUN -> [SKIP][53] ([i915#17505])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk10/igt@gen7_exec_parse@load-register-reg.html

  * igt@gen9_exec_parse@batch-invalid-length:
    - shard-dg1:          NOTRUN -> [SKIP][54] ([i915#2527])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-dg1-17/igt@gen9_exec_parse@batch-invalid-length.html

  * igt@gen9_exec_parse@unaligned-jump:
    - shard-tglu:         NOTRUN -> [SKIP][55] ([i915#2527] / [i915#2856]) +2 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-tglu-2/igt@gen9_exec_parse@unaligned-jump.html
    - shard-rkl:          NOTRUN -> [SKIP][56] ([i915#2527]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-7/igt@gen9_exec_parse@unaligned-jump.html

  * igt@gpu_buddy@gpu_buddy:
    - shard-rkl:          NOTRUN -> [SKIP][57] ([i915#15678])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@gpu_buddy@gpu_buddy.html

  * igt@i915_drm_fdinfo@most-busy-idle-check-all@rcs0:
    - shard-dg1:          NOTRUN -> [SKIP][58] ([i915#14073]) +5 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-dg1-17/igt@i915_drm_fdinfo@most-busy-idle-check-all@rcs0.html

  * igt@i915_hangman@engine-engine-error@bcs0:
    - shard-glk:          NOTRUN -> [SKIP][59] ([i915#17580])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk3/igt@i915_hangman@engine-engine-error@bcs0.html

  * igt@i915_pm_freq_api@freq-basic-api:
    - shard-glk10:        NOTRUN -> [SKIP][60] ([i915#17526])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk10/igt@i915_pm_freq_api@freq-basic-api.html

  * igt@i915_pm_freq_api@freq-reset-multiple:
    - shard-tglu:         NOTRUN -> [SKIP][61] ([i915#8399])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-tglu-5/igt@i915_pm_freq_api@freq-reset-multiple.html
    - shard-glk11:        NOTRUN -> [SKIP][62] ([i915#17526])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk11/igt@i915_pm_freq_api@freq-reset-multiple.html

  * igt@i915_pm_freq_api@freq-suspend@gt0:
    - shard-dg2:          [PASS][63] -> [INCOMPLETE][64] ([i915#13356] / [i915#13820]) +1 other test incomplete
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-dg2-3/igt@i915_pm_freq_api@freq-suspend@gt0.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-dg2-3/igt@i915_pm_freq_api@freq-suspend@gt0.html

  * igt@i915_pm_freq_mult@media-freq:
    - shard-glk11:        NOTRUN -> [SKIP][65] ([i915#17699]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk11/igt@i915_pm_freq_mult@media-freq.html

  * igt@i915_pm_rc6_residency@media-rc6-accuracy:
    - shard-glk10:        NOTRUN -> [SKIP][66] ([i915#17541])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk10/igt@i915_pm_rc6_residency@media-rc6-accuracy.html

  * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
    - shard-dg1:          NOTRUN -> [SKIP][67] ([i915#17434] / [i915#17450])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-dg1-17/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html

  * igt@i915_pm_rps@thresholds-idle-park:
    - shard-dg1:          NOTRUN -> [SKIP][68] ([i915#11681])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-dg1-17/igt@i915_pm_rps@thresholds-idle-park.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-glk11:        NOTRUN -> [SKIP][69] ([i915#17673])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk11/igt@i915_query@test-query-geometry-subslices.html

  * igt@i915_suspend@debugfs-reader:
    - shard-glk:          NOTRUN -> [INCOMPLETE][70] ([i915#13356] / [i915#16182] / [i915#4817]) +1 other test incomplete
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk8/igt@i915_suspend@debugfs-reader.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-glk11:        NOTRUN -> [INCOMPLETE][71] ([i915#13356] / [i915#16182] / [i915#4817])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk11/igt@i915_suspend@fence-restore-untiled.html

  * igt@intel_hwmon@hwmon-write:
    - shard-glk:          NOTRUN -> [SKIP][72] ([i915#11680])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk2/igt@intel_hwmon@hwmon-write.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-rkl:          NOTRUN -> [SKIP][73] ([i915#12454] / [i915#12712])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic:
    - shard-glk11:        NOTRUN -> [SKIP][74] ([i915#17562])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk11/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-glk10:        NOTRUN -> [SKIP][75] ([i915#17485])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk10/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-glk:          NOTRUN -> [SKIP][76] ([i915#1769])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-0:
    - shard-rkl:          NOTRUN -> [SKIP][77] ([i915#4538] / [i915#5286]) +3 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-7/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html
    - shard-tglu:         NOTRUN -> [SKIP][78] ([i915#17432] / [i915#5286]) +3 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-tglu-2/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][79] ([i915#4538] / [i915#5286]) +1 other test skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-dg1-17/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-0:
    - shard-glk11:        NOTRUN -> [SKIP][80] ([i915#17478]) +2 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk11/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-glk:          NOTRUN -> [SKIP][81] ([i915#17544])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk3/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-mtlp:         [PASS][82] -> [FAIL][83] ([i915#15733] / [i915#5138])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-mtlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-glk10:        NOTRUN -> [SKIP][84] ([i915#17478]) +3 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk10/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-glk:          NOTRUN -> [SKIP][85] ([i915#17478]) +5 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-dg1:          NOTRUN -> [SKIP][86] ([i915#3638])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-dg1-17/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg1:          NOTRUN -> [SKIP][87] ([i915#3828])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-dg1-17/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-glk:          NOTRUN -> [SKIP][88] ([i915#17524])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk3/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-glk10:        NOTRUN -> [SKIP][89] ([i915#17500]) +4 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk10/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-glk11:        NOTRUN -> [SKIP][90] ([i915#17500]) +1 other test skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk11/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html
    - shard-tglu:         NOTRUN -> [SKIP][91] ([i915#17431])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-tglu-5/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-glk:          NOTRUN -> [SKIP][92] ([i915#17500]) +2 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][93] ([i915#4538])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-7/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html
    - shard-tglu:         NOTRUN -> [SKIP][94] ([i915#17432]) +2 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-tglu-2/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-270:
    - shard-dg1:          NOTRUN -> [SKIP][95] ([i915#4538]) +1 other test skip
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-dg1-15/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-rkl:          NOTRUN -> [SKIP][96] ([i915#17432]) +1 other test skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-7/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-c-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][97] ([i915#10307] / [i915#6095]) +51 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-dg2-4/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-c-hdmi-a-2:
    - shard-glk10:        NOTRUN -> [SKIP][98] ([i915#17491]) +25 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk10/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs:
    - shard-glk11:        NOTRUN -> [SKIP][99] ([i915#17490] / [i915#17491]) +9 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk11/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2:
    - shard-glk11:        NOTRUN -> [SKIP][100] ([i915#17491]) +26 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk11/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][101] ([i915#12313])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-7/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-2:
    - shard-glk10:        NOTRUN -> [SKIP][102] ([i915#17490] / [i915#17491]) +7 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk10/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-glk10:        NOTRUN -> [SKIP][103] ([i915#17525]) +1 other test skip
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk10/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][104] ([i915#14098] / [i915#6095]) +34 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][105] ([i915#12805])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1:
    - shard-dg1:          NOTRUN -> [SKIP][106] ([i915#6095]) +86 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-dg1-15/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-2:
    - shard-glk:          NOTRUN -> [SKIP][107] ([i915#17490] / [i915#17491]) +17 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][108] ([i915#6095]) +15 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-dg2-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-glk:          NOTRUN -> [INCOMPLETE][109] ([i915#13356] / [i915#15582]) +1 other test incomplete
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk2/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][110] ([i915#12313]) +2 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-tglu-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
    - shard-glk11:        NOTRUN -> [SKIP][111] ([i915#17525]) +1 other test skip
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk11/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][112] ([i915#12313])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-dg1-17/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][113] ([i915#10307] / [i915#10434] / [i915#6095]) +3 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-dg2-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][114] ([i915#6095]) +29 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-tglu-2/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][115] ([i915#6095]) +57 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-7/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [SKIP][116] ([i915#17491]) +48 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk3/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_chamelium_audio@dp-audio-edid:
    - shard-glk10:        NOTRUN -> [SKIP][117] ([i915#17483]) +4 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk10/igt@kms_chamelium_audio@dp-audio-edid.html

  * igt@kms_chamelium_audio@hdmi-audio-after-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][118] ([i915#11151])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@kms_chamelium_audio@hdmi-audio-after-suspend.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-rkl:          NOTRUN -> [SKIP][119] ([i915#17427])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-glk11:        NOTRUN -> [SKIP][120] ([i915#17489])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk11/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_color@degamma:
    - shard-glk10:        NOTRUN -> [SKIP][121] ([i915#17489])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk10/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_color@gamma:
    - shard-glk:          NOTRUN -> [SKIP][122] ([i915#17489]) +1 other test skip
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk3/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d:
    - shard-glk:          NOTRUN -> [SKIP][123] ([i915#17497]) +1 other test skip
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk2/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim:
    - shard-dg1:          NOTRUN -> [SKIP][124] ([i915#17427])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-dg1-17/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d:
    - shard-glk10:        NOTRUN -> [SKIP][125] ([i915#17497])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk10/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d:
    - shard-tglu:         NOTRUN -> [SKIP][126] ([i915#16471] / [i915#17427]) +1 other test skip
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-tglu-5/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d.html
    - shard-glk11:        NOTRUN -> [SKIP][127] ([i915#17497])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk11/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4:
    - shard-rkl:          NOTRUN -> [SKIP][128] ([i915#16471] / [i915#17427]) +1 other test skip
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:
    - shard-glk11:        NOTRUN -> [SKIP][129] ([i915#17483]) +2 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk11/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html

  * igt@kms_chamelium_edid@hdmi-mode-timings:
    - shard-dg1:          NOTRUN -> [SKIP][130] ([i915#11151] / [i915#7828]) +1 other test skip
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-dg1-17/igt@kms_chamelium_edid@hdmi-mode-timings.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-glk:          NOTRUN -> [SKIP][131] ([i915#17483]) +4 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk3/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_chamelium_hpd@dp-hpd-fast:
    - shard-rkl:          NOTRUN -> [SKIP][132] ([i915#11151] / [i915#7828]) +3 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@kms_chamelium_hpd@dp-hpd-fast.html

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - shard-tglu:         NOTRUN -> [SKIP][133] ([i915#11151] / [i915#7828]) +3 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-tglu-5/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d:
    - shard-glk11:        NOTRUN -> [SKIP][134] ([i915#17510])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk11/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d.html

  * igt@kms_color_pipeline@plane-lut1d-ctm3x4:
    - shard-glk10:        NOTRUN -> [SKIP][135] ([i915#17510]) +1 other test skip
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk10/igt@kms_color_pipeline@plane-lut1d-ctm3x4.html

  * igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4:
    - shard-glk:          NOTRUN -> [SKIP][136] ([i915#17510]) +1 other test skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk8/igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-glk:          NOTRUN -> [SKIP][137] ([i915#17508])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk3/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-rkl:          NOTRUN -> [SKIP][138] ([i915#15330] / [i915#3116])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@dp-mst-type-1-suspend-resume:
    - shard-glk:          NOTRUN -> [SKIP][139] ([i915#17502])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk3/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html

  * igt@kms_content_protection@lic-type-1:
    - shard-glk10:        NOTRUN -> [SKIP][140] ([i915#17508])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk10/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@mei-interface:
    - shard-dg1:          NOTRUN -> [SKIP][141] ([i915#15865])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-dg1-17/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@type1:
    - shard-tglu:         NOTRUN -> [SKIP][142] ([i915#15865])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-tglu-5/igt@kms_content_protection@type1.html
    - shard-glk11:        NOTRUN -> [SKIP][143] ([i915#17508])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk11/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-offscreen-32x10:
    - shard-dg1:          NOTRUN -> [SKIP][144] ([i915#3555]) +1 other test skip
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-dg1-15/igt@kms_cursor_crc@cursor-offscreen-32x10.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-glk11:        NOTRUN -> [SKIP][145] ([i915#17533])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk11/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-glk:          NOTRUN -> [SKIP][146] ([i915#17533])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk2/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-128x42@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [FAIL][147] ([i915#13566])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-8/igt@kms_cursor_crc@cursor-onscreen-128x42@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-rkl:          NOTRUN -> [SKIP][148] ([i915#3555]) +1 other test skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_crc@cursor-random-32x10:
    - shard-glk:          NOTRUN -> [SKIP][149] ([i915#17504]) +2 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk3/igt@kms_cursor_crc@cursor-random-32x10.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-tglu:         NOTRUN -> [SKIP][150] ([i915#3555])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-tglu-5/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html
    - shard-glk11:        NOTRUN -> [SKIP][151] ([i915#17504])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk11/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-rkl:          NOTRUN -> [SKIP][152] ([i915#13049])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-7/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
    - shard-tglu:         NOTRUN -> [SKIP][153] ([i915#13049])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-tglu-2/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-glk10:        NOTRUN -> [SKIP][154] ([i915#17533])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk10/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-glk10:        NOTRUN -> [SKIP][155] ([i915#17504]) +1 other test skip
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk10/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-2:
    - shard-rkl:          [PASS][156] -> [INCOMPLETE][157] ([i915#12358] / [i915#14152])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-3/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-2.html
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-6/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-2.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-rkl:          NOTRUN -> [SKIP][158] ([i915#17428]) +44 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-7/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
    - shard-tglu:         NOTRUN -> [SKIP][159] ([i915#17428] / [i915#17454]) +3 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-tglu-2/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-dg1:          NOTRUN -> [SKIP][160] ([i915#4103])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-dg1-17/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-glk:          NOTRUN -> [SKIP][161] ([i915#17457])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dp_aux_dev@basic:
    - shard-glk10:        NOTRUN -> [SKIP][162] ([i915#17538])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk10/igt@kms_dp_aux_dev@basic.html

  * igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train:
    - shard-glk:          NOTRUN -> [SKIP][163] ([i915#17616])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk2/igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-glk11:        NOTRUN -> [SKIP][164] ([i915#17664])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk11/igt@kms_dp_link_training@non-uhbr-sst.html
    - shard-tglu:         NOTRUN -> [SKIP][165] ([i915#17288])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-tglu-5/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dp_link_training@non-uhbr-sst-direct-train:
    - shard-glk:          NOTRUN -> [SKIP][166] ([i915#17506])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk8/igt@kms_dp_link_training@non-uhbr-sst-direct-train.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-dg1:          NOTRUN -> [SKIP][167] ([i915#13748])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-dg1-17/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dp_link_training@uhbr-sst-tbtalt-train:
    - shard-rkl:          NOTRUN -> [SKIP][168] ([i915#17285]) +1 other test skip
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@kms_dp_link_training@uhbr-sst-tbtalt-train.html

  * igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback:
    - shard-glk10:        NOTRUN -> [SKIP][169] ([i915#17548])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk10/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-glk10:        NOTRUN -> [SKIP][170] ([i915#17458]) +1 other test skip
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk10/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-fractional-bpp-ultrajoiner:
    - shard-glk11:        NOTRUN -> [SKIP][171] ([i915#17458]) +1 other test skip
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk11/igt@kms_dsc@dsc-fractional-bpp-ultrajoiner.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc-ultrajoiner:
    - shard-glk:          NOTRUN -> [SKIP][172] ([i915#17458]) +1 other test skip
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk3/igt@kms_dsc@dsc-fractional-bpp-with-bpc-ultrajoiner.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-rkl:          NOTRUN -> [SKIP][173] ([i915#16361]) +1 other test skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-7/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
    - shard-tglu:         NOTRUN -> [SKIP][174] ([i915#16361]) +2 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-tglu-2/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_feature_discovery@chamelium:
    - shard-glk:          NOTRUN -> [SKIP][175] ([i915#17581])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk3/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-2x:
    - shard-rkl:          NOTRUN -> [SKIP][176] ([i915#16081])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@display-3x:
    - shard-tglu:         NOTRUN -> [SKIP][177] ([i915#16081])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-tglu-5/igt@kms_feature_discovery@display-3x.html
    - shard-glk11:        NOTRUN -> [SKIP][178] ([i915#17679])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk11/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-glk:          NOTRUN -> [SKIP][179] ([i915#17666])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk8/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-glk10:        NOTRUN -> [SKIP][180] ([i915#17570])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk10/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible:
    - shard-rkl:          NOTRUN -> [SKIP][181] ([i915#9934]) +1 other test skip
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-7/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-modeset:
    - shard-dg1:          NOTRUN -> [SKIP][182] ([i915#9934]) +3 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-dg1-15/igt@kms_flip@2x-flip-vs-modeset.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-glk11:        NOTRUN -> [INCOMPLETE][183] ([i915#12745] / [i915#13356] / [i915#17183] / [i915#4839])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk11/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a1-hdmi-a2:
    - shard-glk11:        NOTRUN -> [INCOMPLETE][184] ([i915#12745] / [i915#13356] / [i915#17183])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk11/igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-plain-flip:
    - shard-tglu:         NOTRUN -> [SKIP][185] ([i915#3637] / [i915#9934]) +1 other test skip
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-tglu-5/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1:
    - shard-glk:          [PASS][186] -> [FAIL][187] ([i915#14600]) +1 other test fail
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-glk5/igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1.html
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk8/igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-mtlp:         [PASS][188] -> [FAIL][189] ([i915#17214]) +1 other test fail
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-mtlp-7/igt@kms_flip@flip-vs-suspend.html
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-mtlp-4/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-tglu:         NOTRUN -> [SKIP][190] ([i915#15643])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-tglu-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-valid-mode:
    - shard-glk11:        NOTRUN -> [SKIP][191] ([i915#17522]) +1 other test skip
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk11/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
    - shard-glk10:        NOTRUN -> [SKIP][192] ([i915#17493])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk10/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-rkl:          NOTRUN -> [SKIP][193] ([i915#15643]) +1 other test skip
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:
    - shard-glk:          NOTRUN -> [SKIP][194] ([i915#17484])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-glk:          NOTRUN -> [SKIP][195] ([i915#17493]) +1 other test skip
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_force_connector_basic@force-connector-state:
    - shard-mtlp:         [PASS][196] -> [SKIP][197] ([i915#15672])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-mtlp-8/igt@kms_force_connector_basic@force-connector-state.html
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-mtlp-1/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][198] ([i915#15990] / [i915#8708]) +2 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-dg1-17/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-rkl:          NOTRUN -> [SKIP][199] ([i915#17428] / [i915#1825]) +2 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-rkl:          [PASS][200] -> [INCOMPLETE][201] ([i915#10056])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-3/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-blt:
    - shard-glk:          NOTRUN -> [SKIP][202] ([i915#17517]) +21 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk3/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-mmap-cpu:
    - shard-glk:          [PASS][203] -> [SKIP][204] ([i915#17517]) +1 other test skip
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-glk8/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-mmap-cpu.html
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk6/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbchdr-tiling-linear:
    - shard-rkl:          [PASS][205] -> [SKIP][206] ([i915#15989]) +10 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-tiling-linear.html
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@kms_frontbuffer_tracking@fbchdr-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-cpu:
    - shard-glk11:        NOTRUN -> [SKIP][207] ([i915#17482]) +39 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk11/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][208] ([i915#15990]) +3 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-move:
    - shard-tglu:         NOTRUN -> [SKIP][209] ([i915#15102]) +22 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-tglu-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-indfb-draw-pwrite:
    - shard-glk:          NOTRUN -> [SKIP][210] ([i915#17482]) +52 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk8/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-dg1:          NOTRUN -> [SKIP][211] ([i915#15102]) +7 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-shrfb-draw-mmap-gtt:
    - shard-tglu:         NOTRUN -> [SKIP][212] ([i915#15989]) +11 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-tglu-2/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-rkl:          NOTRUN -> [SKIP][213] ([i915#15989]) +8 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@hdr-modesetfrombusy:
    - shard-dg1:          NOTRUN -> [SKIP][214] ([i915#15989]) +8 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-dg1-15/igt@kms_frontbuffer_tracking@hdr-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-glk10:        NOTRUN -> [SKIP][215] ([i915#17534])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk10/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-cur-indfb-draw-blt:
    - shard-dg1:          NOTRUN -> [SKIP][216] ([i915#17428]) +29 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-dg1-15/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-cur-indfb-draw-mmap-cpu:
    - shard-tglu:         NOTRUN -> [SKIP][217] ([i915#17428]) +38 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-tglu-2/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-pwrite:
    - shard-glk10:        NOTRUN -> [SKIP][218] ([i915#17482]) +43 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk10/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psrhdr-slowdraw:
    - shard-rkl:          NOTRUN -> [SKIP][219] ([i915#15102]) +18 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-7/igt@kms_frontbuffer_tracking@psrhdr-slowdraw.html

  * igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery:
    - shard-tglu:         NOTRUN -> [FAIL][220] ([i915#17101] / [i915#17108] / [i915#17188])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-tglu-2/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-glk:          NOTRUN -> [SKIP][221] ([i915#17512])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk3/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][222] ([i915#15458])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-glk10:        NOTRUN -> [SKIP][223] ([i915#17567])
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk10/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-glk:          NOTRUN -> [SKIP][224] ([i915#17617])
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk2/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-rkl:          NOTRUN -> [SKIP][225] ([i915#6301])
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-7/igt@kms_panel_fitting@atomic-fastset.html
    - shard-tglu:         NOTRUN -> [SKIP][226] ([i915#6301])
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-tglu-2/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes:
    - shard-glk:          NOTRUN -> [SKIP][227] ([i915#17540]) +1 other test skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk2/igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes.html

  * igt@kms_pipe_stress@stress-xrgb8888-4tiled:
    - shard-rkl:          NOTRUN -> [SKIP][228] ([i915#14712])
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-7/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html
    - shard-tglu:         NOTRUN -> [SKIP][229] ([i915#14712])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-tglu-2/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping:
    - shard-glk:          NOTRUN -> [SKIP][230] ([i915#17479]) +1 other test skip
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk3/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-4-tiled-modifier:
    - shard-glk11:        NOTRUN -> [SKIP][231] ([i915#17479]) +2 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk11/igt@kms_plane@pixel-format-4-tiled-modifier.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier:
    - shard-tglu:         NOTRUN -> [SKIP][232] ([i915#15709]) +1 other test skip
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-tglu-2/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier.html
    - shard-rkl:          NOTRUN -> [SKIP][233] ([i915#15709])
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-7/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier.html

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier:
    - shard-dg1:          NOTRUN -> [SKIP][234] ([i915#15709])
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-dg1-17/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping:
    - shard-glk10:        NOTRUN -> [SKIP][235] ([i915#17479])
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk10/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier@pipe-a-plane-4:
    - shard-glk:          NOTRUN -> [SKIP][236] ([i915#17494]) +1 other test skip
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk8/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier@pipe-a-plane-4.html

  * igt@kms_plane_alpha_blend@alpha-transparent-fb:
    - shard-glk:          NOTRUN -> [FAIL][237] ([i915#10647] / [i915#12177])
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk3/igt@kms_plane_alpha_blend@alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@constant-alpha-max:
    - shard-glk:          NOTRUN -> [FAIL][238] ([i915#10647] / [i915#12169])
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk8/igt@kms_plane_alpha_blend@constant-alpha-max.html

  * igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][239] ([i915#10647]) +3 other tests fail
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk8/igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-glk10:        NOTRUN -> [SKIP][240] ([i915#17586])
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk10/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b:
    - shard-glk10:        NOTRUN -> [SKIP][241] ([i915#17529]) +1 other test skip
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk10/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c:
    - shard-glk10:        NOTRUN -> [SKIP][242] ([i915#17528]) +1 other test skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk10/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation:
    - shard-glk:          NOTRUN -> [SKIP][243] ([i915#17528]) +1 other test skip
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk3/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-b:
    - shard-glk:          NOTRUN -> [SKIP][244] ([i915#17529]) +1 other test skip
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk3/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-b.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-rkl:          NOTRUN -> [SKIP][245] ([i915#12343] / [i915#5354])
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-glk11:        NOTRUN -> [SKIP][246] ([i915#17462])
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk11/igt@kms_pm_backlight@basic-brightness.html
    - shard-tglu:         NOTRUN -> [SKIP][247] ([i915#12343] / [i915#9812])
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-tglu-5/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-rkl:          NOTRUN -> [SKIP][248] ([i915#15948])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-7/igt@kms_pm_dc@dc5-psr.html
    - shard-tglu:         NOTRUN -> [SKIP][249] ([i915#15948])
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-tglu-2/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-glk11:        NOTRUN -> [SKIP][250] ([i915#17703])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk11/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][251] ([i915#15739])
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-dg1:          NOTRUN -> [SKIP][252] ([i915#8430])
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-dg1-17/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-dg2:          [PASS][253] -> [SKIP][254] ([i915#15073])
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-dg2-4/igt@kms_pm_rpm@dpms-lpsp.html
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-dg2-8/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-tglu:         NOTRUN -> [SKIP][255] ([i915#15073])
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-tglu-5/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-dg1:          [PASS][256] -> [SKIP][257] ([i915#15073])
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-dg1-16/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-dg1-14/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-rkl:          [PASS][258] -> [SKIP][259] ([i915#15073]) +3 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-6/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@pc8-residency:
    - shard-glk:          NOTRUN -> [SKIP][260] ([i915#17710])
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk8/igt@kms_pm_rpm@pc8-residency.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-rkl:          NOTRUN -> [SKIP][261] ([i915#6524])
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-7/igt@kms_prime@basic-crc-hybrid.html
    - shard-tglu:         NOTRUN -> [SKIP][262] ([i915#6524])
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-tglu-2/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_prime@d3hot:
    - shard-glk10:        NOTRUN -> [SKIP][263] ([i915#17569])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk10/igt@kms_prime@d3hot.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-dg1:          NOTRUN -> [SKIP][264] ([i915#11520]) +1 other test skip
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-dg1-17/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
    - shard-glk10:        NOTRUN -> [SKIP][265] ([i915#11520]) +4 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk10/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-glk:          NOTRUN -> [SKIP][266] ([i915#11520]) +4 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk2/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@pr-cursor-plane-update-sf:
    - shard-tglu:         NOTRUN -> [SKIP][267] ([i915#11520]) +2 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-tglu-2/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-rkl:          NOTRUN -> [SKIP][268] ([i915#11520]) +2 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:
    - shard-glk11:        NOTRUN -> [SKIP][269] ([i915#11520])
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk11/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-glk10:        NOTRUN -> [SKIP][270] ([i915#17546])
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk10/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-rkl:          NOTRUN -> [SKIP][271] ([i915#9683])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-7/igt@kms_psr2_su@page_flip-p010.html
    - shard-tglu:         NOTRUN -> [SKIP][272] ([i915#9683])
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-tglu-2/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-pr-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][273] ([i915#1072] / [i915#9732]) +8 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@kms_psr@fbc-pr-dpms.html

  * igt@kms_psr@fbc-pr-sprite-render:
    - shard-tglu:         NOTRUN -> [SKIP][274] ([i915#9732]) +8 other tests skip
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-tglu-5/igt@kms_psr@fbc-pr-sprite-render.html

  * igt@kms_psr@fbc-psr-primary-render:
    - shard-glk11:        NOTRUN -> [SKIP][275] ([i915#17480]) +8 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk11/igt@kms_psr@fbc-psr-primary-render.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-glk10:        NOTRUN -> [SKIP][276] ([i915#17480]) +7 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk10/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@pr-no-drrs:
    - shard-glk:          NOTRUN -> [SKIP][277] ([i915#17480]) +10 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk2/igt@kms_psr@pr-no-drrs.html

  * igt@kms_psr@psr-cursor-plane-move:
    - shard-glk10:        NOTRUN -> [SKIP][278] ([i915#17480] / [i915#9732])
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk10/igt@kms_psr@psr-cursor-plane-move.html

  * igt@kms_psr@psr-primary-mmap-gtt:
    - shard-glk:          NOTRUN -> [SKIP][279] ([i915#17480] / [i915#9732])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk3/igt@kms_psr@psr-primary-mmap-gtt.html

  * igt@kms_psr@psr2-cursor-blt:
    - shard-dg1:          NOTRUN -> [SKIP][280] ([i915#1072] / [i915#9732]) +5 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-dg1-15/igt@kms_psr@psr2-cursor-blt.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-glk10:        NOTRUN -> [SKIP][281] ([i915#17554])
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk10/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:
    - shard-glk11:        NOTRUN -> [INCOMPLETE][282] ([i915#15500] / [i915#16184])
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk11/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
    - shard-rkl:          NOTRUN -> [SKIP][283] ([i915#5289])
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-7/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html
    - shard-tglu:         NOTRUN -> [SKIP][284] ([i915#5289])
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-tglu-2/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-rkl:          NOTRUN -> [SKIP][285] ([i915#17432] / [i915#5289])
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-glk10:        NOTRUN -> [SKIP][286] ([i915#17488]) +1 other test skip
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk10/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-rkl:          NOTRUN -> [SKIP][287] ([i915#8623])
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-glk:          NOTRUN -> [SKIP][288] ([i915#17705])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-glk10:        NOTRUN -> [SKIP][289] ([i915#17520])
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk10/igt@kms_vrr@flip-basic-fastset.html

  * igt@perf@gen12-oa-tlb-invalidate:
    - shard-glk10:        NOTRUN -> [SKIP][290] ([i915#17536])
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk10/igt@perf@gen12-oa-tlb-invalidate.html

  * igt@perf@gen12-unprivileged-single-ctx-counters:
    - shard-glk:          NOTRUN -> [SKIP][291] ([i915#17536])
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk2/igt@perf@gen12-unprivileged-single-ctx-counters.html

  * igt@perf@gen8-unprivileged-single-ctx-counters:
    - shard-rkl:          NOTRUN -> [SKIP][292] ([i915#2436])
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-7/igt@perf@gen8-unprivileged-single-ctx-counters.html

  * igt@perf@per-context-mode-unprivileged:
    - shard-glk11:        NOTRUN -> [SKIP][293] ([i915#17704])
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk11/igt@perf@per-context-mode-unprivileged.html
    - shard-tglu:         NOTRUN -> [SKIP][294] ([i915#17455]) +3 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-tglu-5/igt@perf@per-context-mode-unprivileged.html

  * igt@perf_pmu@busy-double-start:
    - shard-mtlp:         [PASS][295] -> [FAIL][296] ([i915#4349]) +2 other tests fail
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-mtlp-1/igt@perf_pmu@busy-double-start.html
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-mtlp-2/igt@perf_pmu@busy-double-start.html

  * igt@perf_pmu@event-wait@rcs0:
    - shard-rkl:          NOTRUN -> [SKIP][297] ([i915#17416]) +1 other test skip
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-7/igt@perf_pmu@event-wait@rcs0.html
    - shard-tglu:         NOTRUN -> [SKIP][298] ([i915#17416]) +1 other test skip
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-tglu-2/igt@perf_pmu@event-wait@rcs0.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-glk:          NOTRUN -> [SKIP][299] ([i915#17583])
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk3/igt@perf_pmu@rc6-all-gts.html

  * igt@prime_udl@share-import:
    - shard-rkl:          NOTRUN -> [SKIP][300] ([i915#16420])
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-7/igt@prime_udl@share-import.html
    - shard-tglu:         NOTRUN -> [SKIP][301] ([i915#16420])
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-tglu-2/igt@prime_udl@share-import.html

  * igt@prime_vgem@basic-fence-read:
    - shard-dg1:          NOTRUN -> [SKIP][302] ([i915#3708]) +1 other test skip
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-dg1-17/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@coherency-gtt:
    - shard-glk:          NOTRUN -> [SKIP][303] ([i915#17467])
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk2/igt@prime_vgem@coherency-gtt.html

  * igt@prime_vgem@fence-read-hang:
    - shard-glk11:        NOTRUN -> [SKIP][304] ([i915#17467])
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk11/igt@prime_vgem@fence-read-hang.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-glk11:        NOTRUN -> [SKIP][305] ([i915#17545])
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk11/igt@tools_test@sysfs_l3_parity.html
    - shard-tglu:         NOTRUN -> [SKIP][306] ([i915#17447])
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-tglu-5/igt@tools_test@sysfs_l3_parity.html

  
#### Possible fixes ####

  * igt@gem_exec_parallel@engines@userptr:
    - shard-dg1:          [ABORT][307] -> [PASS][308] +1 other test pass
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-dg1-14/igt@gem_exec_parallel@engines@userptr.html
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-dg1-15/igt@gem_exec_parallel@engines@userptr.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-rkl:          [INCOMPLETE][309] ([i915#13356]) -> [PASS][310]
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-4/igt@gem_workarounds@suspend-resume-context.html
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@gem_workarounds@suspend-resume-context.html

  * igt@i915_power@sanity:
    - shard-mtlp:         [SKIP][311] ([i915#7984]) -> [PASS][312]
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-mtlp-7/igt@i915_power@sanity.html
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-mtlp-1/igt@i915_power@sanity.html

  * igt@kms_color@deep-color:
    - shard-rkl:          [SKIP][313] ([i915#12655] / [i915#3555]) -> [PASS][314]
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-3/igt@kms_color@deep-color.html
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-6/igt@kms_color@deep-color.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-pgflip-blt:
    - shard-glk:          [SKIP][315] ([i915#17517]) -> [PASS][316]
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-glk5/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-pgflip-blt.html
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk8/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@hdr-1p-pri-indfb-multidraw:
    - shard-rkl:          [SKIP][317] ([i915#15989]) -> [PASS][318] +5 other tests pass
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-3/igt@kms_frontbuffer_tracking@hdr-1p-pri-indfb-multidraw.html
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-1p-pri-indfb-multidraw.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-mtlp:         [SKIP][319] ([i915#15725]) -> [PASS][320]
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-mtlp-1/igt@kms_hdmi_inject@inject-audio.html
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-mtlp-2/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-dg1:          [SKIP][321] ([i915#15073]) -> [PASS][322]
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-dg1-19/igt@kms_pm_rpm@dpms-lpsp.html
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-dg1-15/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-rkl:          [SKIP][323] ([i915#15073]) -> [PASS][324]
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-8/igt@kms_pm_rpm@modeset-non-lpsp.html
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-3/igt@kms_pm_rpm@modeset-non-lpsp.html

  
#### Warnings ####

  * igt@api_intel_bb@blit-reloc-keep-cache:
    - shard-rkl:          [SKIP][325] ([i915#8411]) -> [SKIP][326] ([i915#14544] / [i915#8411])
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-3/igt@api_intel_bb@blit-reloc-keep-cache.html
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-6/igt@api_intel_bb@blit-reloc-keep-cache.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-rkl:          [SKIP][327] ([i915#3555] / [i915#9323]) -> [SKIP][328] ([i915#14544] / [i915#3555] / [i915#9323])
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-3/igt@gem_ccs@ctrl-surf-copy.html
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-6/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_exec_balancer@parallel-balancer:
    - shard-rkl:          [SKIP][329] ([i915#4525]) -> [SKIP][330] ([i915#14544] / [i915#4525]) +1 other test skip
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-3/igt@gem_exec_balancer@parallel-balancer.html
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-6/igt@gem_exec_balancer@parallel-balancer.html

  * igt@gem_exec_params@secure-non-master:
    - shard-rkl:          [SKIP][331] ([i915#17416]) -> [SKIP][332] ([i915#14544] / [i915#17416])
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-3/igt@gem_exec_params@secure-non-master.html
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-6/igt@gem_exec_params@secure-non-master.html

  * igt@gem_exec_reloc@basic-gtt-wc-noreloc:
    - shard-rkl:          [SKIP][333] ([i915#14544] / [i915#3281]) -> [SKIP][334] ([i915#3281]) +2 other tests skip
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html

  * igt@gem_exec_reloc@basic-write-read:
    - shard-rkl:          [SKIP][335] ([i915#3281]) -> [SKIP][336] ([i915#14544] / [i915#3281])
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-3/igt@gem_exec_reloc@basic-write-read.html
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-6/igt@gem_exec_reloc@basic-write-read.html

  * igt@gem_lmem_swapping@heavy-verify-random:
    - shard-rkl:          [SKIP][337] ([i915#14544] / [i915#4613]) -> [SKIP][338] ([i915#4613]) +1 other test skip
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-6/igt@gem_lmem_swapping@heavy-verify-random.html
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@gem_lmem_swapping@heavy-verify-random.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - shard-rkl:          [SKIP][339] ([i915#4613]) -> [SKIP][340] ([i915#14544] / [i915#4613])
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-3/igt@gem_lmem_swapping@parallel-random-engines.html
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-6/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@gem_partial_pwrite_pread@writes-after-reads:
    - shard-rkl:          [SKIP][341] ([i915#3282]) -> [SKIP][342] ([i915#14544] / [i915#3282]) +1 other test skip
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-3/igt@gem_partial_pwrite_pread@writes-after-reads.html
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-6/igt@gem_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_set_tiling_vs_pwrite:
    - shard-rkl:          [SKIP][343] ([i915#14544] / [i915#3282]) -> [SKIP][344] ([i915#3282])
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-6/igt@gem_set_tiling_vs_pwrite.html
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@gem_set_tiling_vs_pwrite.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-rkl:          [SKIP][345] ([i915#2527]) -> [SKIP][346] ([i915#14544] / [i915#2527]) +1 other test skip
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-3/igt@gen9_exec_parse@allowed-all.html
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-6/igt@gen9_exec_parse@allowed-all.html

  * igt@gen9_exec_parse@batch-invalid-length:
    - shard-rkl:          [SKIP][347] ([i915#14544] / [i915#2527]) -> [SKIP][348] ([i915#2527])
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-6/igt@gen9_exec_parse@batch-invalid-length.html
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@gen9_exec_parse@batch-invalid-length.html

  * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
    - shard-rkl:          [SKIP][349] ([i915#14544] / [i915#17434] / [i915#17450]) -> [SKIP][350] ([i915#17434] / [i915#17450])
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-6/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html

  * igt@i915_query@hwconfig_table:
    - shard-rkl:          [SKIP][351] ([i915#14544] / [i915#6245]) -> [SKIP][352] ([i915#6245])
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-6/igt@i915_query@hwconfig_table.html
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-7/igt@i915_query@hwconfig_table.html

  * igt@intel_hwmon@hwmon-read:
    - shard-rkl:          [SKIP][353] ([i915#14544] / [i915#7707]) -> [SKIP][354] ([i915#7707])
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-6/igt@intel_hwmon@hwmon-read.html
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@intel_hwmon@hwmon-read.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
    - shard-rkl:          [SKIP][355] ([i915#14544] / [i915#4538] / [i915#5286]) -> [SKIP][356] ([i915#4538] / [i915#5286])
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-6/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-180:
    - shard-rkl:          [SKIP][357] ([i915#4538] / [i915#5286]) -> [SKIP][358] ([i915#14544] / [i915#4538] / [i915#5286])
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-3/igt@kms_big_fb@4-tiled-32bpp-rotate-180.html
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-6/igt@kms_big_fb@4-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-rkl:          [SKIP][359] ([i915#14544] / [i915#17431] / [i915#3638]) -> [SKIP][360] ([i915#17431] / [i915#3638])
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-6/igt@kms_big_fb@linear-16bpp-rotate-270.html
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-rkl:          [SKIP][361] ([i915#17431] / [i915#3638]) -> [SKIP][362] ([i915#14544] / [i915#17431] / [i915#3638])
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-3/igt@kms_big_fb@linear-32bpp-rotate-270.html
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-6/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-rkl:          [SKIP][363] ([i915#14544] / [i915#3828]) -> [SKIP][364] ([i915#3828])
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-6/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
    - shard-rkl:          [SKIP][365] ([i915#14544] / [i915#4538]) -> [SKIP][366] ([i915#4538])
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-6/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-rkl:          [SKIP][367] ([i915#4538]) -> [SKIP][368] ([i915#14544] / [i915#4538]) +1 other test skip
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-2:
    - shard-rkl:          [SKIP][369] ([i915#14098] / [i915#6095]) -> [SKIP][370] ([i915#14098] / [i915#14544] / [i915#6095]) +9 other tests skip
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-3/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-2.html
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-6/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2:
    - shard-rkl:          [SKIP][371] ([i915#6095]) -> [SKIP][372] ([i915#14544] / [i915#6095]) +8 other tests skip
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-3/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2.html
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-6/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc:
    - shard-rkl:          [SKIP][373] ([i915#14098] / [i915#14544] / [i915#6095]) -> [SKIP][374] ([i915#14098] / [i915#6095]) +4 other tests skip
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2:
    - shard-rkl:          [SKIP][375] ([i915#14544] / [i915#6095]) -> [SKIP][376] ([i915#6095]) +1 other test skip
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2.html
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-edp-1:
    - shard-mtlp:         [FAIL][377] ([i915#17158]) -> [ABORT][378] ([i915#17175]) +1 other test abort
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-mtlp-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-edp-1.html
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-mtlp-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-edp-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-rkl:          [SKIP][379] ([i915#12313] / [i915#14544]) -> [SKIP][380] ([i915#12313])
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_chamelium_audio@dp-audio:
    - shard-rkl:          [SKIP][381] ([i915#11151] / [i915#7828]) -> [SKIP][382] ([i915#11151] / [i915#14544] / [i915#7828]) +1 other test skip
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-3/igt@kms_chamelium_audio@dp-audio.html
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-6/igt@kms_chamelium_audio@dp-audio.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d:
    - shard-rkl:          [SKIP][383] ([i915#17427]) -> [SKIP][384] ([i915#14544] / [i915#17427])
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-3/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d.html
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-6/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim:
    - shard-rkl:          [SKIP][385] ([i915#14544] / [i915#17427]) -> [SKIP][386] ([i915#17427])
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-6/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim.html
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim.html

  * igt@kms_chamelium_edid@hdmi-mode-timings:
    - shard-rkl:          [SKIP][387] ([i915#11151] / [i915#14544] / [i915#7828]) -> [SKIP][388] ([i915#11151] / [i915#7828]) +1 other test skip
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-6/igt@kms_chamelium_edid@hdmi-mode-timings.html
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@kms_chamelium_edid@hdmi-mode-timings.html

  * igt@kms_content_protection@mei-interface:
    - shard-rkl:          [SKIP][389] ([i915#14544] / [i915#15865]) -> [SKIP][390] ([i915#15865])
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-6/igt@kms_content_protection@mei-interface.html
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@kms_content_protection@mei-interface.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-rkl:          [SKIP][391] ([i915#13049] / [i915#14544]) -> [SKIP][392] ([i915#13049])
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-512x512.html
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-7/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-32x32:
    - shard-rkl:          [SKIP][393] ([i915#3555]) -> [SKIP][394] ([i915#14544] / [i915#3555])
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-3/igt@kms_cursor_crc@cursor-sliding-32x32.html
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-32x32.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-rkl:          [SKIP][395] ([i915#14544] / [i915#4103]) -> [SKIP][396] ([i915#4103])
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_dp_link_training@uhbr-mst-direct-train:
    - shard-rkl:          [SKIP][397] ([i915#17285]) -> [SKIP][398] ([i915#14544] / [i915#17285])
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-3/igt@kms_dp_link_training@uhbr-mst-direct-train.html
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-6/igt@kms_dp_link_training@uhbr-mst-direct-train.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-rkl:          [SKIP][399] ([i915#13748] / [i915#14544]) -> [SKIP][400] ([i915#13748])
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-6/igt@kms_dp_link_training@uhbr-sst.html
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-rkl:          [SKIP][401] ([i915#14544] / [i915#16867]) -> [SKIP][402] ([i915#16867])
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-6/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-7/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_feature_discovery@psr1:
    - shard-rkl:          [SKIP][403] ([i915#658]) -> [SKIP][404] ([i915#14544] / [i915#658])
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-3/igt@kms_feature_discovery@psr1.html
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-6/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop:
    - shard-rkl:          [SKIP][405] ([i915#14544] / [i915#9934]) -> [SKIP][406] ([i915#9934]) +1 other test skip
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-6/igt@kms_flip@2x-flip-vs-dpms-on-nop.html
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@kms_flip@2x-flip-vs-dpms-on-nop.html

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
    - shard-rkl:          [SKIP][407] ([i915#9934]) -> [SKIP][408] ([i915#14544] / [i915#9934]) +1 other test skip
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-3/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-6/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
    - shard-rkl:          [SKIP][409] ([i915#15643]) -> [SKIP][410] ([i915#14544] / [i915#15643]) +2 other tests skip
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-3/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-gtt:
    - shard-rkl:          [SKIP][411] ([i915#14544] / [i915#17428] / [i915#1825]) -> [SKIP][412] ([i915#17428] / [i915#1825]) +1 other test skip
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-gtt.html
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-onoff:
    - shard-rkl:          [SKIP][413] ([i915#17428]) -> [SKIP][414] ([i915#14544] / [i915#17428]) +24 other tests skip
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-3/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-onoff.html
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-draw-pwrite:
    - shard-rkl:          [SKIP][415] ([i915#14544] / [i915#17428]) -> [SKIP][416] ([i915#17428]) +26 other tests skip
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-draw-pwrite.html
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:
    - shard-rkl:          [SKIP][417] ([i915#15102]) -> [SKIP][418] ([i915#14544] / [i915#15102]) +17 other tests skip
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-rkl:          [SKIP][419] ([i915#17428] / [i915#1825]) -> [SKIP][420] ([i915#14544] / [i915#17428] / [i915#1825])
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-move:
    - shard-rkl:          [SKIP][421] ([i915#14544] / [i915#15102]) -> [SKIP][422] ([i915#15102]) +11 other tests skip
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-6/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-move.html
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-7/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-move.html

  * igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery:
    - shard-rkl:          [ABORT][423] ([i915#15132]) -> [FAIL][424] ([i915#17122] / [i915#17137])
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-6/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-7/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-mtlp:         [SKIP][425] ([i915#1187] / [i915#12713] / [i915#16490]) -> [SKIP][426] ([i915#12713] / [i915#16490])
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-mtlp-1/igt@kms_hdr@brightness-with-hdr.html
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-mtlp-4/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-hdr:
    - shard-rkl:          [SKIP][427] ([i915#16644] / [i915#3555] / [i915#8228]) -> [SKIP][428] ([i915#14544] / [i915#16644] / [i915#3555] / [i915#8228])
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-3/igt@kms_hdr@invalid-hdr.html
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-6/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-rkl:          [SKIP][429] ([i915#15459]) -> [SKIP][430] ([i915#14544] / [i915#15459])
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-3/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier:
    - shard-rkl:          [SKIP][431] ([i915#14544] / [i915#15709]) -> [SKIP][432] ([i915#15709])
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-6/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping:
    - shard-rkl:          [SKIP][433] ([i915#15709]) -> [SKIP][434] ([i915#14544] / [i915#15709])
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-3/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping.html
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-6/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-rkl:          [SKIP][435] ([i915#13958]) -> [SKIP][436] ([i915#13958] / [i915#14544])
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-3/igt@kms_plane_multiple@2x-tiling-none.html
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-6/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-rkl:          [SKIP][437] ([i915#9340]) -> [SKIP][438] ([i915#14544] / [i915#9340])
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-3/igt@kms_pm_lpsp@kms-lpsp.html
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-6/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-rkl:          [SKIP][439] ([i915#14544] / [i915#8430]) -> [SKIP][440] ([i915#8430])
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-6/igt@kms_pm_lpsp@screens-disabled.html
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf:
    - shard-rkl:          [SKIP][441] ([i915#11520]) -> [SKIP][442] ([i915#11520] / [i915#14544]) +1 other test skip
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-3/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf.html
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-6/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
    - shard-rkl:          [SKIP][443] ([i915#11520] / [i915#14544]) -> [SKIP][444] ([i915#11520]) +3 other tests skip
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-6/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-7/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr@fbc-psr-cursor-plane-move:
    - shard-rkl:          [SKIP][445] ([i915#1072] / [i915#14544] / [i915#9732]) -> [SKIP][446] ([i915#1072] / [i915#9732]) +4 other tests skip
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-6/igt@kms_psr@fbc-psr-cursor-plane-move.html
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@kms_psr@fbc-psr-cursor-plane-move.html

  * igt@kms_psr@psr2-primary-mmap-gtt:
    - shard-rkl:          [SKIP][447] ([i915#1072] / [i915#9732]) -> [SKIP][448] ([i915#1072] / [i915#14544] / [i915#9732]) +4 other tests skip
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-3/igt@kms_psr@psr2-primary-mmap-gtt.html
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-6/igt@kms_psr@psr2-primary-mmap-gtt.html

  * igt@kms_vrr@flip-dpms:
    - shard-rkl:          [SKIP][449] ([i915#15243] / [i915#3555]) -> [SKIP][450] ([i915#14544] / [i915#15243] / [i915#3555])
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-3/igt@kms_vrr@flip-dpms.html
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-6/igt@kms_vrr@flip-dpms.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-rkl:          [SKIP][451] ([i915#9906]) -> [SKIP][452] ([i915#14544] / [i915#9906])
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-3/igt@kms_vrr@seamless-rr-switch-virtual.html
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-6/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@prime_vgem@basic-fence-read:
    - shard-rkl:          [SKIP][453] ([i915#14544] / [i915#17448] / [i915#3291] / [i915#3708]) -> [SKIP][454] ([i915#17448] / [i915#3291] / [i915#3708])
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-6/igt@prime_vgem@basic-fence-read.html
   [454]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@fence-write-hang:
    - shard-rkl:          [SKIP][455] ([i915#14544] / [i915#17448] / [i915#3708]) -> [SKIP][456] ([i915#17448] / [i915#3708])
   [455]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-6/igt@prime_vgem@fence-write-hang.html
   [456]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@prime_vgem@fence-write-hang.html

  
  [i915#10056]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10056
  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
  [i915#10647]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#11151]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#11680]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11680
  [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
  [i915#1187]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187
  [i915#12169]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12169
  [i915#12177]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12177
  [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
  [i915#12343]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343
  [i915#12358]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12358
  [i915#12454]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12454
  [i915#12655]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655
  [i915#12712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12712
  [i915#12713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713
  [i915#12745]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745
  [i915#12805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805
  [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
  [i915#13356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356
  [i915#13566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566
  [i915#13748]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748
  [i915#13820]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13820
  [i915#13958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958
  [i915#14073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073
  [i915#14098]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098
  [i915#14152]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14152
  [i915#14544]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544
  [i915#14600]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14600
  [i915#14712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712
  [i915#15073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073
  [i915#15102]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102
  [i915#15132]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132
  [i915#15243]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243
  [i915#15330]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330
  [i915#15458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458
  [i915#15459]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459
  [i915#15500]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15500
  [i915#15582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582
  [i915#15643]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643
  [i915#15672]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15672
  [i915#15678]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15678
  [i915#15709]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709
  [i915#15725]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15725
  [i915#15733]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15733
  [i915#15739]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15739
  [i915#15865]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865
  [i915#15948]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948
  [i915#15989]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989
  [i915#15990]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990
  [i915#16081]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081
  [i915#16182]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16182
  [i915#16184]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16184
  [i915#16348]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16348
  [i915#16361]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361
  [i915#16420]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16420
  [i915#16471]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471
  [i915#16490]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16490
  [i915#16644]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644
  [i915#16867]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16867
  [i915#16871]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16871
  [i915#17101]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17101
  [i915#17108]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17108
  [i915#17122]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17122
  [i915#17137]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17137
  [i915#17158]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17158
  [i915#17175]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17175
  [i915#17183]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17183
  [i915#17188]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17188
  [i915#17214]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17214
  [i915#17285]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17285
  [i915#17288]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17288
  [i915#17416]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17416
  [i915#17427]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427
  [i915#17428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428
  [i915#17431]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17431
  [i915#17432]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17432
  [i915#17434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17434
  [i915#17447]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17447
  [i915#17448]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17448
  [i915#17450]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17450
  [i915#17454]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17454
  [i915#17455]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17455
  [i915#17457]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17457
  [i915#17458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17458
  [i915#17462]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17462
  [i915#17467]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17467
  [i915#17478]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17478
  [i915#17479]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17479
  [i915#17480]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17480
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
  [i915#17499]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17499
  [i915#17500]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17500
  [i915#17502]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17502
  [i915#17503]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17503
  [i915#17504]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17504
  [i915#17505]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17505
  [i915#17506]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17506
  [i915#17507]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17507
  [i915#17508]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17508
  [i915#17510]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17510
  [i915#17512]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17512
  [i915#17513]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17513
  [i915#17517]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17517
  [i915#17520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17520
  [i915#17521]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17521
  [i915#17522]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17522
  [i915#17524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17524
  [i915#17525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17525
  [i915#17526]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17526
  [i915#17527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17527
  [i915#17528]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17528
  [i915#17529]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17529
  [i915#17533]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17533
  [i915#17534]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17534
  [i915#17536]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17536
  [i915#17537]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17537
  [i915#17538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17538
  [i915#17540]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17540
  [i915#17541]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17541
  [i915#17544]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17544
  [i915#17545]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17545
  [i915#17546]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17546
  [i915#17547]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17547
  [i915#17548]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17548
  [i915#17554]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17554
  [i915#17555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17555
  [i915#17562]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17562
  [i915#17567]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17567
  [i915#17568]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17568
  [i915#17569]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17569
  [i915#17570]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17570
  [i915#17580]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17580
  [i915#17581]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17581
  [i915#17582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17582
  [i915#17583]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17583
  [i915#17586]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17586
  [i915#17616]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17616
  [i915#17617]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17617
  [i915#17664]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17664
  [i915#17666]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17666
  [i915#17673]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17673
  [i915#17679]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17679
  [i915#17688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17688
  [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
  [i915#17699]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17699
  [i915#17703]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17703
  [i915#17704]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17704
  [i915#17705]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17705
  [i915#17710]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17710
  [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
  [i915#2436]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2436
  [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
  [i915#2658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658
  [i915#2856]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
  [i915#3116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
  [i915#3539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#3711]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3711
  [i915#3828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
  [i915#4349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349
  [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
  [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#4812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812
  [i915#4817]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817
  [i915#4839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839
  [i915#4852]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852
  [i915#4879]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4879
  [i915#5138]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138
  [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
  [i915#6245]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245
  [i915#6301]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301
  [i915#6334]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334
  [i915#6524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
  [i915#658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658
  [i915#7707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707
  [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
  [i915#7984]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984
  [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
  [i915#8399]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399
  [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
  [i915#8430]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430
  [i915#8555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555
  [i915#8623]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623
  [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
  [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
  [i915#9340]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340
  [i915#9561]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9561
  [i915#9683]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812
  [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
  [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934


Build changes
-------------

  * Linux: CI_DRM_19487 -> Patchwork_177601v3

  CI-20190529: 20190529
  CI_DRM_19487: 2ccdda2d799a18f4f5aae513e475bc6b937760f0 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_9186: 9186
  Patchwork_177601v3: 2ccdda2d799a18f4f5aae513e475bc6b937760f0 @ git://anongit.freedesktop.org/gfx-ci/linux
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/index.html

--===============0250933209392593112==
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
<tr><td><b>Series:</b></td><td>gpu/buddy: restore two-pass clear/dirty guard for range-biased allocation (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/177601/">https://patchwork.freedesktop.org/series/177601/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_19487_full -&gt; Patchwork_177601v3_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_177601v3_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-reloc-purge-cache:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@api_intel_bb@blit-reloc-purge-cache.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-cold-reset-rebind:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk2/igt@device_reset@unbind-cold-reset-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17537">i915#17537</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-compressed:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk2/igt@gem_ccs@block-multicopy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17499">i915#17499</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@large-ctrl-surf-copy:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk10/igt@gem_ccs@large-ctrl-surf-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17499">i915#17499</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-dg2-4/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-dg2-6/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16348">i915#16348</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-process:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk11/igt@gem_close_race@multigpu-basic-process.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17568">i915#17568</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-big:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk11/igt@gem_create@create-ext-cpu-access-big.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17513">i915#17513</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_freq@sysfs@gt0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-dg2-3/igt@gem_ctx_freq@sysfs@gt0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-dg2-8/igt@gem_ctx_freq@sysfs@gt0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9561">i915#9561</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@hang:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk10/igt@gem_ctx_persistence@hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17527">i915#17527</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-hang:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-dg1-17/igt@gem_ctx_persistence@heartbeat-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555">i915#8555</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-hang@blt:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk11/igt@gem_ctx_persistence@legacy-engines-hang@blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17527">i915#17527</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@engines:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk3/igt@gem_ctx_sseu@engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17496">i915#17496</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-false-hang:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-dg1-17/igt@gem_exec_balancer@bonded-false-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-in-fence:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk10/igt@gem_exec_balancer@parallel-keep-in-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17547">i915#17547</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-7/igt@gem_exec_balancer@parallel-ordering.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-tglu-2/igt@gem_exec_balancer@parallel-ordering.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk11/igt@gem_exec_capture@capture-invisible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334">i915#6334</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-cmd:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3711">i915#3711</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-uc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-dg1-17/igt@gem_exec_flush@basic-batch-kernel-default-uc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852">i915#4852</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@larger-than-life-batch:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk8/igt@gem_exec_params@larger-than-life-batch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16871">i915#16871</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-wc-noreloc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-dg1-17/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-range-active:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@gem_exec_reloc@basic-range-active.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi-ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk3/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17503">i915#17503</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-multi:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk11/igt@gem_lmem_swapping@parallel-multi.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17503">i915#17503</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk10/igt@gem_lmem_swapping@parallel-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17503">i915#17503</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-7/igt@gem_lmem_swapping@parallel-random-verify-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-tglu-2/igt@gem_lmem_swapping@parallel-random-verify-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@coherency:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk10/igt@gem_mmap_gtt@coherency.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17582">i915#17582</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@fault-concurrent-y:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-dg1-17/igt@gem_mmap_gtt@fault-concurrent-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@read:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-dg1-17/igt@gem_mmap_wc@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-snoop:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-7/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk2/igt@gem_pread@exhaustion.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658">i915#2658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-protected-buffer:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk11/igt@gem_pxp@create-protected-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17521">i915#17521</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-valid-protected-context:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk10/igt@gem_pxp@create-valid-protected-context.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17521">i915#17521</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@fail-invalid-protected-context:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-dg1-17/igt@gem_pxp@fail-invalid-protected-context.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk3/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17492">i915#17492</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-to-vebox-x-tiled:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk10/igt@gem_render_copy@y-tiled-to-vebox-x-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17492">i915#17492</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-to-vebox-x-tiled:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk11/igt@gem_render_copy@yf-tiled-to-vebox-x-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17492">i915#17492</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_pwrite:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-dg1-17/igt@gem_set_tiling_vs_pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_unfence_active_buffers:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-dg1-17/igt@gem_unfence_active_buffers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4879">i915#4879</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-unsync:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-7/igt@gem_userptr_blits@coherency-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-tglu-2/igt@gem_userptr_blits@coherency-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@forbidden-operations:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-7/igt@gem_userptr_blits@forbidden-operations.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-pwrite-unsync:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk10/igt@gem_userptr_blits@readonly-pwrite-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17507">i915#17507</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-fd:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-7/igt@gem_workarounds@suspend-resume-fd.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-3/igt@gem_workarounds@suspend-resume-fd.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@gen3_mixed_blits:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk11/igt@gen3_mixed_blits.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17688">i915#17688</a>)</li>
</ul>
</li>
<li>
<p>igt@gen3_render_linear_blits:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk10/igt@gen3_render_linear_blits.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17555">i915#17555</a>)</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-allowed:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@gen7_exec_parse@basic-allowed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17455">i915#17455</a>)</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@cmd-crossing-page:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk11/igt@gen7_exec_parse@cmd-crossing-page.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17505">i915#17505</a>)</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@load-register-reg:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk10/igt@gen7_exec_parse@load-register-reg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17505">i915#17505</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-invalid-length:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-dg1-17/igt@gen9_exec_parse@batch-invalid-length.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@unaligned-jump:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-tglu-2/igt@gen9_exec_parse@unaligned-jump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>) +2 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-7/igt@gen9_exec_parse@unaligned-jump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gpu_buddy@gpu_buddy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@gpu_buddy@gpu_buddy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15678">i915#15678</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@most-busy-idle-check-all@rcs0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-dg1-17/igt@i915_drm_fdinfo@most-busy-idle-check-all@rcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073">i915#14073</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_hangman@engine-engine-error@bcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk3/igt@i915_hangman@engine-engine-error@bcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17580">i915#17580</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-basic-api:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk10/igt@i915_pm_freq_api@freq-basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17526">i915#17526</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-reset-multiple:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-tglu-5/igt@i915_pm_freq_api@freq-reset-multiple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399">i915#8399</a>)</li>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk11/igt@i915_pm_freq_api@freq-reset-multiple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17526">i915#17526</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-suspend@gt0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-dg2-3/igt@i915_pm_freq_api@freq-suspend@gt0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-dg2-3/igt@i915_pm_freq_api@freq-suspend@gt0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13820">i915#13820</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_mult@media-freq:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk11/igt@i915_pm_freq_mult@media-freq.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17699">i915#17699</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@media-rc6-accuracy:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk10/igt@i915_pm_rc6_residency@media-rc6-accuracy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17541">i915#17541</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress-pc8:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-dg1-17/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17434">i915#17434</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17450">i915#17450</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds-idle-park:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-dg1-17/igt@i915_pm_rps@thresholds-idle-park.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681">i915#11681</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@test-query-geometry-subslices:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk11/igt@i915_query@test-query-geometry-subslices.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17673">i915#17673</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@debugfs-reader:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk8/igt@i915_suspend@debugfs-reader.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16182">i915#16182</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-untiled:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk11/igt@i915_suspend@fence-restore-untiled.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16182">i915#16182</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk2/igt@intel_hwmon@hwmon-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11680">i915#11680</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12454">i915#12454</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12712">i915#12712</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk11/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17562">i915#17562</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk10/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17485">i915#17485</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-7/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +3 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-tglu-2/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17432">i915#17432</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-dg1-17/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk11/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17478">i915#17478</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk3/igt@kms_big_fb@4-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17544">i915#17544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-mtlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15733">i915#15733</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138">i915#5138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk10/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17478">i915#17478</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17478">i915#17478</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-dg1-17/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-dg1-17/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk3/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17524">i915#17524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk10/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17500">i915#17500</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk11/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17500">i915#17500</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-tglu-5/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17431">i915#17431</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17500">i915#17500</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-7/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-tglu-2/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17432">i915#17432</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-dg1-15/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-7/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17432">i915#17432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-dg2-4/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +51 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk10/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17491">i915#17491</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk11/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17490">i915#17490</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17491">i915#17491</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk11/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17491">i915#17491</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-7/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk10/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17490">i915#17490</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17491">i915#17491</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk10/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17525">i915#17525</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805">i915#12805</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-dg1-15/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +86 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17490">i915#17490</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17491">i915#17491</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-dg2-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk2/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582">i915#15582</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-tglu-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) +2 other tests skip</li>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk11/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17525">i915#17525</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-dg1-17/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-dg2-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434">i915#10434</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-tglu-2/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-7/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +57 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk3/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17491">i915#17491</a>) +48 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio-edid:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk10/igt@kms_chamelium_audio@dp-audio-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17483">i915#17483</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-after-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@kms_chamelium_audio@hdmi-audio-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk11/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17489">i915#17489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk10/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17489">i915#17489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk3/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17489">i915#17489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk2/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17497">i915#17497</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-dg1-17/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk10/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17497">i915#17497</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-tglu-5/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) +1 other test skip</li>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk11/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17497">i915#17497</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk11/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17483">i915#17483</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-mode-timings:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-dg1-17/igt@kms_chamelium_edid@hdmi-mode-timings.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk3/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17483">i915#17483</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-fast:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@kms_chamelium_hpd@dp-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-fast:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-tglu-5/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk11/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17510">i915#17510</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-ctm3x4:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk10/igt@kms_color_pipeline@plane-lut1d-ctm3x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17510">i915#17510</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk8/igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17510">i915#17510</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk3/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17508">i915#17508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1-suspend-resume:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk3/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17502">i915#17502</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk10/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17508">i915#17508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-dg1-17/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-tglu-5/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>)</li>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk11/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17508">i915#17508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x10:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-dg1-15/igt@kms_cursor_crc@cursor-offscreen-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk11/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17533">i915#17533</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk2/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17533">i915#17533</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x42@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-8/igt@kms_cursor_crc@cursor-onscreen-128x42@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x32:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@kms_cursor_crc@cursor-onscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x10:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk3/igt@kms_cursor_crc@cursor-random-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17504">i915#17504</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-tglu-5/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk11/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17504">i915#17504</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-7/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-tglu-2/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk10/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17533">i915#17533</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk10/igt@kms_cursor_crc@cursor-sliding-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17504">i915#17504</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-3/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-6/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12358">i915#12358</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14152">i915#14152</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-7/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) +44 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-tglu-2/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17454">i915#17454</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-dg1-17/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17457">i915#17457</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev@basic:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk10/igt@kms_dp_aux_dev@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17538">i915#17538</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk2/igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17616">i915#17616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk11/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17664">i915#17664</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-tglu-5/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17288">i915#17288</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst-direct-train:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk8/igt@kms_dp_link_training@non-uhbr-sst-direct-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17506">i915#17506</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-dg1-17/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748">i915#13748</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst-tbtalt-train:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@kms_dp_link_training@uhbr-sst-tbtalt-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17285">i915#17285</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk10/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17548">i915#17548</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk10/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17458">i915#17458</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-ultrajoiner:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk11/igt@kms_dsc@dsc-fractional-bpp-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17458">i915#17458</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc-ultrajoiner:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk3/igt@kms_dsc@dsc-fractional-bpp-with-bpc-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17458">i915#17458</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-7/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-tglu-2/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk3/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17581">i915#17581</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081">i915#16081</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-tglu-5/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081">i915#16081</a>)</li>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk11/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17679">i915#17679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk8/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17666">i915#17666</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk10/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17570">i915#17570</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-7/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-dg1-15/igt@kms_flip@2x-flip-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk11/igt@kms_flip@2x-flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17183">i915#17183</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk11/igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a1-hdmi-a2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17183">i915#17183</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-tglu-5/igt@kms_flip@2x-plain-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-glk5/igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk8/igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14600">i915#14600</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-mtlp-7/igt@kms_flip@flip-vs-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-mtlp-4/igt@kms_flip@flip-vs-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17214">i915#17214</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-tglu-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk11/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17522">i915#17522</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk10/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17493">i915#17493</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17484">i915#17484</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17493">i915#17493</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-mtlp-8/igt@kms_force_connector_basic@force-connector-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-mtlp-1/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15672">i915#15672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-dg1-17/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-3/igt@kms_frontbuffer_tracking@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10056">i915#10056</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk3/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17517">i915#17517</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-mmap-cpu:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-glk8/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-mmap-cpu.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk6/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17517">i915#17517</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-tiling-linear:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-tiling-linear.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@kms_frontbuffer_tracking@fbchdr-tiling-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk11/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17482">i915#17482</a>) +39 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-tglu-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk8/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-indfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17482">i915#17482</a>) +52 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-tglu-2/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-modesetfrombusy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-dg1-15/igt@kms_frontbuffer_tracking@hdr-modesetfrombusy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk10/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17534">i915#17534</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-dg1-15/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-tglu-2/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-cur-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) +38 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk10/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17482">i915#17482</a>) +43 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-slowdraw:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-7/igt@kms_frontbuffer_tracking@psrhdr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-tglu-2/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17101">i915#17101</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17108">i915#17108</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17188">i915#17188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk3/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17512">i915#17512</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458">i915#15458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk10/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17567">i915#17567</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk2/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17617">i915#17617</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-7/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301">i915#6301</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-tglu-2/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301">i915#6301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk2/igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17540">i915#17540</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-4tiled:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-7/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712">i915#14712</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-tglu-2/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712">i915#14712</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk3/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17479">i915#17479</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk11/igt@kms_plane@pixel-format-4-tiled-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17479">i915#17479</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-tglu-2/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-7/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-dg1-17/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk10/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17479">i915#17479</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier@pipe-a-plane-4:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk8/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier@pipe-a-plane-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17494">i915#17494</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-transparent-fb:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk3/igt@kms_plane_alpha_blend@alpha-transparent-fb.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647">i915#10647</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12177">i915#12177</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-max:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk8/igt@kms_plane_alpha_blend@constant-alpha-max.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647">i915#10647</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12169">i915#12169</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk8/igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647">i915#10647</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk10/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17586">i915#17586</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk10/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17529">i915#17529</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk10/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17528">i915#17528</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk3/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17528">i915#17528</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-b:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk3/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17529">i915#17529</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk11/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17462">i915#17462</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-tglu-5/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812">i915#9812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-7/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948">i915#15948</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-tglu-2/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948">i915#15948</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk11/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17703">i915#17703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15739">i915#15739</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@screens-disabled:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-dg1-17/igt@kms_pm_lpsp@screens-disabled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430">i915#8430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-dg2-4/igt@kms_pm_rpm@dpms-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-dg2-8/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-tglu-5/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-dg1-16/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-dg1-14/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-6/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@pc8-residency:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk8/igt@kms_pm_rpm@pc8-residency.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17710">i915#17710</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-hybrid:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-7/igt@kms_prime@basic-crc-hybrid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-tglu-2/igt@kms_prime@basic-crc-hybrid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@d3hot:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk10/igt@kms_prime@d3hot.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17569">i915#17569</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-dg1-17/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk10/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk2/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-tglu-2/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk11/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk10/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17546">i915#17546</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-7/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915#9683</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-tglu-2/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@kms_psr@fbc-pr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-render:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-tglu-5/igt@kms_psr@fbc-pr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-render:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk11/igt@kms_psr@fbc-psr-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17480">i915#17480</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk10/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17480">i915#17480</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-no-drrs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk2/igt@kms_psr@pr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17480">i915#17480</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk10/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17480">i915#17480</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-mmap-gtt:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk3/igt@kms_psr@psr-primary-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17480">i915#17480</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-blt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-dg1-15/igt@kms_psr@psr2-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk10/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17554">i915#17554</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk11/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15500">i915#15500</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16184">i915#16184</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-7/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-tglu-2/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17432">i915#17432</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk10/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17488">i915#17488</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623">i915#8623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17705">i915#17705</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk10/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17520">i915#17520</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@gen12-oa-tlb-invalidate:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk10/igt@perf@gen12-oa-tlb-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17536">i915#17536</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@gen12-unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk2/igt@perf@gen12-unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17536">i915#17536</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@gen8-unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-7/igt@perf@gen8-unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2436">i915#2436</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@per-context-mode-unprivileged:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk11/igt@perf@per-context-mode-unprivileged.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17704">i915#17704</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-tglu-5/igt@perf@per-context-mode-unprivileged.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17455">i915#17455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-mtlp-1/igt@perf_pmu@busy-double-start.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-mtlp-2/igt@perf_pmu@busy-double-start.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@event-wait@rcs0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-7/igt@perf_pmu@event-wait@rcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17416">i915#17416</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-tglu-2/igt@perf_pmu@event-wait@rcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17416">i915#17416</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-all-gts:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk3/igt@perf_pmu@rc6-all-gts.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17583">i915#17583</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_udl@share-import:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-7/igt@prime_udl@share-import.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16420">i915#16420</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-tglu-2/igt@prime_udl@share-import.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16420">i915#16420</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-dg1-17/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@coherency-gtt:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk2/igt@prime_vgem@coherency-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17467">i915#17467</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-read-hang:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk11/igt@prime_vgem@fence-read-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17467">i915#17467</a>)</li>
</ul>
</li>
<li>
<p>igt@tools_test@sysfs_l3_parity:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk11/igt@tools_test@sysfs_l3_parity.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17545">i915#17545</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-tglu-5/igt@tools_test@sysfs_l3_parity.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17447">i915#17447</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_parallel@engines@userptr:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-dg1-14/igt@gem_exec_parallel@engines@userptr.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-dg1-15/igt@gem_exec_parallel@engines@userptr.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-context:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-4/igt@gem_workarounds@suspend-resume-context.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@gem_workarounds@suspend-resume-context.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_power@sanity:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-mtlp-7/igt@i915_power@sanity.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984">i915#7984</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-mtlp-1/igt@i915_power@sanity.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-3/igt@kms_color@deep-color.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655">i915#12655</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-6/igt@kms_color@deep-color.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-glk5/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17517">i915#17517</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-glk8/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-pgflip-blt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-3/igt@kms_frontbuffer_tracking@hdr-1p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-1p-pri-indfb-multidraw.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-mtlp-1/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15725">i915#15725</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-mtlp-2/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-dg1-19/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-dg1-15/igt@kms_pm_rpm@dpms-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-8/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-3/igt@kms_pm_rpm@modeset-non-lpsp.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-reloc-keep-cache:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-3/igt@api_intel_bb@blit-reloc-keep-cache.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i915#8411</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-6/igt@api_intel_bb@blit-reloc-keep-cache.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-3/igt@gem_ccs@ctrl-surf-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-6/igt@gem_ccs@ctrl-surf-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-balancer:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-3/igt@gem_exec_balancer@parallel-balancer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-6/igt@gem_exec_balancer@parallel-balancer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-master:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-3/igt@gem_exec_params@secure-non-master.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17416">i915#17416</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-6/igt@gem_exec_params@secure-non-master.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17416">i915#17416</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-wc-noreloc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-3/igt@gem_exec_reloc@basic-write-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-6/igt@gem_exec_reloc@basic-write-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-6/igt@gem_lmem_swapping@heavy-verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@gem_lmem_swapping@heavy-verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-3/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-6/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-3/igt@gem_partial_pwrite_pread@writes-after-reads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-6/igt@gem_partial_pwrite_pread@writes-after-reads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_pwrite:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-6/igt@gem_set_tiling_vs_pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@gem_set_tiling_vs_pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-3/igt@gen9_exec_parse@allowed-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-6/igt@gen9_exec_parse@allowed-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-invalid-length:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-6/igt@gen9_exec_parse@batch-invalid-length.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@gen9_exec_parse@batch-invalid-length.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress-pc8:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-6/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17434">i915#17434</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17450">i915#17450</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17434">i915#17434</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17450">i915#17450</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@hwconfig_table:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-6/igt@i915_query@hwconfig_table.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245">i915#6245</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-7/igt@i915_query@hwconfig_table.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245">i915#6245</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-6/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707">i915#7707</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707">i915#7707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-6/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-3/igt@kms_big_fb@4-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-6/igt@kms_big_fb@4-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-6/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17431">i915#17431</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17431">i915#17431</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-3/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17431">i915#17431</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-6/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17431">i915#17431</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-6/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-6/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-3/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-6/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-3/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-6/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-mtlp-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17158">i915#17158</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-mtlp-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-edp-1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17175">i915#17175</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-3/igt@kms_chamelium_audio@dp-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-6/igt@kms_chamelium_audio@dp-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-3/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-6/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-6/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-mode-timings:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-6/igt@kms_chamelium_edid@hdmi-mode-timings.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@kms_chamelium_edid@hdmi-mode-timings.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-6/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-7/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x32:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-3/igt@kms_cursor_crc@cursor-sliding-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst-direct-train:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-3/igt@kms_dp_link_training@uhbr-mst-direct-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17285">i915#17285</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-6/igt@kms_dp_link_training@uhbr-mst-direct-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17285">i915#17285</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-6/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748">i915#13748</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748">i915#13748</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-6/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16867">i915#16867</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-7/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16867">i915#16867</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-3/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658">i915#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-6/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-6/igt@kms_flip@2x-flip-vs-dpms-on-nop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@kms_flip@2x-flip-vs-dpms-on-nop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset-vs-hang:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-3/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-6/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-3/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-3/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-6/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-7/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-6/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132">i915#15132</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-7/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17122">i915#17122</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17137">i915#17137</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-mtlp-1/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187">i915#1187</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#12713</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16490">i915#16490</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-mtlp-4/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#12713</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16490">i915#16490</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-3/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644">i915#16644</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-6/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644">i915#16644</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-3/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459">i915#15459</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459">i915#15459</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-6/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-3/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-6/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-3/igt@kms_plane_multiple@2x-tiling-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-6/igt@kms_plane_multiple@2x-tiling-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-3/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340">i915#9340</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-6/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340">i915#9340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@screens-disabled:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-6/igt@kms_pm_lpsp@screens-disabled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430">i915#8430</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@kms_pm_lpsp@screens-disabled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430">i915#8430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-3/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-6/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-6/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-7/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-plane-move:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-6/igt@kms_psr@fbc-psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@kms_psr@fbc-psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-3/igt@kms_psr@psr2-primary-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-6/igt@kms_psr@psr2-primary-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-3/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243">i915#15243</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-6/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243">i915#15243</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-3/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-6/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-6/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17448">i915#17448</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17448">i915#17448</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-write-hang:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19487/shard-rkl-6/igt@prime_vgem@fence-write-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17448">i915#17448</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177601v3/shard-rkl-5/igt@prime_vgem@fence-write-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17448">i915#17448</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_19487 -&gt; Patchwork_177601v3</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19487: 2ccdda2d799a18f4f5aae513e475bc6b937760f0 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_9186: 9186<br />
  Patchwork_177601v3: 2ccdda2d799a18f4f5aae513e475bc6b937760f0 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============0250933209392593112==--
