Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7CD606A31A
	for <intel-gfx@archiver.kernel.org>; Sat, 31 Oct 2026 07:21:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 091E810E0CE;
	Sat, 31 Oct 2026 07:21:28 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFA9110E02A;
 Sat, 31 Oct 2026 07:21:26 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2468647568430443190=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_drm/i915/vrr=3A_HDMI_2?=
 =?utf-8?q?=2E1_VRR_support?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Alan Stead" <alan.stead@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Sat, 31 Oct 2026 07:21:26 -0000
Message-ID: <179343128669.97373.17215630835075622724@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261030203314.1085262-1-alan.stead@intel.com>
In-Reply-To: <20261030203314.1085262-1-alan.stead@intel.com>
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

--===============2468647568430443190==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/vrr: HDMI 2.1 VRR support
URL   : https://patchwork.freedesktop.org/series/177288/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_19420_full -> Patchwork_177288v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with Patchwork_177288v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in Patchwork_177288v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (11 -> 10)
------------------------------

  Missing    (1): pig-kbl-iris 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in Patchwork_177288v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-edp-1:
    - shard-mtlp:         [PASS][1] -> [ABORT][2] +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-mtlp-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-edp-1.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-mtlp-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-edp-1.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-glk10:        NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk10/igt@kms_tiled_display@basic-test-pattern.html

  
