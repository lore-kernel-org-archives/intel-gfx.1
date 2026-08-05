Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DF18C2A09B
	for <intel-gfx@archiver.kernel.org>; Wed,  5 Aug 2026 02:45:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ACDD10E131;
	Wed,  5 Aug 2026 02:45:54 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2B0F10E131;
 Wed,  5 Aug 2026 02:45:52 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0844161029450840188=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EFull=3A_success_for_SKL=5FDSSM_/_DE=5FCAP_fi?=
 =?utf-8?q?xes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Micha=C5=82_Grzelak?= <michal.grzelak@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Wed, 05 Aug 2026 02:45:52 -0000
Message-ID: <178589795269.19930.13177177533677131213@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260803214909.3076716-1-michal.grzelak@intel.com>
In-Reply-To: <20260803214909.3076716-1-michal.grzelak@intel.com>
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

--===============0844161029450840188==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: SKL_DSSM / DE_CAP fixes
URL   : https://patchwork.freedesktop.org/series/171534/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_18941_full -> Patchwork_171534v1_full
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

  Here are the changes found in Patchwork_171534v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@object-reloc-keep-cache:
    - shard-rkl:          NOTRUN -> [SKIP][1] ([i915#8411])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-8/igt@api_intel_bb@object-reloc-keep-cache.html

  * igt@device_reset@cold-reset-bound:
    - shard-tglu-1:       NOTRUN -> [SKIP][2] ([i915#11078])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-tglu-1/igt@device_reset@cold-reset-bound.html

  * igt@gem_basic@multigpu-create-close:
    - shard-rkl:          NOTRUN -> [SKIP][3] ([i915#7697])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-4/igt@gem_basic@multigpu-create-close.html
    - shard-dg2:          NOTRUN -> [SKIP][4] ([i915#7697])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@gem_basic@multigpu-create-close.html

  * igt@gem_ccs@suspend-resume@tile64-compressed-compfmt0-smem-lmem0:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][5] ([i915#13356] / [i915#16348])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-4/igt@gem_ccs@suspend-resume@tile64-compressed-compfmt0-smem-lmem0.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-tglu:         NOTRUN -> [SKIP][6] ([i915#7697])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-tglu-9/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-tglu-1:       NOTRUN -> [SKIP][7] ([i915#6335])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-tglu-1/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_ctx_sseu@engines:
    - shard-dg2:          NOTRUN -> [SKIP][8] ([i915#280])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@gem_ctx_sseu@engines.html
    - shard-rkl:          NOTRUN -> [SKIP][9] ([i915#280])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-4/igt@gem_ctx_sseu@engines.html

  * igt@gem_eio@execbuf:
    - shard-dg1:          [PASS][10] -> [DMESG-WARN][11] ([i915#4423]) +3 other tests dmesg-warn
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg1-14/igt@gem_eio@execbuf.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg1-19/igt@gem_eio@execbuf.html

  * igt@gem_exec_balancer@invalid-bonds:
    - shard-dg2:          NOTRUN -> [SKIP][12] ([i915#4036])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@gem_exec_balancer@invalid-bonds.html

  * igt@gem_exec_balancer@parallel-keep-submit-fence:
    - shard-tglu-1:       NOTRUN -> [SKIP][13] ([i915#4525])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-tglu-1/igt@gem_exec_balancer@parallel-keep-submit-fence.html

  * igt@gem_exec_balancer@parallel-out-fence:
    - shard-rkl:          NOTRUN -> [SKIP][14] ([i915#4525])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-8/igt@gem_exec_balancer@parallel-out-fence.html

  * igt@gem_exec_capture@capture-invisible:
    - shard-glk10:        NOTRUN -> [SKIP][15] ([i915#6334]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-glk10/igt@gem_exec_capture@capture-invisible.html

  * igt@gem_exec_reloc@basic-concurrent16:
    - shard-rkl:          NOTRUN -> [SKIP][16] ([i915#3281]) +5 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-8/igt@gem_exec_reloc@basic-concurrent16.html

  * igt@gem_exec_schedule@semaphore-power:
    - shard-rkl:          NOTRUN -> [SKIP][17] ([i915#7276])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-8/igt@gem_exec_schedule@semaphore-power.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][18] ([i915#4860])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html

  * igt@gem_lmem_swapping@heavy-random:
    - shard-glk:          NOTRUN -> [SKIP][19] ([i915#4613]) +2 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-glk3/igt@gem_lmem_swapping@heavy-random.html

  * igt@gem_lmem_swapping@random-engines:
    - shard-tglu:         NOTRUN -> [SKIP][20] ([i915#4613]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-tglu-9/igt@gem_lmem_swapping@random-engines.html

  * igt@gem_lmem_swapping@verify-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][21] ([i915#4613]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-8/igt@gem_lmem_swapping@verify-ccs.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
    - shard-rkl:          NOTRUN -> [SKIP][22] ([i915#3282]) +4 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-8/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html

  * igt@gem_pread@exhaustion:
    - shard-glk:          NOTRUN -> [WARN][23] ([i915#2658])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-glk6/igt@gem_pread@exhaustion.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-tglu:         NOTRUN -> [WARN][24] ([i915#2658])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-tglu-9/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@fail-invalid-protected-context:
    - shard-dg2:          NOTRUN -> [SKIP][25] ([i915#4270])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@gem_pxp@fail-invalid-protected-context.html

  * igt@gem_readwrite@write-bad-handle:
    - shard-dg2:          NOTRUN -> [SKIP][26] ([i915#3282]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@gem_readwrite@write-bad-handle.html

  * igt@gem_tiling_max_stride:
    - shard-dg2:          NOTRUN -> [SKIP][27] ([i915#4077]) +4 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@gem_tiling_max_stride.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-rkl:          NOTRUN -> [SKIP][28] ([i915#3297])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-8/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-tglu:         NOTRUN -> [SKIP][29] ([i915#3297])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-tglu-9/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-glk11:        NOTRUN -> [INCOMPLETE][30] ([i915#13356] / [i915#14586])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-glk11/igt@gem_workarounds@suspend-resume-fd.html

  * igt@gen7_exec_parse@bitmasks:
    - shard-glk10:        NOTRUN -> [SKIP][31] +123 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-glk10/igt@gen7_exec_parse@bitmasks.html

  * igt@gen9_exec_parse@basic-rejected-ctx-param:
    - shard-tglu:         NOTRUN -> [SKIP][32] ([i915#2527] / [i915#2856])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-tglu-9/igt@gen9_exec_parse@basic-rejected-ctx-param.html

  * igt@gen9_exec_parse@bb-start-far:
    - shard-tglu-1:       NOTRUN -> [SKIP][33] ([i915#2527] / [i915#2856]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-tglu-1/igt@gen9_exec_parse@bb-start-far.html

  * igt@gen9_exec_parse@bb-start-param:
    - shard-rkl:          NOTRUN -> [SKIP][34] ([i915#2527])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-8/igt@gen9_exec_parse@bb-start-param.html

  * igt@i915_module_load@load:
    - shard-dg2:          ([PASS][35], [PASS][36], [PASS][37], [PASS][38], [PASS][39], [PASS][40], [PASS][41], [PASS][42], [PASS][43], [PASS][44], [PASS][45], [PASS][46], [PASS][47], [PASS][48], [PASS][49], [PASS][50], [PASS][51], [PASS][52], [PASS][53], [PASS][54], [PASS][55], [PASS][56], [PASS][57], [PASS][58], [PASS][59]) -> ([PASS][60], [PASS][61], [PASS][62], [PASS][63], [PASS][64], [PASS][65], [PASS][66], [PASS][67], [PASS][68], [PASS][69], [PASS][70], [PASS][71], [PASS][72], [PASS][73], [PASS][74], [PASS][75], [PASS][76], [PASS][77], [PASS][78], [PASS][79], [PASS][80], [PASS][81], [PASS][82], [PASS][83], [DMESG-WARN][84]) ([i915#16759])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-3/igt@i915_module_load@load.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-8/igt@i915_module_load@load.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-1/igt@i915_module_load@load.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-6/igt@i915_module_load@load.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-1/igt@i915_module_load@load.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-8/igt@i915_module_load@load.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-10/igt@i915_module_load@load.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-5/igt@i915_module_load@load.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-8/igt@i915_module_load@load.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-1/igt@i915_module_load@load.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-10/igt@i915_module_load@load.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-6/igt@i915_module_load@load.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-4/igt@i915_module_load@load.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-4/igt@i915_module_load@load.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-3/igt@i915_module_load@load.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-7/igt@i915_module_load@load.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-4/igt@i915_module_load@load.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-10/igt@i915_module_load@load.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-3/igt@i915_module_load@load.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-7/igt@i915_module_load@load.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-7/igt@i915_module_load@load.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-3/igt@i915_module_load@load.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-10/igt@i915_module_load@load.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-5/igt@i915_module_load@load.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-5/igt@i915_module_load@load.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-4/igt@i915_module_load@load.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-4/igt@i915_module_load@load.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-6/igt@i915_module_load@load.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-5/igt@i915_module_load@load.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-8/igt@i915_module_load@load.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@i915_module_load@load.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-8/igt@i915_module_load@load.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-6/igt@i915_module_load@load.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@i915_module_load@load.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-1/igt@i915_module_load@load.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-7/igt@i915_module_load@load.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-7/igt@i915_module_load@load.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-8/igt@i915_module_load@load.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-3/igt@i915_module_load@load.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-4/igt@i915_module_load@load.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-7/igt@i915_module_load@load.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-5/igt@i915_module_load@load.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-4/igt@i915_module_load@load.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-5/igt@i915_module_load@load.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-6/igt@i915_module_load@load.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-1/igt@i915_module_load@load.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-3/igt@i915_module_load@load.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@i915_module_load@load.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-1/igt@i915_module_load@load.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@i915_module_load@load.html

  * igt@i915_pm_freq_api@freq-reset-multiple:
    - shard-tglu:         NOTRUN -> [SKIP][85] ([i915#8399])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-tglu-9/igt@i915_pm_freq_api@freq-reset-multiple.html

  * igt@i915_pm_freq_mult@media-freq@gt0:
    - shard-tglu-1:       NOTRUN -> [SKIP][86] ([i915#6590]) +1 other test skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-tglu-1/igt@i915_pm_freq_mult@media-freq@gt0.html

  * igt@i915_pm_rps@thresholds:
    - shard-dg2:          NOTRUN -> [SKIP][87] ([i915#11681])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@i915_pm_rps@thresholds.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-dg1:          [PASS][88] -> [DMESG-WARN][89] ([i915#4391] / [i915#4423])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg1-12/igt@i915_suspend@basic-s3-without-i915.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg1-16/igt@i915_suspend@basic-s3-without-i915.html

  * igt@i915_suspend@debugfs-reader:
    - shard-rkl:          [PASS][90] -> [INCOMPLETE][91] ([i915#4817]) +1 other test incomplete
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-8/igt@i915_suspend@debugfs-reader.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-4/igt@i915_suspend@debugfs-reader.html

  * igt@intel_hwmon@hwmon-read:
    - shard-tglu-1:       NOTRUN -> [SKIP][92] ([i915#7707])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-tglu-1/igt@intel_hwmon@hwmon-read.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][93] ([i915#4215] / [i915#5190])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][94] ([i915#14888]) +2 other tests fail
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-glk6/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1.html

  * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
    - shard-tglu:         NOTRUN -> [SKIP][95] ([i915#5286])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-tglu-9/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-rkl:          NOTRUN -> [SKIP][96] ([i915#5286]) +1 other test skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-tglu-1:       NOTRUN -> [SKIP][97] ([i915#5286]) +3 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][98] ([i915#3638]) +1 other test skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-8/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-rkl:          NOTRUN -> [SKIP][99] ([i915#3828])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-4/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-tglu:         NOTRUN -> [SKIP][100] ([i915#3828]) +1 other test skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-tglu-9/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-dg2:          [PASS][101] -> [SKIP][102] ([i915#16707]) +20 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][103] ([i915#16707] / [i915#5190])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][104] ([i915#10307] / [i915#10434] / [i915#6095]) +1 other test skip
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-4/igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs@pipe-b-hdmi-a-1:
    - shard-glk11:        NOTRUN -> [SKIP][105] +44 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-glk11/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][106] ([i915#12313]) +1 other test skip
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-tglu-1/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][107] ([i915#6095]) +243 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg1-19/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][108] ([i915#6095]) +4 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-tglu-9/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][109] ([i915#6095]) +34 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-tglu-1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][110] ([i915#12805])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][111] ([i915#6095]) +3 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-3.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][112] ([i915#12313])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-tglu-9/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-c-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][113] ([i915#14098] / [i915#6095]) +41 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-5/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][114] ([i915#10307] / [i915#6095]) +85 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-4/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][115] ([i915#6095]) +67 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-7/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_cdclk@plane-scaling:
    - shard-tglu:         NOTRUN -> [SKIP][116] ([i915#3742])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-tglu-9/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_color_pipeline@plane-ctm3x4:
    - shard-rkl:          NOTRUN -> [SKIP][117] ([i915#16471])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-8/igt@kms_chamelium_color_pipeline@plane-ctm3x4.html

  * igt@kms_chamelium_hpd@dp-hpd-fast:
    - shard-dg2:          NOTRUN -> [SKIP][118] ([i915#11151] / [i915#7828])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@kms_chamelium_hpd@dp-hpd-fast.html
    - shard-rkl:          NOTRUN -> [SKIP][119] ([i915#11151] / [i915#7828]) +2 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-4/igt@kms_chamelium_hpd@dp-hpd-fast.html

  * igt@kms_chamelium_hpd@dp-hpd-storm-disable:
    - shard-tglu-1:       NOTRUN -> [SKIP][120] ([i915#11151] / [i915#7828]) +1 other test skip
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-tglu-1/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html

  * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
    - shard-tglu:         NOTRUN -> [SKIP][121] ([i915#11151] / [i915#7828]) +2 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-tglu-9/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html

  * igt@kms_color@deep-color:
    - shard-rkl:          [PASS][122] -> [SKIP][123] ([i915#12655] / [i915#3555])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-6/igt@kms_color@deep-color.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-5/igt@kms_color@deep-color.html
    - shard-tglu-1:       NOTRUN -> [SKIP][124] ([i915#3555] / [i915#9979])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-tglu-1/igt@kms_color@deep-color.html

  * igt@kms_color_pipeline@plane-lut1d:
    - shard-dg2:          NOTRUN -> [SKIP][125] ([i915#15529])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@kms_color_pipeline@plane-lut1d.html

  * igt@kms_content_protection@atomic-hdcp14:
    - shard-tglu:         NOTRUN -> [SKIP][126] ([i915#15865])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-tglu-9/igt@kms_content_protection@atomic-hdcp14.html

  * igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:
    - shard-tglu-1:       NOTRUN -> [SKIP][127] ([i915#15330])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-tglu-1/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-tglu-1:       NOTRUN -> [SKIP][128] ([i915#15330] / [i915#3116] / [i915#3299])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-tglu-1/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@uevent:
    - shard-tglu-1:       NOTRUN -> [SKIP][129] ([i915#15865])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-tglu-1/igt@kms_content_protection@uevent.html

  * igt@kms_content_protection@uevent-hdcp14:
    - shard-rkl:          NOTRUN -> [SKIP][130] ([i915#15865])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-8/igt@kms_content_protection@uevent-hdcp14.html

  * igt@kms_cursor_crc@cursor-onscreen-128x42@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [FAIL][131] ([i915#13566]) +2 other tests fail
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-5/igt@kms_cursor_crc@cursor-onscreen-128x42@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85:
    - shard-tglu:         [PASS][132] -> [FAIL][133] ([i915#13566]) +1 other test fail
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-tglu-10/igt@kms_cursor_crc@cursor-onscreen-256x85.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-tglu-9/igt@kms_cursor_crc@cursor-onscreen-256x85.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-tglu:         NOTRUN -> [SKIP][134] ([i915#13049])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-tglu-9/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-tglu-1:       NOTRUN -> [SKIP][135] ([i915#13049])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-tglu-1/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-random-max-size:
    - shard-glk:          NOTRUN -> [SKIP][136] +273 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-glk6/igt@kms_cursor_crc@cursor-random-max-size.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-rkl:          NOTRUN -> [SKIP][137] ([i915#13049])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-4/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-tglu:         NOTRUN -> [SKIP][138] ([i915#4103])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-tglu-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-rkl:          NOTRUN -> [SKIP][139] ([i915#4103])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dp_aux_dev@basic:
    - shard-tglu:         NOTRUN -> [SKIP][140] ([i915#1257])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-tglu-9/igt@kms_dp_aux_dev@basic.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-rkl:          NOTRUN -> [SKIP][141] ([i915#13749])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-4/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-tglu-1:       NOTRUN -> [SKIP][142] ([i915#13707])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-tglu-1/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dsc@dsc-basic:
    - shard-rkl:          NOTRUN -> [SKIP][143] ([i915#16361]) +1 other test skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-8/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-basic-bigjoiner:
    - shard-tglu-1:       NOTRUN -> [SKIP][144] ([i915#16361]) +1 other test skip
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-tglu-1/igt@kms_dsc@dsc-basic-bigjoiner.html

  * igt@kms_dsc@dsc-with-formats-bigjoiner:
    - shard-tglu:         NOTRUN -> [SKIP][145] ([i915#16361])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-tglu-9/igt@kms_dsc@dsc-with-formats-bigjoiner.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-glk10:        NOTRUN -> [INCOMPLETE][146] ([i915#9878])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-glk10/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_feature_discovery@display-2x:
    - shard-tglu-1:       NOTRUN -> [SKIP][147] ([i915#16081])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-tglu-1/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@display-3x:
    - shard-rkl:          NOTRUN -> [SKIP][148] ([i915#16081])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-8/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@dsc:
    - shard-tglu-1:       NOTRUN -> [SKIP][149] ([i915#16600])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-tglu-1/igt@kms_feature_discovery@dsc.html

  * igt@kms_feature_discovery@psr1:
    - shard-rkl:          NOTRUN -> [SKIP][150] ([i915#658])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-4/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-dg2:          NOTRUN -> [SKIP][151] ([i915#9934]) +2 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - shard-rkl:          NOTRUN -> [SKIP][152] ([i915#9934]) +4 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-4/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-tglu:         NOTRUN -> [SKIP][153] ([i915#3637] / [i915#9934])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-tglu-9/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-tglu-1:       NOTRUN -> [SKIP][154] ([i915#3637] / [i915#9934]) +1 other test skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-tglu-1/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
    - shard-dg1:          [PASS][155] -> [FAIL][156] ([i915#14600])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg1-17/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg1-15/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@d-hdmi-a1:
    - shard-dg1:          NOTRUN -> [FAIL][157] ([i915#14600])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg1-15/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@d-hdmi-a1.html

  * igt@kms_flip@flip-vs-dpms-off-vs-modeset:
    - shard-dg2:          NOTRUN -> [SKIP][158] ([i915#5354])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@kms_flip@flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-dg2:          [PASS][159] -> [FAIL][160] ([i915#13027])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
    - shard-mtlp:         [PASS][161] -> [FAIL][162] ([i915#13027]) +1 other test fail
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-mtlp-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-mtlp-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a1:
    - shard-dg2:          NOTRUN -> [FAIL][163] ([i915#13027])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a1.html

  * igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-dg2:          [PASS][164] -> [SKIP][165] ([i915#5354]) +1 other test skip
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-4/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:
    - shard-tglu:         NOTRUN -> [SKIP][166] ([i915#15643]) +1 other test skip
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-tglu-9/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][167] ([i915#15643]) +1 other test skip
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-dg2:          NOTRUN -> [SKIP][168] ([i915#3555] / [i915#8813]) +1 other test skip
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
    - shard-rkl:          NOTRUN -> [SKIP][169] ([i915#15643]) +1 other test skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-tglu-1:       NOTRUN -> [SKIP][170] +53 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-tglu-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-dg2:          [PASS][171] -> [SKIP][172] ([i915#16708] / [i915#5354]) +1 other test skip
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-pwrite:
    - shard-tglu:         NOTRUN -> [SKIP][173] ([i915#15989]) +5 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-tglu-9/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-mmap-gtt:
    - shard-glk:          [PASS][174] -> [SKIP][175] +10 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-glk8/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-mmap-gtt.html
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-glk6/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-blt:
    - shard-rkl:          NOTRUN -> [SKIP][176] ([i915#15989]) +9 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-4/igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy:
    - shard-tglu:         NOTRUN -> [SKIP][177] ([i915#15102]) +11 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-tglu-9/igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-rkl:          NOTRUN -> [SKIP][178] ([i915#5439])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-shrfb-draw-mmap-cpu:
    - shard-tglu-1:       NOTRUN -> [SKIP][179] ([i915#15102]) +21 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-move:
    - shard-rkl:          NOTRUN -> [SKIP][180] +44 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-shrfb-fliptrack-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][181] ([i915#16708]) +17 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-shrfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-draw-blt:
    - shard-rkl:          [PASS][182] -> [SKIP][183] ([i915#15989]) +15 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-draw-blt.html
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-3/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@hdr-modesetfrombusy:
    - shard-tglu-1:       NOTRUN -> [SKIP][184] ([i915#15989]) +11 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-tglu-1/igt@kms_frontbuffer_tracking@hdr-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][185] ([i915#16708] / [i915#5354]) +7 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html
    - shard-rkl:          NOTRUN -> [SKIP][186] ([i915#1825]) +3 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-tglu:         NOTRUN -> [SKIP][187] +20 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-tglu-9/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][188] ([i915#15102] / [i915#3023]) +8 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-8/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psrhdr-rgb101010-draw-blt:
    - shard-rkl:          NOTRUN -> [SKIP][189] ([i915#15102]) +12 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-8/igt@kms_frontbuffer_tracking@psrhdr-rgb101010-draw-blt.html

  * igt@kms_hdr@bpc-switch:
    - shard-tglu:         NOTRUN -> [SKIP][190] ([i915#3555] / [i915#8228])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-tglu-9/igt@kms_hdr@bpc-switch.html

  * igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-2-xrgb2101010:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][191] ([i915#15436])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-6/igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-2-xrgb2101010.html

  * igt@kms_hdr@static-swap:
    - shard-rkl:          NOTRUN -> [SKIP][192] ([i915#16644] / [i915#3555] / [i915#8228])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-8/igt@kms_hdr@static-swap.html

  * igt@kms_hdr@static-toggle:
    - shard-rkl:          [PASS][193] -> [SKIP][194] ([i915#16644] / [i915#3555] / [i915#8228])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-6/igt@kms_hdr@static-toggle.html
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-3/igt@kms_hdr@static-toggle.html
    - shard-tglu-1:       NOTRUN -> [SKIP][195] ([i915#3555] / [i915#8228])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-tglu-1/igt@kms_hdr@static-toggle.html

  * igt@kms_invalid_mode@zero-hdisplay:
    - shard-dg2:          [PASS][196] -> [SKIP][197] ([i915#16746] / [i915#3555])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-4/igt@kms_invalid_mode@zero-hdisplay.html
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@kms_invalid_mode@zero-hdisplay.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-tglu-1:       NOTRUN -> [SKIP][198] ([i915#15459])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-tglu-1/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-dg2:          NOTRUN -> [SKIP][199] ([i915#15460])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@kms_joiner@invalid-modeset-big-joiner.html
    - shard-rkl:          NOTRUN -> [SKIP][200] ([i915#15460])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-4/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][201] ([i915#15638] / [i915#15722])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-8/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-rkl:          NOTRUN -> [SKIP][202] ([i915#15815])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-4/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c:
    - shard-dg2:          NOTRUN -> [SKIP][203]
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c.html

  * igt@kms_pipe_stress@stress-xrgb8888-untiled:
    - shard-glk:          NOTRUN -> [DMESG-FAIL][204] ([i915#118])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-glk3/igt@kms_pipe_stress@stress-xrgb8888-untiled.html

  * igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping:
    - shard-tglu:         NOTRUN -> [SKIP][205] ([i915#15709])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-tglu-9/igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping:
    - shard-rkl:          NOTRUN -> [SKIP][206] ([i915#15709]) +1 other test skip
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-4/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier:
    - shard-tglu-1:       NOTRUN -> [SKIP][207] ([i915#15709]) +1 other test skip
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-tglu-1/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier.html

  * igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y:
    - shard-dg2:          NOTRUN -> [SKIP][208] ([i915#16112])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-7/igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y.html

  * igt@kms_plane@plane-panning-bottom-right:
    - shard-dg2:          NOTRUN -> [SKIP][209] ([i915#8825])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@kms_plane@plane-panning-bottom-right.html

  * igt@kms_plane_alpha_blend@alpha-opaque-fb:
    - shard-glk10:        NOTRUN -> [FAIL][210] ([i915#10647] / [i915#12169])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-glk10/igt@kms_plane_alpha_blend@alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-c-hdmi-a-1:
    - shard-glk10:        NOTRUN -> [FAIL][211] ([i915#10647]) +1 other test fail
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-glk10/igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-c-hdmi-a-1.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-rkl:          NOTRUN -> [SKIP][212] ([i915#13958])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-4/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-tglu:         NOTRUN -> [SKIP][213] ([i915#13958])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-tglu-9/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a:
    - shard-rkl:          NOTRUN -> [SKIP][214] ([i915#15329]) +3 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-8/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers:
    - shard-dg2:          [PASS][215] -> [SKIP][216] ([i915#15329] / [i915#9423]) +1 other test skip
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-4/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers.html
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers@pipe-d:
    - shard-dg2:          [PASS][217] -> [SKIP][218] ([i915#15329]) +7 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-4/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers@pipe-d.html
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75:
    - shard-dg2:          NOTRUN -> [SKIP][219] ([i915#15329] / [i915#3555] / [i915#6953] / [i915#9423])
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@kms_plane_scaling@planes-downscale-factor-0-75.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b:
    - shard-dg2:          NOTRUN -> [SKIP][220] ([i915#15329]) +3 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-tglu-1:       NOTRUN -> [SKIP][221] ([i915#12343] / [i915#9812])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-tglu-1/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][222] ([i915#12343])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-4/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-dg2:          [PASS][223] -> [SKIP][224] ([i915#15073])
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-4/igt@kms_pm_rpm@dpms-lpsp.html
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@drm-resources-equal:
    - shard-dg2:          [PASS][225] -> [SKIP][226] ([i915#3547])
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-4/igt@kms_pm_rpm@drm-resources-equal.html
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@kms_pm_rpm@drm-resources-equal.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-rkl:          [PASS][227] -> [SKIP][228] ([i915#15073]) +1 other test skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-5/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-4/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-dg1:          [PASS][229] -> [SKIP][230] ([i915#15073])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg1-15/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg1-13/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-dg2:          NOTRUN -> [SKIP][231] ([i915#6524] / [i915#6805]) +1 other test skip
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@kms_prime@basic-crc-hybrid.html
    - shard-rkl:          NOTRUN -> [SKIP][232] ([i915#6524]) +1 other test skip
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-4/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:
    - shard-glk10:        NOTRUN -> [SKIP][233] ([i915#11520]) +4 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-glk10/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg2:          NOTRUN -> [SKIP][234] ([i915#11520])
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
    - shard-glk:          NOTRUN -> [SKIP][235] ([i915#11520]) +6 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-glk2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:
    - shard-rkl:          NOTRUN -> [SKIP][236] ([i915#11520]) +3 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-8/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:
    - shard-tglu:         NOTRUN -> [SKIP][237] ([i915#11520])
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-tglu-9/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-glk11:        NOTRUN -> [SKIP][238] ([i915#11520])
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-glk11/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
    - shard-tglu-1:       NOTRUN -> [SKIP][239] ([i915#11520]) +5 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-tglu-1/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr@fbc-psr-dpms:
    - shard-tglu-1:       NOTRUN -> [SKIP][240] ([i915#9732]) +7 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-tglu-1/igt@kms_psr@fbc-psr-dpms.html

  * igt@kms_psr@fbc-psr-primary-blt:
    - shard-dg2:          NOTRUN -> [SKIP][241] ([i915#1072] / [i915#9732]) +2 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@kms_psr@fbc-psr-primary-blt.html

  * igt@kms_psr@pr-sprite-mmap-cpu:
    - shard-tglu:         NOTRUN -> [SKIP][242] ([i915#9732]) +5 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-tglu-9/igt@kms_psr@pr-sprite-mmap-cpu.html

  * igt@kms_psr@psr2-cursor-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][243] ([i915#1072] / [i915#9732]) +10 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-4/igt@kms_psr@psr2-cursor-mmap-gtt.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-tglu-1:       NOTRUN -> [SKIP][244] ([i915#15949])
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-tglu-1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:
    - shard-glk11:        NOTRUN -> [INCOMPLETE][245] ([i915#15500] / [i915#16184])
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-glk11/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html

  * igt@kms_scaling_modes@scaling-mode-none:
    - shard-tglu-1:       NOTRUN -> [SKIP][246] ([i915#3555]) +1 other test skip
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-tglu-1/igt@kms_scaling_modes@scaling-mode-none.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-rkl:          NOTRUN -> [SKIP][247] ([i915#3555]) +2 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-8/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][248] ([i915#16707]) +16 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-tglu:         NOTRUN -> [SKIP][249] ([i915#9906])
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-tglu-9/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@prime_udl@share-import:
    - shard-tglu-1:       NOTRUN -> [SKIP][250] ([i915#16420])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-tglu-1/igt@prime_udl@share-import.html

  * igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-6:
    - shard-tglu:         NOTRUN -> [SKIP][251] ([i915#16066]) +9 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-tglu-9/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-6.html

  
#### Possible fixes ####

  * igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0:
    - shard-dg2:          [INCOMPLETE][252] ([i915#13356] / [i915#16348]) -> [PASS][253]
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-3/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-4/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html

  * igt@gem_ctx_isolation@preservation-s3:
    - shard-rkl:          [INCOMPLETE][254] ([i915#13356]) -> [PASS][255] +1 other test pass
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-3/igt@gem_ctx_isolation@preservation-s3.html
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-4/igt@gem_ctx_isolation@preservation-s3.html

  * igt@gem_exec_suspend@basic-s0:
    - shard-dg2:          [INCOMPLETE][256] ([i915#13356]) -> [PASS][257] +1 other test pass
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-6/igt@gem_exec_suspend@basic-s0.html
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@gem_exec_suspend@basic-s0.html

  * igt@kms_atomic@crtc-invalid-params-fence:
    - shard-dg2:          [SKIP][258] ([i915#16707]) -> [PASS][259] +26 other tests pass
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-10/igt@kms_atomic@crtc-invalid-params-fence.html
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-6/igt@kms_atomic@crtc-invalid-params-fence.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1:
    - shard-mtlp:         [FAIL][260] ([i915#5956]) -> [PASS][261] +1 other test pass
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-mtlp-4/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-mtlp-8/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-mtlp:         [FAIL][262] ([i915#15733] / [i915#5138]) -> [PASS][263]
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_color@gamma:
    - shard-dg2:          [SKIP][264] ([i915#12655]) -> [PASS][265]
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-10/igt@kms_color@gamma.html
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-6/igt@kms_color@gamma.html

  * igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4:
    - shard-dg2:          [SKIP][266] ([i915#15529]) -> [PASS][267]
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-10/igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4.html
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-6/igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4.html

  * igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1:
    - shard-rkl:          [FAIL][268] ([i915#13566]) -> [PASS][269] +3 other tests pass
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-5/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1.html
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-2/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1.html
    - shard-tglu:         [FAIL][270] ([i915#13566]) -> [PASS][271] +3 other tests pass
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-tglu-4/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1.html
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-tglu-10/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank:
    - shard-dg1:          [DMESG-WARN][272] ([i915#4423]) -> [PASS][273]
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg1-15/igt@kms_flip@flip-vs-blocking-wf-vblank.html
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg1-13/igt@kms_flip@flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg2:          [SKIP][274] ([i915#5354]) -> [PASS][275] +5 other tests pass
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-10/igt@kms_flip@flip-vs-suspend.html
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-6/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:
    - shard-dg2:          [SKIP][276] ([i915#3555] / [i915#8813]) -> [PASS][277] +1 other test pass
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-10/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-rkl:          [INCOMPLETE][278] ([i915#10056]) -> [PASS][279]
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-3/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-8/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-blt:
    - shard-rkl:          [SKIP][280] ([i915#15989]) -> [PASS][281] +6 other tests pass
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-4/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-blt.html
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-render:
    - shard-glk:          [SKIP][282] -> [PASS][283] +11 other tests pass
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-glk1/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-render.html
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-glk8/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_pipe_crc_basic@read-crc:
    - shard-dg2:          [SKIP][284] ([i915#11190] / [i915#16707]) -> [PASS][285]
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-10/igt@kms_pipe_crc_basic@read-crc.html
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-7/igt@kms_pipe_crc_basic@read-crc.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping:
    - shard-dg2:          [SKIP][286] ([i915#8825]) -> [PASS][287] +1 other test pass
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-10/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping.html
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-7/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping.html

  * igt@kms_plane@planar-pixel-format-settings:
    - shard-dg2:          [SKIP][288] ([i915#16753]) -> [PASS][289]
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-10/igt@kms_plane@planar-pixel-format-settings.html
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-7/igt@kms_plane@planar-pixel-format-settings.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-d:
    - shard-dg2:          [SKIP][290] ([i915#15329]) -> [PASS][291] +11 other tests pass
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-10/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-d.html
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-7/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-d.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation:
    - shard-dg2:          [SKIP][292] ([i915#15329] / [i915#9423]) -> [PASS][293] +1 other test pass
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-10/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation.html
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-6/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:
    - shard-dg2:          [SKIP][294] ([i915#15329] / [i915#6953] / [i915#9423]) -> [PASS][295]
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-10/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-6/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-dg2:          [SKIP][296] ([i915#15073]) -> [PASS][297] +1 other test pass
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-8/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
    - shard-rkl:          [SKIP][298] ([i915#15073]) -> [PASS][299] +1 other test pass
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-8/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-dg2:          [SKIP][300] ([i915#3547]) -> [PASS][301]
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-10/igt@kms_pm_rpm@system-suspend-modeset.html
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-6/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_properties@plane-properties-legacy:
    - shard-dg2:          [SKIP][302] ([i915#11521]) -> [PASS][303]
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-10/igt@kms_properties@plane-properties-legacy.html
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-6/igt@kms_properties@plane-properties-legacy.html

  * igt@perf_pmu@busy-double-start@rcs0:
    - shard-mtlp:         [FAIL][304] ([i915#4349]) -> [PASS][305]
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-mtlp-7/igt@perf_pmu@busy-double-start@rcs0.html
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-mtlp-6/igt@perf_pmu@busy-double-start@rcs0.html

  * igt@perf_pmu@gt-awake:
    - shard-dg1:          [FAIL][306] ([i915#16538]) -> [PASS][307]
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg1-15/igt@perf_pmu@gt-awake.html
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg1-13/igt@perf_pmu@gt-awake.html

  
#### Warnings ####

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - shard-rkl:          [SKIP][308] ([i915#8411]) -> [SKIP][309] ([i915#14544] / [i915#8411])
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-4/igt@api_intel_bb@blit-reloc-purge-cache.html
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-6/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@device_reset@cold-reset-bound:
    - shard-rkl:          [SKIP][310] ([i915#11078] / [i915#14544]) -> [SKIP][311] ([i915#11078])
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-6/igt@device_reset@cold-reset-bound.html
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-3/igt@device_reset@cold-reset-bound.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-rkl:          [SKIP][312] ([i915#14544] / [i915#3555] / [i915#9323]) -> [SKIP][313] ([i915#3555] / [i915#9323])
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-6/igt@gem_ccs@block-copy-compressed.html
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-3/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-rkl:          [SKIP][314] ([i915#9323]) -> [SKIP][315] ([i915#14544] / [i915#9323])
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-4/igt@gem_ccs@block-multicopy-compressed.html
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-6/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-rkl:          [SKIP][316] ([i915#14544] / [i915#6335]) -> [SKIP][317] ([i915#6335])
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-6/igt@gem_create@create-ext-cpu-access-big.html
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-3/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_create@create-ext-set-pat:
    - shard-rkl:          [SKIP][318] ([i915#8562]) -> [SKIP][319] ([i915#14544] / [i915#8562])
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-4/igt@gem_create@create-ext-set-pat.html
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-6/igt@gem_create@create-ext-set-pat.html

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-rkl:          [SKIP][320] ([i915#14544] / [i915#4525]) -> [SKIP][321] ([i915#4525]) +1 other test skip
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-6/igt@gem_exec_balancer@parallel-ordering.html
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-3/igt@gem_exec_balancer@parallel-ordering.html

  * igt@gem_exec_reloc@basic-write-read:
    - shard-rkl:          [SKIP][322] ([i915#14544] / [i915#3281]) -> [SKIP][323] ([i915#3281]) +7 other tests skip
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-6/igt@gem_exec_reloc@basic-write-read.html
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-3/igt@gem_exec_reloc@basic-write-read.html

  * igt@gem_exec_reloc@basic-write-read-noreloc:
    - shard-rkl:          [SKIP][324] ([i915#3281]) -> [SKIP][325] ([i915#14544] / [i915#3281]) +2 other tests skip
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-4/igt@gem_exec_reloc@basic-write-read-noreloc.html
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-6/igt@gem_exec_reloc@basic-write-read-noreloc.html

  * igt@gem_lmem_swapping@heavy-verify-random:
    - shard-rkl:          [SKIP][326] ([i915#14544] / [i915#4613]) -> [SKIP][327] ([i915#4613])
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-6/igt@gem_lmem_swapping@heavy-verify-random.html
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-3/igt@gem_lmem_swapping@heavy-verify-random.html

  * igt@gem_lmem_swapping@parallel-multi:
    - shard-rkl:          [SKIP][328] ([i915#4613]) -> [SKIP][329] ([i915#14544] / [i915#4613])
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-4/igt@gem_lmem_swapping@parallel-multi.html
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-6/igt@gem_lmem_swapping@parallel-multi.html

  * igt@gem_partial_pwrite_pread@reads:
    - shard-rkl:          [SKIP][330] ([i915#14544] / [i915#3282]) -> [SKIP][331] ([i915#3282]) +4 other tests skip
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-6/igt@gem_partial_pwrite_pread@reads.html
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-3/igt@gem_partial_pwrite_pread@reads.html

  * igt@gem_partial_pwrite_pread@write:
    - shard-rkl:          [SKIP][332] ([i915#3282]) -> [SKIP][333] ([i915#14544] / [i915#3282])
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-4/igt@gem_partial_pwrite_pread@write.html
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-6/igt@gem_partial_pwrite_pread@write.html

  * igt@gem_set_tiling_vs_blt@untiled-to-tiled:
    - shard-rkl:          [SKIP][334] ([i915#14544] / [i915#8411]) -> [SKIP][335] ([i915#8411])
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-6/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-3/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-rkl:          [SKIP][336] ([i915#3297]) -> [SKIP][337] ([i915#14544] / [i915#3297]) +1 other test skip
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-4/igt@gem_userptr_blits@create-destroy-unsync.html
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-6/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gen9_exec_parse@batch-without-end:
    - shard-rkl:          [SKIP][338] ([i915#2527]) -> [SKIP][339] ([i915#14544] / [i915#2527]) +1 other test skip
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-4/igt@gen9_exec_parse@batch-without-end.html
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-6/igt@gen9_exec_parse@batch-without-end.html

  * igt@gen9_exec_parse@bb-start-far:
    - shard-rkl:          [SKIP][340] ([i915#14544] / [i915#2527]) -> [SKIP][341] ([i915#2527]) +2 other tests skip
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-6/igt@gen9_exec_parse@bb-start-far.html
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-5/igt@gen9_exec_parse@bb-start-far.html

  * igt@i915_module_load@fault-injection:
    - shard-mtlp:         [ABORT][342] ([i915#15342] / [i915#15481]) -> [INCOMPLETE][343] ([i915#15895] / [i915#16719])
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-mtlp-8/igt@i915_module_load@fault-injection.html
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-mtlp-6/igt@i915_module_load@fault-injection.html

  * igt@i915_module_load@fault-injection@__uc_init:
    - shard-mtlp:         [ABORT][344] ([i915#15481]) -> [INCOMPLETE][345] ([i915#15895] / [i915#16719])
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-mtlp-8/igt@i915_module_load@fault-injection@__uc_init.html
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-mtlp-6/igt@i915_module_load@fault-injection@__uc_init.html

  * igt@i915_pm_freq_api@freq-basic-api:
    - shard-rkl:          [SKIP][346] ([i915#14544] / [i915#8399]) -> [SKIP][347] ([i915#8399])
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-6/igt@i915_pm_freq_api@freq-basic-api.html
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-3/igt@i915_pm_freq_api@freq-basic-api.html

  * igt@i915_pm_freq_mult@media-freq@gt0:
    - shard-rkl:          [SKIP][348] ([i915#14544] / [i915#6590]) -> [SKIP][349] ([i915#6590]) +1 other test skip
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-6/igt@i915_pm_freq_mult@media-freq@gt0.html
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-5/igt@i915_pm_freq_mult@media-freq@gt0.html

  * igt@i915_power@sanity:
    - shard-rkl:          [SKIP][350] ([i915#7984]) -> [SKIP][351] ([i915#14544] / [i915#7984])
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-4/igt@i915_power@sanity.html
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-6/igt@i915_power@sanity.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-rkl:          [ABORT][352] ([i915#15140]) -> [INCOMPLETE][353] ([i915#4817])
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-1/igt@i915_suspend@fence-restore-tiled2untiled.html
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-6/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@intel_hwmon@hwmon-read:
    - shard-rkl:          [SKIP][354] ([i915#14544] / [i915#7707]) -> [SKIP][355] ([i915#7707])
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-6/igt@intel_hwmon@hwmon-read.html
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-3/igt@intel_hwmon@hwmon-read.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-rkl:          [SKIP][356] ([i915#12454] / [i915#12712]) -> [SKIP][357] ([i915#12454] / [i915#12712] / [i915#14544])
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-4/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-6/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-dg2:          [SKIP][358] ([i915#16707]) -> [SKIP][359] ([i915#1769] / [i915#3555])
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-10/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-6/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-rkl:          [SKIP][360] ([i915#5286]) -> [SKIP][361] ([i915#14544] / [i915#5286])
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-rkl:          [SKIP][362] ([i915#14544] / [i915#5286]) -> [SKIP][363] ([i915#5286]) +4 other tests skip
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-dg2:          [SKIP][364] ([i915#16707]) -> [SKIP][365] +2 other tests skip
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-10/igt@kms_big_fb@linear-16bpp-rotate-90.html
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-6/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-dg2:          [SKIP][366] -> [SKIP][367] ([i915#16707]) +1 other test skip
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-4/igt@kms_big_fb@linear-64bpp-rotate-270.html
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-rkl:          [SKIP][368] ([i915#14544] / [i915#3638]) -> [SKIP][369] ([i915#3638]) +2 other tests skip
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-6/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-5/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
    - shard-dg2:          [SKIP][370] ([i915#4538] / [i915#5190]) -> [SKIP][371] ([i915#16707] / [i915#5190]) +5 other tests skip
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-4/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html
    - shard-rkl:          [SKIP][372] ([i915#3638]) -> [SKIP][373] ([i915#14544] / [i915#3638]) +2 other tests skip
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-4/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-6/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-dg2:          [SKIP][374] ([i915#16707] / [i915#5190]) -> [SKIP][375] ([i915#4538] / [i915#5190]) +3 other tests skip
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-10/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_ccs@bad-aux-stride-yf-tiled-ccs:
    - shard-dg2:          [SKIP][376] ([i915#16707]) -> [SKIP][377] ([i915#10307] / [i915#6095]) +5 other tests skip
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-10/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-6/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-rkl:          [SKIP][378] ([i915#12313] / [i915#14544]) -> [SKIP][379] ([i915#12313]) +1 other test skip
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-3/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-dg2:          [SKIP][380] ([i915#12313]) -> [SKIP][381] ([i915#16707])
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
    - shard-rkl:          [SKIP][382] ([i915#12313]) -> [SKIP][383] ([i915#12313] / [i915#14544])
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-2:
    - shard-rkl:          [SKIP][384] ([i915#14544] / [i915#6095]) -> [SKIP][385] ([i915#6095]) +16 other tests skip
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-2.html
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2:
    - shard-rkl:          [SKIP][386] ([i915#14098] / [i915#14544] / [i915#6095]) -> [SKIP][387] ([i915#14098] / [i915#6095]) +22 other tests skip
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2.html
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:
    - shard-dg2:          [SKIP][388] ([i915#16707]) -> [SKIP][389] ([i915#6095])
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-10/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-dg2:          [SKIP][390] ([i915#16707]) -> [SKIP][391] ([i915#12313])
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-10/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs:
    - shard-rkl:          [SKIP][392] ([i915#14098] / [i915#6095]) -> [SKIP][393] ([i915#14098] / [i915#14544] / [i915#6095]) +1 other test skip
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2:
    - shard-rkl:          [SKIP][394] ([i915#6095]) -> [SKIP][395] ([i915#14544] / [i915#6095]) +1 other test skip
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2.html
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:
    - shard-dg2:          [SKIP][396] ([i915#10307] / [i915#6095]) -> [SKIP][397] ([i915#16707]) +4 other tests skip
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-6/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html

  * igt@kms_chamelium_frames@hdmi-crc-multiple:
    - shard-rkl:          [SKIP][398] ([i915#11151] / [i915#14544] / [i915#7828]) -> [SKIP][399] ([i915#11151] / [i915#7828]) +4 other tests skip
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-6/igt@kms_chamelium_frames@hdmi-crc-multiple.html
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-3/igt@kms_chamelium_frames@hdmi-crc-multiple.html

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - shard-rkl:          [SKIP][400] ([i915#11151] / [i915#7828]) -> [SKIP][401] ([i915#11151] / [i915#14544] / [i915#7828]) +5 other tests skip
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-4/igt@kms_chamelium_hpd@vga-hpd-fast.html
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-6/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_content_protection@content-type-change:
    - shard-dg2:          [SKIP][402] ([i915#15865]) -> [SKIP][403] ([i915#16707])
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-4/igt@kms_content_protection@content-type-change.html
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@kms_content_protection@content-type-change.html
    - shard-rkl:          [SKIP][404] ([i915#15865]) -> [SKIP][405] ([i915#14544] / [i915#15865])
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-4/igt@kms_content_protection@content-type-change.html
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-6/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:
    - shard-rkl:          [SKIP][406] ([i915#14544] / [i915#15330]) -> [SKIP][407] ([i915#15330]) +1 other test skip
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-6/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-5/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-rkl:          [SKIP][408] ([i915#15330] / [i915#3116]) -> [SKIP][409] ([i915#14544] / [i915#15330] / [i915#3116])
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-7/igt@kms_content_protection@dp-mst-lic-type-1.html
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-6/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-rkl:          [SKIP][410] ([i915#14544] / [i915#15330] / [i915#3116]) -> [SKIP][411] ([i915#15330] / [i915#3116])
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-6/igt@kms_content_protection@dp-mst-type-0.html
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-3/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@dp-mst-type-0-hdcp14:
    - shard-dg2:          [SKIP][412] ([i915#16707]) -> [SKIP][413] ([i915#15330])
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-10/igt@kms_content_protection@dp-mst-type-0-hdcp14.html
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-7/igt@kms_content_protection@dp-mst-type-0-hdcp14.html

  * igt@kms_content_protection@uevent:
    - shard-rkl:          [SKIP][414] ([i915#14544] / [i915#15865]) -> [SKIP][415] ([i915#15865])
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-6/igt@kms_content_protection@uevent.html
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-5/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-dg1:          [SKIP][416] ([i915#3555] / [i915#4423]) -> [SKIP][417] ([i915#3555])
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg1-19/igt@kms_cursor_crc@cursor-random-32x32.html
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg1-12/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-rkl:          [SKIP][418] ([i915#13049] / [i915#14544]) -> [SKIP][419] ([i915#13049])
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-6/igt@kms_cursor_crc@cursor-random-512x170.html
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-3/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-random-max-size:
    - shard-dg2:          [SKIP][420] ([i915#16707]) -> [SKIP][421] ([i915#3555]) +2 other tests skip
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-10/igt@kms_cursor_crc@cursor-random-max-size.html
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-7/igt@kms_cursor_crc@cursor-random-max-size.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2:          [SKIP][422] ([i915#4103]) -> [SKIP][423] ([i915#11190] / [i915#16707])
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - shard-rkl:          [SKIP][424] ([i915#4103]) -> [SKIP][425] ([i915#14544] / [i915#4103])
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
    - shard-dg2:          [SKIP][426] ([i915#13046] / [i915#5354]) -> [SKIP][427] ([i915#16707])
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-rkl:          [SKIP][428] ([i915#14544] / [i915#3555] / [i915#3804]) -> [SKIP][429] ([i915#3555] / [i915#3804])
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-3/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
    - shard-rkl:          [SKIP][430] ([i915#14544] / [i915#3804]) -> [SKIP][431] ([i915#3804])
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-3/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-rkl:          [SKIP][432] ([i915#13707] / [i915#14544]) -> [SKIP][433] ([i915#13707])
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-6/igt@kms_dp_linktrain_fallback@dsc-fallback.html
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-3/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg2:          [SKIP][434] ([i915#16707]) -> [SKIP][435] ([i915#16361]) +1 other test skip
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-10/igt@kms_dsc@dsc-with-bpc-formats.html
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-7/igt@kms_dsc@dsc-with-bpc-formats.html
    - shard-rkl:          [SKIP][436] ([i915#14544] / [i915#16361]) -> [SKIP][437] ([i915#16361]) +2 other tests skip
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-6/igt@kms_dsc@dsc-with-bpc-formats.html
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-3/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-dg2:          [SKIP][438] ([i915#16361]) -> [SKIP][439] ([i915#16707]) +1 other test skip
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-6/igt@kms_dsc@dsc-with-output-formats.html
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_dsc@dsc-with-output-formats-bigjoiner:
    - shard-rkl:          [SKIP][440] ([i915#16361]) -> [SKIP][441] ([i915#14544] / [i915#16361])
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-4/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-6/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html

  * igt@kms_feature_discovery@display-2x:
    - shard-rkl:          [SKIP][442] ([i915#14544] / [i915#16081]) -> [SKIP][443] ([i915#16081])
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-6/igt@kms_feature_discovery@display-2x.html
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-3/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-rkl:          [SKIP][444] ([i915#16081]) -> [SKIP][445] ([i915#14544] / [i915#16081])
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-7/igt@kms_feature_discovery@display-4x.html
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-6/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@dsc:
    - shard-rkl:          [SKIP][446] ([i915#14544] / [i915#16600]) -> [SKIP][447] ([i915#16600])
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-6/igt@kms_feature_discovery@dsc.html
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-5/igt@kms_feature_discovery@dsc.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-glk:          [INCOMPLETE][448] ([i915#12314] / [i915#12745] / [i915#4839]) -> [INCOMPLETE][449] ([i915#12745] / [i915#4839])
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-glk5/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-glk9/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2:
    - shard-glk:          [INCOMPLETE][450] ([i915#12314] / [i915#12745]) -> [INCOMPLETE][451] ([i915#12745])
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-glk5/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2.html
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-glk9/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-plain-flip:
    - shard-rkl:          [SKIP][452] ([i915#14544] / [i915#9934]) -> [SKIP][453] ([i915#9934]) +4 other tests skip
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-6/igt@kms_flip@2x-plain-flip.html
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-3/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-rkl:          [SKIP][454] ([i915#9934]) -> [SKIP][455] ([i915#14544] / [i915#9934]) +1 other test skip
   [454]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-4/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [455]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-6/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-rkl:          [SKIP][456] ([i915#15643]) -> [SKIP][457] ([i915#14544] / [i915#15643]) +3 other tests skip
   [456]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
   [457]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-rkl:          [SKIP][458] ([i915#14544] / [i915#15643]) -> [SKIP][459] ([i915#15643]) +3 other tests skip
   [458]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html
   [459]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2:          [SKIP][460] ([i915#16708] / [i915#5354]) -> [SKIP][461] ([i915#15990] / [i915#8708]) +5 other tests skip
   [460]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [461]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-rkl:          [SKIP][462] ([i915#5439]) -> [SKIP][463] ([i915#14544] / [i915#5439])
   [462]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
   [463]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-pwrite:
    - shard-dg1:          [SKIP][464] ([i915#15989] / [i915#4423]) -> [SKIP][465] ([i915#15989])
   [464]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg1-19/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-pwrite.html
   [465]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg1-12/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-shrfb-pgflip-blt:
    - shard-rkl:          [SKIP][466] ([i915#14544]) -> [SKIP][467] +73 other tests skip
   [466]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-shrfb-pgflip-blt.html
   [467]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-3/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-cur-indfb-draw-pwrite:
    - shard-dg2:          [SKIP][468] ([i915#16708]) -> [SKIP][469] ([i915#15991]) +16 other tests skip
   [468]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-10/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-cur-indfb-draw-pwrite.html
   [469]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-6/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-cur-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2:          [SKIP][470] ([i915#15990]) -> [SKIP][471] ([i915#16708]) +5 other tests skip
   [470]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-4/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [471]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-blt:
    - shard-dg2:          [SKIP][472] ([i915#15989]) -> [SKIP][473] ([i915#16708]) +5 other tests skip
   [472]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-4/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-blt.html
   [473]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-suspend:
    - shard-rkl:          [SKIP][474] ([i915#15989]) -> [ABORT][475] ([i915#15132])
   [474]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-3/igt@kms_frontbuffer_tracking@fbchdr-suspend.html
   [475]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-1/igt@kms_frontbuffer_tracking@fbchdr-suspend.html

  * igt@kms_frontbuffer_tracking@fbchdr-tiling-4:
    - shard-rkl:          [SKIP][476] ([i915#14544] / [i915#5439]) -> [SKIP][477] ([i915#5439])
   [476]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-tiling-4.html
   [477]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-3/igt@kms_frontbuffer_tracking@fbchdr-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt:
    - shard-rkl:          [SKIP][478] ([i915#14544] / [i915#15102]) -> [SKIP][479] ([i915#15102]) +18 other tests skip
   [478]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt.html
   [479]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt:
    - shard-dg2:          [SKIP][480] ([i915#15102]) -> [SKIP][481] ([i915#16708]) +8 other tests skip
   [480]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt.html
   [481]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
    - shard-rkl:          [SKIP][482] ([i915#14544] / [i915#15102] / [i915#3023]) -> [SKIP][483] ([i915#15102] / [i915#3023]) +14 other tests skip
   [482]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html
   [483]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu:
    - shard-dg2:          [SKIP][484] ([i915#16708] / [i915#5354]) -> [SKIP][485] ([i915#15102]) +6 other tests skip
   [484]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu.html
   [485]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render:
    - shard-dg2:          [SKIP][486] ([i915#15102]) -> [SKIP][487] ([i915#16708] / [i915#5354]) +6 other tests skip
   [486]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render.html
   [487]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-dg2:          [SKIP][488] ([i915#15990] / [i915#8708]) -> [SKIP][489] ([i915#16708] / [i915#5354]) +2 other tests skip
   [488]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html
   [489]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-rkl:          [SKIP][490] ([i915#14544] / [i915#1825]) -> [SKIP][491] ([i915#1825]) +6 other tests skip
   [490]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt.html
   [491]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-rkl:          [SKIP][492] -> [SKIP][493] ([i915#14544]) +28 other tests skip
   [492]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
   [493]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-pwrite:
    - shard-dg2:          [SKIP][494] ([i915#10433] / [i915#15102]) -> [SKIP][495] ([i915#16708] / [i915#5354])
   [494]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-pwrite.html
   [495]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt:
    - shard-rkl:          [SKIP][496] ([i915#15102] / [i915#3023]) -> [SKIP][497] ([i915#14544] / [i915#15102] / [i915#3023]) +9 other tests skip
   [496]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt.html
   [497]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-mmap-gtt:
    - shard-dg2:          [SKIP][498] ([i915#16708]) -> [SKIP][499] ([i915#15990]) +12 other tests skip
   [498]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-mmap-gtt.html
   [499]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-linear:
    - shard-dg2:          [SKIP][500] ([i915#16708]) -> [SKIP][501] ([i915#15102]) +8 other tests skip
   [500]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-linear.html
   [501]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-linear.html

  * igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-mmap-cpu:
    - shard-dg1:          [SKIP][502] ([i915#15989]) -> [SKIP][503] ([i915#15989] / [i915#4423])
   [502]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg1-12/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-mmap-cpu.html
   [503]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg1-16/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2:          [SKIP][504] ([i915#16708]) -> [SKIP][505] ([i915#15989]) +6 other tests skip
   [504]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-10/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-blt.html
   [505]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-7/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-gtt:
    - shard-dg2:          [SKIP][506] ([i915#16708]) -> [SKIP][507] ([i915#15104] / [i915#15990]) +1 other test skip
   [506]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-gtt.html
   [507]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-cpu:
    - shard-dg2:          [SKIP][508] ([i915#15102]) -> [SKIP][509] ([i915#10433] / [i915#15102]) +4 other tests skip
   [508]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-cpu.html
   [509]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-render:
    - shard-dg2:          [SKIP][510] ([i915#16708] / [i915#5354]) -> [SKIP][511] ([i915#15991] / [i915#5354]) +17 other tests skip
   [510]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-render.html
   [511]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-rkl:          [SKIP][512] ([i915#1825]) -> [SKIP][513] ([i915#14544] / [i915#1825])
   [512]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-gtt.html
   [513]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-dg2:          [SKIP][514] ([i915#15991] / [i915#5354]) -> [SKIP][515] ([i915#16708] / [i915#5354]) +7 other tests skip
   [514]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html
   [515]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:
    - shard-dg2:          [SKIP][516] ([i915#10433] / [i915#15102]) -> [SKIP][517] ([i915#15102]) +3 other tests skip
   [516]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html
   [517]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-move:
    - shard-rkl:          [SKIP][518] ([i915#15102]) -> [SKIP][519] ([i915#14544] / [i915#15102]) +11 other tests skip
   [518]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-4/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-move.html
   [519]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-6/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-spr-indfb-draw-render:
    - shard-dg2:          [SKIP][520] ([i915#15991]) -> [SKIP][521] ([i915#16708]) +8 other tests skip
   [520]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-4/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-spr-indfb-draw-render.html
   [521]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-rkl:          [SKIP][522] ([i915#16644] / [i915#3555] / [i915#8228]) -> [INCOMPLETE][523] ([i915#15436])
   [522]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-4/igt@kms_hdr@bpc-switch-suspend.html
   [523]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-6/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-dg1:          [SKIP][524] ([i915#1187] / [i915#12713]) -> [SKIP][525] ([i915#12713])
   [524]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg1-13/igt@kms_hdr@brightness-with-hdr.html
   [525]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg1-17/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2:          [SKIP][526] ([i915#16707]) -> [SKIP][527] ([i915#16518] / [i915#3555] / [i915#8228])
   [526]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-10/igt@kms_hdr@invalid-hdr.html
   [527]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-6/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-rkl:          [SKIP][528] ([i915#14544] / [i915#15460]) -> [SKIP][529] ([i915#15460])
   [528]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-6/igt@kms_joiner@basic-big-joiner.html
   [529]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-3/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-rkl:          [SKIP][530] ([i915#14544] / [i915#15459]) -> [SKIP][531] ([i915#15459])
   [530]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-6/igt@kms_joiner@basic-force-big-joiner.html
   [531]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-5/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping:
    - shard-rkl:          [SKIP][532] ([i915#14544] / [i915#15709]) -> [SKIP][533] ([i915#15709]) +3 other tests skip
   [532]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping.html
   [533]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-3/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping:
    - shard-rkl:          [SKIP][534] ([i915#15709]) -> [SKIP][535] ([i915#14544] / [i915#15709])
   [534]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-4/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping.html
   [535]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-dg2:          [SKIP][536] ([i915#13958]) -> [SKIP][537] ([i915#16707])
   [536]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-4/igt@kms_plane_multiple@2x-tiling-y.html
   [537]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@kms_plane_multiple@2x-tiling-y.html
    - shard-rkl:          [SKIP][538] ([i915#13958]) -> [SKIP][539] ([i915#13958] / [i915#14544])
   [538]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-4/igt@kms_plane_multiple@2x-tiling-y.html
   [539]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-6/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:
    - shard-rkl:          [SKIP][540] ([i915#14544] / [i915#15329]) -> [SKIP][541] ([i915#15329]) +3 other tests skip
   [540]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html
   [541]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-3/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-rkl:          [SKIP][542] ([i915#12343] / [i915#14544] / [i915#5354]) -> [SKIP][543] ([i915#12343] / [i915#5354])
   [542]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-6/igt@kms_pm_backlight@bad-brightness.html
   [543]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-5/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-rkl:          [SKIP][544] ([i915#9340]) -> [SKIP][545] ([i915#3828])
   [544]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-4/igt@kms_pm_lpsp@kms-lpsp.html
   [545]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-8/igt@kms_pm_lpsp@kms-lpsp.html
    - shard-dg1:          [SKIP][546] ([i915#3828]) -> [SKIP][547] ([i915#9340])
   [546]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg1-15/igt@kms_pm_lpsp@kms-lpsp.html
   [547]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg1-13/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-rkl:          [SKIP][548] ([i915#8430]) -> [SKIP][549] ([i915#14544] / [i915#8430])
   [548]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-1/igt@kms_pm_lpsp@screens-disabled.html
   [549]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-6/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-rkl:          [SKIP][550] ([i915#15073]) -> [SKIP][551] ([i915#14544] / [i915#15073])
   [550]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-4/igt@kms_pm_rpm@dpms-lpsp.html
   [551]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-6/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-rkl:          [SKIP][552] ([i915#14544] / [i915#15073]) -> [SKIP][553] ([i915#15073])
   [552]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-6/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [553]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-3/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_prime@d3hot:
    - shard-rkl:          [SKIP][554] ([i915#6524]) -> [SKIP][555] ([i915#14544] / [i915#6524])
   [554]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-4/igt@kms_prime@d3hot.html
   [555]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-6/igt@kms_prime@d3hot.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
    - shard-rkl:          [SKIP][556] ([i915#11520]) -> [SKIP][557] ([i915#11520] / [i915#14544]) +1 other test skip
   [556]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-4/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html
   [557]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
    - shard-rkl:          [SKIP][558] ([i915#11520] / [i915#14544]) -> [SKIP][559] ([i915#11520]) +6 other tests skip
   [558]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-6/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html
   [559]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-3/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr@pr-cursor-render:
    - shard-rkl:          [SKIP][560] ([i915#1072] / [i915#9732]) -> [SKIP][561] ([i915#1072] / [i915#14544] / [i915#9732]) +8 other tests skip
   [560]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-4/igt@kms_psr@pr-cursor-render.html
   [561]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-6/igt@kms_psr@pr-cursor-render.html

  * igt@kms_psr@psr-suspend:
    - shard-rkl:          [SKIP][562] ([i915#1072] / [i915#14544] / [i915#9732]) -> [SKIP][563] ([i915#1072] / [i915#9732]) +14 other tests skip
   [562]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-6/igt@kms_psr@psr-suspend.html
   [563]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-3/igt@kms_psr@psr-suspend.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-rkl:          [SKIP][564] ([i915#14544] / [i915#15949]) -> [SKIP][565] ([i915#15949])
   [564]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-6/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [565]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-3/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-dg2:          [SKIP][566] ([i915#12755] / [i915#15867]) -> [SKIP][567] ([i915#16707])
   [566]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-4/igt@kms_rotation_crc@primary-rotation-90.html
   [567]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-dg2:          [SKIP][568] ([i915#5190]) -> [SKIP][569] ([i915#16707] / [i915#5190])
   [568]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
   [569]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
    - shard-rkl:          [SKIP][570] ([i915#5289]) -> [SKIP][571] ([i915#14544] / [i915#5289])
   [570]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
   [571]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-dg2:          [SKIP][572] ([i915#16707] / [i915#5190]) -> [SKIP][573] ([i915#12755] / [i915#15867] / [i915#5190])
   [572]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-10/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
   [573]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_scaling_modes@scaling-mode-none:
    - shard-rkl:          [SKIP][574] ([i915#14544] / [i915#3555]) -> [SKIP][575] ([i915#3555]) +2 other tests skip
   [574]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-6/igt@kms_scaling_modes@scaling-mode-none.html
   [575]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-3/igt@kms_scaling_modes@scaling-mode-none.html

  * igt@kms_vrr@flip-basic:
    - shard-rkl:          [SKIP][576] ([i915#15243] / [i915#3555]) -> [SKIP][577] ([i915#14544] / [i915#15243] / [i915#3555])
   [576]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-4/igt@kms_vrr@flip-basic.html
   [577]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-6/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@max-min:
    - shard-dg2:          [SKIP][578] ([i915#9906]) -> [SKIP][579] ([i915#16707])
   [578]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-4/igt@kms_vrr@max-min.html
   [579]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@kms_vrr@max-min.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-rkl:          [SKIP][580] ([i915#9906]) -> [SKIP][581] ([i915#14544] / [i915#9906]) +1 other test skip
   [580]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-7/igt@kms_vrr@seamless-rr-switch-vrr.html
   [581]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-6/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@prime_udl@share-import:
    - shard-rkl:          [SKIP][582] ([i915#14544] / [i915#16420]) -> [SKIP][583] ([i915#16420])
   [582]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-6/igt@prime_udl@share-import.html
   [583]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-3/igt@prime_udl@share-import.html

  * igt@prime_vgem@basic-write:
    - shard-rkl:          [SKIP][584] ([i915#14544] / [i915#3291] / [i915#3708]) -> [SKIP][585] ([i915#3291] / [i915#3708])
   [584]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-6/igt@prime_vgem@basic-write.html
   [585]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-3/igt@prime_vgem@basic-write.html

  * igt@prime_vgem@fence-flip-hang:
    - shard-rkl:          [SKIP][586] ([i915#14544] / [i915#3708]) -> [SKIP][587] ([i915#3708])
   [586]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-rkl-6/igt@prime_vgem@fence-flip-hang.html
   [587]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-3/igt@prime_vgem@fence-flip-hang.html

  
  [i915#10056]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10056
  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433
  [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
  [i915#10647]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#11078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078
  [i915#11151]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151
  [i915#11190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#11521]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11521
  [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
  [i915#118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/118
  [i915#1187]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187
  [i915#12169]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12169
  [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
  [i915#12314]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12314
  [i915#12343]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343
  [i915#12454]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12454
  [i915#1257]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257
  [i915#12655]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655
  [i915#12712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12712
  [i915#12713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713
  [i915#12745]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745
  [i915#12755]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755
  [i915#12805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805
  [i915#13027]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13027
  [i915#13046]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046
  [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
  [i915#13356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356
  [i915#13566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566
  [i915#13707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707
  [i915#13749]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749
  [i915#13958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958
  [i915#14098]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098
  [i915#14544]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544
  [i915#14586]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14586
  [i915#14600]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14600
  [i915#14888]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14888
  [i915#15073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073
  [i915#15102]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102
  [i915#15104]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104
  [i915#15132]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132
  [i915#15140]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15140
  [i915#15243]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243
  [i915#15329]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329
  [i915#15330]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330
  [i915#15342]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15342
  [i915#15436]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15436
  [i915#15459]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459
  [i915#15460]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460
  [i915#15481]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15481
  [i915#15500]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15500
  [i915#15529]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15529
  [i915#15638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15638
  [i915#15643]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643
  [i915#15709]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709
  [i915#15722]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15722
  [i915#15733]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15733
  [i915#15815]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15815
  [i915#15865]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865
  [i915#15867]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867
  [i915#15895]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15895
  [i915#15949]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15949
  [i915#15989]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989
  [i915#15990]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990
  [i915#15991]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991
  [i915#16066]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16066
  [i915#16081]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081
  [i915#16112]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16112
  [i915#16184]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16184
  [i915#16348]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16348
  [i915#16361]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361
  [i915#16420]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16420
  [i915#16471]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471
  [i915#16518]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16518
  [i915#16538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16538
  [i915#16600]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16600
  [i915#16644]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644
  [i915#16707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707
  [i915#16708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708
  [i915#16719]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16719
  [i915#16746]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16746
  [i915#16753]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16753
  [i915#16759]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16759
  [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
  [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
  [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
  [i915#2658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658
  [i915#280]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280
  [i915#2856]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
  [i915#3023]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023
  [i915#3116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299
  [i915#3547]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3547
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#3742]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
  [i915#3828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828
  [i915#4036]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4036
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4215]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4215
  [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
  [i915#4349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349
  [i915#4391]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4391
  [i915#4423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423
  [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
  [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#4817]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817
  [i915#4839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839
  [i915#4860]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860
  [i915#5138]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#5439]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439
  [i915#5956]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5956
  [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
  [i915#6334]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334
  [i915#6335]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335
  [i915#6524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
  [i915#658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658
  [i915#6590]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6590
  [i915#6805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6805
  [i915#6953]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953
  [i915#7276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7276
  [i915#7697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697
  [i915#7707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707
  [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
  [i915#7984]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984
  [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
  [i915#8399]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399
  [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
  [i915#8430]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430
  [i915#8562]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562
  [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
  [i915#8813]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813
  [i915#8825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825
  [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
  [i915#9340]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340
  [i915#9423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812
  [i915#9878]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9878
  [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
  [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934
  [i915#9979]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9979


Build changes
-------------

  * Linux: CI_DRM_18941 -> Patchwork_171534v1

  CI-20190529: 20190529
  CI_DRM_18941: 8c5c3b3e801512eca826589c6bcded8421486490 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_9036: 9036
  Patchwork_171534v1: 8c5c3b3e801512eca826589c6bcded8421486490 @ git://anongit.freedesktop.org/gfx-ci/linux
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/index.html

--===============0844161029450840188==
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
<tr><td><b>Series:</b></td><td>SKL_DSSM / DE_CAP fixes</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/171534/">https://patchwork.freedesktop.org/series/171534/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/Patchwork_171534v1/index.html">https://intel-gfx-ci.01.org/tre=
e/drm-tip/Patchwork_171534v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_18941_full -&gt; Patchwork_171534v=
1_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (10 -&gt; 10)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_171534v1_full that come from kno=
wn issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@object-reloc-keep-cache:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-rkl-8/igt@api_intel_bb@object-reloc-=
keep-cache.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@device_reset@cold-reset-bound:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-tglu-1/igt@device_reset@cold-reset-b=
ound.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/11078">i915#11078</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_basic@multigpu-create-close:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-rkl-4/igt@gem_basic@multigpu-create-=
close.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/7697">i915#7697</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@gem_basic@multigpu-create=
-close.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume@tile64-compressed-compfmt0-smem-lmem0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-dg2-4/igt@gem_ccs@suspend-resume@til=
e64-compressed-compfmt0-smem-lmem0.html">INCOMPLETE</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16348">i91=
5#16348</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-process:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-tglu-9/igt@gem_close_race@multigpu-b=
asic-process.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-big:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-tglu-1/igt@gem_create@create-ext-cpu=
-access-big.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/6335">i915#6335</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@engines:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@gem_ctx_sseu@engines.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/280">i915#280</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-rkl-4/igt@gem_ctx_sseu@engines.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@execbuf:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-dg1-14/igt@gem_eio@execbuf.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg1-1=
9/igt@gem_eio@execbuf.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) +3 other tests dme=
sg-warn</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@invalid-bonds:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@gem_exec_balancer@invalid=
-bonds.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/4036">i915#4036</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-submit-fence:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-tglu-1/igt@gem_exec_balancer@paralle=
l-keep-submit-fence.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-out-fence:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-rkl-8/igt@gem_exec_balancer@parallel=
-out-fence.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-glk10/igt@gem_exec_capture@capture-i=
nvisible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/6334">i915#6334</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-concurrent16:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-rkl-8/igt@gem_exec_reloc@basic-concu=
rrent16.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/3281">i915#3281</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@semaphore-power:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-rkl-8/igt@gem_exec_schedule@semaphor=
e-power.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/7276">i915#7276</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@gem_fenced_exec_thrash@no=
-spare-fences-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/4860">i915#4860</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-random:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-glk3/igt@gem_lmem_swapping@heavy-ran=
dom.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4613">i915#4613</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random-engines:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-tglu-9/igt@gem_lmem_swapping@random-=
engines.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/4613">i915#4613</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-rkl-8/igt@gem_lmem_swapping@verify-c=
cs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/4613">i915#4613</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-uncached:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-rkl-8/igt@gem_partial_pwrite_pread@w=
rites-after-reads-uncached.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +4 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-glk6/igt@gem_pread@exhaustion.html">=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/2658">i915#2658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-tglu-9/igt@gem_pwrite@basic-exhausti=
on.html">WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/2658">i915#2658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@fail-invalid-protected-context:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@gem_pxp@fail-invalid-prot=
ected-context.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/4270">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_readwrite@write-bad-handle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@gem_readwrite@write-bad-h=
andle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3282">i915#3282</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiling_max_stride:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@gem_tiling_max_stride.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/4077">i915#4077</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-unsync:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-rkl-8/igt@gem_userptr_blits@dmabuf-u=
nsync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-cycles:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-tglu-9/igt@gem_userptr_blits@unsync-=
unmap-cycles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-fd:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-glk11/igt@gem_workarounds@suspend-re=
sume-fd.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/14586">i915#14586</a>)</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@bitmasks:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-glk10/igt@gen7_exec_parse@bitmasks.h=
tml">SKIP</a> +123 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected-ctx-param:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-tglu-9/igt@gen9_exec_parse@basic-rej=
ected-ctx-param.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/2527">i915#2527</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-far:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-tglu-1/igt@gen9_exec_parse@bb-start-=
far.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/2527">i915#2527</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/2856">i915#2856</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-param:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-rkl-8/igt@gen9_exec_parse@bb-start-p=
aram.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/2527">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18941/shard-dg2-3/igt@i915_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-8/igt@=
i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/CI_DRM_18941/shard-dg2-1/igt@i915_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/sha=
rd-dg2-6/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-1/igt@i915_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_=
DRM_18941/shard-dg2-8/igt@i915_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-10/igt@i915=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/CI_DRM_18941/shard-dg2-5/igt@i915_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-d=
g2-8/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-1/igt@i915_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_=
18941/shard-dg2-10/igt@i915_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-6/igt@i915_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/CI_DRM_18941/shard-dg2-4/igt@i915_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-4=
/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-3/igt@i915_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_1894=
1/shard-dg2-7/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-4/igt@i915_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18941/shard-dg2-10/igt@i915_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-3/igt=
@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/CI_DRM_18941/shard-dg2-7/igt@i915_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/sh=
ard-dg2-7/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-3/igt@i915_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI=
_DRM_18941/shard-dg2-10/igt@i915_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18941/shard-dg2-5/igt@i=
915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/CI_DRM_18941/shard-dg2-5/igt@i915_module_load@load.html">PASS=
</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_=
171534v1/shard-dg2-4/igt@i915_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-4/igt@=
i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/Patchwork_171534v1/shard-dg2-6/igt@i915_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_=
171534v1/shard-dg2-5/igt@i915_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-8/igt@=
i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@i915_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork=
_171534v1/shard-dg2-8/igt@i915_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-6/igt=
@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@i915_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwor=
k_171534v1/shard-dg2-1/igt@i915_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-7/ig=
t@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/Patchwork_171534v1/shard-dg2-7/igt@i915_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwor=
k_171534v1/shard-dg2-8/igt@i915_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-3/ig=
t@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/Patchwork_171534v1/shard-dg2-4/igt@i915_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwor=
k_171534v1/shard-dg2-7/igt@i915_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-5/ig=
t@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/Patchwork_171534v1/shard-dg2-4/igt@i915_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwor=
k_171534v1/shard-dg2-5/igt@i915_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-6/ig=
t@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/Patchwork_171534v1/shard-dg2-1/igt@i915_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwor=
k_171534v1/shard-dg2-3/igt@i915_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/i=
gt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-1/igt@i915_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwo=
rk_171534v1/shard-dg2-10/igt@i915_module_load@load.html">DMESG-WARN</a>) (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16759">i9=
15#16759</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-reset-multiple:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-tglu-9/igt@i915_pm_freq_api@freq-res=
et-multiple.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/8399">i915#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_mult@media-freq@gt0:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-tglu-1/igt@i915_pm_freq_mult@media-f=
req@gt0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/6590">i915#6590</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@i915_pm_rps@thresholds.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/11681">i915#11681</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-dg1-12/igt@i915_suspend@basic-s3-without-i915.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_1=
71534v1/shard-dg1-16/igt@i915_suspend@basic-s3-without-i915.html">DMESG-WAR=
N</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4=
391">i915#4391</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@debugfs-reader:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-8/igt@i915_suspend@debugfs-reader.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/=
shard-rkl-4/igt@i915_suspend@debugfs-reader.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817">i915#4817=
</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-tglu-1/igt@intel_hwmon@hwmon-read.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/7707">i915#7707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@kms_addfb_basic@basic-y-t=
iled-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/4215">i915#4215</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-glk6/igt@kms_async_flips@alternate-s=
ync-async-flip-atomic@pipe-a-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/14888">i915#14888</a>) +2 oth=
er tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-tglu-9/igt@kms_big_fb@4-tiled-addfb-=
size-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-rkl-4/igt@kms_big_fb@4-tiled-max-hw-=
stride-32bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw=
-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +3 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-rkl-8/igt@kms_big_fb@linear-8bpp-rot=
ate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/3638">i915#3638</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-rkl-4/igt@kms_big_fb@linear-max-hw-s=
tride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-tglu-9/igt@kms_big_fb@linear-max-hw-=
stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-dg2-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate=
-180-async-flip.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@kms_big_fb@x-tiled-max-hw=
-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/16707">i915#16707</a>) +20 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@kms_big_fb@y-tiled-max-hw=
-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707">i915#16707</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#=
5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-dg2-4/igt@kms_ccs@bad-aux-stride-y-t=
iled-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434">i915#10434</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915=
#6095</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-glk11/igt@kms_ccs@bad-pixel-format-y=
-tiled-gen12-rc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> +44 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-tglu-1/igt@kms_ccs@bad-rotation-90-4=
-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/12313">i915#12313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-dg1-19/igt@kms_ccs@bad-rotation-90-4=
-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +243 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-tglu-9/igt@kms_ccs@crc-primary-basic=
-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +4 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-tglu-1/igt@kms_ccs@crc-primary-suspe=
nd-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-rkl-4/igt@kms_ccs@crc-primary-suspen=
d-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/12805">i915#12805</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-dg2-6/igt@kms_ccs@crc-primary-suspen=
d-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-3.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +3 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-tglu-9/igt@kms_ccs@crc-sprite-planes=
-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-rkl-5/igt@kms_ccs@crc-sprite-planes-=
basic-y-tiled-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095=
</a>) +41 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-dg2-4/igt@kms_ccs@missing-ccs-buffer=
-yf-tiled-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) =
+85 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-rkl-7/igt@kms_ccs@random-ccs-data-4-=
tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +67 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-tglu-9/igt@kms_cdclk@plane-scaling.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/3742">i915#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-ctm3x4:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-rkl-8/igt@kms_chamelium_color_pipeli=
ne@plane-ctm3x4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/16471">i915#16471</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-fast:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@kms_chamelium_hpd@dp-hpd-=
fast.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-rkl-4/igt@kms_chamelium_hpd@dp-hpd-f=
ast.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/7828">i915#7828</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm-disable:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-tglu-1/igt@kms_chamelium_hpd@dp-hpd-=
storm-disable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +1 other test sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-tglu-9/igt@kms_chamelium_hpd@vga-hpd=
-for-each-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-6/igt@kms_color@deep-color.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-r=
kl-5/igt@kms_color@deep-color.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/12655">i915#12655</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)<=
/li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-tglu-1/igt@kms_color@deep-color.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/9979">i915#9979</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@kms_color_pipeline@plane-=
lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/15529">i915#15529</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-hdcp14:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-tglu-9/igt@kms_content_protection@at=
omic-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/15865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-tglu-1/igt@kms_content_protection@dp=
-mst-lic-type-0-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-tglu-1/igt@kms_content_protection@dp=
-mst-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/15330">i915#15330</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-tglu-1/igt@kms_content_protection@ue=
vent.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/15865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent-hdcp14:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-rkl-8/igt@kms_content_protection@uev=
ent-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/15865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x42@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-rkl-5/igt@kms_cursor_crc@cursor-onsc=
reen-128x42@pipe-a-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +2 other tests f=
ail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-tglu-10/igt@kms_cursor_crc@cursor-onscreen-256x85.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwo=
rk_171534v1/shard-tglu-9/igt@kms_cursor_crc@cursor-onscreen-256x85.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
13566">i915#13566</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-tglu-9/igt@kms_cursor_crc@cursor-ons=
creen-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-tglu-1/igt@kms_cursor_crc@cursor-ran=
dom-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-max-size:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-glk6/igt@kms_cursor_crc@cursor-rando=
m-max-size.html">SKIP</a> +273 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-rkl-4/igt@kms_cursor_crc@cursor-rapi=
d-movement-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-tglu-9/igt@kms_cursor_legacy@basic-b=
usy-flip-before-cursor-varying-size.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-rkl-4/igt@kms_cursor_legacy@short-bu=
sy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#41=
03</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev@basic:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-tglu-9/igt@kms_dp_aux_dev@basic.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/1257">i915#1257</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-rkl-4/igt@kms_dp_link_training@non-u=
hbr-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/13749">i915#13749</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-tglu-1/igt@kms_dp_linktrain_fallback=
@dsc-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/13707">i915#13707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-rkl-8/igt@kms_dsc@dsc-basic.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
16361">i915#16361</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic-bigjoiner:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-tglu-1/igt@kms_dsc@dsc-basic-bigjoin=
er.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/16361">i915#16361</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats-bigjoiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-tglu-9/igt@kms_dsc@dsc-with-formats-=
bigjoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/16361">i915#16361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-glk10/igt@kms_fbcon_fbt@fbc-suspend.=
html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/9878">i915#9878</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-tglu-1/igt@kms_feature_discovery@dis=
play-2x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/16081">i915#16081</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-rkl-8/igt@kms_feature_discovery@disp=
lay-3x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/16081">i915#16081</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dsc:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-tglu-1/igt@kms_feature_discovery@dsc=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/16600">i915#16600</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-rkl-4/igt@kms_feature_discovery@psr1=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@kms_flip@2x-absolute-wf_v=
blank.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/9934">i915#9934</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-rkl-4/igt@kms_flip@2x-flip-vs-pannin=
g-vs-hang.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/9934">i915#9934</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:=
</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-tglu-9/igt@kms_flip@2x-single-buffer=
-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915=
#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-tglu-1/igt@kms_flip@2x-wf_vblank-ts-=
check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3637">i915#3637</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/9934">i915#9934</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-dg1-17/igt@kms_flip@flip-vs-absolute-wf_vblank-interrup=
tible.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/Patchwork_171534v1/shard-dg1-15/igt@kms_flip@flip-vs-absolute-wf_vblank=
-interruptible.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/14600">i915#14600</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@d-hdmi-a1:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-dg1-15/igt@kms_flip@flip-vs-absolute=
-wf_vblank-interruptible@d-hdmi-a1.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/14600">i915#14600</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@kms_flip@flip-vs-dpms-off=
-vs-modeset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-dg2-3/igt@kms_flip@flip-vs-expired-vblank-interruptible=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/P=
atchwork_171534v1/shard-dg2-4/igt@kms_flip@flip-vs-expired-vblank-interrupt=
ible.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/13027">i915#13027</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-mtlp-7/igt@kms_flip@flip-vs-expired-vblank-interruptibl=
e@c-edp1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/Patchwork_171534v1/shard-mtlp-8/igt@kms_flip@flip-vs-expired-vblank-=
interruptible@c-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/13027">i915#13027</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-dg2-4/igt@kms_flip@flip-vs-expired-v=
blank-interruptible@d-hdmi-a1.html">FAIL</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/13027">i915#13027</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-dg2-4/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-mo=
deset-interruptible.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@kms_flip@single-buffe=
r-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +1=
 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-tglu-9/igt@kms_flip_scaled_crc@flip-=
32bpp-4tile-to-64bpp-4tile-upscaling.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +1 othe=
r test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:<=
/p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-tglu-1/igt@kms_flip_scaled_crc@flip-=
32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +1=
 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@kms_flip_scaled_crc@flip-=
64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813">i9=
15#8813</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-rkl-4/igt@kms_flip_scaled_crc@flip-6=
4bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) =
+1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-tglu-1/igt@kms_frontbuffer_tracking@=
fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> +53 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork=
_171534v1/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16=
708">i915#16708</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/5354">i915#5354</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-pwrite:</=
p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-tglu-9/igt@kms_frontbuffer_tracking@=
fbchdr-1p-primscrn-pri-indfb-draw-pwrite.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +5 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-mmap-gtt:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-glk8/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw=
-mmap-gtt.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/Patchwork_171534v1/shard-glk6/igt@kms_frontbuffer_tracking@fbchdr-r=
gb101010-draw-mmap-gtt.html">SKIP</a> +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-rkl-4/igt@kms_frontbuffer_tracking@f=
bchdr-rgb565-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +9 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-tglu-9/igt@kms_frontbuffer_tracking@=
fbcpsr-modesetfrombusy.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +11 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-rkl-4/igt@kms_frontbuffer_tracking@f=
bcpsr-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-shrfb-draw-mmap-=
cpu:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-tglu-1/igt@kms_frontbuffer_tracking@=
fbcpsrhdr-1p-offscreen-pri-shrfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a=
>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-rkl-8/igt@kms_frontbuffer_tracking@f=
bcpsrhdr-2p-scndscrn-spr-indfb-move.html">SKIP</a> +44 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-shrfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@kms_frontbuffer_tracking@=
fbcpsrhdr-2p-shrfb-fliptrack-mmap-gtt.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a>) +17 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-=
indfb-draw-blt.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/Patchwork_171534v1/shard-rkl-3/igt@kms_frontbuffer_tracking@hd=
r-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +15 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-modesetfrombusy:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-tglu-1/igt@kms_frontbuffer_tracking@=
hdr-modesetfrombusy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/15989">i915#15989</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@kms_frontbuffer_tracking@=
psr-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5=
354</a>) +7 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-rkl-4/igt@kms_frontbuffer_tracking@p=
sr-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +3 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-tglu-9/igt@kms_frontbuffer_tracking@=
psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> +20 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-rkl-8/igt@kms_frontbuffer_tracking@p=
sr-rgb101010-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) +8 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-rgb101010-draw-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-rkl-8/igt@kms_frontbuffer_tracking@p=
srhdr-rgb101010-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +12 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-tglu-9/igt@kms_hdr@bpc-switch.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-2-xrgb2101010:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-rkl-6/igt@kms_hdr@bpc-switch-suspend=
@pipe-a-hdmi-a-2-xrgb2101010.html">INCOMPLETE</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/15436">i915#15436</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-rkl-8/igt@kms_hdr@static-swap.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/16644">i915#16644</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-6/igt@kms_hdr@static-toggle.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-=
rkl-3/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/16644">i915#16644</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228"=
>i915#8228</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-tglu-1/igt@kms_hdr@static-toggle.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-hdisplay:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-dg2-4/igt@kms_invalid_mode@zero-hdisplay.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534=
v1/shard-dg2-10/igt@kms_invalid_mode@zero-hdisplay.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16746">i915#167=
46</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-tglu-1/igt@kms_joiner@basic-force-bi=
g-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/15459">i915#15459</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@kms_joiner@invalid-modese=
t-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/15460">i915#15460</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-rkl-4/igt@kms_joiner@invalid-modeset=
-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/15460">i915#15460</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-rkl-8/igt@kms_joiner@switch-modeset-=
ultra-joiner-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/15638">i915#15638</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/15722">i915#15722</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-rkl-4/igt@kms_multipipe_modeset@basi=
c-max-pipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/15815">i915#15815</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@kms_pipe_b_c_ivb@pipe-b-d=
ouble-modeset-then-modeset-pipe-c.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-untiled:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-glk3/igt@kms_pipe_stress@stress-xrgb=
8888-untiled.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/118">i915#118</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-tglu-9/igt@kms_plane@pixel-format-4-=
tiled-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping:<=
/p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-rkl-4/igt@kms_plane@pixel-format-4-t=
iled-mtl-mc-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +1 =
other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-tglu-1/igt@kms_plane@pixel-format-yf=
-tiled-ccs-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/15709">i915#15709</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-dg2-7/igt@kms_plane@planar-pixel-for=
mat-settings@nv12-tile4-src-y.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/16112">i915#16112</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@kms_plane@plane-panning-b=
ottom-right.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/8825">i915#8825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-opaque-fb:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-glk10/igt@kms_plane_alpha_blend@alph=
a-opaque-fb.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/10647">i915#10647</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/12169">i915#12169</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-glk10/igt@kms_plane_alpha_blend@alph=
a-opaque-fb@pipe-c-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/10647">i915#10647</a>) +1 other test fa=
il</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-rkl-4/igt@kms_plane_multiple@2x-tili=
ng-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-tglu-9/igt@kms_plane_multiple@2x-til=
ing-none.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a:<=
/p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-rkl-8/igt@kms_plane_scaling@plane-do=
wnscale-factor-0-75-with-rotation@pipe-a.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +3 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-dg2-4/igt@kms_plane_scaling@plane-upscale-20x20-with-mo=
difiers.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/Patchwork_171534v1/shard-dg2-10/igt@kms_plane_scaling@plane-upscale-2=
0x20-with-modifiers.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) +1 other t=
est skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers@pipe-d:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-dg2-4/igt@kms_plane_scaling@plane-upscale-20x20-with-mo=
difiers@pipe-d.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@kms_plane_scaling@plane-up=
scale-20x20-with-modifiers@pipe-d.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +7 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@kms_plane_scaling@planes-=
downscale-factor-0-75.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9=
423">i915#9423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@kms_plane_scaling@planes-=
downscale-factor-0-75@pipe-b.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +3 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-tglu-1/igt@kms_pm_backlight@bad-brig=
htness.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/12343">i915#12343</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/9812">i915#9812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-rkl-4/igt@kms_pm_backlight@brightnes=
s-with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/12343">i915#12343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-dg2-4/igt@kms_pm_rpm@dpms-lpsp.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-d=
g2-10/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@drm-resources-equal:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-dg2-4/igt@kms_pm_rpm@drm-resources-equal.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534=
v1/shard-dg2-10/igt@kms_pm_rpm@drm-resources-equal.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3547">i915#3547=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-5/igt@kms_pm_rpm@modeset-lpsp-stress.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534=
v1/shard-rkl-4/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#150=
73</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-dg1-15/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwo=
rk_171534v1/shard-dg1-13/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-hybrid:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@kms_prime@basic-crc-hybri=
d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/6524">i915#6524</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/6805">i915#6805</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-rkl-4/igt@kms_prime@basic-crc-hybrid=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/6524">i915#6524</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-glk10/igt@kms_psr2_sf@fbc-pr-cursor-=
plane-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +4 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:</=
p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@kms_psr2_sf@fbc-psr2-curs=
or-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-glk2/igt@kms_psr2_sf@fbc-psr2-cursor=
-plane-update-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/11520">i915#11520</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-rkl-8/igt@kms_psr2_sf@pr-overlay-pla=
ne-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +3 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-tglu-9/igt@kms_psr2_sf@pr-primary-pl=
ane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-glk11/igt@kms_psr2_sf@psr2-overlay-p=
lane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-tglu-1/igt@kms_psr2_sf@psr2-overlay-=
plane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +5 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-dpms:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-tglu-1/igt@kms_psr@fbc-psr-dpms.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/9732">i915#9732</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@kms_psr@fbc-psr-primary-b=
lt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/9732">i915#9732</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-mmap-cpu:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-tglu-9/igt@kms_psr@pr-sprite-mmap-cp=
u.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/9732">i915#9732</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-rkl-4/igt@kms_psr@psr2-cursor-mmap-g=
tt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/9732">i915#9732</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-tglu-1/igt@kms_psr_stress_test@inval=
idate-primary-flip-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/15949">i915#15949</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-glk11/igt@kms_rotation_crc@multiplan=
e-rotation-cropping-bottom.html">INCOMPLETE</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15500">i915#15500</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16184">i915#16184<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-tglu-1/igt@kms_scaling_modes@scaling=
-mode-none.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-rkl-8/igt@kms_setmode@basic-clone-si=
ngle-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@kms_vblank@ts-continuatio=
n-dpms-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/16707">i915#16707</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-tglu-9/igt@kms_vrr@seamless-rr-switc=
h-drrs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_udl@share-import:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-tglu-1/igt@prime_udl@share-import.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/16420">i915#16420</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-6:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-tglu-9/igt@sriov_basic@enable-vfs-au=
toprobe-off@numvfs-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/16066">i915#16066</a>) +9 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-dg2-3/igt@gem_ccs@suspend-resume@linear-compressed-comp=
fmt0-smem-lmem0.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/16348">i915#16348</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shar=
d-dg2-4/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.ht=
ml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-3/igt@gem_ctx_isolation@preservation-s3.html">INCOM=
PLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/13356">i915#13356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/Patchwork_171534v1/shard-rkl-4/igt@gem_ctx_isolation@preservation-=
s3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-dg2-6/igt@gem_exec_suspend@basic-s0.html">INCOMPLETE</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356=
">i915#13356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/Patchwork_171534v1/shard-dg2-10/igt@gem_exec_suspend@basic-s0.html">PASS</=
a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@crtc-invalid-params-fence:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-dg2-10/igt@kms_atomic@crtc-invalid-params-fence.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/16707">i915#16707</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/Patchwork_171534v1/shard-dg2-6/igt@kms_atomic@crtc-invalid-params-fe=
nce.html">PASS</a> +26 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@p=
ipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-mtlp-4/igt@kms_atomic_transition@plane-all-modeset-tran=
sition-internal-panels@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/5956">i915#5956</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-mt=
lp-8/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels=
@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotat=
e-0-hflip.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/15733">i915#15733</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/5138">i915#5138</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-mtlp-8/igt@k=
ms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-dg2-10/igt@kms_color@gamma.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655">i915#12655</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_1715=
34v1/shard-dg2-6/igt@kms_color@gamma.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-dg2-10/igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/15529">i915#15529</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/Patchwork_171534v1/shard-dg2-6/igt@kms_color_pipeline@plane-lut=
1d-pre-ctm3x4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-5/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hd=
mi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/13566">i915#13566</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-2/igt@kms_cursor_crc@curs=
or-random-256x85@pipe-a-hdmi-a-1.html">PASS</a> +3 other tests pass</li>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-tglu-4/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-h=
dmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/13566">i915#13566</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/Patchwork_171534v1/shard-tglu-10/igt@kms_cursor_crc@c=
ursor-random-256x85@pipe-a-hdmi-a-1.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-dg1-15/igt@kms_flip@flip-vs-blocking-wf-vblank.html">DM=
ESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/4423">i915#4423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/Patchwork_171534v1/shard-dg1-13/igt@kms_flip@flip-vs-blocking-wf-=
vblank.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-dg2-10/igt@kms_flip@flip-vs-suspend.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#=
5354</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwo=
rk_171534v1/shard-dg2-6/igt@kms_flip@flip-vs-suspend.html">PASS</a> +5 othe=
r tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-dg2-10/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bp=
p-xtile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/8813">i915#8813</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-7=
/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html">PA=
SS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-3/igt@kms_frontbuffer_tracking@fbc-suspend.html">IN=
COMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/10056">i915#10056</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/Patchwork_171534v1/shard-rkl-8/igt@kms_frontbuffer_tracking@fbc=
-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-blt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-4/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-dra=
w-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/15989">i915#15989</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-6/igt@kms_frontbuffer_trac=
king@fbchdr-rgb101010-draw-blt.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-glk1/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-s=
hrfb-draw-render.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/Patchwork_171534v1/shard-glk8/igt@kms_frontbuffer_tracking@h=
dr-1p-primscrn-pri-shrfb-draw-render.html">PASS</a> +11 other tests pass</l=
i>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-dg2-10/igt@kms_pipe_crc_basic@read-crc.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190">i=
915#11190</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/16707">i915#16707</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-dg2-7/igt@kms_pipe_crc_basic@read-cr=
c.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clampin=
g:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-dg2-10/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc=
-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/8825">i915#8825</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-7/igt@km=
s_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping.html">P=
ASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@planar-pixel-format-settings:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-dg2-10/igt@kms_plane@planar-pixel-format-settings.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/16753">i915#16753</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/Patchwork_171534v1/shard-dg2-7/igt@kms_plane@planar-pixel-format-s=
ettings.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-d:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-dg2-10/igt@kms_plane_scaling@plane-upscale-20x20-with-r=
otation@pipe-d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/15329">i915#15329</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-7/igt@kms_plane_s=
caling@plane-upscale-20x20-with-rotation@pipe-d.html">PASS</a> +11 other te=
sts pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-dg2-10/igt@kms_plane_scaling@plane-upscale-factor-0-25-=
with-rotation.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/15329">i915#15329</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-6/ig=
t@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation.html">PASS</a> =
+1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:</=
p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-dg2-10/igt@kms_plane_scaling@planes-downscale-factor-0-=
5-upscale-factor-0-25.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_1=
71534v1/shard-dg2-6/igt@kms_plane_scaling@planes-downscale-factor-0-5-upsca=
le-factor-0-25.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-dg2-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15=
073">i915#15073</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/Patchwork_171534v1/shard-dg2-8/igt@kms_pm_rpm@modeset-non-lpsp-stress.h=
tml">PASS</a> +1 other test pass</li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-8/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15=
073">i915#15073</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/Patchwork_171534v1/shard-rkl-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.h=
tml">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-dg2-10/igt@kms_pm_rpm@system-suspend-modeset.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/35=
47">i915#3547</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/Patchwork_171534v1/shard-dg2-6/igt@kms_pm_rpm@system-suspend-modeset.html=
">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-legacy:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-dg2-10/igt@kms_properties@plane-properties-legacy.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/11521">i915#11521</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/Patchwork_171534v1/shard-dg2-6/igt@kms_properties@plane-properties=
-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@rcs0:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-mtlp-7/igt@perf_pmu@busy-double-start@rcs0.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349=
">i915#4349</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
Patchwork_171534v1/shard-mtlp-6/igt@perf_pmu@busy-double-start@rcs0.html">P=
ASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@gt-awake:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-dg1-15/igt@perf_pmu@gt-awake.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16538">i915#16538<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17=
1534v1/shard-dg1-13/igt@perf_pmu@gt-awake.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-reloc-purge-cache:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-4/igt@api_intel_bb@blit-reloc-purge-cache.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8=
411">i915#8411</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/Patchwork_171534v1/shard-rkl-6/igt@api_intel_bb@blit-reloc-purge-cache.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@device_reset@cold-reset-bound:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-6/igt@device_reset@cold-reset-bound.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078">=
i915#11078</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/Patchwork_171534v1/shard-rkl-3/igt@device_reset@cold-reset-b=
ound.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/11078">i915#11078</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-copy-compressed:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-6/igt@gem_ccs@block-copy-compressed.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">=
i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/9323">i915#9323</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-3/igt@gem_ccs@block=
-copy-compressed.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-compressed:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-4/igt@gem_ccs@block-multicopy-compressed.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/93=
23">i915#9323</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/Patchwork_171534v1/shard-rkl-6/igt@gem_ccs@block-multicopy-compressed.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-big:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-6/igt@gem_create@create-ext-cpu-access-big.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/6335">i915#6335</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-3/igt@gem_create@create-ex=
t-cpu-access-big.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/6335">i915#6335</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-set-pat:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-4/igt@gem_create@create-ext-set-pat.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562">i=
915#8562</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Pat=
chwork_171534v1/shard-rkl-6/igt@gem_create@create-ext-set-pat.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544=
">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/8562">i915#8562</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-6/igt@gem_exec_balancer@parallel-ordering.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
4544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/4525">i915#4525</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-3/igt@gem_exec_balancer@par=
allel-ordering.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/4525">i915#4525</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-6/igt@gem_exec_reloc@basic-write-read.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544=
">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3281">i915#3281</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/Patchwork_171534v1/shard-rkl-3/igt@gem_exec_reloc@basic-writ=
e-read.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3281">i915#3281</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read-noreloc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-4/igt@gem_exec_reloc@basic-write-read-noreloc.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3281">i915#3281</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/Patchwork_171534v1/shard-rkl-6/igt@gem_exec_reloc@basic-write-read-n=
oreloc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-6/igt@gem_lmem_swapping@heavy-verify-random.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/4613">i915#4613</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-3/igt@gem_lmem_swapping@h=
eavy-verify-random.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-multi:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-4/igt@gem_lmem_swapping@parallel-multi.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613=
">i915#4613</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
Patchwork_171534v1/shard-rkl-6/igt@gem_lmem_swapping@parallel-multi.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-6/igt@gem_partial_pwrite_pread@reads.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"=
>i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3282">i915#3282</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-rkl-3/igt@gem_partial_pwrite_pread@r=
eads.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3282">i915#3282</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@write:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-4/igt@gem_partial_pwrite_pread@write.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">=
i915#3282</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Pa=
tchwork_171534v1/shard-rkl-6/igt@gem_partial_pwrite_pread@write.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/145=
44">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@untiled-to-tiled:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-6/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/8411">i915#8411</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-3/igt@gem_set_tiling_vs_=
blt@untiled-to-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@create-destroy-unsync:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-4/igt@gem_userptr_blits@create-destroy-unsync.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3297">i915#3297</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/Patchwork_171534v1/shard-rkl-6/igt@gem_userptr_blits@create-destroy-=
unsync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-without-end:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-4/igt@gen9_exec_parse@batch-without-end.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/252=
7">i915#2527</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/Patchwork_171534v1/shard-rkl-6/igt@gen9_exec_parse@batch-without-end.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/2527">i915#2527</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-far:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-6/igt@gen9_exec_parse@bb-start-far.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i=
915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/2527">i915#2527</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/Patchwork_171534v1/shard-rkl-5/igt@gen9_exec_parse@bb-start-far=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/2527">i915#2527</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-mtlp-8/igt@i915_module_load@fault-injection.html">ABORT=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15=
342">i915#15342</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/15481">i915#15481</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/Patchwork_171534v1/shard-mtlp-6/igt@i915_module_load@fa=
ult-injection.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/15895">i915#15895</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/16719">i915#16719</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@__uc_init:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-mtlp-8/igt@i915_module_load@fault-injection@__uc_init.h=
tml">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/15481">i915#15481</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-mtlp-6/igt@i915_module_load@fault-in=
jection@__uc_init.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/15895">i915#15895</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/16719">i915#16719</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-basic-api:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-6/igt@i915_pm_freq_api@freq-basic-api.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544=
">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/8399">i915#8399</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/Patchwork_171534v1/shard-rkl-3/igt@i915_pm_freq_api@freq-bas=
ic-api.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/8399">i915#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_mult@media-freq@gt0:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-6/igt@i915_pm_freq_mult@media-freq@gt0.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/6590">i915#6590</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/Patchwork_171534v1/shard-rkl-5/igt@i915_pm_freq_mult@media-=
freq@gt0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/6590">i915#6590</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_power@sanity:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-4/igt@i915_power@sanity.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984">i915#7984</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17153=
4v1/shard-rkl-6/igt@i915_power@sanity.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984">i915#79=
84</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-tiled2untiled:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-1/igt@i915_suspend@fence-restore-tiled2untiled.html=
">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/15140">i915#15140</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/Patchwork_171534v1/shard-rkl-6/igt@i915_suspend@fence-restore-ti=
led2untiled.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/4817">i915#4817</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-6/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14=
544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/7707">i915#7707</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/Patchwork_171534v1/shard-rkl-3/igt@intel_hwmon@hwmon-read.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/770=
7">i915#7707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-4/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/12454">i915#12454</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/12712">i915#12712</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-6/igt@kms_addfb_b=
asic@invalid-smem-bo-on-discrete.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/12454">i915#12454</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12712">i915#12712<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:<=
/p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-dg2-10/igt@kms_atomic_transition@plane-all-modeset-tran=
sition-internal-panels.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/16707">i915#16707</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-6/igt@kms=
_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/176=
9">i915#1769</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate=
-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-6/igt@kms_big_=
fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i91=
5#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate=
-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-3/igt@kms=
_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286=
</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-dg2-10/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16=
707">i915#16707</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/Patchwork_171534v1/shard-dg2-6/igt@kms_big_fb@linear-16bpp-rotate-90.ht=
ml">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-dg2-4/igt@kms_big_fb@linear-64bpp-rotate-270.html">SKIP=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17=
1534v1/shard-dg2-10/igt@kms_big_fb@linear-64bpp-rotate-270.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707">i=
915#16707</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-6/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3638">i915#3638</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-5/igt@kms_big_fb@y-tiled-64b=
pp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/3638">i915#3638</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-dg2-4/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/453=
8">i915#4538</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/5190">i915#5190</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@kms_big_fb@y-tiled-8bpp-=
rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/16707">i915#16707</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +5 other tests skip<=
/li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-4/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/363=
8">i915#3638</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/Patchwork_171534v1/shard-rkl-6/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3638">i915#3638</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-dg2-10/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotat=
e-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/16707">i915#16707</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/5190">i915#5190</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-6/igt@kms_big_=
fb@y-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#51=
90</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-dg2-10/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
16707">i915#16707</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/Patchwork_171534v1/shard-dg2-6/igt@kms_ccs@bad-aux-stride-yf-tiled-cc=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/10307">i915#10307</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/6095">i915#6095</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/12313">i915#12313</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-3/igt@kms_ccs@bad-rot=
ation-90-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-dg2-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-=
ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/12313">i915#12313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@kms_ccs@crc-primary-r=
otation-180-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/16707">i915#16707</a>)</li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-=
ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/12313">i915#12313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-6/igt@kms_ccs@crc-primary-ro=
tation-180-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-2:</=
p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-cc=
s-cc@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-r=
kl-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-2.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/6095">i915#6095</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2:</=
p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-cc=
s-cc@pipe-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#609=
5</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_=
171534v1/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@=
pipe-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +22 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-dg2-10/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-c=
cs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/16707">i915#16707</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/Patchwork_171534v1/shard-dg2-6/igt@kms_ccs@crc-primary-sus=
pend-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/6095">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-dg2-10/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-=
ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/16707">i915#16707</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-6/igt@kms_ccs@crc-sprite-pla=
nes-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-r=
c-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/14098">i915#14098</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-6/igt@kms_cc=
s@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"=
>i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/6095">i915#6095</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2:<=
/p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-r=
c-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-6/igt@kms_cc=
s@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"=
>i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/6095">i915#6095</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-dg2-6/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/10307">i915#10307</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@kms_ccs@rando=
m-ccs-data-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/16707">i915#16707</a>) +4 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-multiple:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-6/igt@kms_chamelium_frames@hdmi-crc-multiple.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-3/igt@km=
s_chamelium_frames@hdmi-crc-multiple.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#782=
8</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-fast:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-4/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151"=
>i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/7828">i915#7828</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-rkl-6/igt@kms_chamelium_hpd@vga-hpd-=
fast.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +5 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-dg2-4/igt@kms_content_protection@content-type-change.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/15865">i915#15865</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@kms_content_protection@cont=
ent-type-change.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/16707">i915#16707</a>)</li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-4/igt@kms_content_protection@content-type-change.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/15865">i915#15865</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/Patchwork_171534v1/shard-rkl-6/igt@kms_content_protection@conte=
nt-type-change.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-6/igt@kms_content_protection@dp-mst-lic-type-0-hdcp=
14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/15330">i915#15330</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-5/igt@kms_con=
tent_protection@dp-mst-lic-type-0-hdcp14.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>) +1 =
other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-7/igt@kms_content_protection@dp-mst-lic-type-1.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/15330">i915#15330</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/3116">i915#3116</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-6/igt@kms_content_prot=
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
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-6/igt@kms_content_protection@dp-mst-type-0.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/15330">i915#15330</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/3116">i915#3116</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-3/igt@kms_=
content_protection@dp-mst-type-0.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-hdcp14:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-dg2-10/igt@kms_content_protection@dp-mst-type-0-hdcp14.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/16707">i915#16707</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-dg2-7/igt@kms_content_protection@dp-=
mst-type-0-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-6/igt@kms_content_protection@uevent.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">=
i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/15865">i915#15865</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/Patchwork_171534v1/shard-rkl-5/igt@kms_content_protection@ue=
vent.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/15865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-dg1-19/igt@kms_cursor_crc@cursor-random-32x32.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3=
555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/4423">i915#4423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/Patchwork_171534v1/shard-dg1-12/igt@kms_cursor_crc@cursor-=
random-32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-6/igt@kms_cursor_crc@cursor-random-512x170.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
13049">i915#13049</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-3/igt@kms_cursor_crc@cur=
sor-random-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-max-size:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-dg2-10/igt@kms_cursor_crc@cursor-random-max-size.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/16707">i915#16707</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/Patchwork_171534v1/shard-dg2-7/igt@kms_cursor_crc@cursor-random-max=
-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-dg2-4/igt@kms_cursor_legacy@basic-busy-flip-before-curs=
or-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/4103">i915#4103</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@kms_cursor_legacy=
@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/11190">i915#11190</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707">i915#1=
6707</a>)</li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-4/igt@kms_cursor_legacy@basic-busy-flip-before-curs=
or-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/4103">i915#4103</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-6/igt@kms_cursor_legacy@=
basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#410=
3</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-dg2-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/13046">i915#13046</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@kms_cursor_leg=
acy@cursorb-vs-flipa-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/16707">i915#16707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/3804">i915#3804</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-3/igt@kms_dither=
@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-=
a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/3804">i915#3804</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-3/igt@kms_dith=
er@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-6/igt@kms_dp_linktrain_fallback@dsc-fallback.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/13707">i915#13707</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-3/igt@kms_dp_linktrain=
_fallback@dsc-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/13707">i915#13707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-dg2-10/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707">=
i915#16707</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/P=
atchwork_171534v1/shard-dg2-7/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1636=
1">i915#16361</a>) +1 other test skip</li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-6/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i=
915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/16361">i915#16361</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-rkl-3/igt@kms_dsc@dsc-with-bpc-forma=
ts.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/16361">i915#16361</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-dg2-6/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361=
">i915#16361</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/Patchwork_171534v1/shard-dg2-10/igt@kms_dsc@dsc-with-output-formats.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/16707">i915#16707</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-bigjoiner:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-4/igt@kms_dsc@dsc-with-output-formats-bigjoiner.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/16361">i915#16361</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/Patchwork_171534v1/shard-rkl-6/igt@kms_dsc@dsc-with-output-forma=
ts-bigjoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-6/igt@kms_feature_discovery@display-2x.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/16081">i915#16081</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-3/igt@kms_feature_discovery@=
display-2x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/16081">i915#16081</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-7/igt@kms_feature_discovery@display-4x.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1608=
1">i915#16081</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/Patchwork_171534v1/shard-rkl-6/igt@kms_feature_discovery@display-4x.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/16081">i915#16081</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dsc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-6/igt@kms_feature_discovery@dsc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915=
#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/16600">i915#16600</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/Patchwork_171534v1/shard-rkl-5/igt@kms_feature_discovery@dsc.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/16600">i915#16600</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-glk5/igt@kms_flip@2x-flip-vs-suspend-interruptible.html=
">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/12314">i915#12314</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-glk9=
/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12=
745</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/4839">i915#4839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-glk5/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-h=
dmi-a1-hdmi-a2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/12314">i915#12314</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard=
-glk9/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2.html=
">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/12745">i915#12745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-6/igt@kms_flip@2x-plain-flip.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14=
544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/9934">i915#9934</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/Patchwork_171534v1/shard-rkl-3/igt@kms_flip@2x-plain-flip.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/993=
4">i915#9934</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-4/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/99=
34">i915#9934</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/Patchwork_171534v1/shard-rkl-6/igt@kms_flip@2x-plain-flip-fb-recreate.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/9934">i915#9934</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bp=
p-yftile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/15643">i915#15643</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-6/igt@kms_f=
lip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"=
>i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/15643">i915#15643</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bp=
p-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-r=
kl-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/15643">i915#15643</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur=
-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/16708">i915#16708</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg=
2-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/15990">i915#15990</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/8708">i915#8708</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/5439">i915#5439</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/Patchwork_171534v1/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-tiling=
-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-pwrite:</=
p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-dg1-19/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-=
cur-indfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/15989">i915#15989</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-=
dg1-12/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-pwrit=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/15989">i915#15989</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-s=
hrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-3/igt@kms_frontb=
uffer_tracking@fbchdr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> +73 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-cur-indfb-draw-pwrite:</=
p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-dg2-10/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-=
cur-indfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/16708">i915#16708</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-6/igt@kms_=
frontbuffer_tracking@fbchdr-2p-scndscrn-cur-indfb-draw-pwrite.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991=
">i915#15991</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-dg2-4/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-p=
ri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@kms=
_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/167=
08">i915#16708</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-blt:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-dg2-4/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-dra=
w-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/15989">i915#15989</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@kms_frontbuffer_tra=
cking@fbchdr-rgb101010-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a>) +5 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-3/igt@kms_frontbuffer_tracking@fbchdr-suspend.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/15989">i915#15989</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/Patchwork_171534v1/shard-rkl-1/igt@kms_frontbuffer_tracking@fbchdr=
-suspend.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/15132">i915#15132</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-tiling-4:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-tiling-4.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/5439">i915#5439</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-3/igt@kms_frontbuffer_=
tracking@fbchdr-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt=
:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-=
pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/sh=
ard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-m=
map-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/15102">i915#15102</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-=
pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@kms_fr=
ontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i9=
15#16708</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-=
multidraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/sh=
ard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/15102">i915#15102</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/3023">i915#3023</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu:=
</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-=
cur-indfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/16708">i915#16708</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shar=
d-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap=
-cpu.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/15102">i915#15102</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-p=
ri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@kms_=
frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708=
">i915#16708</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/5354">i915#5354</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt:=
</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-p=
ri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard=
-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap=
-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/16708">i915#16708</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt:=
</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-c=
ur-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard=
-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-=
gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/1825">i915#1825</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-s=
hrfb-pgflip-blt.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_171534v1/shard-rkl-6/igt@kms_frontbuffer_tracking@f=
bcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +28 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-pwrite:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-dra=
w-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/10433">i915#10433</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@=
kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-pwrite.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#1=
6708</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-m=
map-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/15102">i915#15102</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-6/igt@kms_=
frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15=
102">i915#15102</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3023">i915#3023</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-mmap-=
gtt:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscr=
een-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-6/ig=
t@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-mmap-gtt.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/15990">i915#15990</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-linear:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-li=
near.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/16708">i915#16708</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-6/igt@kms_frontbuffer_track=
ing@fbcpsrhdr-tiling-linear.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +8 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-mmap-cpu:</=
p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-dg1-12/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pr=
i-indfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg1-16/igt@kms=
_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-mmap-cpu.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1598=
9">i915#15989</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-dg2-10/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr=
-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/16708">i915#16708</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-7/igt@kms_frontb=
uffer_tracking@hdr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#159=
89</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-gtt:</=
p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pr=
i-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/16708">i915#16708</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-7/igt@kms_=
frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-gtt.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104=
">i915#15104</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/15990">i915#15990</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-dg2-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-=
indfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-4/igt@kms_fr=
ontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-cpu.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433">i=
915#10433</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/15102">i915#15102</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri=
-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/16708">i915#16708</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2=
-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-render.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/15991">i915#15991</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/5354">i915#5354</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-=
indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-6/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i91=
5#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/1825">i915#1825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-=
shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/15991">i915#15991</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-1=
0/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
6708">i915#16708</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/5354">i915#5354</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-indfb-scaledprim=
ary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/10433">i915#10433</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-8/igt@kms_fr=
ontbuffer_tracking@psr-indfb-scaledprimary.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +=
3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-4/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-s=
pr-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-6/igt@kms_frontbuf=
fer_tracking@psrhdr-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1510=
2">i915#15102</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-spr-indfb-draw-render:</=
p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-dg2-4/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-s=
pr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/15991">i915#15991</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@kms_=
frontbuffer_tracking@psrhdr-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708=
">i915#16708</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-4/igt@kms_hdr@bpc-switch-suspend.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644">i91=
5#16644</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/8228">i915#8228</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-6/igt@kms_hdr@bpc-swit=
ch-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/15436">i915#15436</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-dg1-13/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187">i9=
15#1187</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/12713">i915#12713</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/Patchwork_171534v1/shard-dg1-17/igt@kms_hdr@brightness-with-hdr=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/12713">i915#12713</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-dg2-10/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16707">i915#167=
07</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork=
_171534v1/shard-dg2-6/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16518">i915#16518</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555"=
>i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-6/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i9=
15#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/15460">i915#15460</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/Patchwork_171534v1/shard-rkl-3/igt@kms_joiner@basic-big-joiner=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/15460">i915#15460</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-6/igt@kms_joiner@basic-force-big-joiner.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/145=
44">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/15459">i915#15459</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-5/igt@kms_joiner@basic-forc=
e-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/15459">i915#15459</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clampin=
g:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-=
modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/s=
hard-rkl-3/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source=
-clamping.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/15709">i915#15709</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping:<=
/p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-4/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-mod=
ifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-6/igt@kms_=
plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/15709">i915#15709</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-dg2-4/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958"=
>i915#13958</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
Patchwork_171534v1/shard-dg2-10/igt@kms_plane_multiple@2x-tiling-y.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
16707">i915#16707</a>)</li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-4/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958"=
>i915#13958</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
Patchwork_171534v1/shard-rkl-6/igt@kms_plane_multiple@2x-tiling-y.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
3958">i915#13958</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-20x20-with-ro=
tation@pipe-a.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-3=
/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/153=
29">i915#15329</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-6/igt@kms_pm_backlight@bad-brightness.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343=
">i915#12343</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-5/igt@kms_pm_ba=
cklight@bad-brightness.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-4/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340">i915#9340=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_1=
71534v1/shard-rkl-8/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</=
li>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-dg1-15/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_1=
71534v1/shard-dg1-13/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340">i915#9340</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@screens-disabled:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-1/igt@kms_pm_lpsp@screens-disabled.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430">i9=
15#8430</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patc=
hwork_171534v1/shard-rkl-6/igt@kms_pm_lpsp@screens-disabled.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">=
i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/8430">i915#8430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-4/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#150=
73</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork=
_171534v1/shard-rkl-6/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1507=
3">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-6/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544=
">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/15073">i915#15073</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/Patchwork_171534v1/shard-rkl-3/igt@kms_pm_rpm@dpms-mode-un=
set-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@d3hot:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-4/igt@kms_prime@d3hot.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v=
1/shard-rkl-6/igt@kms_prime@d3hot.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-4/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-=
dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/11520">i915#11520</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-6/igt@kms_psr2_sf@fbc-p=
sr2-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14=
544</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-6/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-=
area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/11520">i915#11520</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-3/igt@kms_p=
sr2_sf@psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>)=
 +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-render:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-4/igt@kms_psr@pr-cursor-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1=
072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/9732">i915#9732</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/Patchwork_171534v1/shard-rkl-6/igt@kms_psr@pr-cursor-render.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-6/igt@kms_psr@psr-suspend.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
4544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/9732">i915#9732</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-3/igt@kms_psr@psr-suspend.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/9732">i915#9732</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-6/igt@kms_psr_stress_test@invalidate-primary-flip-o=
verlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/15949">i915#15949</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-3/igt@kms=
_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15949">i915#15949<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-dg2-4/igt@kms_rotation_crc@primary-rotation-90.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
12755">i915#12755</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/15867">i915#15867</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@kms_rotation_crc@=
primary-rotation-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/16707">i915#16707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-dg2-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/5190">i915#5190</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/Patchwork_171534v1/shard-dg2-10/igt@kms_rotation_crc@primary-y=
f-tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/16707">i915#16707</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/5289">i915#5289</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/Patchwork_171534v1/shard-rkl-6/igt@kms_rotation_crc@primary-yf=
-tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-dg2-10/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-=
270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/16707">i915#16707</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/5190">i915#5190</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v1/shard-dg2-6/igt@kms_rota=
tion_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755">i915#12755</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867">i915=
#15867</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-6/igt@kms_scaling_modes@scaling-mode-none.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
4544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3555">i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-3/igt@kms_scaling_modes@sca=
ling-mode-none.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-4/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243">i915#15243<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/35=
55">i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/Patchwork_171534v1/shard-rkl-6/igt@kms_vrr@flip-basic.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915=
#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/15243">i915#15243</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-dg2-4/igt@kms_vrr@max-min.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_171534v=
1/shard-dg2-10/igt@kms_vrr@max-min.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/16707">i915#16707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-7/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">=
i915#9906</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Pa=
tchwork_171534v1/shard-rkl-6/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/145=
44">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/9906">i915#9906</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_udl@share-import:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-6/igt@prime_udl@share-import.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14=
544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/16420">i915#16420</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/Patchwork_171534v1/shard-rkl-3/igt@prime_udl@share-import.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
6420">i915#16420</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-6/igt@prime_vgem@basic-write.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14=
544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3291">i915#3291</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/3708">i915#3708</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/Patchwork_171534v1/shard-rkl-3/igt@prime_vgem@basic-wri=
te.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3291">i915#3291</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-flip-hang:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18941/shard-rkl-6/igt@prime_vgem@fence-flip-hang.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i91=
5#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3708">i915#3708</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/Patchwork_171534v1/shard-rkl-3/igt@prime_vgem@fence-flip-hang.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/3708">i915#3708</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_18941 -&gt; Patchwork_171534v1</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18941: 8c5c3b3e801512eca826589c6bcded8421486490 @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGT_9036: 9036<br />
  Patchwork_171534v1: 8c5c3b3e801512eca826589c6bcded8421486490 @ git://anon=
git.freedesktop.org/gfx-ci/linux<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============0844161029450840188==--
