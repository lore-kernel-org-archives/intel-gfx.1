Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7C5606A320
	for <intel-gfx@archiver.kernel.org>; Thu, 19 Nov 2026 10:54:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9D0E10E851;
	Thu, 19 Nov 2026 10:54:10 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 221B710E851;
 Thu, 19 Nov 2026 10:54:09 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1661666114834232888=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_drm/atomic-helper=3A_Eli?=
 =?utf-8?q?minate_the_fake=5Fcommit_spurious_-EBUSYs_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Thu, 19 Nov 2026 10:54:09 -0000
Message-ID: <179508564911.50513.12753579107796179812@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261117200253.27078-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20261117200253.27078-1-ville.syrjala@linux.intel.com>
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

--===============1661666114834232888==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/atomic-helper: Eliminate the fake_commit spurious -EBUSYs (rev2)
URL   : https://patchwork.freedesktop.org/series/178822/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_19560_full -> Patchwork_178822v2_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with Patchwork_178822v2_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in Patchwork_178822v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in Patchwork_178822v2_full:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_pm_freq_api@freq-suspend@gt0:
    - shard-mtlp:         NOTRUN -> [DMESG-FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-mtlp-4/igt@i915_pm_freq_api@freq-suspend@gt0.html

  
Known issues
------------

  Here are the changes found in Patchwork_178822v2_full that come from known issues:

### CI changes ###

#### Possible fixes ####

  * boot:
    - shard-dg1:          ([PASS][2], [PASS][3], [PASS][4], [PASS][5], [PASS][6], [PASS][7], [PASS][8], [FAIL][9], [PASS][10], [PASS][11], [PASS][12], [PASS][13], [PASS][14], [PASS][15], [PASS][16], [PASS][17], [PASS][18], [PASS][19], [PASS][20]) -> ([PASS][21], [PASS][22], [PASS][23], [PASS][24], [PASS][25], [PASS][26], [PASS][27], [PASS][28], [PASS][29], [PASS][30], [PASS][31], [PASS][32], [PASS][33], [PASS][34], [PASS][35], [PASS][36], [PASS][37], [PASS][38], [PASS][39], [PASS][40])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-dg1-19/boot.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-dg1-19/boot.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-dg1-18/boot.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-dg1-18/boot.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-dg1-18/boot.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-dg1-18/boot.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-dg1-17/boot.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-dg1-17/boot.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-dg1-16/boot.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-dg1-16/boot.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-dg1-16/boot.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-dg1-15/boot.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-dg1-15/boot.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-dg1-15/boot.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-dg1-15/boot.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-dg1-14/boot.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-dg1-14/boot.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-dg1-14/boot.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-dg1-14/boot.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-dg1-19/boot.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-dg1-19/boot.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-dg1-19/boot.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-dg1-18/boot.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-dg1-18/boot.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-dg1-18/boot.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-dg1-18/boot.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-dg1-17/boot.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-dg1-17/boot.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-dg1-17/boot.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-dg1-17/boot.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-dg1-16/boot.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-dg1-16/boot.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-dg1-16/boot.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-dg1-16/boot.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-dg1-15/boot.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-dg1-15/boot.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-dg1-15/boot.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-dg1-14/boot.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-dg1-14/boot.html

  

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@object-reloc-purge-cache:
    - shard-rkl:          NOTRUN -> [SKIP][41] ([i915#8411])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@api_intel_bb@object-reloc-purge-cache.html

  * igt@gem_basic@multigpu-create-close:
    - shard-glk10:        NOTRUN -> [SKIP][42] ([i915#17697])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk10/igt@gem_basic@multigpu-create-close.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-dg1:          NOTRUN -> [SKIP][43] ([i915#3555] / [i915#9323])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-dg1-15/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-glk11:        NOTRUN -> [SKIP][44] ([i915#17499])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk11/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_ccs@large-ctrl-surf-copy:
    - shard-glk:          NOTRUN -> [SKIP][45] ([i915#17499])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk1/igt@gem_ccs@large-ctrl-surf-copy.html

  * igt@gem_create@create-ext-set-pat:
    - shard-glk10:        NOTRUN -> [SKIP][46] ([i915#17530])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk10/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_isolation@preservation-s3:
    - shard-rkl:          [PASS][47] -> [INCOMPLETE][48] ([i915#13356]) +1 other test incomplete
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-rkl-7/igt@gem_ctx_isolation@preservation-s3.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-3/igt@gem_ctx_isolation@preservation-s3.html

  * igt@gem_ctx_param@set-priority-not-supported:
    - shard-glk10:        NOTRUN -> [SKIP][49] ([i915#17535])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk10/igt@gem_ctx_param@set-priority-not-supported.html

  * igt@gem_ctx_persistence@engines-hang@bcs0:
    - shard-glk:          NOTRUN -> [SKIP][50] ([i915#17527])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk2/igt@gem_ctx_persistence@engines-hang@bcs0.html

  * igt@gem_ctx_persistence@hang:
    - shard-mtlp:         NOTRUN -> [SKIP][51] ([i915#8555])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-mtlp-4/igt@gem_ctx_persistence@hang.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-glk:          NOTRUN -> [SKIP][52] ([i915#17496])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk1/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_exec_balancer@parallel-out-fence:
    - shard-glk10:        NOTRUN -> [SKIP][53] ([i915#17547])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk10/igt@gem_exec_balancer@parallel-out-fence.html

  * igt@gem_exec_capture@capture-recoverable:
    - shard-glk:          NOTRUN -> [SKIP][54] ([i915#17711])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk4/igt@gem_exec_capture@capture-recoverable.html

  * igt@gem_exec_flush@basic-uc-pro-default:
    - shard-dg1:          NOTRUN -> [SKIP][55] ([i915#3539] / [i915#4852]) +2 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-dg1-15/igt@gem_exec_flush@basic-uc-pro-default.html

  * igt@gem_exec_params@rsvd2-dirt:
    - shard-dg1:          NOTRUN -> [SKIP][56] ([i915#17453])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-dg1-15/igt@gem_exec_params@rsvd2-dirt.html

  * igt@gem_exec_reloc@basic-write-read-noreloc:
    - shard-rkl:          NOTRUN -> [SKIP][57] ([i915#3281]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@gem_exec_reloc@basic-write-read-noreloc.html

  * igt@gem_exec_reloc@basic-write-wc-noreloc:
    - shard-dg1:          NOTRUN -> [SKIP][58] ([i915#3281]) +4 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-dg1-16/igt@gem_exec_reloc@basic-write-wc-noreloc.html

  * igt@gem_exec_schedule@semaphore-power:
    - shard-rkl:          NOTRUN -> [SKIP][59] ([i915#7276])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@gem_exec_schedule@semaphore-power.html

  * igt@gem_fenced_exec_thrash@2-spare-fences:
    - shard-mtlp:         NOTRUN -> [SKIP][60] ([i915#4860])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-mtlp-4/igt@gem_fenced_exec_thrash@2-spare-fences.html

  * igt@gem_huc_copy@huc-copy:
    - shard-glk11:        NOTRUN -> [SKIP][61] ([i915#17456])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk11/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
    - shard-glk:          NOTRUN -> [SKIP][62] ([i915#17503] / [i915#4613]) +2 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk1/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html
    - shard-rkl:          NOTRUN -> [SKIP][63] ([i915#4613]) +2 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html

  * igt@gem_madvise@dontneed-before-pwrite:
    - shard-rkl:          NOTRUN -> [SKIP][64] ([i915#3282]) +2 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@gem_madvise@dontneed-before-pwrite.html

  * igt@gem_media_vme:
    - shard-rkl:          NOTRUN -> [SKIP][65] ([i915#284])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@gem_media_vme.html
    - shard-glk:          NOTRUN -> [SKIP][66] ([i915#17543])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk1/igt@gem_media_vme.html

  * igt@gem_mmap@bad-object:
    - shard-mtlp:         NOTRUN -> [SKIP][67] ([i915#4083]) +2 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-mtlp-4/igt@gem_mmap@bad-object.html

  * igt@gem_mmap_gtt@big-copy:
    - shard-dg1:          NOTRUN -> [SKIP][68] ([i915#4077])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-dg1-16/igt@gem_mmap_gtt@big-copy.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
    - shard-dg1:          NOTRUN -> [SKIP][69] ([i915#3282])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-dg1-15/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-glk:          NOTRUN -> [WARN][70] ([i915#14702] / [i915#2658])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk1/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
    - shard-glk:          NOTRUN -> [SKIP][71] ([i915#17521]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk1/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html
    - shard-dg1:          NOTRUN -> [SKIP][72] ([i915#4270]) +2 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-dg1-16/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html

  * igt@gem_pxp@verify-pxp-stale-buf-execution:
    - shard-glk10:        NOTRUN -> [SKIP][73] ([i915#17521]) +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk10/igt@gem_pxp@verify-pxp-stale-buf-execution.html

  * igt@gem_pxp@verify-pxp-stale-ctx-execution:
    - shard-glk11:        NOTRUN -> [SKIP][74] ([i915#17521])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk11/igt@gem_pxp@verify-pxp-stale-ctx-execution.html

  * igt@gem_render_copy@yf-tiled-to-vebox-y-tiled:
    - shard-glk:          NOTRUN -> [SKIP][75] ([i915#17492]) +1 other test skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk2/igt@gem_render_copy@yf-tiled-to-vebox-y-tiled.html

  * igt@gem_set_tiling_vs_pwrite:
    - shard-mtlp:         NOTRUN -> [SKIP][76] ([i915#4079])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-mtlp-4/igt@gem_set_tiling_vs_pwrite.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-glk:          NOTRUN -> [SKIP][77] ([i915#17507] / [i915#3323])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk1/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-rkl:          NOTRUN -> [SKIP][78] ([i915#3297] / [i915#3323])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-glk:          NOTRUN -> [SKIP][79] ([i915#17507])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk4/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@forbidden-operations:
    - shard-rkl:          NOTRUN -> [SKIP][80] ([i915#3282] / [i915#3297])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@gem_userptr_blits@forbidden-operations.html

  * igt@gem_userptr_blits@unsync-unmap-after-close:
    - shard-rkl:          NOTRUN -> [SKIP][81] ([i915#3297]) +1 other test skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@gem_userptr_blits@unsync-unmap-after-close.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-mtlp:         NOTRUN -> [SKIP][82] ([i915#3297])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-mtlp-4/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gem_workarounds@suspend-resume:
    - shard-glk:          [PASS][83] -> [INCOMPLETE][84] ([i915#13356] / [i915#14586])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-glk6/igt@gem_workarounds@suspend-resume.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk8/igt@gem_workarounds@suspend-resume.html

  * igt@gen3_render_tiledy_blits:
    - shard-glk:          NOTRUN -> [SKIP][85] ([i915#17578])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk4/igt@gen3_render_tiledy_blits.html

  * igt@gen7_exec_parse@batch-without-end:
    - shard-rkl:          NOTRUN -> [SKIP][86] ([i915#17455]) +1 other test skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@gen7_exec_parse@batch-without-end.html

  * igt@gen7_exec_parse@chained-batch:
    - shard-glk10:        NOTRUN -> [SKIP][87] ([i915#17505])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk10/igt@gen7_exec_parse@chained-batch.html

  * igt@gen7_exec_parse@cmd-crossing-page:
    - shard-glk:          NOTRUN -> [SKIP][88] ([i915#17505])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk4/igt@gen7_exec_parse@cmd-crossing-page.html

  * igt@gen9_exec_parse@bb-start-cmd:
    - shard-dg1:          NOTRUN -> [SKIP][89] ([i915#2527])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-dg1-16/igt@gen9_exec_parse@bb-start-cmd.html

  * igt@gen9_exec_parse@secure-batches:
    - shard-mtlp:         NOTRUN -> [SKIP][90] ([i915#2856])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-mtlp-4/igt@gen9_exec_parse@secure-batches.html

  * igt@i915_hangman@gt-engine-error@bcs0:
    - shard-glk:          NOTRUN -> [SKIP][91] ([i915#17580])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk1/igt@i915_hangman@gt-engine-error@bcs0.html

  * igt@i915_module_load@fault-injection@__uc_init:
    - shard-rkl:          NOTRUN -> [SKIP][92] ([i915#15479]) +4 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-7/igt@i915_module_load@fault-injection@__uc_init.html

  * igt@i915_module_load@fault-injection@intel_connector_register:
    - shard-rkl:          NOTRUN -> [ABORT][93] ([i915#15342]) +1 other test abort
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-7/igt@i915_module_load@fault-injection@intel_connector_register.html

  * igt@i915_module_load@resize-bar:
    - shard-glk:          NOTRUN -> [SKIP][94] ([i915#17566])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk4/igt@i915_module_load@resize-bar.html

  * igt@i915_pm_freq_api@freq-reset:
    - shard-rkl:          NOTRUN -> [SKIP][95] ([i915#8399])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@i915_pm_freq_api@freq-reset.html

  * igt@i915_pm_freq_api@freq-suspend@gt1:
    - shard-mtlp:         NOTRUN -> [INCOMPLETE][96] ([i915#13820]) +1 other test incomplete
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-mtlp-4/igt@i915_pm_freq_api@freq-suspend@gt1.html

  * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
    - shard-glk:          NOTRUN -> [SKIP][97] ([i915#17706])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk1/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html

  * igt@i915_query@hwconfig_table:
    - shard-glk:          NOTRUN -> [SKIP][98] ([i915#17584])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk4/igt@i915_query@hwconfig_table.html

  * igt@i915_selftest@mock:
    - shard-tglu:         [PASS][99] -> [ABORT][100] ([i915#17076]) +1 other test abort
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-tglu-9/igt@i915_selftest@mock.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-tglu-3/igt@i915_selftest@mock.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-dg1:          NOTRUN -> [ABORT][101] ([i915#17844]) +3 other tests abort
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-dg1-15/igt@i915_suspend@basic-s3-without-i915.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-glk11:        NOTRUN -> [INCOMPLETE][102] ([i915#13356] / [i915#16182] / [i915#4817])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk11/igt@i915_suspend@fence-restore-untiled.html

  * igt@i915_suspend@sysfs-reader:
    - shard-glk:          NOTRUN -> [INCOMPLETE][103] ([i915#13356] / [i915#16182] / [i915#4817])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk1/igt@i915_suspend@sysfs-reader.html

  * igt@intel_hwmon@hwmon-read:
    - shard-rkl:          NOTRUN -> [SKIP][104] ([i915#7707])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@intel_hwmon@hwmon-read.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-2:
    - shard-glk:          [PASS][105] -> [FAIL][106] ([i915#14888]) +1 other test fail
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-glk3/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-2.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk2/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-2.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear:
    - shard-glk10:        NOTRUN -> [SKIP][107] ([i915#17562])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk10/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic:
    - shard-glk:          NOTRUN -> [SKIP][108] ([i915#17562])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk4/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-glk:          NOTRUN -> [SKIP][109] ([i915#17485])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk4/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-glk:          NOTRUN -> [SKIP][110] ([i915#1769])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - shard-rkl:          NOTRUN -> [SKIP][111] ([i915#1769] / [i915#3555])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - shard-mtlp:         [PASS][112] -> [FAIL][113] ([i915#5956]) +1 other test fail
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-mtlp-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-mtlp-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][114] ([i915#4538] / [i915#5286]) +1 other test skip
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-rkl:          NOTRUN -> [SKIP][115] ([i915#5286])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_big_fb@4-tiled-addfb.html
    - shard-glk:          NOTRUN -> [SKIP][116] ([i915#17556])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk1/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-glk:          NOTRUN -> [SKIP][117] ([i915#17478]) +3 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][118] ([i915#17431] / [i915#3638]) +2 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-glk:          NOTRUN -> [SKIP][119] ([i915#17524])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk1/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-mtlp:         NOTRUN -> [SKIP][120] ([i915#17431])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-mtlp-4/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-glk10:        NOTRUN -> [SKIP][121] ([i915#17500]) +2 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk10/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-glk:          NOTRUN -> [SKIP][122] ([i915#17500]) +8 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][123] ([i915#3638])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-dg1-16/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
    - shard-glk11:        NOTRUN -> [SKIP][124] ([i915#17500]) +1 other test skip
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk11/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-rkl:          NOTRUN -> [SKIP][125] ([i915#4538]) +2 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
    - shard-glk10:        NOTRUN -> [SKIP][126] ([i915#17478]) +1 other test skip
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk10/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-180:
    - shard-glk11:        NOTRUN -> [SKIP][127] ([i915#17478]) +1 other test skip
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk11/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-dg1:          NOTRUN -> [SKIP][128] ([i915#4538])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-dg1-15/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][129] ([i915#6095]) +43 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs@pipe-c-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][130] ([i915#6095]) +4 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-mtlp-4/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs@pipe-c-edp-1.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1:
    - shard-glk10:        NOTRUN -> [SKIP][131] ([i915#17491]) +31 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk10/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-2:
    - shard-glk10:        NOTRUN -> [SKIP][132] ([i915#17490] / [i915#17491]) +11 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk10/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][133] ([i915#14098] / [i915#6095]) +27 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][134] ([i915#6095]) +3 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-dg2-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-2:
    - shard-glk:          NOTRUN -> [SKIP][135] ([i915#17490] / [i915#17491]) +17 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk1/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][136] ([i915#10307] / [i915#6095]) +61 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-dg2-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs:
    - shard-glk11:        NOTRUN -> [SKIP][137] ([i915#17490] / [i915#17491]) +1 other test skip
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk11/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-1:
    - shard-glk11:        NOTRUN -> [SKIP][138] ([i915#17491]) +6 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk11/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][139] ([i915#14544] / [i915#6095]) +1 other test skip
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-c-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][140] ([i915#14098] / [i915#14544] / [i915#6095])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2:
    - shard-glk:          NOTRUN -> [SKIP][141] ([i915#17491]) +48 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk4/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][142] ([i915#10307] / [i915#10434] / [i915#6095]) +1 other test skip
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-dg2-4/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-hdmi-a-1:
    - shard-dg1:          NOTRUN -> [SKIP][143] ([i915#6095]) +96 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-dg1-15/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-glk:          NOTRUN -> [SKIP][144] ([i915#17525]) +2 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk1/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
    - shard-rkl:          NOTRUN -> [SKIP][145] ([i915#12313]) +1 other test skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_cdclk@plane-scaling:
    - shard-rkl:          NOTRUN -> [SKIP][146] ([i915#3742])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_audio@hdmi-audio-after-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][147] ([i915#11151])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_chamelium_audio@hdmi-audio-after-suspend.html

  * igt@kms_chamelium_color@gamma:
    - shard-glk10:        NOTRUN -> [SKIP][148] ([i915#17489]) +1 other test skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk10/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d:
    - shard-glk10:        NOTRUN -> [SKIP][149] ([i915#17497])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk10/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d:
    - shard-dg1:          NOTRUN -> [SKIP][150] ([i915#17427]) +1 other test skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-dg1-16/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d:
    - shard-glk:          NOTRUN -> [SKIP][151] ([i915#17497]) +2 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk4/igt@kms_chamelium_color_pipeline@plane-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d:
    - shard-rkl:          NOTRUN -> [SKIP][152] ([i915#16471] / [i915#17427])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d.html

  * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
    - shard-mtlp:         NOTRUN -> [SKIP][153] ([i915#11151] / [i915#7828]) +1 other test skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-mtlp-4/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - shard-rkl:          NOTRUN -> [SKIP][154] ([i915#11151] / [i915#7828]) +3 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_chamelium_frames@hdmi-crc-fast:
    - shard-glk10:        NOTRUN -> [SKIP][155] ([i915#17483]) +2 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk10/igt@kms_chamelium_frames@hdmi-crc-fast.html

  * igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:
    - shard-dg1:          NOTRUN -> [SKIP][156] ([i915#11151] / [i915#7828])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-dg1-15/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-glk:          NOTRUN -> [SKIP][157] ([i915#17483]) +9 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk1/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:
    - shard-glk11:        NOTRUN -> [SKIP][158] ([i915#17483]) +1 other test skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk11/igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode.html

  * igt@kms_color_pipeline@plane-ctm3x4-lut1d@pipe-b-plane-4:
    - shard-dg1:          NOTRUN -> [SKIP][159] ([i915#16990]) +15 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-dg1-15/igt@kms_color_pipeline@plane-ctm3x4-lut1d@pipe-b-plane-4.html

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709:
    - shard-glk:          NOTRUN -> [SKIP][160] ([i915#17510]) +1 other test skip
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk1/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709.html

  * igt@kms_color_pipeline@plane-lut1d:
    - shard-glk10:        NOTRUN -> [SKIP][161] ([i915#17510])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk10/igt@kms_color_pipeline@plane-lut1d.html

  * igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-b-plane-4:
    - shard-rkl:          NOTRUN -> [SKIP][162] ([i915#16990]) +5 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-b-plane-4.html

  * igt@kms_content_protection@atomic:
    - shard-glk:          NOTRUN -> [SKIP][163] ([i915#17508])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk1/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-mtlp:         NOTRUN -> [SKIP][164] ([i915#15330] / [i915#3299])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-mtlp-4/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-glk:          NOTRUN -> [SKIP][165] ([i915#17502]) +1 other test skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk1/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@mei-interface:
    - shard-rkl:          NOTRUN -> [SKIP][166] ([i915#15865]) +1 other test skip
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@srm:
    - shard-glk10:        NOTRUN -> [SKIP][167] ([i915#17508]) +1 other test skip
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk10/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-onscreen-128x42:
    - shard-mtlp:         NOTRUN -> [SKIP][168] ([i915#8814])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-mtlp-4/igt@kms_cursor_crc@cursor-onscreen-128x42.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-glk:          NOTRUN -> [SKIP][169] ([i915#17504]) +4 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk1/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-glk:          NOTRUN -> [SKIP][170] ([i915#17533])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk1/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-random-64x21@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [FAIL][171] ([i915#13566])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_cursor_crc@cursor-random-64x21@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-mtlp:         NOTRUN -> [SKIP][172] ([i915#13049] / [i915#3359])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-mtlp-4/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-rkl:          [PASS][173] -> [INCOMPLETE][174] ([i915#12358] / [i915#14152])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-rkl-2/igt@kms_cursor_crc@cursor-suspend.html
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-6/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][175] ([i915#12358] / [i915#14152])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-6/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-2.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [ABORT][176] ([i915#17844]) +1 other test abort
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-dg2-3/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-3.html

  * igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train:
    - shard-glk10:        NOTRUN -> [SKIP][177] ([i915#17616])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk10/igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train.html

  * igt@kms_dp_link_training@non-uhbr-sst-direct-train:
    - shard-glk:          NOTRUN -> [SKIP][178] ([i915#17506])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk1/igt@kms_dp_link_training@non-uhbr-sst-direct-train.html
    - shard-rkl:          NOTRUN -> [SKIP][179] ([i915#17286])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_dp_link_training@non-uhbr-sst-direct-train.html

  * igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train:
    - shard-rkl:          NOTRUN -> [SKIP][180] ([i915#17290])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-7/igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-rkl:          NOTRUN -> [SKIP][181] ([i915#13748])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-glk:          NOTRUN -> [SKIP][182] ([i915#17477])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk2/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dsc@dsc-basic-bigjoiner:
    - shard-glk10:        NOTRUN -> [SKIP][183] ([i915#17458]) +2 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk10/igt@kms_dsc@dsc-basic-bigjoiner.html

  * igt@kms_dsc@dsc-fractional-bpp-bigjoiner:
    - shard-rkl:          NOTRUN -> [SKIP][184] ([i915#16361])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_dsc@dsc-fractional-bpp-bigjoiner.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc-bigjoiner:
    - shard-mtlp:         NOTRUN -> [SKIP][185] ([i915#16361])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-mtlp-4/igt@kms_dsc@dsc-fractional-bpp-with-bpc-bigjoiner.html

  * igt@kms_dsc@dsc-with-bpc-formats-bigjoiner:
    - shard-glk:          NOTRUN -> [SKIP][186] ([i915#17458]) +1 other test skip
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk1/igt@kms_dsc@dsc-with-bpc-formats-bigjoiner.html

  * igt@kms_feature_discovery@display-4x:
    - shard-mtlp:         NOTRUN -> [SKIP][187] ([i915#16081])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-mtlp-4/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-glk:          NOTRUN -> [SKIP][188] ([i915#17570])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk4/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@dsc:
    - shard-glk:          NOTRUN -> [SKIP][189] ([i915#17539])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk1/igt@kms_feature_discovery@dsc.html
    - shard-dg1:          NOTRUN -> [SKIP][190] ([i915#16600])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-dg1-16/igt@kms_feature_discovery@dsc.html

  * igt@kms_feature_discovery@psr2:
    - shard-glk:          NOTRUN -> [SKIP][191] ([i915#17585])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk1/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:
    - shard-rkl:          NOTRUN -> [SKIP][192] ([i915#9934])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-glk11:        NOTRUN -> [INCOMPLETE][193] ([i915#12745] / [i915#13356] / [i915#17183] / [i915#4839])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk11/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a1-hdmi-a2:
    - shard-glk11:        NOTRUN -> [INCOMPLETE][194] ([i915#12745] / [i915#13356] / [i915#17183])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk11/igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-mtlp:         NOTRUN -> [SKIP][195] ([i915#3637] / [i915#9934])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-mtlp-4/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][196] ([i915#12745] / [i915#13356] / [i915#17183] / [i915#4839])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk4/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][197] ([i915#12745] / [i915#13356] / [i915#17183])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk4/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html
    - shard-snb:          NOTRUN -> [INCOMPLETE][198] ([i915#12314])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-snb1/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][199] ([i915#15643]) +1 other test skip
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-valid-mode:
    - shard-glk:          NOTRUN -> [SKIP][200] ([i915#17522]) +3 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk1/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
    - shard-glk10:        NOTRUN -> [SKIP][201] ([i915#17493])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk10/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
    - shard-glk10:        NOTRUN -> [SKIP][202] ([i915#17484])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk10/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-glk:          NOTRUN -> [SKIP][203] ([i915#17484])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-glk:          NOTRUN -> [SKIP][204] ([i915#17493]) +2 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_force_connector_basic@force-load-detect:
    - shard-glk10:        NOTRUN -> [SKIP][205] ([i915#17465])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk10/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][206] ([i915#15104] / [i915#15990]) +1 other test skip
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-dg1-17/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][207] ([i915#17428] / [i915#1825]) +4 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-move:
    - shard-glk:          NOTRUN -> [SKIP][208] ([i915#17517]) +41 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk4/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][209] ([i915#15990]) +1 other test skip
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-dg1-16/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:
    - shard-dg1:          NOTRUN -> [SKIP][210] ([i915#17428]) +10 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:
    - shard-rkl:          NOTRUN -> [SKIP][211] ([i915#17428]) +29 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-glk:          NOTRUN -> [SKIP][212] ([i915#17559])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk4/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-glk:          NOTRUN -> [SKIP][213] ([i915#17482]) +74 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk1/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-move:
    - shard-mtlp:         NOTRUN -> [SKIP][214] ([i915#15989]) +1 other test skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4:
    - shard-dg1:          NOTRUN -> [SKIP][215] ([i915#5439])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-dg1-15/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-draw-blt:
    - shard-dg1:          NOTRUN -> [SKIP][216] ([i915#15989]) +4 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-dg1-16/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-draw-render:
    - shard-rkl:          NOTRUN -> [SKIP][217] ([i915#15989]) +7 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-onoff:
    - shard-glk:          [PASS][218] -> [SKIP][219] ([i915#17517]) +6 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-glk8/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-onoff.html
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk3/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-mmap-gtt:
    - shard-rkl:          [PASS][220] -> [SKIP][221] ([i915#15989]) +5 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-mmap-gtt.html
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@hdr-suspend:
    - shard-glk10:        NOTRUN -> [INCOMPLETE][222] ([i915#13356] / [i915#16056] / [i915#16593])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk10/igt@kms_frontbuffer_tracking@hdr-suspend.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][223] ([i915#15102]) +25 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][224] ([i915#15990] / [i915#8708])
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-dg1-15/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][225] ([i915#15991] / [i915#17428] / [i915#1825]) +1 other test skip
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-mtlp-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-pwrite:
    - shard-glk10:        NOTRUN -> [SKIP][226] ([i915#17482]) +44 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk10/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:
    - shard-dg1:          NOTRUN -> [SKIP][227] ([i915#15102]) +2 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-pgflip-blt:
    - shard-glk11:        NOTRUN -> [SKIP][228] ([i915#17482]) +13 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk11/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-spr-indfb-draw-render:
    - shard-mtlp:         NOTRUN -> [SKIP][229] ([i915#15991] / [i915#17428]) +1 other test skip
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-mtlp-4/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery:
    - shard-glk:          NOTRUN -> [FAIL][230] ([i915#17101] / [i915#17108])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk1/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html

  * igt@kms_hdmi_inject@inject-4k:
    - shard-mtlp:         [PASS][231] -> [SKIP][232] ([i915#15725])
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-mtlp-3/igt@kms_hdmi_inject@inject-4k.html
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-mtlp-1/igt@kms_hdmi_inject@inject-4k.html

  * igt@kms_hdr@bpc-switch:
    - shard-glk11:        NOTRUN -> [SKIP][233] ([i915#17498])
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk11/igt@kms_hdr@bpc-switch.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-glk10:        NOTRUN -> [SKIP][234] ([i915#17498])
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk10/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-glk:          NOTRUN -> [SKIP][235] ([i915#17498]) +1 other test skip
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk4/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@static-toggle:
    - shard-mtlp:         NOTRUN -> [SKIP][236] ([i915#12713] / [i915#16490] / [i915#3555] / [i915#8228])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-mtlp-4/igt@kms_hdr@static-toggle.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][237] ([i915#16644] / [i915#3555] / [i915#8228])
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-glk:          NOTRUN -> [SKIP][238] ([i915#17512])
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk1/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-glk:          NOTRUN -> [SKIP][239] ([i915#17678])
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk4/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-glk10:        NOTRUN -> [SKIP][240] ([i915#17512])
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk10/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_mst@mst-suspend-read-crc:
    - shard-glk:          NOTRUN -> [SKIP][241] ([i915#17579])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk1/igt@kms_mst@mst-suspend-read-crc.html
    - shard-rkl:          NOTRUN -> [SKIP][242] ([i915#16451])
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_mst@mst-suspend-read-crc.html

  * igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:
    - shard-glk:          NOTRUN -> [SKIP][243] ([i915#17540])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk1/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes.html

  * igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c:
    - shard-dg1:          NOTRUN -> [SKIP][244] ([i915#17455])
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-dg1-17/igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c.html

  * igt@kms_pipe_stress@stress-xrgb8888-4tiled:
    - shard-dg1:          NOTRUN -> [SKIP][245] ([i915#14712])
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-dg1-17/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier:
    - shard-mtlp:         NOTRUN -> [SKIP][246] ([i915#15709])
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-mtlp-4/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping:
    - shard-glk10:        NOTRUN -> [SKIP][247] ([i915#17479]) +1 other test skip
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk10/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier:
    - shard-glk:          NOTRUN -> [SKIP][248] ([i915#17479]) +4 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk1/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier.html
    - shard-dg1:          NOTRUN -> [SKIP][249] ([i915#15709])
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-dg1-16/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-mtlp:         [PASS][250] -> [ABORT][251] ([i915#17224]) +1 other test abort
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-mtlp-5/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-mtlp-2/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_alpha_blend@alpha-opaque-fb:
    - shard-glk10:        NOTRUN -> [FAIL][252] ([i915#10647] / [i915#12169])
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk10/igt@kms_plane_alpha_blend@alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-c-hdmi-a-1:
    - shard-glk10:        NOTRUN -> [FAIL][253] ([i915#10647]) +1 other test fail
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk10/igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-c-hdmi-a-1.html

  * igt@kms_plane_lowres@tiling-4:
    - shard-glk10:        NOTRUN -> [SKIP][254] ([i915#17509])
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk10/igt@kms_plane_lowres@tiling-4.html

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled:
    - shard-glk10:        NOTRUN -> [SKIP][255] ([i915#17528])
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk10/igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled.html

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled:
    - shard-glk:          NOTRUN -> [SKIP][256] ([i915#17528])
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk1/igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled.html

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-yf-tiled:
    - shard-rkl:          NOTRUN -> [SKIP][257] ([i915#17832])
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-yf-tiled.html

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-90-y-tiled@pipe-a-hdmi-a-1-xv36:
    - shard-dg1:          NOTRUN -> [SKIP][258] ([i915#17843]) +23 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-dg1-15/igt@kms_plane_scaling@plane-upscale-max-crc-rotation-90-y-tiled@pipe-a-hdmi-a-1-xv36.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-glk:          NOTRUN -> [SKIP][259] ([i915#17462])
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk2/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-glk10:        NOTRUN -> [SKIP][260] ([i915#17564])
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk10/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-glk:          NOTRUN -> [SKIP][261] ([i915#17553])
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk4/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-rkl:          NOTRUN -> [FAIL][262] ([i915#16479])
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-glk:          NOTRUN -> [SKIP][263] ([i915#17702])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk1/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-dg2:          [PASS][264] -> [SKIP][265] ([i915#15073])
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-dg2-4/igt@kms_pm_rpm@dpms-lpsp.html
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-dg2-3/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-dg1:          [PASS][266] -> [SKIP][267] ([i915#15073])
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-dg1-18/igt@kms_pm_rpm@modeset-non-lpsp.html
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-dg1-15/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-rkl:          [PASS][268] -> [SKIP][269] ([i915#15073])
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-rkl-3/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-rkl:          [PASS][270] -> [INCOMPLETE][271] ([i915#14419])
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-rkl-2/igt@kms_pm_rpm@system-suspend-modeset.html
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-6/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_prime@d3hot:
    - shard-glk10:        NOTRUN -> [SKIP][272] ([i915#17569])
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk10/igt@kms_prime@d3hot.html

  * igt@kms_properties@colorop-properties-legacy:
    - shard-glk10:        NOTRUN -> [SKIP][273] ([i915#17481])
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk10/igt@kms_properties@colorop-properties-legacy.html

  * igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:
    - shard-mtlp:         NOTRUN -> [SKIP][274] ([i915#12316])
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-mtlp-4/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - shard-glk11:        NOTRUN -> [SKIP][275] ([i915#11520])
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk11/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
    - shard-rkl:          NOTRUN -> [SKIP][276] ([i915#11520]) +2 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][277] ([i915#11520]) +7 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk4/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-glk10:        NOTRUN -> [SKIP][278] ([i915#11520]) +4 other tests skip
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk10/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-glk10:        NOTRUN -> [SKIP][279] ([i915#17546])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk10/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-psr-cursor-mmap-cpu:
    - shard-glk10:        NOTRUN -> [SKIP][280] ([i915#17480]) +6 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk10/igt@kms_psr@fbc-psr-cursor-mmap-cpu.html

  * igt@kms_psr@fbc-psr-primary-mmap-gtt:
    - shard-glk11:        NOTRUN -> [SKIP][281] ([i915#17480]) +2 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk11/igt@kms_psr@fbc-psr-primary-mmap-gtt.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-glk:          NOTRUN -> [SKIP][282] ([i915#17480] / [i915#9732]) +1 other test skip
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk1/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_psr@psr-sprite-mmap-cpu:
    - shard-dg1:          NOTRUN -> [SKIP][283] ([i915#1072] / [i915#9732]) +3 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-dg1-16/igt@kms_psr@psr-sprite-mmap-cpu.html

  * igt@kms_psr@psr-sprite-mmap-gtt:
    - shard-glk:          NOTRUN -> [SKIP][284] ([i915#17480]) +14 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk4/igt@kms_psr@psr-sprite-mmap-gtt.html

  * igt@kms_psr@psr2-cursor-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][285] ([i915#1072] / [i915#9732]) +7 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_psr@psr2-cursor-mmap-gtt.html

  * igt@kms_rotation_crc@exhaust-fences:
    - shard-dg1:          NOTRUN -> [SKIP][286] ([i915#4884])
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-dg1-15/igt@kms_rotation_crc@exhaust-fences.html

  * igt@kms_rotation_crc@multiplane-rotation:
    - shard-glk10:        NOTRUN -> [INCOMPLETE][287] ([i915#15492] / [i915#16184])
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk10/igt@kms_rotation_crc@multiplane-rotation.html

  * igt@kms_rotation_crc@primary-x-tiled-reflect-x-0:
    - shard-glk:          NOTRUN -> [SKIP][288] ([i915#17488])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk1/igt@kms_rotation_crc@primary-x-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-mtlp:         NOTRUN -> [SKIP][289] ([i915#15867])
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-mtlp-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-glk10:        NOTRUN -> [SKIP][290] ([i915#17488])
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk10/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-glk10:        NOTRUN -> [SKIP][291] ([i915#17501])
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk10/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-rkl:          NOTRUN -> [SKIP][292] ([i915#3555]) +2 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-7/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-glk10:        NOTRUN -> [FAIL][293] ([i915#10959])
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk10/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][294] ([i915#12276] / [i915#13356]) +1 other test incomplete
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk2/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vrr@flip-basic:
    - shard-rkl:          NOTRUN -> [SKIP][295] ([i915#15243] / [i915#3555])
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@lobf:
    - shard-glk10:        NOTRUN -> [SKIP][296] ([i915#17561])
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk10/igt@kms_vrr@lobf.html

  * igt@kms_vrr@max-min:
    - shard-glk:          NOTRUN -> [SKIP][297] ([i915#17520]) +1 other test skip
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk4/igt@kms_vrr@max-min.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-dg1:          NOTRUN -> [SKIP][298] ([i915#9906]) +1 other test skip
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-dg1-15/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@perf@gen12-unprivileged-single-ctx-counters:
    - shard-glk:          NOTRUN -> [SKIP][299] ([i915#17536])
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk4/igt@perf@gen12-unprivileged-single-ctx-counters.html

  * igt@perf@per-context-mode-unprivileged:
    - shard-rkl:          NOTRUN -> [SKIP][300] ([i915#2435])
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@perf@per-context-mode-unprivileged.html

  * igt@perf@unprivileged-single-ctx-counters:
    - shard-glk10:        NOTRUN -> [SKIP][301] ([i915#17704])
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk10/igt@perf@unprivileged-single-ctx-counters.html

  * igt@perf_pmu@rc6-suspend:
    - shard-glk10:        NOTRUN -> [INCOMPLETE][302] ([i915#13356] / [i915#16236])
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk10/igt@perf_pmu@rc6-suspend.html
    - shard-rkl:          [PASS][303] -> [INCOMPLETE][304] ([i915#13520])
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-rkl-8/igt@perf_pmu@rc6-suspend.html
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-3/igt@perf_pmu@rc6-suspend.html

  * igt@prime_vgem@basic-fence-mmap:
    - shard-dg1:          NOTRUN -> [SKIP][305] ([i915#3708] / [i915#4077])
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-dg1-17/igt@prime_vgem@basic-fence-mmap.html

  * igt@prime_vgem@basic-fence-read:
    - shard-mtlp:         NOTRUN -> [SKIP][306] ([i915#3708])
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-mtlp-4/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@fence-flip-hang:
    - shard-glk10:        NOTRUN -> [SKIP][307] ([i915#17467])
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk10/igt@prime_vgem@fence-flip-hang.html

  * igt@prime_vgem@fence-write-hang:
    - shard-dg1:          NOTRUN -> [SKIP][308] ([i915#3708])
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-dg1-15/igt@prime_vgem@fence-write-hang.html

  
#### Possible fixes ####

  * igt@gem_linear_blits@interruptible:
    - shard-dg1:          [FAIL][309] ([i915#15391]) -> [PASS][310]
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-dg1-14/igt@gem_linear_blits@interruptible.html
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-dg1-18/igt@gem_linear_blits@interruptible.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-rkl:          [INCOMPLETE][311] ([i915#13356]) -> [PASS][312] +2 other tests pass
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-rkl-3/igt@gem_workarounds@suspend-resume-fd.html
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@gem_workarounds@suspend-resume-fd.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-rkl:          [INCOMPLETE][313] ([i915#9878]) -> [PASS][314]
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-rkl-6/igt@kms_fbcon_fbt@fbc-suspend.html
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-7/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-render:
    - shard-rkl:          [SKIP][315] ([i915#15989]) -> [PASS][316] +4 other tests pass
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-rkl-4/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-render.html
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-glk:          [SKIP][317] ([i915#17517]) -> [PASS][318] +13 other tests pass
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-glk6/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk8/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_hdr@bpc-switch:
    - shard-rkl:          [SKIP][319] ([i915#16644] / [i915#3555] / [i915#8228]) -> [PASS][320]
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-rkl-4/igt@kms_hdr@bpc-switch.html
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-6/igt@kms_hdr@bpc-switch.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-dg1:          [SKIP][321] ([i915#15073]) -> [PASS][322]
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-dg1-17/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-dg1-15/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-rkl:          [SKIP][323] ([i915#15073]) -> [PASS][324]
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-rkl-2/igt@kms_pm_rpm@dpms-non-lpsp.html
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-4/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@perf_pmu@busy@vecs0:
    - shard-rkl:          [FAIL][325] ([i915#4349]) -> [PASS][326] +4 other tests pass
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-rkl-5/igt@perf_pmu@busy@vecs0.html
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-5/igt@perf_pmu@busy@vecs0.html

  
#### Warnings ####

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-rkl:          [SKIP][327] ([i915#3555] / [i915#9323]) -> [SKIP][328] ([i915#14544] / [i915#3555] / [i915#9323])
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-rkl-4/igt@gem_ccs@ctrl-surf-copy.html
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-6/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_ccs@suspend-resume:
    - shard-dg2:          [INCOMPLETE][329] ([i915#13356] / [i915#16348]) -> [ABORT][330] ([i915#17844]) +1 other test abort
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-dg2-6/igt@gem_ccs@suspend-resume.html
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-dg2-6/igt@gem_ccs@suspend-resume.html

  * igt@gem_ctx_isolation@preservation-s3:
    - shard-mtlp:         [ABORT][331] ([i915#17146]) -> [INCOMPLETE][332] ([i915#13356] / [i915#17244]) +1 other test incomplete
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-mtlp-3/igt@gem_ctx_isolation@preservation-s3.html
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-mtlp-6/igt@gem_ctx_isolation@preservation-s3.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-rkl:          [SKIP][333] ([i915#14544] / [i915#280]) -> [SKIP][334] ([i915#280])
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-rkl-6/igt@gem_ctx_sseu@mmap-args.html
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_exec_balancer@parallel-contexts:
    - shard-rkl:          [SKIP][335] ([i915#14544] / [i915#4525]) -> [SKIP][336] ([i915#4525])
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-rkl-6/igt@gem_exec_balancer@parallel-contexts.html
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@gem_exec_balancer@parallel-contexts.html

  * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
    - shard-rkl:          [SKIP][337] ([i915#3711]) -> [SKIP][338] ([i915#14544] / [i915#3711])
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-rkl-2/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-6/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html

  * igt@gem_exec_reloc@basic-gtt-cpu:
    - shard-rkl:          [SKIP][339] ([i915#14544] / [i915#3281]) -> [SKIP][340] ([i915#3281])
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-cpu.html
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@gem_exec_reloc@basic-gtt-cpu.html

  * igt@gem_exec_reloc@basic-wc-cpu-active:
    - shard-rkl:          [SKIP][341] ([i915#3281]) -> [SKIP][342] ([i915#14544] / [i915#3281])
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-rkl-4/igt@gem_exec_reloc@basic-wc-cpu-active.html
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-6/igt@gem_exec_reloc@basic-wc-cpu-active.html

  * igt@gem_huc_copy@huc-copy:
    - shard-rkl:          [SKIP][343] ([i915#2190]) -> [SKIP][344] ([i915#14544] / [i915#2190])
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-rkl-4/igt@gem_huc_copy@huc-copy.html
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-6/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@heavy-multi:
    - shard-rkl:          [SKIP][345] ([i915#14544] / [i915#4613]) -> [SKIP][346] ([i915#4613])
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-rkl-6/igt@gem_lmem_swapping@heavy-multi.html
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@gem_lmem_swapping@heavy-multi.html

  * igt@gem_pwrite@basic-self:
    - shard-rkl:          [SKIP][347] ([i915#3282]) -> [SKIP][348] ([i915#14544] / [i915#3282])
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-rkl-4/igt@gem_pwrite@basic-self.html
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-6/igt@gem_pwrite@basic-self.html

  * igt@gem_readwrite@beyond-eob:
    - shard-rkl:          [SKIP][349] ([i915#14544] / [i915#3282]) -> [SKIP][350] ([i915#3282])
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-rkl-6/igt@gem_readwrite@beyond-eob.html
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@gem_readwrite@beyond-eob.html

  * igt@gem_userptr_blits@coherency-sync:
    - shard-rkl:          [SKIP][351] ([i915#17433] / [i915#3297]) -> [SKIP][352] ([i915#14544] / [i915#17433] / [i915#3297])
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-rkl-2/igt@gem_userptr_blits@coherency-sync.html
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-6/igt@gem_userptr_blits@coherency-sync.html

  * igt@gem_userptr_blits@unsync-overlap:
    - shard-rkl:          [SKIP][353] ([i915#14544] / [i915#3297]) -> [SKIP][354] ([i915#3297])
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-rkl-6/igt@gem_userptr_blits@unsync-overlap.html
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@gem_userptr_blits@unsync-overlap.html

  * igt@gen7_exec_parse@basic-allocation:
    - shard-rkl:          [SKIP][355] ([i915#14544] / [i915#17455]) -> [SKIP][356] ([i915#17455])
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-rkl-6/igt@gen7_exec_parse@basic-allocation.html
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@gen7_exec_parse@basic-allocation.html

  * igt@gen9_exec_parse@bb-start-out:
    - shard-rkl:          [SKIP][357] ([i915#14544] / [i915#2527]) -> [SKIP][358] ([i915#2527])
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-rkl-6/igt@gen9_exec_parse@bb-start-out.html
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@gen9_exec_parse@bb-start-out.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-rkl:          [SKIP][359] ([i915#14544] / [i915#4538] / [i915#5286]) -> [SKIP][360] ([i915#4538] / [i915#5286]) +1 other test skip
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-rkl:          [SKIP][361] ([i915#17431] / [i915#3638]) -> [SKIP][362] ([i915#14544] / [i915#17431] / [i915#3638])
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-rkl-4/igt@kms_big_fb@linear-16bpp-rotate-90.html
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-6/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-rkl:          [SKIP][363] ([i915#14544] / [i915#17431] / [i915#3638]) -> [SKIP][364] ([i915#17431] / [i915#3638]) +1 other test skip
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-rkl-6/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
    - shard-rkl:          [SKIP][365] ([i915#4538]) -> [SKIP][366] ([i915#14544] / [i915#4538]) +1 other test skip
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-rkl-4/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-rkl:          [SKIP][367] ([i915#17432]) -> [SKIP][368] ([i915#14544] / [i915#17432])
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-rkl-2/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-6/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-rkl:          [SKIP][369] ([i915#14544] / [i915#4538]) -> [SKIP][370] ([i915#4538])
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-rkl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-rkl:          [SKIP][371] ([i915#12313] / [i915#14544]) -> [SKIP][372] ([i915#12313])
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-b-edp-1:
    - shard-mtlp:         [FAIL][373] ([i915#17158]) -> [INCOMPLETE][374] ([i915#15582])
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-mtlp-8/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-b-edp-1.html
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-mtlp-8/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-b-edp-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2:
    - shard-rkl:          [SKIP][375] ([i915#6095]) -> [SKIP][376] ([i915#14544] / [i915#6095]) +3 other tests skip
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-rkl-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2.html
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs:
    - shard-rkl:          [SKIP][377] ([i915#14098] / [i915#6095]) -> [SKIP][378] ([i915#14098] / [i915#14544] / [i915#6095]) +4 other tests skip
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-rkl-2/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs.html
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs:
    - shard-rkl:          [SKIP][379] ([i915#14098] / [i915#14544] / [i915#6095]) -> [SKIP][380] ([i915#14098] / [i915#6095]) +1 other test skip
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-rkl:          [SKIP][381] ([i915#17427]) -> [SKIP][382] ([i915#14544] / [i915#17427]) +1 other test skip
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-rkl-2/igt@kms_chamelium_color@ctm-max.html
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-6/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601:
    - shard-rkl:          [SKIP][383] ([i915#14544] / [i915#17427]) -> [SKIP][384] ([i915#17427]) +1 other test skip
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-rkl-6/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601.html
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601.html

  * igt@kms_chamelium_frames@hdmi-crc-multiple:
    - shard-rkl:          [SKIP][385] ([i915#11151] / [i915#14544] / [i915#7828]) -> [SKIP][386] ([i915#11151] / [i915#7828]) +1 other test skip
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-rkl-6/igt@kms_chamelium_frames@hdmi-crc-multiple.html
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_chamelium_frames@hdmi-crc-multiple.html

  * igt@kms_chamelium_hpd@hdmi-hpd-after-runtime-suspend-d3hot:
    - shard-rkl:          [SKIP][387] ([i915#11151]) -> [SKIP][388] ([i915#11151] / [i915#14544])
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-rkl-2/igt@kms_chamelium_hpd@hdmi-hpd-after-runtime-suspend-d3hot.html
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-6/igt@kms_chamelium_hpd@hdmi-hpd-after-runtime-suspend-d3hot.html

  * igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:
    - shard-rkl:          [SKIP][389] ([i915#11151] / [i915#7828]) -> [SKIP][390] ([i915#11151] / [i915#14544] / [i915#7828])
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-rkl-4/igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode.html
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-6/igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode.html

  * igt@kms_content_protection@uevent:
    - shard-rkl:          [SKIP][391] ([i915#14544] / [i915#15865]) -> [SKIP][392] ([i915#15865])
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-rkl-6/igt@kms_content_protection@uevent.html
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-rkl:          [SKIP][393] ([i915#14544] / [i915#4103]) -> [SKIP][394] ([i915#4103])
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-rkl-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dp_link_training@uhbr-sst-direct-train:
    - shard-rkl:          [SKIP][395] ([i915#14544] / [i915#17285]) -> [SKIP][396] ([i915#17285])
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-rkl-6/igt@kms_dp_link_training@uhbr-sst-direct-train.html
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_dp_link_training@uhbr-sst-direct-train.html

  * igt@kms_dsc@dsc-basic:
    - shard-rkl:          [SKIP][397] ([i915#16361]) -> [SKIP][398] ([i915#14544] / [i915#16361])
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-rkl-2/igt@kms_dsc@dsc-basic.html
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-6/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-rkl:          [SKIP][399] ([i915#14544] / [i915#16361]) -> [SKIP][400] ([i915#16361])
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-rkl-6/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-rkl:          [SKIP][401] ([i915#14544] / [i915#9934]) -> [SKIP][402] ([i915#9934]) +4 other tests skip
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-rkl-6/igt@kms_flip@2x-dpms-vs-vblank-race.html
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
    - shard-rkl:          [SKIP][403] ([i915#9934]) -> [SKIP][404] ([i915#14544] / [i915#9934]) +1 other test skip
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-rkl-2/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-6/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-glk:          [INCOMPLETE][405] ([i915#12745] / [i915#13356] / [i915#17183] / [i915#4839]) -> [INCOMPLETE][406] ([i915#12314] / [i915#12745] / [i915#13356] / [i915#17183] / [i915#4839])
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-glk4/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk8/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2:
    - shard-glk:          [INCOMPLETE][407] ([i915#12745] / [i915#13356] / [i915#17183]) -> [INCOMPLETE][408] ([i915#12314] / [i915#12745] / [i915#13356] / [i915#17183])
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-glk4/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2.html
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk8/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-rkl:          [SKIP][409] ([i915#14544] / [i915#15643]) -> [SKIP][410] ([i915#15643])
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-rkl:          [SKIP][411] ([i915#15643]) -> [SKIP][412] ([i915#14544] / [i915#15643])
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-rkl-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-rkl:          [SKIP][413] ([i915#14544] / [i915#17428] / [i915#1825]) -> [SKIP][414] ([i915#17428] / [i915#1825]) +1 other test skip
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-gtt.html
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-mtlp:         [INCOMPLETE][415] ([i915#10056] / [i915#16950]) -> [FAIL][416] ([i915#17276])
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-rte:
    - shard-rkl:          [SKIP][417] ([i915#17428]) -> [SKIP][418] ([i915#14544] / [i915#17428]) +17 other tests skip
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-rkl-4/igt@kms_frontbuffer_tracking@fbchdr-2p-rte.html
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-2p-rte.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-shrfb-fliptrack-mmap-gtt:
    - shard-rkl:          [SKIP][419] ([i915#14544] / [i915#17428]) -> [SKIP][420] ([i915#17428]) +24 other tests skip
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-shrfb-fliptrack-mmap-gtt.html
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-shrfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@hdr-suspend:
    - shard-rkl:          [INCOMPLETE][421] ([i915#16056]) -> [SKIP][422] ([i915#15989])
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-suspend.html
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_frontbuffer_tracking@hdr-suspend.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:
    - shard-rkl:          [SKIP][423] ([i915#15102]) -> [SKIP][424] ([i915#14544] / [i915#15102]) +7 other tests skip
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-rkl:          [SKIP][425] ([i915#17428] / [i915#1825]) -> [SKIP][426] ([i915#14544] / [i915#17428] / [i915#1825])
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-gtt.html
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt:
    - shard-rkl:          [SKIP][427] ([i915#14544] / [i915#15102]) -> [SKIP][428] ([i915#15102]) +8 other tests skip
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt.html
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt.html

  * igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c:
    - shard-rkl:          [SKIP][429] ([i915#17455]) -> [SKIP][430] ([i915#14544] / [i915#17455])
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-rkl-2/igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c.html
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-6/igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c.html

  * igt@kms_pipe_stress@stress-xrgb8888-4tiled:
    - shard-rkl:          [SKIP][431] ([i915#14712]) -> [SKIP][432] ([i915#14544] / [i915#14712])
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-rkl-2/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-6/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier:
    - shard-rkl:          [SKIP][433] ([i915#14544] / [i915#15709]) -> [SKIP][434] ([i915#15709]) +1 other test skip
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-rkl-6/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html

  * igt@kms_plane@pixel-format-yf-tiled-modifier:
    - shard-rkl:          [SKIP][435] ([i915#15709]) -> [SKIP][436] ([i915#14544] / [i915#15709])
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-rkl-2/igt@kms_plane@pixel-format-yf-tiled-modifier.html
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-6/igt@kms_plane@pixel-format-yf-tiled-modifier.html

  * igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled:
    - shard-rkl:          [SKIP][437] ([i915#14544] / [i915#17832]) -> [SKIP][438] ([i915#17832])
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-rkl-6/igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled.html
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-rkl:          [SKIP][439] ([i915#12343] / [i915#14544] / [i915#5354]) -> [SKIP][440] ([i915#12343] / [i915#5354])
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-rkl-6/igt@kms_pm_backlight@bad-brightness.html
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-rkl:          [SKIP][441] ([i915#14544] / [i915#15948]) -> [SKIP][442] ([i915#15948])
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-rkl-6/igt@kms_pm_dc@dc6-psr.html
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-rkl:          [SKIP][443] ([i915#14544] / [i915#6524]) -> [SKIP][444] ([i915#6524])
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-rkl-6/igt@kms_prime@basic-modeset-hybrid.html
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - shard-rkl:          [SKIP][445] ([i915#11520] / [i915#14544]) -> [SKIP][446] ([i915#11520]) +2 other tests skip
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr@fbc-psr2-cursor-mmap-cpu:
    - shard-rkl:          [SKIP][447] ([i915#1072] / [i915#9732]) -> [SKIP][448] ([i915#1072] / [i915#14544] / [i915#9732]) +3 other tests skip
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-rkl-4/igt@kms_psr@fbc-psr2-cursor-mmap-cpu.html
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-6/igt@kms_psr@fbc-psr2-cursor-mmap-cpu.html

  * igt@kms_psr@psr-suspend:
    - shard-rkl:          [SKIP][449] ([i915#1072] / [i915#14544] / [i915#9732]) -> [SKIP][450] ([i915#1072] / [i915#9732]) +4 other tests skip
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-rkl-6/igt@kms_psr@psr-suspend.html
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_psr@psr-suspend.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-rkl:          [SKIP][451] ([i915#14544] / [i915#8623]) -> [SKIP][452] ([i915#8623])
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-rkl-6/igt@kms_tiled_display@basic-test-pattern.html
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_tiled_display@basic-test-pattern.html

  * igt@perf@mi-rpc:
    - shard-rkl:          [SKIP][453] ([i915#2434]) -> [SKIP][454] ([i915#14544] / [i915#2434])
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-rkl-4/igt@perf@mi-rpc.html
   [454]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-6/igt@perf@mi-rpc.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10056]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10056
  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
  [i915#10647]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#10959]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10959
  [i915#11151]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#12169]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12169
  [i915#12276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276
  [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
  [i915#12314]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12314
  [i915#12316]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316
  [i915#12343]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343
  [i915#12358]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12358
  [i915#12713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713
  [i915#12745]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745
  [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
  [i915#13356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356
  [i915#13520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13520
  [i915#13566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566
  [i915#13748]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748
  [i915#13820]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13820
  [i915#14098]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098
  [i915#14152]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14152
  [i915#14419]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14419
  [i915#14544]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544
  [i915#14586]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14586
  [i915#14702]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14702
  [i915#14712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712
  [i915#14888]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14888
  [i915#15073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073
  [i915#15102]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102
  [i915#15104]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104
  [i915#15243]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243
  [i915#15330]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330
  [i915#15342]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15342
  [i915#15391]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15391
  [i915#15479]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15479
  [i915#15492]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15492
  [i915#15582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582
  [i915#15643]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643
  [i915#15709]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709
  [i915#15725]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15725
  [i915#15865]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865
  [i915#15867]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867
  [i915#15948]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948
  [i915#15989]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989
  [i915#15990]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990
  [i915#15991]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991
  [i915#16056]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16056
  [i915#16081]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081
  [i915#16182]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16182
  [i915#16184]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16184
  [i915#16236]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16236
  [i915#16348]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16348
  [i915#16361]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361
  [i915#16451]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16451
  [i915#16471]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471
  [i915#16479]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16479
  [i915#16490]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16490
  [i915#16593]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16593
  [i915#16600]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16600
  [i915#16644]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644
  [i915#16950]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16950
  [i915#16990]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16990
  [i915#17076]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17076
  [i915#17101]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17101
  [i915#17108]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17108
  [i915#17146]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17146
  [i915#17158]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17158
  [i915#17183]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17183
  [i915#17224]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17224
  [i915#17244]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17244
  [i915#17276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17276
  [i915#17285]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17285
  [i915#17286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17286
  [i915#17290]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17290
  [i915#17427]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427
  [i915#17428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428
  [i915#17431]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17431
  [i915#17432]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17432
  [i915#17433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17433
  [i915#17453]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17453
  [i915#17455]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17455
  [i915#17456]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17456
  [i915#17458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17458
  [i915#17462]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17462
  [i915#17465]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17465
  [i915#17467]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17467
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
  [i915#17506]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17506
  [i915#17507]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17507
  [i915#17508]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17508
  [i915#17509]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17509
  [i915#17510]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17510
  [i915#17512]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17512
  [i915#17517]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17517
  [i915#17520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17520
  [i915#17521]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17521
  [i915#17522]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17522
  [i915#17524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17524
  [i915#17525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17525
  [i915#17527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17527
  [i915#17528]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17528
  [i915#17530]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17530
  [i915#17533]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17533
  [i915#17535]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17535
  [i915#17536]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17536
  [i915#17539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17539
  [i915#17540]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17540
  [i915#17543]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17543
  [i915#17546]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17546
  [i915#17547]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17547
  [i915#17553]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17553
  [i915#17556]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17556
  [i915#17559]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17559
  [i915#17561]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17561
  [i915#17562]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17562
  [i915#17564]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17564
  [i915#17566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17566
  [i915#17569]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17569
  [i915#17570]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17570
  [i915#17578]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17578
  [i915#17579]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17579
  [i915#17580]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17580
  [i915#17584]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17584
  [i915#17585]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17585
  [i915#17616]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17616
  [i915#17678]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17678
  [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
  [i915#17697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17697
  [i915#17702]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17702
  [i915#17704]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17704
  [i915#17706]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17706
  [i915#17711]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17711
  [i915#17832]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17832
  [i915#17833]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17833
  [i915#17843]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17843
  [i915#17844]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17844
  [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
  [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
  [i915#2434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434
  [i915#2435]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2435
  [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
  [i915#2658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658
  [i915#280]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280
  [i915#284]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284
  [i915#2856]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
  [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
  [i915#3297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299
  [i915#3323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323
  [i915#3359]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3359
  [i915#3539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#3711]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3711
  [i915#3742]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
  [i915#4349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349
  [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
  [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#4817]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817
  [i915#4839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839
  [i915#4852]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852
  [i915#4860]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860
  [i915#4884]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4884
  [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#5439]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439
  [i915#5956]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5956
  [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
  [i915#6524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
  [i915#7276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7276
  [i915#7707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707
  [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
  [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
  [i915#8399]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399
  [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
  [i915#8555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555
  [i915#8623]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623
  [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
  [i915#8814]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814
  [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9878]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9878
  [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
  [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934


Build changes
-------------

  * Linux: CI_DRM_19560 -> Patchwork_178822v2

  CI-20190529: 20190529
  CI_DRM_19560: 48995c76e90141a4e72ceafeb3762d4a3580eeef @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_9197: 9197
  Patchwork_178822v2: 48995c76e90141a4e72ceafeb3762d4a3580eeef @ git://anongit.freedesktop.org/gfx-ci/linux
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/index.html

--===============1661666114834232888==
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
<tr><td><b>Series:</b></td><td>drm/atomic-helper: Eliminate the fake_commit=
 spurious -EBUSYs (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/178822/">https://patchwork.freedesktop.org/series/178822/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/Patchwork_178822v2/index.html">https://intel-gfx-ci.01.org/tre=
e/drm-tip/Patchwork_178822v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_19560_full -&gt; Patchwork_178822v=
2_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with Patchwork_178822v2_full absolutely n=
eed to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in Patchwork_178822v2_full, please notify your bug team (I915-=
ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in Patchwork_=
178822v2_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_pm_freq_api@freq-suspend@gt0:<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-mtlp-4/igt@i915_pm_freq_api@freq-sus=
pend@gt0.html">DMESG-FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_178822v2_full that come from kno=
wn issues:</p>
<h3>CI changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>boot:<ul>
<li>shard-dg1:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_19560/shard-dg1-19/boot.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-dg1-19/boot.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-dg1-18=
/boot.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/C=
I_DRM_19560/shard-dg1-18/boot.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/CI_DRM_19560/shard-dg1-18/boot.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-dg1-18/bo=
ot.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_D=
RM_19560/shard-dg1-17/boot.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/CI_DRM_19560/shard-dg1-17/boot.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-dg1-16/boot=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM=
_19560/shard-dg1-16/boot.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/CI_DRM_19560/shard-dg1-16/boot.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-dg1-15/boot.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19=
560/shard-dg1-15/boot.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/CI_DRM_19560/shard-dg1-15/boot.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-dg1-15/boot.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560=
/shard-dg1-14/boot.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/CI_DRM_19560/shard-dg1-14/boot.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/shard-dg1-14/boot.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19560/sh=
ard-dg1-14/boot.html">PASS</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/Patchwork_178822v2/shard-dg1-19/boot.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-dg1-=
19/boot.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/Patchwork_178822v2/shard-dg1-19/boot.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-dg1-18/boot.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_1788=
22v2/shard-dg1-18/boot.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/Patchwork_178822v2/shard-dg1-18/boot.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-dg1-=
18/boot.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/Patchwork_178822v2/shard-dg1-17/boot.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-dg1-17/boot.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_1788=
22v2/shard-dg1-17/boot.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/Patchwork_178822v2/shard-dg1-17/boot.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-dg1-=
16/boot.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/Patchwork_178822v2/shard-dg1-16/boot.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-dg1-16/boot.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_1788=
22v2/shard-dg1-16/boot.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/Patchwork_178822v2/shard-dg1-15/boot.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-dg1-=
15/boot.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/Patchwork_178822v2/shard-dg1-15/boot.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-dg1-14/boot.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_1788=
22v2/shard-dg1-14/boot.html">PASS</a>)</li>
</ul>
</li>
</ul>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@object-reloc-purge-cache:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@api_intel_bb@object-reloc-=
purge-cache.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_basic@multigpu-create-close:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk10/igt@gem_basic@multigpu-create-=
close.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/17697">i915#17697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-copy-compressed:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-dg1-15/igt@gem_ccs@block-copy-compre=
ssed.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk11/igt@gem_ccs@ctrl-surf-copy.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17499">i915#17499</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@large-ctrl-surf-copy:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk1/igt@gem_ccs@large-ctrl-surf-cop=
y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17499">i915#17499</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-set-pat:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk10/igt@gem_create@create-ext-set-=
pat.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17530">i915#17530</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19560/shard-rkl-7/igt@gem_ctx_isolation@preservation-s3.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178=
822v2/shard-rkl-3/igt@gem_ctx_isolation@preservation-s3.html">INCOMPLETE</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356=
">i915#13356</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_param@set-priority-not-supported:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk10/igt@gem_ctx_param@set-priority=
-not-supported.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/17535">i915#17535</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-hang@bcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk2/igt@gem_ctx_persistence@engines=
-hang@bcs0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17527">i915#17527</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@hang:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-mtlp-4/igt@gem_ctx_persistence@hang.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/8555">i915#8555</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-sseu:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk1/igt@gem_ctx_sseu@invalid-sseu.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17496">i915#17496</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-out-fence:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk10/igt@gem_exec_balancer@parallel=
-out-fence.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17547">i915#17547</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-recoverable:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk4/igt@gem_exec_capture@capture-re=
coverable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17711">i915#17711</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-pro-default:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-dg1-15/igt@gem_exec_flush@basic-uc-p=
ro-default.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3539">i915#3539</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/4852">i915#4852</a>) +2 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@rsvd2-dirt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-dg1-15/igt@gem_exec_params@rsvd2-dir=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17453">i915#17453</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read-noreloc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@gem_exec_reloc@basic-write=
-read-noreloc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/3281">i915#3281</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-wc-noreloc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-dg1-16/igt@gem_exec_reloc@basic-writ=
e-wc-noreloc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/3281">i915#3281</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@semaphore-power:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@gem_exec_schedule@semaphor=
e-power.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/7276">i915#7276</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@2-spare-fences:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-mtlp-4/igt@gem_fenced_exec_thrash@2-=
spare-fences.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/4860">i915#4860</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk11/igt@gem_huc_copy@huc-copy.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/17456">i915#17456</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi-ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk1/igt@gem_lmem_swapping@heavy-ver=
ify-multi-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/17503">i915#17503</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +2 other tests s=
kip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@gem_lmem_swapping@heavy-ve=
rify-multi-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/4613">i915#4613</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_madvise@dontneed-before-pwrite:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@gem_madvise@dontneed-befor=
e-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/3282">i915#3282</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@gem_media_vme.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284"=
>i915#284</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk1/igt@gem_media_vme.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17543=
">i915#17543</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@bad-object:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-mtlp-4/igt@gem_mmap@bad-object.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/4083">i915#4083</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@big-copy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-dg1-16/igt@gem_mmap_gtt@big-copy.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/4077">i915#4077</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-uncached:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-dg1-15/igt@gem_partial_pwrite_pread@=
writes-after-reads-uncached.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk1/igt@gem_pwrite@basic-exhaustion=
.html">WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/14702">i915#14702</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/2658">i915#2658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk1/igt@gem_pxp@verify-pxp-key-chan=
ge-after-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/17521">i915#17521</a>) +1 other test skip</=
li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-dg1-16/igt@gem_pxp@verify-pxp-key-ch=
ange-after-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>) +2 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-buf-execution:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk10/igt@gem_pxp@verify-pxp-stale-b=
uf-execution.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/17521">i915#17521</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-ctx-execution:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk11/igt@gem_pxp@verify-pxp-stale-c=
tx-execution.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/17521">i915#17521</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-to-vebox-y-tiled:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk2/igt@gem_render_copy@yf-tiled-to=
-vebox-y-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/17492">i915#17492</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_pwrite:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-mtlp-4/igt@gem_set_tiling_vs_pwrite.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/4079">i915#4079</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk1/igt@gem_userptr_blits@dmabuf-sy=
nc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17507">i915#17507</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/3323">i915#3323</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@gem_userptr_blits@dmabuf-s=
ync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3297">i915#3297</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/3323">i915#3323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-unsync:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk4/igt@gem_userptr_blits@dmabuf-un=
sync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17507">i915#17507</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@forbidden-operations:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@gem_userptr_blits@forbidde=
n-operations.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/3282">i915#3282</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-after-close:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@gem_userptr_blits@unsync-u=
nmap-after-close.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/3297">i915#3297</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-cycles:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-mtlp-4/igt@gem_userptr_blits@unsync-=
unmap-cycles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19560/shard-glk6/igt@gem_workarounds@suspend-resume.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v=
2/shard-glk8/igt@gem_workarounds@suspend-resume.html">INCOMPLETE</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#1=
3356</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/14586">i915#14586</a>)</li>
</ul>
</li>
<li>
<p>igt@gen3_render_tiledy_blits:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk4/igt@gen3_render_tiledy_blits.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17578">i915#17578</a>)</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@batch-without-end:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@gen7_exec_parse@batch-with=
out-end.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/17455">i915#17455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@chained-batch:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk10/igt@gen7_exec_parse@chained-ba=
tch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17505">i915#17505</a>)</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@cmd-crossing-page:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk4/igt@gen7_exec_parse@cmd-crossin=
g-page.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17505">i915#17505</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-cmd:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-dg1-16/igt@gen9_exec_parse@bb-start-=
cmd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/2527">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@secure-batches:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-mtlp-4/igt@gen9_exec_parse@secure-ba=
tches.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_hangman@gt-engine-error@bcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk1/igt@i915_hangman@gt-engine-erro=
r@bcs0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17580">i915#17580</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@__uc_init:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-rkl-7/igt@i915_module_load@fault-inj=
ection@__uc_init.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/15479">i915#15479</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@intel_connector_register:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-rkl-7/igt@i915_module_load@fault-inj=
ection@intel_connector_register.html">ABORT</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15342">i915#15342</a>) +1 other te=
st abort</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@resize-bar:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk4/igt@i915_module_load@resize-bar=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17566">i915#17566</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-reset:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@i915_pm_freq_api@freq-rese=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/8399">i915#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-suspend@gt1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-mtlp-4/igt@i915_pm_freq_api@freq-sus=
pend@gt1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/13820">i915#13820</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress-pc8:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk1/igt@i915_pm_rpm@gem-execbuf-str=
ess-pc8.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/17706">i915#17706</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@hwconfig_table:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk4/igt@i915_query@hwconfig_table.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17584">i915#17584</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@mock:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19560/shard-tglu-9/igt@i915_selftest@mock.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-tg=
lu-3/igt@i915_selftest@mock.html">ABORT</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/17076">i915#17076</a>) +1 other test a=
bort</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-dg1-15/igt@i915_suspend@basic-s3-wit=
hout-i915.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17844">i915#17844</a>) +3 other tests abort</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-untiled:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk11/igt@i915_suspend@fence-restore=
-untiled.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/16182">i915#16182</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a>)=
</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@sysfs-reader:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk1/igt@i915_suspend@sysfs-reader.h=
tml">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/13356">i915#13356</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/16182">i915#16182</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@intel_hwmon@hwmon-read.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/7707">i915#7707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19560/shard-glk3/igt@kms_async_flips@alternate-sync-async-flip-atom=
ic@pipe-a-hdmi-a-2.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/Patchwork_178822v2/shard-glk2/igt@kms_async_flips@alternat=
e-sync-async-flip-atomic@pipe-a-hdmi-a-2.html">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/14888">i915#14888</a>) +1 =
other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk10/igt@kms_async_flips@async-flip=
-with-page-flip-events-linear.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/17562">i915#17562</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk4/igt@kms_async_flips@async-flip-=
with-page-flip-events-linear-atomic.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/17562">i915#17562</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk4/igt@kms_atomic@plane-primary-ov=
erlay-mutable-zpos.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/17485">i915#17485</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk1/igt@kms_atomic_transition@plane=
-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a>=
)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_atomic_transition@plan=
e-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555=
">i915#3555</a>)</li>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19560/shard-mtlp-3/igt@kms_atomic_transition@plane-all-modeset-tran=
sition-fencing-internal-panels.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-mtlp-1/igt@kms_atomic=
_transition@plane-all-modeset-transition-fencing-internal-panels.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/59=
56">i915#5956</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_big_fb@4-tiled-32bpp-r=
otate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/4538">i915#4538</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_big_fb@4-tiled-addfb.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/5286">i915#5286</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk1/igt@kms_big_fb@4-tiled-addfb.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17556">i915#17556</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk2/igt@kms_big_fb@4-tiled-max-hw-s=
tride-64bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/17478">i915#17478</a>) +3 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_big_fb@linear-32bpp-ro=
tate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/17431">i915#17431</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) +2 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk1/igt@kms_big_fb@linear-max-hw-st=
ride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/17524">i915#17524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-mtlp-4/igt@kms_big_fb@x-tiled-16bpp-=
rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17431">i915#17431</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk10/igt@kms_big_fb@x-tiled-64bpp-r=
otate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17500">i915#17500</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk1/igt@kms_big_fb@x-tiled-max-hw-s=
tride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/17500">i915#17500</a>) +8 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-dg1-16/igt@kms_big_fb@y-tiled-8bpp-r=
otate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/3638">i915#3638</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk11/igt@kms_big_fb@yf-tiled-16bpp-=
rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17500">i915#17500</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_big_fb@yf-tiled-32bpp-=
rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/4538">i915#4538</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk10/igt@kms_big_fb@yf-tiled-64bpp-=
rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17478">i915#17478</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk11/igt@kms_big_fb@yf-tiled-8bpp-r=
otate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17478">i915#17478</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-dg1-15/igt@kms_big_fb@yf-tiled-max-h=
w-stride-64bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/4538">i915#4538</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_ccs@bad-rotation-90-4-=
tiled-mtl-rc-ccs@pipe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +43 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs@pipe-c-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-mtlp-4/igt@kms_ccs@crc-primary-basic=
-4-tiled-dg2-mc-ccs@pipe-c-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +4 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1:</=
p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk10/igt@kms_ccs@crc-primary-basic-=
y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/17491">i915#17491</a>) +31 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-2:</=
p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk10/igt@kms_ccs@crc-primary-basic-=
y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/17490">i915#17490</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17491">i915=
#17491</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2:</=
p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-rkl-4/igt@kms_ccs@crc-primary-suspen=
d-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#=
6095</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-dg2-4/igt@kms_ccs@crc-primary-suspen=
d-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +3 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-2:=
</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk1/igt@kms_ccs@crc-primary-suspend=
-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/17490">i915#17490</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17491">i91=
5#17491</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3:<=
/p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-dg2-3/igt@kms_ccs@crc-sprite-planes-=
basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915=
#6095</a>) +61 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk11/igt@kms_ccs@crc-sprite-planes-=
basic-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/17490">i915#17490</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/17491">i915#17491</a>) +1 =
other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-1:<=
/p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk11/igt@kms_ccs@crc-sprite-planes-=
basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/17491">i915#17491</a>) +6 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-=
basic-y-tiled-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-=
basic-y-tiled-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/6095">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk4/igt@kms_ccs@missing-ccs-buffer-=
4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/17491">i915#17491</a>) +48 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-dg2-4/igt@kms_ccs@missing-ccs-buffer=
-y-tiled-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434">i915#10434</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">=
i915#6095</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-dg1-15/igt@kms_ccs@missing-ccs-buffe=
r-yf-tiled-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +96 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk1/igt@kms_ccs@random-ccs-data-4-t=
iled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/17525">i915#17525</a>) +2 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_ccs@random-ccs-data-4-=
tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/12313">i915#12313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_cdclk@plane-scaling.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3742">i915#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-after-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_chamelium_audio@hdmi-a=
udio-after-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/11151">i915#11151</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk10/igt@kms_chamelium_color@gamma.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17489">i915#17489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-l=
ut1d:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk10/igt@kms_chamelium_color_pipeli=
ne@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17497">i915#17497</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lu=
t1d:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-dg1-16/igt@kms_chamelium_color_pipel=
ine@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a=
>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk4/igt@kms_chamelium_color_pipelin=
e@plane-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/17497">i915#17497</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_chamelium_color_pipeli=
ne@plane-lut1d-ctm3x4-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-suspend:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-mtlp-4/igt@kms_chamelium_edid@dp-edi=
d-change-during-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +1 oth=
er test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-fast:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_chamelium_frames@dp-cr=
c-fast.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-fast:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk10/igt@kms_chamelium_frames@hdmi-=
crc-fast.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17483">i915#17483</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-dg1-15/igt@kms_chamelium_hpd@hdmi-hp=
d-enable-disable-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk1/igt@kms_chamelium_hpd@hdmi-hpd-=
storm-disable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/17483">i915#17483</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk11/igt@kms_chamelium_hpd@vga-hpd-=
enable-disable-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/17483">i915#17483</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-ctm3x4-lut1d@pipe-b-plane-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-dg1-15/igt@kms_color_pipeline@plane-=
ctm3x4-lut1d@pipe-b-plane-4.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/16990">i915#16990</a>) +15 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk1/igt@kms_color_pipeline@plane-fi=
xed-matrix-yuv-rgb-bt709.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/17510">i915#17510</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk10/igt@kms_color_pipeline@plane-l=
ut1d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17510">i915#17510</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-b-plane-4:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_color_pipeline@plane-l=
ut1d-ctm3x4@pipe-b-plane-4.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/16990">i915#16990</a>) +5 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk1/igt@kms_content_protection@atom=
ic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17508">i915#17508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-mtlp-4/igt@kms_content_protection@dp=
-mst-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/15330">i915#15330</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk1/igt@kms_content_protection@dp-m=
st-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17502">i915#17502</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_content_protection@mei=
-interface.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/15865">i915#15865</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk10/igt@kms_content_protection@srm=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17508">i915#17508</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x42:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-mtlp-4/igt@kms_cursor_crc@cursor-ons=
creen-128x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/8814">i915#8814</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk1/igt@kms_cursor_crc@cursor-rando=
m-32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/17504">i915#17504</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk1/igt@kms_cursor_crc@cursor-rando=
m-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17533">i915#17533</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-64x21@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_cursor_crc@cursor-rand=
om-64x21@pipe-a-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/13566">i915#13566</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-mtlp-4/igt@kms_cursor_crc@cursor-sli=
ding-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/13049">i915#13049</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/3359">i915#3359</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19560/shard-rkl-2/igt@kms_cursor_crc@cursor-suspend.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v=
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
/tree/drm-tip/Patchwork_178822v2/shard-rkl-6/igt@kms_cursor_crc@cursor-susp=
end@pipe-a-hdmi-a-2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/12358">i915#12358</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/14152">i915#14152</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-dg2-3/igt@kms_cursor_crc@cursor-susp=
end@pipe-a-hdmi-a-3.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/17844">i915#17844</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk10/igt@kms_dp_link_training@non-u=
hbr-mst-tbtalt-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/17616">i915#17616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst-direct-train:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk1/igt@kms_dp_link_training@non-uh=
br-sst-direct-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/17506">i915#17506</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_dp_link_training@non-u=
hbr-sst-direct-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/17286">i915#17286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-rkl-7/igt@kms_dp_link_training@non-u=
hbr-sst-tbtalt-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/17290">i915#17290</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_dp_link_training@uhbr-=
mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/13748">i915#13748</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk2/igt@kms_dp_link_training@uhbr-s=
st.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17477">i915#17477</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic-bigjoiner:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk10/igt@kms_dsc@dsc-basic-bigjoine=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17458">i915#17458</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-bigjoiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_dsc@dsc-fractional-bpp=
-bigjoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/16361">i915#16361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc-bigjoiner:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-mtlp-4/igt@kms_dsc@dsc-fractional-bp=
p-with-bpc-bigjoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/16361">i915#16361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats-bigjoiner:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk1/igt@kms_dsc@dsc-with-bpc-format=
s-bigjoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/17458">i915#17458</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-mtlp-4/igt@kms_feature_discovery@dis=
play-4x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/16081">i915#16081</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk4/igt@kms_feature_discovery@dp-ms=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17570">i915#17570</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dsc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk1/igt@kms_feature_discovery@dsc.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17539">i915#17539</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-dg1-16/igt@kms_feature_discovery@dsc=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/16600">i915#16600</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk1/igt@kms_feature_discovery@psr2.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17585">i915#17585</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_flip@2x-dpms-vs-vblank=
-race-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk11/igt@kms_flip@2x-flip-vs-suspen=
d.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/12745">i915#12745</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/17183">i915#17183</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#=
4839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk11/igt@kms_flip@2x-flip-vs-suspen=
d@ac-hdmi-a1-hdmi-a2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17183">i=
915#17183</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-mtlp-4/igt@kms_flip@2x-single-buffer=
-flip-vs-dpms-off-vs-modeset.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk4/igt@kms_flip@flip-vs-suspend.ht=
ml">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/12745">i915#12745</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/17183">i915#17183</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk4/igt@kms_flip@flip-vs-suspend@a-=
hdmi-a1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/12745">i915#12745</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17183">i915#17183</a>=
)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-snb1/igt@kms_flip@flip-vs-suspend@a-=
hdmi-a1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/12314">i915#12314</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_flip_scaled_crc@flip-3=
2bpp-4tile-to-64bpp-4tile-upscaling.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +1 other=
 test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pi=
pe-a-valid-mode:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk1/igt@kms_flip_scaled_crc@flip-32=
bpp-linear-to-64bpp-linear-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17522">i91=
5#17522</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downsc=
aling:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk10/igt@kms_flip_scaled_crc@flip-3=
2bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17493">i915#17493</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk10/igt@kms_flip_scaled_crc@flip-6=
4bpp-4tile-to-32bpp-4tile-downscaling.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/17484">i915#17484</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk1/igt@kms_flip_scaled_crc@flip-64=
bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17484">i915#17484</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk4/igt@kms_flip_scaled_crc@flip-64=
bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17493">i915#17493</a>)=
 +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk10/igt@kms_force_connector_basic@=
force-load-detect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/17465">i915#17465</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-gtt:</=
p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-dg1-17/igt@kms_frontbuffer_tracking@=
fbc-1p-offscreen-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i91=
5#15990</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_frontbuffer_tracking@f=
bc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1=
825</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk4/igt@kms_frontbuffer_tracking@fb=
chdr-2p-primscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/17517">i915#17517</a>) +41 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-cur-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-dg1-16/igt@kms_frontbuffer_tracking@=
fbchdr-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +1=
 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-dg1-16/igt@kms_frontbuffer_tracking@=
fbcpsr-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) +10 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-rkl-7/igt@kms_frontbuffer_tracking@f=
bcpsr-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) +29 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk4/igt@kms_frontbuffer_tracking@fb=
cpsr-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/17559">i915#17559</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-w=
c:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk1/igt@kms_frontbuffer_tracking@fb=
cpsrhdr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17482">i915#17482</a>) +=
74 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-mtlp-4/igt@kms_frontbuffer_tracking@=
fbcpsrhdr-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +1 othe=
r test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-dg1-15/igt@kms_frontbuffer_tracking@=
fbcpsrhdr-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-dg1-16/igt@kms_frontbuffer_tracking@=
hdr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +4 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_frontbuffer_tracking@h=
dr-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +7 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19560/shard-glk8/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-i=
ndfb-onoff.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/Patchwork_178822v2/shard-glk3/igt@kms_frontbuffer_tracking@hdr-1p-=
primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/17517">i915#17517</a>) +6 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19560/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-m=
map-gtt.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_frontbuffer_tracking@hdr-rgb10=
1010-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/15989">i915#15989</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-suspend:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk10/igt@kms_frontbuffer_tracking@h=
dr-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/16056">i915#16056</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16593">i915#16593<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt:</=
p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_frontbuffer_tracking@p=
sr-1p-offscreen-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +25 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-dg1-15/igt@kms_frontbuffer_tracking@=
psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8=
708</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-mtlp-4/igt@kms_frontbuffer_tracking@=
psr-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#174=
28</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/1825">i915#1825</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk10/igt@kms_frontbuffer_tracking@p=
sr-2p-scndscrn-pri-shrfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/17482">i915#17482</a>) +44 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-dg1-17/igt@kms_frontbuffer_tracking@=
psr-indfb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +2 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk11/igt@kms_frontbuffer_tracking@p=
srhdr-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/17482">i915#17482</a>) +13 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-spr-indfb-draw-render:</=
p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-mtlp-4/igt@kms_frontbuffer_tracking@=
psrhdr-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i91=
5#17428</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk1/igt@kms_hdmi_audio_bw@suspend-d=
isk-audio-recovery.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/17101">i915#17101</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/17108">i915#17108</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-4k:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19560/shard-mtlp-3/igt@kms_hdmi_inject@inject-4k.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/s=
hard-mtlp-1/igt@kms_hdmi_inject@inject-4k.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/15725">i915#15725</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk11/igt@kms_hdr@bpc-switch.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17498">i915#17498</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk10/igt@kms_hdr@bpc-switch-dpms.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17498">i915#17498</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk4/igt@kms_hdr@brightness-with-hdr=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17498">i915#17498</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-mtlp-4/igt@kms_hdr@static-toggle.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/12713">i915#12713</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/16490">i915#16490</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_hdr@static-toggle-susp=
end.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/16644">i915#16644</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk1/igt@kms_joiner@basic-big-joiner=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17512">i915#17512</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk4/igt@kms_joiner@basic-force-big-=
joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17678">i915#17678</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk10/igt@kms_joiner@invalid-modeset=
-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/17512">i915#17512</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_mst@mst-suspend-read-crc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk1/igt@kms_mst@mst-suspend-read-cr=
c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17579">i915#17579</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_mst@mst-suspend-read-c=
rc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/16451">i915#16451</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk1/igt@kms_pipe_b_c_ivb@from-pipe-=
c-to-b-with-3-lanes.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/17540">i915#17540</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-dg1-17/igt@kms_pipe_b_c_ivb@pipe-b-d=
ouble-modeset-then-modeset-pipe-c.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/17455">i915#17455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-4tiled:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-dg1-17/igt@kms_pipe_stress@stress-xr=
gb8888-4tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/14712">i915#14712</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-mtlp-4/igt@kms_plane@pixel-format-4-=
tiled-dg2-mc-ccs-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping:<=
/p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk10/igt@kms_plane@pixel-format-4-t=
iled-mtl-mc-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/17479">i915#17479</a>) +1 =
other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk1/igt@kms_plane@pixel-format-4-ti=
led-mtl-rc-ccs-cc-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/17479">i915#17479</a>) +4 other tests sk=
ip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-dg1-16/igt@kms_plane@pixel-format-4-=
tiled-mtl-rc-ccs-cc-modifier.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19560/shard-mtlp-5/igt@kms_plane@plane-panning-bottom-right-suspend=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/P=
atchwork_178822v2/shard-mtlp-2/igt@kms_plane@plane-panning-bottom-right-sus=
pend.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/17224">i915#17224</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-opaque-fb:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk10/igt@kms_plane_alpha_blend@alph=
a-opaque-fb.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/10647">i915#10647</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/12169">i915#12169</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk10/igt@kms_plane_alpha_blend@alph=
a-opaque-fb@pipe-c-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/10647">i915#10647</a>) +1 other test fa=
il</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk10/igt@kms_plane_lowres@tiling-4.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17509">i915#17509</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk10/igt@kms_plane_scaling@plane-do=
wnscale-max-crc-4-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/17528">i915#17528</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk1/igt@kms_plane_scaling@plane-dow=
nscale-max-crc-rotation-180-4-tiled.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/17528">i915#17528</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-yf-tiled:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_plane_scaling@plane-up=
scale-max-crc-rotation-180-yf-tiled.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/17832">i915#17832</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-90-y-tiled@pipe-a-h=
dmi-a-1-xv36:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-dg1-15/igt@kms_plane_scaling@plane-u=
pscale-max-crc-rotation-90-y-tiled@pipe-a-hdmi-a-1-xv36.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17843">i915=
#17843</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk2/igt@kms_pm_backlight@fade-with-=
suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/17462">i915#17462</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk10/igt@kms_pm_dc@dc5-psr.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17564">i915#17564</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk4/igt@kms_pm_dc@dc5-retention-flo=
ps.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17553">i915#17553</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_pm_dc@dc6-dpms.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/16479">i915#16479</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk1/igt@kms_pm_lpsp@kms-lpsp.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17702">i915#17702</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19560/shard-dg2-4/igt@kms_pm_rpm@dpms-lpsp.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-d=
g2-3/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19560/shard-dg1-18/igt@kms_pm_rpm@modeset-non-lpsp.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2=
/shard-dg1-15/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19560/shard-rkl-3/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.ht=
ml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patc=
hwork_178822v2/shard-rkl-8/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19560/shard-rkl-2/igt@kms_pm_rpm@system-suspend-modeset.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178=
822v2/shard-rkl-6/igt@kms_pm_rpm@system-suspend-modeset.html">INCOMPLETE</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14419=
">i915#14419</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@d3hot:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk10/igt@kms_prime@d3hot.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17=
569">i915#17569</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_properties@colorop-properties-legacy:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk10/igt@kms_properties@colorop-pro=
perties-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/17481">i915#17481</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-mtlp-4/igt@kms_psr2_sf@fbc-pr-overla=
y-primary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/12316">i915#12316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk11/igt@kms_psr2_sf@fbc-psr2-curso=
r-plane-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_psr2_sf@fbc-psr2-prima=
ry-plane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +2 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk4/igt@kms_psr2_sf@pr-overlay-plan=
e-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk10/igt@kms_psr2_sf@psr2-cursor-pl=
ane-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +4 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk10/igt@kms_psr2_su@page_flip-nv12=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17546">i915#17546</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-mmap-cpu:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk10/igt@kms_psr@fbc-psr-cursor-mma=
p-cpu.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/17480">i915#17480</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-mmap-gtt:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk11/igt@kms_psr@fbc-psr-primary-mm=
ap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17480">i915#17480</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk1/igt@kms_psr@psr-primary-page-fl=
ip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17480">i915#17480</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/9732">i915#9732</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-mmap-cpu:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-dg1-16/igt@kms_psr@psr-sprite-mmap-c=
pu.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/9732">i915#9732</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-mmap-gtt:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk4/igt@kms_psr@psr-sprite-mmap-gtt=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17480">i915#17480</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_psr@psr2-cursor-mmap-g=
tt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/9732">i915#9732</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@exhaust-fences:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-dg1-15/igt@kms_rotation_crc@exhaust-=
fences.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/4884">i915#4884</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk10/igt@kms_rotation_crc@multiplan=
e-rotation.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/15492">i915#15492</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/16184">i915#16184</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-x-tiled-reflect-x-0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk1/igt@kms_rotation_crc@primary-x-=
tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/17488">i915#17488</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-mtlp-4/igt@kms_rotation_crc@primary-=
y-tiled-reflect-x-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/15867">i915#15867</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk10/igt@kms_rotation_crc@primary-y=
f-tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/17488">i915#17488</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk10/igt@kms_scaling_modes@scaling-=
mode-center.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/17501">i915#17501</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-rkl-7/igt@kms_setmode@invalid-clone-=
single-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk10/igt@kms_tiled_display@basic-te=
st-pattern.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/10959">i915#10959</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk2/igt@kms_vblank@ts-continuation-=
suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/12276">i915#12276</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) +1 other test =
incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_vrr@flip-basic.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/15243">i915#15243</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk10/igt@kms_vrr@lobf.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17561=
">i915#17561</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk4/igt@kms_vrr@max-min.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/175=
20">i915#17520</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-dg1-15/igt@kms_vrr@seamless-rr-switc=
h-vrr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/9906">i915#9906</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@perf@gen12-unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk4/igt@perf@gen12-unprivileged-sin=
gle-ctx-counters.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/17536">i915#17536</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@per-context-mode-unprivileged:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@perf@per-context-mode-unpr=
ivileged.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/2435">i915#2435</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk10/igt@perf@unprivileged-single-c=
tx-counters.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/17704">i915#17704</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-suspend:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk10/igt@perf_pmu@rc6-suspend.html"=
>INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/13356">i915#13356</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/16236">i915#16236</a>)</li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19560/shard-rkl-8/igt@perf_pmu@rc6-suspend.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-r=
kl-3/igt@perf_pmu@rc6-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/13520">i915#13520</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-mmap:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-dg1-17/igt@prime_vgem@basic-fence-mm=
ap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3708">i915#3708</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/4077">i915#4077</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-mtlp-4/igt@prime_vgem@basic-fence-re=
ad.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-flip-hang:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-glk10/igt@prime_vgem@fence-flip-hang=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17467">i915#17467</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-write-hang:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-dg1-15/igt@prime_vgem@fence-write-ha=
ng.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_linear_blits@interruptible:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19560/shard-dg1-14/igt@gem_linear_blits@interruptible.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15391=
">i915#15391</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/Patchwork_178822v2/shard-dg1-18/igt@gem_linear_blits@interruptible.html">P=
ASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-fd:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19560/shard-rkl-3/igt@gem_workarounds@suspend-resume-fd.html">INCOM=
PLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/13356">i915#13356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@gem_workarounds@suspend-resume-=
fd.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19560/shard-rkl-6/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9878"=
>i915#9878</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/P=
atchwork_178822v2/shard-rkl-7/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a><=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-render:</=
p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19560/shard-rkl-4/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-s=
pr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/15989">i915#15989</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-6/igt@kms_f=
rontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-render.html">PASS</a>=
 +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19560/shard-glk6/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-cur-i=
ndfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/17517">i915#17517</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-glk8/igt@kms_front=
buffer_tracking@hdr-2p-primscrn-cur-indfb-draw-mmap-wc.html">PASS</a> +13 o=
ther tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19560/shard-rkl-4/igt@kms_hdr@bpc-switch.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644">i915#16644<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/35=
55">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/8228">i915#8228</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/Patchwork_178822v2/shard-rkl-6/igt@kms_hdr@bpc-switch.html"=
>PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19560/shard-dg1-17/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1507=
3">i915#15073</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/Patchwork_178822v2/shard-dg1-15/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html"=
>PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19560/shard-rkl-2/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#=
15073</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchw=
ork_178822v2/shard-rkl-4/igt@kms_pm_rpm@dpms-non-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy@vecs0:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19560/shard-rkl-5/igt@perf_pmu@busy@vecs0.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_1=
78822v2/shard-rkl-5/igt@perf_pmu@busy@vecs0.html">PASS</a> +4 other tests p=
ass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_ccs@ctrl-surf-copy:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19560/shard-rkl-4/igt@gem_ccs@ctrl-surf-copy.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#355=
5</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
9323">i915#9323</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/Patchwork_178822v2/shard-rkl-6/igt@gem_ccs@ctrl-surf-copy.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544=
">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19560/shard-dg2-6/igt@gem_ccs@suspend-resume.html">INCOMPLETE</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i=
915#13356</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/16348">i915#16348</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-dg2-6/igt@gem_ccs@suspend-resume.htm=
l">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17844">i915#17844</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19560/shard-mtlp-3/igt@gem_ctx_isolation@preservation-s3.html">ABOR=
T</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
7146">i915#17146</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/Patchwork_178822v2/shard-mtlp-6/igt@gem_ctx_isolation@preservation-s3.=
html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/13356">i915#13356</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/17244">i915#17244</a>) +1 other test incomple=
te</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@mmap-args:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19560/shard-rkl-6/igt@gem_ctx_sseu@mmap-args.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14=
544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/280">i915#280</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/Patchwork_178822v2/shard-rkl-8/igt@gem_ctx_sseu@mmap-args.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">=
i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-contexts:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19560/shard-rkl-6/igt@gem_exec_balancer@parallel-contexts.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
4544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/4525">i915#4525</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@gem_exec_balancer@par=
allel-contexts.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-cmd:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19560/shard-rkl-2/igt@gem_exec_flush@basic-batch-kernel-default-cmd=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/3711">i915#3711</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/Patchwork_178822v2/shard-rkl-6/igt@gem_exec_flush@basic-batch-=
kernel-default-cmd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/3711">i915#3711</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-cpu:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19560/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-cpu.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i=
915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3281">i915#3281</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@gem_exec_reloc@basic-gtt-cpu=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/3281">i915#3281</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-cpu-active:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19560/shard-rkl-4/igt@gem_exec_reloc@basic-wc-cpu-active.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/32=
81">i915#3281</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/Patchwork_178822v2/shard-rkl-6/igt@gem_exec_reloc@basic-wc-cpu-active.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/3281">i915#3281</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19560/shard-rkl-4/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_1=
78822v2/shard-rkl-6/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190"=
>i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-multi:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19560/shard-rkl-6/igt@gem_lmem_swapping@heavy-multi.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">=
i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/4613">i915#4613</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@gem_lmem_swapping@heavy-mul=
ti.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-self:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19560/shard-rkl-4/igt@gem_pwrite@basic-self.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_1=
78822v2/shard-rkl-6/igt@gem_pwrite@basic-self.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282"=
>i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_readwrite@beyond-eob:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19560/shard-rkl-6/igt@gem_readwrite@beyond-eob.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#=
14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/3282">i915#3282</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/Patchwork_178822v2/shard-rkl-8/igt@gem_readwrite@beyond-eob.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-sync:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19560/shard-rkl-2/igt@gem_userptr_blits@coherency-sync.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1743=
3">i915#17433</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3297">i915#3297</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/Patchwork_178822v2/shard-rkl-6/igt@gem_userptr_blits@cohere=
ncy-sync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/17433">i915#17433</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-overlap:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19560/shard-rkl-6/igt@gem_userptr_blits@unsync-overlap.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3297">i915#3297</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@gem_userptr_blits@unsync=
-overlap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-allocation:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19560/shard-rkl-6/igt@gen7_exec_parse@basic-allocation.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17455">i915#17455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@gen7_exec_parse@basic-=
allocation.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17455">i915#17455</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-out:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19560/shard-rkl-6/igt@gen9_exec_parse@bb-start-out.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i=
915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/2527">i915#2527</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@gen9_exec_parse@bb-start-out=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/2527">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19560/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate=
-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_1=
78822v2/shard-rkl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-h=
flip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/4538">i915#4538</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +1 other test sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19560/shard-rkl-4/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/174=
31">i915#17431</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3638">i915#3638</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/Patchwork_178822v2/shard-rkl-6/igt@kms_big_fb@linear-16bpp=
-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/17431">i915#17431</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19560/shard-rkl-6/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/145=
44">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17431">i915#17431</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/3638">i915#3638</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_big=
_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/17431">i915#17431</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) +1 =
other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19560/shard-rkl-4/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4=
538">i915#4538</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/Patchwork_178822v2/shard-rkl-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/4538">i915#4538</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19560/shard-rkl-2/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/17432">i915#17432</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/Patchwork_178822v2/shard-rkl-6/igt@kms_big_fb@yf-tiled-addfb-size-=
overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/17432">i915#17432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19560/shard-rkl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotat=
e-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@=
kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915=
#4538</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19560/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/12313">i915#12313</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_ccs@bad-rot=
ation-90-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19560/shard-mtlp-8/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-c=
cs@pipe-b-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/17158">i915#17158</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-mtlp-8/igt@kms_ccs@c=
rc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-b-edp-1.html">INCOMPLETE</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582">i91=
5#15582</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2:<=
/p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19560/shard-rkl-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-r=
c-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-6/igt@kms_cc=
s@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"=
>i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/6095">i915#6095</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19560/shard-rkl-2/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/14098">i915#14098</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-6/igt@kms_ccs@crc-s=
prite-planes-basic-y-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095=
">i915#6095</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19560/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/14098">i915#14098</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-8=
/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#140=
98</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/6095">i915#6095</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19560/shard-rkl-2/igt@kms_chamelium_color@ctm-max.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i9=
15#17427</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Pat=
chwork_178822v2/shard-rkl-6/igt@kms_chamelium_color@ctm-max.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">=
i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17427">i915#17427</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19560/shard-rkl-6/igt@kms_chamelium_color_pipeline@plane-fixed-matr=
ix-yuv-rgb-bt601.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl=
-8/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17427">i915#17427</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-multiple:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19560/shard-rkl-6/igt@kms_chamelium_frames@hdmi-crc-multiple.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@km=
s_chamelium_frames@hdmi-crc-multiple.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#782=
8</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-after-runtime-suspend-d3hot:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19560/shard-rkl-2/igt@kms_chamelium_hpd@hdmi-hpd-after-runtime-susp=
end-d3hot.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/11151">i915#11151</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-6/igt@kms_chamelium_hp=
d@hdmi-hpd-after-runtime-suspend-d3hot.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#=
14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19560/shard-rkl-4/igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-6/igt@kms_chameli=
um_hpd@vga-hpd-enable-disable-mode.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19560/shard-rkl-6/igt@kms_content_protection@uevent.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">=
i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/15865">i915#15865</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_content_protection@ue=
vent.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/15865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19560/shard-rkl-6/igt@kms_cursor_legacy@short-busy-flip-before-curs=
or-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@km=
s_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#410=
3</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst-direct-train:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19560/shard-rkl-6/igt@kms_dp_link_training@uhbr-sst-direct-train.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/17285">i915#17285</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_dp_link_=
training@uhbr-sst-direct-train.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/17285">i915#17285</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19560/shard-rkl-2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178=
822v2/shard-rkl-6/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915=
#16361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19560/shard-rkl-6/igt@kms_dsc@dsc-with-output-formats-with-bpc.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/16361">i915#16361</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_dsc@dsc-wi=
th-output-formats-with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19560/shard-rkl-6/igt@kms_flip@2x-dpms-vs-vblank-race.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544=
">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/9934">i915#9934</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_flip@2x-dpms-vs-vblan=
k-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/9934">i915#9934</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19560/shard-rkl-2/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/9934">i915#9934</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/Patchwork_178822v2/shard-rkl-6/igt@kms_flip@2x-flip-vs-dpms-on=
-nop-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19560/shard-glk4/igt@kms_flip@2x-flip-vs-suspend-interruptible.html=
">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/12745">i915#12745</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/17183">i915#17183</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_1=
78822v2/shard-glk8/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">INCO=
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
/CI_DRM_19560/shard-glk4/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-h=
dmi-a1-hdmi-a2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17183">i915#17=
183</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwor=
k_178822v2/shard-glk8/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi=
-a1-hdmi-a2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/12314">i915#12314</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#133=
56</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17183">i915#17183</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:<=
/p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19560/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64=
bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shar=
d-rkl-8/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscal=
ing.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/15643">i915#15643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19560/shard-rkl-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bp=
p-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/15643">i915#15643</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-6/igt@kms_fli=
p_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i91=
5#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/15643">i915#15643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19560/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-=
indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_1=
78822v2/shard-rkl-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-=
draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/17428">i915#17428</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +1 other test sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19560/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbc-suspend.html">I=
NCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/10056">i915#10056</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/16950">i915#16950</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-mtlp-4/igt@kms_frontb=
uffer_tracking@fbc-suspend.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/17276">i915#17276</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-rte:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19560/shard-rkl-4/igt@kms_frontbuffer_tracking@fbchdr-2p-rte.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17428">i915#17428</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/Patchwork_178822v2/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-=
2p-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) +17 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-shrfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19560/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-shrfb-f=
liptrack-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rk=
l-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-shrfb-fliptrack-mmap-gtt.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/17428">i915#17428</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19560/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-suspend.html">IN=
COMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/16056">i915#16056</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_frontbuffer_tracking@hdr=
-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/15989">i915#15989</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19560/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indf=
b-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-6/igt@kms_frontbuff=
er_tracking@psr-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102"=
>i915#15102</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19560/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-=
shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/17428">i915#17428</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rk=
l-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-gtt.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/17428">i915#17428</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19560/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_frontb=
uffer_tracking@psr-rgb565-draw-blt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +8 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19560/shard-rkl-2/igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-m=
odeset-pipe-c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/17455">i915#17455</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-6/igt@kms_pipe_b_c=
_ivb@pipe-b-double-modeset-then-modeset-pipe-c.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1745=
5">i915#17455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-4tiled:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19560/shard-rkl-2/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14712">i915#14712</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/Patchwork_178822v2/shard-rkl-6/igt@kms_pipe_stress@stress-xrgb8888-=
4tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/14712">i915#14712</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19560/shard-rkl-6/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/15709">i915#15709</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_plane@p=
ixel-format-y-tiled-ccs-modifier.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19560/shard-rkl-2/igt@kms_plane@pixel-format-yf-tiled-modifier.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/15709">i915#15709</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/Patchwork_178822v2/shard-rkl-6/igt@kms_plane@pixel-format-yf-tile=
d-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-4-tiled:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19560/shard-rkl-6/igt@kms_plane_scaling@plane-downscale-max-crc-4-t=
iled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/17832">i915#17832</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_p=
lane_scaling@plane-downscale-max-crc-4-tiled.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17832">i915#17832</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19560/shard-rkl-6/igt@kms_pm_backlight@bad-brightness.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343=
">i915#12343</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_pm_ba=
cklight@bad-brightness.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19560/shard-rkl-6/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/159=
48">i915#15948</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/Patchwork_178822v2/shard-rkl-8/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948">i915=
#15948</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-modeset-hybrid:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19560/shard-rkl-6/igt@kms_prime@basic-modeset-hybrid.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"=
>i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/6524">i915#6524</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_prime@basic-modeset-hy=
brid.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/6524">i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19560/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-contin=
uous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/11520">i915#11520</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@km=
s_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#115=
20</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-mmap-cpu:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19560/shard-rkl-4/igt@kms_psr@fbc-psr2-cursor-mmap-cpu.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072=
">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/9732">i915#9732</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_178822v2/shard-rkl-6/igt@kms_psr@fbc-psr2-cursor-mm=
ap-cpu.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +3 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19560/shard-rkl-6/igt@kms_psr@psr-suspend.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
4544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/9732">i915#9732</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_psr@psr-suspend.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/9732">i915#9732</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19560/shard-rkl-6/igt@kms_tiled_display@basic-test-pattern.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/8623">i915#8623</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/Patchwork_178822v2/shard-rkl-8/igt@kms_tiled_display@ba=
sic-test-pattern.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/8623">i915#8623</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@mi-rpc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19560/shard-rkl-4/igt@perf@mi-rpc.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434">i915#2434</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_178822v2/sh=
ard-rkl-6/igt@perf@mi-rpc.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434">i915#2434</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_19560 -&gt; Patchwork_178822v2</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19560: 48995c76e90141a4e72ceafeb3762d4a3580eeef @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGT_9197: 9197<br />
  Patchwork_178822v2: 48995c76e90141a4e72ceafeb3762d4a3580eeef @ git://anon=
git.freedesktop.org/gfx-ci/linux<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============1661666114834232888==--