#### Warnings ####

  * igt@kms_dp_link_training@non-uhbr-mst-direct-train:
    - shard-tglu:         [SKIP][4] ([i915#17287]) -> [SKIP][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-tglu-9/igt@kms_dp_link_training@non-uhbr-mst-direct-train.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-tglu-10/igt@kms_dp_link_training@non-uhbr-mst-direct-train.html

  
Known issues
------------

  Here are the changes found in Patchwork_177288v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - shard-rkl:          NOTRUN -> [SKIP][6] ([i915#8411]) +2 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-4/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@api_intel_bb@object-reloc-keep-cache:
    - shard-dg1:          NOTRUN -> [SKIP][7] ([i915#8411])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-15/igt@api_intel_bb@object-reloc-keep-cache.html

  * igt@device_reset@cold-reset-bound:
    - shard-tglu:         NOTRUN -> [SKIP][8] ([i915#11078])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-tglu-5/igt@device_reset@cold-reset-bound.html

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-glk11:        NOTRUN -> [SKIP][9] ([i915#17537])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk11/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@dmabuf@dma-buf-fence-chain:
    - shard-glk10:        NOTRUN -> [SKIP][10] ([i915#17712])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk10/igt@dmabuf@dma-buf-fence-chain.html

  * igt@drm_read@short-buffer-nonblock:
    - shard-dg2:          [PASS][11] -> [SKIP][12] ([i915#17359]) +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-6/igt@drm_read@short-buffer-nonblock.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-7/igt@drm_read@short-buffer-nonblock.html

  * igt@fbdev@info:
    - shard-dg2:          [PASS][13] -> [SKIP][14] ([i915#1849] / [i915#2582])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-4/igt@fbdev@info.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-7/igt@fbdev@info.html

  * igt@gem_basic@multigpu-create-close:
    - shard-dg1:          NOTRUN -> [SKIP][15] ([i915#7697])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-16/igt@gem_basic@multigpu-create-close.html
    - shard-glk10:        NOTRUN -> [SKIP][16] ([i915#17697])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk10/igt@gem_basic@multigpu-create-close.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-tglu:         NOTRUN -> [SKIP][17] ([i915#9323])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-tglu-5/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-rkl:          NOTRUN -> [SKIP][18] ([i915#3555] / [i915#9323]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-3/igt@gem_ccs@ctrl-surf-copy.html
    - shard-dg1:          NOTRUN -> [SKIP][19] ([i915#3555] / [i915#9323])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-15/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_ccs@suspend-resume:
    - shard-dg2:          [PASS][20] -> [INCOMPLETE][21] ([i915#13356] / [i915#16348]) +1 other test incomplete
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-8/igt@gem_ccs@suspend-resume.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-1/igt@gem_ccs@suspend-resume.html

  * igt@gem_create@create-ext-set-pat:
    - shard-glk:          NOTRUN -> [SKIP][22] ([i915#17530])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk9/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_isolation@preservation-s3@bcs0:
    - shard-glk:          NOTRUN -> [INCOMPLETE][23] ([i915#13356] / [i915#16466])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk5/igt@gem_ctx_isolation@preservation-s3@bcs0.html

  * igt@gem_ctx_persistence@engines-hang@bcs0:
    - shard-glk:          NOTRUN -> [SKIP][24] ([i915#17527])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk8/igt@gem_ctx_persistence@engines-hang@bcs0.html

  * igt@gem_ctx_persistence@heartbeat-close:
    - shard-dg1:          NOTRUN -> [SKIP][25] ([i915#8555])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-16/igt@gem_ctx_persistence@heartbeat-close.html

  * igt@gem_ctx_sseu@engines:
    - shard-glk11:        NOTRUN -> [SKIP][26] ([i915#17496])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk11/igt@gem_ctx_sseu@engines.html
    - shard-tglu-1:       NOTRUN -> [SKIP][27] ([i915#280])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-tglu-1/igt@gem_ctx_sseu@engines.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-rkl:          NOTRUN -> [SKIP][28] ([i915#280])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-8/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_eio@in-flight-suspend:
    - shard-mtlp:         NOTRUN -> [INCOMPLETE][29] ([i915#17190])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-mtlp-5/igt@gem_eio@in-flight-suspend.html

  * igt@gem_eio@suspend:
    - shard-dg1:          [PASS][30] -> [DMESG-WARN][31] ([i915#4391] / [i915#4423])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg1-19/igt@gem_eio@suspend.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-15/igt@gem_eio@suspend.html

  * igt@gem_exec_balancer@bonded-pair:
    - shard-dg1:          NOTRUN -> [SKIP][32] ([i915#4771])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-19/igt@gem_exec_balancer@bonded-pair.html

  * igt@gem_exec_balancer@parallel-balancer:
    - shard-rkl:          NOTRUN -> [SKIP][33] ([i915#4525]) +2 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-3/igt@gem_exec_balancer@parallel-balancer.html

  * igt@gem_exec_balancer@parallel-bb-first:
    - shard-tglu-1:       NOTRUN -> [SKIP][34] ([i915#4525]) +2 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-tglu-1/igt@gem_exec_balancer@parallel-bb-first.html

  * igt@gem_exec_balancer@parallel-contexts:
    - shard-glk:          NOTRUN -> [SKIP][35] ([i915#17547])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk9/igt@gem_exec_balancer@parallel-contexts.html

  * igt@gem_exec_big@single:
    - shard-rkl:          [PASS][36] -> [FAIL][37] ([i915#16604])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-rkl-8/igt@gem_exec_big@single.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-6/igt@gem_exec_big@single.html

  * igt@gem_exec_capture@capture-invisible@smem0:
    - shard-rkl:          NOTRUN -> [SKIP][38] ([i915#6334]) +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-3/igt@gem_exec_capture@capture-invisible@smem0.html

  * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
    - shard-tglu-1:       NOTRUN -> [SKIP][39] ([i915#3711])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-tglu-1/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html

  * igt@gem_exec_flush@basic-wb-prw-default:
    - shard-dg1:          NOTRUN -> [SKIP][40] ([i915#3539] / [i915#4852]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-19/igt@gem_exec_flush@basic-wb-prw-default.html

  * igt@gem_exec_params@larger-than-life-batch:
    - shard-glk:          NOTRUN -> [SKIP][41] ([i915#16871])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk8/igt@gem_exec_params@larger-than-life-batch.html

  * igt@gem_exec_params@secure-non-root:
    - shard-rkl:          NOTRUN -> [SKIP][42] ([i915#17416])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-3/igt@gem_exec_params@secure-non-root.html
    - shard-dg1:          NOTRUN -> [SKIP][43] ([i915#17416])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-15/igt@gem_exec_params@secure-non-root.html

  * igt@gem_exec_reloc@basic-cpu-gtt-noreloc:
    - shard-dg1:          NOTRUN -> [SKIP][44] ([i915#3281]) +9 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-18/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html

  * igt@gem_exec_reloc@basic-write-read-noreloc:
    - shard-rkl:          NOTRUN -> [SKIP][45] ([i915#3281]) +8 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-7/igt@gem_exec_reloc@basic-write-read-noreloc.html

  * igt@gem_exec_schedule@semaphore-power:
    - shard-dg1:          NOTRUN -> [SKIP][46] ([i915#4812])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-19/igt@gem_exec_schedule@semaphore-power.html

  * igt@gem_exec_suspend@basic-s0:
    - shard-dg2:          [PASS][47] -> [INCOMPLETE][48] ([i915#13356]) +1 other test incomplete
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-6/igt@gem_exec_suspend@basic-s0.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-6/igt@gem_exec_suspend@basic-s0.html

  * igt@gem_exec_suspend@basic-s4-devices:
    - shard-rkl:          [PASS][49] -> [ABORT][50] ([i915#15542] / [i915#7975]) +1 other test abort
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-rkl-8/igt@gem_exec_suspend@basic-s4-devices.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-1/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@gem_fenced_exec_thrash@no-spare-fences:
    - shard-dg1:          NOTRUN -> [SKIP][51] ([i915#4860]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-16/igt@gem_fenced_exec_thrash@no-spare-fences.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglu:         NOTRUN -> [SKIP][52] ([i915#2190])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-tglu-5/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@heavy-verify-multi:
    - shard-glk:          NOTRUN -> [SKIP][53] ([i915#17503] / [i915#4613])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk9/igt@gem_lmem_swapping@heavy-verify-multi.html

  * igt@gem_lmem_swapping@heavy-verify-random-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][54] ([i915#12193])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-16/igt@gem_lmem_swapping@heavy-verify-random-ccs.html
    - shard-glk10:        NOTRUN -> [SKIP][55] ([i915#17503])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk10/igt@gem_lmem_swapping@heavy-verify-random-ccs.html

  * igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][56] ([i915#4565])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-16/igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0.html

  * igt@gem_lmem_swapping@parallel-random:
    - shard-rkl:          NOTRUN -> [SKIP][57] ([i915#4613]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-4/igt@gem_lmem_swapping@parallel-random.html

  * igt@gem_lmem_swapping@random-engines:
    - shard-tglu-1:       NOTRUN -> [SKIP][58] ([i915#4613])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-tglu-1/igt@gem_lmem_swapping@random-engines.html

  * igt@gem_lmem_swapping@verify-random:
    - shard-tglu:         NOTRUN -> [SKIP][59] ([i915#4613])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-tglu-5/igt@gem_lmem_swapping@verify-random.html

  * igt@gem_media_vme:
    - shard-rkl:          NOTRUN -> [SKIP][60] ([i915#284])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-7/igt@gem_media_vme.html

  * igt@gem_mmap_gtt@coherency:
    - shard-tglu-1:       NOTRUN -> [SKIP][61] ([i915#17429])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-tglu-1/igt@gem_mmap_gtt@coherency.html

  * igt@gem_mmap_gtt@cpuset-medium-copy-xy:
    - shard-dg1:          NOTRUN -> [SKIP][62] ([i915#4077]) +8 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-15/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html

  * igt@gem_mmap_wc@write-wc-read-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][63] ([i915#4083]) +8 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-15/igt@gem_mmap_wc@write-wc-read-gtt.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
    - shard-rkl:          NOTRUN -> [SKIP][64] ([i915#3282]) +4 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-4/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html

  * igt@gem_pxp@fail-invalid-protected-context:
    - shard-glk:          NOTRUN -> [SKIP][65] ([i915#17521]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk9/igt@gem_pxp@fail-invalid-protected-context.html

  * igt@gem_pxp@protected-encrypted-src-copy-not-readible:
    - shard-rkl:          NOTRUN -> [SKIP][66] ([i915#4270])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-4/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html

  * igt@gem_pxp@reject-modify-context-protection-off-1:
    - shard-dg1:          NOTRUN -> [SKIP][67] ([i915#4270])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-16/igt@gem_pxp@reject-modify-context-protection-off-1.html
    - shard-glk10:        NOTRUN -> [SKIP][68] ([i915#17521])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk10/igt@gem_pxp@reject-modify-context-protection-off-1.html

  * igt@gem_readwrite@beyond-eob:
    - shard-dg1:          NOTRUN -> [SKIP][69] ([i915#3282]) +5 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-16/igt@gem_readwrite@beyond-eob.html

  * igt@gem_render_copy@yf-tiled-to-vebox-linear:
    - shard-glk:          NOTRUN -> [SKIP][70] ([i915#17492]) +1 other test skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk8/igt@gem_render_copy@yf-tiled-to-vebox-linear.html

  * igt@gem_set_tiling_vs_gtt:
    - shard-dg1:          NOTRUN -> [SKIP][71] ([i915#4079]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-18/igt@gem_set_tiling_vs_gtt.html

  * igt@gem_softpin@evict-snoop:
    - shard-glk:          NOTRUN -> [SKIP][72] ([i915#17551])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk9/igt@gem_softpin@evict-snoop.html

  * igt@gem_userptr_blits@coherency-unsync:
    - shard-tglu-1:       NOTRUN -> [SKIP][73] ([i915#3297]) +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-tglu-1/igt@gem_userptr_blits@coherency-unsync.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-mtlp:         NOTRUN -> [SKIP][74] ([i915#3297])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-mtlp-5/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@map-fixed-invalidate:
    - shard-dg1:          NOTRUN -> [SKIP][75] ([i915#3297] / [i915#4880])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-19/igt@gem_userptr_blits@map-fixed-invalidate.html

  * igt@gem_userptr_blits@relocations:
    - shard-dg1:          NOTRUN -> [SKIP][76] ([i915#3281] / [i915#3297])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-16/igt@gem_userptr_blits@relocations.html
    - shard-glk10:        NOTRUN -> [SKIP][77] ([i915#17507])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk10/igt@gem_userptr_blits@relocations.html

  * igt@gem_userptr_blits@sd-probe:
    - shard-dg1:          NOTRUN -> [SKIP][78] ([i915#3297] / [i915#4958])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-19/igt@gem_userptr_blits@sd-probe.html

  * igt@gem_userptr_blits@unsync-unmap:
    - shard-dg1:          NOTRUN -> [SKIP][79] ([i915#3297])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-18/igt@gem_userptr_blits@unsync-unmap.html

  * igt@gem_userptr_blits@unsync-unmap-after-close:
    - shard-rkl:          NOTRUN -> [SKIP][80] ([i915#3297]) +1 other test skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-4/igt@gem_userptr_blits@unsync-unmap-after-close.html

  * igt@gem_workarounds@suspend-resume:
    - shard-rkl:          [PASS][81] -> [INCOMPLETE][82] ([i915#13356])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-rkl-5/igt@gem_workarounds@suspend-resume.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-6/igt@gem_workarounds@suspend-resume.html

  * igt@gen3_render_mixed_blits:
    - shard-rkl:          NOTRUN -> [SKIP][83] ([i915#17455]) +1 other test skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-7/igt@gen3_render_mixed_blits.html

  * igt@gen7_exec_parse@bitmasks:
    - shard-dg1:          NOTRUN -> [SKIP][84] ([i915#17455]) +3 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-19/igt@gen7_exec_parse@bitmasks.html

  * igt@gen7_exec_parse@cmd-crossing-page:
    - shard-tglu-1:       NOTRUN -> [SKIP][85] ([i915#17455])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-tglu-1/igt@gen7_exec_parse@cmd-crossing-page.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-tglu:         NOTRUN -> [SKIP][86] ([i915#2527] / [i915#2856])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-tglu-5/igt@gen9_exec_parse@allowed-all.html

  * igt@gen9_exec_parse@bb-oversize:
    - shard-rkl:          NOTRUN -> [SKIP][87] ([i915#2527]) +3 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-4/igt@gen9_exec_parse@bb-oversize.html
    - shard-tglu-1:       NOTRUN -> [SKIP][88] ([i915#2527] / [i915#2856])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-tglu-1/igt@gen9_exec_parse@bb-oversize.html

  * igt@gen9_exec_parse@cmd-crossing-page:
    - shard-dg1:          NOTRUN -> [SKIP][89] ([i915#2527]) +1 other test skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-15/igt@gen9_exec_parse@cmd-crossing-page.html

  * igt@i915_drm_fdinfo@busy-check-all:
    - shard-dg1:          NOTRUN -> [SKIP][90] ([i915#11527]) +5 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-19/igt@i915_drm_fdinfo@busy-check-all.html

  * igt@i915_drm_fdinfo@busy@rcs0:
    - shard-dg1:          NOTRUN -> [SKIP][91] ([i915#14073]) +11 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-18/igt@i915_drm_fdinfo@busy@rcs0.html

  * igt@i915_fb_tiling@basic-x-tiling:
    - shard-dg1:          NOTRUN -> [SKIP][92] ([i915#13786])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-15/igt@i915_fb_tiling@basic-x-tiling.html

  * igt@i915_module_load@fault-injection@__uc_init:
    - shard-rkl:          NOTRUN -> [SKIP][93] ([i915#15479]) +4 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-4/igt@i915_module_load@fault-injection@__uc_init.html
    - shard-tglu-1:       NOTRUN -> [SKIP][94] ([i915#15479]) +4 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-tglu-1/igt@i915_module_load@fault-injection@__uc_init.html

  * igt@i915_module_load@fault-injection@intel_connector_register:
    - shard-rkl:          NOTRUN -> [ABORT][95] ([i915#15342]) +1 other test abort
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-4/igt@i915_module_load@fault-injection@intel_connector_register.html
    - shard-tglu-1:       NOTRUN -> [ABORT][96] ([i915#15342]) +1 other test abort
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-tglu-1/igt@i915_module_load@fault-injection@intel_connector_register.html

  * igt@i915_module_load@reload-no-display:
    - shard-tglu:         [PASS][97] -> [ABORT][98] ([i915#16996])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-tglu-5/igt@i915_module_load@reload-no-display.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-tglu-3/igt@i915_module_load@reload-no-display.html

  * igt@i915_pm_freq_api@freq-reset:
    - shard-tglu-1:       NOTRUN -> [SKIP][99] ([i915#8399])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-tglu-1/igt@i915_pm_freq_api@freq-reset.html
    - shard-glk11:        NOTRUN -> [SKIP][100] ([i915#17526])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk11/igt@i915_pm_freq_api@freq-reset.html

  * igt@i915_pm_freq_api@freq-reset-multiple:
    - shard-rkl:          NOTRUN -> [SKIP][101] ([i915#8399])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-2/igt@i915_pm_freq_api@freq-reset-multiple.html

  * igt@i915_pm_freq_api@freq-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][102] ([i915#8399])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-tglu-5/igt@i915_pm_freq_api@freq-suspend.html

  * igt@i915_pm_freq_mult@media-freq@gt1:
    - shard-mtlp:         NOTRUN -> [SKIP][103] ([i915#6590]) +2 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-mtlp-5/igt@i915_pm_freq_mult@media-freq@gt1.html

  * igt@i915_pm_rc6_residency@media-rc6-accuracy:
    - shard-dg1:          NOTRUN -> [SKIP][104] ([i915#16080] / [i915#16166])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-18/igt@i915_pm_rc6_residency@media-rc6-accuracy.html

  * igt@i915_pm_rc6_residency@rc6-accuracy:
    - shard-dg2:          [PASS][105] -> [FAIL][106] ([i915#12964]) +1 other test fail
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-7/igt@i915_pm_rc6_residency@rc6-accuracy.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-5/igt@i915_pm_rc6_residency@rc6-accuracy.html

  * igt@i915_pm_rps@min-max-config-idle:
    - shard-dg1:          NOTRUN -> [SKIP][107] ([i915#11681] / [i915#6621])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-15/igt@i915_pm_rps@min-max-config-idle.html

  * igt@i915_pm_rps@thresholds-idle-park:
    - shard-dg1:          NOTRUN -> [SKIP][108] ([i915#11681])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-18/igt@i915_pm_rps@thresholds-idle-park.html

  * igt@i915_pm_sseu@full-enable:
    - shard-dg1:          NOTRUN -> [SKIP][109] ([i915#4387])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-16/igt@i915_pm_sseu@full-enable.html

  * igt@i915_power@sanity:
    - shard-mtlp:         [PASS][110] -> [SKIP][111] ([i915#7984])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-mtlp-3/igt@i915_power@sanity.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-mtlp-2/igt@i915_power@sanity.html

  * igt@i915_query@hwconfig_table:
    - shard-rkl:          NOTRUN -> [SKIP][112] ([i915#6245])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-2/igt@i915_query@hwconfig_table.html

  * igt@i915_query@query-topology-known-pci-ids:
    - shard-dg1:          NOTRUN -> [SKIP][113] ([i915#16109])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-15/igt@i915_query@query-topology-known-pci-ids.html
    - shard-rkl:          NOTRUN -> [SKIP][114] ([i915#16109])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-3/igt@i915_query@query-topology-known-pci-ids.html

  * igt@i915_query@query-topology-unsupported:
    - shard-tglu-1:       NOTRUN -> [SKIP][115] ([i915#16079])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-tglu-1/igt@i915_query@query-topology-unsupported.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-tglu-1:       NOTRUN -> [INCOMPLETE][116] ([i915#4817] / [i915#7443])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-tglu-1/igt@i915_suspend@basic-s3-without-i915.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-rkl:          [PASS][117] -> [INCOMPLETE][118] ([i915#4817]) +1 other test incomplete
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-rkl-2/igt@i915_suspend@fence-restore-untiled.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-3/igt@i915_suspend@fence-restore-untiled.html

  * igt@intel_hwmon@hwmon-read:
    - shard-rkl:          NOTRUN -> [SKIP][119] ([i915#7707]) +1 other test skip
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-7/igt@intel_hwmon@hwmon-read.html

  * igt@kms_addfb_basic@basic-x-tiled-legacy:
    - shard-dg1:          NOTRUN -> [SKIP][120] ([i915#4212]) +1 other test skip
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-19/igt@kms_addfb_basic@basic-x-tiled-legacy.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-tglu:         NOTRUN -> [SKIP][121] ([i915#12454] / [i915#12712])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-tglu-5/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic:
    - shard-glk10:        NOTRUN -> [SKIP][122] ([i915#17562])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk10/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-glk:          NOTRUN -> [SKIP][123] ([i915#17485])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk8/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-rkl:          NOTRUN -> [SKIP][124] ([i915#1769] / [i915#3555])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - shard-dg1:          NOTRUN -> [SKIP][125] ([i915#1769] / [i915#3555])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-15/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-glk11:        NOTRUN -> [SKIP][126] ([i915#1769])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk11/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-tglu-1:       NOTRUN -> [SKIP][127] ([i915#5286])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-tglu-1/igt@kms_big_fb@4-tiled-addfb.html
    - shard-glk11:        NOTRUN -> [SKIP][128] ([i915#17556])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk11/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-dg1:          NOTRUN -> [SKIP][129] ([i915#5286])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-19/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-tglu:         NOTRUN -> [SKIP][130] ([i915#17432] / [i915#5286]) +1 other test skip
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-tglu-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-rkl:          NOTRUN -> [SKIP][131] ([i915#4538] / [i915#5286]) +5 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][132] ([i915#4538] / [i915#5286]) +3 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-16/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
    - shard-glk10:        NOTRUN -> [SKIP][133] ([i915#17478])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk10/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-mtlp:         [PASS][134] -> [FAIL][135] ([i915#15733] / [i915#5138]) +1 other test fail
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-mtlp-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-tglu-1:       NOTRUN -> [SKIP][136] ([i915#17431]) +1 other test skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-tglu-1/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][137] ([i915#3638]) +5 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-18/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg1:          NOTRUN -> [SKIP][138] ([i915#3828])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-18/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-glk11:        NOTRUN -> [SKIP][139] ([i915#17524])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk11/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-glk:          NOTRUN -> [SKIP][140] ([i915#17524])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk8/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-glk10:        NOTRUN -> [SKIP][141] ([i915#17500]) +3 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk10/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-tglu:         NOTRUN -> [SKIP][142] ([i915#17431]) +3 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-tglu-5/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-glk11:        NOTRUN -> [SKIP][143] ([i915#17500]) +1 other test skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk11/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][144] ([i915#17431] / [i915#3638]) +1 other test skip
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-3/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][145] ([i915#4538]) +3 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-16/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-270:
    - shard-glk:          NOTRUN -> [SKIP][146] ([i915#17478]) +4 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk9/igt@kms_big_fb@yf-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][147] ([i915#4538]) +3 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-4/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html
    - shard-tglu-1:       NOTRUN -> [SKIP][148] ([i915#17432]) +1 other test skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-tglu-1/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg1:          NOTRUN -> [SKIP][149] ([i915#17432])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-15/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-rkl:          NOTRUN -> [SKIP][150] ([i915#17432]) +1 other test skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-8/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-tglu:         NOTRUN -> [SKIP][151] ([i915#17432]) +1 other test skip
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-tglu-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-mtlp:         NOTRUN -> [SKIP][152] ([i915#17432]) +1 other test skip
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-mtlp-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-glk11:        NOTRUN -> [SKIP][153] ([i915#17478]) +1 other test skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk11/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][154] ([i915#6095]) +24 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-tglu-1/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-2:
    - shard-glk11:        NOTRUN -> [SKIP][155] ([i915#17490] / [i915#17491]) +3 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk11/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-1:
    - shard-glk:          NOTRUN -> [SKIP][156] ([i915#17491]) +31 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk9/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1:
    - shard-glk10:        NOTRUN -> [SKIP][157] ([i915#17491]) +19 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk10/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][158] ([i915#6095]) +57 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-7/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-ccs@pipe-c-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][159] ([i915#14098] / [i915#14544] / [i915#6095]) +4 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-6/igt@kms_ccs@bad-rotation-90-y-tiled-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][160] ([i915#12313])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-tglu-5/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1:
    - shard-glk11:        NOTRUN -> [SKIP][161] ([i915#17491]) +13 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk11/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][162] ([i915#10307] / [i915#10434] / [i915#6095])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][163] ([i915#10307] / [i915#6095]) +34 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][164] ([i915#12805])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
    - shard-tglu-1:       NOTRUN -> [SKIP][165] ([i915#12805])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-tglu-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][166] ([i915#6095]) +29 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-tglu-5/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-glk:          NOTRUN -> [SKIP][167] ([i915#17525])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk9/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:
    - shard-glk10:        NOTRUN -> [SKIP][168] ([i915#17490] / [i915#17491]) +7 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk10/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1:
    - shard-dg1:          NOTRUN -> [SKIP][169] ([i915#6095]) +121 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-15/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-2:
    - shard-glk:          NOTRUN -> [SKIP][170] ([i915#17490] / [i915#17491]) +11 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk8/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][171] ([i915#6095]) +7 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-1/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-d-edp-1:
    - shard-mtlp:         [PASS][172] -> [INCOMPLETE][173] ([i915#15582]) +2 other tests incomplete
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-mtlp-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-d-edp-1.html
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-mtlp-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-d-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1:
    - shard-glk11:        NOTRUN -> [INCOMPLETE][174] ([i915#13356] / [i915#15582]) +1 other test incomplete
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk11/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][175] ([i915#12313]) +1 other test skip
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-tglu-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][176] ([i915#12313])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-4/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][177] ([i915#14098] / [i915#6095]) +40 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-4/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][178] ([i915#14544] / [i915#6095]) +9 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2.html

  * igt@kms_cdclk@mode-transition:
    - shard-rkl:          NOTRUN -> [SKIP][179] ([i915#3742])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-3/igt@kms_cdclk@mode-transition.html
    - shard-dg1:          NOTRUN -> [SKIP][180] ([i915#3742]) +1 other test skip
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-15/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-glk10:        NOTRUN -> [SKIP][181] ([i915#17550])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk10/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_audio@dp-audio-after-suspend:
    - shard-dg1:          NOTRUN -> [SKIP][182] ([i915#11151])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-18/igt@kms_chamelium_audio@dp-audio-after-suspend.html

  * igt@kms_chamelium_audio@hdmi-audio:
    - shard-glk:          NOTRUN -> [SKIP][183] ([i915#17483]) +4 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk8/igt@kms_chamelium_audio@hdmi-audio.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-tglu:         NOTRUN -> [SKIP][184] ([i915#11151] / [i915#7828]) +4 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-tglu-5/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-rkl:          NOTRUN -> [SKIP][185] ([i915#17427]) +3 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-7/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-glk10:        NOTRUN -> [SKIP][186] ([i915#17489])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk10/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-dg1:          NOTRUN -> [SKIP][187] ([i915#17427]) +1 other test skip
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-15/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_color@degamma:
    - shard-glk:          NOTRUN -> [SKIP][188] ([i915#17489])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk8/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_color_pipeline@plane-ctm3x4:
    - shard-glk11:        NOTRUN -> [SKIP][189] ([i915#17497]) +1 other test skip
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk11/igt@kms_chamelium_color_pipeline@plane-ctm3x4.html

  * igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d:
    - shard-tglu:         NOTRUN -> [SKIP][190] ([i915#16471] / [i915#17427])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-tglu-5/igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim:
    - shard-tglu:         NOTRUN -> [SKIP][191] ([i915#17427])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-tglu-5/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d:
    - shard-tglu-1:       NOTRUN -> [SKIP][192] ([i915#17427]) +1 other test skip
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-tglu-1/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d:
    - shard-glk:          NOTRUN -> [SKIP][193] ([i915#17497])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk9/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d:
    - shard-dg1:          NOTRUN -> [SKIP][194] ([i915#16471] / [i915#17427]) +2 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-18/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4:
    - shard-rkl:          NOTRUN -> [SKIP][195] ([i915#16471] / [i915#17427]) +1 other test skip
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-4/igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4.html

  * igt@kms_chamelium_color_pipeline@plane-lut3d-green-only:
    - shard-tglu-1:       NOTRUN -> [SKIP][196] ([i915#16471] / [i915#17427]) +1 other test skip
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-tglu-1/igt@kms_chamelium_color_pipeline@plane-lut3d-green-only.html

  * igt@kms_chamelium_frames@hdmi-frame-dump:
    - shard-glk10:        NOTRUN -> [SKIP][197] ([i915#17483]) +1 other test skip
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk10/igt@kms_chamelium_frames@hdmi-frame-dump.html

  * igt@kms_chamelium_hpd@dp-hpd-after-runtime-suspend-d3hot:
    - shard-glk11:        NOTRUN -> [SKIP][198] ([i915#17483]) +2 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk11/igt@kms_chamelium_hpd@dp-hpd-after-runtime-suspend-d3hot.html
    - shard-tglu-1:       NOTRUN -> [SKIP][199] ([i915#11151])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-tglu-1/igt@kms_chamelium_hpd@dp-hpd-after-runtime-suspend-d3hot.html

  * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
    - shard-rkl:          NOTRUN -> [SKIP][200] ([i915#11151] / [i915#7828]) +9 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-3/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html

  * igt@kms_chamelium_hpd@dp-hpd-storm-disable:
    - shard-tglu-1:       NOTRUN -> [SKIP][201] ([i915#11151] / [i915#7828]) +4 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-tglu-1/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - shard-dg1:          NOTRUN -> [SKIP][202] ([i915#11151] / [i915#7828]) +6 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-19/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_color@background-color:
    - shard-glk10:        NOTRUN -> [FAIL][203] ([i915#17133]) +3 other tests fail
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk10/igt@kms_color@background-color.html
    - shard-dg2:          [PASS][204] -> [SKIP][205] ([i915#17373])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-6/igt@kms_color@background-color.html
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-7/igt@kms_color@background-color.html

  * igt@kms_color@degamma:
    - shard-dg2:          [PASS][206] -> [SKIP][207] ([i915#12655] / [i915#17373]) +1 other test skip
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-4/igt@kms_color@degamma.html
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-7/igt@kms_color@degamma.html

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601:
    - shard-glk11:        NOTRUN -> [SKIP][208] ([i915#17510])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk11/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601.html

  * igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-a-plane-4:
    - shard-rkl:          NOTRUN -> [SKIP][209] ([i915#16990]) +5 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-3/igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-a-plane-4.html

  * igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-b-plane-4:
    - shard-dg1:          NOTRUN -> [SKIP][210] ([i915#16990]) +63 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-19/igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-b-plane-4.html

  * igt@kms_color_pipeline@plane-lut1d-post-ctm3x4:
    - shard-dg2:          [PASS][211] -> [SKIP][212] ([i915#15529]) +1 other test skip
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-6/igt@kms_color_pipeline@plane-lut1d-post-ctm3x4.html
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-7/igt@kms_color_pipeline@plane-lut1d-post-ctm3x4.html
    - shard-glk10:        NOTRUN -> [SKIP][213] ([i915#17510])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk10/igt@kms_color_pipeline@plane-lut1d-post-ctm3x4.html

  * igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-b-plane-4:
    - shard-dg2:          NOTRUN -> [SKIP][214] ([i915#16990]) +15 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-5/igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-b-plane-4.html

  * igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-d-plane-4:
    - shard-tglu-1:       NOTRUN -> [SKIP][215] ([i915#16990]) +15 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-tglu-1/igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-d-plane-4.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][216] ([i915#15865])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-7/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@content-type-change:
    - shard-glk:          NOTRUN -> [SKIP][217] ([i915#17508]) +1 other test skip
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk9/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-rkl:          NOTRUN -> [SKIP][218] ([i915#15330] / [i915#3116])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-3/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@dp-mst-type-0-hdcp14:
    - shard-rkl:          NOTRUN -> [SKIP][219] ([i915#15330]) +1 other test skip
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-3/igt@kms_content_protection@dp-mst-type-0-hdcp14.html
    - shard-dg1:          NOTRUN -> [SKIP][220] ([i915#15330])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-15/igt@kms_content_protection@dp-mst-type-0-hdcp14.html

  * igt@kms_content_protection@dp-mst-type-0-suspend-resume:
    - shard-tglu:         NOTRUN -> [SKIP][221] ([i915#15330])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-tglu-5/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg1:          NOTRUN -> [SKIP][222] ([i915#15865])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-18/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@srm:
    - shard-tglu:         NOTRUN -> [SKIP][223] ([i915#15865])
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-tglu-5/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-tglu-1:       NOTRUN -> [SKIP][224] ([i915#15865])
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-tglu-1/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-rkl:          NOTRUN -> [SKIP][225] ([i915#13049]) +1 other test skip
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-3/igt@kms_cursor_crc@cursor-offscreen-512x512.html
    - shard-dg1:          NOTRUN -> [SKIP][226] ([i915#13049]) +1 other test skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-15/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-128x42:
    - shard-tglu-1:       NOTRUN -> [FAIL][227] ([i915#13566]) +1 other test fail
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-tglu-1/igt@kms_cursor_crc@cursor-onscreen-128x42.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-tglu-1:       NOTRUN -> [SKIP][228] ([i915#3555]) +5 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-tglu-1/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [FAIL][229] ([i915#13566]) +3 other tests fail
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-8/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-random-32x10:
    - shard-tglu:         NOTRUN -> [SKIP][230] ([i915#3555])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-tglu-5/igt@kms_cursor_crc@cursor-random-32x10.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-tglu:         NOTRUN -> [SKIP][231] ([i915#13049])
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-tglu-5/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-dg1:          NOTRUN -> [SKIP][232] ([i915#3555]) +2 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-16/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html
    - shard-glk10:        NOTRUN -> [SKIP][233] ([i915#17504]) +2 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk10/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-glk11:        NOTRUN -> [SKIP][234] ([i915#17533])
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk11/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-glk:          NOTRUN -> [SKIP][235] ([i915#17504])
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk8/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-rkl:          NOTRUN -> [SKIP][236] ([i915#4103]) +2 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - shard-tglu-1:       NOTRUN -> [SKIP][237] ([i915#4103])
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-tglu-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-tglu:         NOTRUN -> [SKIP][238] ([i915#17428] / [i915#17454]) +1 other test skip
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-tglu-5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-tglu-1:       NOTRUN -> [SKIP][239] ([i915#17428] / [i915#17454]) +2 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-tglu-1/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-glk10:        NOTRUN -> [SKIP][240] ([i915#17457])
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk10/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg1:          NOTRUN -> [SKIP][241] ([i915#4103]) +1 other test skip
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-15/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-tglu:         NOTRUN -> [SKIP][242] ([i915#9723])
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-tglu-5/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-rkl:          NOTRUN -> [SKIP][243] ([i915#13691])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-7/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][244] ([i915#14544] / [i915#3804])
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-dg1:          NOTRUN -> [SKIP][245] ([i915#17289])
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-16/igt@kms_dp_link_training@non-uhbr-mst.html
    - shard-glk10:        NOTRUN -> [SKIP][246] ([i915#17560])
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk10/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train:
    - shard-rkl:          NOTRUN -> [SKIP][247] ([i915#17290])
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-2/igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train.html

  * igt@kms_dp_link_training@uhbr-mst-tbtalt-train:
    - shard-tglu-1:       NOTRUN -> [SKIP][248] ([i915#17285])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-tglu-1/igt@kms_dp_link_training@uhbr-mst-tbtalt-train.html

  * igt@kms_dp_link_training@uhbr-sst-direct-train:
    - shard-tglu:         NOTRUN -> [SKIP][249] ([i915#17285])
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-tglu-5/igt@kms_dp_link_training@uhbr-sst-direct-train.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-glk:          NOTRUN -> [SKIP][250] ([i915#17680])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk3/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback:
    - shard-dg1:          NOTRUN -> [SKIP][251] ([i915#16867])
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-19/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html

  * igt@kms_draw_crc@draw-method-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][252] ([i915#8812])
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-16/igt@kms_draw_crc@draw-method-mmap-gtt.html

  * igt@kms_dsc@dsc-basic-ultrajoiner:
    - shard-tglu-1:       NOTRUN -> [SKIP][253] ([i915#16361]) +2 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-tglu-1/igt@kms_dsc@dsc-basic-ultrajoiner.html
    - shard-glk11:        NOTRUN -> [SKIP][254] ([i915#17458])
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk11/igt@kms_dsc@dsc-basic-ultrajoiner.html

  * igt@kms_dsc@dsc-fractional-bpp-bigjoiner:
    - shard-dg1:          NOTRUN -> [SKIP][255] ([i915#16361]) +2 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-15/igt@kms_dsc@dsc-fractional-bpp-bigjoiner.html

  * igt@kms_dsc@dsc-with-bpc-formats-ultrajoiner:
    - shard-tglu:         NOTRUN -> [SKIP][256] ([i915#16361])
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-tglu-5/igt@kms_dsc@dsc-with-bpc-formats-ultrajoiner.html

  * igt@kms_dsc@dsc-with-output-formats-bigjoiner:
    - shard-glk:          NOTRUN -> [SKIP][257] ([i915#17458]) +2 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk3/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner:
    - shard-rkl:          NOTRUN -> [SKIP][258] ([i915#16361]) +5 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-8/igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg1:          NOTRUN -> [SKIP][259] ([i915#16599])
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-18/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@dsc:
    - shard-rkl:          NOTRUN -> [SKIP][260] ([i915#16600])
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-7/igt@kms_feature_discovery@dsc.html

  * igt@kms_feature_discovery@psr2:
    - shard-tglu-1:       NOTRUN -> [SKIP][261] ([i915#658])
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-tglu-1/igt@kms_feature_discovery@psr2.html

  * igt@kms_feature_discovery@vrr:
    - shard-tglu:         NOTRUN -> [SKIP][262] ([i915#16600])
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-tglu-5/igt@kms_feature_discovery@vrr.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-dg1:          NOTRUN -> [SKIP][263] ([i915#9934]) +5 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-18/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-tglu:         NOTRUN -> [SKIP][264] ([i915#3637] / [i915#9934]) +2 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-tglu-5/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-tglu-1:       NOTRUN -> [SKIP][265] ([i915#3637] / [i915#9934]) +3 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-tglu-1/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-fences:
    - shard-rkl:          NOTRUN -> [SKIP][266] ([i915#9934]) +6 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-7/igt@kms_flip@2x-flip-vs-fences.html

  * igt@kms_flip@2x-flip-vs-fences-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][267] ([i915#8381])
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-15/igt@kms_flip@2x-flip-vs-fences-interruptible.html

  * igt@kms_flip@2x-flip-vs-modeset:
    - shard-mtlp:         NOTRUN -> [SKIP][268] ([i915#3637] / [i915#9934])
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-mtlp-5/igt@kms_flip@2x-flip-vs-modeset.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-glk11:        NOTRUN -> [INCOMPLETE][269] ([i915#12745] / [i915#13356] / [i915#17183] / [i915#4839])
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk11/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2:
    - shard-glk11:        NOTRUN -> [INCOMPLETE][270] ([i915#12745] / [i915#13356] / [i915#17183])
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk11/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@dpms-off-confusion-interruptible:
    - shard-dg2:          [PASS][271] -> [SKIP][272] ([i915#5354]) +9 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-6/igt@kms_flip@dpms-off-confusion-interruptible.html
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-7/igt@kms_flip@dpms-off-confusion-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@c-hdmi-a1:
    - shard-tglu:         [PASS][273] -> [FAIL][274] ([i915#14600]) +1 other test fail
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-tglu-4/igt@kms_flip@flip-vs-absolute-wf_vblank@c-hdmi-a1.html
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-tglu-9/igt@kms_flip@flip-vs-absolute-wf_vblank@c-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-rkl:          [PASS][275] -> [INCOMPLETE][276] ([i915#16276] / [i915#6113])
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-rkl-8/igt@kms_flip@flip-vs-suspend-interruptible.html
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-6/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a2:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][277] ([i915#16276] / [i915#6113])
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-6/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a2.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling:
    - shard-dg2:          [PASS][278] -> [SKIP][279] ([i915#3555] / [i915#8813]) +1 other test skip
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-6/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling.html
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:
    - shard-glk:          NOTRUN -> [SKIP][280] ([i915#17522]) +1 other test skip
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk9/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-glk11:        NOTRUN -> [SKIP][281] ([i915#17493])
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk11/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
    - shard-tglu-1:       NOTRUN -> [SKIP][282] ([i915#15643])
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][283] ([i915#15643]) +3 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
    - shard-tglu:         NOTRUN -> [SKIP][284] ([i915#15643]) +1 other test skip
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-tglu-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][285] ([i915#15643]) +2 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-19/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-glk:          NOTRUN -> [SKIP][286] ([i915#17484]) +2 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:
    - shard-glk10:        NOTRUN -> [SKIP][287] ([i915#17522]) +3 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk10/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][288] ([i915#15104] / [i915#15990])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][289] ([i915#17428]) +90 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][290] ([i915#17428] / [i915#1825]) +7 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][291] ([i915#15991] / [i915#17428] / [i915#1825]) +2 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary:
    - shard-dg2:          [PASS][292] -> [SKIP][293] ([i915#16708] / [i915#5354]) +11 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-glk10:        NOTRUN -> [INCOMPLETE][294] ([i915#10056] / [i915#13356] / [i915#16593])
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk10/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-glk10:        NOTRUN -> [SKIP][295] ([i915#17559]) +1 other test skip
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk10/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff:
    - shard-rkl:          NOTRUN -> [SKIP][296] ([i915#15989]) +24 other tests skip
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-4/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-shrfb-draw-render:
    - shard-mtlp:         NOTRUN -> [SKIP][297] ([i915#15989])
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-move:
    - shard-rkl:          [PASS][298] -> [SKIP][299] ([i915#15989]) +2 other tests skip
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-move.html
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-2/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-onoff:
    - shard-glk:          NOTRUN -> [SKIP][300] ([i915#17517]) +11 other tests skip
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk9/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbchdr-indfb-scaledprimary:
    - shard-tglu-1:       NOTRUN -> [SKIP][301] ([i915#15989]) +13 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-tglu-1/igt@kms_frontbuffer_tracking@fbchdr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbchdr-stridechange:
    - shard-dg1:          NOTRUN -> [SKIP][302] ([i915#15989]) +14 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-15/igt@kms_frontbuffer_tracking@fbchdr-stridechange.html

  * igt@kms_frontbuffer_tracking@fbchdr-tiling-4:
    - shard-dg1:          NOTRUN -> [SKIP][303] ([i915#5439]) +2 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-16/igt@kms_frontbuffer_tracking@fbchdr-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt:
    - shard-glk:          NOTRUN -> [SKIP][304] ([i915#17482]) +41 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt:
    - shard-glk11:        NOTRUN -> [SKIP][305] ([i915#17482]) +16 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk11/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-plflip-blt:
    - shard-dg1:          NOTRUN -> [SKIP][306] ([i915#15102]) +31 other tests skip
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-rkl:          NOTRUN -> [SKIP][307] ([i915#15102]) +51 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-shrfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][308] ([i915#15990]) +1 other test skip
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-mtlp-5/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-shrfb-pgflip-blt:
    - shard-tglu:         NOTRUN -> [SKIP][309] ([i915#15989]) +8 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-tglu-5/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@hdr-2p-rte:
    - shard-tglu-1:       NOTRUN -> [SKIP][310] ([i915#17428]) +45 other tests skip
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-tglu-1/igt@kms_frontbuffer_tracking@hdr-2p-rte.html

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-mtlp:         NOTRUN -> [SKIP][311] ([i915#15991] / [i915#17428]) +2 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-mtlp-5/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-pwrite:
    - shard-glk10:        NOTRUN -> [SKIP][312] ([i915#17517]) +7 other tests skip
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk10/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][313] ([i915#15990] / [i915#8708]) +14 other tests skip
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:
    - shard-tglu-1:       NOTRUN -> [SKIP][314] ([i915#15102]) +22 other tests skip
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-tglu-1/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-indfb-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][315] ([i915#15990]) +21 other tests skip
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-15/igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-rte:
    - shard-glk10:        NOTRUN -> [SKIP][316] ([i915#17482]) +25 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk10/igt@kms_frontbuffer_tracking@psrhdr-1p-rte.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-cur-indfb-draw-blt:
    - shard-dg1:          NOTRUN -> [SKIP][317] ([i915#17428]) +64 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-18/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-shrfb-draw-blt:
    - shard-tglu:         NOTRUN -> [SKIP][318] ([i915#17428]) +43 other tests skip
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-tglu-5/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-rgb565-draw-pwrite:
    - shard-tglu:         NOTRUN -> [SKIP][319] ([i915#15102]) +20 other tests skip
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-tglu-5/igt@kms_frontbuffer_tracking@psrhdr-rgb565-draw-pwrite.html

  * igt@kms_hdmi_audio_bw@audio-bw-hblank160:
    - shard-dg2:          [PASS][320] -> [SKIP][321] ([i915#17357]) +1 other test skip
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-6/igt@kms_hdmi_audio_bw@audio-bw-hblank160.html
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-7/igt@kms_hdmi_audio_bw@audio-bw-hblank160.html
    - shard-glk10:        NOTRUN -> [FAIL][322] ([i915#17102])
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk10/igt@kms_hdmi_audio_bw@audio-bw-hblank160.html

  * igt@kms_hdr@bpc-switch:
    - shard-tglu:         NOTRUN -> [SKIP][323] ([i915#3555] / [i915#8228])
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-tglu-5/igt@kms_hdr@bpc-switch.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-rkl:          [PASS][324] -> [SKIP][325] ([i915#16644] / [i915#3555] / [i915#8228])
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-rkl-1/igt@kms_hdr@bpc-switch-dpms.html
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-4/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_hdr@static-toggle:
    - shard-glk:          NOTRUN -> [SKIP][326] ([i915#17498])
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk9/igt@kms_hdr@static-toggle.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][327] ([i915#16644] / [i915#3555] / [i915#8228]) +1 other test skip
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-3/igt@kms_hdr@static-toggle-suspend.html
    - shard-dg1:          NOTRUN -> [SKIP][328] ([i915#3555] / [i915#8228])
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-15/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_invalid_mode@zero-hdisplay:
    - shard-dg2:          [PASS][329] -> [SKIP][330] ([i915#16746] / [i915#3555]) +2 other tests skip
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-5/igt@kms_invalid_mode@zero-hdisplay.html
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-7/igt@kms_invalid_mode@zero-hdisplay.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][331] ([i915#15460])
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-tglu-5/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][332] ([i915#15459])
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-19/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-glk:          NOTRUN -> [SKIP][333] ([i915#17567])
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk8/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-tglu-1:       NOTRUN -> [SKIP][334] ([i915#15460])
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-tglu-1/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][335] ([i915#15458])
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-2/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][336] ([i915#15458])
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-tglu-5/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-dg1:          NOTRUN -> [SKIP][337] ([i915#6301])
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-16/igt@kms_panel_fitting@atomic-fastset.html
    - shard-glk10:        NOTRUN -> [SKIP][338] ([i915#17577])
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk10/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_panel_fitting@legacy:
    - shard-rkl:          NOTRUN -> [SKIP][339] ([i915#6301])
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-4/igt@kms_panel_fitting@legacy.html
    - shard-tglu-1:       NOTRUN -> [SKIP][340] ([i915#6301])
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-tglu-1/igt@kms_panel_fitting@legacy.html

  * igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:
    - shard-tglu:         NOTRUN -> [SKIP][341] ([i915#17455]) +3 other tests skip
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-tglu-5/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:
    - shard-dg2:          [PASS][342] -> [SKIP][343] ([i915#11190] / [i915#17356]) +2 other tests skip
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-4/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][344] ([i915#12756] / [i915#13356] / [i915#13409] / [i915#13476] / [i915#16789]) +1 other test incomplete
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk9/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html

  * igt@kms_pipe_stress@stress-xrgb8888-4tiled:
    - shard-glk:          NOTRUN -> [SKIP][345] ([i915#17601])
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk8/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html

  * igt@kms_pipe_stress@stress-xrgb8888-untiled:
    - shard-dg2:          [PASS][346] -> [SKIP][347] ([i915#17356]) +48 other tests skip
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-1/igt@kms_pipe_stress@stress-xrgb8888-untiled.html
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-7/igt@kms_pipe_stress@stress-xrgb8888-untiled.html

  * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
    - shard-tglu:         NOTRUN -> [SKIP][348] ([i915#14712])
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-tglu-5/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier:
    - shard-glk:          NOTRUN -> [SKIP][349] ([i915#17479]) +2 other tests skip
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk9/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping:
    - shard-glk11:        NOTRUN -> [SKIP][350] ([i915#17479]) +1 other test skip
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk11/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier:
    - shard-tglu:         NOTRUN -> [SKIP][351] ([i915#15709])
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-tglu-5/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping:
    - shard-dg1:          NOTRUN -> [SKIP][352] ([i915#15709]) +3 other tests skip
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-18/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5:
    - shard-rkl:          NOTRUN -> [SKIP][353] ([i915#16386]) +1 other test skip
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-4/igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-7:
    - shard-tglu:         NOTRUN -> [SKIP][354] ([i915#16386]) +1 other test skip
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-tglu-5/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-7.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier:
    - shard-mtlp:         NOTRUN -> [SKIP][355] ([i915#15709])
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-mtlp-5/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier.html

  * igt@kms_plane@pixel-format-yf-tiled-modifier:
    - shard-rkl:          NOTRUN -> [SKIP][356] ([i915#15709]) +4 other tests skip
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-4/igt@kms_plane@pixel-format-yf-tiled-modifier.html
    - shard-tglu-1:       NOTRUN -> [SKIP][357] ([i915#15709]) +2 other tests skip
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-tglu-1/igt@kms_plane@pixel-format-yf-tiled-modifier.html

  * igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y:
    - shard-tglu:         NOTRUN -> [SKIP][358] ([i915#16112])
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-tglu-5/igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y.html

  * igt@kms_plane@plane-position-hole-dpms:
    - shard-dg2:          [PASS][359] -> [SKIP][360] ([i915#8825]) +1 other test skip
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-6/igt@kms_plane@plane-position-hole-dpms.html
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-7/igt@kms_plane@plane-position-hole-dpms.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-tglu:         NOTRUN -> [SKIP][361] ([i915#13958])
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-tglu-5/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-dg1:          NOTRUN -> [SKIP][362] ([i915#13958]) +1 other test skip
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-18/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b:
    - shard-rkl:          NOTRUN -> [SKIP][363] ([i915#15329]) +3 other tests skip
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-7/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-c:
    - shard-dg2:          [PASS][364] -> [SKIP][365] ([i915#15329]) +17 other tests skip
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-4/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-c.html
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-7/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-c.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a:
    - shard-dg1:          NOTRUN -> [SKIP][366] ([i915#15329]) +4 other tests skip
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-19/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers:
    - shard-dg2:          [PASS][367] -> [SKIP][368] ([i915#15329] / [i915#17356] / [i915#9423]) +2 other tests skip
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-1/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers.html
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-7/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:
    - shard-dg2:          [PASS][369] -> [SKIP][370] ([i915#15329] / [i915#17356] / [i915#3555] / [i915#9423])
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-5/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-d:
    - shard-dg2:          [PASS][371] -> [SKIP][372] ([i915#15329] / [i915#17356]) +5 other tests skip
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-6/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-d.html
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-7/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75:
    - shard-dg2:          [PASS][373] -> [SKIP][374] ([i915#15329] / [i915#17356] / [i915#3555] / [i915#6953] / [i915#9423])
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-5/igt@kms_plane_scaling@planes-downscale-factor-0-75.html
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-7/igt@kms_plane_scaling@planes-downscale-factor-0-75.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25:
    - shard-dg2:          [PASS][375] -> [SKIP][376] ([i915#15329] / [i915#17356] / [i915#6953] / [i915#9423])
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-1/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-7/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-glk11:        NOTRUN -> [SKIP][377] ([i915#17462])
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk11/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-dg1:          NOTRUN -> [SKIP][378] ([i915#12343] / [i915#5354])
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-19/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc5-dpms-suspend-resume:
    - shard-glk:          NOTRUN -> [INCOMPLETE][379] ([i915#13356] / [i915#16938])
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk3/igt@kms_pm_dc@dc5-dpms-suspend-resume.html

  * igt@kms_pm_dc@dc5-pageflip-negative:
    - shard-rkl:          NOTRUN -> [SKIP][380] ([i915#9685])
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-7/igt@kms_pm_dc@dc5-pageflip-negative.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-tglu-1:       NOTRUN -> [SKIP][381] ([i915#15948])
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-tglu-1/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc5-psr-suspend-resume:
    - shard-glk10:        NOTRUN -> [SKIP][382] ([i915#17495])
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk10/igt@kms_pm_dc@dc5-psr-suspend-resume.html
    - shard-dg1:          NOTRUN -> [SKIP][383] ([i915#16914])
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-16/igt@kms_pm_dc@dc5-psr-suspend-resume.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-glk:          NOTRUN -> [SKIP][384] ([i915#17553])
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk9/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-rkl:          NOTRUN -> [FAIL][385] ([i915#16479])
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-2/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-tglu:         NOTRUN -> [SKIP][386] ([i915#15948])
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-tglu-5/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-rkl:          NOTRUN -> [SKIP][387] ([i915#3828]) +1 other test skip
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-8/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-rkl:          NOTRUN -> [SKIP][388] ([i915#8430])
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-3/igt@kms_pm_lpsp@screens-disabled.html
    - shard-dg1:          NOTRUN -> [SKIP][389] ([i915#8430])
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-15/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_pm_rpm@drm-resources-equal:
    - shard-dg2:          [PASS][390] -> [SKIP][391] ([i915#17446] / [i915#3547])
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-4/igt@kms_pm_rpm@drm-resources-equal.html
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-7/igt@kms_pm_rpm@drm-resources-equal.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-dg2:          [PASS][392] -> [SKIP][393] ([i915#15073])
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-4/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-7/igt@kms_pm_rpm@modeset-lpsp-stress.html
    - shard-dg1:          [PASS][394] -> [SKIP][395] ([i915#15073]) +1 other test skip
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg1-14/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-16/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-glk:          NOTRUN -> [SKIP][396] ([i915#15073])
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk8/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-dg1:          NOTRUN -> [SKIP][397] ([i915#15073]) +1 other test skip
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-15/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-rkl:          [PASS][398] -> [SKIP][399] ([i915#15073]) +1 other test skip
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-rkl-4/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
    - shard-tglu-1:       NOTRUN -> [SKIP][400] ([i915#15073])
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-tglu-1/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@modeset-pc8-residency-stress:
    - shard-tglu:         NOTRUN -> [SKIP][401] ([i915#17434] / [i915#17450])
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-tglu-5/igt@kms_pm_rpm@modeset-pc8-residency-stress.html

  * igt@kms_pm_rpm@pc8-residency:
    - shard-dg1:          NOTRUN -> [SKIP][402] ([i915#17434] / [i915#17450])
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-18/igt@kms_pm_rpm@pc8-residency.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-rkl:          [PASS][403] -> [INCOMPLETE][404] ([i915#14419])
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-rkl-2/igt@kms_pm_rpm@system-suspend-modeset.html
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-6/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_prime@basic-crc-vgem:
    - shard-dg1:          NOTRUN -> [SKIP][405] ([i915#6524])
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-16/igt@kms_prime@basic-crc-vgem.html

  * igt@kms_prime@d3hot:
    - shard-tglu-1:       NOTRUN -> [SKIP][406] ([i915#6524])
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-tglu-1/igt@kms_prime@d3hot.html

  * igt@kms_properties@colorop-properties-legacy:
    - shard-dg2:          [PASS][407] -> [SKIP][408] ([i915#15347])
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-6/igt@kms_properties@colorop-properties-legacy.html
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-7/igt@kms_properties@colorop-properties-legacy.html
    - shard-glk10:        NOTRUN -> [SKIP][409] ([i915#17481])
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk10/igt@kms_properties@colorop-properties-legacy.html

  * igt@kms_properties@plane-properties-atomic:
    - shard-dg2:          [PASS][410] -> [SKIP][411] ([i915#11521])
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-1/igt@kms_properties@plane-properties-atomic.html
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-7/igt@kms_properties@plane-properties-atomic.html

  * igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:
    - shard-tglu-1:       NOTRUN -> [SKIP][412] ([i915#11520]) +4 other tests skip
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-tglu-1/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-tglu:         NOTRUN -> [SKIP][413] ([i915#11520]) +3 other tests skip
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-tglu-5/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - shard-glk:          NOTRUN -> [SKIP][414] ([i915#11520]) +4 other tests skip
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk9/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-glk11:        NOTRUN -> [SKIP][415] ([i915#11520])
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk11/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-rkl:          NOTRUN -> [SKIP][416] ([i915#11520]) +6 other tests skip
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-3/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg1:          NOTRUN -> [SKIP][417] ([i915#11520]) +7 other tests skip
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-18/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:
    - shard-glk10:        NOTRUN -> [SKIP][418] ([i915#11520])
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk10/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-dg1:          NOTRUN -> [SKIP][419] ([i915#9683])
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-15/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-glk:          NOTRUN -> [SKIP][420] ([i915#17546])
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk8/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-rkl:          NOTRUN -> [SKIP][421] ([i915#9683]) +1 other test skip
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-8/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-primary-render:
    - shard-glk10:        NOTRUN -> [SKIP][422] ([i915#17480]) +6 other tests skip
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk10/igt@kms_psr@fbc-pr-primary-render.html

  * igt@kms_psr@fbc-pr-sprite-plane-onoff:
    - shard-rkl:          NOTRUN -> [SKIP][423] ([i915#1072] / [i915#9732]) +18 other tests skip
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-4/igt@kms_psr@fbc-pr-sprite-plane-onoff.html

  * igt@kms_psr@fbc-psr-cursor-plane-move:
    - shard-tglu:         NOTRUN -> [SKIP][424] ([i915#9732]) +11 other tests skip
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-tglu-5/igt@kms_psr@fbc-psr-cursor-plane-move.html

  * igt@kms_psr@fbc-psr2-cursor-blt:
    - shard-dg1:          NOTRUN -> [SKIP][425] ([i915#1072] / [i915#9732]) +19 other tests skip
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-15/igt@kms_psr@fbc-psr2-cursor-blt.html

  * igt@kms_psr@fbc-psr2-primary-page-flip:
    - shard-glk11:        NOTRUN -> [SKIP][426] ([i915#17480]) +4 other tests skip
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk11/igt@kms_psr@fbc-psr2-primary-page-flip.html

  * igt@kms_psr@pr-basic:
    - shard-glk:          NOTRUN -> [SKIP][427] ([i915#17480]) +9 other tests skip
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk9/igt@kms_psr@pr-basic.html

  * igt@kms_psr@pr-primary-mmap-cpu:
    - shard-mtlp:         NOTRUN -> [SKIP][428] ([i915#9688])
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-mtlp-5/igt@kms_psr@pr-primary-mmap-cpu.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - shard-glk:          NOTRUN -> [SKIP][429] ([i915#17480] / [i915#9732])
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk8/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@kms_psr@psr2-sprite-mmap-cpu:
    - shard-tglu-1:       NOTRUN -> [SKIP][430] ([i915#9732]) +12 other tests skip
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-tglu-1/igt@kms_psr@psr2-sprite-mmap-cpu.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-dg1:          NOTRUN -> [SKIP][431] ([i915#15949])
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-18/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-glk:          NOTRUN -> [SKIP][432] ([i915#17554])
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk9/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@exhaust-fences:
    - shard-dg1:          NOTRUN -> [SKIP][433] ([i915#4884])
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-16/igt@kms_rotation_crc@exhaust-fences.html

  * igt@kms_rotation_crc@primary-x-tiled-reflect-x-180:
    - shard-glk11:        NOTRUN -> [SKIP][434] ([i915#17488])
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk11/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-glk:          NOTRUN -> [SKIP][435] ([i915#17488]) +1 other test skip
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-mtlp:         NOTRUN -> [SKIP][436] ([i915#15867])
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-mtlp-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-rkl:          NOTRUN -> [SKIP][437] ([i915#17432] / [i915#5289])
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
    - shard-dg1:          NOTRUN -> [SKIP][438] ([i915#17432] / [i915#5289])
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-15/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-glk:          NOTRUN -> [ABORT][439] ([i915#13179]) +1 other test abort
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk8/igt@kms_selftest@drm_framebuffer.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-rkl:          NOTRUN -> [SKIP][440] ([i915#3555]) +1 other test skip
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-8/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-glk:          NOTRUN -> [SKIP][441] ([i915#17463])
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk9/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg1:          NOTRUN -> [SKIP][442] ([i915#8623])
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-16/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-tglu-1:       NOTRUN -> [SKIP][443] ([i915#17445])
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-tglu-1/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@flip-basic:
    - shard-glk11:        NOTRUN -> [SKIP][444] ([i915#17520])
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk11/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-glk:          NOTRUN -> [SKIP][445] ([i915#17520]) +1 other test skip
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk9/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-dg1:          NOTRUN -> [SKIP][446] ([i915#9906])
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-19/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-rkl:          NOTRUN -> [SKIP][447] ([i915#9906])
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-2/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@perf@gen12-group-exclusive-stream-ctx-handle:
    - shard-glk:          NOTRUN -> [SKIP][448] ([i915#17536])
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk8/igt@perf@gen12-group-exclusive-stream-ctx-handle.html

  * igt@perf@gen8-unprivileged-single-ctx-counters:
    - shard-rkl:          NOTRUN -> [SKIP][449] ([i915#2436])
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-2/igt@perf@gen8-unprivileged-single-ctx-counters.html

  * igt@perf_pmu@busy-double-start@rcs0:
    - shard-mtlp:         [PASS][450] -> [FAIL][451] ([i915#4349])
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-mtlp-6/igt@perf_pmu@busy-double-start@rcs0.html
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-mtlp-4/igt@perf_pmu@busy-double-start@rcs0.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-tglu:         NOTRUN -> [SKIP][452] ([i915#8516])
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-tglu-5/igt@perf_pmu@rc6-all-gts.html

  * igt@perf_pmu@rc6-suspend:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][453] ([i915#13520])
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-3/igt@perf_pmu@rc6-suspend.html

  * igt@perf_pmu@rc6@other-idle-gt0:
    - shard-rkl:          NOTRUN -> [SKIP][454] ([i915#8516])
   [454]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-2/igt@perf_pmu@rc6@other-idle-gt0.html

  * igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:
    - shard-dg1:          NOTRUN -> [SKIP][455] ([i915#14121]) +1 other test skip
   [455]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-16/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html

  * igt@prime_udl@share-import:
    - shard-dg1:          NOTRUN -> [SKIP][456] ([i915#16420])
   [456]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-18/igt@prime_udl@share-import.html

  * igt@prime_vgem@basic-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][457] ([i915#3708] / [i915#4077])
   [457]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-18/igt@prime_vgem@basic-gtt.html

  * igt@prime_vgem@basic-read:
    - shard-dg1:          NOTRUN -> [SKIP][458] ([i915#3708])
   [458]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-16/igt@prime_vgem@basic-read.html

  * igt@prime_vgem@coherency-gtt:
    - shard-tglu-1:       NOTRUN -> [SKIP][459] ([i915#17429] / [i915#17448])
   [459]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-tglu-1/igt@prime_vgem@coherency-gtt.html

  * igt@prime_vgem@fence-flip-hang:
    - shard-glk11:        NOTRUN -> [SKIP][460] ([i915#17467])
   [460]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk11/igt@prime_vgem@fence-flip-hang.html
    - shard-tglu-1:       NOTRUN -> [SKIP][461] ([i915#17448])
   [461]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-tglu-1/igt@prime_vgem@fence-flip-hang.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-tglu-1:       NOTRUN -> [SKIP][462] ([i915#17447])
   [462]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-tglu-1/igt@tools_test@sysfs_l3_parity.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@preservation-s3@rcs0:
    - shard-glk:          [INCOMPLETE][463] ([i915#13356] / [i915#16466]) -> [PASS][464]
   [463]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-glk9/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [464]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk5/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-dg1:          [DMESG-WARN][465] ([i915#4391] / [i915#4423]) -> [PASS][466]
   [465]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg1-17/igt@i915_suspend@basic-s3-without-i915.html
   [466]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-18/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-1:
    - shard-glk:          [FAIL][467] ([i915#14888]) -> [PASS][468] +1 other test pass
   [467]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-glk5/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-1.html
   [468]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk6/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-1.html

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-c-edp-1:
    - shard-mtlp:         [FAIL][469] ([i915#17150]) -> [PASS][470]
   [469]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-mtlp-8/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-edp-1.html
   [470]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-mtlp-5/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-edp-1.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - shard-dg2:          [SKIP][471] ([i915#17356]) -> [PASS][472] +48 other tests pass
   [471]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-7/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
   [472]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-5/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
    - shard-rkl:          [INCOMPLETE][473] ([i915#15582]) -> [PASS][474]
   [473]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-rkl-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html
   [474]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-8/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_color@gamma:
    - shard-dg2:          [SKIP][475] ([i915#12655] / [i915#17373]) -> [PASS][476] +1 other test pass
   [475]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-7/igt@kms_color@gamma.html
   [476]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-4/igt@kms_color@gamma.html

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d:
    - shard-dg2:          [SKIP][477] ([i915#15529]) -> [PASS][478] +4 other tests pass
   [477]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-7/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d.html
   [478]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-8/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:
    - shard-dg2:          [SKIP][479] ([i915#11190] / [i915#17356]) -> [PASS][480] +1 other test pass
   [479]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-7/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
   [480]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-8/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
    - shard-glk:          [FAIL][481] -> [PASS][482]
   [481]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-glk9/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
   [482]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk9/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html

  * igt@kms_flip@modeset-vs-vblank-race:
    - shard-dg2:          [SKIP][483] ([i915#5354]) -> [PASS][484] +9 other tests pass
   [483]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-7/igt@kms_flip@modeset-vs-vblank-race.html
   [484]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-1/igt@kms_flip@modeset-vs-vblank-race.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:
    - shard-dg2:          [SKIP][485] ([i915#3555] / [i915#8813]) -> [PASS][486] +3 other tests pass
   [485]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-7/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html
   [486]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-5/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render:
    - shard-dg2:          [SKIP][487] ([i915#16708]) -> [PASS][488] +1 other test pass
   [487]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render.html
   [488]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite:
    - shard-dg2:          [SKIP][489] ([i915#16708] / [i915#5354]) -> [PASS][490] +3 other tests pass
   [489]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html
   [490]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-rkl:          [INCOMPLETE][491] ([i915#10056]) -> [PASS][492]
   [491]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [492]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-pwrite:
    - shard-glk:          [SKIP][493] ([i915#17517]) -> [PASS][494] +4 other tests pass
   [493]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-glk3/igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-pwrite.html
   [494]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk8/igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbchdr-tiling-linear:
    - shard-rkl:          [SKIP][495] ([i915#15989]) -> [PASS][496] +13 other tests pass
   [495]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-rkl-8/igt@kms_frontbuffer_tracking@fbchdr-tiling-linear.html
   [496]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-tiling-linear.html

  * igt@kms_invalid_mode@bad-hsync-end:
    - shard-dg2:          [SKIP][497] ([i915#16746] / [i915#3555]) -> [PASS][498]
   [497]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-7/igt@kms_invalid_mode@bad-hsync-end.html
   [498]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-5/igt@kms_invalid_mode@bad-hsync-end.html

  * igt@kms_plane@plane-panning-top-left:
    - shard-dg2:          [SKIP][499] ([i915#8825]) -> [PASS][500] +1 other test pass
   [499]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-7/igt@kms_plane@plane-panning-top-left.html
   [500]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-8/igt@kms_plane@plane-panning-top-left.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-d:
    - shard-dg2:          [SKIP][501] ([i915#15329] / [i915#17356]) -> [PASS][502] +5 other tests pass
   [501]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-7/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-d.html
   [502]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-8/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20:
    - shard-dg2:          [SKIP][503] ([i915#15329] / [i915#17356] / [i915#9423]) -> [PASS][504] +2 other tests pass
   [503]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-7/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20.html
   [504]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-1/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a:
    - shard-dg2:          [SKIP][505] ([i915#15329]) -> [PASS][506] +17 other tests pass
   [505]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-7/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a.html
   [506]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-5/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a.html

  * igt@kms_plane_scaling@planes-scaler-unity-scaling:
    - shard-dg2:          [SKIP][507] ([i915#15329] / [i915#17356] / [i915#3555] / [i915#9423]) -> [PASS][508]
   [507]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-7/igt@kms_plane_scaling@planes-scaler-unity-scaling.html
   [508]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-5/igt@kms_plane_scaling@planes-scaler-unity-scaling.html

  * igt@kms_plane_scaling@planes-upscale-20x20:
    - shard-dg2:          [SKIP][509] ([i915#15329] / [i915#17356] / [i915#6953] / [i915#9423]) -> [PASS][510] +1 other test pass
   [509]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-7/igt@kms_plane_scaling@planes-upscale-20x20.html
   [510]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-1/igt@kms_plane_scaling@planes-upscale-20x20.html

  * igt@kms_pm_dc@dc5-dpms-suspend-resume:
    - shard-rkl:          [INCOMPLETE][511] ([i915#16943]) -> [PASS][512]
   [511]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-rkl-3/igt@kms_pm_dc@dc5-dpms-suspend-resume.html
   [512]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-3/igt@kms_pm_dc@dc5-dpms-suspend-resume.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-rkl:          [SKIP][513] ([i915#15073]) -> [PASS][514] +2 other tests pass
   [513]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-rkl-7/igt@kms_pm_rpm@dpms-lpsp.html
   [514]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-5/igt@kms_pm_rpm@dpms-lpsp.html
    - shard-dg1:          [SKIP][515] ([i915#15073]) -> [PASS][516] +1 other test pass
   [515]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg1-19/igt@kms_pm_rpm@dpms-lpsp.html
   [516]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-15/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@i2c:
    - shard-dg2:          [SKIP][517] ([i915#17446]) -> [PASS][518]
   [517]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-7/igt@kms_pm_rpm@i2c.html
   [518]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-1/igt@kms_pm_rpm@i2c.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-dg2:          [SKIP][519] ([i915#15073]) -> [PASS][520] +1 other test pass
   [519]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-7/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [520]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-8/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  
#### Warnings ####

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-rkl:          [SKIP][521] ([i915#11078] / [i915#14544]) -> [SKIP][522] ([i915#11078])
   [521]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-rkl-6/igt@device_reset@unbind-cold-reset-rebind.html
   [522]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-4/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@gem_create@create-ext-cpu-access-sanity-check:
    - shard-rkl:          [SKIP][523] ([i915#6335]) -> [SKIP][524] ([i915#14544] / [i915#6335])
   [523]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-rkl-8/igt@gem_create@create-ext-cpu-access-sanity-check.html
   [524]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-6/igt@gem_create@create-ext-cpu-access-sanity-check.html

  * igt@gem_exec_reloc@basic-cpu-gtt-noreloc:
    - shard-rkl:          [SKIP][525] ([i915#3281]) -> [SKIP][526] ([i915#14544] / [i915#3281]) +3 other tests skip
   [525]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-rkl-8/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html
   [526]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-6/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html

  * igt@gem_exec_reloc@basic-gtt-cpu:
    - shard-rkl:          [SKIP][527] ([i915#14544] / [i915#3281]) -> [SKIP][528] ([i915#3281]) +2 other tests skip
   [527]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-cpu.html
   [528]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-2/igt@gem_exec_reloc@basic-gtt-cpu.html

  * igt@gem_lmem_swapping@heavy-verify-random:
    - shard-rkl:          [SKIP][529] ([i915#4613]) -> [SKIP][530] ([i915#14544] / [i915#4613])
   [529]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-rkl-5/igt@gem_lmem_swapping@heavy-verify-random.html
   [530]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-6/igt@gem_lmem_swapping@heavy-verify-random.html

  * igt@gem_lmem_swapping@verify-ccs:
    - shard-rkl:          [SKIP][531] ([i915#14544] / [i915#4613]) -> [SKIP][532] ([i915#4613])
   [531]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-rkl-6/igt@gem_lmem_swapping@verify-ccs.html
   [532]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-2/igt@gem_lmem_swapping@verify-ccs.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-snoop:
    - shard-rkl:          [SKIP][533] ([i915#3282]) -> [SKIP][534] ([i915#14544] / [i915#3282])
   [533]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-rkl-8/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html
   [534]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-6/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html

  * igt@gem_tiled_partial_pwrite_pread@writes-after-reads:
    - shard-rkl:          [SKIP][535] ([i915#14544] / [i915#3282]) -> [SKIP][536] ([i915#3282])
   [535]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-rkl-6/igt@gem_tiled_partial_pwrite_pread@writes-after-reads.html
   [536]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-2/igt@gem_tiled_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_userptr_blits@forbidden-operations:
    - shard-rkl:          [SKIP][537] ([i915#14544] / [i915#3282] / [i915#3297]) -> [SKIP][538] ([i915#3282] / [i915#3297])
   [537]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-rkl-6/igt@gem_userptr_blits@forbidden-operations.html
   [538]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-4/igt@gem_userptr_blits@forbidden-operations.html

  * igt@gem_userptr_blits@unsync-unmap:
    - shard-rkl:          [SKIP][539] ([i915#3297]) -> [SKIP][540] ([i915#14544] / [i915#3297])
   [539]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-rkl-8/igt@gem_userptr_blits@unsync-unmap.html
   [540]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-6/igt@gem_userptr_blits@unsync-unmap.html

  * igt@gen7_exec_parse@oacontrol-tracking:
    - shard-rkl:          [SKIP][541] ([i915#17455]) -> [SKIP][542] ([i915#14544] / [i915#17455])
   [541]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-rkl-8/igt@gen7_exec_parse@oacontrol-tracking.html
   [542]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-6/igt@gen7_exec_parse@oacontrol-tracking.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-rkl:          [SKIP][543] ([i915#14544] / [i915#2527]) -> [SKIP][544] ([i915#2527])
   [543]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-rkl-6/igt@gen9_exec_parse@allowed-single.html
   [544]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-4/igt@gen9_exec_parse@allowed-single.html

  * igt@i915_pm_rc6_residency@media-rc6-accuracy:
    - shard-rkl:          [SKIP][545] ([i915#16080] / [i915#16166]) -> [SKIP][546] ([i915#14544] / [i915#16080] / [i915#16166])
   [545]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-rkl-8/igt@i915_pm_rc6_residency@media-rc6-accuracy.html
   [546]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-6/igt@i915_pm_rc6_residency@media-rc6-accuracy.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-rkl:          [ABORT][547] ([i915#15140]) -> [INCOMPLETE][548] ([i915#4817])
   [547]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-rkl-1/igt@i915_suspend@fence-restore-tiled2untiled.html
   [548]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-4/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-d-edp-1:
    - shard-mtlp:         [INCOMPLETE][549] ([i915#17037]) -> [FAIL][550] ([i915#17150]) +1 other test fail
   [549]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-mtlp-8/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-edp-1.html
   [550]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-mtlp-5/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-edp-1.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-rkl:          [SKIP][551] ([i915#14544] / [i915#1769] / [i915#3555]) -> [SKIP][552] ([i915#1769] / [i915#3555])
   [551]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-rkl-6/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
   [552]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-4/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
    - shard-rkl:          [SKIP][553] ([i915#14544] / [i915#4538] / [i915#5286]) -> [SKIP][554] ([i915#4538] / [i915#5286]) +1 other test skip
   [553]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-rkl-6/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html
   [554]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-2/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-dg2:          [SKIP][555] ([i915#17431]) -> [SKIP][556] ([i915#17356]) +5 other tests skip
   [555]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-4/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [556]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-7/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-rkl:          [SKIP][557] ([i915#5286]) -> [SKIP][558] ([i915#14544] / [i915#5286])
   [557]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-rkl-5/igt@kms_big_fb@4-tiled-addfb-size-overflow.html
   [558]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-6/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-rkl:          [SKIP][559] ([i915#4538] / [i915#5286]) -> [SKIP][560] ([i915#14544] / [i915#4538] / [i915#5286])
   [559]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-rkl-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180.html
   [560]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-dg2:          [SKIP][561] ([i915#17356]) -> [SKIP][562] ([i915#17431]) +3 other tests skip
   [561]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-7/igt@kms_big_fb@linear-16bpp-rotate-90.html
   [562]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-5/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-rkl:          [SKIP][563] ([i915#17431] / [i915#3638]) -> [SKIP][564] ([i915#14544] / [i915#17431] / [i915#3638])
   [563]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-rkl-8/igt@kms_big_fb@linear-64bpp-rotate-90.html
   [564]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-6/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg2:          [SKIP][565] ([i915#3828]) -> [SKIP][566] ([i915#17356])
   [565]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-1/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html
   [566]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-7/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html
    - shard-rkl:          [SKIP][567] ([i915#3828]) -> [SKIP][568] ([i915#14544] / [i915#3828])
   [567]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-rkl-8/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html
   [568]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-6/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-rkl:          [SKIP][569] ([i915#14544] / [i915#3828]) -> [SKIP][570] ([i915#3828])
   [569]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-rkl-6/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html
   [570]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-4/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2:          [SKIP][571] ([i915#17356] / [i915#5190]) -> [SKIP][572] ([i915#5190]) +1 other test skip
   [571]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-7/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [572]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-8/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-dg2:          [SKIP][573] ([i915#4538] / [i915#5190]) -> [SKIP][574] ([i915#17356] / [i915#5190]) +10 other tests skip
   [573]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [574]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-7/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
    - shard-dg2:          [SKIP][575] ([i915#17356] / [i915#5190]) -> [SKIP][576] ([i915#4538] / [i915#5190]) +10 other tests skip
   [575]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-7/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html
   [576]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-8/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-rkl:          [SKIP][577] ([i915#14544] / [i915#17432]) -> [SKIP][578] ([i915#17432])
   [577]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-rkl-6/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [578]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-2/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-rkl:          [SKIP][579] ([i915#4538]) -> [SKIP][580] ([i915#14544] / [i915#4538])
   [579]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-rkl-8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [580]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-4:
    - shard-dg1:          [SKIP][581] ([i915#4423] / [i915#6095]) -> [SKIP][582] ([i915#6095]) +1 other test skip
   [581]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg1-17/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-4.html
   [582]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-18/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-4.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:
    - shard-dg2:          [SKIP][583] ([i915#10307] / [i915#6095]) -> [SKIP][584] ([i915#17356]) +10 other tests skip
   [583]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-6/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html
   [584]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-7/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-dg2:          [SKIP][585] ([i915#17356]) -> [SKIP][586] ([i915#12313]) +1 other test skip
   [585]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-7/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
   [586]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-1/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:
    - shard-dg2:          [SKIP][587] ([i915#6095]) -> [SKIP][588] ([i915#17356])
   [587]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html
   [588]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:
    - shard-dg2:          [SKIP][589] ([i915#17356]) -> [SKIP][590] ([i915#6095]) +1 other test skip
   [589]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html
   [590]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-rkl:          [SKIP][591] ([i915#14098] / [i915#14544] / [i915#6095]) -> [SKIP][592] ([i915#14098] / [i915#6095]) +8 other tests skip
   [591]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
   [592]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-2/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc:
    - shard-rkl:          [SKIP][593] ([i915#14098] / [i915#6095]) -> [SKIP][594] ([i915#14098] / [i915#14544] / [i915#6095]) +4 other tests skip
   [593]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-rkl-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc.html
   [594]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs:
    - shard-dg2:          [SKIP][595] ([i915#17356]) -> [SKIP][596] ([i915#10307] / [i915#6095]) +8 other tests skip
   [595]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-7/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs.html
   [596]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-5/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-dg2:          [SKIP][597] ([i915#12313]) -> [SKIP][598] ([i915#17356])
   [597]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-4/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
   [598]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-7/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-a-hdmi-a-2:
    - shard-rkl:          [SKIP][599] ([i915#14544] / [i915#6095]) -> [SKIP][600] ([i915#6095]) +6 other tests skip
   [599]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-rkl-6/igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-a-hdmi-a-2.html
   [600]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-4/igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2:          [SKIP][601] ([i915#16017]) -> [SKIP][602] ([i915#17356])
   [601]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-6/igt@kms_cdclk@mode-transition-all-outputs.html
   [602]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-7/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_audio@dp-audio-after-suspend:
    - shard-rkl:          [SKIP][603] ([i915#11151]) -> [SKIP][604] ([i915#11151] / [i915#14544])
   [603]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-rkl-8/igt@kms_chamelium_audio@dp-audio-after-suspend.html
   [604]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-6/igt@kms_chamelium_audio@dp-audio-after-suspend.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d:
    - shard-rkl:          [SKIP][605] ([i915#16471] / [i915#17427]) -> [SKIP][606] ([i915#14544] / [i915#16471] / [i915#17427])
   [605]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-rkl-8/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d.html
   [606]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-6/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-rkl:          [SKIP][607] ([i915#11151] / [i915#14544] / [i915#7828]) -> [SKIP][608] ([i915#11151] / [i915#7828]) +1 other test skip
   [607]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-rkl-6/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html
   [608]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-2/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:
    - shard-rkl:          [SKIP][609] ([i915#11151] / [i915#7828]) -> [SKIP][610] ([i915#11151] / [i915#14544] / [i915#7828]) +2 other tests skip
   [609]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-rkl-2/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html
   [610]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-6/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html

  * igt@kms_content_protection@atomic-hdcp14:
    - shard-rkl:          [SKIP][611] ([i915#14544] / [i915#15865]) -> [SKIP][612] ([i915#15865])
   [611]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-rkl-6/igt@kms_content_protection@atomic-hdcp14.html
   [612]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-2/igt@kms_content_protection@atomic-hdcp14.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-dg2:          [SKIP][613] ([i915#15330] / [i915#3299]) -> [SKIP][614] ([i915#17356])
   [613]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-5/igt@kms_content_protection@dp-mst-lic-type-1.html
   [614]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-7/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2:          [SKIP][615] ([i915#17356]) -> [SKIP][616] ([i915#15330] / [i915#3299])
   [615]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-7/igt@kms_content_protection@dp-mst-type-0.html
   [616]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-4/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@dp-mst-type-0-suspend-resume:
    - shard-dg2:          [SKIP][617] ([i915#17356]) -> [SKIP][618] ([i915#15330])
   [617]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-7/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html
   [618]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-1/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html

  * igt@kms_content_protection@lic-type-0:
    - shard-rkl:          [SKIP][619] ([i915#15865]) -> [SKIP][620] ([i915#14544] / [i915#15865])
   [619]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-rkl-8/igt@kms_content_protection@lic-type-0.html
   [620]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-6/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@mei-interface:
    - shard-dg2:          [SKIP][621] ([i915#17356]) -> [SKIP][622] ([i915#15865]) +1 other test skip
   [621]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-7/igt@kms_content_protection@mei-interface.html
   [622]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-5/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@type1:
    - shard-dg2:          [SKIP][623] ([i915#15865]) -> [SKIP][624] ([i915#17356]) +1 other test skip
   [623]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-5/igt@kms_content_protection@type1.html
   [624]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-7/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-rkl:          [SKIP][625] ([i915#14544] / [i915#3555]) -> [SKIP][626] ([i915#3555])
   [625]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-32x32.html
   [626]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-4/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
    - shard-dg2:          [SKIP][627] ([i915#17356]) -> [SKIP][628] ([i915#3555]) +2 other tests skip
   [627]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-7/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html
   [628]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-5/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-rkl:          [SKIP][629] ([i915#13049] / [i915#14544]) -> [SKIP][630] ([i915#13049])
   [629]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
   [630]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-4/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-dg2:          [SKIP][631] ([i915#3555]) -> [SKIP][632] ([i915#17356]) +5 other tests skip
   [631]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-5/igt@kms_cursor_crc@cursor-sliding-32x10.html
   [632]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-7/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-dg2:          [SKIP][633] ([i915#17356]) -> [SKIP][634] ([i915#13049])
   [633]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-7/igt@kms_cursor_crc@cursor-sliding-512x170.html
   [634]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-8/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-dg2:          [SKIP][635] ([i915#13049]) -> [SKIP][636] ([i915#17356])
   [635]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-1/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [636]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-7/igt@kms_cursor_crc@cursor-sliding-512x512.html
    - shard-rkl:          [SKIP][637] ([i915#13049]) -> [SKIP][638] ([i915#13049] / [i915#14544])
   [637]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-rkl-8/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [638]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-dg2:          [SKIP][639] ([i915#13046] / [i915#17454] / [i915#5354]) -> [SKIP][640] ([i915#17356]) +3 other tests skip
   [639]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-1/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
   [640]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-7/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-rkl:          [SKIP][641] ([i915#4103]) -> [SKIP][642] ([i915#14544] / [i915#4103])
   [641]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-rkl-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
   [642]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
    - shard-dg2:          [SKIP][643] ([i915#17356]) -> [SKIP][644] ([i915#13046] / [i915#17454] / [i915#5354]) +5 other tests skip
   [643]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html
   [644]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html

  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
    - shard-dg2:          [SKIP][645] ([i915#17356]) -> [SKIP][646] ([i915#9067])
   [645]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-7/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
   [646]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-8/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-dg2:          [SKIP][647] ([i915#4103]) -> [SKIP][648] ([i915#17356])
   [647]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
   [648]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-dg2:          [SKIP][649] ([i915#17356]) -> [SKIP][650] ([i915#9833]) +1 other test skip
   [649]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-7/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
   [650]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-5/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-rkl:          [SKIP][651] ([i915#3555] / [i915#3804]) -> [SKIP][652] ([i915#14544] / [i915#3555] / [i915#3804])
   [651]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-rkl-8/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [652]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-dg2:          [SKIP][653] ([i915#17289]) -> [SKIP][654] ([i915#17356])
   [653]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-6/igt@kms_dp_link_training@non-uhbr-mst.html
   [654]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-7/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-dg2:          [SKIP][655] ([i915#13748]) -> [SKIP][656] ([i915#17356])
   [655]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-5/igt@kms_dp_link_training@uhbr-mst.html
   [656]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-7/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dp_link_training@uhbr-mst-direct-train:
    - shard-rkl:          [SKIP][657] ([i915#17285]) -> [SKIP][658] ([i915#14544] / [i915#17285])
   [657]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-rkl-2/igt@kms_dp_link_training@uhbr-mst-direct-train.html
   [658]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-6/igt@kms_dp_link_training@uhbr-mst-direct-train.html

  * igt@kms_dp_link_training@uhbr-sst-tbtalt-train:
    - shard-dg2:          [SKIP][659] ([i915#17285]) -> [SKIP][660] ([i915#17356])
   [659]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-4/igt@kms_dp_link_training@uhbr-sst-tbtalt-train.html
   [660]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-7/igt@kms_dp_link_training@uhbr-sst-tbtalt-train.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-dg2:          [SKIP][661] ([i915#17356]) -> [SKIP][662] ([i915#13707])
   [661]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-7/igt@kms_dp_linktrain_fallback@dsc-fallback.html
   [662]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-4/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback:
    - shard-rkl:          [SKIP][663] ([i915#16867]) -> [SKIP][664] ([i915#14544] / [i915#16867])
   [663]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-rkl-5/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html
   [664]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-6/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html

  * igt@kms_draw_crc@draw-method-mmap-gtt:
    - shard-dg2:          [SKIP][665] ([i915#8812]) -> [SKIP][666] ([i915#17356])
   [665]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-6/igt@kms_draw_crc@draw-method-mmap-gtt.html
   [666]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-7/igt@kms_draw_crc@draw-method-mmap-gtt.html

  * igt@kms_draw_crc@draw-method-mmap-wc:
    - shard-dg2:          [SKIP][667] ([i915#17356]) -> [SKIP][668] ([i915#8812])
   [667]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-7/igt@kms_draw_crc@draw-method-mmap-wc.html
   [668]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-4/igt@kms_draw_crc@draw-method-mmap-wc.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc-ultrajoiner:
    - shard-dg2:          [SKIP][669] ([i915#16361]) -> [SKIP][670] ([i915#17356]) +1 other test skip
   [669]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-1/igt@kms_dsc@dsc-fractional-bpp-with-bpc-ultrajoiner.html
   [670]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-7/igt@kms_dsc@dsc-fractional-bpp-with-bpc-ultrajoiner.html
    - shard-rkl:          [SKIP][671] ([i915#16361]) -> [SKIP][672] ([i915#14544] / [i915#16361])
   [671]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-rkl-8/igt@kms_dsc@dsc-fractional-bpp-with-bpc-ultrajoiner.html
   [672]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-6/igt@kms_dsc@dsc-fractional-bpp-with-bpc-ultrajoiner.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg2:          [SKIP][673] ([i915#17356]) -> [SKIP][674] ([i915#16361]) +2 other tests skip
   [673]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-7/igt@kms_dsc@dsc-with-bpc-formats.html
   [674]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-8/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_feature_discovery@display-4x:
    - shard-rkl:          [SKIP][675] ([i915#14544] / [i915#16081]) -> [SKIP][676] ([i915#16081])
   [675]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-rkl-6/igt@kms_feature_discovery@display-4x.html
   [676]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-2/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-rkl:          [SKIP][677] ([i915#16599]) -> [SKIP][678] ([i915#14544] / [i915#16599])
   [677]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-rkl-8/igt@kms_feature_discovery@dp-mst.html
   [678]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-6/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-rkl:          [SKIP][679] ([i915#9934]) -> [SKIP][680] ([i915#14544] / [i915#9934]) +1 other test skip
   [679]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-rkl-8/igt@kms_flip@2x-absolute-wf_vblank.html
   [680]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-6/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-glk:          [INCOMPLETE][681] ([i915#12745] / [i915#13356] / [i915#17183] / [i915#4839] / [i915#6113]) -> [INCOMPLETE][682] ([i915#12314] / [i915#12745] / [i915#13356] / [i915#17183] / [i915#4839])
   [681]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-glk3/igt@kms_flip@2x-flip-vs-suspend.html
   [682]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk8/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a1-hdmi-a2:
    - shard-glk:          [INCOMPLETE][683] ([i915#12745] / [i915#13356] / [i915#17183]) -> [INCOMPLETE][684] ([i915#12314] / [i915#12745] / [i915#13356] / [i915#17183])
   [683]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-glk3/igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a1-hdmi-a2.html
   [684]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk8/igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-rkl:          [SKIP][685] ([i915#14544] / [i915#9934]) -> [SKIP][686] ([i915#9934]) +1 other test skip
   [685]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-rkl-6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html
   [686]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-4/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-glk:          [INCOMPLETE][687] ([i915#12745] / [i915#13356] / [i915#17183] / [i915#4839]) -> [INCOMPLETE][688] ([i915#12745] / [i915#13356] / [i915#17183] / [i915#4839] / [i915#6113])
   [687]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-glk6/igt@kms_flip@flip-vs-suspend-interruptible.html
   [688]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk3/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-rkl:          [SKIP][689] ([i915#15643]) -> [SKIP][690] ([i915#14544] / [i915#15643]) +1 other test skip
   [689]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-rkl-5/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
   [690]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-wc:
    - shard-dg2:          [SKIP][691] ([i915#15104] / [i915#15990]) -> [SKIP][692] ([i915#16708]) +1 other test skip
   [691]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-wc.html
   [692]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2:          [SKIP][693] ([i915#16708] / [i915#5354]) -> [SKIP][694] ([i915#15990] / [i915#8708]) +13 other tests skip
   [693]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [694]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-rkl:          [SKIP][695] ([i915#14544] / [i915#17428] / [i915#1825]) -> [SKIP][696] ([i915#17428] / [i915#1825]) +1 other test skip
   [695]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [696]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-render:
    - shard-dg2:          [SKIP][697] ([i915#15989]) -> [SKIP][698] ([i915#16708]) +18 other tests skip
   [697]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-4/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-render.html
   [698]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-7/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-render:
    - shard-rkl:          [SKIP][699] ([i915#14544] / [i915#17428]) -> [SKIP][700] ([i915#17428]) +12 other tests skip
   [699]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-render.html
   [700]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-4/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbchdr-suspend:
    - shard-rkl:          [INCOMPLETE][701] ([i915#16056]) -> [SKIP][702] ([i915#15989])
   [701]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-suspend.html
   [702]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-4/igt@kms_frontbuffer_tracking@fbchdr-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-gtt:
    - shard-dg2:          [SKIP][703] ([i915#16708]) -> [SKIP][704] ([i915#15104] / [i915#15990]) +1 other test skip
   [703]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-gtt.html
   [704]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2:          [SKIP][705] ([i915#15990] / [i915#8708]) -> [SKIP][706] ([i915#16708] / [i915#5354]) +11 other tests skip
   [705]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [706]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render:
    - shard-dg2:          [SKIP][707] ([i915#16708] / [i915#5354]) -> [SKIP][708] ([i915#15991] / [i915#5354]) +29 other tests skip
   [707]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html
   [708]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-indfb-pgflip-blt:
    - shard-dg2:          [SKIP][709] ([i915#16708]) -> [SKIP][710] ([i915#15991]) +37 other tests skip
   [709]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-indfb-pgflip-blt.html
   [710]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-shrfb-fliptrack-mmap-gtt:
    - shard-dg2:          [SKIP][711] ([i915#15990]) -> [SKIP][712] ([i915#16708]) +24 other tests skip
   [711]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-shrfb-fliptrack-mmap-gtt.html
   [712]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-shrfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb101010-draw-mmap-cpu:
    - shard-dg2:          [SKIP][713] ([i915#16708]) -> [SKIP][714] ([i915#15102]) +21 other tests skip
   [713]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb101010-draw-mmap-cpu.html
   [714]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb101010-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4:
    - shard-rkl:          [SKIP][715] ([i915#5439]) -> [SKIP][716] ([i915#14544] / [i915#5439])
   [715]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4.html
   [716]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-linear:
    - shard-dg2:          [SKIP][717] ([i915#15102]) -> [SKIP][718] ([i915#16708]) +17 other tests skip
   [717]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-linear.html
   [718]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-linear.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-indfb-msflip-blt:
    - shard-dg2:          [SKIP][719] ([i915#16708]) -> [SKIP][720] ([i915#15989]) +14 other tests skip
   [719]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-7/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-indfb-msflip-blt.html
   [720]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-8/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg1:          [SKIP][721] ([i915#15990]) -> [SKIP][722] ([i915#15990] / [i915#4423])
   [721]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg1-17/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-indfb-draw-mmap-wc.html
   [722]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-18/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-rkl:          [SKIP][723] ([i915#17428]) -> [SKIP][724] ([i915#14544] / [i915#17428]) +27 other tests skip
   [723]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-rkl-5/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [724]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2:          [SKIP][725] ([i915#16708]) -> [SKIP][726] ([i915#15990]) +18 other tests skip
   [725]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-7/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [726]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-1/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-rkl:          [SKIP][727] ([i915#14544] / [i915#15102]) -> [SKIP][728] ([i915#15102]) +9 other tests skip
   [727]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html
   [728]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2:          [SKIP][729] ([i915#16708] / [i915#5354]) -> [SKIP][730] ([i915#15102]) +10 other tests skip
   [729]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html
   [730]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-rkl:          [SKIP][731] ([i915#17428] / [i915#1825]) -> [SKIP][732] ([i915#14544] / [i915#17428] / [i915#1825]) +2 other tests skip
   [731]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-rkl-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-gtt.html
   [732]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt:
    - shard-dg2:          [SKIP][733] ([i915#15991] / [i915#5354]) -> [SKIP][734] ([i915#16708] / [i915#5354]) +20 other tests skip
   [733]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt.html
   [734]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:
    - shard-dg2:          [SKIP][735] ([i915#15102]) -> [SKIP][736] ([i915#16708] / [i915#5354]) +16 other tests skip
   [735]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html
   [736]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@psr-suspend:
    - shard-rkl:          [SKIP][737] ([i915#15102]) -> [SKIP][738] ([i915#14544] / [i915#15102]) +9 other tests skip
   [737]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-rkl-8/igt@kms_frontbuffer_tracking@psr-suspend.html
   [738]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-suspend.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-pri-indfb-multidraw:
    - shard-dg2:          [SKIP][739] ([i915#15991]) -> [SKIP][740] ([i915#16708]) +32 other tests skip
   [739]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-5/igt@kms_frontbuffer_tracking@psrhdr-2p-pri-indfb-multidraw.html
   [740]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-7/igt@kms_frontbuffer_tracking@psrhdr-2p-pri-indfb-multidraw.html

  * igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery:
    - shard-rkl:          [ABORT][741] ([i915#15132]) -> [FAIL][742] ([i915#17122] / [i915#17137])
   [741]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-rkl-6/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html
   [742]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-2/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-dg2:          [SKIP][743] ([i915#12713] / [i915#16518]) -> [SKIP][744] ([i915#17356])
   [743]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-4/igt@kms_hdr@brightness-with-hdr.html
   [744]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-7/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-dg2:          [SKIP][745] ([i915#17356]) -> [SKIP][746] ([i915#16518] / [i915#3555] / [i915#8228])
   [745]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-7/igt@kms_hdr@invalid-metadata-sizes.html
   [746]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-4/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-dg2:          [SKIP][747] ([i915#16518] / [i915#3555] / [i915#8228]) -> [SKIP][748] ([i915#17356])
   [747]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-5/igt@kms_hdr@static-toggle-dpms.html
   [748]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-7/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-dg2:          [SKIP][749] ([i915#6301]) -> [SKIP][750] ([i915#17356])
   [749]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-6/igt@kms_panel_fitting@atomic-fastset.html
   [750]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-7/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-dg2:          [SKIP][751] ([i915#17356]) -> [SKIP][752] ([i915#13705])
   [751]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-7/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
   [752]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-1/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping:
    - shard-rkl:          [SKIP][753] ([i915#14544] / [i915#15709]) -> [SKIP][754] ([i915#15709]) +1 other test skip
   [753]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping.html
   [754]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-2/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping:
    - shard-rkl:          [SKIP][755] ([i915#15709]) -> [SKIP][756] ([i915#14544] / [i915#15709])
   [755]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-rkl-8/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping.html
   [756]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-dg2:          [SKIP][757] ([i915#17356]) -> [SKIP][758] ([i915#3555] / [i915#8821])
   [757]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-7/igt@kms_plane_lowres@tiling-yf.html
   [758]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-5/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-dg2:          [SKIP][759] ([i915#17356]) -> [SKIP][760] ([i915#13958])
   [759]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-7/igt@kms_plane_multiple@2x-tiling-4.html
   [760]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-1/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-dg2:          [SKIP][761] ([i915#13958]) -> [SKIP][762] ([i915#17356])
   [761]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-1/igt@kms_plane_multiple@2x-tiling-none.html
   [762]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-7/igt@kms_plane_multiple@2x-tiling-none.html
    - shard-rkl:          [SKIP][763] ([i915#13958]) -> [SKIP][764] ([i915#13958] / [i915#14544])
   [763]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-rkl-8/igt@kms_plane_multiple@2x-tiling-none.html
   [764]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-6/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-dg2:          [SKIP][765] ([i915#17356]) -> [SKIP][766] ([i915#14259])
   [765]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-7/igt@kms_plane_multiple@tiling-y.html
   [766]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-4/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-rkl:          [SKIP][767] ([i915#12343] / [i915#14544] / [i915#5354]) -> [SKIP][768] ([i915#12343] / [i915#5354])
   [767]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-rkl-6/igt@kms_pm_backlight@basic-brightness.html
   [768]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-4/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_rpm@pc8-residency:
    - shard-rkl:          [SKIP][769] ([i915#17434] / [i915#17450]) -> [SKIP][770] ([i915#14544] / [i915#17434] / [i915#17450])
   [769]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-rkl-8/igt@kms_pm_rpm@pc8-residency.html
   [770]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-6/igt@kms_pm_rpm@pc8-residency.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:
    - shard-rkl:          [SKIP][771] ([i915#11520]) -> [SKIP][772] ([i915#11520] / [i915#14544]) +6 other tests skip
   [771]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-rkl-8/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html
   [772]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-6/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@pr-cursor-plane-update-sf:
    - shard-rkl:          [SKIP][773] ([i915#11520] / [i915#14544]) -> [SKIP][774] ([i915#11520])
   [773]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-rkl-6/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html
   [774]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-2/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html

  * igt@kms_psr@psr2-cursor-mmap-gtt:
    - shard-rkl:          [SKIP][775] ([i915#1072] / [i915#14544] / [i915#9732]) -> [SKIP][776] ([i915#1072] / [i915#9732]) +6 other tests skip
   [775]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-rkl-6/igt@kms_psr@psr2-cursor-mmap-gtt.html
   [776]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-4/igt@kms_psr@psr2-cursor-mmap-gtt.html

  * igt@kms_psr@psr2-primary-mmap-gtt:
    - shard-rkl:          [SKIP][777] ([i915#1072] / [i915#9732]) -> [SKIP][778] ([i915#1072] / [i915#14544] / [i915#9732]) +6 other tests skip
   [777]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-rkl-5/igt@kms_psr@psr2-primary-mmap-gtt.html
   [778]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-6/igt@kms_psr@psr2-primary-mmap-gtt.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-rkl:          [SKIP][779] ([i915#15949]) -> [SKIP][780] ([i915#14544] / [i915#15949])
   [779]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-rkl-8/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [780]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-dg2:          [SKIP][781] ([i915#17356]) -> [SKIP][782] ([i915#12755] / [i915#15867]) +1 other test skip
   [781]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-7/igt@kms_rotation_crc@bad-tiling.html
   [782]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-5/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@exhaust-fences:
    - shard-dg2:          [SKIP][783] ([i915#4235]) -> [SKIP][784] ([i915#17356])
   [783]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-6/igt@kms_rotation_crc@exhaust-fences.html
   [784]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-7/igt@kms_rotation_crc@exhaust-fences.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-dg2:          [SKIP][785] ([i915#5190]) -> [SKIP][786] ([i915#17356] / [i915#5190])
   [785]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
   [786]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-dg2:          [SKIP][787] ([i915#12755] / [i915#15867]) -> [SKIP][788] ([i915#17356])
   [787]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-4/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
   [788]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-7/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2:          [SKIP][789] ([i915#8623]) -> [SKIP][790] ([i915#17356])
   [789]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-6/igt@kms_tiled_display@basic-test-pattern.html
   [790]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-7/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-rkl:          [SKIP][791] ([i915#14544] / [i915#8623]) -> [SKIP][792] ([i915#8623])
   [791]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-rkl-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [792]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@flipline:
    - shard-dg2:          [SKIP][793] ([i915#15243] / [i915#3555]) -> [SKIP][794] ([i915#17356])
   [793]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-5/igt@kms_vrr@flipline.html
   [794]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-7/igt@kms_vrr@flipline.html

  * igt@kms_vrr@max-min:
    - shard-dg2:          [SKIP][795] ([i915#17356]) -> [SKIP][796] ([i915#9906])
   [795]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-dg2-7/igt@kms_vrr@max-min.html
   [796]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-4/igt@kms_vrr@max-min.html

  * igt@prime_udl@share-import:
    - shard-rkl:          [SKIP][797] ([i915#16420]) -> [SKIP][798] ([i915#14544] / [i915#16420])
   [797]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-rkl-8/igt@prime_udl@share-import.html
   [798]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-6/igt@prime_udl@share-import.html

  * igt@prime_vgem@basic-write:
    - shard-rkl:          [SKIP][799] ([i915#14544] / [i915#17448] / [i915#3291] / [i915#3708]) -> [SKIP][800] ([i915#17448] / [i915#3291] / [i915#3708])
   [799]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19420/shard-rkl-6/igt@prime_vgem@basic-write.html
   [800]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-2/igt@prime_vgem@basic-write.html

  
  [i915#10056]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10056
  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#11078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078
  [i915#11151]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151
  [i915#11190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#11521]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11521
  [i915#11527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11527
  [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
  [i915#12193]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12193
  [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
  [i915#12314]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12314
  [i915#12343]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343
  [i915#12454]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12454
  [i915#12655]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655
  [i915#12712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12712
  [i915#12713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713
  [i915#12745]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745
  [i915#12755]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755
  [i915#12756]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12756
  [i915#12805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805
  [i915#12964]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964
  [i915#13046]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046
  [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
  [i915#13179]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179
  [i915#13356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356
  [i915#13409]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13409
  [i915#13476]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13476
  [i915#13520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13520
  [i915#13566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566
  [i915#13691]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13691
  [i915#13705]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13705
  [i915#13707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707
  [i915#13748]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748
  [i915#13786]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13786
  [i915#13958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958
  [i915#14073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073
  [i915#14098]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098
  [i915#14121]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14121
  [i915#14259]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259
  [i915#14419]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14419
  [i915#14544]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544
  [i915#14600]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14600
  [i915#14712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712
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
  [i915#15347]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15347
  [i915#15458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458
  [i915#15459]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459
  [i915#15460]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460
  [i915#15479]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15479
  [i915#15529]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15529
  [i915#15542]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15542
  [i915#15582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582
  [i915#15643]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643
  [i915#15709]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709
  [i915#15733]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15733
  [i915#15865]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865
  [i915#15867]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867
  [i915#15948]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948
  [i915#15949]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15949
  [i915#15989]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989
  [i915#15990]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990
  [i915#15991]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991
  [i915#16017]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16017
  [i915#16056]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16056
  [i915#16079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16079
  [i915#16080]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16080
  [i915#16081]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081
  [i915#16109]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16109
  [i915#16112]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16112
  [i915#16166]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16166
  [i915#16276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16276
  [i915#16348]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16348
  [i915#16361]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361
  [i915#16386]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16386
  [i915#16420]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16420
  [i915#16466]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16466
  [i915#16471]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471
  [i915#16479]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16479
  [i915#16518]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16518
  [i915#16593]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16593
  [i915#16599]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16599
  [i915#16600]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16600
  [i915#16604]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16604
  [i915#16644]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644
  [i915#16708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708
  [i915#16746]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16746
  [i915#16789]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16789
  [i915#16867]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16867
  [i915#16871]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16871
  [i915#16914]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16914
  [i915#16938]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16938
  [i915#16943]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16943
  [i915#16990]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16990
  [i915#16996]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16996
  [i915#17037]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17037
  [i915#17102]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17102
  [i915#17122]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17122
  [i915#17133]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17133
  [i915#17137]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17137
  [i915#17150]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17150
  [i915#17183]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17183
  [i915#17190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17190
  [i915#17285]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17285
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
  [i915#17431]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17431
  [i915#17432]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17432
  [i915#17434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17434
  [i915#17445]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17445
  [i915#17446]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17446
  [i915#17447]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17447
  [i915#17448]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17448
  [i915#17450]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17450
  [i915#17454]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17454
  [i915#17455]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17455
  [i915#17457]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17457
  [i915#17458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17458
  [i915#17462]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17462
  [i915#17463]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17463
  [i915#17467]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17467
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
  [i915#17495]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17495
  [i915#17496]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17496
  [i915#17497]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17497
  [i915#17498]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17498
  [i915#17500]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17500
  [i915#17503]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17503
  [i915#17504]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17504
  [i915#17507]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17507
  [i915#17508]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17508
  [i915#17510]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17510
  [i915#17517]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17517
  [i915#17520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17520
  [i915#17521]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17521
  [i915#17522]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17522
  [i915#17524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17524
  [i915#17525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17525
  [i915#17526]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17526
  [i915#17527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17527
  [i915#17530]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17530
  [i915#17533]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17533
  [i915#17536]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17536
  [i915#17537]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17537
  [i915#17546]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17546
  [i915#17547]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17547
  [i915#17550]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17550
  [i915#17551]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17551
  [i915#17553]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17553
  [i915#17554]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17554
  [i915#17556]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17556
  [i915#17559]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17559
  [i915#17560]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17560
  [i915#17562]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17562
  [i915#17567]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17567
  [i915#17577]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17577
  [i915#17601]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17601
  [i915#17680]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17680
  [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
  [i915#17697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17697
  [i915#17712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17712
  [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
  [i915#1849]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849
  [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
  [i915#2436]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2436
  [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
  [i915#2582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582
  [i915#280]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280
  [i915#284]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284
  [i915#2856]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
  [i915#3116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299
  [i915#3539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
  [i915#3547]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3547
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#3711]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3711
  [i915#3742]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
  [i915#3828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
  [i915#4235]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4235
  [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
  [i915#4349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349
  [i915#4387]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387
  [i915#4391]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4391
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
  [i915#5138]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#5439]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439
  [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
  [i915#6113]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113
  [i915#6245]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245
  [i915#6301]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301
  [i915#6334]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334
  [i915#6335]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335
  [i915#6524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
  [i915#658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658
  [i915#6590]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6590
  [i915#6621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621
  [i915#6953]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953
  [i915#7443]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7443
  [i915#7697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697
  [i915#7707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707
  [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
  [i915#7975]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7975
  [i915#7984]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984
  [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
  [i915#8381]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381
  [i915#8399]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399
  [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
  [i915#8430]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430
  [i915#8516]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516
  [i915#8555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555
  [i915#8623]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623
  [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
  [i915#8812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8812
  [i915#8813]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813
  [i915#8821]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8821
  [i915#8825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825
  [i915#9067]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067
  [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
  [i915#9423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423
  [i915#9683]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683
  [i915#9685]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685
  [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
  [i915#9723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9833]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9833
  [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
  [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934


Build changes
-------------

  * Linux: CI_DRM_19420 -> Patchwork_177288v1

  CI-20190529: 20190529
  CI_DRM_19420: 238c1e3e984e2b7f948cb24165314b8d719a23d6 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_9172: 9172
  Patchwork_177288v1: 238c1e3e984e2b7f948cb24165314b8d719a23d6 @ git://anongit.freedesktop.org/gfx-ci/linux
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/index.html

--===============2468647568430443190==
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
<tr><td><b>Series:</b></td><td>drm/i915/vrr: HDMI 2.1 VRR support</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/177288/">https://patchwork.freedesktop.org/series/177288/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/Patchwork_177288v1/index.html">https://intel-gfx-ci.01.org/tre=
e/drm-tip/Patchwork_177288v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_19420_full -&gt; Patchwork_177288v=
1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with Patchwork_177288v1_full absolutely n=
eed to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in Patchwork_177288v1_full, please notify your bug team (I915-=
ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (11 -&gt; 10)</h2>
<p>Missing    (1): pig-kbl-iris </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in Patchwork_=
177288v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-mtlp-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-c=
cs@pipe-c-edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-mtlp-4/igt@kms_ccs@crc-primary-suspe=
nd-4-tiled-mtl-rc-ccs@pipe-c-edp-1.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk10/igt@kms_tiled_display@basic-te=
st-pattern.html">SKIP</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_dp_link_training@non-uhbr-mst-direct-train:<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-tglu-9/igt@kms_dp_link_training@non-uhbr-mst-direct-tra=
in.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17287">i915#17287</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/Patchwork_177288v1/shard-tglu-10/igt@kms_dp_link_training@=
non-uhbr-mst-direct-train.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_177288v1_full that come from kno=
wn issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-reloc-purge-cache:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-rkl-4/igt@api_intel_bb@blit-reloc-pu=
rge-cache.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/8411">i915#8411</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@object-reloc-keep-cache:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-dg1-15/igt@api_intel_bb@object-reloc=
-keep-cache.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@device_reset@cold-reset-bound:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-tglu-5/igt@device_reset@cold-reset-b=
ound.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/11078">i915#11078</a>)</li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-cold-reset-rebind:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk11/igt@device_reset@unbind-cold-r=
eset-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/17537">i915#17537</a>)</li>
</ul>
</li>
<li>
<p>igt@dmabuf@dma-buf-fence-chain:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk10/igt@dmabuf@dma-buf-fence-chain=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17712">i915#17712</a>)</li>
</ul>
</li>
<li>
<p>igt@drm_read@short-buffer-nonblock:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-6/igt@drm_read@short-buffer-nonblock.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288=
v1/shard-dg2-7/igt@drm_read@short-buffer-nonblock.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17359">i915#173=
59</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-4/igt@fbdev@info.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-7/igt@f=
bdev@info.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/1849">i915#1849</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/2582">i915#2582</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_basic@multigpu-create-close:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-dg1-16/igt@gem_basic@multigpu-create=
-close.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/7697">i915#7697</a>)</li>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk10/igt@gem_basic@multigpu-create-=
close.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/17697">i915#17697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-compressed:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-tglu-5/igt@gem_ccs@block-multicopy-c=
ompressed.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-rkl-3/igt@gem_ccs@ctrl-surf-copy.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/9323">i915#9323</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-dg1-15/igt@gem_ccs@ctrl-surf-copy.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-8/igt@gem_ccs@suspend-resume.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard=
-dg2-1/igt@gem_ccs@suspend-resume.html">INCOMPLETE</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16348">i915=
#16348</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-set-pat:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk9/igt@gem_create@create-ext-set-p=
at.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17530">i915#17530</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@bcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk5/igt@gem_ctx_isolation@preservat=
ion-s3@bcs0.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/16466">i915#16466</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-hang@bcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk8/igt@gem_ctx_persistence@engines=
-hang@bcs0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17527">i915#17527</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-close:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-dg1-16/igt@gem_ctx_persistence@heart=
beat-close.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/8555">i915#8555</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@engines:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk11/igt@gem_ctx_sseu@engines.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/17496">i915#17496</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-tglu-1/igt@gem_ctx_sseu@engines.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-sseu:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-rkl-8/igt@gem_ctx_sseu@invalid-sseu.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-mtlp-5/igt@gem_eio@in-flight-suspend=
.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17190">i915#17190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@suspend:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg1-19/igt@gem_eio@suspend.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-1=
5/igt@gem_eio@suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/4391">i915#4391</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-pair:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-dg1-19/igt@gem_exec_balancer@bonded-=
pair.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/4771">i915#4771</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-balancer:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-rkl-3/igt@gem_exec_balancer@parallel=
-balancer.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/4525">i915#4525</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-bb-first:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-tglu-1/igt@gem_exec_balancer@paralle=
l-bb-first.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/4525">i915#4525</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-contexts:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk9/igt@gem_exec_balancer@parallel-=
contexts.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17547">i915#17547</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_big@single:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-rkl-8/igt@gem_exec_big@single.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rk=
l-6/igt@gem_exec_big@single.html">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/16604">i915#16604</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible@smem0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-rkl-3/igt@gem_exec_capture@capture-i=
nvisible@smem0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/6334">i915#6334</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-cmd:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-tglu-1/igt@gem_exec_flush@basic-batc=
h-kernel-default-cmd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/3711">i915#3711</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-prw-default:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-dg1-19/igt@gem_exec_flush@basic-wb-p=
rw-default.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3539">i915#3539</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/4852">i915#4852</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@gem_exec_params@larger-than-life-batch:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk8/igt@gem_exec_params@larger-than=
-life-batch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/16871">i915#16871</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-root:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-rkl-3/igt@gem_exec_params@secure-non=
-root.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/17416">i915#17416</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-dg1-15/igt@gem_exec_params@secure-no=
n-root.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17416">i915#17416</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-gtt-noreloc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-dg1-18/igt@gem_exec_reloc@basic-cpu-=
gtt-noreloc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/3281">i915#3281</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read-noreloc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-rkl-7/igt@gem_exec_reloc@basic-write=
-read-noreloc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/3281">i915#3281</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@semaphore-power:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-dg1-19/igt@gem_exec_schedule@semapho=
re-power.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-6/igt@gem_exec_suspend@basic-s0.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/sh=
ard-dg2-6/igt@gem_exec_suspend@basic-s0.html">INCOMPLETE</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>=
) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s4-devices:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-rkl-8/igt@gem_exec_suspend@basic-s4-devices.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177=
288v1/shard-rkl-1/igt@gem_exec_suspend@basic-s4-devices.html">ABORT</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15542">i91=
5#15542</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/7975">i915#7975</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-dg1-16/igt@gem_fenced_exec_thrash@no=
-spare-fences.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/4860">i915#4860</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-tglu-5/igt@gem_huc_copy@huc-copy.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk9/igt@gem_lmem_swapping@heavy-ver=
ify-multi.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17503">i915#17503</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-dg1-16/igt@gem_lmem_swapping@heavy-v=
erify-random-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/12193">i915#12193</a>)</li>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk10/igt@gem_lmem_swapping@heavy-ve=
rify-random-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/17503">i915#17503</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-dg1-16/igt@gem_lmem_swapping@heavy-v=
erify-random-ccs@lmem0.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/4565">i915#4565</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-rkl-4/igt@gem_lmem_swapping@parallel=
-random.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/4613">i915#4613</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random-engines:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-tglu-1/igt@gem_lmem_swapping@random-=
engines.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-tglu-5/igt@gem_lmem_swapping@verify-=
random.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-rkl-7/igt@gem_media_vme.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284"=
>i915#284</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@coherency:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-tglu-1/igt@gem_mmap_gtt@coherency.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17429">i915#17429</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-medium-copy-xy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-dg1-15/igt@gem_mmap_gtt@cpuset-mediu=
m-copy-xy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/4077">i915#4077</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write-wc-read-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-dg1-15/igt@gem_mmap_wc@write-wc-read=
-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/4083">i915#4083</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-uncached:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-rkl-4/igt@gem_partial_pwrite_pread@w=
rites-after-reads-uncached.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +4 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@fail-invalid-protected-context:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk9/igt@gem_pxp@fail-invalid-protec=
ted-context.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/17521">i915#17521</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@protected-encrypted-src-copy-not-readible:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-rkl-4/igt@gem_pxp@protected-encrypte=
d-src-copy-not-readible.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/4270">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-1:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-dg1-16/igt@gem_pxp@reject-modify-con=
text-protection-off-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/4270">i915#4270</a>)</li>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk10/igt@gem_pxp@reject-modify-cont=
ext-protection-off-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/17521">i915#17521</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_readwrite@beyond-eob:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-dg1-16/igt@gem_readwrite@beyond-eob.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3282">i915#3282</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-to-vebox-linear:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk8/igt@gem_render_copy@yf-tiled-to=
-vebox-linear.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/17492">i915#17492</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-dg1-18/igt@gem_set_tiling_vs_gtt.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/4079">i915#4079</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk9/igt@gem_softpin@evict-snoop.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17551">i915#17551</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-unsync:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-tglu-1/igt@gem_userptr_blits@coheren=
cy-unsync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/3297">i915#3297</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-mtlp-5/igt@gem_userptr_blits@dmabuf-=
sync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-dg1-19/igt@gem_userptr_blits@map-fix=
ed-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/3297">i915#3297</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/4880">i915#4880</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@relocations:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-dg1-16/igt@gem_userptr_blits@relocat=
ions.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3281">i915#3281</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk10/igt@gem_userptr_blits@relocati=
ons.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17507">i915#17507</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@sd-probe:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-dg1-19/igt@gem_userptr_blits@sd-prob=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3297">i915#3297</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/4958">i915#4958</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-dg1-18/igt@gem_userptr_blits@unsync-=
unmap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-after-close:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-rkl-4/igt@gem_userptr_blits@unsync-u=
nmap-after-close.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/3297">i915#3297</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-rkl-5/igt@gem_workarounds@suspend-resume.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288=
v1/shard-rkl-6/igt@gem_workarounds@suspend-resume.html">INCOMPLETE</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915=
#13356</a>)</li>
</ul>
</li>
<li>
<p>igt@gen3_render_mixed_blits:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-rkl-7/igt@gen3_render_mixed_blits.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17455">i915#17455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@bitmasks:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-dg1-19/igt@gen7_exec_parse@bitmasks.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17455">i915#17455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@cmd-crossing-page:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-tglu-1/igt@gen7_exec_parse@cmd-cross=
ing-page.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17455">i915#17455</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-tglu-5/igt@gen9_exec_parse@allowed-a=
ll.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/2527">i915#2527</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-oversize:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-rkl-4/igt@gen9_exec_parse@bb-oversiz=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/2527">i915#2527</a>) +3 other tests skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-tglu-1/igt@gen9_exec_parse@bb-oversi=
ze.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/2527">i915#2527</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@cmd-crossing-page:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-dg1-15/igt@gen9_exec_parse@cmd-cross=
ing-page.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/2527">i915#2527</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-check-all:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-dg1-19/igt@i915_drm_fdinfo@busy-chec=
k-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/11527">i915#11527</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy@rcs0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-dg1-18/igt@i915_drm_fdinfo@busy@rcs0=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/14073">i915#14073</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_fb_tiling@basic-x-tiling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-dg1-15/igt@i915_fb_tiling@basic-x-ti=
ling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/13786">i915#13786</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@__uc_init:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-rkl-4/igt@i915_module_load@fault-inj=
ection@__uc_init.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/15479">i915#15479</a>) +4 other tests skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-tglu-1/igt@i915_module_load@fault-in=
jection@__uc_init.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/15479">i915#15479</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@intel_connector_register:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-rkl-4/igt@i915_module_load@fault-inj=
ection@intel_connector_register.html">ABORT</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15342">i915#15342</a>) +1 other te=
st abort</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-tglu-1/igt@i915_module_load@fault-in=
jection@intel_connector_register.html">ABORT</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15342">i915#15342</a>) +1 other t=
est abort</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-no-display:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-tglu-5/igt@i915_module_load@reload-no-display.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_1=
77288v1/shard-tglu-3/igt@i915_module_load@reload-no-display.html">ABORT</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16996"=
>i915#16996</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-reset:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-tglu-1/igt@i915_pm_freq_api@freq-res=
et.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/8399">i915#8399</a>)</li>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk11/igt@i915_pm_freq_api@freq-rese=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17526">i915#17526</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-reset-multiple:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-rkl-2/igt@i915_pm_freq_api@freq-rese=
t-multiple.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/8399">i915#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-tglu-5/igt@i915_pm_freq_api@freq-sus=
pend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/8399">i915#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_mult@media-freq@gt1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-mtlp-5/igt@i915_pm_freq_mult@media-f=
req@gt1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/6590">i915#6590</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@media-rc6-accuracy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-dg1-18/igt@i915_pm_rc6_residency@med=
ia-rc6-accuracy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/16080">i915#16080</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/16166">i915#16166</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-accuracy:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-7/igt@i915_pm_rc6_residency@rc6-accuracy.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17=
7288v1/shard-dg2-5/igt@i915_pm_rc6_residency@rc6-accuracy.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i9=
15#12964</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@min-max-config-idle:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-dg1-15/igt@i915_pm_rps@min-max-confi=
g-idle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/11681">i915#11681</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/6621">i915#6621</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds-idle-park:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-dg1-18/igt@i915_pm_rps@thresholds-id=
le-park.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/11681">i915#11681</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-dg1-16/igt@i915_pm_sseu@full-enable.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/4387">i915#4387</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_power@sanity:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-mtlp-3/igt@i915_power@sanity.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-mtl=
p-2/igt@i915_power@sanity.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/7984">i915#7984</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@hwconfig_table:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-rkl-2/igt@i915_query@hwconfig_table.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/6245">i915#6245</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-known-pci-ids:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-dg1-15/igt@i915_query@query-topology=
-known-pci-ids.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/16109">i915#16109</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-rkl-3/igt@i915_query@query-topology-=
known-pci-ids.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/16109">i915#16109</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-unsupported:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-tglu-1/igt@i915_query@query-topology=
-unsupported.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/16079">i915#16079</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-tglu-1/igt@i915_suspend@basic-s3-wit=
hout-i915.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/4817">i915#4817</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/7443">i915#7443</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-untiled:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-rkl-2/igt@i915_suspend@fence-restore-untiled.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17=
7288v1/shard-rkl-3/igt@i915_suspend@fence-restore-untiled.html">INCOMPLETE<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/481=
7">i915#4817</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-rkl-7/igt@intel_hwmon@hwmon-read.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/7707">i915#7707</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-x-tiled-legacy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-dg1-19/igt@kms_addfb_basic@basic-x-t=
iled-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/4212">i915#4212</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-tglu-5/igt@kms_addfb_basic@invalid-s=
mem-bo-on-discrete.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/12454">i915#12454</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/12712">i915#12712</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk10/igt@kms_async_flips@async-flip=
-with-page-flip-events-linear-atomic.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/17562">i915#17562</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk8/igt@kms_atomic@plane-primary-ov=
erlay-mutable-zpos.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/17485">i915#17485</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-rkl-3/igt@kms_atomic_transition@plan=
e-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555=
">i915#3555</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-dg1-15/igt@kms_atomic_transition@pla=
ne-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3=
555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:<=
/p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk11/igt@kms_atomic_transition@plan=
e-all-modeset-transition-internal-panels.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-tglu-1/igt@kms_big_fb@4-tiled-addfb.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/5286">i915#5286</a>)</li>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk11/igt@kms_big_fb@4-tiled-addfb.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17556">i915#17556</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-dg1-19/igt@kms_big_fb@4-tiled-addfb-=
size-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-tglu-5/igt@kms_big_fb@4-tiled-max-hw=
-stride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/17432">i915#17432</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-rkl-7/igt@kms_big_fb@4-tiled-max-hw-=
stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +5 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-dg1-16/igt@kms_big_fb@4-tiled-max-hw=
-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286=
</a>) +3 other tests skip</li>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk10/igt@kms_big_fb@4-tiled-max-hw-=
stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/17478">i915#17478</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-mtlp-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotat=
e-0-hflip.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/Patchwork_177288v1/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-strid=
e-64bpp-rotate-0-hflip.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/15733">i915#15733</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/5138">i915#5138</a>) +1 othe=
r test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-tglu-1/igt@kms_big_fb@linear-16bpp-r=
otate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17431">i915#17431</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-dg1-18/igt@kms_big_fb@linear-64bpp-r=
otate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/3638">i915#3638</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-dg1-18/igt@kms_big_fb@linear-max-hw-=
stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk11/igt@kms_big_fb@linear-max-hw-s=
tride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/17524">i915#17524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk8/igt@kms_big_fb@linear-max-hw-st=
ride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/17524">i915#17524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk10/igt@kms_big_fb@x-tiled-8bpp-ro=
tate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17500">i915#17500</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-tglu-5/igt@kms_big_fb@x-tiled-8bpp-r=
otate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17431">i915#17431</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk11/igt@kms_big_fb@x-tiled-max-hw-=
stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/17500">i915#17500</a>) +1 ot=
her test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-rkl-3/igt@kms_big_fb@y-tiled-8bpp-ro=
tate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/17431">i915#17431</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-dg1-16/igt@kms_big_fb@yf-tiled-32bpp=
-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/4538">i915#4538</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk9/igt@kms_big_fb@yf-tiled-64bpp-r=
otate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17478">i915#17478</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-rkl-4/igt@kms_big_fb@yf-tiled-64bpp-=
rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/4538">i915#4538</a>) +3 other tests skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-tglu-1/igt@kms_big_fb@yf-tiled-64bpp=
-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17432">i915#17432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-dg1-15/igt@kms_big_fb@yf-tiled-addfb=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17432">i915#17432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-rkl-8/igt@kms_big_fb@yf-tiled-addfb-=
size-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/17432">i915#17432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</=
p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-tglu-5/igt@kms_big_fb@yf-tiled-max-h=
w-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/17432">i915#17432</a>) +1 =
other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-mtlp-5/igt@kms_big_fb@yf-tiled-max-h=
w-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/17432">i915#17432</a>) +1 othe=
r test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk11/igt@kms_big_fb@yf-tiled-max-hw=
-stride-64bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/17478">i915#17478</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-tglu-1/igt@kms_ccs@bad-aux-stride-y-=
tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/6095">i915#6095</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk11/igt@kms_ccs@bad-aux-stride-y-t=
iled-gen12-mc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/17490">i915#17490</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17491">i915#174=
91</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk9/igt@kms_ccs@bad-rotation-90-4-t=
iled-dg2-mc-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/17491">i915#17491</a>) +31 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk10/igt@kms_ccs@bad-rotation-90-4-=
tiled-mtl-mc-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/17491">i915#17491</a>) +19 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-rkl-7/igt@kms_ccs@bad-rotation-90-4-=
tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +57 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-rkl-6/igt@kms_ccs@bad-rotation-90-y-=
tiled-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i91=
5#6095</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-tglu-5/igt@kms_ccs@crc-primary-basic=
-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk11/igt@kms_ccs@crc-primary-basic-=
4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/17491">i915#17491</a>) +13 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a=
-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-dg2-4/igt@kms_ccs@crc-primary-rotati=
on-180-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434"=
>i915#10434</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/6095">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-3:=
</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-dg2-8/igt@kms_ccs@crc-primary-rotati=
on-180-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-3.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i91=
5#6095</a>) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-rkl-4/igt@kms_ccs@crc-primary-suspen=
d-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/12805">i915#12805</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-tglu-1/igt@kms_ccs@crc-primary-suspe=
nd-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/12805">i915#12805</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1:</=
p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-tglu-5/igt@kms_ccs@crc-primary-suspe=
nd-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +29 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk9/igt@kms_ccs@crc-primary-suspend=
-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/17525">i915#17525</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk10/igt@kms_ccs@crc-primary-suspen=
d-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/17490">i915#17490</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/17491">i915#17491</a>) +7 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1:</=
p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-dg1-15/igt@kms_ccs@crc-primary-suspe=
nd-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +121 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-2:</=
p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk8/igt@kms_ccs@crc-primary-suspend=
-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/17490">i915#17490</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17491">i915#=
17491</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-dg2-1/igt@kms_ccs@crc-primary-suspen=
d-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-3.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +7 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-mtlp-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-c=
cs@pipe-d-edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-mtlp-4/igt@kms_ccs@crc-primary-suspe=
nd-4-tiled-mtl-rc-ccs@pipe-d-edp-1.html">INCOMPLETE</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582">i915#15582</a>) +2 =
other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk11/igt@kms_ccs@crc-primary-suspen=
d-y-tiled-ccs@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582">i915#155=
82</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-tglu-1/igt@kms_ccs@crc-sprite-planes=
-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-rkl-4/igt@kms_ccs@random-ccs-data-4-=
tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-rkl-4/igt@kms_ccs@random-ccs-data-4-=
tiled-dg2-mc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a=
>) +40 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-=
tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095=
</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-rkl-3/igt@kms_cdclk@mode-transition.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3742">i915#3742</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-dg1-15/igt@kms_cdclk@mode-transition=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/3742">i915#3742</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk10/igt@kms_cdclk@mode-transition-=
all-outputs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/17550">i915#17550</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio-after-suspend:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-dg1-18/igt@kms_chamelium_audio@dp-au=
dio-after-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/11151">i915#11151</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk8/igt@kms_chamelium_audio@hdmi-au=
dio.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17483">i915#17483</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-edid:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-tglu-5/igt@kms_chamelium_audio@hdmi-=
audio-edid.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +4 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-rkl-7/igt@kms_chamelium_color@ctm-gr=
een-to-red.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17427">i915#17427</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk10/igt@kms_chamelium_color@ctm-li=
mited-range.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/17489">i915#17489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-dg1-15/igt@kms_chamelium_color@ctm-n=
egative.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/17427">i915#17427</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk8/igt@kms_chamelium_color@degamma=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17489">i915#17489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-ctm3x4:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk11/igt@kms_chamelium_color_pipeli=
ne@plane-ctm3x4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/17497">i915#17497</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-tglu-5/igt@kms_chamelium_color_pipel=
ine@plane-ctm3x4-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/16471">i915#16471</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim:<=
/p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-tglu-5/igt@kms_chamelium_color_pipel=
ine@plane-fixed-matrix-yuv-rgb-bt2020-lim.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lu=
t1d:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-tglu-1/igt@kms_chamelium_color_pipel=
ine@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a=
>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d:=
</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk9/igt@kms_chamelium_color_pipelin=
e@plane-fixed-matrix-yuv-rgb-bt709-lut1d.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/17497">i915#17497</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-dg1-18/igt@kms_chamelium_color_pipel=
ine@plane-lut1d-ctm3x4-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>)=
 +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-rkl-4/igt@kms_chamelium_color_pipeli=
ne@plane-lut1d-pre-ctm3x4.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) +1=
 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut3d-green-only:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-tglu-1/igt@kms_chamelium_color_pipel=
ine@plane-lut3d-green-only.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) +=
1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-frame-dump:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk10/igt@kms_chamelium_frames@hdmi-=
frame-dump.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17483">i915#17483</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-after-runtime-suspend-d3hot:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk11/igt@kms_chamelium_hpd@dp-hpd-a=
fter-runtime-suspend-d3hot.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/17483">i915#17483</a>) +2 other tests sk=
ip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-tglu-1/igt@kms_chamelium_hpd@dp-hpd-=
after-runtime-suspend-d3hot.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-rkl-3/igt@kms_chamelium_hpd@dp-hpd-e=
nable-disable-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +9 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm-disable:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-tglu-1/igt@kms_chamelium_hpd@dp-hpd-=
storm-disable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +4 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-fast:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-dg1-19/igt@kms_chamelium_hpd@vga-hpd=
-fast.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@background-color:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk10/igt@kms_color@background-color=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17133">i915#17133</a>) +3 other tests fail</li>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-6/igt@kms_color@background-color.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/s=
hard-dg2-7/igt@kms_color@background-color.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/17373">i915#17373</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_color@degamma:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-4/igt@kms_color@degamma.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-=
7/igt@kms_color@degamma.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/12655">i915#12655</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/17373">i915#17373</a>) +1 o=
ther test skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk11/igt@kms_color_pipeline@plane-f=
ixed-matrix-yuv-rgb-bt601.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/17510">i915#17510</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-a-plane-4:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-rkl-3/igt@kms_color_pipeline@plane-l=
ut1d-ctm3x4-lut1d@pipe-a-plane-4.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/16990">i915#16990</a>) +5 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-b-plane-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-dg1-19/igt@kms_color_pipeline@plane-=
lut1d-lut1d@pipe-b-plane-4.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/16990">i915#16990</a>) +63 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-post-ctm3x4:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-6/igt@kms_color_pipeline@plane-lut1d-post-ctm3x4.ht=
ml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patc=
hwork_177288v1/shard-dg2-7/igt@kms_color_pipeline@plane-lut1d-post-ctm3x4.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/15529">i915#15529</a>) +1 other test skip</li>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk10/igt@kms_color_pipeline@plane-l=
ut1d-post-ctm3x4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/17510">i915#17510</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-b-plane-4:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-dg2-5/igt@kms_color_pipeline@plane-l=
ut1d-pre-ctm3x4@pipe-b-plane-4.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/16990">i915#16990</a>) +15 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-d-plane-4:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-tglu-1/igt@kms_color_pipeline@plane-=
lut1d-pre-ctm3x4@pipe-d-plane-4.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/16990">i915#16990</a>) +15 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-rkl-7/igt@kms_content_protection@ato=
mic-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/15865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk9/igt@kms_content_protection@cont=
ent-type-change.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/17508">i915#17508</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-rkl-3/igt@kms_content_protection@dp-=
mst-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/15330">i915#15330</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-hdcp14:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-rkl-3/igt@kms_content_protection@dp-=
mst-type-0-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/15330">i915#15330</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-dg1-15/igt@kms_content_protection@dp=
-mst-type-0-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-suspend-resume:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-tglu-5/igt@kms_content_protection@dp=
-mst-type-0-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-dg1-18/igt@kms_content_protection@li=
c-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/15865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-tglu-5/igt@kms_content_protection@sr=
m.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/15865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-tglu-1/igt@kms_content_protection@ue=
vent.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/15865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-rkl-3/igt@kms_cursor_crc@cursor-offs=
creen-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/13049">i915#13049</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-dg1-15/igt@kms_cursor_crc@cursor-off=
screen-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/13049">i915#13049</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x42:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-tglu-1/igt@kms_cursor_crc@cursor-ons=
creen-128x42.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/13566">i915#13566</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x32:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-tglu-1/igt@kms_cursor_crc@cursor-ons=
creen-32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/3555">i915#3555</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-rkl-8/igt@kms_cursor_crc@cursor-rand=
om-256x85@pipe-a-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +3 other tests fai=
l</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x10:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-tglu-5/igt@kms_cursor_crc@cursor-ran=
dom-32x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-tglu-5/igt@kms_cursor_crc@cursor-ran=
dom-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-dg1-16/igt@kms_cursor_crc@cursor-rap=
id-movement-32x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk10/igt@kms_cursor_crc@cursor-rapi=
d-movement-32x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/17504">i915#17504</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk11/igt@kms_cursor_crc@cursor-rapi=
d-movement-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/17533">i915#17533</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-max-size:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk8/igt@kms_cursor_crc@cursor-rapid=
-movement-max-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/17504">i915#17504</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-rkl-4/igt@kms_cursor_legacy@basic-bu=
sy-flip-before-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) +2 other tests sk=
ip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-tglu-1/igt@kms_cursor_legacy@basic-b=
usy-flip-before-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-tglu-5/igt@kms_cursor_legacy@cursora=
-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17454">i9=
15#17454</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-tglu-1/igt@kms_cursor_legacy@cursora=
-vs-flipb-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/17428">i915#17428</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/17454">i915#17454</a>) +2 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:<=
/p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk10/igt@kms_cursor_legacy@short-bu=
sy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/17457">i915#17457</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-dg1-15/igt@kms_cursor_legacy@short-b=
usy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4=
103</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-tglu-5/igt@kms_dirtyfb@drrs-dirtyfb-=
ioctl.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/9723">i915#9723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-rkl-7/igt@kms_display_modes@extended=
-mode-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/13691">i915#13691</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-rkl-6/igt@kms_dither@fb-8bpc-vs-pane=
l-6bpc@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-dg1-16/igt@kms_dp_link_training@non-=
uhbr-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17289">i915#17289</a>)</li>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk10/igt@kms_dp_link_training@non-u=
hbr-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/17560">i915#17560</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-rkl-2/igt@kms_dp_link_training@non-u=
hbr-sst-tbtalt-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/17290">i915#17290</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst-tbtalt-train:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-tglu-1/igt@kms_dp_link_training@uhbr=
-mst-tbtalt-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/17285">i915#17285</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst-direct-train:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-tglu-5/igt@kms_dp_link_training@uhbr=
-sst-direct-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/17285">i915#17285</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk3/igt@kms_dp_linktrain_fallback@d=
sc-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/17680">i915#17680</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-dg1-19/igt@kms_dp_linktrain_fallback=
@uhbr-to-hbr-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/16867">i915#16867</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-dg1-16/igt@kms_draw_crc@draw-method-=
mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/8812">i915#8812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic-ultrajoiner:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-tglu-1/igt@kms_dsc@dsc-basic-ultrajo=
iner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/16361">i915#16361</a>) +2 other tests skip</li>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk11/igt@kms_dsc@dsc-basic-ultrajoi=
ner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17458">i915#17458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-bigjoiner:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-dg1-15/igt@kms_dsc@dsc-fractional-bp=
p-bigjoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/16361">i915#16361</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats-ultrajoiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-tglu-5/igt@kms_dsc@dsc-with-bpc-form=
ats-ultrajoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/16361">i915#16361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-bigjoiner:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk3/igt@kms_dsc@dsc-with-output-for=
mats-bigjoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/17458">i915#17458</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-rkl-8/igt@kms_dsc@dsc-with-output-fo=
rmats-with-bpc-ultrajoiner.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +5 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-dg1-18/igt@kms_feature_discovery@dp-=
mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/16599">i915#16599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dsc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-rkl-7/igt@kms_feature_discovery@dsc.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/16600">i915#16600</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-tglu-1/igt@kms_feature_discovery@psr=
2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@vrr:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-tglu-5/igt@kms_feature_discovery@vrr=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/16600">i915#16600</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-dg1-18/igt@kms_flip@2x-absolute-wf_v=
blank.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/9934">i915#9934</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-tglu-5/igt@kms_flip@2x-dpms-vs-vblan=
k-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3637">i915#3637</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-tglu-1/igt@kms_flip@2x-flip-vs-dpms.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3637">i915#3637</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/9934">i915#9934</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-rkl-7/igt@kms_flip@2x-flip-vs-fences=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/9934">i915#9934</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences-interruptible:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-dg1-15/igt@kms_flip@2x-flip-vs-fence=
s-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/8381">i915#8381</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-mtlp-5/igt@kms_flip@2x-flip-vs-modes=
et.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3637">i915#3637</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk11/igt@kms_flip@2x-flip-vs-suspen=
d-interruptible.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17183">i915#1=
7183</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/4839">i915#4839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk11/igt@kms_flip@2x-flip-vs-suspen=
d-interruptible@ac-hdmi-a1-hdmi-a2.html">INCOMPLETE</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i91=
5#13356</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17183">i915#17183</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-off-confusion-interruptible:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-6/igt@kms_flip@dpms-off-confusion-interruptible.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patch=
work_177288v1/shard-dg2-7/igt@kms_flip@dpms-off-confusion-interruptible.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/5354">i915#5354</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@c-hdmi-a1:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-tglu-4/igt@kms_flip@flip-vs-absolute-wf_vblank@c-hdmi-a=
1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
Patchwork_177288v1/shard-tglu-9/igt@kms_flip@flip-vs-absolute-wf_vblank@c-h=
dmi-a1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/14600">i915#14600</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-rkl-8/igt@kms_flip@flip-vs-suspend-interruptible.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwor=
k_177288v1/shard-rkl-6/igt@kms_flip@flip-vs-suspend-interruptible.html">INC=
OMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/16276">i915#16276</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/6113">i915#6113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-rkl-6/igt@kms_flip@flip-vs-suspend-i=
nterruptible@a-hdmi-a2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/16276">i915#16276</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113">i915#6113</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling:</=
p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-6/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bp=
p-linear-downscaling.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-7/igt@kms_flip_scaled_crc@f=
lip-32bpp-linear-to-64bpp-linear-downscaling.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813">i9=
15#8813</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk9/igt@kms_flip_scaled_crc@flip-32=
bpp-xtile-to-64bpp-xtile-downscaling.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/17522">i915#17522</a>) +1 othe=
r test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:<=
/p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk11/igt@kms_flip_scaled_crc@flip-3=
2bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/17493">i915#17493</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-tglu-1/igt@kms_flip_scaled_crc@flip-=
32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-rkl-4/igt@kms_flip_scaled_crc@flip-6=
4bpp-4tile-to-16bpp-4tile-upscaling.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +3 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-tglu-5/igt@kms_flip_scaled_crc@flip-=
64bpp-4tile-to-32bpp-4tile-downscaling.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +1 ot=
her test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-dg1-19/igt@kms_flip_scaled_crc@flip-=
64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>)=
 +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk3/igt@kms_flip_scaled_crc@flip-64=
bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/17484">i915#17484</a>) +2 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk10/igt@kms_flip_scaled_crc@flip-6=
4bpp-ytile-to-32bpp-ytile-upscaling.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/17522">i915#17522</a>) +3 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-dg1-18/igt@kms_frontbuffer_tracking@=
fbc-1p-offscreen-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915=
#15990</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-rkl-2/igt@kms_frontbuffer_tracking@f=
bc-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) +90 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-rkl-2/igt@kms_frontbuffer_tracking@f=
bc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1=
825</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-mtlp-5/igt@kms_frontbuffer_tracking@=
fbc-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/18=
25">i915#1825</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprim=
ary.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/Patchwork_177288v1/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-indfb-sca=
ledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/16708">i915#16708</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +11 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk10/igt@kms_frontbuffer_tracking@f=
bc-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/10056">i915#10056</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16593">i915#16593<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk10/igt@kms_frontbuffer_tracking@f=
bc-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/17559">i915#17559</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-rkl-4/igt@kms_frontbuffer_tracking@f=
bchdr-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +24 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-shrfb-draw-render:</=
p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-mtlp-5/igt@kms_frontbuffer_tracking@=
fbchdr-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-s=
pr-indfb-move.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/Patchwork_177288v1/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc=
hdr-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +2 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk9/igt@kms_frontbuffer_tracking@fb=
chdr-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/17517">i915#17517</a>) +11 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-indfb-scaledprimary:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-tglu-1/igt@kms_frontbuffer_tracking@=
fbchdr-indfb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +13 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-stridechange:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-dg1-15/igt@kms_frontbuffer_tracking@=
fbchdr-stridechange.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/15989">i915#15989</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-tiling-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-dg1-16/igt@kms_frontbuffer_tracking@=
fbchdr-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/5439">i915#5439</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk8/igt@kms_frontbuffer_tracking@fb=
cpsr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/17482">i915#17482</a>) +41 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk11/igt@kms_frontbuffer_tracking@f=
bcpsr-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/17482">i915#17482</a>) +16 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-dg1-18/igt@kms_frontbuffer_tracking@=
fbcpsrhdr-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +31 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-mmap-c=
pu:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-rkl-3/igt@kms_frontbuffer_tracking@f=
bcpsrhdr-1p-primscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>)=
 +51 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-shrfb-draw-mmap-gtt:</=
p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-mtlp-5/igt@kms_frontbuffer_tracking@=
hdr-1p-offscreen-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +1 =
other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-tglu-5/igt@kms_frontbuffer_tracking@=
hdr-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +8 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-rte:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-tglu-1/igt@kms_frontbuffer_tracking@=
hdr-2p-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17428">i915#17428</a>) +45 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-mtlp-5/igt@kms_frontbuffer_tracking@=
hdr-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#=
17428</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk10/igt@kms_frontbuffer_tracking@h=
dr-2p-scndscrn-pri-shrfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/17517">i915#17517</a>) +7 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-dg1-18/igt@kms_frontbuffer_tracking@=
psr-2p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#=
8708</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-tglu-1/igt@kms_frontbuffer_tracking@=
psr-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +22 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-dg1-15/igt@kms_frontbuffer_tracking@=
psrhdr-1p-offscreen-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +=
21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-rte:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk10/igt@kms_frontbuffer_tracking@p=
srhdr-1p-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/17482">i915#17482</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-dg1-18/igt@kms_frontbuffer_tracking@=
psrhdr-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) +64 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-tglu-5/igt@kms_frontbuffer_tracking@=
psrhdr-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) +43 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-rgb565-draw-pwrite:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-tglu-5/igt@kms_frontbuffer_tracking@=
psrhdr-rgb565-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +20 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@audio-bw-hblank160:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-6/igt@kms_hdmi_audio_bw@audio-bw-hblank160.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_=
177288v1/shard-dg2-7/igt@kms_hdmi_audio_bw@audio-bw-hblank160.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17357=
">i915#17357</a>) +1 other test skip</li>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk10/igt@kms_hdmi_audio_bw@audio-bw=
-hblank160.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17102">i915#17102</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-tglu-5/igt@kms_hdr@bpc-switch.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-rkl-1/igt@kms_hdr@bpc-switch-dpms.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shar=
d-rkl-4/igt@kms_hdr@bpc-switch-dpms.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/16644">i915#16644</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8=
228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk9/igt@kms_hdr@static-toggle.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/17498">i915#17498</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-rkl-3/igt@kms_hdr@static-toggle-susp=
end.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/16644">i915#16644</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) +1 other tes=
t skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-dg1-15/igt@kms_hdr@static-toggle-sus=
pend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-hdisplay:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-5/igt@kms_invalid_mode@zero-hdisplay.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288=
v1/shard-dg2-7/igt@kms_invalid_mode@zero-hdisplay.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16746">i915#167=
46</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/3555">i915#3555</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-tglu-5/igt@kms_joiner@basic-big-join=
er.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/15460">i915#15460</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-dg1-19/igt@kms_joiner@basic-force-bi=
g-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/15459">i915#15459</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk8/igt@kms_joiner@basic-force-ultr=
a-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17567">i915#17567</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-tglu-1/igt@kms_joiner@invalid-modese=
t-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/15460">i915#15460</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-rkl-2/igt@kms_joiner@invalid-modeset=
-force-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/15458">i915#15458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-tglu-5/igt@kms_joiner@invalid-modese=
t-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/15458">i915#15458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-dg1-16/igt@kms_panel_fitting@atomic-=
fastset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/6301">i915#6301</a>)</li>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk10/igt@kms_panel_fitting@atomic-f=
astset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17577">i915#17577</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-rkl-4/igt@kms_panel_fitting@legacy.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/6301">i915#6301</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-tglu-1/igt@kms_panel_fitting@legacy.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/6301">i915#6301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-tglu-5/igt@kms_pipe_b_c_ivb@from-pip=
e-c-to-b-with-3-lanes.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/17455">i915#17455</a>) +3 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-4/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr=
24.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/Patchwork_177288v1/shard-dg2-7/igt@kms_pipe_crc_basic@compare-crc-sanitych=
eck-xr24.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/11190">i915#11190</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) +2 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk9/igt@kms_pipe_crc_basic@suspend-=
read-crc@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/12756">i915#12756</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1340=
9">i915#13409</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/13476">i915#13476</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/16789">i915#16789</a>) +1 other test incomplete=
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-4tiled:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk8/igt@kms_pipe_stress@stress-xrgb=
8888-4tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/17601">i915#17601</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-untiled:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-1/igt@kms_pipe_stress@stress-xrgb8888-untiled.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwo=
rk_177288v1/shard-dg2-7/igt@kms_pipe_stress@stress-xrgb8888-untiled.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17356">i915#17356</a>) +48 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-yftiled:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-tglu-5/igt@kms_pipe_stress@stress-xr=
gb8888-yftiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/14712">i915#14712</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk9/igt@kms_plane@pixel-format-4-ti=
led-dg2-mc-ccs-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/17479">i915#17479</a>) +2 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping:<=
/p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk11/igt@kms_plane@pixel-format-4-t=
iled-dg2-mc-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/17479">i915#17479</a>) +1 =
other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-tglu-5/igt@kms_plane@pixel-format-4-=
tiled-mtl-rc-ccs-cc-modifier.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clampin=
g:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-dg1-18/igt@kms_plane@pixel-format-4-=
tiled-mtl-rc-ccs-cc-modifier-source-clamping.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>)=
 +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-rkl-4/igt@kms_plane@pixel-format-x-t=
iled-modifier@pipe-b-plane-5.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/16386">i915#16386</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane=
-7:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-tglu-5/igt@kms_plane@pixel-format-y-=
tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-7.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16386">i915#16386</a>=
) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-mtlp-5/igt@kms_plane@pixel-format-y-=
tiled-gen12-rc-ccs-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-rkl-4/igt@kms_plane@pixel-format-yf-=
tiled-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/15709">i915#15709</a>) +4 other tests skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-tglu-1/igt@kms_plane@pixel-format-yf=
-tiled-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/15709">i915#15709</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-tglu-5/igt@kms_plane@planar-pixel-fo=
rmat-settings@nv12-tile4-src-y.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/16112">i915#16112</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-6/igt@kms_plane@plane-position-hole-dpms.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17=
7288v1/shard-dg2-7/igt@kms_plane@plane-position-hole-dpms.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825">i91=
5#8825</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-tglu-5/igt@kms_plane_multiple@2x-til=
ing-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-dg1-18/igt@kms_plane_multiple@2x-til=
ing-none.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/13958">i915#13958</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b:</=
p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-rkl-7/igt@kms_plane_scaling@plane-do=
wnscale-factor-0-5-with-rotation@pipe-b.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +3 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe=
-c:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-4/igt@kms_plane_scaling@plane-downscale-factor-0-75=
-with-pixel-format@pipe-c.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-7/igt@kms_plane_scalin=
g@plane-downscale-factor-0-75-with-pixel-format@pipe-c.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#=
15329</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a:<=
/p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-dg1-19/igt@kms_plane_scaling@plane-d=
ownscale-factor-0-75-with-rotation@pipe-a.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +4=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-1/igt@kms_plane_scaling@plane-scaler-unity-scaling-=
with-modifiers.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/Patchwork_177288v1/shard-dg2-7/igt@kms_plane_scaling@plane-sca=
ler-unity-scaling-with-modifiers.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/94=
23">i915#9423</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-5/igt@kms_plane_scaling@plane-scaler-with-clipping-=
clamping-rotation.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/Patchwork_177288v1/shard-dg2-7/igt@kms_plane_scaling@plane-=
scaler-with-clipping-clamping-rotation.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#=
17356</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/9423">i915#9423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-d=
:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-6/igt@kms_plane_scaling@plane-upscale-factor-0-25-w=
ith-pixel-format@pipe-d.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-7/igt@kms_plane_scaling@=
plane-upscale-factor-0-25-with-pixel-format@pipe-d.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#153=
29</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17356">i915#17356</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-5/igt@kms_plane_scaling@planes-downscale-factor-0-7=
5.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
Patchwork_177288v1/shard-dg2-7/igt@kms_plane_scaling@planes-downscale-facto=
r-0-75.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/15329">i915#15329</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/17356">i915#17356</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#695=
3</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
9423">i915#9423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25:<=
/p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-1/igt@kms_plane_scaling@planes-downscale-factor-0-7=
5-upscale-factor-0-25.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-7/igt@kms_plane_scaling@pl=
anes-downscale-factor-0-75-upscale-factor-0-25.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1735=
6">i915#17356</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/6953">i915#6953</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/9423">i915#9423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk11/igt@kms_pm_backlight@basic-bri=
ghtness.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/17462">i915#17462</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-dg1-19/igt@kms_pm_backlight@fade-wit=
h-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/12343">i915#12343</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-suspend-resume:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk3/igt@kms_pm_dc@dc5-dpms-suspend-=
resume.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/16938">i915#16938</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-pageflip-negative:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-rkl-7/igt@kms_pm_dc@dc5-pageflip-neg=
ative.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/9685">i915#9685</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-tglu-1/igt@kms_pm_dc@dc5-psr.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/15948">i915#15948</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr-suspend-resume:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk10/igt@kms_pm_dc@dc5-psr-suspend-=
resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17495">i915#17495</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-dg1-16/igt@kms_pm_dc@dc5-psr-suspend=
-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/16914">i915#16914</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk9/igt@kms_pm_dc@dc5-retention-flo=
ps.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17553">i915#17553</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-rkl-2/igt@kms_pm_dc@dc6-dpms.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/16479">i915#16479</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-tglu-5/igt@kms_pm_dc@dc6-psr.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/15948">i915#15948</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-rkl-8/igt@kms_pm_lpsp@kms-lpsp.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3828">i915#3828</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@screens-disabled:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-rkl-3/igt@kms_pm_lpsp@screens-disabl=
ed.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/8430">i915#8430</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-dg1-15/igt@kms_pm_lpsp@screens-disab=
led.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/8430">i915#8430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@drm-resources-equal:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-4/igt@kms_pm_rpm@drm-resources-equal.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288=
v1/shard-dg2-7/igt@kms_pm_rpm@drm-resources-equal.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17446">i915#174=
46</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/3547">i915#3547</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-4/igt@kms_pm_rpm@modeset-lpsp-stress.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288=
v1/shard-dg2-7/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#150=
73</a>)</li>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg1-14/igt@kms_pm_rpm@modeset-lpsp-stress.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17728=
8v1/shard-dg1-16/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#150=
73</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk8/igt@kms_pm_rpm@modeset-lpsp-str=
ess-no-wait.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-dg1-15/igt@kms_pm_rpm@modeset-non-lp=
sp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/15073">i915#15073</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-rkl-4/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.ht=
ml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patc=
hwork_177288v1/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/15073">i915#15073</a>) +1 other test skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-tglu-1/igt@kms_pm_rpm@modeset-non-lp=
sp-stress-no-wait.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-pc8-residency-stress:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-tglu-5/igt@kms_pm_rpm@modeset-pc8-re=
sidency-stress.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/17434">i915#17434</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/17450">i915#17450</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@pc8-residency:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-dg1-18/igt@kms_pm_rpm@pc8-residency.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17434">i915#17434</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/17450">i915#17450</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-rkl-2/igt@kms_pm_rpm@system-suspend-modeset.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177=
288v1/shard-rkl-6/igt@kms_pm_rpm@system-suspend-modeset.html">INCOMPLETE</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14419=
">i915#14419</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-vgem:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-dg1-16/igt@kms_prime@basic-crc-vgem.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/6524">i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@d3hot:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-tglu-1/igt@kms_prime@d3hot.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6=
524">i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_properties@colorop-properties-legacy:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-6/igt@kms_properties@colorop-properties-legacy.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchw=
ork_177288v1/shard-dg2-7/igt@kms_properties@colorop-properties-legacy.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/15347">i915#15347</a>)</li>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk10/igt@kms_properties@colorop-pro=
perties-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/17481">i915#17481</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-atomic:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-1/igt@kms_properties@plane-properties-atomic.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwor=
k_177288v1/shard-dg2-7/igt@kms_properties@plane-properties-atomic.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
1521">i915#11521</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-tglu-1/igt@kms_psr2_sf@fbc-pr-primar=
y-plane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +4 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-tglu-5/igt@kms_psr2_sf@fbc-psr2-curs=
or-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +3 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk9/igt@kms_psr2_sf@fbc-psr2-cursor=
-plane-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +4 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk11/igt@kms_psr2_sf@pr-overlay-pla=
ne-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-rkl-3/igt@kms_psr2_sf@pr-overlay-pla=
ne-update-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +6 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-dg1-18/igt@kms_psr2_sf@psr2-cursor-p=
lane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +7 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk10/igt@kms_psr2_sf@psr2-cursor-pl=
ane-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/11520">i915#11520</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-dg1-15/igt@kms_psr2_su@frontbuffer-x=
rgb8888.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/9683">i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk8/igt@kms_psr2_su@page_flip-nv12.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17546">i915#17546</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-rkl-8/igt@kms_psr2_su@page_flip-xrgb=
8888.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/9683">i915#9683</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-primary-render:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk10/igt@kms_psr@fbc-pr-primary-ren=
der.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17480">i915#17480</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-plane-onoff:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-rkl-4/igt@kms_psr@fbc-pr-sprite-plan=
e-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-plane-move:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-tglu-5/igt@kms_psr@fbc-psr-cursor-pl=
ane-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/9732">i915#9732</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-blt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-dg1-15/igt@kms_psr@fbc-psr2-cursor-b=
lt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/9732">i915#9732</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-page-flip:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk11/igt@kms_psr@fbc-psr2-primary-p=
age-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17480">i915#17480</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-basic:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk9/igt@kms_psr@pr-basic.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17=
480">i915#17480</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-mmap-cpu:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-mtlp-5/igt@kms_psr@pr-primary-mmap-c=
pu.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/9688">i915#9688</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk8/igt@kms_psr@psr-sprite-plane-on=
off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17480">i915#17480</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/9732">i915#9732</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-mmap-cpu:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-tglu-1/igt@kms_psr@psr2-sprite-mmap-=
cpu.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/9732">i915#9732</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-dg1-18/igt@kms_psr_stress_test@flip-=
primary-invalidate-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/15949">i915#15949</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk9/igt@kms_psr_stress_test@invalid=
ate-primary-flip-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/17554">i915#17554</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@exhaust-fences:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-dg1-16/igt@kms_rotation_crc@exhaust-=
fences.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/4884">i915#4884</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-x-tiled-reflect-x-180:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk11/igt@kms_rotation_crc@primary-x=
-tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/17488">i915#17488</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk8/igt@kms_rotation_crc@primary-y-=
tiled-reflect-x-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/17488">i915#17488</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-mtlp-5/igt@kms_rotation_crc@primary-=
y-tiled-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/15867">i915#15867</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-rkl-3/igt@kms_rotation_crc@primary-y=
f-tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/17432">i915#17432</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-dg1-15/igt@kms_rotation_crc@primary-=
yf-tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/17432">i915#17432</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_framebuffer:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk8/igt@kms_selftest@drm_framebuffe=
r.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/13179">i915#13179</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-rkl-8/igt@kms_setmode@clone-exclusiv=
e-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk9/igt@kms_setmode@invalid-clone-e=
xclusive-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/17463">i915#17463</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-dg1-16/igt@kms_tiled_display@basic-t=
est-pattern.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/8623">i915#8623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-tglu-1/igt@kms_tv_load_detect@load-d=
etect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/17445">i915#17445</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk11/igt@kms_vrr@flip-basic.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17520">i915#17520</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk9/igt@kms_vrr@seamless-rr-switch-=
drrs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17520">i915#17520</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-dg1-19/igt@kms_vrr@seamless-rr-switc=
h-virtual.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-rkl-2/igt@kms_vrr@seamless-rr-switch=
-vrr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@gen12-group-exclusive-stream-ctx-handle:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk8/igt@perf@gen12-group-exclusive-=
stream-ctx-handle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/17536">i915#17536</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@gen8-unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-rkl-2/igt@perf@gen8-unprivileged-sin=
gle-ctx-counters.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/2436">i915#2436</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@rcs0:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-mtlp-6/igt@perf_pmu@busy-double-start@rcs0.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_1772=
88v1/shard-mtlp-4/igt@perf_pmu@busy-double-start@rcs0.html">FAIL</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#43=
49</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-all-gts:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-tglu-5/igt@perf_pmu@rc6-all-gts.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/8516">i915#8516</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-rkl-3/igt@perf_pmu@rc6-suspend.html"=
>INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/13520">i915#13520</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6@other-idle-gt0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-rkl-2/igt@perf_pmu@rc6@other-idle-gt=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/8516">i915#8516</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-dg1-16/igt@prime_mmap@test_aperture_=
limit@test_aperture_limit-smem.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/14121">i915#14121</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@prime_udl@share-import:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-dg1-18/igt@prime_udl@share-import.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/16420">i915#16420</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-dg1-18/igt@prime_vgem@basic-gtt.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/3708">i915#3708</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/4077">i915#4077</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-read:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-dg1-16/igt@prime_vgem@basic-read.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@coherency-gtt:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-tglu-1/igt@prime_vgem@coherency-gtt.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17429">i915#17429</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/17448">i915#17448</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-flip-hang:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-glk11/igt@prime_vgem@fence-flip-hang=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17467">i915#17467</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-tglu-1/igt@prime_vgem@fence-flip-han=
g.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17448">i915#17448</a>)</li>
</ul>
</li>
<li>
<p>igt@tools_test@sysfs_l3_parity:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-tglu-1/igt@tools_test@sysfs_l3_parit=
y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17447">i915#17447</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-glk9/igt@gem_ctx_isolation@preservation-s3@rcs0.html">I=
NCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/13356">i915#13356</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/16466">i915#16466</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk5/igt@gem_ctx_isol=
ation@preservation-s3@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg1-17/igt@i915_suspend@basic-s3-without-i915.html">DME=
SG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/4391">i915#4391</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/4423">i915#4423</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-18/igt@i915_suspend@bas=
ic-s3-without-i915.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-glk5/igt@kms_async_flips@alternate-sync-async-flip-atom=
ic@pipe-b-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/14888">i915#14888</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-glk6/igt@kms_asyn=
c_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-1.html">PASS</a> +1 =
other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-c-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-mtlp-8/igt@kms_async_flips@async-flip-suspend-resume@pi=
pe-c-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17150">i915#17150</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-mtlp-5/igt@kms_async_flip=
s@async-flip-suspend-resume@pipe-c-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-7/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
7356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/Patchwork_177288v1/shard-dg2-5/igt@kms_big_fb@x-tiled-64bpp-rotate-180=
.html">PASS</a> +48 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-rkl-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-=
ccs-cc.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/15582">i915#15582</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-8/igt@kms_ccs@crc-p=
rimary-suspend-y-tiled-gen12-rc-ccs-cc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-7/igt@kms_color@gamma.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655">i915#12655</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17373=
">i915#17373</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/Patchwork_177288v1/shard-dg2-4/igt@kms_color@gamma.html">PASS</a> +1 other=
 test pass</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-7/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb=
-bt2020-lim-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/15529">i915#15529</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-8/igt@kms_colo=
r_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d.html">PASS</a> +4 ot=
her tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-7/igt@kms_cursor_legacy@basic-flip-before-cursor-le=
gacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/11190">i915#11190</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-8/igt@kms_c=
ursor_legacy@basic-flip-before-cursor-legacy.html">PASS</a> +1 other test p=
ass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-toggle:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-glk9/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">=
FAIL</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwor=
k_177288v1/shard-glk9/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">PAS=
S</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@modeset-vs-vblank-race:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-7/igt@kms_flip@modeset-vs-vblank-race.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354"=
>i915#5354</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/P=
atchwork_177288v1/shard-dg2-1/igt@kms_flip@modeset-vs-vblank-race.html">PAS=
S</a> +9 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:</=
p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-7/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bp=
p-linear-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/8813">i915#8813</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2=
-5/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.ht=
ml">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri=
-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/16708">i915#16708</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-4/igt@kms_fro=
ntbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render.html">PASS</a> +1 =
other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-=
indfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/16708">i915#16708</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-=
8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html">=
PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-suspend.html">IN=
COMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/10056">i915#10056</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/Patchwork_177288v1/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc=
-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-pwrite:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-glk3/igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-pw=
rite.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17517">i915#17517</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/Patchwork_177288v1/shard-glk8/igt@kms_frontbuffer_tracki=
ng@fbchdr-rgb565-draw-pwrite.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-tiling-linear:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-rkl-8/igt@kms_frontbuffer_tracking@fbchdr-tiling-linear=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/15989">i915#15989</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/Patchwork_177288v1/shard-rkl-6/igt@kms_frontbuffer_tracking@=
fbchdr-tiling-linear.html">PASS</a> +13 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-end:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-7/igt@kms_invalid_mode@bad-hsync-end.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16746"=
>i915#16746</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3555">i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-dg2-5/igt@kms_invalid_mode@bad-hsync=
-end.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-top-left:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-7/igt@kms_plane@plane-panning-top-left.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825=
">i915#8825</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
Patchwork_177288v1/shard-dg2-8/igt@kms_plane@plane-panning-top-left.html">P=
ASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-d:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-7/igt@kms_plane_scaling@plane-upscale-20x20-with-ro=
tation@pipe-d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/15329">i915#15329</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-8=
/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-d.html">PASS<=
/a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-7/igt@kms_plane_scaling@planes-downscale-factor-0-5=
-upscale-20x20.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/15329">i915#15329</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288=
v1/shard-dg2-1/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20=
x20.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-7/igt@kms_plane_scaling@planes-downscale-factor-0-5=
@pipe-a.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/15329">i915#15329</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-5/igt@kms_plane_scaling@=
planes-downscale-factor-0-5@pipe-a.html">PASS</a> +17 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-scaler-unity-scaling:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-7/igt@kms_plane_scaling@planes-scaler-unity-scaling=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/15329">i915#15329</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/17356">i915#17356</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288=
v1/shard-dg2-5/igt@kms_plane_scaling@planes-scaler-unity-scaling.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-7/igt@kms_plane_scaling@planes-upscale-20x20.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/15329">i915#15329</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17356">i915#17356</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shar=
d-dg2-1/igt@kms_plane_scaling@planes-upscale-20x20.html">PASS</a> +1 other =
test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-suspend-resume:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-rkl-3/igt@kms_pm_dc@dc5-dpms-suspend-resume.html">INCOM=
PLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/16943">i915#16943</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/Patchwork_177288v1/shard-rkl-3/igt@kms_pm_dc@dc5-dpms-suspend-resu=
me.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-rkl-7/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#150=
73</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork=
_177288v1/shard-rkl-5/igt@kms_pm_rpm@dpms-lpsp.html">PASS</a> +2 other test=
s pass</li>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg1-19/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#150=
73</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork=
_177288v1/shard-dg1-15/igt@kms_pm_rpm@dpms-lpsp.html">PASS</a> +1 other tes=
t pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-7/igt@kms_pm_rpm@i2c.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17446">i915#17446</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288=
v1/shard-dg2-1/igt@kms_pm_rpm@i2c.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-7/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15=
073">i915#15073</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/Patchwork_177288v1/shard-dg2-8/igt@kms_pm_rpm@modeset-non-lpsp-stress.h=
tml">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@device_reset@unbind-cold-reset-rebind:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-rkl-6/igt@device_reset@unbind-cold-reset-rebind.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/11078">i915#11078</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-4/igt@device_reset@unbi=
nd-cold-reset-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/11078">i915#11078</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-sanity-check:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-rkl-8/igt@gem_create@create-ext-cpu-access-sanity-check=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/6335">i915#6335</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/Patchwork_177288v1/shard-rkl-6/igt@gem_create@create-ext-cpu-a=
ccess-sanity-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/6335">i915#6335</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-gtt-noreloc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-rkl-8/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
3281">i915#3281</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/Patchwork_177288v1/shard-rkl-6/igt@gem_exec_reloc@basic-cpu-gtt-noreloc=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/3281">i915#3281</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-cpu:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-cpu.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i=
915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3281">i915#3281</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/Patchwork_177288v1/shard-rkl-2/igt@gem_exec_reloc@basic-gtt-cpu=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/3281">i915#3281</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-rkl-5/igt@gem_lmem_swapping@heavy-verify-random.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/4613">i915#4613</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/Patchwork_177288v1/shard-rkl-6/igt@gem_lmem_swapping@heavy-verify-rand=
om.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-ccs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-rkl-6/igt@gem_lmem_swapping@verify-ccs.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i=
915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/4613">i915#4613</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/Patchwork_177288v1/shard-rkl-2/igt@gem_lmem_swapping@verify-ccs=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-snoop:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-rkl-8/igt@gem_partial_pwrite_pread@writes-after-reads-s=
noop.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3282">i915#3282</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/Patchwork_177288v1/shard-rkl-6/igt@gem_partial_pwrite_prea=
d@writes-after-reads-snoop.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_partial_pwrite_pread@writes-after-reads:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-rkl-6/igt@gem_tiled_partial_pwrite_pread@writes-after-r=
eads.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/3282">i915#3282</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-2/igt@gem_til=
ed_partial_pwrite_pread@writes-after-reads.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@forbidden-operations:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-rkl-6/igt@gem_userptr_blits@forbidden-operations.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/3282">i915#3282</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-4/igt@gem_=
userptr_blits@forbidden-operations.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a=
>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-rkl-8/igt@gem_userptr_blits@unsync-unmap.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">=
i915#3297</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Pa=
tchwork_177288v1/shard-rkl-6/igt@gem_userptr_blits@unsync-unmap.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/145=
44">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@oacontrol-tracking:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-rkl-8/igt@gen7_exec_parse@oacontrol-tracking.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17=
455">i915#17455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/Patchwork_177288v1/shard-rkl-6/igt@gen7_exec_parse@oacontrol-tracking.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/17455">i915#17455</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-rkl-6/igt@gen9_exec_parse@allowed-single.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"=
>i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/2527">i915#2527</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-rkl-4/igt@gen9_exec_parse@allowed-si=
ngle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/2527">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@media-rc6-accuracy:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-rkl-8/igt@i915_pm_rc6_residency@media-rc6-accuracy.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/16080">i915#16080</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/16166">i915#16166</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-6/igt@i915_pm_rc6_re=
sidency@media-rc6-accuracy.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16080">i915#16080</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16166">i=
915#16166</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-tiled2untiled:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-rkl-1/igt@i915_suspend@fence-restore-tiled2untiled.html=
">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/15140">i915#15140</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/Patchwork_177288v1/shard-rkl-4/igt@i915_suspend@fence-restore-ti=
led2untiled.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/4817">i915#4817</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-mtlp-8/igt@kms_async_flips@async-flip-suspend-resume@pi=
pe-d-edp-1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/17037">i915#17037</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-mtlp-5/igt@kms_asyn=
c_flips@async-flip-suspend-resume@pipe-d-edp-1.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17150">i915#17150</a=
>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:<=
/p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-rkl-6/igt@kms_atomic_transition@plane-all-modeset-trans=
ition-internal-panels.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_1=
77288v1/shard-rkl-4/igt@kms_atomic_transition@plane-all-modeset-transition-=
internal-panels.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/1769">i915#1769</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-rkl-6/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/4538">i915#4538</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-2/igt@kms_big_=
fb@4-tiled-16bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +1 ot=
her test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-4/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17=
431">i915#17431</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/Patchwork_177288v1/shard-dg2-7/igt@kms_big_fb@4-tiled-32bpp-rotate-90.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17356">i915#17356</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-rkl-5/igt@kms_big_fb@4-tiled-addfb-size-overflow.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/5286">i915#5286</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/Patchwork_177288v1/shard-rkl-6/igt@kms_big_fb@4-tiled-addfb-size-over=
flow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-rkl-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate=
-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/4538">i915#4538</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-6/igt@kms_big_f=
b@4-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915=
#4538</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-7/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/173=
56">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/Patchwork_177288v1/shard-dg2-5/igt@kms_big_fb@linear-16bpp-rotate-90.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17431">i915#17431</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-rkl-8/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/174=
31">i915#17431</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3638">i915#3638</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/Patchwork_177288v1/shard-rkl-6/igt@kms_big_fb@linear-64bpp=
-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/17431">i915#17431</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-1/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-=
180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/3828">i915#3828</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-7/igt@kms_big_fb@linear-=
max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>)</li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-rkl-8/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-=
180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/3828">i915#3828</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-6/igt@kms_big_fb@linear-=
max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#382=
8</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-rkl-6/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-=
0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/3828">i915#3828</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-4/igt@kms_=
big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-7/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17356">i915#17356</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/5190">i915#5190</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-8/igt@kms_big_fb@y-tiled=
-addfb-size-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate=
-0-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/4538">i915#4538</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-7/igt@=
kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i=
915#17356</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/5190">i915#5190</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-7/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
7356">i915#17356</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/5190">i915#5190</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-8/igt@kms_big_fb@yf-tiled-1=
6bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/4538">i915#4538</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +10 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-rkl-6/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflo=
w.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/17432">i915#17432</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-2/igt@kms_big_=
fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/17432">i915#17432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-rkl-8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotat=
e-180-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/4538">i915#4538</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-6/igt@kms_big_fb@=
yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/4538">i915#4538</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg1-17/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pi=
pe-a-hdmi-a-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/4423">i915#4423</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-18/igt=
@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-4.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i9=
15#6095</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-6/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-cc=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/10307">i915#10307</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-7/igt@kms_ccs@cc=
s-on-another-bo-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) +10 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-7/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/Patchwork_177288v1/shard-dg2-1/igt@kms_ccs@crc-primary-basic-4-t=
iled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/12313">i915#12313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-cc=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-dg2-7/igt@kms_ccs@crc-primary-suspen=
d-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-=
ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-4/igt@kms_ccs@crc-primary-su=
spend-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14098">i915#14098</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-2/igt@=
kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915=
#6095</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-rkl-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-r=
c-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/14098">i915#14098</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-6/igt@kms=
_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#140=
98</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/6095">i915#6095</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-7/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/Patchwork_177288v1/shard-dg2-5/igt@kms_ccs@crc-sprite-planes-b=
asic-y-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +8 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-4/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/12313">i915#12313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/Patchwork_177288v1/shard-dg2-7/igt@kms_ccs@random-ccs-data-4-tiled=
-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-rkl-6/igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-a-hd=
mi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-4/igt@kms_c=
cs@random-ccs-data-y-tiled-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>)=
 +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-6/igt@kms_cdclk@mode-transition-all-outputs.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/16017">i915#16017</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/Patchwork_177288v1/shard-dg2-7/igt@kms_cdclk@mode-transition-all-out=
puts.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio-after-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-rkl-8/igt@kms_chamelium_audio@dp-audio-after-suspend.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/11151">i915#11151</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/Patchwork_177288v1/shard-rkl-6/igt@kms_chamelium_audio@dp-audio=
-after-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-rkl-8/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3=
x4-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/16471">i915#16471</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-6/igt@k=
ms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14=
544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/16471">i915#16471</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17427">i915#17427</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-rkl-6/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-2/igt@=
kms_chamelium_hpd@hdmi-hpd-storm-disable.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915=
#7828</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-rkl-2/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-6/igt@kms_chamelium=
_hpd@vga-hpd-with-enabled-mode.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828=
">i915#7828</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-hdcp14:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-rkl-6/igt@kms_content_protection@atomic-hdcp14.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/15865">i915#15865</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-2/igt@kms_content_protec=
tion@atomic-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/15865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-5/igt@kms_content_protection@dp-mst-lic-type-1.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/15330">i915#15330</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/3299">i915#3299</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-7/igt@kms_content_prot=
ection@dp-mst-lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-7/igt@kms_content_protection@dp-mst-type-0.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/Patchwork_177288v1/shard-dg2-4/igt@kms_content_protection@dp-mst-type=
-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/15330">i915#15330</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-suspend-resume:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-7/igt@kms_content_protection@dp-mst-type-0-suspend-=
resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-1/igt@kms_content_protect=
ion@dp-mst-type-0-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-rkl-8/igt@kms_content_protection@lic-type-0.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/158=
65">i915#15865</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/Patchwork_177288v1/shard-rkl-6/igt@kms_content_protection@lic-type-0.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/15865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-7/igt@kms_content_protection@mei-interface.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/Patchwork_177288v1/shard-dg2-5/igt@kms_content_protection@mei-interfa=
ce.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/15865">i915#15865</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-5/igt@kms_content_protection@type1.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i=
915#15865</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Pa=
tchwork_177288v1/shard-dg2-7/igt@kms_content_protection@type1.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356=
">i915#17356</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x32:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-32x32.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/3555">i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-4/igt@kms_cursor_crc@curso=
r-onscreen-32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x32:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-7/igt@kms_cursor_crc@cursor-rapid-movement-32x32.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/Patchwork_177288v1/shard-dg2-5/igt@kms_cursor_crc@cursor-rapid-=
movement-32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-512x170.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/13049">i915#13049</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-4/igt@kms_cursor=
_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-5/igt@kms_cursor_crc@cursor-sliding-32x10.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3=
555">i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/Patchwork_177288v1/shard-dg2-7/igt@kms_cursor_crc@cursor-sliding-32x10.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17356">i915#17356</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-7/igt@kms_cursor_crc@cursor-sliding-512x170.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/Patchwork_177288v1/shard-dg2-8/igt@kms_cursor_crc@cursor-sliding-512=
x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-1/igt@kms_cursor_crc@cursor-sliding-512x512.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/13049">i915#13049</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/Patchwork_177288v1/shard-dg2-7/igt@kms_cursor_crc@cursor-sliding-512=
x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17356">i915#17356</a>)</li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-rkl-8/igt@kms_cursor_crc@cursor-sliding-512x512.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/13049">i915#13049</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/Patchwork_177288v1/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-512=
x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/13049">i915#13049</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-1/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/13046">i915#13046</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/17454">i915#17454</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-7/ig=
t@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>)=
 +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-rkl-2/igt@kms_cursor_legacy@basic-busy-flip-before-curs=
or-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/4103">i915#4103</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-6/igt@kms_cursor_l=
egacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/41=
03">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-tra=
nsitions.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-8/igt@kms_cursor_legacy=
@cursorb-vs-flipa-atomic-transitions.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/13046">i915#13046</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17454">i915#17=
454</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/5354">i915#5354</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-7/igt@kms_cursor_legacy@modeset-atomic-cursor-hotsp=
ot.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/Patchwork_177288v1/shard-dg2-8/igt@kms_cursor_legacy@modes=
et-atomic-cursor-hotspot.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/9067">i915#9067</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:<=
/p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-6/igt@kms_cursor_legacy@short-busy-flip-before-curs=
or-atomic-transitions.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-7/igt@kms_cu=
rsor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356"=
>i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-7/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">=
i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/P=
atchwork_177288v1/shard-dg2-5/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/983=
3">i915#9833</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-rkl-8/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555=
">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3804">i915#3804</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/Patchwork_177288v1/shard-rkl-6/igt@kms_dither@fb-8bpc-vs-pane=
l-6bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-6/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/172=
89">i915#17289</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/Patchwork_177288v1/shard-dg2-7/igt@kms_dp_link_training@non-uhbr-mst.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-5/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748">=
i915#13748</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/P=
atchwork_177288v1/shard-dg2-7/igt@kms_dp_link_training@uhbr-mst.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/173=
56">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst-direct-train:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-rkl-2/igt@kms_dp_link_training@uhbr-mst-direct-train.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17285">i915#17285</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/Patchwork_177288v1/shard-rkl-6/igt@kms_dp_link_training@uhbr-ms=
t-direct-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/17285">i915#17285</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst-tbtalt-train:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-4/igt@kms_dp_link_training@uhbr-sst-tbtalt-train.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17285">i915#17285</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/Patchwork_177288v1/shard-dg2-7/igt@kms_dp_link_training@uhbr-ss=
t-tbtalt-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-7/igt@kms_dp_linktrain_fallback@dsc-fallback.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/Patchwork_177288v1/shard-dg2-4/igt@kms_dp_linktrain_fallback@dsc-fa=
llback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/13707">i915#13707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-rkl-5/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallbac=
k.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/16867">i915#16867</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/Patchwork_177288v1/shard-rkl-6/igt@kms_dp_linktrain_fallbac=
k@uhbr-to-hbr-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/16867">i915#16867</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-gtt:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-6/igt@kms_draw_crc@draw-method-mmap-gtt.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/881=
2">i915#8812</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/Patchwork_177288v1/shard-dg2-7/igt@kms_draw_crc@draw-method-mmap-gtt.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-wc:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-7/igt@kms_draw_crc@draw-method-mmap-wc.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1735=
6">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/Patchwork_177288v1/shard-dg2-4/igt@kms_draw_crc@draw-method-mmap-wc.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/8812">i915#8812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc-ultrajoiner:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-1/igt@kms_dsc@dsc-fractional-bpp-with-bpc-ultrajoin=
er.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/16361">i915#16361</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/Patchwork_177288v1/shard-dg2-7/igt@kms_dsc@dsc-fractional-=
bpp-with-bpc-ultrajoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/17356">i915#17356</a>) +1 other test skip<=
/li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-rkl-8/igt@kms_dsc@dsc-fractional-bpp-with-bpc-ultrajoin=
er.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/16361">i915#16361</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/Patchwork_177288v1/shard-rkl-6/igt@kms_dsc@dsc-fractional-=
bpp-with-bpc-ultrajoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-7/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i=
915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Pa=
tchwork_177288v1/shard-dg2-8/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361=
">i915#16361</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-rkl-6/igt@kms_feature_discovery@display-4x.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/16081">i915#16081</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-2/igt@kms_feature_discovery@=
display-4x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/16081">i915#16081</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-rkl-8/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16599">i=
915#16599</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Pa=
tchwork_177288v1/shard-rkl-6/igt@kms_feature_discovery@dp-mst.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544=
">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/16599">i915#16599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-rkl-8/igt@kms_flip@2x-absolute-wf_vblank.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">=
i915#9934</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Pa=
tchwork_177288v1/shard-rkl-6/igt@kms_flip@2x-absolute-wf_vblank.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/145=
44">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/9934">i915#9934</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-glk3/igt@kms_flip@2x-flip-vs-suspend.html">INCOMPLETE</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1274=
5">i915#12745</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/13356">i915#13356</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/17183">i915#17183</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113">i915#6113=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_1=
77288v1/shard-glk8/igt@kms_flip@2x-flip-vs-suspend.html">INCOMPLETE</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12314">i91=
5#12314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/12745">i915#12745</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/17183">i915#17183</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-glk3/igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a1-hdmi-a2=
.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/12745">i915#12745</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/17183">i915#17183</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/sha=
rd-glk8/igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a1-hdmi-a2.html">INCOMPLETE=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12=
314">i915#12314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/12745">i915#12745</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/17183">i915#17183</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:=
</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-rkl-6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs=
-modeset-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard=
-rkl-4/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interrupti=
ble.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/9934">i915#9934</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-glk6/igt@kms_flip@flip-vs-suspend-interruptible.html">I=
NCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/12745">i915#12745</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/17183">i915#17183</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288=
v1/shard-glk3/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1274=
5">i915#12745</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/13356">i915#13356</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/17183">i915#17183</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113">i915#6113=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:<=
/p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-rkl-5/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64=
bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-6/igt@kms_=
flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/15643">i915#15643</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri=
-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/15104">i915#15104</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-=
dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-wc.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/16708">i915#16708</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-=
shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/16708">i915#16708</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2=
-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/15990">i915#15990</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/8708">i915#8708</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-=
indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_1=
77288v1/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-=
draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/17428">i915#17428</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-render:</=
p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-4/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-s=
pr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/15989">i915#15989</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-7/igt@kms_f=
rontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-render.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708"=
>i915#16708</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-render:</=
p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-s=
pr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard=
-rkl-4/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-rende=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17428">i915#17428</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-suspend.html"=
>INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/16056">i915#16056</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/Patchwork_177288v1/shard-rkl-4/igt@kms_frontbuffer_tracking@=
fbchdr-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/15989">i915#15989</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-gtt=
:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-=
pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/16708">i915#16708</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-4/igt@km=
s_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-gtt.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
15104">i915#15104</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/15990">i915#15990</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-p=
ri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-=
dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-w=
c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/16708">i915#16708</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/5354">i915#5354</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render:</=
p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-p=
ri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/16708">i915#16708</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-d=
g2-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/15991">i915#15991</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/5354">i915#5354</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscr=
n-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/16708">i915#16708</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-8/igt@kms_fro=
ntbuffer_tracking@fbcpsrhdr-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i91=
5#15991</a>) +37 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-shrfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-shrfb-f=
liptrack-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/15990">i915#15990</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-7/igt@kms_fron=
tbuffer_tracking@fbcpsrhdr-2p-shrfb-fliptrack-mmap-gtt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#=
16708</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb101010-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb101010-=
draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/16708">i915#16708</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-8/igt@kms_frontbuf=
fer_tracking@fbcpsrhdr-rgb101010-draw-mmap-cpu.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a=
>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/5439">i915#5439</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/Patchwork_177288v1/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcp=
srhdr-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-linear:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-lin=
ear.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/15102">i915#15102</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-7/igt@kms_frontbuffer_tracki=
ng@fbcpsrhdr-tiling-linear.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a>) +17 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-7/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-indf=
b-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/16708">i915#16708</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-8/igt@kms_frontbuff=
er_tracking@hdr-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>)=
 +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg1-17/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri=
-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/15990">i915#15990</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg1-18/igt@kms_f=
rontbuffer_tracking@hdr-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i=
915#15990</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-rkl-5/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-=
indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/17428">i915#17428</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-6/igt@kms_fro=
ntbuffer_tracking@hdr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i91=
5#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17428">i915#17428</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-7/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-=
shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/16708">i915#16708</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-1/igt@kms_fro=
ntbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i91=
5#15990</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-=
shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-=
rkl-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/15102">i915#15102</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-=
indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/16708">i915#16708</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-1=
/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15=
102">i915#15102</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-rkl-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-=
shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/17428">i915#17428</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rk=
l-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-gtt.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/17428">i915#17428</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +2 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indf=
b-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/15991">i915#15991</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-7/igt=
@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i=
915#16708</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/5354">i915#5354</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-indfb-scaledprim=
ary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/15102">i915#15102</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-7/igt@kms_frontbuffer_tracki=
ng@psr-indfb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +16=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-rkl-8/igt@kms_frontbuffer_tracking@psr-suspend.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
15102">i915#15102</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/Patchwork_177288v1/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-suspe=
nd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/15102">i915#15102</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-5/igt@kms_frontbuffer_tracking@psrhdr-2p-pri-indfb-=
multidraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/15991">i915#15991</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-7/igt@kms_frontbuffer_=
tracking@psrhdr-2p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a>) +32 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-rkl-6/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery=
.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/15132">i915#15132</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/Patchwork_177288v1/shard-rkl-2/igt@kms_hdmi_audio_bw@suspen=
d-disk-audio-recovery.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/17122">i915#17122</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/17137">i915#17137</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-4/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i9=
15#12713</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/16518">i915#16518</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/Patchwork_177288v1/shard-dg2-7/igt@kms_hdr@brightness-with-hdr=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-7/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356"=
>i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
Patchwork_177288v1/shard-dg2-4/igt@kms_hdr@invalid-metadata-sizes.html">SKI=
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
/CI_DRM_19420/shard-dg2-5/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16518">i91=
5#16518</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/8228">i915#8228</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-7/igt@kms_hdr@static-t=
oggle-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-6/igt@kms_panel_fitting@atomic-fastset.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301=
">i915#6301</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
Patchwork_177288v1/shard-dg2-7/igt@kms_panel_fitting@atomic-fastset.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-7/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17356">i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/Patchwork_177288v1/shard-dg2-1/igt@kms_pipe_stress@stress-xrgb8888-=
ytiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/13705">i915#13705</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clampin=
g:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-=
modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/s=
hard-rkl-2/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source=
-clamping.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/15709">i915#15709</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clampin=
g:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-rkl-8/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-=
modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-6/igt@k=
ms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/15709">i915#15709</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-7/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i91=
5#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patc=
hwork_177288v1/shard-dg2-5/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i91=
5#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/8821">i915#8821</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-7/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356"=
>i915#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
Patchwork_177288v1/shard-dg2-1/igt@kms_plane_multiple@2x-tiling-4.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
3958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-1/igt@kms_plane_multiple@2x-tiling-none.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/139=
58">i915#13958</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/Patchwork_177288v1/shard-dg2-7/igt@kms_plane_multiple@2x-tiling-none.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17356">i915#17356</a>)</li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-rkl-8/igt@kms_plane_multiple@2x-tiling-none.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/139=
58">i915#13958</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/Patchwork_177288v1/shard-rkl-6/igt@kms_plane_multiple@2x-tiling-none.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/13958">i915#13958</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-7/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i9=
15#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Pat=
chwork_177288v1/shard-dg2-4/igt@kms_plane_multiple@tiling-y.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259">=
i915#14259</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-rkl-6/igt@kms_pm_backlight@basic-brightness.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/123=
43">i915#12343</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-4/igt@kms_pm_=
backlight@basic-brightness.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@pc8-residency:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-rkl-8/igt@kms_pm_rpm@pc8-residency.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17434">i915#=
17434</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/17450">i915#17450</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/Patchwork_177288v1/shard-rkl-6/igt@kms_pm_rpm@pc8-residency.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17434">i915#17434</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/17450">i915#17450</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-rkl-8/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continu=
ous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/11520">i915#11520</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-6/igt@kms_psr2_sf@=
fbc-pr-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-rkl-6/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/11520">i915#11520</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-2/igt@kms_psr2_sf@pr-cu=
rsor-plane-update-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/11520">i915#11520</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-rkl-6/igt@kms_psr@psr2-cursor-mmap-gtt.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i9=
15#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-4/igt@kms_psr@psr2-c=
ursor-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/1072">i915#1072</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +6 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-rkl-5/igt@kms_psr@psr2-primary-mmap-gtt.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i=
915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/9732">i915#9732</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/Patchwork_177288v1/shard-rkl-6/igt@kms_psr@psr2-primary-mmap-gtt=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +6 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-rkl-8/igt@kms_psr_stress_test@flip-primary-invalidate-o=
verlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/15949">i915#15949</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-6/igt@kms_psr_stress_test=
@flip-primary-invalidate-overlay.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15949">i915#15949<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-7/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i9=
15#17356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Pat=
chwork_177288v1/shard-dg2-5/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755">=
i915#12755</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/15867">i915#15867</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@exhaust-fences:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-6/igt@kms_rotation_crc@exhaust-fences.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4235"=
>i915#4235</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/P=
atchwork_177288v1/shard-dg2-7/igt@kms_rotation_crc@exhaust-fences.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
7356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/5190">i915#5190</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/Patchwork_177288v1/shard-dg2-7/igt@kms_rotation_crc@primary-yf=
-tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/17356">i915#17356</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-4/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/12755">i915#12755</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/15867">i915#15867</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-dg2-7/igt@kms_rotat=
ion_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-6/igt@kms_tiled_display@basic-test-pattern.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
8623">i915#8623</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/Patchwork_177288v1/shard-dg2-7/igt@kms_tiled_display@basic-test-pattern=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17356">i915#17356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-rkl-6/igt@kms_tiled_display@basic-test-pattern-with-cha=
melium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/8623">i915#8623</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-2/igt@kms_t=
iled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623">i915#8623</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-5/igt@kms_vrr@flipline.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243">i915#15243</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555=
">i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
Patchwork_177288v1/shard-dg2-7/igt@kms_vrr@flipline.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#173=
56</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-dg2-7/igt@kms_vrr@max-min.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17356">i915#17356</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17728=
8v1/shard-dg2-4/igt@kms_vrr@max-min.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_udl@share-import:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-rkl-8/igt@prime_udl@share-import.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16420">i915#16=
420</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/Patchwor=
k_177288v1/shard-rkl-6/igt@prime_udl@share-import.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/16420">i915#16420</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19420/shard-rkl-6/igt@prime_vgem@basic-write.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14=
544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17448">i915#17448</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/3291">i915#3291</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_177288v1/shard-rkl-2/igt@prim=
e_vgem@basic-write.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/17448">i915#17448</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a=
>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_19420 -&gt; Patchwork_177288v1</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19420: 238c1e3e984e2b7f948cb24165314b8d719a23d6 @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGT_9172: 9172<br />
  Patchwork_177288v1: 238c1e3e984e2b7f948cb24165314b8d719a23d6 @ git://anon=
git.freedesktop.org/gfx-ci/linux<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============2468647568430443190==--
