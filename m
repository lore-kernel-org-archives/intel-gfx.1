Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BBD0CA5FA5
	for <intel-gfx@archiver.kernel.org>; Thu,  1 Oct 2026 09:06:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24AC910E32A;
	Thu,  1 Oct 2026 09:06:31 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5449B10E328;
 Thu,  1 Oct 2026 09:06:29 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6652117983243133229=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_drm/=7Bi915=2Cxe=7D=3A_u?=
 =?utf-8?q?se_a_shared_gtt=5Fview=5Ftypes=2Eh_header_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Thu, 01 Oct 2026 09:06:29 -0000
Message-ID: <179084558932.227871.14311745571836608403@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <cover.1790780340.git.jani.nikula@intel.com>
In-Reply-To: <cover.1790780340.git.jani.nikula@intel.com>
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

--===============6652117983243133229==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/{i915,xe}: use a shared gtt_view_types.h header (rev3)
URL   : https://patchwork.freedesktop.org/series/174203/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_19245_full -> Patchwork_174203v3_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with Patchwork_174203v3_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in Patchwork_174203v3_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in Patchwork_174203v3_full:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_pm_rpm@system-suspend-devices:
    - shard-dg2:          [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-dg2-3/igt@i915_pm_rpm@system-suspend-devices.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg2-1/igt@i915_pm_rpm@system-suspend-devices.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-b-hdmi-a-1:
    - shard-tglu:         [PASS][3] -> [INCOMPLETE][4] +1 other test incomplete
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-tglu-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-b-hdmi-a-1.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-b-hdmi-a-1.html

  
New tests
---------

  New tests have been introduced between CI_DRM_19245_full and Patchwork_174203v3_full:

### New IGT tests (6) ###

  * igt@i915_pm_rpm@fbchdr-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_pm_rpm@hdr-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_pm_rpm@legacy-engines-queued:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_pm_rpm@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_pm_rpm@system-suspend-modeset:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_pm_rpm@viewport:
    - Statuses :
    - Exec time: [None] s

  

Known issues
------------

  Here are the changes found in Patchwork_174203v3_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-keep-cache:
    - shard-dg1:          NOTRUN -> [SKIP][5] ([i915#8411])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-12/igt@api_intel_bb@blit-reloc-keep-cache.html

  * igt@device_reset@cold-reset-bound:
    - shard-dg1:          NOTRUN -> [SKIP][6] ([i915#11078])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-12/igt@device_reset@cold-reset-bound.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-rkl:          NOTRUN -> [SKIP][7] ([i915#3555] / [i915#9323])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-8/igt@gem_ccs@block-copy-compressed.html
    - shard-tglu:         NOTRUN -> [SKIP][8] ([i915#3555] / [i915#9323])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-4/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ccs@suspend-resume:
    - shard-dg2:          [PASS][9] -> [INCOMPLETE][10] ([i915#13356] / [i915#16348]) +1 other test incomplete
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-dg2-8/igt@gem_ccs@suspend-resume.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg2-3/igt@gem_ccs@suspend-resume.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-rkl:          NOTRUN -> [SKIP][11] ([i915#6335])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-5/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_create@create-ext-set-pat:
    - shard-tglu-1:       NOTRUN -> [SKIP][12] ([i915#8562])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-1/igt@gem_create@create-ext-set-pat.html
    - shard-dg1:          NOTRUN -> [SKIP][13] ([i915#8562])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-18/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_persistence@heartbeat-hang:
    - shard-dg1:          NOTRUN -> [SKIP][14] ([i915#8555])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-12/igt@gem_ctx_persistence@heartbeat-hang.html

  * igt@gem_ctx_persistence@legacy-engines-queued:
    - shard-snb:          NOTRUN -> [SKIP][15] ([i915#1099]) +3 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-snb4/igt@gem_ctx_persistence@legacy-engines-queued.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-dg1:          NOTRUN -> [SKIP][16] ([i915#280])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-19/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_exec_balancer@hog:
    - shard-dg1:          NOTRUN -> [SKIP][17] ([i915#4812])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-18/igt@gem_exec_balancer@hog.html

  * igt@gem_exec_balancer@parallel-bb-first:
    - shard-tglu:         NOTRUN -> [SKIP][18] ([i915#4525]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-7/igt@gem_exec_balancer@parallel-bb-first.html

  * igt@gem_exec_big@single:
    - shard-tglu-1:       NOTRUN -> [FAIL][19] ([i915#15816])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-1/igt@gem_exec_big@single.html

  * igt@gem_exec_capture@capture@vecs0-lmem0:
    - shard-dg1:          NOTRUN -> [FAIL][20] ([i915#16904]) +2 other tests fail
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-19/igt@gem_exec_capture@capture@vecs0-lmem0.html

  * igt@gem_exec_flush@basic-wb-ro-default:
    - shard-dg1:          NOTRUN -> [SKIP][21] ([i915#3539] / [i915#4852])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-18/igt@gem_exec_flush@basic-wb-ro-default.html

  * igt@gem_exec_reloc@basic-gtt-wc-noreloc:
    - shard-dg1:          NOTRUN -> [SKIP][22] ([i915#3281]) +9 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-18/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html

  * igt@gem_exec_reloc@basic-write-read:
    - shard-rkl:          NOTRUN -> [SKIP][23] ([i915#3281]) +13 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-7/igt@gem_exec_reloc@basic-write-read.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-rkl:          [PASS][24] -> [ABORT][25] ([i915#15131] / [i915#15542]) +1 other test abort
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-8/igt@gem_exec_suspend@basic-s3.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-1/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_huc_copy@huc-copy:
    - shard-rkl:          NOTRUN -> [SKIP][26] ([i915#2190])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-2/igt@gem_huc_copy@huc-copy.html
    - shard-glk:          NOTRUN -> [SKIP][27] ([i915#2190])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-glk4/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@parallel-random-verify:
    - shard-tglu:         NOTRUN -> [SKIP][28] ([i915#4613]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-7/igt@gem_lmem_swapping@parallel-random-verify.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][29] ([i915#4613]) +2 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-1/igt@gem_lmem_swapping@parallel-random-verify-ccs.html
    - shard-dg1:          NOTRUN -> [SKIP][30] ([i915#12193])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-18/igt@gem_lmem_swapping@parallel-random-verify-ccs.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][31] ([i915#4565])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-18/igt@gem_lmem_swapping@parallel-random-verify-ccs@lmem0.html

  * igt@gem_lmem_swapping@random-engines:
    - shard-glk:          NOTRUN -> [SKIP][32] ([i915#4613]) +2 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-glk9/igt@gem_lmem_swapping@random-engines.html

  * igt@gem_lmem_swapping@verify-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][33] ([i915#4613])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-7/igt@gem_lmem_swapping@verify-ccs.html

  * igt@gem_mmap_gtt@cpuset-big-copy:
    - shard-dg1:          NOTRUN -> [SKIP][34] ([i915#4077]) +4 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-19/igt@gem_mmap_gtt@cpuset-big-copy.html

  * igt@gem_mmap_wc@bad-offset:
    - shard-dg1:          NOTRUN -> [SKIP][35] ([i915#4083])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-12/igt@gem_mmap_wc@bad-offset.html

  * igt@gem_partial_pwrite_pread@reads-uncached:
    - shard-rkl:          NOTRUN -> [SKIP][36] ([i915#3282]) +1 other test skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-2/igt@gem_partial_pwrite_pread@reads-uncached.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-snoop:
    - shard-dg1:          NOTRUN -> [SKIP][37] ([i915#3282]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-18/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html

  * igt@gem_pread@exhaustion:
    - shard-tglu:         NOTRUN -> [WARN][38] ([i915#2658])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-7/igt@gem_pread@exhaustion.html

  * igt@gem_pxp@hw-rejects-pxp-buffer:
    - shard-rkl:          NOTRUN -> [SKIP][39] ([i915#13717])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-2/igt@gem_pxp@hw-rejects-pxp-buffer.html

  * igt@gem_pxp@reject-modify-context-protection-off-3:
    - shard-dg1:          NOTRUN -> [SKIP][40] ([i915#4270]) +2 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-19/igt@gem_pxp@reject-modify-context-protection-off-3.html

  * igt@gem_set_tiling_vs_pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][41] ([i915#4079]) +3 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-18/igt@gem_set_tiling_vs_pwrite.html

  * igt@gem_softpin@noreloc-s3:
    - shard-glk:          NOTRUN -> [INCOMPLETE][42] ([i915#13356] / [i915#13809] / [i915#16193])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-glk5/igt@gem_softpin@noreloc-s3.html

  * igt@gem_userptr_blits@coherency-sync:
    - shard-tglu:         NOTRUN -> [SKIP][43] ([i915#3297]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-3/igt@gem_userptr_blits@coherency-sync.html

  * igt@gem_userptr_blits@forbidden-operations:
    - shard-rkl:          NOTRUN -> [SKIP][44] ([i915#3282] / [i915#3297])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-8/igt@gem_userptr_blits@forbidden-operations.html

  * igt@gem_userptr_blits@relocations:
    - shard-dg1:          NOTRUN -> [SKIP][45] ([i915#3281] / [i915#3297])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-18/igt@gem_userptr_blits@relocations.html

  * igt@gem_userptr_blits@sd-probe:
    - shard-dg1:          NOTRUN -> [SKIP][46] ([i915#3297] / [i915#4958])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-12/igt@gem_userptr_blits@sd-probe.html

  * igt@gem_userptr_blits@unsync-unmap-after-close:
    - shard-tglu-1:       NOTRUN -> [SKIP][47] ([i915#3297])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-1/igt@gem_userptr_blits@unsync-unmap-after-close.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-dg2:          [PASS][48] -> [INCOMPLETE][49] ([i915#13356]) +2 other tests incomplete
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-dg2-1/igt@gem_workarounds@suspend-resume-fd.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg2-7/igt@gem_workarounds@suspend-resume-fd.html
    - shard-glk:          NOTRUN -> [INCOMPLETE][50] ([i915#13356] / [i915#14586])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-glk8/igt@gem_workarounds@suspend-resume-fd.html

  * igt@gen7_exec_parse@load-register-reg:
    - shard-tglu:         NOTRUN -> [SKIP][51] +73 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-3/igt@gen7_exec_parse@load-register-reg.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-dg1:          NOTRUN -> [SKIP][52] ([i915#2527]) +2 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-18/igt@gen9_exec_parse@allowed-all.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-tglu:         NOTRUN -> [SKIP][53] ([i915#2527] / [i915#2856])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-7/igt@gen9_exec_parse@allowed-single.html

  * igt@gen9_exec_parse@batch-without-end:
    - shard-rkl:          NOTRUN -> [SKIP][54] ([i915#2527]) +1 other test skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-5/igt@gen9_exec_parse@batch-without-end.html

  * igt@gen9_exec_parse@bb-start-cmd:
    - shard-tglu-1:       NOTRUN -> [SKIP][55] ([i915#2527] / [i915#2856]) +3 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-1/igt@gen9_exec_parse@bb-start-cmd.html

  * igt@gpu_buddy@gpu_buddy:
    - shard-rkl:          NOTRUN -> [SKIP][56] ([i915#15678])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-2/igt@gpu_buddy@gpu_buddy.html

  * igt@i915_module_load@fault-injection@intel_connector_register:
    - shard-snb:          NOTRUN -> [ABORT][57] ([i915#15342]) +1 other test abort
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-snb4/igt@i915_module_load@fault-injection@intel_connector_register.html

  * igt@i915_pm_freq_api@freq-reset-multiple:
    - shard-rkl:          NOTRUN -> [SKIP][58] ([i915#8399])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-7/igt@i915_pm_freq_api@freq-reset-multiple.html
    - shard-tglu-1:       NOTRUN -> [SKIP][59] ([i915#8399])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-1/igt@i915_pm_freq_api@freq-reset-multiple.html

  * igt@i915_pm_freq_api@freq-suspend@gt0:
    - shard-dg2:          [PASS][60] -> [INCOMPLETE][61] ([i915#13356] / [i915#13820]) +1 other test incomplete
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-dg2-4/igt@i915_pm_freq_api@freq-suspend@gt0.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg2-1/igt@i915_pm_freq_api@freq-suspend@gt0.html

  * igt@i915_pm_freq_mult@media-freq@gt0:
    - shard-tglu:         NOTRUN -> [SKIP][62] ([i915#6590]) +1 other test skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-3/igt@i915_pm_freq_mult@media-freq@gt0.html

  * igt@i915_query@hwconfig_table:
    - shard-rkl:          NOTRUN -> [SKIP][63] ([i915#6245])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-5/igt@i915_query@hwconfig_table.html

  * igt@i915_selftest@perf:
    - shard-tglu:         NOTRUN -> [ABORT][64] ([i915#17018]) +1 other test abort
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-3/igt@i915_selftest@perf.html

  * igt@i915_suspend@forcewake:
    - shard-rkl:          [PASS][65] -> [INCOMPLETE][66] ([i915#4817])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-4/igt@i915_suspend@forcewake.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-6/igt@i915_suspend@forcewake.html

  * igt@kms_addfb_basic@basic-x-tiled-legacy:
    - shard-dg1:          NOTRUN -> [SKIP][67] ([i915#4212])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-12/igt@kms_addfb_basic@basic-x-tiled-legacy.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-tglu-1:       NOTRUN -> [SKIP][68] ([i915#12454] / [i915#12712])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-1/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-2:
    - shard-glk:          [PASS][69] -> [FAIL][70] ([i915#14888])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-glk1/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-2.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-glk2/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-2.html

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-glk:          NOTRUN -> [INCOMPLETE][71] ([i915#12761] / [i915#13356]) +1 other test incomplete
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-glk9/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-glk:          NOTRUN -> [SKIP][72] ([i915#1769])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-glk4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - shard-rkl:          NOTRUN -> [SKIP][73] ([i915#1769] / [i915#3555])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-tglu-1:       NOTRUN -> [SKIP][74] ([i915#1769] / [i915#3555])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-tglu:         NOTRUN -> [SKIP][75] ([i915#5286]) +2 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-tglu-1:       NOTRUN -> [SKIP][76] ([i915#5286]) +1 other test skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-rkl:          NOTRUN -> [SKIP][77] ([i915#5286]) +2 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][78] ([i915#4538] / [i915#5286]) +4 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-19/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-mtlp:         [PASS][79] -> [FAIL][80] ([i915#15733] / [i915#5138])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][81] ([i915#3638]) +5 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-2/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg1:          NOTRUN -> [SKIP][82] ([i915#3828])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-19/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-rkl:          NOTRUN -> [SKIP][83] ([i915#3828])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-7/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][84] ([i915#3638])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-12/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][85] ([i915#4538]) +3 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-12/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-c-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][86] ([i915#10307] / [i915#6095]) +83 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg2-4/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][87] ([i915#14098] / [i915#6095]) +36 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-7/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][88] ([i915#12313]) +1 other test skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][89] ([i915#6095]) +34 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-1:
    - shard-dg1:          NOTRUN -> [SKIP][90] ([i915#6095]) +195 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-14/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][91] ([i915#6095]) +49 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-7/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][92] ([i915#12805])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-19/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-b-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][93] ([i915#6095]) +49 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-8/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][94] ([i915#6095]) +7 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg2-1/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-3.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][95] ([i915#12313]) +1 other test skip
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-2/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [SKIP][96] +414 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-glk4/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][97] ([i915#10307] / [i915#10434] / [i915#6095]) +3 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg2-4/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg1:          NOTRUN -> [SKIP][98] ([i915#3742])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-12/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][99] ([i915#13781]) +3 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg2-4/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1.html

  * igt@kms_cdclk@plane-scaling:
    - shard-rkl:          NOTRUN -> [SKIP][100] ([i915#3742])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-8/igt@kms_cdclk@plane-scaling.html
    - shard-tglu:         NOTRUN -> [SKIP][101] ([i915#3742])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-4/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_audio@hdmi-audio-after-suspend:
    - shard-dg1:          NOTRUN -> [SKIP][102] ([i915#11151])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-19/igt@kms_chamelium_audio@hdmi-audio-after-suspend.html

  * igt@kms_chamelium_color_pipeline@plane-ctm3x4:
    - shard-tglu:         NOTRUN -> [SKIP][103] ([i915#16471])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-3/igt@kms_chamelium_color_pipeline@plane-ctm3x4.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4:
    - shard-tglu-1:       NOTRUN -> [SKIP][104] ([i915#16471])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-1/igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4.html
    - shard-dg1:          NOTRUN -> [SKIP][105] ([i915#16471]) +2 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-18/igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - shard-dg1:          NOTRUN -> [SKIP][106] ([i915#11151] / [i915#7828]) +3 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-19/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_chamelium_frames@hdmi-aspect-ratio:
    - shard-tglu:         NOTRUN -> [SKIP][107] ([i915#11151] / [i915#7828]) +4 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-7/igt@kms_chamelium_frames@hdmi-aspect-ratio.html

  * igt@kms_chamelium_frames@hdmi-crc-fast:
    - shard-tglu-1:       NOTRUN -> [SKIP][108] ([i915#11151] / [i915#7828]) +4 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-1/igt@kms_chamelium_frames@hdmi-crc-fast.html

  * igt@kms_chamelium_frames@hdmi-frame-dump:
    - shard-rkl:          NOTRUN -> [SKIP][109] ([i915#11151] / [i915#7828]) +7 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-2/igt@kms_chamelium_frames@hdmi-frame-dump.html

  * igt@kms_color@deep-color:
    - shard-tglu:         NOTRUN -> [SKIP][110] ([i915#3555] / [i915#9979])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-3/igt@kms_color@deep-color.html

  * igt@kms_color_pipeline@plane-ctm3x4-lut1d@pipe-a-plane-2:
    - shard-rkl:          NOTRUN -> [FAIL][111] ([i915#17116]) +35 other tests fail
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-2/igt@kms_color_pipeline@plane-ctm3x4-lut1d@pipe-a-plane-2.html

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d@pipe-c-plane-6:
    - shard-tglu:         NOTRUN -> [FAIL][112] ([i915#17116]) +28 other tests fail
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-7/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d@pipe-c-plane-6.html

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim@pipe-c-plane-6:
    - shard-tglu-1:       NOTRUN -> [FAIL][113] ([i915#17116]) +28 other tests fail
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-1/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim@pipe-c-plane-6.html

  * igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-d-plane-3:
    - shard-tglu-1:       NOTRUN -> [SKIP][114] ([i915#16990]) +15 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-1/igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-d-plane-3.html
    - shard-dg1:          NOTRUN -> [SKIP][115] ([i915#16990]) +15 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-18/igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-d-plane-3.html

  * igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-c-plane-4:
    - shard-rkl:          NOTRUN -> [SKIP][116] ([i915#16990]) +17 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-8/igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-c-plane-4.html

  * igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-d-plane-5:
    - shard-tglu:         NOTRUN -> [SKIP][117] ([i915#16990]) +15 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-4/igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-d-plane-5.html

  * igt@kms_content_protection@content-type-change:
    - shard-dg1:          NOTRUN -> [SKIP][118] ([i915#15865]) +1 other test skip
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-12/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg1:          NOTRUN -> [SKIP][119] ([i915#15330] / [i915#3299])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-19/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-type-1-suspend-resume:
    - shard-rkl:          NOTRUN -> [SKIP][120] ([i915#15330])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-2/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html

  * igt@kms_content_protection@legacy:
    - shard-rkl:          NOTRUN -> [SKIP][121] ([i915#15865]) +1 other test skip
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-7/igt@kms_content_protection@legacy.html
    - shard-tglu-1:       NOTRUN -> [SKIP][122] ([i915#15865]) +2 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-1/igt@kms_content_protection@legacy.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-dg1:          NOTRUN -> [SKIP][123] ([i915#3555]) +1 other test skip
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-12/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-tglu:         NOTRUN -> [SKIP][124] ([i915#13049]) +2 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-7/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85:
    - shard-tglu-1:       NOTRUN -> [FAIL][125] ([i915#13566]) +3 other tests fail
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-1/igt@kms_cursor_crc@cursor-onscreen-256x85.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-rkl:          NOTRUN -> [SKIP][126] ([i915#13049])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-5/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [FAIL][127] ([i915#13566]) +4 other tests fail
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-8/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1.html
    - shard-tglu:         NOTRUN -> [FAIL][128] ([i915#13566]) +1 other test fail
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-4/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-tglu-1:       NOTRUN -> [SKIP][129] ([i915#13049])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-1/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-dg1:          NOTRUN -> [SKIP][130] ([i915#13049])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-19/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-mtlp:         [PASS][131] -> [ABORT][132] ([i915#17213]) +1 other test abort
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-mtlp-7/igt@kms_cursor_crc@cursor-suspend.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-mtlp-4/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-rkl:          NOTRUN -> [SKIP][133] +88 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-7/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy:
    - shard-dg1:          [PASS][134] -> [FAIL][135] ([i915#15999])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-dg1-12/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-14/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-tglu-1:       NOTRUN -> [SKIP][136] ([i915#9723])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-1/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-tglu-1:       NOTRUN -> [SKIP][137] ([i915#13691])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-1/igt@kms_display_modes@extended-mode-basic.html
    - shard-dg1:          NOTRUN -> [SKIP][138] ([i915#13691])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-18/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-rkl:          NOTRUN -> [SKIP][139] ([i915#3555] / [i915#3804])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-5/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][140] ([i915#3804])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-5/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html

  * igt@kms_dp_aux_dev@basic:
    - shard-dg1:          NOTRUN -> [SKIP][141] ([i915#1257])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-19/igt@kms_dp_aux_dev@basic.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-dg1:          NOTRUN -> [SKIP][142] ([i915#13748])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-12/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-rkl:          NOTRUN -> [SKIP][143] ([i915#13748])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-7/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-rkl:          NOTRUN -> [SKIP][144] ([i915#16867])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-2/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-rkl:          NOTRUN -> [SKIP][145] ([i915#13707])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-8/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - shard-tglu:         NOTRUN -> [SKIP][146] ([i915#13707])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-4/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback:
    - shard-tglu:         NOTRUN -> [SKIP][147] ([i915#16870])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-7/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html

  * igt@kms_dsc@dsc-basic:
    - shard-tglu:         NOTRUN -> [SKIP][148] ([i915#16361]) +2 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-3/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-fractional-bpp-bigjoiner:
    - shard-tglu-1:       NOTRUN -> [SKIP][149] ([i915#16361]) +1 other test skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-1/igt@kms_dsc@dsc-fractional-bpp-bigjoiner.html
    - shard-dg1:          NOTRUN -> [SKIP][150] ([i915#16361]) +2 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-18/igt@kms_dsc@dsc-fractional-bpp-bigjoiner.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner:
    - shard-rkl:          NOTRUN -> [SKIP][151] ([i915#16361]) +1 other test skip
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-2/igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner.html

  * igt@kms_feature_discovery@display-4x:
    - shard-rkl:          NOTRUN -> [SKIP][152] ([i915#16081])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-5/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-rkl:          NOTRUN -> [SKIP][153] ([i915#16599])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-7/igt@kms_feature_discovery@dp-mst.html
    - shard-tglu-1:       NOTRUN -> [SKIP][154] ([i915#16599])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-1/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@hdr:
    - shard-rkl:          [PASS][155] -> [SKIP][156] ([i915#16600])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-6/igt@kms_feature_discovery@hdr.html
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-7/igt@kms_feature_discovery@hdr.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-rkl:          NOTRUN -> [SKIP][157] ([i915#9934]) +3 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-7/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
    - shard-glk:          [PASS][158] -> [FAIL][159] ([i915#14600]) +1 other test fail
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-glk9/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-glk5/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-glk:          [PASS][160] -> [FAIL][161] ([i915#13027]) +1 other test fail
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-glk5/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-glk6/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-flip-vs-fences:
    - shard-dg1:          NOTRUN -> [SKIP][162] ([i915#8381]) +1 other test skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-12/igt@kms_flip@2x-flip-vs-fences.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-tglu:         NOTRUN -> [SKIP][163] ([i915#3637] / [i915#9934]) +3 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-tglu-1:       NOTRUN -> [SKIP][164] ([i915#3637] / [i915#9934]) +4 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-1/igt@kms_flip@2x-plain-flip-interruptible.html
    - shard-dg1:          NOTRUN -> [SKIP][165] ([i915#9934]) +6 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-18/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible@bc-hdmi-a1-hdmi-a2:
    - shard-glk:          NOTRUN -> [FAIL][166] ([i915#10826]) +1 other test fail
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-glk9/igt@kms_flip@2x-plain-flip-ts-check-interruptible@bc-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a1:
    - shard-glk:          NOTRUN -> [FAIL][167] ([i915#13027]) +1 other test fail
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-glk4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][168] ([i915#12745] / [i915#13356] / [i915#17183] / [i915#4839])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-glk4/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a2:
    - shard-rkl:          [PASS][169] -> [INCOMPLETE][170] ([i915#16276] / [i915#6113]) +1 other test incomplete
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-7/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a2.html
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-6/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a2.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][171] ([i915#12745] / [i915#13356] / [i915#17183])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-glk4/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-rkl:          NOTRUN -> [SKIP][172] ([i915#15643])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-dg1:          NOTRUN -> [SKIP][173] ([i915#15643]) +3 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-12/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][174] ([i915#15643]) +2 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-tglu:         NOTRUN -> [SKIP][175] ([i915#15643]) +1 other test skip
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-glk11:        NOTRUN -> [INCOMPLETE][176] ([i915#10056] / [i915#13356] / [i915#16593])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-glk11/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-pwrite:
    - shard-tglu:         NOTRUN -> [SKIP][177] ([i915#15989]) +11 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-7/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-dg1:          NOTRUN -> [SKIP][178] +57 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-12/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-farfromfence-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][179] ([i915#15990]) +15 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-19/igt@kms_frontbuffer_tracking@fbchdr-farfromfence-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbchdr-tiling-4:
    - shard-tglu:         NOTRUN -> [SKIP][180] ([i915#5439]) +1 other test skip
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-3/igt@kms_frontbuffer_tracking@fbchdr-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbchdr-tiling-linear:
    - shard-rkl:          NOTRUN -> [SKIP][181] ([i915#15989]) +19 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-5/igt@kms_frontbuffer_tracking@fbchdr-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt:
    - shard-glk10:        NOTRUN -> [SKIP][182] +74 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-glk10/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-rkl:          NOTRUN -> [SKIP][183] ([i915#1825]) +5 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:
    - shard-tglu-1:       NOTRUN -> [SKIP][184] +74 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-suspend:
    - shard-dg1:          NOTRUN -> [SKIP][185] ([i915#15102]) +21 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsrhdr-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4:
    - shard-rkl:          NOTRUN -> [SKIP][186] ([i915#5439])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4.html

  * igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-mmap-gtt:
    - shard-tglu-1:       NOTRUN -> [SKIP][187] ([i915#15989]) +14 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-1/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-shrfb-draw-pwrite:
    - shard-glk:          [PASS][188] -> [SKIP][189] +4 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-glk8/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-shrfb-draw-pwrite.html
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-glk3/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@hdr-modesetfrombusy:
    - shard-dg1:          NOTRUN -> [SKIP][190] ([i915#15989]) +11 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-12/igt@kms_frontbuffer_tracking@hdr-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@hdr-rgb565-draw-pwrite:
    - shard-rkl:          [PASS][191] -> [SKIP][192] ([i915#15989]) +7 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-rgb565-draw-pwrite.html
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-7/igt@kms_frontbuffer_tracking@hdr-rgb565-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-cpu:
    - shard-tglu-1:       NOTRUN -> [SKIP][193] ([i915#15102]) +30 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-1/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][194] ([i915#15104] / [i915#15990]) +2 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-12/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][195] ([i915#15990] / [i915#8708]) +10 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-19/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][196] ([i915#15102]) +42 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-2/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psrhdr-farfromfence-mmap-gtt:
    - shard-tglu:         NOTRUN -> [SKIP][197] ([i915#15102]) +26 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-4/igt@kms_frontbuffer_tracking@psrhdr-farfromfence-mmap-gtt.html

  * igt@kms_hdmi_audio_bw@audio-bw-hblank160:
    - shard-snb:          NOTRUN -> [FAIL][198] ([i915#17104])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-snb4/igt@kms_hdmi_audio_bw@audio-bw-hblank160.html
    - shard-glk:          NOTRUN -> [FAIL][199] ([i915#17102])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-glk4/igt@kms_hdmi_audio_bw@audio-bw-hblank160.html

  * igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery:
    - shard-snb:          NOTRUN -> [FAIL][200] ([i915#17122])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-snb1/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-dg1:          NOTRUN -> [SKIP][201] ([i915#3555] / [i915#8228])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-19/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][202] ([i915#3555] / [i915#8228]) +1 other test skip
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-4/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][203] ([i915#15460])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-12/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-tglu-1:       NOTRUN -> [SKIP][204] ([i915#15459])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-1/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][205] ([i915#15458])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-19/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][206] ([i915#15460])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-5/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][207] ([i915#15458])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-3/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_panel_fitting@legacy:
    - shard-tglu:         NOTRUN -> [SKIP][208] ([i915#6301])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-7/igt@kms_panel_fitting@legacy.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][209] ([i915#12756] / [i915#13356] / [i915#13409] / [i915#16789])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-glk3/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-1.html

  * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
    - shard-glk:          NOTRUN -> [DMESG-WARN][210] ([i915#118])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-glk8/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier:
    - shard-tglu-1:       NOTRUN -> [SKIP][211] ([i915#15709])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-1/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping:
    - shard-tglu:         NOTRUN -> [SKIP][212] ([i915#15709]) +2 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-4/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-7:
    - shard-dg1:          NOTRUN -> [SKIP][213] ([i915#16386]) +1 other test skip
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-19/igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-7.html

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier:
    - shard-rkl:          NOTRUN -> [SKIP][214] ([i915#15709]) +5 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-5/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html

  * igt@kms_plane@pixel-format-yf-tiled-modifier:
    - shard-dg1:          NOTRUN -> [SKIP][215] ([i915#15709]) +2 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-19/igt@kms_plane@pixel-format-yf-tiled-modifier.html

  * igt@kms_plane_alpha_blend@constant-alpha-max:
    - shard-glk10:        NOTRUN -> [FAIL][216] ([i915#10647] / [i915#12169])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-glk10/igt@kms_plane_alpha_blend@constant-alpha-max.html

  * igt@kms_plane_alpha_blend@constant-alpha-max@pipe-a-hdmi-a-1:
    - shard-glk10:        NOTRUN -> [FAIL][217] ([i915#10647]) +1 other test fail
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-glk10/igt@kms_plane_alpha_blend@constant-alpha-max@pipe-a-hdmi-a-1.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-dg1:          NOTRUN -> [SKIP][218] ([i915#13958]) +1 other test skip
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-12/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-rkl:          [PASS][219] -> [SKIP][220] ([i915#6953])
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-1/igt@kms_plane_scaling@intel-max-src-size.html
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-7/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a:
    - shard-tglu-1:       NOTRUN -> [SKIP][221] ([i915#15329]) +4 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-1/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html
    - shard-dg1:          NOTRUN -> [SKIP][222] ([i915#15329]) +4 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-18/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-c:
    - shard-tglu:         NOTRUN -> [SKIP][223] ([i915#15329]) +4 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-3/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-c.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-tglu:         NOTRUN -> [SKIP][224] ([i915#12343] / [i915#9812])
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-7/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@fade:
    - shard-rkl:          NOTRUN -> [SKIP][225] ([i915#12343] / [i915#5354])
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-2/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-rkl:          NOTRUN -> [SKIP][226] ([i915#15948])
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-5/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc5-psr-suspend-resume:
    - shard-rkl:          NOTRUN -> [SKIP][227] ([i915#16914])
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-8/igt@kms_pm_dc@dc5-psr-suspend-resume.html
    - shard-tglu:         NOTRUN -> [SKIP][228] ([i915#16914])
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-4/igt@kms_pm_dc@dc5-psr-suspend-resume.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-dg1:          NOTRUN -> [SKIP][229] ([i915#15948])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-12/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][230] ([i915#15739])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-2/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-tglu-1:       NOTRUN -> [SKIP][231] ([i915#8430])
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-1/igt@kms_pm_lpsp@screens-disabled.html
    - shard-dg1:          NOTRUN -> [SKIP][232] ([i915#8430])
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-18/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-dg1:          NOTRUN -> [SKIP][233] ([i915#15073])
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-12/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-tglu-1:       NOTRUN -> [SKIP][234] ([i915#15073])
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-1/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
    - shard-dg1:          [PASS][235] -> [SKIP][236] ([i915#15073]) +2 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-dg1-16/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-14/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-dg2:          [PASS][237] -> [SKIP][238] ([i915#15073]) +1 other test skip
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-dg2-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg2-4/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-glk11:        NOTRUN -> [SKIP][239] +29 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-glk11/igt@kms_prime@basic-modeset-hybrid.html
    - shard-tglu:         NOTRUN -> [SKIP][240] ([i915#6524])
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-3/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:
    - shard-glk11:        NOTRUN -> [SKIP][241] ([i915#11520])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-glk11/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][242] ([i915#11520]) +8 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-glk4/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:
    - shard-rkl:          NOTRUN -> [SKIP][243] ([i915#11520]) +5 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-8/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html
    - shard-tglu:         NOTRUN -> [SKIP][244] ([i915#11520]) +4 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-4/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-glk10:        NOTRUN -> [SKIP][245] ([i915#11520]) +1 other test skip
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-glk10/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:
    - shard-tglu-1:       NOTRUN -> [SKIP][246] ([i915#11520]) +3 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-1/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html
    - shard-dg1:          NOTRUN -> [SKIP][247] ([i915#11520]) +5 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-18/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-snb:          NOTRUN -> [SKIP][248] ([i915#11520]) +10 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-snb1/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-rkl:          NOTRUN -> [SKIP][249] ([i915#9683])
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-7/igt@kms_psr2_su@page_flip-p010.html
    - shard-tglu-1:       NOTRUN -> [SKIP][250] ([i915#9683])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-1/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr-cursor-plane-onoff:
    - shard-tglu:         NOTRUN -> [SKIP][251] ([i915#9732]) +13 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-4/igt@kms_psr@fbc-psr-cursor-plane-onoff.html

  * igt@kms_psr@psr-sprite-plane-move:
    - shard-rkl:          NOTRUN -> [SKIP][252] ([i915#1072] / [i915#9732]) +19 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-7/igt@kms_psr@psr-sprite-plane-move.html
    - shard-tglu-1:       NOTRUN -> [SKIP][253] ([i915#9732]) +11 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-1/igt@kms_psr@psr-sprite-plane-move.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - shard-dg1:          NOTRUN -> [SKIP][254] ([i915#1072] / [i915#9732]) +15 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-19/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-rkl:          NOTRUN -> [SKIP][255] ([i915#15949])
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@multiplane-rotation:
    - shard-glk:          NOTRUN -> [INCOMPLETE][256] ([i915#15492] / [i915#16184]) +1 other test incomplete
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-glk9/igt@kms_rotation_crc@multiplane-rotation.html

  * igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:
    - shard-glk:          NOTRUN -> [INCOMPLETE][257] ([i915#15500] / [i915#16184])
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-glk4/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-rkl:          NOTRUN -> [SKIP][258] ([i915#5289])
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-rkl:          NOTRUN -> [SKIP][259] ([i915#3555]) +1 other test skip
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-7/igt@kms_scaling_modes@scaling-mode-center.html
    - shard-tglu-1:       NOTRUN -> [SKIP][260] ([i915#3555])
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-1/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - shard-tglu:         NOTRUN -> [SKIP][261] ([i915#3555]) +2 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-3/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-tglu-1:       NOTRUN -> [ABORT][262] ([i915#13179]) +1 other test abort
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-1/igt@kms_selftest@drm_framebuffer.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-glk:          NOTRUN -> [FAIL][263] ([i915#10959])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-glk5/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-rkl:          NOTRUN -> [SKIP][264] ([i915#9906])
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-7/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@lobf:
    - shard-dg1:          NOTRUN -> [SKIP][265] ([i915#11920])
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-19/igt@kms_vrr@lobf.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-tglu-1:       NOTRUN -> [SKIP][266] ([i915#9906]) +1 other test skip
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-1/igt@kms_vrr@seamless-rr-switch-vrr.html
    - shard-dg1:          NOTRUN -> [SKIP][267] ([i915#9906])
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-18/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@perf@per-context-mode-unprivileged:
    - shard-dg1:          NOTRUN -> [SKIP][268] ([i915#2433])
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-12/igt@perf@per-context-mode-unprivileged.html

  * igt@perf_pmu@busy-accuracy-98:
    - shard-snb:          NOTRUN -> [SKIP][269] +583 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-snb4/igt@perf_pmu@busy-accuracy-98.html

  * igt@perf_pmu@busy-double-start@ccs0:
    - shard-mtlp:         [PASS][270] -> [FAIL][271] ([i915#4349])
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-mtlp-2/igt@perf_pmu@busy-double-start@ccs0.html
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-mtlp-8/igt@perf_pmu@busy-double-start@ccs0.html

  * igt@perf_pmu@rc6@other-idle-gt0:
    - shard-dg1:          NOTRUN -> [SKIP][272] ([i915#8516])
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-12/igt@perf_pmu@rc6@other-idle-gt0.html

  * igt@prime_vgem@fence-read-hang:
    - shard-rkl:          NOTRUN -> [SKIP][273] ([i915#3708])
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-5/igt@prime_vgem@fence-read-hang.html

  * igt@prime_vgem@fence-write-hang:
    - shard-dg1:          NOTRUN -> [SKIP][274] ([i915#3708])
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-12/igt@prime_vgem@fence-write-hang.html

  
#### Possible fixes ####

  * igt@gem_eio@in-flight-suspend:
    - shard-rkl:          [ABORT][275] ([i915#15131]) -> [PASS][276]
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-1/igt@gem_eio@in-flight-suspend.html
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-7/igt@gem_eio@in-flight-suspend.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [ABORT][277] ([i915#5566]) -> [PASS][278]
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-glk5/igt@gen9_exec_parse@allowed-all.html
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-glk4/igt@gen9_exec_parse@allowed-all.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-rkl:          [SKIP][279] ([i915#15989]) -> [PASS][280] +15 other tests pass
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-3/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-mmap-gtt.html
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-1/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-mmap-gtt:
    - shard-glk:          [SKIP][281] -> [PASS][282] +23 other tests pass
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-glk3/igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-mmap-gtt.html
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-glk8/igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-mmap-gtt.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:
    - shard-glk:          [INCOMPLETE][283] ([i915#12756] / [i915#13356] / [i915#13409] / [i915#13476] / [i915#16789]) -> [PASS][284]
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-glk8/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-glk3/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-glk:          [DMESG-FAIL][285] ([i915#118]) -> [PASS][286]
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-glk9/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-glk8/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_pm_rpm@i2c:
    - shard-dg1:          [DMESG-WARN][287] ([i915#4423]) -> [PASS][288]
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-dg1-17/igt@kms_pm_rpm@i2c.html
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-15/igt@kms_pm_rpm@i2c.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-dg2:          [SKIP][289] ([i915#15073]) -> [PASS][290] +2 other tests pass
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-dg2-8/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg2-4/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-rkl:          [SKIP][291] ([i915#15073]) -> [PASS][292] +1 other test pass
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-7/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@system-suspend-idle:
    - shard-rkl:          [INCOMPLETE][293] ([i915#14419]) -> [PASS][294]
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-3/igt@kms_pm_rpm@system-suspend-idle.html
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-7/igt@kms_pm_rpm@system-suspend-idle.html

  * igt@perf_pmu@frequency:
    - shard-dg2:          [FAIL][295] ([i915#6806]) -> [PASS][296] +1 other test pass
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-dg2-4/igt@perf_pmu@frequency.html
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg2-3/igt@perf_pmu@frequency.html

  * igt@perf_pmu@semaphore-busy@vecs0:
    - shard-mtlp:         [FAIL][297] ([i915#4349]) -> [PASS][298]
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-mtlp-8/igt@perf_pmu@semaphore-busy@vecs0.html
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-mtlp-8/igt@perf_pmu@semaphore-busy@vecs0.html

  
#### Warnings ####

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-rkl:          [SKIP][299] ([i915#3555] / [i915#9323]) -> [SKIP][300] ([i915#14544] / [i915#3555] / [i915#9323])
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-7/igt@gem_ccs@ctrl-surf-copy.html
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-6/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-rkl:          [SKIP][301] ([i915#7697]) -> [SKIP][302] ([i915#14544] / [i915#7697])
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-7/igt@gem_close_race@multigpu-basic-threads.html
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-6/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_exec_reloc@basic-cpu-noreloc:
    - shard-rkl:          [SKIP][303] ([i915#3281]) -> [SKIP][304] ([i915#14544] / [i915#3281]) +2 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-7/igt@gem_exec_reloc@basic-cpu-noreloc.html
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-6/igt@gem_exec_reloc@basic-cpu-noreloc.html

  * igt@gem_exec_reloc@basic-gtt-wc:
    - shard-rkl:          [SKIP][305] ([i915#14544] / [i915#3281]) -> [SKIP][306] ([i915#3281]) +1 other test skip
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-wc.html
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-4/igt@gem_exec_reloc@basic-gtt-wc.html

  * igt@gem_lmem_swapping@heavy-verify-random-ccs:
    - shard-rkl:          [SKIP][307] ([i915#4613]) -> [SKIP][308] ([i915#14544] / [i915#4613]) +1 other test skip
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-7/igt@gem_lmem_swapping@heavy-verify-random-ccs.html
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-6/igt@gem_lmem_swapping@heavy-verify-random-ccs.html

  * igt@gem_lmem_swapping@verify-random:
    - shard-rkl:          [SKIP][309] ([i915#14544] / [i915#4613]) -> [SKIP][310] ([i915#4613])
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-6/igt@gem_lmem_swapping@verify-random.html
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-7/igt@gem_lmem_swapping@verify-random.html

  * igt@gem_pread@bench:
    - shard-rkl:          [SKIP][311] ([i915#14544] / [i915#3282]) -> [SKIP][312] ([i915#3282])
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-6/igt@gem_pread@bench.html
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-4/igt@gem_pread@bench.html

  * igt@gem_pread@snoop:
    - shard-rkl:          [SKIP][313] ([i915#3282]) -> [SKIP][314] ([i915#14544] / [i915#3282]) +1 other test skip
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-7/igt@gem_pread@snoop.html
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-6/igt@gem_pread@snoop.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-rkl:          [SKIP][315] ([i915#3297]) -> [SKIP][316] ([i915#14544] / [i915#3297]) +1 other test skip
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-7/igt@gem_userptr_blits@dmabuf-unsync.html
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-6/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gen9_exec_parse@basic-rejected-ctx-param:
    - shard-rkl:          [SKIP][317] ([i915#2527]) -> [SKIP][318] ([i915#14544] / [i915#2527])
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-7/igt@gen9_exec_parse@basic-rejected-ctx-param.html
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-6/igt@gen9_exec_parse@basic-rejected-ctx-param.html

  * igt@i915_pm_freq_api@freq-reset:
    - shard-rkl:          [SKIP][319] ([i915#8399]) -> [SKIP][320] ([i915#14544] / [i915#8399])
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-7/igt@i915_pm_freq_api@freq-reset.html
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-6/igt@i915_pm_freq_api@freq-reset.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-rkl:          [SKIP][321] ([i915#14498]) -> [SKIP][322] ([i915#14498] / [i915#14544])
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-7/igt@i915_pm_rc6_residency@rc6-idle.html
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-6/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-180:
    - shard-rkl:          [SKIP][323] ([i915#14544] / [i915#5286]) -> [SKIP][324] ([i915#5286]) +1 other test skip
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-6/igt@kms_big_fb@4-tiled-32bpp-rotate-180.html
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-7/igt@kms_big_fb@4-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
    - shard-rkl:          [SKIP][325] ([i915#5286]) -> [SKIP][326] ([i915#14544] / [i915#5286]) +1 other test skip
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-7/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-6/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs:
    - shard-rkl:          [SKIP][327] ([i915#14098] / [i915#6095]) -> [SKIP][328] ([i915#14098] / [i915#14544] / [i915#6095]) +5 other tests skip
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-4/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs.html
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          [SKIP][329] ([i915#6095]) -> [SKIP][330] ([i915#14544] / [i915#6095]) +5 other tests skip
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-4/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:
    - shard-rkl:          [SKIP][331] ([i915#14098] / [i915#14544] / [i915#6095]) -> [SKIP][332] ([i915#14098] / [i915#6095]) +1 other test skip
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          [SKIP][333] ([i915#14544] / [i915#6095]) -> [SKIP][334] ([i915#6095]) +1 other test skip
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1:
    - shard-glk:          [INCOMPLETE][335] ([i915#13356] / [i915#15582]) -> [INCOMPLETE][336] ([i915#13356] / [i915#14694] / [i915#15582]) +1 other test incomplete
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-glk6/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1.html
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-glk1/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_chamelium_audio@dp-audio-after-suspend:
    - shard-rkl:          [SKIP][337] ([i915#11151]) -> [SKIP][338] ([i915#11151] / [i915#14544])
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-7/igt@kms_chamelium_audio@dp-audio-after-suspend.html
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-6/igt@kms_chamelium_audio@dp-audio-after-suspend.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:
    - shard-rkl:          [SKIP][339] ([i915#11151] / [i915#14544] / [i915#7828]) -> [SKIP][340] ([i915#11151] / [i915#7828]) +2 other tests skip
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-6/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-4/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - shard-rkl:          [SKIP][341] ([i915#11151] / [i915#7828]) -> [SKIP][342] ([i915#11151] / [i915#14544] / [i915#7828]) +3 other tests skip
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-7/igt@kms_chamelium_hpd@vga-hpd-fast.html
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-6/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_content_protection@srm:
    - shard-rkl:          [SKIP][343] ([i915#15865]) -> [SKIP][344] ([i915#14544] / [i915#15865])
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-7/igt@kms_content_protection@srm.html
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-6/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-rkl:          [SKIP][345] ([i915#13049]) -> [SKIP][346] ([i915#13049] / [i915#14544])
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-7/igt@kms_cursor_crc@cursor-onscreen-512x512.html
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-rkl:          [SKIP][347] ([i915#3555]) -> [SKIP][348] ([i915#14544] / [i915#3555])
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-7/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner:
    - shard-rkl:          [SKIP][349] ([i915#16361]) -> [SKIP][350] ([i915#14544] / [i915#16361]) +1 other test skip
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-7/igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner.html
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-6/igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-rkl:          [SKIP][351] ([i915#16680]) -> [SKIP][352] ([i915#14544] / [i915#16680])
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-7/igt@kms_fbcon_fbt@psr-suspend.html
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-6/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
    - shard-rkl:          [SKIP][353] ([i915#9934]) -> [SKIP][354] ([i915#14544] / [i915#9934]) +2 other tests skip
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-7/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-6/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-rkl:          [SKIP][355] ([i915#1825]) -> [SKIP][356] ([i915#14544] / [i915#1825]) +4 other tests skip
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-gtt.html
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-rkl:          [SKIP][357] ([i915#14544] / [i915#1825]) -> [SKIP][358] ([i915#1825])
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-draw-pwrite:
    - shard-rkl:          [SKIP][359] -> [SKIP][360] ([i915#14544]) +29 other tests skip
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-7/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-draw-pwrite.html
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-shrfb-pgflip-blt:
    - shard-rkl:          [SKIP][361] ([i915#14544]) -> [SKIP][362] +12 other tests skip
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-shrfb-pgflip-blt.html
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-7/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-indfb-fliptrack-mmap-gtt:
    - shard-rkl:          [SKIP][363] ([i915#15102]) -> [SKIP][364] ([i915#14544] / [i915#15102]) +14 other tests skip
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-indfb-fliptrack-mmap-gtt.html
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-indfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt:
    - shard-dg1:          [SKIP][365] ([i915#15990] / [i915#8708]) -> [SKIP][366] ([i915#15990] / [i915#4423] / [i915#8708])
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-dg1-15/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt.html
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-rkl:          [SKIP][367] ([i915#5439]) -> [SKIP][368] ([i915#14544] / [i915#5439])
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-blt:
    - shard-rkl:          [SKIP][369] ([i915#14544] / [i915#15102]) -> [SKIP][370] ([i915#15102]) +3 other tests skip
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-blt.html
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move:
    - shard-dg1:          [SKIP][371] -> [SKIP][372] ([i915#4423]) +1 other test skip
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-dg1-15/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move.html
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-tglu:         [SKIP][373] ([i915#1187] / [i915#12713]) -> [SKIP][374] ([i915#12713])
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-tglu-2/igt@kms_hdr@brightness-with-hdr.html
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-9/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-rkl:          [INCOMPLETE][375] ([i915#15436]) -> [SKIP][376] ([i915#16644] / [i915#3555] / [i915#8228])
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-6/igt@kms_hdr@static-toggle-suspend.html
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-8/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-rkl:          [SKIP][377] ([i915#15815]) -> [SKIP][378] ([i915#14544] / [i915#15815])
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_pipe_stress@stress-xrgb8888-xtiled:
    - shard-glk:          [DMESG-FAIL][379] ([i915#118]) -> [DMESG-WARN][380] ([i915#118])
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-glk3/igt@kms_pipe_stress@stress-xrgb8888-xtiled.html
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-glk8/igt@kms_pipe_stress@stress-xrgb8888-xtiled.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping:
    - shard-rkl:          [SKIP][381] ([i915#15709]) -> [SKIP][382] ([i915#14544] / [i915#15709]) +2 other tests skip
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-7/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping.html
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-rkl:          [SKIP][383] ([i915#14544] / [i915#3555]) -> [SKIP][384] ([i915#3555])
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-6/igt@kms_plane_lowres@tiling-yf.html
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-7/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-rkl:          [SKIP][385] ([i915#13958]) -> [SKIP][386] ([i915#13958] / [i915#14544])
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-7/igt@kms_plane_multiple@2x-tiling-x.html
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-6/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-rkl:          [SKIP][387] ([i915#12343] / [i915#14544]) -> [SKIP][388] ([i915#12343])
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-6/igt@kms_pm_backlight@brightness-with-dpms.html
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-7/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-rkl:          [SKIP][389] ([i915#12343] / [i915#5354]) -> [SKIP][390] ([i915#12343] / [i915#14544] / [i915#5354])
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-7/igt@kms_pm_backlight@fade-with-dpms.html
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-6/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-dg1:          [SKIP][391] ([i915#9340]) -> [SKIP][392] ([i915#3828])
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-dg1-12/igt@kms_pm_lpsp@kms-lpsp.html
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-14/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_prime@d3hot:
    - shard-rkl:          [SKIP][393] ([i915#6524]) -> [SKIP][394] ([i915#14544] / [i915#6524])
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-7/igt@kms_prime@d3hot.html
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-6/igt@kms_prime@d3hot.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
    - shard-dg1:          [SKIP][395] ([i915#11520]) -> [SKIP][396] ([i915#11520] / [i915#4423])
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-dg1-15/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-17/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:
    - shard-rkl:          [SKIP][397] ([i915#11520]) -> [SKIP][398] ([i915#11520] / [i915#14544]) +2 other tests skip
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-7/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr@fbc-pr-sprite-plane-onoff:
    - shard-rkl:          [SKIP][399] ([i915#1072] / [i915#9732]) -> [SKIP][400] ([i915#1072] / [i915#14544] / [i915#9732]) +7 other tests skip
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-7/igt@kms_psr@fbc-pr-sprite-plane-onoff.html
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-6/igt@kms_psr@fbc-pr-sprite-plane-onoff.html

  
  [i915#10056]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10056
  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
  [i915#10647]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#10826]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10826
  [i915#10959]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10959
  [i915#1099]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099
  [i915#11078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078
  [i915#11151]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/118
  [i915#1187]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187
  [i915#11920]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920
  [i915#12169]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12169
  [i915#12193]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12193
  [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
  [i915#12343]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343
  [i915#12454]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12454
  [i915#1257]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257
  [i915#12712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12712
  [i915#12713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713
  [i915#12745]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745
  [i915#12756]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12756
  [i915#12761]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12761
  [i915#12805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805
  [i915#13027]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13027
  [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
  [i915#13179]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179
  [i915#13356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356
  [i915#13409]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13409
  [i915#13476]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13476
  [i915#13566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566
  [i915#13691]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13691
  [i915#13707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707
  [i915#13717]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13717
  [i915#13748]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748
  [i915#13781]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13781
  [i915#13809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13809
  [i915#13820]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13820
  [i915#13958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958
  [i915#14098]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098
  [i915#14419]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14419
  [i915#14498]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14498
  [i915#14544]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544
  [i915#14586]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14586
  [i915#14600]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14600
  [i915#14694]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14694
  [i915#14888]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14888
  [i915#15073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073
  [i915#15102]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102
  [i915#15104]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104
  [i915#15131]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15131
  [i915#15329]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329
  [i915#15330]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330
  [i915#15342]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15342
  [i915#15436]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15436
  [i915#15458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458
  [i915#15459]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459
  [i915#15460]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460
  [i915#15492]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15492
  [i915#15500]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15500
  [i915#15542]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15542
  [i915#15582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582
  [i915#15643]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643
  [i915#15678]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15678
  [i915#15709]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709
  [i915#15733]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15733
  [i915#15739]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15739
  [i915#15815]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15815
  [i915#15816]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15816
  [i915#15865]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865
  [i915#15948]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948
  [i915#15949]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15949
  [i915#15989]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989
  [i915#15990]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990
  [i915#15999]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15999
  [i915#16081]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081
  [i915#16184]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16184
  [i915#16193]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16193
  [i915#16276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16276
  [i915#16348]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16348
  [i915#16361]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361
  [i915#16386]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16386
  [i915#16471]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471
  [i915#16593]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16593
  [i915#16599]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16599
  [i915#16600]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16600
  [i915#16644]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644
  [i915#16680]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16680
  [i915#16789]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16789
  [i915#16867]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16867
  [i915#16870]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16870
  [i915#16904]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16904
  [i915#16914]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16914
  [i915#16990]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16990
  [i915#17018]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17018
  [i915#17102]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17102
  [i915#17104]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17104
  [i915#17116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17116
  [i915#17122]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17122
  [i915#17183]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17183
  [i915#17213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17213
  [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
  [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
  [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
  [i915#2433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2433
  [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
  [i915#2658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658
  [i915#280]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280
  [i915#2856]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
  [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
  [i915#3297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299
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
  [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
  [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
  [i915#4349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349
  [i915#4423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423
  [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
  [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
  [i915#4565]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4565
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#4812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812
  [i915#4817]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817
  [i915#4839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839
  [i915#4852]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852
  [i915#4958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4958
  [i915#5138]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138
  [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#5439]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439
  [i915#5566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5566
  [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
  [i915#6113]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113
  [i915#6245]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245
  [i915#6301]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301
  [i915#6335]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335
  [i915#6524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
  [i915#6590]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6590
  [i915#6806]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6806
  [i915#6953]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953
  [i915#7697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697
  [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
  [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
  [i915#8381]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381
  [i915#8399]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399
  [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
  [i915#8430]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430
  [i915#8516]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516
  [i915#8555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555
  [i915#8562]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562
  [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
  [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
  [i915#9340]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340
  [i915#9683]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683
  [i915#9723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812
  [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
  [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934
  [i915#9979]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9979


Build changes
-------------

  * Linux: CI_DRM_19245 -> Patchwork_174203v3

  CI-20190529: 20190529
  CI_DRM_19245: 71ee29e1a20f63cd880cf336e9dff825d87f025d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_9118: 26513be3e0f711ed835ec50d5cdcb723ef224105 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  Patchwork_174203v3: 71ee29e1a20f63cd880cf336e9dff825d87f025d @ git://anongit.freedesktop.org/gfx-ci/linux
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/index.html

--===============6652117983243133229==
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
<tr><td><b>Series:</b></td><td>drm/{i915,xe}: use a shared gtt_view_types.h header (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/174203/">https://patchwork.freedesktop.org/series/174203/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_19245_full -&gt; Patchwork_174203v3_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with Patchwork_174203v3_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in Patchwork_174203v3_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in Patchwork_174203v3_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@system-suspend-devices:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-dg2-3/igt@i915_pm_rpm@system-suspend-devices.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg2-1/igt@i915_pm_rpm@system-suspend-devices.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-tglu-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-b-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-b-hdmi-a-1.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_19245_full and Patchwork_174203v3_full:</p>
<h3>New IGT tests (6)</h3>
<ul>
<li>
<p>igt@i915_pm_rpm@fbchdr-1p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@hdr-2p-scndscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@legacy-engines-queued:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@viewport:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_174203v3_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-reloc-keep-cache:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-12/igt@api_intel_bb@blit-reloc-keep-cache.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@device_reset@cold-reset-bound:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-12/igt@device_reset@cold-reset-bound.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078">i915#11078</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-copy-compressed:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-8/igt@gem_ccs@block-copy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-4/igt@gem_ccs@block-copy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-dg2-8/igt@gem_ccs@suspend-resume.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg2-3/igt@gem_ccs@suspend-resume.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16348">i915#16348</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-big:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-5/igt@gem_create@create-ext-cpu-access-big.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335">i915#6335</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-set-pat:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-1/igt@gem_create@create-ext-set-pat.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562">i915#8562</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-18/igt@gem_create@create-ext-set-pat.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562">i915#8562</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-hang:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-12/igt@gem_ctx_persistence@heartbeat-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555">i915#8555</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-queued:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-snb4/igt@gem_ctx_persistence@legacy-engines-queued.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099">i915#1099</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-args:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-19/igt@gem_ctx_sseu@invalid-args.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@hog:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-18/igt@gem_exec_balancer@hog.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-bb-first:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-7/igt@gem_exec_balancer@parallel-bb-first.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_big@single:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-1/igt@gem_exec_big@single.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15816">i915#15816</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture@vecs0-lmem0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-19/igt@gem_exec_capture@capture@vecs0-lmem0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16904">i915#16904</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-ro-default:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-18/igt@gem_exec_flush@basic-wb-ro-default.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852">i915#4852</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-wc-noreloc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-18/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-7/igt@gem_exec_reloc@basic-write-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-8/igt@gem_exec_suspend@basic-s3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-1/igt@gem_exec_suspend@basic-s3.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15131">i915#15131</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15542">i915#15542</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-2/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-glk4/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-7/igt@gem_lmem_swapping@parallel-random-verify.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify-ccs:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-1/igt@gem_lmem_swapping@parallel-random-verify-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-18/igt@gem_lmem_swapping@parallel-random-verify-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12193">i915#12193</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify-ccs@lmem0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-18/igt@gem_lmem_swapping@parallel-random-verify-ccs@lmem0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4565">i915#4565</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random-engines:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-glk9/igt@gem_lmem_swapping@random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-7/igt@gem_lmem_swapping@verify-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-big-copy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-19/igt@gem_mmap_gtt@cpuset-big-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@bad-offset:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-12/igt@gem_mmap_wc@bad-offset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads-uncached:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-2/igt@gem_partial_pwrite_pread@reads-uncached.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-snoop:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-18/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-7/igt@gem_pread@exhaustion.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658">i915#2658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@hw-rejects-pxp-buffer:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-2/igt@gem_pxp@hw-rejects-pxp-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13717">i915#13717</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-19/igt@gem_pxp@reject-modify-context-protection-off-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_pwrite:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-18/igt@gem_set_tiling_vs_pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@noreloc-s3:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-glk5/igt@gem_softpin@noreloc-s3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13809">i915#13809</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16193">i915#16193</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-sync:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-3/igt@gem_userptr_blits@coherency-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@forbidden-operations:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-8/igt@gem_userptr_blits@forbidden-operations.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@relocations:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-18/igt@gem_userptr_blits@relocations.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@sd-probe:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-12/igt@gem_userptr_blits@sd-probe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4958">i915#4958</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-after-close:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-1/igt@gem_userptr_blits@unsync-unmap-after-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-fd:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-dg2-1/igt@gem_workarounds@suspend-resume-fd.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg2-7/igt@gem_workarounds@suspend-resume-fd.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) +2 other tests incomplete</li>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-glk8/igt@gem_workarounds@suspend-resume-fd.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14586">i915#14586</a>)</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@load-register-reg:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-3/igt@gen7_exec_parse@load-register-reg.html">SKIP</a> +73 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-18/igt@gen9_exec_parse@allowed-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-7/igt@gen9_exec_parse@allowed-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-without-end:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-5/igt@gen9_exec_parse@batch-without-end.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-cmd:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-1/igt@gen9_exec_parse@bb-start-cmd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gpu_buddy@gpu_buddy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-2/igt@gpu_buddy@gpu_buddy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15678">i915#15678</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@intel_connector_register:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-snb4/igt@i915_module_load@fault-injection@intel_connector_register.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15342">i915#15342</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-reset-multiple:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-7/igt@i915_pm_freq_api@freq-reset-multiple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399">i915#8399</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-1/igt@i915_pm_freq_api@freq-reset-multiple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399">i915#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-suspend@gt0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-dg2-4/igt@i915_pm_freq_api@freq-suspend@gt0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg2-1/igt@i915_pm_freq_api@freq-suspend@gt0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13820">i915#13820</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_mult@media-freq@gt0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-3/igt@i915_pm_freq_mult@media-freq@gt0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6590">i915#6590</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_query@hwconfig_table:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-5/igt@i915_query@hwconfig_table.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245">i915#6245</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@perf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-3/igt@i915_selftest@perf.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17018">i915#17018</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@forcewake:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-4/igt@i915_suspend@forcewake.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-6/igt@i915_suspend@forcewake.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-x-tiled-legacy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-12/igt@kms_addfb_basic@basic-x-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-1/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12454">i915#12454</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12712">i915#12712</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-glk1/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-glk2/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14888">i915#14888</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-glk9/igt@kms_async_flips@async-flip-suspend-resume.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12761">i915#12761</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-glk4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-19/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15733">i915#15733</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138">i915#5138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-2/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-19/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-7/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-12/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-12/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg2-4/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +83 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-7/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +36 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-14/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +195 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-7/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +49 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-19/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805">i915#12805</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-8/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +49 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg2-1/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-2/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-glk4/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-1.html">SKIP</a> +414 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg2-4/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434">i915#10434</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-12/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742">i915#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg2-4/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13781">i915#13781</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-8/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742">i915#3742</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-4/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742">i915#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-after-suspend:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-19/igt@kms_chamelium_audio@hdmi-audio-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-ctm3x4:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-3/igt@kms_chamelium_color_pipeline@plane-ctm3x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-1/igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-18/igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471">i915#16471</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-fast:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-19/igt@kms_chamelium_frames@dp-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-7/igt@kms_chamelium_frames@hdmi-aspect-ratio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-fast:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-1/igt@kms_chamelium_frames@hdmi-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-frame-dump:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-2/igt@kms_chamelium_frames@hdmi-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-3/igt@kms_color@deep-color.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9979">i915#9979</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-ctm3x4-lut1d@pipe-a-plane-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-2/igt@kms_color_pipeline@plane-ctm3x4-lut1d@pipe-a-plane-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17116">i915#17116</a>) +35 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d@pipe-c-plane-6:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-7/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d@pipe-c-plane-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17116">i915#17116</a>) +28 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim@pipe-c-plane-6:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-1/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim@pipe-c-plane-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17116">i915#17116</a>) +28 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-d-plane-3:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-1/igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-d-plane-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16990">i915#16990</a>) +15 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-18/igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-d-plane-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16990">i915#16990</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-c-plane-4:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-8/igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-c-plane-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16990">i915#16990</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-d-plane-5:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-4/igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-d-plane-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16990">i915#16990</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-12/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-19/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1-suspend-resume:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-2/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-7/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) +1 other test skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-1/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x32:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-12/igt@kms_cursor_crc@cursor-offscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-7/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-1/igt@kms_cursor_crc@cursor-onscreen-256x85.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-5/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-8/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +4 other tests fail</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-4/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-1/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-19/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-mtlp-7/igt@kms_cursor_crc@cursor-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-mtlp-4/igt@kms_cursor_crc@cursor-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17213">i915#17213</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-7/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> +88 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-dg1-12/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-14/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15999">i915#15999</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-1/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723">i915#9723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-1/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13691">i915#13691</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-18/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13691">i915#13691</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-5/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-5/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev@basic:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-19/igt@kms_dp_aux_dev@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257">i915#1257</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-12/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748">i915#13748</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-7/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748">i915#13748</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-2/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16867">i915#16867</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-8/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707">i915#13707</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-4/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707">i915#13707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-7/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16870">i915#16870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-3/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-bigjoiner:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-1/igt@kms_dsc@dsc-fractional-bpp-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-18/igt@kms_dsc@dsc-fractional-bpp-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-2/igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-5/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081">i915#16081</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-7/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16599">i915#16599</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-1/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16599">i915#16599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@hdr:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-6/igt@kms_feature_discovery@hdr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-7/igt@kms_feature_discovery@hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16600">i915#16600</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-7/igt@kms_flip@2x-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-glk9/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-glk5/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14600">i915#14600</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-glk5/igt@kms_flip@2x-flip-vs-expired-vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-glk6/igt@kms_flip@2x-flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13027">i915#13027</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-12/igt@kms_flip@2x-flip-vs-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381">i915#8381</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-1/igt@kms_flip@2x-plain-flip-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +4 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-18/igt@kms_flip@2x-plain-flip-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible@bc-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-glk9/igt@kms_flip@2x-plain-flip-ts-check-interruptible@bc-hdmi-a1-hdmi-a2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10826">i915#10826</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-glk4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13027">i915#13027</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-glk4/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17183">i915#17183</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-7/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-6/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16276">i915#16276</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113">i915#6113</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-glk4/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17183">i915#17183</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-12/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-glk11/igt@kms_frontbuffer_tracking@fbc-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10056">i915#10056</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16593">i915#16593</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-7/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-12/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> +57 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-farfromfence-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-19/igt@kms_frontbuffer_tracking@fbchdr-farfromfence-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-tiling-4:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-3/igt@kms_frontbuffer_tracking@fbchdr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439">i915#5439</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-tiling-linear:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-5/igt@kms_frontbuffer_tracking@fbchdr-tiling-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-glk10/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> +74 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html">SKIP</a> +74 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-suspend:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsrhdr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-1/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-shrfb-draw-pwrite:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-glk8/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-shrfb-draw-pwrite.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-glk3/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-shrfb-draw-pwrite.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-modesetfrombusy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-12/igt@kms_frontbuffer_tracking@hdr-modesetfrombusy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-rgb565-draw-pwrite:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-rgb565-draw-pwrite.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-7/igt@kms_frontbuffer_tracking@hdr-rgb565-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-1/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-12/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-19/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-2/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +42 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-farfromfence-mmap-gtt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-4/igt@kms_frontbuffer_tracking@psrhdr-farfromfence-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@audio-bw-hblank160:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-snb4/igt@kms_hdmi_audio_bw@audio-bw-hblank160.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17104">i915#17104</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-glk4/igt@kms_hdmi_audio_bw@audio-bw-hblank160.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17102">i915#17102</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-snb1/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17122">i915#17122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-19/igt@kms_hdr@bpc-switch-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-4/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-12/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460">i915#15460</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-1/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459">i915#15459</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-19/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458">i915#15458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-5/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460">i915#15460</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-3/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458">i915#15458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-7/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301">i915#6301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-glk3/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12756">i915#12756</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13409">i915#13409</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16789">i915#16789</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-yftiled:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-glk8/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/118">i915#118</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-1/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-4/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-7:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-19/igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16386">i915#16386</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-5/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-19/igt@kms_plane@pixel-format-yf-tiled-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-max:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-glk10/igt@kms_plane_alpha_blend@constant-alpha-max.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647">i915#10647</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12169">i915#12169</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-max@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-glk10/igt@kms_plane_alpha_blend@constant-alpha-max@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647">i915#10647</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-12/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-1/igt@kms_plane_scaling@intel-max-src-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-7/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-1/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +4 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-18/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-c:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-3/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-7/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812">i915#9812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-2/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-5/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948">i915#15948</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr-suspend-resume:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-8/igt@kms_pm_dc@dc5-psr-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16914">i915#16914</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-4/igt@kms_pm_dc@dc5-psr-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16914">i915#16914</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-12/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948">i915#15948</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-2/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15739">i915#15739</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@screens-disabled:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-1/igt@kms_pm_lpsp@screens-disabled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430">i915#8430</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-18/igt@kms_pm_lpsp@screens-disabled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430">i915#8430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-12/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-1/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-dg1-16/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-14/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-dg2-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg2-4/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-modeset-hybrid:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-glk11/igt@kms_prime@basic-modeset-hybrid.html">SKIP</a> +29 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-3/igt@kms_prime@basic-modeset-hybrid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-glk11/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-glk4/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-8/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +5 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-4/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-glk10/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-1/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +3 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-18/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-snb1/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-7/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915#9683</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-1/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-plane-onoff:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-4/igt@kms_psr@fbc-psr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-move:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-7/igt@kms_psr@psr-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +19 other tests skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-1/igt@kms_psr@psr-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-19/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15949">i915#15949</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-glk9/igt@kms_rotation_crc@multiplane-rotation.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15492">i915#15492</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16184">i915#16184</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-glk4/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15500">i915#15500</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16184">i915#16184</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-7/igt@kms_scaling_modes@scaling-mode-center.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-1/igt@kms_scaling_modes@scaling-mode-center.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-3/igt@kms_scaling_modes@scaling-mode-full.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_framebuffer:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-1/igt@kms_selftest@drm_framebuffer.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179">i915#13179</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-glk5/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10959">i915#10959</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-7/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-19/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920">i915#11920</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-1/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-18/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@per-context-mode-unprivileged:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-12/igt@perf@per-context-mode-unprivileged.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2433">i915#2433</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-accuracy-98:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-snb4/igt@perf_pmu@busy-accuracy-98.html">SKIP</a> +583 other tests skip</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@ccs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-mtlp-2/igt@perf_pmu@busy-double-start@ccs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-mtlp-8/igt@perf_pmu@busy-double-start@ccs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6@other-idle-gt0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-12/igt@perf_pmu@rc6@other-idle-gt0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516">i915#8516</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-read-hang:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-5/igt@prime_vgem@fence-read-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-write-hang:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-12/igt@prime_vgem@fence-write-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-1/igt@gem_eio@in-flight-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15131">i915#15131</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-7/igt@gem_eio@in-flight-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-glk5/igt@gen9_exec_parse@allowed-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5566">i915#5566</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-glk4/igt@gen9_exec_parse@allowed-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-3/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-1/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-mmap-gtt.html">PASS</a> +15 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-mmap-gtt:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-glk3/igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-mmap-gtt.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-glk8/igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-mmap-gtt.html">PASS</a> +23 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-glk8/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12756">i915#12756</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13409">i915#13409</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13476">i915#13476</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16789">i915#16789</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-glk3/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-glk9/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/118">i915#118</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-glk8/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-dg1-17/igt@kms_pm_rpm@i2c.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-15/igt@kms_pm_rpm@i2c.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-dg2-8/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg2-4/igt@kms_pm_rpm@modeset-lpsp-stress.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-7/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-idle:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-3/igt@kms_pm_rpm@system-suspend-idle.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14419">i915#14419</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-7/igt@kms_pm_rpm@system-suspend-idle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@frequency:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-dg2-4/igt@perf_pmu@frequency.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6806">i915#6806</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg2-3/igt@perf_pmu@frequency.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@semaphore-busy@vecs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-mtlp-8/igt@perf_pmu@semaphore-busy@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-mtlp-8/igt@perf_pmu@semaphore-busy@vecs0.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_ccs@ctrl-surf-copy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-7/igt@gem_ccs@ctrl-surf-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-6/igt@gem_ccs@ctrl-surf-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-threads:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-7/igt@gem_close_race@multigpu-basic-threads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697">i915#7697</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-6/igt@gem_close_race@multigpu-basic-threads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-noreloc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-7/igt@gem_exec_reloc@basic-cpu-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-6/igt@gem_exec_reloc@basic-cpu-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-wc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-4/igt@gem_exec_reloc@basic-gtt-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random-ccs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-7/igt@gem_lmem_swapping@heavy-verify-random-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-6/igt@gem_lmem_swapping@heavy-verify-random-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-6/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-7/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pread@bench:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-6/igt@gem_pread@bench.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-4/igt@gem_pread@bench.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pread@snoop:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-7/igt@gem_pread@snoop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-6/igt@gem_pread@snoop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-unsync:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-7/igt@gem_userptr_blits@dmabuf-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-6/igt@gem_userptr_blits@dmabuf-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected-ctx-param:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-7/igt@gen9_exec_parse@basic-rejected-ctx-param.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-6/igt@gen9_exec_parse@basic-rejected-ctx-param.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-reset:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-7/igt@i915_pm_freq_api@freq-reset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399">i915#8399</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-6/igt@i915_pm_freq_api@freq-reset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399">i915#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-7/igt@i915_pm_rc6_residency@rc6-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14498">i915#14498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-6/igt@i915_pm_rc6_residency@rc6-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14498">i915#14498</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-6/igt@kms_big_fb@4-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-7/igt@kms_big_fb@4-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-7/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-6/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-4/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-4/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-glk6/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582">i915#15582</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-glk1/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14694">i915#14694</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582">i915#15582</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio-after-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-7/igt@kms_chamelium_audio@dp-audio-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-6/igt@kms_chamelium_audio@dp-audio-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-6/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-4/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-fast:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-7/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-6/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-7/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-6/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-7/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-max-size:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-7/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-7/igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-6/igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-7/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16680">i915#16680</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-6/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16680">i915#16680</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-7/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-6/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-7/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-draw-pwrite.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-7/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-indfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-indfb-fliptrack-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-indfb-fliptrack-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-dg1-15/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439">i915#5439</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-dg1-15/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-tglu-2/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187">i915#1187</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#12713</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-tglu-9/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#12713</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-6/igt@kms_hdr@static-toggle-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15436">i915#15436</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-8/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644">i915#16644</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15815">i915#15815</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15815">i915#15815</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-xtiled:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-glk3/igt@kms_pipe_stress@stress-xrgb8888-xtiled.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/118">i915#118</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-glk8/igt@kms_pipe_stress@stress-xrgb8888-xtiled.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/118">i915#118</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-7/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-6/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-7/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-7/igt@kms_plane_multiple@2x-tiling-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-6/igt@kms_plane_multiple@2x-tiling-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-6/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-7/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-7/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-6/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-dg1-12/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340">i915#9340</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-14/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@d3hot:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-7/igt@kms_prime@d3hot.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-6/igt@kms_prime@d3hot.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-dg1-15/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-dg1-17/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-7/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-plane-onoff:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19245/shard-rkl-7/igt@kms_psr@fbc-pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_174203v3/shard-rkl-6/igt@kms_psr@fbc-pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +7 other tests skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_19245 -&gt; Patchwork_174203v3</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19245: 71ee29e1a20f63cd880cf336e9dff825d87f025d @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_9118: 26513be3e0f711ed835ec50d5cdcb723ef224105 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  Patchwork_174203v3: 71ee29e1a20f63cd880cf336e9dff825d87f025d @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============6652117983243133229==--
